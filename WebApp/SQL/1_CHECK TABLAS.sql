
IF  NOT EXISTS (SELECT * FROM sys.tables
WHERE name = N'MANTENIMIENTO_STATUS' AND type = 'U')
BEGIN

CREATE TABLE [dbo].[MANTENIMIENTO_STATUS](
	[FK_CODIGOHOT] [varchar](5) NOT NULL,
	[LAST_UPDATE] [datetime] NULL,
	[LAST_CIERRE] [datetime] NULL,
	[FECHAHORA_FIN] [datetime] NULL,
	[CONECTOR_TEMPO_1] [datetime] NULL,
	[CONECTOR_TEMPO_2] [datetime] NULL,
	[CONECTOR_TEMPO_3] [datetime] NULL,
	[CONECTOR_TEMPO_4] [datetime] NULL,
	[E_1] [bit] NULL,
	[E_2] [bit] NULL,
	[E_3] [bit] NULL,
	[E_4] [bit] NULL,
	[E_5] [bit] NULL,
	[E_6] [bit] NULL,
	[E_7] [bit] NULL,
	[E_8] [bit] NULL,
	[E_9] [bit] NULL,
	[E_10] [bit] NULL,
	[E_11] [bit] NULL,
	[E_12] [bit] NULL,
	[E_13] [bit] NULL,
	[E_14] [bit] NULL,
	[E_15] [bit] NULL,
	[E_16] [bit] NULL,
	[E_17] [bit] NULL,
	[E_18] [bit] NULL,
	[E_19] [bit] NULL,
	[E_20] [bit] NULL,
	[TEMP] [int] NULL
) ON [PRIMARY]

END 


IF EXISTS (SELECT * FROM sys.tables
WHERE name = N'MANTENIMIENTO_STATUS' AND type = 'U')
BEGIN
DELETE FROM MANTENIMIENTO_STATUS
INSERT INTO  MANTENIMIENTO_STATUS 
SELECT
CODIGOHOT 
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''
,''

FROM HOTELES 
END

IF  EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_MANTENIMIENTO_CHECK_ESTADO')
DROP PROCEDURE SP_MANTENIMIENTO_CHECK_ESTADO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_MANTENIMIENTO_CHECK_ESTADO')
EXEC ('CREATE Procedure [dbo].[SP_MANTENIMIENTO_CHECK_ESTADO] 

AS
BEGIN
				/*1*/
				UPDATE MANTENIMIENTO_STATUS SET E_1 = 0 , TEMP = 0
			     UPDATE MANTENIMIENTO_STATUS
			     SET E_1 = (case when FCD.FECHA IS NULL then 0 Else 1 End)
		
		          FROM
				MANTENIMIENTO_STATUS CE 
			     LEFT JOIN HOTEL_CONFIG HC
                    ON HC.FK_CODIGOHOT = CE.FK_CODIGOHOT
				LEFT JOIN FOF_CUADRE_DIA FCD
				ON CE.FK_CODIGOHOT = FCD.FK_CODIGOHOT
			     WHERE FCD.FECHA = HC.FECHA -1
				 
				/*2*/
		    	UPDATE MANTENIMIENTO_STATUS SET E_2 = 0 , TEMP = 0
				update MANTENIMIENTO_STATUS set 
                    last_update = GETDATE(),
				last_cierre = hcl.fechahotel,
				fechahora_fin = hcl.fechahora_fin
				          FROM MANTENIMIENTO_STATUS CE JOIN HOTEL_CIERRE_LOG hcl
				ON CE.FK_CODIGOHOT = HCL.FK_CODIGOHOT
				WHERE HCL.FECHAHOTEL  IN (SELECT  TOP 1  FECHAHOTEL FROM HOTEL_CIERRE_LOG ORDER BY  fechahotel DESC)
				update MANTENIMIENTO_STATUS set 
				e_2 = (case when fechahora_fin IS NULL then 0 Else 1 End)
				
    --            FROM MANTENIMIENTO_STATUS CE JOIN HOTEL_CIERRE_LOG hcl
				--ON CE.FK_CODIGOHOT = HCL.FK_CODIGOHOT
				--WHERE HCL.FECHAHOTEL  IN (SELECT  TOP 1  FECHAHOTEL FROM HOTEL_CIERRE_LOG ORDER BY  fechahotel DESC)


				/*3*/
			     UPDATE MANTENIMIENTO_STATUS SET E_3 = 0 , TEMP = 0
			     UPDATE MANTENIMIENTO_STATUS 
			     SET TEMP = CD.ID
     	         FROM MANTENIMIENTO_STATUS CE
		             LEFT JOIN  crs_dreserva CD (nolock)
				   ON CD.CODIGOHOT = CE.FK_CODIGOHOT 
                          LEFT JOIN FOF_HABITACION_BOOKING FHB
                          on FHB.ID_CRS_DRESERVA = CD.ID
                    WHERE 
					FHB.FK_CODHAB <> CD.FK_CODHAB and
                    FHB.DESDE >= dbo.FN_HOY()AND
                  --FHB.FK_CODIGOHOT = ''900'' AND
				    CD.ESTADO <> ''CLX''
					
					UPDATE MANTENIMIENTO_STATUS
					SET E_3 = (case  WHEN TEMP > 1 then 0 Else 1 End)

             
			  
				
			/*7*/	
			   UPDATE MANTENIMIENTO_STATUS SET E_7 = 0, TEMP = 0
			  
		       UPDATE MANTENIMIENTO_STATUS 
			    SET TEMP = FF.ID
    	            FROM MANTENIMIENTO_STATUS CE
	                 LEFT JOIN FOF_FOLIO FF(NOLOCK)
				     ON FF.FK_CODIGOHOT = CE.FK_CODIGOHOT
					 AND FF.NUMFACTURA <> 0
					 AND FF.ID IN (SELECT DISTINCT ID_FOLIO FROM FOF_FOLIO_ITEM WHERE FECHA_HOTEL IS NULL)
		      UPDATE MANTENIMIENTO_STATUS
					SET E_5 = (case  WHEN TEMP > 1 then 0 Else 1 End)
					
				/*8*/
				

              
				
				/*PENDIENTE*/
				 UPDATE MANTENIMIENTO_STATUS SET E_4 = 1 
			     UPDATE MANTENIMIENTO_STATUS SET E_5 = 1 
				 UPDATE MANTENIMIENTO_STATUS SET E_6 = 1 
				 UPDATE MANTENIMIENTO_STATUS SET E_8 = 1
				 UPDATE MANTENIMIENTO_STATUS SET E_9 = 1
				 UPDATE MANTENIMIENTO_STATUS SET E_10 = 1
				 UPDATE MANTENIMIENTO_STATUS SET E_11 = 1
				 UPDATE MANTENIMIENTO_STATUS SET E_12 = 1
				 UPDATE MANTENIMIENTO_STATUS SET E_13 = 1
				 UPDATE MANTENIMIENTO_STATUS SET E_14 = 1
				 UPDATE MANTENIMIENTO_STATUS SET E_15 = 1
				 UPDATE MANTENIMIENTO_STATUS SET E_16 = 1
				 UPDATE MANTENIMIENTO_STATUS SET E_17 = 1
				 UPDATE MANTENIMIENTO_STATUS SET E_18 = 1
				 UPDATE MANTENIMIENTO_STATUS SET E_19 = 1
				 UPDATE MANTENIMIENTO_STATUS SET E_20 = 1



				-- SELECT * FROM HOTEL_CIERRE_LOG 
UPDATE MANTENIMIENTO_STATUS SET  TEMP = 0
END')


