
CREATE PROCEDURE [dbo].[SP_INSTALACION_NEW_HOTEL]

 @pNOMHOTEL_NEW varchar(50) 							,																																	
 @pTELEFONO_NEW varchar(10) 							,																																	
 @pDIRECCION_NEW varchar(50)							,																																	
 @pPOBLACION_NEW varchar(10)							,																																		
 @pCODPOSTAL_NEW varchar(10) 							,																																
 @pCIF_NEW varchar(10)								,																																
 @pNUMHAB_NEW varchar(10) 							,																																	
 @pNOMBRE_FISCAL_NEW varchar(50) 						,																																			
 @pIDPOLICIA_NEW varchar(10) 							,																																	
 @pNUMSECUENCIA_NEW varchar(5)						,																																		
 @pRutaPolicia varchar(50)							,																																		
 @pDIASCAMBIOSABANA_NEW varchar(5)						,																																	
 @pCIERREAUTOMATICO bit 								,																																
 @pPMSIMPUESTOSINCL bit 								,																																	
 @pNUMERO_FACTURA_NEW varchar(10) 						,																																			
 @pNUMERO_ABONO_NEW varchar(10) 						,																																		
 @pTIPOLOGIA_DEFECTO_NEW_RESERVA varchar(10)  			,																																					
 @pTIENE_TASA bit  								,																																	
 @pIMPORTE_TAX varchar(5) 							,																																			
 @pBB varchar(5) 									,																																
 @pMP varchar(5) 									,																																
 @pPC varchar(5) 									,																																
 @pMail varchar(50) 								,																																		
 @pCamas varchar(50) 								,																																		
 @pCext varchar(50) 								,																																	
 @pCunas varchar(50) 								,																																	
 @pCOD_NEW varchar(5)                                       ,																																									
 @pIVA0_NEW varchar(15)                                     ,																																								
 @pIVA1_NEW varchar(10)                                     ,																																								
 @pNOMBRECORTO_NEW varchar(10)                              ,																																									
 @pFECHA_HOTEL datetime								,
 @CATEGORIA int                                             ,
 @WEB VARCHAR (150)																																											
																																										
																																						
  
AS
BEGIN

IF @pCOD_NEW NOT IN (SELECT CODIGOHOT FROM HOTELES)
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
																																								
DECLARE @ERROR VARCHAR (500);																																									
		
		SET @ERROR = 'OK'																																								
BEGIN TRY																																										
INSERT INTO HOTELES 																																										
      ([CODIGOHOT]																																										
      ,[NOMHOTEL]																																										
      ,[TELEFONO1]																																										
      ,[TELEFONO2]																																										
      ,[TELEFONO3]																																										
      ,[EMAILHOT1]																																										
      ,[EMAILHOT2]																																										
      ,[EMAILHOT3]																																										
      ,[PERSONA1]																																										
      ,[DIRECTO1]																																										
      ,[DEPARTA1]																																										
      ,[EMAILPER1]																																										
      ,[PERSONA2]																																										
      ,[DIRECTO2]																																										
      ,[DEPARTA2]																																										
      ,[EMAILPER2]																																										
      ,[PAGWEB]																																										
      ,[DIRECCION]																																										
      ,[POBLACION]																																										
      ,[PROVINCIA]																																										
      ,[CODPOSTAL]																																										
      ,[CODPROV]																																										
      ,[CODPAIS]																																										
      ,[DIRIMPORT]																																										
      ,[CATEGORIA]																																										
      ,[TIPO_STATUS_HOTEL]																																										
      ,[IMPOROCU]																																										
      ,[IMPORPRO]																																										
      ,[IMPORPREV]																																										
      ,[COMENTA]																																										
      ,[CODSEGMENTOXDEFECTO]																																										
      ,[CODORIGENXDEFECTO]																																										
      ,[CODPAISXDEFECTO]																																										
      ,[CODPROVINCIAXDEFECTO]																																										
      ,[CODTIPODEHABITACIONXDEFECTO]																																										
      ,[CODTIPODEPENSIONXDEFECTO]																																										
      ,[CODTARIFAXDEFECTO]																																										
      ,[FECHAMINRESERVA]																																										
      ,[MONEDA]																																										
      ,[NHABITACIONES]																																										
      ,[NCAMAS]																																										
      ,[NCAMASEXTRAS]																																										
      ,[NCUNAS]																																										
      ,[NPLANTAS]																																										
      ,[NPLAZASPARKING]																																										
      ,[IDIOMA]																																										
      ,[IVA0]																																										
      ,[IVA1]																																										
      ,[IVA2]																																										
      ,[IVA3]																																										
      ,[CONTADORRESERVAS]																																										
      ,[CONEXIONONLINE]																																										
      ,[CONEXIONOFFLINE]																																										
      ,[CONEXIONWEB]																																										
      ,[FORMATOFAX]																																										
      ,[FORMATOEMAIL]																																										
      ,[FAXCONFIRMACION]																																										
      ,[TELEFONORESERVA]																																										
      ,[EMAILCONFIRMACION]																																										
      ,[CODIGOWEB]																																										
      ,[PASSWORD]																																										
      ,[CONFIRMACIONONLINE]																																										
      ,[CONFIRMACIONOFFLINE]																																										
      ,[CONFIRMACIONWEB]																																										
      ,[CONFIRMACIONFAX]																																										
      ,[CONFIRMACIONEMAIL]																																										
      ,[MARCA]																																										
      ,[FAX]																																										
      ,[TIPO_HOTEL]																																										
      ,[TIPO_CONSTRUCCION]																																										
      ,[AÑO_CONSTRUCCION]																																										
      ,[AÑO_RENOVACION]																																										
      ,[TIPO_RENOVACION]																																										
      ,[NOMBRE_FISCAL]																																										
      ,[DIRECCION_FISCAL]																																										
      ,[POBLACION_FISCAL]																																										
      ,[PROVINCIA_FISCAL]																																										
      ,[CODPOSTAL_FISCAL]																																										
      ,[CIF_HOTEL]																																										
      ,[CONFIRMACIONIMPRESORA]																																										
      ,[CODZONAG]																																										
      ,[FK_CODCADENA]																																										
      ,[ESTADO_GESTION]																																										
      ,[FACTURAR_A]																																										
      ,[TIPO_FACTURAR_A]																																										
      ,[ENVIAR_A]																																										
      ,[TIPO_ENVIAR_A]																																										
      ,[ESTADO_GESTION_WEB]																																										
      ,[DATOS_BANCARIOS]																																										
      ,[PATHFRONT]																																										
      ,[CATEGORIA_IB]																																										
      ,[CODIATA_CIUDAD]																																										
      ,[CODZONAP]																																										
      ,[PRECIO_MAX]																																										
      ,[PRECIO_MIN]																																										
      ,[COORDENADAS_UBICACION]																																										
      ,[MARCA_BLANCA]																																										
      ,[EDAD_I]																																										
      ,[EDAD_N1]																																										
      ,[EDAD_N2]																																										
      ,[EDAD_A]																																										
      ,[ORDEN]																																										
      ,[DIAS_RELEASE]																																										
      ,[HORAS_RELEASE]																																										
      ,[POL_CANCELACION]																																										
      ,[POL_GARANTIA]																																										
      ,[CODCOLEC]																																										
      ,[CODGHOTEL]																																										
      ,[CODTH_CRS]																																										
      ,[DESCRIPCION_WEB]																																										
      ,[DIR_TIRA_FOTOS]																																										
      ,[DIR_LOGO]																																										
      ,[DOC_PDF]																																										
      ,[PORCOMIS]																																										
      ,[FEESCOMIS]																																										
      ,[CODIGOAUTONOMA]																																										
      ,[CODPAIS_FISCAL]																																										
      ,[NOMHOTEL_CORTO]																																										
      ,[RELEASE_D_PENALIZACION]																																										
      ,[RELEASE_H_PENALIZACION]																																										
      ,[IMPORTE_PENALIZACION]																																										
      ,[PORC_PENALIZACION]																																										
      ,[NOCHES_PENALIZACION]																																										
      ,[DESCRIPCION_SERVICIOS]																																										
      ,[DESCRIPCION_HABITACIONES]																																										
      ,[DESCRIPCION_SITUACION]																																										
      ,[MAXHABXRES]																																										
      ,[PAGWEB_PUBLICAR]																																										
      ,[DESCRIPCION_SALONES]																																										
      ,[POLITICA_CANCELACION]																																										
      ,[POLITICA_GARANTIA]																																										
      ,[MOSTRAR_SINIVA]																																										
      ,[ORDEN_CUADRO_MANDOS])																																										
values (@pCOD_NEW																																										
      ,@pNOMHOTEL_NEW																																										
      ,@pTELEFONO_NEW																																										
      ,@pTELEFONO_NEW																																										
      ,@pTELEFONO_NEW																																										
      ,@pMail																																										
      ,@pMail																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,@WEB																																										
      ,@pDIRECCION_NEW																																										
      ,@pPOBLACION_NEW																																										
      ,@pPOBLACION_NEW																																										
      ,@pCODPOSTAL_NEW																																										
      ,'B'																																										
      ,'ES'																																										
      ,''																																										
      ,@CATEGORIA																																										
      ,'0'																																										
      ,'1'																																										
      ,'1'																																										
      ,'1'																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,'EUR'																																										
      ,@pNUMHAB_NEW																																										
      ,@pCamas																																										
      ,@pCExt																																										
      ,@pCunas																																										
      ,'0'																																										
      ,'0'																																										
      ,'1'																																										
      ,@pIVA0_NEW																																										
      ,@pIVA1_NEW																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,'2'																																										
      ,@pNOMBRE_FISCAL_NEW																																										
      ,@pDIRECCION_NEW																																										
      ,@pPOBLACION_NEW																																										
      ,@pPOBLACION_NEW																																										
      ,@pCODPOSTAL_NEW																																										
      ,@pCIF_NEW																																										
      ,'0'																																										
      ,''																																										
      ,''																																										
      ,'A'																																										
      ,'0'																																										
      ,'1'																																										
      ,'0'																																										
      ,'1'																																										
      ,'A'																																										
      ,''																																										
      ,''																																										
      ,'CH'																																										
      ,''																																										
      ,''																																										
      ,'0'																																										
      ,'0'																																										
      ,''																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'2994'/*CODLANGCON*/																																										
      ,'2994'																																										
      ,''																																										
      ,@pNOMBRECORTO_NEW																																										
      ,''																																										
      ,'0'																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,'0'																																										
      ,'0'																																										
      ,''																																										
      ,'ES'																																										
      ,@pNOMBRECORTO_NEW																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'500'																																										
      ,'1'																																										
      ,'0'																																										
      ,(SELECT TOP 1 ID FROM MPOLITICA)																																									
      ,NULL																																										
      ,NULL																																										
      ,'0')																																										
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL',@pNOMHOTEL_NEW,'OK');																																										
SET @ERROR = NULL

BEGIN TRY																																										
INSERT INTO HOTEL_CONFIG 																																										
      ([FK_CODIGOHOT]																																										
      ,[FECHA]																																										
      ,[NUMFACTURA]																																										
      ,[SUBCANAL_RESERVA]																																										
      ,[IDPOLICIA]																																										
      ,[FK_CODTIPOFORMATOPOLICIA]																																										
      ,[CHECKIN_HABSUCIA]																																										
      ,[HORA_MIN_CIERRE]																																										
      ,[CIERRE]																																										
      ,[CHECKIN_TODAS_HABS]																																										
      ,[MES_INICIAL_PERIODO_PRODUCCION]																																										
      ,[SAC_SINIMPUESTO]																																										
      ,[RUTA_POLICIA]																																										
      ,[NUMSECUENCIA_POLICIA]																																										
      ,[DIAS_CAMBIO_SABANA]																																										
      ,[POS_DESCUENTACOM_FRARNETO]																																										
      ,[CIERRE_AUTOMATICO]																																										
      ,[FECHA_INICIO]																																										
      ,[PMS_IMPUESTOS_INCLUIDOS]																																										
      ,[PMS_ENTRADA_IMPUESTOS_INCLUIDOS]																																										
      ,[FK_TIPO_VALIDACION_CARDEX]																																										
      ,[PMS_FACTURA_IMPUESTOS_INCLUIDOS]																																										
   --   ,[PMS_ENSUCIAR_BLOQUEADAS_EN_CIERRE]																																										
      ,[PMS_INFORMES_NETOS]																																										
      ,[RUTA_INE_EUSTAT]																																										
	  ,[USO_SUBTIPOS]																																									
	  ,[FONDO_CAJA]																																									
	  ,[PMS_FACTURA_NETA])																																									
VALUES (@pCOD_NEW																																										
      ,@pFECHA_HOTEL																																										
      ,'0'																																										
      ,'PMS'																																										
      ,@pIDPOLICIA_NEW																																										
      ,'ESP'																																										
      ,'0'																																										
      ,'23'																																										
      ,'0'																																										
      ,'0'																																										
      ,'1'																																										
      ,'0'																																										
      ,@pRutaPolicia																																										
      ,@pNUMSECUENCIA_NEW																																										
      ,@pDIASCAMBIOSABANA_NEW																																										
      ,'3'																																										
      ,@pCIERREAUTOMATICO																																										
      ,'01/01/2010'																																										
      ,@pPMSIMPUESTOSINCL																																										
      ,@pPMSIMPUESTOSINCL																																										
      ,'ESP'																																										
      ,@pPMSIMPUESTOSINCL																																										
    --  ,'1'																																										
      ,'0'																																										
      ,''																																										
	  ,'0'																																									
	  ,'0'																																									
	  ,'1')																																									
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL CONFIG',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL CONFIG',@pNOMHOTEL_NEW,'OK');	  																																									
SET @ERROR = NULL

																																										
BEGIN TRY																																										
INSERT INTO HOTEL_IMPUESTO 																																										
      ([FK_CODIGOHOT]																																										
      ,[DESDE]																																										
      ,[HASTA]																																										
      ,[IVA0]																																										
      ,[IVA1]																																										
      ,[IVA2]																																										
      ,[IVA3]																																										
      ,[CONCEPTO_IVA0]																																										
      ,[CONCEPTO_IVA1]																																										
      ,[CONCEPTO_IVA2]																																										
      ,[CONCEPTO_IVA3])																																										
VALUES (@pCOD_NEW																																										
      ,'01/01/2010'																																										
      ,NULL																																										
      ,@pIVA0_NEW																																										
      ,@pIVA1_NEW																																										
      ,'0'																																										
      ,'0'																																										
      ,'IVA0'																																										
      ,'IVA1'																																										
      ,'IVA2'																																										
      ,'IVA3')																																										
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL IMPUESTO',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL IMPUESTO',@pNOMHOTEL_NEW,'OK');																																									
SET @ERROR = NULL


BEGIN TRY																																										
INSERT INTO HOTEL_CONFIG_FACTURACION 																																										
      ([FK_CODIGOHOT]																																										
      ,[TIPO_SERIE]																																										
      ,[FK_TIPO_CLIENTE]																																										
      ,[FK_CODEMPRESA]																																										
      ,[FECHA_DESDE]																																										
      ,[FECHA_HASTA]																																										
      ,[SERIE]																																										
      ,[NUMFACTURA]																																										
      ,[CAMBIANDO]																																										
      ,[FK_TIPO_IMPRESION])																																										
VALUES (@pCOD_NEW																																										
      ,'F'																																										
      ,''																																										
      ,'0'																																										
      ,'10/10/2010'																																										
      ,NULL																																										
      ,'F17'																																										
      ,@pNUMERO_FACTURA_NEW																																										
      ,'0'																																										
      ,'')																																										
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL CONFIG FACTURACION',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL CONFIG FACTURACION',@pNOMHOTEL_NEW,'OK');																																									
SET @ERROR = NULL



   
BEGIN TRY 																																										
INSERT INTO HOTEL_CONFIG_FACTURACION 																																										
      ([FK_CODIGOHOT]																																										
      ,[TIPO_SERIE]																																										
      ,[FK_TIPO_CLIENTE]																																										
      ,[FK_CODEMPRESA]																																										
      ,[FECHA_DESDE]																																										
      ,[FECHA_HASTA]																																										
      ,[SERIE]																																										
      ,[NUMFACTURA]																																										
      ,[CAMBIANDO]																																										
      ,[FK_TIPO_IMPRESION])																																										
VALUES (@pCOD_NEW																																										
      ,'A'																																										
      ,''																																										
      ,'0'																																										
      ,'10/10/2010'																																										
      ,NULL																																										
      ,'A17'																																										
      ,@pNUMERO_ABONO_NEW																																										
      ,'0'																																										
      ,'')																																										
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL CONFIG FACTURACION',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL CONFIG FACTURACION',@pNOMHOTEL_NEW,'OK');																																										
SET @ERROR = NULL



BEGIN TRY 																																										
INSERT INTO VALORES_DEFECTO																																										
      ([FORMULARIO]																																										
      ,[CONSTANTE]																																										
      ,[TIPO]																																										
      ,[VALOR]																																										
      ,[FK_CODIGOHOT])																																										
VALUES ('FRMNMRESERVAFRONT'																																										
      ,'CCODIGOCPXDEF'																																										
      ,'STRING'																																										
      ,@pTIPOLOGIA_DEFECTO_NEW_RESERVA																																										
      ,@pCOD_NEW)																																										
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR VALORES DEFECTO',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR VALORES DEFECTO',@pNOMHOTEL_NEW,'OK');																																											
SET @ERROR = NULL



BEGIN TRY 																																										
IF  @pTIENE_TASA = '1'   																																										
    BEGIN  																																										
    INSERT INTO HOTEL_TASA 																																										
      ([FK_CODIGOHOT]																																										
      ,[DESDE]																																										
      ,[HASTA]																																										
      ,[IMPORTE]																																										
      ,[PORC]																																										
      ,[CONCEPTO_TASA]																																										
      ,[POR_HAB]																																										
      ,[POR_PAX]																																										
      ,[POR_SRV]																																										
      ,[MAX_DIA_APLIC])																																										
VALUES (@pCOD_NEW																																										
      ,'01-01-2010'																																										
      ,NULL																																										
      ,@pIMPORTE_TAX																																										
      ,'0'																																										
      ,'TAX'																																										
      ,'1'																																										
      ,'1'																																										
      ,'1'																																										
      ,'7')																																										
																																										
END  																																										
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL TASA',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL TASA',@pNOMHOTEL_NEW,'OK');																																											
SET @ERROR = NULL





BEGIN TRY 																																										
INSERT INTO HOTEL_CONFIG_PLANNING																																										
       ([FK_CODIGOHOT]																																										
      ,[OUTOFORDER_DESC_MAXVENTA]																																										
      ,[OUTOFORDER_DESC_DISPO]																																										
      ,[BLOQUEADAS_DESC_DISPO]																																										
      ,[TARIFA_BASE_DISPO]																																										
      ,[VIS_OVERBOOKING]																																										
      ,[VIS_GARANTIA]																																										
      ,[BRUTO_SIN_DTO]																																										
	  ,[OVERBOOKING_SUMA_DISPO])																																									
VALUES (@pCOD_NEW																																										
      ,'1'																																										
      ,'0'																																										
      ,'0'																																										
      ,'BAR'																																										
      ,'1'																																										
      ,'0'																																										
      ,'0'																																										
	  ,'1')																																									
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL CONFIG PLANNING',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL CONFIG PLANNING',@pNOMHOTEL_NEW,'OK');																																											
SET @ERROR = NULL




BEGIN TRY																																										
INSERT INTO  HOTEL_CONFIG_DESGLOSE																																										
      ([FK_CODIGOHOT]																																										
      ,[PORC_HAB]																																										
      ,[PORC_PEN]																																										
      ,[FIJO_HAB]																																										
      ,[FIJO_PEN])																																										
VALUES (@pCOD_NEW																																										
      ,'0'																																										
      ,'100'																																										
      ,'0'																																										
      ,'0')																																										
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL CONFIG DESGLOSE',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL CONFIG DESGLOSE',@pNOMHOTEL_NEW,'OK');	
SET @ERROR = NULL




BEGIN TRY 																																										
INSERT INTO HOTEL_CONFIG_CIERRE_PROCESOS																																										
      ([FK_CODIGOHOT]																																										
      ,[FK_CODPROCESO]																																										
      ,[ORDEN]																																										
      ,[ACTIVO])																																										
VALUES (@pCOD_NEW	,'SPCIE0'	,'0'	,'1'	),																																						
       (@pCOD_NEW	,'SPCIE1'	,'10'	,'1'	),																																						
       (@pCOD_NEW	,'SPCIE10'	,'170'	,'0'	),																																						
       (@pCOD_NEW	,'SPCIE11'	,'120'	,'1'	),																																						
       (@pCOD_NEW	,'SPCIE12'	,'130'	,'1'	),																																						
       (@pCOD_NEW	,'SPCIE13'	,'30'	,'1'	),																																						
       (@pCOD_NEW	,'SPCIE2'	,'20'	,'1'	),																																						
       (@pCOD_NEW	,'SPCIE20'	,'110'	,'0'	),																																						
       (@pCOD_NEW	,'SPCIE3'	,'40'	,'1'	),																																						
       (@pCOD_NEW	,'SPCIE30'	,'180'	,'1'	),																																						
       (@pCOD_NEW	,'SPCIE4'	,'50'	,'1'	),																																						
       (@pCOD_NEW	,'SPCIE40'	,'190'	,'0'	),																																						
       (@pCOD_NEW	,'SPCIE5'	,'60'	,'1'	),																																						
       (@pCOD_NEW	,'SPCIE50'	,'185'	,'1'	),																																						
       (@pCOD_NEW	,'SPCIE6'	,'70'	,'1'	),																																						
       (@pCOD_NEW	,'SPCIE7'	,'90'	,'1'	),																																						
       (@pCOD_NEW	,'SPCIE8'	,'100'	,'0'	),																																						
       (@pCOD_NEW	,'SPCIE9'	,'80'	,'1'	),																																						
       (@pCOD_NEW	,'SPCIEPRE01'	,'10'	,'1'	),																																						
       (@pCOD_NEW	,'SPCIEPRE02'	,'10'	,'1'	)																																						
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR CONFIG CIERRE PROCESOS',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL CIERRE PROCESOS',@pNOMHOTEL_NEW,'OK');																																										
SET @ERROR = NULL

																																										
																																									
BEGIN TRY																																										
INSERT INTO HOTEL_CONFIG_INFORMES_OCUPACION																																										
      ([FK_CODIGOHOT]																																										
      ,[CODINFORME]																																										
      ,[DESCRIPCION])																																										
VALUES (@pCOD_NEW	,'ANTELACION'	,'ANTELACION RESERVA'	),																																							
       (@pCOD_NEW	,'OCUPADAS'	,'OCUPADAS'	),																																							
       (@pCOD_NEW	,'EVOLUCION'	,'EVOLUCION'	),																																							
       (@pCOD_NEW	,'OCUPADAS_TENT'	,'OCUPADAS + TENTATIVAS'	),																																							
       (@pCOD_NEW	,'PORC_OCUP'	,'PORCENTAJE OCUPACION'	),																																							
       (@pCOD_NEW	,'PRECIO_MEDIO'	,'PRECIO MEDIO'	),																																							
	   (@pCOD_NEW	,'PRECIO_VENTA'	,'PRECIO VENTA'),																																							
       (@pCOD_NEW	,'REVPAR'	,'REVPAR'	)																																							
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR INFORME OCUPACION',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR INFORME OCUPACION',@pNOMHOTEL_NEW,'OK');																																											
SET @ERROR = NULL



																																									
BEGIN TRY 																																										
INSERT INTO HOTEL_CONFIG_INFORMES_OCUPACION_RANGO																																										
      ([FK_CODIGOHOT]																																										
      ,[FK_CODINFORME]																																										
      ,[RANGO]																																										
      ,[VALOR_MIN]																																										
      ,[VALOR_MAX]																																										
      ,[LEYENDA]																																										
      ,[COLOR])																																										
VALUES (@pCOD_NEW	,'ANTELACION'	,'0'	,'-90'	,'9'	,'0-9 DIAS'	,'$00FF0000'	),																																			
       (@pCOD_NEW	,'ANTELACION'	,'1'	,'10'	,'20'	,'10-20  DIAS'	,'$00FF0000'	),																																			
       (@pCOD_NEW	,'ANTELACION'	,'2'	,'21'	,'30'	,'21-30 DIAS'	,'$00FF0000'	),																																			
       (@pCOD_NEW	,'ANTELACION'	,'3'	,'31'	,'89'	,'31-89  DIAS'	,'$00FF0000'	),																																			
       (@pCOD_NEW	,'ANTELACION'	,'4'	,'90'	,'300'	,'90-300 DIAS'	,'$00FF0000'	),																																			
       (@pCOD_NEW	,'EVOLUCION'	,'0'	,'50'	,'1000'	,'> 50'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'EVOLUCION'	,'1'	,'20'	,'49'	,'> 20'	,'$007FD4B1'	),																																			
       (@pCOD_NEW	,'EVOLUCION'	,'2'	,'3'	,'19'	,'> 3'	,'$0084EBFF'	),																																			
       (@pCOD_NEW	,'EVOLUCION'	,'3'	,'1'	,'2'	,'> 0'	,'$007CC0FD'	),																																			
       (@pCOD_NEW	,'EVOLUCION'	,'4'	,'-1000'	,'-0.5'	,'< 0'	,'$007495FB'	),																																			
       (@pCOD_NEW	,'EVOLUCION'	,'255'	,'0'	,'0'	,'0'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'OCUPADAS'	,'0'	,'-100'	,'18'	,'< 18'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'OCUPADAS'	,'1'	,'19'	,'30'	,'< 30'	,'$007FD4B1'	),																																			
       (@pCOD_NEW	,'OCUPADAS'	,'2'	,'31'	,'48'	,'< 48'	,'$0084EBFF'	),																																			
       (@pCOD_NEW	,'OCUPADAS'	,'3'	,'49'	,'66'	,'< 66'	,'$007CC0FD'	),																																			
       (@pCOD_NEW	,'OCUPADAS'	,'4'	,'67'	,'84'	,'< 84'	,'$007495FB'	),																																			
       (@pCOD_NEW	,'OCUPADAS'	,'5'	,'85'	,'96'	,'< 96'	,'$006B69F8'	),																																			
       (@pCOD_NEW	,'OCUPADAS'	,'6'	,'97'	,'108'	,'< 108'	,'$006B69F8'	),																																			
       (@pCOD_NEW	,'OCUPADAS'	,'7'	,'109'	,'1000'	,'> 108'	,'$006B69F8'	),																																			
       (@pCOD_NEW	,'OCUPADAS_TENT'	,'0'	,'-100'	,'18'	,'< 18'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'OCUPADAS_TENT'	,'1'	,'19'	,'30'	,'< 30'	,'$007FD4B1'	),																																			
       (@pCOD_NEW	,'OCUPADAS_TENT'	,'2'	,'31'	,'48'	,'< 48'	,'$0084EBFF'	),																																			
       (@pCOD_NEW	,'OCUPADAS_TENT'	,'3'	,'49'	,'66'	,'< 66'	,'$007CC0FD'	),																																			
       (@pCOD_NEW	,'OCUPADAS_TENT'	,'4'	,'67'	,'84'	,'< 84'	,'$007495FB'	),																																			
       (@pCOD_NEW	,'OCUPADAS_TENT'	,'5'	,'85'	,'96'	,'< 96'	,'$006B69F8'	),																																			
       (@pCOD_NEW	,'OCUPADAS_TENT'	,'6'	,'97'	,'108'	,'< 108'	,'$006B69F8'	),																																			
       (@pCOD_NEW	,'OCUPADAS_TENT'	,'7'	,'109'	,'1000'	,'> 108'	,'$006B69F8'	),																																			
       (@pCOD_NEW	,'PORC_OCUP'	,'0'	,'-10'	,'15'	,'< 15%'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PORC_OCUP'	,'1'	,'15.01'	,'25'	,'< 25%'	,'$007FD4B1'	),																																			
       (@pCOD_NEW	,'PORC_OCUP'	,'2'	,'25.01'	,'40'	,'< 40%'	,'$0084EBFF'	),																																			
       (@pCOD_NEW	,'PORC_OCUP'	,'3'	,'40.01'	,'55'	,'< 55%'	,'$007CC0FD'	),																																			
       (@pCOD_NEW	,'PORC_OCUP'	,'4'	,'55.01'	,'70'	,'< 70%'	,'$007495FB'	),																																			
       (@pCOD_NEW	,'PORC_OCUP'	,'5'	,'70.01'	,'80'	,'< 80%'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PORC_OCUP'	,'6'	,'80.01'	,'90'	,'< 90%'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PORC_OCUP'	,'7'	,'90.01'	,'150'	,'> 90%'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_MEDIO'	,'0'	,'-100'	,'200000'	,'< 10000'	,'$006B69F8'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'0'	,'-999'	,'119'	,'T 0119'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'1'	,'119.01'	,'134'	,'T 0134'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'2'	,'134.01'	,'149'	,'T 0149'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'3'	,'149.01'	,'164'	,'T 0164'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'4'	,'164.01'	,'179'	,'T 0179'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'5'	,'179.01'	,'194'	,'T 0194'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'6'	,'194.01'	,'209'	,'T 0209'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'7'	,'209.01'	,'224'	,'T 0224'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'8'	,'224.01'	,'239'	,'T 0239'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'9'	,'239.01'	,'254'	,'T 0254'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'10'	,'254.01'	,'269'	,'T 0269'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'11'	,'269.01'	,'284'	,'T 0284'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'12'	,'284.01'	,'299'	,'T 0299'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'13'	,'299.01'	,'314'	,'T 0314'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'14'	,'314.01'	,'329'	,'T 0329'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'15'	,'329.01'	,'344'	,'T 0344'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'16'	,'344.01'	,'359'	,'T 0359'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'17'	,'359.01'	,'374'	,'T 0374'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'18'	,'374.01'	,'389'	,'T 0389'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'19'	,'389.01'	,'404'	,'T 0404'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'20'	,'404.01'	,'419'	,'T 0419'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'21'	,'419.01'	,'434'	,'T 0434'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'22'	,'434.01'	,'449'	,'T 0449'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'23'	,'449.01'	,'464'	,'T 0464'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'24'	,'464.01'	,'479'	,'T 0479'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'25'	,'479.01'	,'494'	,'T 0494'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'26'	,'494.01'	,'509'	,'T 0509'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'27'	,'509.01'	,'524'	,'T 0524'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'28'	,'524.01'	,'539'	,'T 0539'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'29'	,'539.01'	,'554'	,'T 0554'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'30'	,'554.01'	,'569'	,'T 0569'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'31'	,'569.01'	,'584'	,'T 0584'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'32'	,'584.01'	,'599'	,'T 0599'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'33'	,'599.01'	,'614'	,'T 0614'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'34'	,'614.01'	,'629'	,'T 0629'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'35'	,'629.01'	,'644'	,'T 0644'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'36'	,'644.01'	,'659'	,'T 0659'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'37'	,'659.01'	,'674'	,'T 0674'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'38'	,'674.01'	,'689'	,'T 0689'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'39'	,'689.01'	,'704'	,'T 0704'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'40'	,'704.01'	,'719'	,'T 0719'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'41'	,'719.01'	,'734'	,'T 0734'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'42'	,'734.01'	,'749'	,'T 0749'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'43'	,'749.01'	,'764'	,'T 0764'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'44'	,'764.01'	,'779'	,'T 0779'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'45'	,'779.01'	,'794'	,'T 0794'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'46'	,'794.01'	,'809'	,'T 0809'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'47'	,'809.01'	,'824'	,'T 0824'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'48'	,'824.01'	,'839'	,'T 0839'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'49'	,'839.01'	,'854'	,'T 0854'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'50'	,'854.01'	,'869'	,'T 0869'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'51'	,'869.01'	,'884'	,'T 0884'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'52'	,'884.01'	,'899'	,'T 0899'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'53'	,'899.01'	,'914'	,'T 0914'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'54'	,'914.01'	,'929'	,'T 0929'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'55'	,'929.01'	,'944'	,'T 0944'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'56'	,'944.01'	,'959'	,'T 0959'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'57'	,'959.01'	,'974'	,'T 0974'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'58'	,'974.01'	,'989'	,'T 0989'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'59'	,'989.01'	,'1004'	,'T 1004'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'60'	,'1004.01'	,'1019'	,'T 1019'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'61'	,'1019.01'	,'1034'	,'T 1034'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'62'	,'1034.01'	,'1049'	,'T 1049'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'63'	,'1049.01'	,'1064'	,'T 1064'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'64'	,'1064.01'	,'1079'	,'T 1079'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'65'	,'1079.01'	,'1094'	,'T 1094'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'66'	,'1094.01'	,'1109'	,'T 1109'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'67'	,'1109.01'	,'1124'	,'T 1124'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'68'	,'1124.01'	,'1139'	,'T 1139'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'69'	,'1139.01'	,'1154'	,'T 1154'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'70'	,'1154.01'	,'1169'	,'T 1169'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'71'	,'1169.01'	,'1184'	,'T 1184'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'72'	,'1184.01'	,'1199'	,'T 1199'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'73'	,'1199.01'	,'1214'	,'T 1214'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'74'	,'1214.01'	,'1229'	,'T 1229'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'75'	,'1229.01'	,'1244'	,'T 1244'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'76'	,'1244.01'	,'1259'	,'T 1259'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'77'	,'1259.01'	,'1274'	,'T 1274'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'78'	,'1274.01'	,'1289'	,'T 1289'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'79'	,'1289.01'	,'1304'	,'T 1304'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'80'	,'1304.01'	,'1319'	,'T 1319'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'81'	,'1319.01'	,'1334'	,'T 1334'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'82'	,'1334.01'	,'1349'	,'T 1349'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'83'	,'1349.01'	,'1364'	,'T 1364'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'84'	,'1364.01'	,'1379'	,'T 1379'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'85'	,'1379.01'	,'1394'	,'T 1394'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'86'	,'1394.01'	,'1409'	,'T 1409'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'87'	,'1409.01'	,'1424'	,'T 1424'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'88'	,'1424.01'	,'1439'	,'T 1439'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'89'	,'1439.01'	,'1454'	,'T 1454'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'90'	,'1454.01'	,'1469'	,'T 1469'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'91'	,'1469.01'	,'1484'	,'T 1484'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'92'	,'1484.01'	,'1499'	,'T 1499'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'93'	,'1499.01'	,'1514'	,'T 1514'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'94'	,'1514.01'	,'1529'	,'T 1529'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'95'	,'1529.01'	,'1544'	,'T 1544'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'96'	,'1544.01'	,'1559'	,'T 1559'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'97'	,'1559.01'	,'1574'	,'T 1574'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'98'	,'1574.01'	,'1589'	,'T 1589'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'99'	,'1589.01'	,'1604'	,'T 1604'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'100'	,'1604.01'	,'1619'	,'T 1619'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'101'	,'1619.01'	,'1634'	,'T 1634'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'102'	,'1634.01'	,'1649'	,'T 1649'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'103'	,'1649.01'	,'1664'	,'T 1664'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'104'	,'1664.01'	,'1679'	,'T 1679'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'105'	,'1679.01'	,'1694'	,'T 1694'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'106'	,'1694.01'	,'1709'	,'T 1709'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'107'	,'1709.01'	,'1724'	,'T 1724'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'108'	,'1724.01'	,'1739'	,'T 1739'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'109'	,'1739.01'	,'1754'	,'T 1754'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'110'	,'1754.01'	,'1769'	,'T 1769'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'111'	,'1769.01'	,'1784'	,'T 1784'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'112'	,'1784.01'	,'1799'	,'T 1799'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'113'	,'1799.01'	,'1814'	,'T 1814'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'114'	,'1814.01'	,'1829'	,'T 1829'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'115'	,'1829.01'	,'1844'	,'T 1844'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'116'	,'1844.01'	,'1859'	,'T 1859'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'117'	,'1859.01'	,'1874'	,'T 1874'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'118'	,'1874.01'	,'1889'	,'T 1889'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'119'	,'1889.01'	,'1904'	,'T 1904'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'120'	,'1904.01'	,'1919'	,'T 1919'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'121'	,'1919.01'	,'1934'	,'T 1934'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'122'	,'1934.01'	,'1949'	,'T 1949'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'123'	,'1949.01'	,'1964'	,'T 1964'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'124'	,'1964.01'	,'1979'	,'T 1979'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'125'	,'1979.01'	,'1994'	,'T 1994'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'126'	,'1994.01'	,'2009'	,'T 2009'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'127'	,'2009.01'	,'2024'	,'T 2024'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'128'	,'2024.01'	,'2039'	,'T 2039'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'129'	,'2039.01'	,'2054'	,'T 2054'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'130'	,'2054.01'	,'2069'	,'T 2069'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'131'	,'2069.01'	,'2084'	,'T 2084'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'132'	,'2084.01'	,'2099'	,'T 2099'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'133'	,'2099.01'	,'2114'	,'T 2114'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'134'	,'2114.01'	,'2129'	,'T 2129'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'135'	,'2129.01'	,'2144'	,'T 2144'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'136'	,'2144.01'	,'2159'	,'T 2159'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'137'	,'2159.01'	,'2174'	,'T 2174'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'138'	,'2174.01'	,'2189'	,'T 2189'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'139'	,'2189.01'	,'2204'	,'T 2204'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'140'	,'2204.01'	,'2219'	,'T 2219'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'141'	,'2219.01'	,'2234'	,'T 2234'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'142'	,'2234.01'	,'2249'	,'T 2249'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'143'	,'2249.01'	,'2264'	,'T 2264'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'144'	,'2264.01'	,'2279'	,'T 2279'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'145'	,'2279.01'	,'2294'	,'T 2294'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'146'	,'2294.01'	,'2309'	,'T 2309'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'147'	,'2309.01'	,'2324'	,'T 2324'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'148'	,'2324.01'	,'2339'	,'T 2339'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'149'	,'2339.01'	,'2354'	,'T 2354'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'150'	,'2354.01'	,'2369'	,'T 2369'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'151'	,'2369.01'	,'2384'	,'T 2384'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'152'	,'2384.01'	,'2399'	,'T 2399'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'153'	,'2399.01'	,'2414'	,'T 2414'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'154'	,'2414.01'	,'2429'	,'T 2429'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'155'	,'2429.01'	,'2444'	,'T 2444'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'156'	,'2444.01'	,'2459'	,'T 2459'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'157'	,'2459.01'	,'2474'	,'T 2474'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'158'	,'2474.01'	,'2489'	,'T 2489'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'159'	,'2489.01'	,'2504'	,'T 2504'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'160'	,'2504.01'	,'2519'	,'T 2519'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'161'	,'2519.01'	,'2534'	,'T 2534'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'162'	,'2534.01'	,'2549'	,'T 2549'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'163'	,'2549.01'	,'2564'	,'T 2564'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'164'	,'2564.01'	,'2579'	,'T 2579'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'165'	,'2579.01'	,'2594'	,'T 2594'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'166'	,'2594.01'	,'2609'	,'T 2609'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'167'	,'2609.01'	,'2624'	,'T 2624'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'168'	,'2624.01'	,'2639'	,'T 2639'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'169'	,'2639.01'	,'2654'	,'T 2654'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'170'	,'2654.01'	,'2669'	,'T 2669'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'171'	,'2669.01'	,'2684'	,'T 2684'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'172'	,'2684.01'	,'2699'	,'T 2699'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'173'	,'2699.01'	,'2714'	,'T 2714'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'174'	,'2714.01'	,'2729'	,'T 2729'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'175'	,'2729.01'	,'2744'	,'T 2744'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'176'	,'2744.01'	,'2759'	,'T 2759'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'177'	,'2759.01'	,'2774'	,'T 2774'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'178'	,'2774.01'	,'2789'	,'T 2789'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'179'	,'2789.01'	,'2804'	,'T 2804'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'180'	,'2804.01'	,'2819'	,'T 2819'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'181'	,'2819.01'	,'2834'	,'T 2834'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'182'	,'2834.01'	,'2849'	,'T 2849'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'183'	,'2849.01'	,'2864'	,'T 2864'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'184'	,'2864.01'	,'2879'	,'T 2879'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'185'	,'2879.01'	,'2894'	,'T 2894'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'186'	,'2894.01'	,'2909'	,'T 2909'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'187'	,'2909.01'	,'2924'	,'T 2924'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'188'	,'2924.01'	,'2939'	,'T 2939'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'189'	,'2939.01'	,'2954'	,'T 2954'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'190'	,'2954.01'	,'2969'	,'T 2969'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'191'	,'2969.01'	,'2984'	,'T 2984'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'192'	,'2984.01'	,'2999'	,'T 2999'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'193'	,'2999.01'	,'3014'	,'T 3014'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'194'	,'3014.01'	,'3029'	,'T 3029'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'195'	,'3029.01'	,'3044'	,'T 3044'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'196'	,'3044.01'	,'3059'	,'T 3059'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'197'	,'3059.01'	,'3074'	,'T 3074'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'198'	,'3074.01'	,'3089'	,'T 3089'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'199'	,'3089.01'	,'3104'	,'T 3104'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'200'	,'3104.01'	,'3119'	,'T 3119'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'201'	,'3119.01'	,'3134'	,'T 3134'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'202'	,'3134.01'	,'3149'	,'T 3149'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'203'	,'3149.01'	,'3164'	,'T 3164'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'204'	,'3164.01'	,'3179'	,'T 3179'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'205'	,'3179.01'	,'3194'	,'T 3194'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'206'	,'3194.01'	,'3209'	,'T 3209'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'207'	,'3209.01'	,'3224'	,'T 3224'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'208'	,'3224.01'	,'3239'	,'T 3239'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'209'	,'3239.01'	,'3254'	,'T 3254'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'210'	,'3254.01'	,'3269'	,'T 3269'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'211'	,'3269.01'	,'3284'	,'T 3284'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'212'	,'3284.01'	,'3299'	,'T 3299'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'213'	,'3299.01'	,'3314'	,'T 3314'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'214'	,'3314.01'	,'3329'	,'T 3329'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'215'	,'3329.01'	,'3344'	,'T 3344'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'216'	,'3344.01'	,'3359'	,'T 3359'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'217'	,'3359.01'	,'3374'	,'T 3374'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'218'	,'3374.01'	,'3389'	,'T 3389'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'219'	,'3389.01'	,'3404'	,'T 3404'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'220'	,'3404.01'	,'3419'	,'T 3419'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'221'	,'3419.01'	,'3434'	,'T 3434'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'222'	,'3434.01'	,'3449'	,'T 3449'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'223'	,'3449.01'	,'3464'	,'T 3464'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'224'	,'3464.01'	,'3479'	,'T 3479'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'225'	,'3479.01'	,'3494'	,'T 3494'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'226'	,'3494.01'	,'3509'	,'T 3509'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'PRECIO_VENTA'	,'227'	,'3509.01'	,'1000000'	,'T >3509'	,'$007BBE63'	),																																			
       (@pCOD_NEW	,'REVPAR'	,'0'	,'-10'	,'1000'	,'< 10000'	,'$006B69F8'	)																																			
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
    INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL INFORMES RANGO',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL INFORMES RANGO',@pNOMHOTEL_NEW,'OK');																																											
SET @ERROR = NULL




BEGIN TRY																																										
--INSERT INTO HOTEL_NIVELES																																										
--      ([CODIGOHOT]																																										
--      ,[CODNIVEL]																																										
--      ,[DESCRIPCION]																																										
--      ,[COD_DESCRIPCION]																																										
--      ,[FK_CODNIVEL_PADRE]																																										
--      ,[ORDERID]																																										
--      ,[ORDEN]																																										
--      ,[ISDEF]																																										
--      ,[IMPRIMIR])																																										
--VALUES (@pCOD_NEW	,''	,'< Sin Asignar >'	,NULL	,''	,'0'	,'0'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'$CDIA'	,'CUADRE DIA'	,NULL	,''	,'0'	,'2000'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'$TCC'	,'TOTAL CLIENTES CASA'	,NULL	,'$CDIA'	,'0'	,'2800'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'$TCCA'	,'TOTAL CLIENTES CASA ANT.'	,NULL	,'$CDIA'	,'0'	,'2100'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'$TCOB'	,'TOTAL COBRADO'	,NULL	,'$CDIA'	,'0'	,'2500'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'$TDEP'	,'TOTAL DEPOSITOS'	,NULL	,'$CDIA'	,'0'	,'2600'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'$TDTO'	,'TOTAL DTO/COMISIÓN'	,NULL	,'$CDIA'	,'0'	,'2300'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'$TFAN'	,'TOTAL FACTURACIÓN ANT.'	,NULL	,'$CDIA'	,'0'	,'2700'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'$TIVA'	,'TOTAL IMPUESTO'	,NULL	,'$CDIA'	,'0'	,'2400'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'$TPRO'	,'TOTAL PRODUCCIÓN'	,NULL	,'$CDIA'	,'0'	,'2200'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'*CYD'	,'COMISIONES Y DESCUENTOS'	,NULL	,''	,'0'	,'1003'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'*EST'	,'ESTADISTICA'	,NULL	,'*REO'	,'0'	,'1002'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'*OCU'	,'OCUPACIÓN'	,NULL	,'*REO'	,'0'	,'1001'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'*REO'	,'RESUMEN OCUPACIÓN'	,NULL	,''	,'0'	,'1000'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'*THAB'	,'TOTAL HABITACIONES'	,NULL	,''	,'0'	,'1001'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'ALO'	,'ALOJAMIENTO'	,NULL	,''	,'0'	,'100'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'ANT'	,'ANTICIPOS'	,NULL	,'NP'	,'0'	,'640'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'AUD'	,'AUDIOVISUALES'	,NULL	,'CYE'	,'0'	,'421'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'AYB'	,'F&B'	,NULL	,''	,'0'	,'200'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'BANQ'	,'BANQUETES'	,NULL	,'AYB'	,'0'	,'204'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'BANSAL'	,'BANQUETES - SALON'	,NULL	,'CYE'	,'0'	,'500'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'BAR'	,'BAR - CAFETERIA'	,NULL	,'AYB'	,'0'	,'203'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'BARTER'	,'BAR - TERRAZA'	,NULL	,'AYB'	,'0'	,'202'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'BRASSA'	,'BRASSERIE -ALMUERZO'	,NULL	,'AYB'	,'0'	,'300'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'BRASSC'	,'BRASSERIE -CENA'	,NULL	,'AYB'	,'0'	,'400'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'BSAL'	,'BANQUETES SALON'	,NULL	,'AYB'	,'0'	,'220'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'COCK'	,'COCKTAIL'	,NULL	,'AYB'	,'0'	,'208'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'COFF'	,'COFFE BREAK'	,NULL	,'AYB'	,'0'	,'209'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'CTEL'	,'COMUNICACIONES'	,NULL	,'OTR'	,'0'	,'525'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'CYE'	,'ALQUILERES'	,NULL	,''	,'0'	,'400'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'DEP'	,'DEPOSITOS'	,NULL	,'NP'	,'0'	,'650'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'DES'	,'DESAYUNO'	,NULL	,'AYB'	,'0'	,'200'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'DYC'	,'DESCUENTOS Y COMISIONES'	,NULL	,'NP'	,'0'	,'630'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'FIT'	,'FITNESS'	,NULL	,'OTR'	,'0'	,'501'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'HAB'	,'HABITACIÓN'	,NULL	,'ALO'	,'0'	,'110'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'LAV'	,'LAVANDERIA'	,NULL	,'OTR'	,'0'	,'530'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'MIN'	,'MINIBAR'	,NULL	,'AYB'	,'0'	,'250'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'NP'	,'ESPECIALES'	,NULL	,''	,'0'	,'600'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'OTR'	,'OTROS INGRESOS'	,NULL	,''	,'0'	,'500'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'PAQ'	,'PAQUETE'	,NULL	,''	,'0'	,'1000'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'PARK'	,'PARKING'	,NULL	,'OTR'	,'0'	,'520'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'PEN'	,'PENSIONES'	,NULL	,'AYB'	,'0'	,'225'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'PPV'	,'PAY PER VIEW'	,NULL	,'OTR'	,'0'	,'510'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'RES'	,'RESTAURACIÓN'	,NULL	,'AYB'	,'0'	,'205'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'RESC'	,'CONVENCIONES'	,NULL	,'AYB'	,'0'	,'207'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'RESTA'	,'RESTAURANTE'	,NULL	,'AYB'	,'0'	,'206'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'ROOM'	,'ROOM SERVICE'	,NULL	,'AYB'	,'0'	,'208'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'SAL'	,'SALONES'	,NULL	,'CYE'	,'0'	,'420'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'SWING'	,'BAR - SWING'	,NULL	,'AYB'	,'0'	,'201'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'TAX'	,'TASAS'	,NULL	,'NP'	,'0'	,'620'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'TBA'	,'TERRAZA - BAR'	,NULL	,'AYB'	,'0'	,'202'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'VAR'	,'VARIOS'	,NULL	,'OTR'	,'0'	,'540'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'VNP'	,'VARIOS NO PRODUCTIVOS'	,NULL	,'NP'	,'0'	,'610'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'VRHB'	,'VARIOS HABITACIÓN'	,NULL	,'ALO'	,'0'	,'120'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'VRSL'	,'VARIOS SALÓN'	,NULL	,'CYE'	,'0'	,'422'	,'0'	,'1'	),																																	
--       (@pCOD_NEW	,'WIFIP'	,'WIFIPOCKET'	,NULL	,'OTR'	,'0'	,'503'	,'0'	,'1'	)				

INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,''	,'< Sin Asignar >'	,NULL	,''	,'0'	,'0'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'$CDIA'	,'CUADRE DIA'	,NULL	,''	,'0'	,'2000'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'$TCC'	,'TOTAL CLIENTES CASA'	,NULL	,'$CDIA'	,'0'	,'2800'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'$TCCA'	,'TOTAL CLIENTES CASA ANT.'	,NULL	,'$CDIA'	,'0'	,'2100'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'$TCOB'	,'TOTAL COBRADO'	,NULL	,'$CDIA'	,'0'	,'2500'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'$TDEP'	,'TOTAL DEPOSITOS'	,NULL	,'$CDIA'	,'0'	,'2600'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'$TDTO'	,'TOTAL DTO/COMISIÓN'	,NULL	,'$CDIA'	,'0'	,'2300'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'$TFAN'	,'TOTAL FACTURACIÓN ANT.'	,NULL	,'$CDIA'	,'0'	,'2700'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'$TIVA'	,'TOTAL IMPUESTO'	,NULL	,'$CDIA'	,'0'	,'2400'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'$TNPRO'	,'TOTAL NO PRODUCTIVO'	,NULL	,'$CDIA'	,'0'	,'2250'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'$TPRO'	,'TOTAL PRODUCCIÓN'	,NULL	,'$CDIA'	,'0'	,'2200'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'*CYD'	,'COMISIONES Y DESCUENTOS'	,NULL	,''	,'0'	,'1003'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'*EST'	,'ESTADISTICA'	,NULL	,'*REO'	,'0'	,'1002'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'*OCU'	,'OCUPACIÓN'	,NULL	,'*REO'	,'0'	,'1001'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'*REO'	,'RESUMEN OCUPACIÓN'	,NULL	,''	,'0'	,'1000'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'*THAB'	,'TOTAL HABITACIONES'	,NULL	,''	,'0'	,'1001'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'ALO'	,'ALOJAMIENTO'	,NULL	,''	,'0'	,'100'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'ANT'	,'ANTICIPOS'	,NULL	,'NP'	,'0'	,'640'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'AUD'	,'AUDIOVISUALES'	,NULL	,'CYE'	,'0'	,'421'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'AYB'	,'F&B'	,NULL	,''	,'0'	,'200'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'BANQ'	,'BANQUETES'	,NULL	,'AYB'	,'0'	,'204'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'BANSAL'	,'BANQUETES - SALON'	,NULL	,'CYE'	,'0'	,'500'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'BAR'	,'BAR - CAFETERIA'	,NULL	,'AYB'	,'0'	,'203'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'BARTER'	,'BAR - TERRAZA'	,NULL	,'AYB'	,'0'	,'202'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'BRASSA'	,'BRASSERIE -ALMUERZO'	,NULL	,'AYB'	,'0'	,'300'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'BRASSC'	,'BRASSERIE -CENA'	,NULL	,'AYB'	,'0'	,'400'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'BSAL'	,'BANQUETES SALON'	,NULL	,'AYB'	,'0'	,'220'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'COCK'	,'COCKTAIL'	,NULL	,'AYB'	,'0'	,'208'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'COFF'	,'COFFE BREAK'	,NULL	,'AYB'	,'0'	,'209'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'CTEL'	,'COMUNICACIONES'	,NULL	,'OTR'	,'0'	,'525'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'CYE'	,'ALQUILERES'	,NULL	,''	,'0'	,'400'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'DEP'	,'DEPOSITOS'	,NULL	,'NP'	,'0'	,'650'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'DES'	,'DESAYUNO'	,NULL	,'AYB'	,'0'	,'200'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'DYC'	,'DESCUENTOS Y COMISIONES'	,NULL	,'NP'	,'0'	,'630'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'ES'	,'ESPECIALES'	,NULL	,'NP'	,'0'	,'600'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'FIT'	,'FITNESS'	,NULL	,'OTR'	,'0'	,'501'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'HAB'	,'HABITACIÓN'	,NULL	,'ALO'	,'0'	,'110'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'LAV'	,'LAVANDERIA'	,NULL	,'OTR'	,'0'	,'530'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'MIN'	,'MINIBAR'	,NULL	,'AYB'	,'0'	,'250'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'NP'	,'ESPECIALES'	,'0'	,''	,'0'	,'600'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'OTR'	,'OTROS INGRESOS'	,NULL	,''	,'0'	,'500'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'PAQ'	,'PAQUETE'	,NULL	,''	,'0'	,'1000'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'PARK'	,'PARKING'	,NULL	,'OTR'	,'0'	,'520'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'PEN'	,'PENSIONES'	,NULL	,'AYB'	,'0'	,'225'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'PPV'	,'PAY PER VIEW'	,NULL	,'OTR'	,'0'	,'510'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'RES'	,'RESTAURACIÓN'	,NULL	,'AYB'	,'0'	,'205'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'RESC'	,'CONVENCIONES'	,NULL	,'AYB'	,'0'	,'207'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'RESTA'	,'RESTAURANTE'	,NULL	,'AYB'	,'0'	,'206'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'ROOM'	,'ROOM SERVICE'	,NULL	,'AYB'	,'0'	,'208'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'SAL'	,'SALONES'	,NULL	,'CYE'	,'0'	,'420'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'SWING'	,'BAR - SWING'	,NULL	,'AYB'	,'0'	,'201'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'TAX'	,'TASAS'	,NULL	,'NP'	,'0'	,'620'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'TBA'	,'TERRAZA - BAR'	,NULL	,'AYB'	,'0'	,'202'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'VAR'	,'VARIOS'	,NULL	,'OTR'	,'0'	,'540'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'VNP'	,'VARIOS NO PRODUCTIVOS'	,NULL	,'NP'	,'0'	,'610'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'VRHB'	,'VARIOS HABITACIÓN'	,NULL	,'ALO'	,'0'	,'120'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'VRSL'	,'VARIOS SALÓN'	,NULL	,'CYE'	,'0'	,'422'	,'0'	,'1')
INSERT INTO HOTEL_NIVELES VALUES(	@pCOD_NEW	,'WIFIP'	,'WIFIPOCKET'	,NULL	,'OTR'	,'0'	,'503'	,'0'	,'1')


																													
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL NIVELES',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL NIVELES',@pNOMHOTEL_NEW,'OK');																																										
SET @ERROR = NULL



	   /*CREAMOS NIVELES DE SISTEMA STANDARD*/																																									
        /* DA DUPLICADOS DE MOMENTO OUT */
/*INSERT INTO HOTEL_CONCSPRODUC_INFORMES																																										
      ([CODIGOHOT]																																										
      ,[CODIGOCP]																																										
      ,[CODINFORME]																																										
      ,[PAGINA]																																										
      ,[VISIBLE]																																										
      ,[CALCULAR]																																										
      ,[OCUPACION]																																										
      ,[INGRESO]																																										
      ,[MULTIPLICA])																																										
VALUES  (@pCOD_NEW	,'$ALO'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'$AM'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$AMEX'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$AMM'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$ANPA'	,'99'	,'6'	,'1'	,'1'	,'0'	,'0'	,'-1'	),																																	
       (@pCOD_NEW	,'$ANTI'	,'99'	,'6'	,'1'	,'1'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$ANTR'	,'99'	,'6'	,'1'	,'1'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$AYB'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'$BANQ'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'$CAJA1'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$CAJA2'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$CBAN'	,'0'	,'3'	,'0'	,'0'	,'0'	,'0'	,'0'	),																																	
       (@pCOD_NEW	,'$CBAN'	,'0'	,'4'	,'0'	,'0'	,'0'	,'0'	,'0'	),																																	
       (@pCOD_NEW	,'$CBAN'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'0'	),																																	
       (@pCOD_NEW	,'$CBAR'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$CCAF'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$CCMD'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$CCMI'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'0'	),																																	
       (@pCOD_NEW	,'$CCMN'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'0'	),																																	
       (@pCOD_NEW	,'$CDES'	,'0'	,'3'	,'0'	,'0'	,'0'	,'0'	,'0'	),																																	
       (@pCOD_NEW	,'$CDES'	,'0'	,'4'	,'0'	,'0'	,'0'	,'0'	,'0'	),																																	
       (@pCOD_NEW	,'$CDES'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'0'	),																																	
       (@pCOD_NEW	,'$CDTO'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$CH'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$CLC'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'0'	),																																	
       (@pCOD_NEW	,'$CLCA'	,'0'	,'3'	,'0'	,'0'	,'0'	,'0'	,'0'	),																																	
       (@pCOD_NEW	,'$CLCA'	,'0'	,'4'	,'0'	,'0'	,'0'	,'0'	,'0'	),																																	
       (@pCOD_NEW	,'$CLCA'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'$CR'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$CRE'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$CRES'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$CYE'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'$DE'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$DEP'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$DI'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$DIM'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$DIN'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$DP'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'$EF'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$EFEC'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$FACF'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'$FANC'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'$FNCA'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$HAB'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$IVA'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$IVA0'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'$IVA1'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'$IVA2'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'$IVA3'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'$JCB'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$JCBM'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$KUTXA'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$MAE'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$MC'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$MCM'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$NP'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'$OTR'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'$PFA'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$SW'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$SWM'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$TR'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$VI'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$VIM'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'$VIS*'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),																																	
       (@pCOD_NEW	,'$VISA'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'*BLOQ'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*CLX'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*COMD'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'-1'	),																																	
       (@pCOD_NEW	,'*COMI'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'0'	),																																	
       (@pCOD_NEW	,'*COMN'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'0'	),																																	
       (@pCOD_NEW	,'*CSH'	,'99'	,'5'	,'1'	,'1'	,'0'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*DTO'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'-1'	),																																	
       (@pCOD_NEW	,'*GRA'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*LLEG'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*MAX'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*NSE'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*NSP'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*OCP'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*OTR'	,'99'	,'5'	,'1'	,'1'	,'0'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*OUT'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*RAP'	,'99'	,'5'	,'1'	,'1'	,'0'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*SAL'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*SCP'	,'99'	,'5'	,'1'	,'1'	,'0'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*UCS'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*USO'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
       (@pCOD_NEW	,'*VIP'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),																																	
	   (@pCOD_NEW	,'IVA0'	,'99'	,'1'	,'1'	,'1'	,'0'	,'0'	,'1'	),																																
       (@pCOD_NEW	,'IVA0'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'IVA0'	,'99'	,'3'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'IVA0'	,'99'	,'4'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'IVA1'	,'99'	,'1'	,'1'	,'1'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'IVA1'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'IVA1'	,'99'	,'3'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'IVA1'	,'99'	,'4'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'IVA2'	,'99'	,'1'	,'1'	,'1'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'IVA2'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'IVA2'	,'99'	,'3'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'IVA2'	,'99'	,'4'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'IVA3'	,'99'	,'1'	,'1'	,'1'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'IVA3'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'IVA3'	,'99'	,'3'	,'0'	,'0'	,'0'	,'0'	,'1'	),																																	
       (@pCOD_NEW	,'IVA3'	,'99'	,'4'	,'0'	,'0'	,'0'	,'0'	,'1'	)																																	
*/																																										
BEGIN TRY																																									
INSERT INTO RELCONCSPRODUC ([CODIGOHOT]																																										
      ,[CODIGOCP]																																										
      ,[DESCRIPCION]																																										
      ,[CODIGOREL]																																										
      ,[NUM_HABS]																																										
      ,[COD_DESCRIPCION_FACTURA]																																										
      ,[ORDEN]																																										
      ,[DESC_INGLES]																																										
      ,[DESC_FRANCES]																																										
      ,[DESC_ALEMAN]																																										
      ,[ESTADO_GESTION_WEB]																																										
      ,[COD_DESCRIPCION]																																										
      ,[DESGLOSE]																																										
      ,[FK_CODTIPOHAB]																																										
      ,[FK_CODNIVEL]																																										
      ,[FK_CODGRUPO_CONCEPTO]																																										
      ,[FK_CODCLASIF_CONCEPTO]																																										
      ,[CONTENIDO]																																										
      ,[PRECIOX]																																										
      ,[TIPO_IVA_HOTEL]																																										
      ,[FK_TIPO_FOLIO_DEFECTO]																																										
      ,[CUENTA_CONTABLE]																																										
      ,[CENTRO_COSTE]																																										
      ,[CUENTA_ANALITICA]																																										
      ,[CP_VENTA]																																										
      ,[CP_PRODUCCION]																																										
      ,[AFECTA_CAJA]																																										
      ,[FK_CODTIPO_CONCEPTO]																																										
      ,[TIPO_CARGO]																																										
      ,[DURACION]																																										
      ,[SISTEMA]																																										
      ,[CODIGOPMS]																																										
      ,[FK_ID_CODCOBRO]																																										
      ,[CP_DETALLE]																																										
      ,[CP_COBRO_ELECTRONICO]																																										
      ,[CP_EDITABLE]																																										
      ,[CP_DIVISIBLE]																																										
      ,[FK_GRUPO_OCUPACION]																																										
      ,[ANULADO]																																										
      ,[CP_ELIMINABLE]																																										
      ,[CP_DESGLOSAENRESERVA]																																										
      ,[CP_COMISIONABLE])																																										
VALUES (@pCOD_NEW																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,'D'																																										
      ,'0'																																										
      ,'0'																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,'0'																																										
      ,'S'																																										
      ,'0'																																										
      ,'P'																																										
      ,''																																										
      ,''																																										
      ,''																																										
      ,'0'																																										
      ,'0'																																										
      ,''																																										
      ,'C'																																										
      ,'1'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'0'																																										
      ,'1'																																										
      ,'1'																																										
      ,'1'																																										
      ,NULL																																										
      ,'1'																																										
      ,'0'																																										
      ,'0'																																										
      ,'1')																																										
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL CONCEPTO VACIO',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL CONCEPTO VACIO',@pNOMHOTEL_NEW,'OK');	
SET @ERROR = NULL


--DECLARE @CONCEPTOS TABLE  (OLDCODIGOCP VARCHAR (20))

--INSERT INTO @CONCEPTOS 
--SELECT CODIGOCP FROM CONCSPRODUC 

-- SELECT * FROM INSTALACION_LOG_ERROR




BEGIN TRY 																																										
																																										
--('TRASH'	,'TRASPASO HAB'	,'HAB'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*DTO'	,'Descuentos'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$DTO'	,'Descuentos'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$ANTI'	,'ANTICIPOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$ANPA'	,'ANTICIPOS APLICADOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$AMEX'	,'AMEX'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$AYB'	,'F&B'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$BANQ'	,'CONVENCIONESS Y EVENTOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$CLC'	,'CLIENTES CASA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$CLCA'	,'CLIENTES CASA ANT.'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$COMD'	,'Comisiones Deducidas'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$COMI'	,'Comisiones Intermediario'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$COMN'	,'Comisioness NO Deducidas'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$CRE'	,'CREDITO'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$DIN'	,'DINERS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$DP'	,'DEPÓSITOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$EFEC'	,'EFECTIVO'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$FACF'	,'FACTURACIÓN ANTICIPADA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$HAB'	,'HABITACIÓN'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$IVA0'	,'IVA 10%'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$IVA1'	,'IVA 21%'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$IVA2'	,'IVA %'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$IVA3'	,'IVA %'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$MAE'	,'MAESTRO'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$NP'	,'NO PRODUCTIVOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$OTR'	,'OTROS INGRESOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$PFA'	,'PROD.COBRADA ANTICIPADA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$TRAN'	,'TRANSFERENCIA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$VISA'	,'VISA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*BLOQ'	,'BLOQUEADES'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*CLX'	,'CANCELACIONES'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*COMD'	,'Comisioness Deducidas'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*COMI'	,'Comisiones Intermediario'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*COMN'	,'Comisiones NO Deducidas'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*CSH'	,'CLIENTES SIN HAB.'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*GRA'	,'GRATUITADES'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*LLEG'	,'LLEGADAS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*MAX'	,'MAX.DISPONIBLES'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*NSE'	,'NO SHOW'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*NSP'	,'NO SHOW FACT.'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*OCP'	,'OCUPADAS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*OTR'	,'OTROS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*OUT'	,'OUT ORDER'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*RAP'	,'RAPPELS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*SAL'	,'SALIDAS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*SCP'	,'SUP.OCUPADAS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*UCS'	,'USO CASA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*USO'	,'USO DIURNO'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('*VIP'	,'CLIENTES VIP'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('BEB'	,'Bebida'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('COM'	,'Comida'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'1'	,''	,'1'	,'1'	),																
--('IMP'	,'Impuesto'	,'OTR'	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('IVA0'	,'IVA Tipo 0'	,'OTR'	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('IVA1'	,'IVA Tipo 1'	,'OTR'	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'1'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('IVA2'	,'IVA Tipo 2'	,'OTR'	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'2'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('IVA3'	,'IVA Tipo 3'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'3'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('OTR'	,'Otros'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'1'	,''	,'1'	,'1'	),																
--('SVC'	,'Servicio'	,'OTR'	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'1'	,''	,'1'	,'1'	),																
--('$ALO'	,'ALOJAMIENTO'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TPRO'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$AM'	,'AMEX'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$AMM'	,'AMEX MANUAL'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$CBAN'	,'CONTADOS BANQUETE'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$CBAR'	,'CONTADOS BAR'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$CCAF'	,'CONTADOS CAFETERIA'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$CCMD'	,'COMISIONES DEDUCIDAS'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TDTO'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$CCMI'	,'COMISIONES INTERMEDIARIO'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TDTO'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$CCMN'	,'COMISIONESS NO DEDUCIDAS'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TDTO'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$CDES'	,'CONTADOS DESAYUNO'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$CDTO'	,'DESCUENTOS'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TDTO'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$CR'	,'CREDITO'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$CRES'	,'CONTADOS RESTAURANTE'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$CYE'	,'CONVENCIONES Y EVENTOS'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TPRO'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$DE'	,'DEPÓSITO'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('TRAS'	,'TRASPASO'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),																
--('$DI'	,'DINERS'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$DIM'	,'DINERS MANUAL'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$EF'	,'EFECTIVO'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$FANC'	,'PROD.ANTICIPADA NO COBRADA'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCC'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$FNCA'	,'PROD.ANT.NO COBRADA ANT.'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCC'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$IVA'	,'Cambio IVA'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$JCB'	,'JCB'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$JCBM'	,'JCB MANUAL'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$MC'	,'MASTERCARD'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$MCM'	,'MASTERCARD MANUAL'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$SW'	,'SWITCH'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$SWM'	,'SWITCH MANUAL'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$TR'	,'TRANSFERENCIA'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$VI'	,'VISA'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$VIM'	,'VISA MANUAL'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$VIS*'	,'VISA Sitef'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('*CCMD'	,'COMISIONES DEDUCIDAS'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'*CYD'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('*CCMI'	,'COMISIONES INTERMEDIARIO'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'*CYD'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('*CCMN'	,'COMISIONES NO DEDUCIDAS'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'*CYD'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('*CDTO'	,'DESCUENTOS'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'*CYD'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$CAJA1'	,'CAJA1'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),																
--('$CAJA2'	,'CAJA2'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	)	

IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='IVA0')BEGIN INSERT INTO CONCSPRODUC VALUES(	'IVA0'	,'IVA Tipo 0'	,'IMP'	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='IVA1')BEGIN INSERT INTO CONCSPRODUC VALUES(	'IVA1'	,'IVA Tipo 1'	,'IMP'	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'1'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*DTO')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*DTO'	,'Descuentos'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$DTO')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$DTO'	,'Descuentos'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$ANTI')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$ANTI'	,'ANTICIPOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$ANPA')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$ANPA'	,'ANTICIPOS APLICADOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$TGOUR')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$TGOUR'	,'TICKET GOURMET'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$AMEX')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$AMEX'	,'AMEX'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$AYB')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$AYB'	,'F&B'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$BANQ')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$BANQ'	,'CONVENCIONESS Y EVENTOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$CLC')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$CLC'	,'CLIENTES CASA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$CLCA')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$CLCA'	,'CLIENTES CASA ANT.'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$COMD')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$COMD'	,'Comisiones Deducidas'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$COMI')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$COMI'	,'Comisiones Intermediario'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$COMN')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$COMN'	,'Comisioness NO Deducidas'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$CRE')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$CRE'	,'CREDITO'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$DIN')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$DIN'	,'DINERS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$DP')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$DP'	,'DEPÓSITOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$EFEC')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$EFEC'	,'EFECTIVO'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$FACF')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$FACF'	,'FACTURACIÓN ANTICIPADA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$HAB')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$HAB'	,'HABITACIÓN'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$IVA0')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$IVA0'	,'IVA 10%'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$IVA1')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$IVA1'	,'IVA 21%'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$IVA2')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$IVA2'	,'IVA %'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$IVA3')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$IVA3'	,'IVA %'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$MAE')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$MAE'	,'MAESTRO'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$NP')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$NP'	,'NO PRODUCTIVOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$OTR')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$OTR'	,'OTROS INGRESOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$PFA')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$PFA'	,'PROD.COBRADA ANTICIPADA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$TRAN')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$TRAN'	,'TRANSFERENCIA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$VISA')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$VISA'	,'VISA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*BLOQ')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*BLOQ'	,'BLOQUEADES'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*CLX')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*CLX'	,'CANCELACIONES'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*COMD')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*COMD'	,'Comisioness Deducidas'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*COMI')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*COMI'	,'Comisiones Intermediario'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*COMN')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*COMN'	,'Comisiones NO Deducidas'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*CSH')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*CSH'	,'CLIENTES SIN HAB.'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*GRA')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*GRA'	,'GRATUITADES'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*LLEG')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*LLEG'	,'LLEGADAS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*MAX')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*MAX'	,'MAX.DISPONIBLES'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*NSE')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*NSE'	,'NO SHOW'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*NSP')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*NSP'	,'NO SHOW FACT.'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*OCP')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*OCP'	,'OCUPADAS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*OTR')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*OTR'	,'OTROS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*OUT')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*OUT'	,'OUT ORDER'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*RAP')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*RAP'	,'RAPPELS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*SAL')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*SAL'	,'SALIDAS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*SCP')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*SCP'	,'SUP.OCUPADAS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*UCS')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*UCS'	,'USO CASA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*USO')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*USO'	,'USO DIURNO'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='*VIP')BEGIN INSERT INTO CONCSPRODUC VALUES(	'*VIP'	,'CLIENTES VIP'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='IVA2')BEGIN INSERT INTO CONCSPRODUC VALUES(	'IVA2'	,'IVA Tipo 2'	,'IMP'	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'2'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='IVA3')BEGIN INSERT INTO CONCSPRODUC VALUES(	'IVA3'	,'IVA Tipo 3'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'3'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$OT')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$OT'	,'OTROS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$CH')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$CH'	,'CHEQUE'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$DEPP')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$DEPP'	,'DEPÓSITOS PENDIENTES APLICAR ANTERIOR'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,'$TDEP'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$DEPPA')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$DEPPA'	,'DEPÓSITOS PENDIENTES APLICAR ANTERIOR'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,'$TDEP'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$CAJAR')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$CAJAR'	,'CAJA REGALO'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$MC')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$MC'	,'MASTERCARD'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END
IF NOT EXISTS ( SELECT CODIGOCP FROM CONCSPRODUC WHERE CODIGOCP ='$RET')BEGIN INSERT INTO CONCSPRODUC VALUES(	'$RET'	,'RETENCION'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1') END


															
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR CONCEPTOS SISTEMA',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR CONCEPTOS SISTEMA',@pNOMHOTEL_NEW,'OK');																																										
SET @ERROR = NULL

																																										
																																										
BEGIN TRY 																																										
INSERT INTO RELCONCSPRODUC 																																									
VALUES																																										

(@pCOD_NEW	,'$ALO'	,'ALOJAMIENTO'	,'$HAB'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TPRO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$AM'	,'AMEX'	,'$AMEX'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$AMEX'	,'AMEX'	,'$AMEX'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$AMM'	,'AMEX MANUAL'	,'$AMEX'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$ANPA'	,'ANTICIPOS APLICADOS'	,'$ANPA'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDEP'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$ANTI'	,'ANTICIPOS'	,'$ANTI'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDEP'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$AYB'	,'F&B'	,'$AYB'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TPRO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$BANQ'	,'CONVENCIONESS Y EVENTOS'	,'$BANQ'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TPRO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$CAJAR'	,'CREDITO'	,'$CAJAR'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$CBAN'	,'CONTADOS BANQUETE'	,'$EFEC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$CBAR'	,'CONTADOS BAR'	,'$EFEC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$CCAF'	,'CONTADOS CAFETERIA'	,'$EFEC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$CCMD'	,'COMISIONES DEDUCIDAS'	,'$COMD'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDTO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$CCMI'	,'COMISIONES INTERMEDIARIO'	,'$COMI'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDTO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$CCMN'	,'COMISIONESS NO DEDUCIDAS'	,'$COMN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDTO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$CDES'	,'CONTADOS DESAYUNO'	,'$EFEC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$CDTO'	,'DESCUENTOS'	,'$DTO'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDTO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$CLC'	,'CLIENTES CASA'	,'$CLC'	,'0'	,'0'	,'20'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCC'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$CLCA'	,'CLIENTES CASA ANT.'	,'$CLCA'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCCA'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$COMD'	,'COMISIONES DEDUCIDAS'	,'$COMD'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDTO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$COMI'	,'COMISIONES INTERMEDIARIO'	,'$COMI'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDTO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$COMN'	,'COMISIONESS NO DEDUCIDAS'	,'$COMN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDTO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$CR'	,'CREDITO'	,'$CRE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$CRE'	,'CREDITO'	,'$CRE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$CRES'	,'CONTADOS RESTAURANTE'	,'$EFEC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$CYE'	,'CONVENCIONES Y EVENTOS'	,'$BANQ'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TPRO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$DE'	,'DEPÓSITO'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$DI'	,'DINERS'	,'$DIN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$DIM'	,'DINERS MANUAL'	,'$DIN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$DIN'	,'DINERS'	,'$DIN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$DP'	,'DEPÓSITOS'	,'$DP'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$DTO'	,'DESCUENTOS'	,'$DTO'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$EF'	,'EFECTIVO'	,'$EFEC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$EFEC'	,'EFECTIVO'	,'$EFEC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$FACF'	,'FACTURACIÓN ANTICIPADA'	,'$FACF'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TFAN'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$FANC'	,'PROD.ANTICIPADA NO COBRADA'	,'$CLC'	,'0'	,'0'	,'10'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCC'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$FNCA'	,'PROD.ANT.NO COBRADA ANT.'	,'$CLC'	,'0'	,'0'	,'15'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCC'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$HAB'	,'HABITACIÓN'	,'$HAB'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TPRO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$IVA'	,'Cambio IVA'	,'$TRAN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$IVA0'	,'IVA 10%'	,'$IVA0'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TIVA'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$IVA1'	,'IVA 21%'	,'$IVA1'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TIVA'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$IVA2'	,'IVA %'	,'$IVA2'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TIVA'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$IVA3'	,'IVA %'	,'$IVA3'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TIVA'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$JCB'	,'JCB'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$JCBM'	,'JCB MANUAL'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$MAE'	,'MAESTRO'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$MC'	,'MASTERCARD'	,'$MC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$MCM'	,'MASTERCARD MANUAL'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$NP'	,'NO PRODUCTIVOS'	,'$NP'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TNPRO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$OT'	,'OTROS'	,'$OT'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$OTR'	,'OTROS INGRESOS'	,'$OTR'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TPRO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$PFA'	,'PROD.COBRADA ANTICIPADA'	,'$PFA'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TFAN'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$RET'	,'RETENCION'	,'$RET'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$SW'	,'SWITCH'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$SWM'	,'SWITCH MANUAL'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$TR'	,'TRANSFERENCIA'	,'$TRAN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$VI'	,'VISA'	,'$VISA'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$VIM'	,'VISA MANUAL'	,'$VISA'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$VIS*'	,'VISA Sitef'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'$VISA'	,'VISA'	,'$VISA'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*BLOQ'	,'BLOQUEADES'	,'*BLOQ'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*CCMD'	,'COMISIONES DEDUCIDAS'	,'*COMD'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*CCMI'	,'COMISIONES INTERMEDIARIO'	,'*COMI'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*CCMN'	,'COMISIONES NO DEDUCIDAS'	,'*COMN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*CDTO'	,'DESCUENTOS'	,'*DTO'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*CLX'	,'CANCELACIONES'	,'*CLX'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*COMD'	,'COMISIONESS DEDUCIDAS'	,'*COMD'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*COMI'	,'COMISIONES INTERMEDIARIO'	,'*COMI'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*COMN'	,'COMISIONES NO DEDUCIDAS'	,'*COMN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*CSH'	,'CLIENTES SIN HAB.'	,'*CSH'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*DTO'	,'DESCUENTOS'	,'*DTO'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*GRA'	,'GRATUITADES'	,'*GRA'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*LLEG'	,'LLEGADAS'	,'*LLEG'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*MAX'	,'MAX.DISPONIBLES'	,'*MAX'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*NSE'	,'NO SHOW'	,'*NSE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*NSP'	,'NO SHOW FACT.'	,'*NSP'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*OCP'	,'OCUPADAS'	,'*OCP'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*OTR'	,'OTROS'	,'*OTR'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*OUT'	,'OUT ORDER'	,'*OUT'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*RAP'	,'RAPPELS'	,'*RAP'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*SAL'	,'SALIDAS'	,'*SAL'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*SCP'	,'SUP.OCUPADAS'	,'*SCP'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*UCS'	,'USO CASA'	,'*UCS'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*USO'	,'USO DIURNO'	,'*USO'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'*VIP'	,'CLIENTES VIP'	,'*VIP'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'IVA0'	,'IVA TIPO 0'	,'IVA0'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,''	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'IVA1'	,'IVA TIPO 1'	,'IVA1'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,''	,' '	,' '	,'0'	,'H'	,'1'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'IVA2'	,'IVA TIPO 2'	,'IVA2'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,''	,' '	,' '	,'0'	,'H'	,'2'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0'),
(@pCOD_NEW	,'IVA3'	,'IVA TIPO 3'	,'IVA3'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,''	,' '	,' '	,'0'	,'H'	,'3'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	,'0')





END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL CONC SIST',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR HOTEL CONC SIST',@pNOMHOTEL_NEW,'OK');																																									
SET @ERROR = NULL


/*
--solo si hace falta crear las políticas de cancelación
BEGIN TRY 																																										
INSERT INTO MPOLITICA 																																										
      ([CODIGOHOT]																																										
      ,[DESCRIPCION]																																										
      ,[CODLANGCON]																																										
      ,[TIPO]																																										
      ,[ORDEN_APLICACION]																																										
      ,[NO_REEMBOLSABLE]																																										
      ,[GARANTIA_PMS]																																										
      ,[CANCELACION_PMS]																																										
      ,[CODIGOEXT])																																										
VALUES 																																										
      (NULL	,'SIN GASTO 24H'	,'7380'	,'C'	,'10'	,'0'	,'24H'	,'1N'	,'24H'	),																																	
      (NULL	,'SIN GASTO 48H'	,'7381'	,'C'	,'20'	,'0'	,'48H'	,'2N'	,'48H'	),																																	
      (NULL	,'SIN GASTO 72H'	,'7382'	,'C'	,'30'	,'0'	,'72H'	,'3N'	,'72H'	),																																	
      (NULL	,'SIN GASTO 7 DIAS'	,'7383'	,'C'	,'40'	,'0'	,'7D'	,'7DIA'	,'7D'	),																																	
      (NULL	,'NO REEMBOLSABLE'	,'7384'	,'C'	,'50'	,'1'	,'PREP'	,'NORF'	,'NORF'	),																																	
      (NULL	,'SIN GARANTIZAR'	,'7389'	,'C'	,'60'	,'0'	,'17H'	,'17H'	,'SING'	),																																	
      (NULL	,'GRUPOS'	,'0'	,'C'	,'100'	,'0'	,'GRP'	,'GRP'	,'GRP'	)																																	
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR POLITICAS',@pNOMHOTEL_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@pCOD_NEW,'CREAR POLITICAS',@pNOMHOTEL_NEW,'OK');	
SET @ERROR = NULL
*/

/******Script de Garrido*******/
END
END
