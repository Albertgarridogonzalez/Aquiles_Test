CREATE PROCEDURE [dbo].[SP_INSTALACION_TRASPASOSOFT]--'005'  exec.
    
    @pCODIGOHOT VARCHAR (5)
AS
BEGIN

/* TRASPASO SOFT NEW 2017-08-21 : VICENTE
    - se contemplan las cuentas MASTER (se utiliza TRASPASO_MAESTRO para vincular las cuentas entre azul y blanco. PDTE)
    - sino se encuentra la cuenta, se crea automáticamente
*/

-- 1 : creacion de nuevos campos de control en tablas temporales
-- guardamos el id de FOf_FOLIO para aquellas cuentas en las que se haya creado

UPDATE  TRASPASO_FACTURA_LINEA
SET PRECIO = -PRECIO
WHERE CONCEPTO LIKE '%DPR%' AND PRECIO > '0'

UPDATE TRASPASO_FACTURA_LINEA
SET PRECIO = -PRECIO
WHERE CONCEPTO LIKE '$%' AND PRECIO > '0'

UPDATE  TRASPASO_FACTURA_LINEA
SET TIPOIVA = '2'
WHERE CONCEPTO LIKE '%DPR%'

UPDATE TRASPASO_FACTURA_LINEA
SET TIPOIVA = '2'
WHERE CONCEPTO LIKE '$%'

--IF COL_LENGTH('TRASPASO_FACTURA', 'NUEVO_FOLIO') IS NULL
--BEGIN
--    ALTER TABLE TRASPASO_FACTURA
--    ADD NUEVO_FOLIO INT NULL
--END
----guardamos el id de FOF_FOLIO_ITEM generado

--IF COL_LENGTH('TRASPASO_FACTURA_LINEA', 'NUEVO_ID_FOLIO_ITEM') IS NULL
--BEGIN
--ALTER TABLE TRASPASO_FACTURA_LINEA
--ADD NUEVO_ID_FOLIO_ITEM INT NULL
--END


-- 2 : recorrido de facturas a trasapasar


Declare @pCODUSUARIO varchar (10)
Declare @pMONEDA     varchar (3)


Set @pCODUSUARIO = 'tesipro'
Set @pMONEDA     = 'EUR'

  Declare @ID_FACTURA   int
  Declare @HABITACION   varchar (4)
  Declare @RESERVA_PMS  int -- AZUL
  Declare @RESERVA_PMS_BLANCO int -- BLANCO
  Declare @TIPO_FACTURA varchar (1)
 
  Declare @AUX_ID_FOLIO_ITEM int

  Declare @ID_FOLIO int

  Declare @LIN_HABITACION    varchar (4)  
  Declare @LIN_RESERVA_PMS   int
  Declare @LIN_CONCEPTO      varchar (10)
  Declare @LIN_FECHA         datetime
  Declare @LIN_FECHA_CARGO   datetime
  Declare @LIN_CANTIDAD      int
  Declare @LIN_PRECIO        numeric (19,3)
  Declare @LIN_PORC_DTO      numeric (5,2)
  Declare @LIN_COMIS_1       numeric (5,2)
  Declare @LIN_COMIS_2       numeric (5,2)
  Declare @LIN_COMIS_3       numeric (5,2)
  Declare @LIN_MOTIVO        varchar (30)
  Declare @LIN_DEPARTAMENTO  int
  Declare @LIN_TICKET        int
  Declare @LIN_TIPO_IVA      int
  Declare @LIN_DESC_CONCEPTO varchar (30)
  Declare @LIN_PAX           int
  Declare @LIN_POR_TAX       numeric (5,2)
  Declare @LIN_TIPO_CARGO    char (1)

  DECLARE @ID_LINEA_FACTURA INT

  -- campos para crear la factura con el maximo de detalle
  DECLARE @MY_FK_CODCLIENTE INT = 0
  DECLARE @MY_DOC_NUM    VARCHAR(20) = ''
  DECLARE @MY_NOMBRE    VARCHAR(50) = ''
 DECLARE  @MY_DIRECCION VARCHAR(120) = ''
 DECLARE @MY_POBLACION VARCHAR (50) = ''
  DECLARE @MY_CODPOSTAL    VARCHAR(30) = ''
 DECLARE @MY_OCUPANTE VARCHAR(50) = ''
 DECLARE @MY_TIPOFACTURASII VARCHAR(5) = ''
 DECLARE @MY_TIPO_DOC VARCHAR(5) = ''
  DECLARE @MY_NO_CERRABLE BIT = 0
   DECLARE @MY_COD_PAIS VARCHAR(15) = ''
  DECLARE @MY_COD_PROVINCIA VARCHAR(15) = ''

  Declare CURSOR_FACTURA Cursor Local Forward_Only Fast_Forward For
    Select FPMS.ID, RTrim (SubString (FPMS.HABITAC, 1, PatIndex ('%/%', FPMS.HABITAC) - 1)) as HABITAC, FPMS.RESERVA,
           Case When (FPMS.TIPO_FACTURA > '') Then FPMS.TIPO_FACTURA Else 'P' End as TIPO_FACTURA,
           TR.ID_DRESERVA
      From TRASPASO_FACTURA FPMS(NOLOCK) LEFT JOIN TRASPASO_RESERVA TR(NOLOCK)
            ON FPMS.RESERVA = TR.NUMRESERVA
      Where (FPMS.CODIGOHOT = @pCODIGOHOT) 
	      AND (FPMS.NUEVO_FOLIO IS NULL)
     ORDER BY HABITAC  
           

  Open CURSOR_FACTURA
  Fetch Next From CURSOR_FACTURA
    Into @ID_FACTURA, @HABITACION, @RESERVA_PMS, @TIPO_FACTURA, @RESERVA_PMS_BLANCO

  While (@@FETCH_STATUS = 0)
  Begin
    Set @ID_FOLIO = 0
    Select @ID_FOLIO = ID
      From FOF_FOLIO
      Where (FK_CODIGOHOT = @pCODIGOHOT) And
            (CODFOLIO = @HABITACION) And
            (FK_TIPO_FOLIO = @TIPO_FACTURA) And
            (FECHA_CIERRE <= 0) And (FECHA_ELIMINADA is NULL)
    If (@ID_FOLIO is NULL) or (@ID_FOLIO = 0)
    Begin
      Select @ID_FOLIO = ID
        From FOF_FOLIO
        Where (FK_CODIGOHOT = @pCODIGOHOT) And
              (CODFOLIO = @HABITACION) And
              (FK_TIPO_FOLIO = 'P') And
              (FECHA_CIERRE <= 0) And (FECHA_ELIMINADA is NULL)
    End
    
    -- sino existe la cuenta la crea
    
    IF (@ID_FOLIO is NULL) or (@ID_FOLIO = 0)
    BEGIN
        -- buscamos otros datos para crear el folio con el maximo de detalle (y no hemos leido en el cursor)
        SELECT @MY_FK_CODCLIENTE = (SELECT CODEMPRESA_PMS FROM TRASPASO_AGENCIA WHERE CODEMPRESA = TF.CODICLI),
               @MY_DOC_NUM = TF.CIF,
               @MY_NOMBRE = CASE WHEN TF.NOM = '' THEN TF.OCUPANTE END ,
			@MY_DIRECCION = TF.DOM_CLI,
			@MY_POBLACION = TF.POBLACION,
			@MY_CODPOSTAL = TF.CODPOSTAL,
			@MY_OCUPANTE = TF.OCUPANTE,
			@MY_TIPOFACTURASII = ISNULL (TF.TIPO_FACTURA_SII,'F1'),
			@MY_TIPO_DOC = TF.TIPO_DOC,
			@MY_NO_CERRABLE = TF.NOCERRAR,
            @MY_COD_PAIS = TF.PAIS,
            @MY_COD_PROVINCIA = TF.PROV

            --  select * from traspaso_factura

        FROM TRASPASO_FACTURA TF(NOLOCK)
        WHERE TF.ID = @ID_FACTURA

        -- ajustamos valores
        IF @MY_FK_CODCLIENTE IS NULL
        BEGIN
            SET @MY_FK_CODCLIENTE = 0
        END
        IF @RESERVA_PMS_BLANCO IS NULL
        BEGIN
            SET @RESERVA_PMS_BLANCO = 0
        END
        IF @TIPO_FACTURA IS NULL OR @TIPO_FACTURA = ''
        BEGIN
            SET @TIPO_FACTURA = 'E'
        END
	  
	   
	   
	   SET @MY_TIPO_DOC=  CASE isnull(@MY_TIPO_DOC,'')
		     WHEN 'D' THEN '00'
		     WHEN 'I' THEN '03'
		     WHEN 'N' THEN '03'
		     WHEN 'P' THEN '03'
		     WHEN 'C' THEN '03'
		     WHEN 'X' THEN '03'
		     ELSE '' 
			END
			  -- SELECT * FROM TRASPASO_FACTURA
          
         
		     INSERT INTO INSTALACION_LOG_ERROR_TRASPASO 
             SELECT GETDATE(), @pCODIGOHOT, 'TRASPASO_FOLIO',@MY_TIPO_DOC, ''

        EXECUTE  [dbo].[SP_FOF_CREAR_FOLIO] @pCODIGOHOT,@HABITACION,@MY_TIPOFACTURASII/*@pCODTIPOFRA*/ ,@MY_FK_CODCLIENTE/*@pFK_CODCLIENTE*/ ,@MY_DOC_NUM/*@pDOC_NUM*/
                                        ,@MY_TIPO_DOC ,@MY_NOMBRE/*@pNOMBRE*/ ,@MY_DIRECCION, @MY_POBLACION ,@MY_CODPOSTAL ,''/*@pCODPROVINCIA*/
                                        ,@MY_COD_PROVINCIA/*@pPROVINCIA*/ ,@MY_COD_PAIS/*@pCODPAIS*/ ,''/*@pPAIS*/ ,0/*@pFK_CODCLIENTE_OCUPANTE*/ ,@MY_OCUPANTE
                                        ,@RESERVA_PMS_BLANCO/*@pFK_ID_DRESERVA*/ ,''/*@pFK_CODHAB*/ ,@TIPO_FACTURA/*@pFK_TIPO_FOLIO*/
                                        ,'TRS'/*@pFK_CREACION_FOLIO*/ ,''/*@pSITUACION_FOLIO*/
                                        ,''/*@pDESCRIPCION*/ ,0/*@pFRA_NETO*/ ,1/*@pFRA_IMPUESTO_INCLUIDO*/ ,@MY_NO_CERRABLE ,@ID_FOLIO OUTPUT, 0 /* ID_MRESERVA */

        UPDATE TRASPASO_FACTURA
        SET NUEVO_FOLIO = @ID_FOLIO
        WHERE ID = @ID_FACTURA

    END
    
    

    If (@ID_FOLIO > 0)
    Begin
    --UPDATE FOF_FOLIO SET 
      DECLARE @CODFOLIO VARCHAR (5) = (SELECT CODFOLIO FROM FOF_FOLIO WHERE ID = @ID_FOLIO)
      DECLARE @PAIS VARCHAR (50) 
    DECLARE @PROVINCIA VARCHAR (50) 
     SELECT @MY_FK_CODCLIENTE = (SELECT CODEMPRESA_PMS FROM TRASPASO_AGENCIA WHERE CODEMPRESA = TF.CODICLI),
               @MY_DOC_NUM = TF.CIF,
               @MY_NOMBRE = CASE WHEN TF.NOM = '' THEN TF.OCUPANTE END ,
			@MY_DIRECCION = TF.DOM_CLI,
			@MY_POBLACION = TF.POBLACION,
			@MY_CODPOSTAL = TF.CODPOSTAL,
			@MY_OCUPANTE = TF.OCUPANTE,
			@MY_TIPOFACTURASII = ISNULL (TF.TIPO_FACTURA_SII,'F1'),
			@MY_TIPO_DOC = TF.TIPO_DOC,
			@MY_NO_CERRABLE = TF.NOCERRAR,
            @MY_COD_PAIS = TF.PAIS,
            @MY_COD_PROVINCIA = TF.PROV
           

        FROM TRASPASO_FACTURA TF(NOLOCK)
        WHERE TF.ID = @ID_FACTURA

              IF @MY_FK_CODCLIENTE IS NULL
        BEGIN
            SET @MY_FK_CODCLIENTE = 0
        END
        IF @RESERVA_PMS_BLANCO IS NULL
        BEGIN
            SET @RESERVA_PMS_BLANCO = 0
        END
        IF @TIPO_FACTURA IS NULL OR @TIPO_FACTURA = ''
        BEGIN
            SET @TIPO_FACTURA = 'E'
        END
	  
	   SET @PROVINCIA =  (SELECT NOMBRE FROM PROVINCIAS WHERE CODIGOPROV = @MY_COD_PROVINCIA)
	   SET @PAIS = (SELECT NOMBRE FROM PAISES WHERE CODIGOPAIS = @MY_COD_PAIS)
	   SET @MY_TIPO_DOC=  CASE isnull(@MY_TIPO_DOC,'')
		     WHEN 'D' THEN '00'
		     WHEN 'I' THEN '03'
		     WHEN 'N' THEN '03'
		     WHEN 'P' THEN '03'
		     WHEN 'C' THEN '03'
		     WHEN 'X' THEN '03'
		     ELSE '' 
			END




update  fof_folio set 
PROVINCIA = @PROVINCIA    ,
FK_CODPROVINCIA = @MY_COD_PROVINCIA,
PAIS = @PAIS,
FK_CODPAIS = @MY_COD_PAIS,
FK_CODTIPOFRA = @MY_TIPOFACTURASII,
DOC_NUM = @MY_DOC_NUM,
FK_CODTIPODOC = @MY_TIPO_DOC,
CODPOSTAL  = @MY_CODPOSTAL,
FK_CODCLIENTE = @MY_FK_CODCLIENTE

where id = @ID_FOLIO






        -- EXEC.[SP_FOLIO_CAMBIA_CABECERA_FACTURA]
        --  @ID_FOLIO,
        --  @CODFOLIO ,
        --  @MY_FK_CODCLIENTE  ,
        --  @MY_DOC_NUM ,
        --  @MY_TIPO_DOC ,
        --  @MY_NOMBRE ,
        --  @MY_DIRECCION  ,
        --  @MY_POBLACION      ,
        --  @MY_CODPOSTAL     ,
        --  @MY_COD_PROVINCIA        ,
        --  @MY_COD_PROVINCIA   ,
        --  @MY_COD_PAIS     ,
        --  @PAIS ,
        --  '',
        --  ''   ,
        --  ''    ,
        -- '',
        --  0
       



            --  select * from traspaso_factura

               --UPDATE FOF_FOLIO SET 
	     INSERT INTO INSTALACION_LOG_ERROR_TRASPASO 
        SELECT GETDATE(), @pCODIGOHOT, 'TRASPASO_FOLIO',@MY_TIPO_DOC, ''



      Declare CURSOR_LINEA Cursor Local Forward_Only Fast_Forward For
        Select TFL.ID,
               RTrim (SubString (TFL.HABITAC, 1, PatIndex ('%/%', TFL.HABITAC) - 1)) as HABITAC,
                 TFL.RESERVA, TM.CODIGO_CRS AS CONCEPTO, TFL.FECHA, TFL.FECHACARGO,
                       TFL.CANTIDAD, TFL.PRECIO, TFL.DTO, TFL.COMISION1, TFL.COMISION2, TFL.COMISION3,
                       TFL.MOTIVO, TFL.DEPARTAMENTO, TFL.TICKET, TFL.TIPOIVA, TFL.DESC_CONCEPTO, TFL.PAX
                  From TRASPASO_FACTURA_LINEA TFL(NOLOCK) JOIN TRASPASO_MAESTRO TM(NOLOCK)
            ON TFL.CODIGOHOT = TM.CODIGOHOT AND
               TFL.CONCEPTO = TM.CODIGO_PMS AND
               TM.ENTIDAD = 'CONCEPTO'
          Where (TFL.ID_HFACTURA = @ID_FACTURA) and
                (TFL.NUEVO_ID_FOLIO_ITEM is null or tfl.NUEVO_ID_FOLIO_ITEM = 0) -- para evitar cargar 2 veces




      Open CURSOR_LINEA
      Fetch Next From CURSOR_LINEA
        Into @ID_LINEA_FACTURA,
             @LIN_HABITACION, @LIN_RESERVA_PMS, @LIN_CONCEPTO, @LIN_FECHA, @LIN_FECHA_CARGO,
             @LIN_CANTIDAD, @LIN_PRECIO, @LIN_PORC_DTO, @LIN_COMIS_1, @LIN_COMIS_2, @LIN_COMIS_3,
             @LIN_MOTIVO, @LIN_DEPARTAMENTO, @LIN_TICKET, @LIN_TIPO_IVA, @LIN_DESC_CONCEPTO ,@LIN_PAX  

      While (@@FETCH_STATUS = 0)
      Begin
        Select @LIN_POR_TAX = IsNull ((Select Case @LIN_TIPO_IVA    
                                        When 0 Then IVA0
                                        When 1 Then IVA1
                                        When 2 Then IVA2
                                        When 3 Then IVA3
                                        Else IVA0 End
                                   From dbo.FN_TABLAINFOHOTELIMPUESTOS (@pCODIGOHOT, @LIN_FECHA, @LIN_FECHA)), 10)
        Set @LIN_TIPO_CARGO = Case When (@LIN_CONCEPTO = 'TAX')
                                     Then 'T' Else 'C' End
        Exec dbo.SP_FOLIO_CARGO @ID_FOLIO, 0, @pCODIGOHOT, @LIN_CONCEPTO, @LIN_DESC_CONCEPTO, '',
                                @LIN_CANTIDAD, @LIN_PRECIO, 0,
                                @LIN_POR_TAX /*TAX*/,
                                @LIN_PORC_DTO, 0, 0, 0,
                                0/*IMP_INCLUIDO*/, @pMONEDA,
                                @LIN_PAX, @LIN_FECHA_CARGO, @LIN_FECHA, @LIN_FECHA, null,
                                'TRS', @LIN_DEPARTAMENTO, 'xx', 0, @LIN_TICKET, null,
                                0 /*MANUAL*/, 1 /*CP_VENTA*/, 1 /*CP_PRODUCCION*/, 0 /*CP_AGRUPADO*/, 0/* AGRUPAR_EN_HAB*/,
                                @LIN_TIPO_CARGO, 1 /*VISIBLE*/, 1 /*VISIBLE_FRA*/,
                                0, 0, 0, 0, 0, '' /* MOTIVO */, @AUX_ID_FOLIO_ITEM output

        -- actualizamos
        UPDATE TRASPASO_FACTURA_LINEA
        SET NUEVO_ID_FOLIO_ITEM = @AUX_ID_FOLIO_ITEM
        WHERE ID = @ID_LINEA_FACTURA


        Fetch Next From CURSOR_LINEA
          Into @ID_LINEA_FACTURA,
               @LIN_HABITACION, @LIN_RESERVA_PMS, @LIN_CONCEPTO, @LIN_FECHA, @LIN_FECHA_CARGO,
               @LIN_CANTIDAD, @LIN_PRECIO, @LIN_PORC_DTO, @LIN_COMIS_1, @LIN_COMIS_2, @LIN_COMIS_3,
               @LIN_MOTIVO, @LIN_DEPARTAMENTO, @LIN_TICKET, @LIN_TIPO_IVA, @LIN_DESC_CONCEPTO ,@LIN_PAX  
      End

      Close CURSOR_LINEA
      Deallocate CURSOR_LINEA
    End Else
          Begin
            Select @ID_FACTURA, @HABITACION, @RESERVA_PMS, @TIPO_FACTURA
          End
          
    -- siguiente factura
    Fetch Next From CURSOR_FACTURA
      Into @ID_FACTURA, @HABITACION, @RESERVA_PMS, @TIPO_FACTURA,@RESERVA_PMS_BLANCO
    
  End

  Close CURSOR_FACTURA
  Deallocate CURSOR_FACTURA



END


IF @pCODIGOHOT > ''
BEGIN
    UPDATE HOTEL_CONFIG
    SET FECHA =   convert (date, getdate())
    WHERE FK_CODIGOHOT = @pCODIGOHOT

UPDATE FOF_FOLIO_ITEM SET FK_ID_DRESERVA_DETALLE = CDD.ID
FROM CRS_DRESERVA_DETALLE CDD
LEFT JOIN FOF_FOLIO_ITEM FFI
ON FFI.FECHA_VISUAL = CDD.FECHA AND FFI.FK_ID_DRESERVA = CDD.ID_DRESERVAS AND FFI.FK_CODIGOHOT = CDD.CODIGOHOT
LEFT JOIN CRS_DRESERVA CD
ON CD.ID = FFI.FK_ID_DRESERVA AND CD.CODIGOHOT = FFI.FK_CODIGOHOT
LEFT JOIN RELCONCSPRODUC R 
ON R.CODIGOCP = FFI.FK_CODIGOCP AND R.CODIGOHOT = FFI.FK_CODIGOHOT
WHERE FFI.FK_CODIGOHOT = @pCODIGOHOT
and ORIGEN = 'TRS' AND R.FK_CODTIPOHAB <> ''
--UPDATE FOF_FOLIO_ITEM SET FK_ID_DRESERVA_DETALLE = 0
--WHERE ORIGEN = 'TRS'



--UPDATE FOF_FOLIO_ITEM 
--SET FK_ID_DRESERVA_DETALLE = CDD.ID
--FROM CRS_DRESERVA_DETALLE CDD
--LEFT JOIN FOF_FOLIO_ITEM FFI
--ON FFI.FECHA_VISUAL = (CASE WHEN FK_CODIGOCP = 'BRK' THEN CDD.FECHA -1 ELSE CDD.FECHA END) AND FFI.FK_ID_DRESERVA = CDD.ID_DRESERVAS AND FFI.FK_CODIGOHOT = CDD.CODIGOHOT
--LEFT JOIN CRS_DRESERVA CD
--ON CD.ID = FFI.FK_ID_DRESERVA AND CD.CODIGOHOT = FFI.FK_CODIGOHOT
--WHERE FFI.FK_CODIGOHOT = @pCODIGOHOT
--and ORIGEN = 'TRS'





END

