USE [ULYSES_SERCOTEL_FORMACION]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSTALACION_HISTORICO_OCUPACION]    Script Date: 03/04/2018 22:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_INSTALACION_HISTORICO_OCUPACION]


	-- Add the parameters for the stored procedure here
        @CODIGOHOT VARCHAR (5),
        @DESDE	DATETIME,
        @HASTA	DATETIME,
        @DIAS	INT
AS
BEGIN
	  SET NOCOUNT ON;

DECLARE @ERROR VARCHAR (500)


BEGIN TRY 
DECLARE @BULK_MAESTRO NVARCHAR(MAX), 
        @pathmaestro NVARCHAR(2000),
        @BULK_DETALLE NVARCHAR(MAX), 
        @pathdetalle NVARCHAR(2000);
SET     @pathmaestro = 'D:TRASPASO_HISTORICOS\'+@CODIGOHOT+'_fof_ocupacion_maestro.sql'
SET     @pathdetalle = 'D:TRASPASO_HISTORICOS\'+@CODIGOHOT+'_fof_ocupacion_detalle.sql';


IF  NOT EXISTS (SELECT * FROM sys.tables
WHERE name = N'TMP_FOF_OCUPACION_MAESTRO' AND type = 'U')
BEGIN
CREATE TABLE [dbo].[TMP_FOF_OCUPACION_MAESTRO] (
	[ID_OCU] [int] NULL,
	[FK_CODIGOHOT] [varchar](3) NULL,
	[FK_TIPOHAB] [varchar](10) NULL,
	[FECHA] [datetime] NULL,
	[AFECHA] [datetime] NULL,
	[TENTATIVAS] [int] NULL,
	[OCUPADAS] [int] NULL,
	[LLEGADAS] [int] NULL,
	[SALIDAS] [int] NULL,
	[BLOQUEADAS] [int] NULL,
	[MAXIMA_CAPACIDAD] [int] NULL,
	[OUTORDER] [int] NULL,
	[ADULTOS] [int] NULL,
	[INDIVIDUALES] [int] NULL,
	[GRUPO] [int] NULL,
	[NOSHOW] [int] NULL
     ) ON [PRIMARY]
END
 ELSE BEGIN
     DELETE FROM  [TMP_FOF_OCUPACION_MAESTRO] WHERE [FK_CODIGOHOT] = @CODIGOHOT
END


IF  NOT EXISTS (SELECT * FROM sys.tables
   WHERE name = N'TMP_FOF_OCUPACION_DETALLE' AND type = 'U') 
BEGIN
   CREATE TABLE [dbo].[TMP_FOF_OCUPACION_DETALLE](
	[ID_DETALLE] [int] NULL,
	[FK_ID_OCU] [int] NULL,
	[FK_CODIGOHOT] [varchar](3) NULL,
	[TIPO_ESTADISTICA] [varchar](10) NULL,
	[OCUPADAS] [int] NULL,
	[LLEGADAS] [int] NULL,
	[INGRESO_BRUTO] [numeric](19, 3) NULL
     ) ON [PRIMARY]
END
 ELSE BEGIN
    DELETE FROM  [TMP_FOF_OCUPACION_DETALLE] WHERE [FK_CODIGOHOT] = @CODIGOHOT
END






/*BORRAMOS HISTÓRICOS PARA EVITAR DUPLICADOS */

 BEGIN TRY 
 DELETE FROM FOF_OCUPACION_DETALLE WHERE FK_ID_OCUP IN (SELECT ID_OCU FROM FOF_OCUPACION WHERE FK_CODIGOHOT = @CODIGOHOT AND AFECHA <= @HASTA )
 DELETE FROM FOF_OCUPACION WHERE FK_CODIGOHOT = @CODIGOHOT AND AFECHA <= @HASTA
 END TRY
 BEGIN CATCH
 SELECT ERROR_MESSAGE()
 SET @ERROR = ERROR_MESSAGE()
 END CATCH
 IF @ERROR <> ''
  BEGIN
    
    INSERT INTO INSTALACION_LOG_ERROR_TRASPASO VALUES (getdate(),@CODIGOHOT,'DELETE OCUPACION',@CODIGOHOT,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR_TRASPASO VALUES (getdate(),@CODIGOHOT,'DELETE OCUPACION',@CODIGOHOT,'OK');
 


 


/*2.- Generar los archivos XXX_fof_ocupacion_maestro.sql y XXX_fof_ocupacion_detalle.sql desde el PMS2CRS. Dejar los archivos en una carpeta local del servidor SQL.

3.- Rellenear TMP_FOF_OCUPACION_MAESTRO y TMP_FOF_OCUPACION_DETALLE mediante bulk.
*/
SET @BULK_MAESTRO = 'BULK INSERT [dbo].[TMP_FOF_OCUPACION_MAESTRO] 
FROM ''' + @pathmaestro + '''
WITH (
FIELDTERMINATOR = ''|'',
ROWTERMINATOR = ''\n''
)';
EXEC  (@BULK_MAESTRO)

SET @BULK_DETALLE = 'BULK INSERT [dbo].[TMP_FOF_OCUPACION_DETALLE]
FROM ''' + @pathdetalle + '''
WITH (
FIELDTERMINATOR = ''|'',
ROWTERMINATOR = ''\n''
)';
EXEC  (@BULK_DETALLE)



/*UPDATEAMOS LA OCUPACIÓN SEGUN EL MAESTRO*/

UPDATE TMP_FOF_OCUPACION_MAESTRO
SET FK_TIPOHAB = TM.CODIGO_CRS
FROM TMP_FOF_OCUPACION_MAESTRO TFOM
JOIN TRASPASO_MAESTRO  TM
ON TM.CODIGO_PMS = TFOM.FK_TIPOHAB AND TM.ENTIDAD = 'H_OCUPACION'
AND FK_CODIGOHOT = @CODIGOHOT
where TFOM.fk_codigohot = @CODIGOHOT

--UPDATE tmp_fof_ocupacion_maestro SET
--FK_TIPOHAB = 'DB'
--where fk_codigohot = '007' and fk_tipohab = 'IN'


UPDATE TMP_FOF_OCUPACION_DETALLE  SET TIPO_ESTADISTICA =  '*UCS'		WHERE TIPO_ESTADISTICA = '*USO'		
UPDATE TMP_FOF_OCUPACION_DETALLE  SET INGRESO_BRUTO = 0 WHERE TIPO_ESTADISTICA = '*DIUR'
UPDATE TMP_FOF_OCUPACION_DETALLE  SET INGRESO_BRUTO = 0 WHERE TIPO_ESTADISTICA = '*RAP'


/*4.- Crear la tabla TMP_IMPORTAR_DATOS_OCUPACION (sino existe) mediante:*/


IF  NOT EXISTS (SELECT * FROM sys.tables
   WHERE name = N'TMP_IMPORTAR_DATOS_OCUPACION' AND type = 'U')
BEGIN
   CREATE TABLE [dbo].[TMP_IMPORTAR_DATOS_OCUPACION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CODIGOHOT] [varchar](3) NULL,
	[DESDE] [datetime] NULL,
	[HASTA] [datetime] NULL,
	[FECHA_OK] [datetime] NULL,
	[FECHA_ERROR] [datetime] NULL,
	[FECHA_INICIO] [datetime] NULL
     ) ON [PRIMARY]
/*Si existe borramos los datos del hotel.*/
END
 ELSE BEGIN
    DELETE FROM [TMP_IMPORTAR_DATOS_OCUPACION] WHERE [CODIGOHOT] = @CODIGOHOT
 END



/*4.- Rellenar los datos de esta tabla (se recomiendan periodos de máximo 15 días) . Se recomienda hacer este proceso mediante periodos cercanos a la fecha de cambio primero.*/




--SET @CODIGOHOT	= 'XXX'
--SET @DESDE = '01/01/2014'
--SET @HASTA = '30/01/2017'
--SET @DIAS	= 15

DECLARE @MYFECHA	DATETIME
DECLARE @MYHASTA	DATETIME


SET @MYFECHA = @DESDE

WHILE @MYFECHA <= @HASTA 
BEGIN
    SET @MYHASTA = DATEADD(DAY,@DIAS-1,@MYFECHA)
    
    IF (@MYHASTA > @HASTA)
    BEGIN
		SET @MYHASTA = @HASTA
    END
    
    INSERT INTO TMP_IMPORTAR_DATOS_OCUPACION
    (CODIGOHOT, DESDE, HASTA)
	VALUES
	(@CODIGOHOT,@MYFECHA,@MYHASTA)
    	
	-- SIGUIENTE PERIODO
	SET @MYFECHA = DATEADD(DAY,@DIAS,@MYFECHA)
END


/*5.- Revisar que existe el procedimiento SP_FOF_TRASPASA_OCUPACIONES.
Si no existe crear:*/


/* SP_FOF_TRASPASA_OCUPACIONES */ 

IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_FOF_TRASPASA_OCUPACIONES')
EXEC ('CREATE Procedure [dbo].[SP_FOF_TRASPASA_OCUPACIONES] 

--ALTER PROCEDURE [dbo].[SP_FOF_TRASPASA_OCUPACIONES]
  @pCODIGOHOTEL varchar (3), 
  @pDESDE datetime, 
  @pHASTA datetime 
AS
  BEGIN
  Declare @TABLA_FECHA Table ( CODIGOHOT varchar (3), CODTIPOHAB varchar (10), AFECHA datetime, FECHA datetime ) 

  Declare @FECHA        datetime 

  Declare @AUXCODIGOHOT varchar (3) 
  Set @AUXCODIGOHOT = @pCODIGOHOTEL 
  Declare @AUXDESDE     datetime 
  Set @AUXDESDE = @pDESDE 

  Set @FECHA = @pHASTA 

  While (@FECHA >= @AUXDESDE) 
  Begin 
    Insert into @TABLA_FECHA 
        ( CODIGOHOT, CODTIPOHAB, AFECHA, FECHA ) 
      Select TH.FK_CODIGOHOT, TH.CODTIPOHAB, @FECHA as AFECHA, TF.FECHA as FECHA 
        From HOTEL_TIPO_HAB TH (NOLOCK), TABLA_FECHAS TF 
        Where (TH.FK_CODIGOHOT = @AUXCODIGOHOT) And (TH.CODTIPOHAB > '''') And 
	          (TF.FECHA between @FECHA and DateAdd (DAY, 365, @FECHA)) 

    Declare Crs_Traspasa_Cursor Cursor Local Forward_Only Fast_Forward For 
      Select 
	         Max (TMH.CODIGOHOT), 
		     TMH.CODTIPOHAB, @FECHA, 
		     TMH.FECHA, 
	         Sum (Case When (TFOM.FK_TIPOHAB = TMH.CODTIPOHAB) Then TENTATIVAS Else 0 End), 
		     Sum (Case When (TFOM.FK_TIPOHAB = TMH.CODTIPOHAB) Then OCUPADAS Else 0 End), 
		     Sum (Case When (TFOM.FK_TIPOHAB = TMH.CODTIPOHAB) Then LLEGADAS Else 0 End), 
		     Sum (Case When (TFOM.FK_TIPOHAB = TMH.CODTIPOHAB) Then SALIDAS Else 0 End), 
		     Sum (Case When (TFOM.FK_TIPOHAB = TMH.CODTIPOHAB) Then BLOQUEADAS Else 0 End), 
		     Sum (Case When (TFOM.FK_TIPOHAB = TMH.CODTIPOHAB) Then MAXIMA_CAPACIDAD Else 0 End), 
		     Sum (Case When (TFOM.FK_TIPOHAB = TMH.CODTIPOHAB) Then OUTORDER Else 0 End), 
		     Sum (Case When (TFOM.FK_TIPOHAB = TMH.CODTIPOHAB) Then ADULTOS Else 0 End), 
		     Sum (Case When (TFOM.FK_TIPOHAB = TMH.CODTIPOHAB) Then INDIVIDUALES Else 0 End), 
		     Sum (Case When (TFOM.FK_TIPOHAB = TMH.CODTIPOHAB) Then GRUPO Else 0 End), 
		     Sum (Case When (TFOM.FK_TIPOHAB = TMH.CODTIPOHAB) Then NOSHOW Else 0 End) 
	    From @TABLA_FECHA TMH Left Join TMP_FOF_OCUPACION_MAESTRO TFOM  (NOLOCK)
	         On (TFOM.FK_CODIGOHOT = TMH.CODIGOHOT) And 
			    (TFOM.AFECHA = @FECHA) And 
			    (TFOM.FECHA = TMH.FECHA) And 
			    (TFOM.FK_TIPOHAB = TMH.CODTIPOHAB) 
	    Group by TMH.CODTIPOHAB, TFOM.FK_TIPOHAB, TMH.FECHA, TFOM.AFECHA 

    Declare @MYID_OCU           int 
    Declare @MyFK_CODIGOHOT  	  varchar (3) 
    Declare @MyFK_TIPOHAB		  Varchar (10) 
    Declare @MyFECHA			  varchar (20)  
    Declare @MyAFECHA			  varchar (20) 
    Declare @MyTENTATIVAS		  int 
    Declare @MyOCUPADAS		  int 
    Declare @MyLLEGADAS		  int 
    Declare @MySALIDAS		  int 
    Declare @MyBLOQUEADAS		  int 
    Declare @MyMAXIMA_CAPACIDAD int 
    Declare @MyOUTORDER         int 
    Declare @MyADULTOS          int 
    Declare @MyINDIVIDUALES     int 
    Declare @MyGRUPO            int 
    Declare @MyNOSHOW           int 
    Declare @MY_IDENTITY        int 

    Open Crs_Traspasa_Cursor 

    Fetch Next From Crs_Traspasa_Cursor 
      Into /*@MYID_OCU,*/ @MyFK_CODIGOHOT, @MyFK_TIPOHAB, @MyAFECHA, @MyFECHA, 
	       @MyTENTATIVAS, @MyOCUPADAS, @MyLLEGADAS, @MySALIDAS, 
           @MyBLOQUEADAS, @MyMAXIMA_CAPACIDAD, @MyOUTORDER, 
           @MyADULTOS, @MyINDIVIDUALES, @MyGRUPO, @MyNOSHOW 

    While (@@FETCH_STATUS = 0) 
    Begin
      Insert into FOF_OCUPACION 
          ( FK_CODIGOHOT, FK_TIPOHAB, AFECHA, FECHA, ADULTOS, N1, N2, I, 
		    TENTATIVAS, OCUPADAS, LLEGADAS, SALIDAS, 
		    INDIVIDUALES, GRUPOS, NOSHOWS, GRATUIDADES, VIPS, 
		    MAXCAPACIDAD, MAXCAPACIDAD_PLAZAS, OUTOFORDER, BLOQUEADAS, 
		    CUPOS_DESCUENTA, CUPOS_NODESCUENTA, GARANTIAS_DESCUENTA, GARANTIAS_NODESCUENTA, 
		    CALC_DISPONIBLES, REAL_DISPONIBLES, REAL_DISPONIBLES_PLAZAS ) 
	    Values 
	      ( @MyFK_CODIGOHOT, @MyFK_TIPOHAB, cast (@MyAFECHA as datetime), cast (@MyFECHA as datetime), @MyADULTOS, 0, 0, 0, 
		    @MyTENTATIVAS, @MyOCUPADAS, @MyLLEGADAS, @MySALIDAS, 
		    @MyINDIVIDUALES, @MyGRUPO, @MyNOSHOW, 0, 0, 
		    @MyMAXIMA_CAPACIDAD, 0, @MyOUTORDER, @MyBLOQUEADAS, 
		    0, 0, 0, 0, 
		    0, 0, 0 ) 
      Select @My_IDENTITY = SCOPE_IDENTITY() 

	  Insert into FOF_OCUPACION_DETALLE 
	      ( FK_ID_OCUP, FK_CODIGOHOT, TIPO_ESTADISTICA, OCUPADAS, LLEGADAS, SALIDAS, 
		    ADULTOS, NINYOS1, NINYOS2, INFANTES, INGRESO_BRUTO, INGRESO_NETO, 
		    O_OCUPADAS, O_LLEGADAS, O_SALIDAS, O_ADULTOS, O_NINYOS1, O_NINYOS2, O_INFANTES, O_INGRESO_BRUTO, O_INGRESO_NETO ) 
	    Select @MY_IDENTITY, @MyFK_CODIGOHOT, TIPO_ESTADISTICA, Sum (OCUPADAS), Sum (LLEGADAS), 0, 
	           0, 0, 0, 0, Sum (INGRESO_BRUTO), 0, 
		  	   0, 0, 0, 0, 0, 0, 0, 0, 0 
		  From TMP_FOF_OCUPACION_DETALLE (NOLOCK)
		  Where (FK_CODIGOHOT = @MyFK_CODIGOHOT) And 
		        (FK_ID_OCU in (Select TFOM.ID_OCU 
		                         From TMP_FOF_OCUPACION_MAESTRO TFOM (NOLOCK)
				                 Where (FK_CODIGOHOT = @MyFK_CODIGOHOT) And 
							           (FK_TIPOHAB = @MyFK_TIPOHAB) And 
									   (AFECHA = @MyAFECHA) And 
									   (FECHA = @MyFECHA))) 
		  Group by TIPO_ESTADISTICA 

      -- Siguiente Registro
      Fetch Next From Crs_Traspasa_Cursor 
        Into /*@MYID_OCU,*/ @MyFK_CODIGOHOT, @MyFK_TIPOHAB, @MyAFECHA, @MyFECHA, 
	         @MyTENTATIVAS, @MyOCUPADAS, @MyLLEGADAS, @MySALIDAS, 
	         @MyBLOQUEADAS, @MyMAXIMA_CAPACIDAD, @MyOUTORDER, 
		     @MyADULTOS, @MyINDIVIDUALES, @MyGRUPO, @MyNOSHOW 
    End 

    Close Crs_Traspasa_Cursor 
    Deallocate Crs_Traspasa_Cursor 

	Set @FECHA = DateAdd (DAY, -1, @FECHA) 
  End 
END;')



--/*7.- Crear el SP SP_TAREA_IMPORTAR_DATOS_OCUPACION(sino está creado) mediante:*/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_TAREA_IMPORTAR_DATOS_OCUPACION')
EXEC ('CREATE Procedure [dbo].[SP_TAREA_IMPORTAR_DATOS_OCUPACION]

--ALTER PROCEDURE [dbo].[SP_TAREA_IMPORTAR_DATOS_OCUPACION]  
AS
BEGIN

	DECLARE @ID				INT
	DECLARE @CODIGOHOT		VARCHAR(3)
	DECLARE @DESDE			DATETIME
	DECLARE @HASTA			DATETIME

Declare  @pCODIGOHOTEL varchar (3) 
Declare  @pDESDE datetime 
Declare  @pHASTA datetime 
  Declare @TABLA_FECHA Table ( CODIGOHOT varchar (3), CODTIPOHAB varchar (10), AFECHA datetime, FECHA datetime ) 

  Declare @FECHA datetime 

    	  
	DECLARE creacion_cursor CURSOR LOCAL FAST_FORWARD
	FOR  
	 
	  SELECT TOP 1 ID,CODIGOHOT,DESDE,HASTA
	  FROM TMP_IMPORTAR_DATOS_OCUPACION (NOLOCK)
	  WHERE FECHA_OK IS NULL AND
			FECHA_ERROR IS NULL and
			FECHA_INICIO is null 
	  ORDER BY DESDE DESC
	        
	OPEN creacion_cursor
	FETCH NEXT FROM creacion_cursor 
	INTO @ID,@CODIGOHOT,@DESDE,@HASTA

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		UPDATE TMP_IMPORTAR_DATOS_OCUPACION
		SET FECHA_INICIO = GETDATE()
		WHERE ID = @ID

		---- Procesamos el registro actual
		Exec dbo.SP_FOF_TRASPASA_OCUPACIONES @CODIGOHOT, @DESDE, @HASTA

		UPDATE TMP_IMPORTAR_DATOS_OCUPACION
		SET FECHA_OK = GETDATE()
		WHERE ID = @ID

		-- Siguiente Registro
		FETCH NEXT FROM creacion_cursor 
		INTO @ID,@CODIGOHOT,@DESDE,@HASTA
	END

	CLOSE creacion_cursor
	DEALLOCATE creacion_cursor
END') 

--8.- Crear una tarea SQL IMPORTACION_OCUPACIONES que ejecute el SP_TAREA_IMPORTAR_DATOS_OCUPACION (periodos nocturnos, medios día, …)
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH
IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR_TRASPASO VALUES (getdate(),@CODIGOHOT,'TAREA OCUPACION',@CODIGOHOT,@ERROR)
  END ELSE  INSERT INTO INSTALACION_LOG_ERROR_TRASPASO VALUES (getdate(),@CODIGOHOT,'TAREA OCUPACION',@CODIGOHOT,'OK');
 






END
