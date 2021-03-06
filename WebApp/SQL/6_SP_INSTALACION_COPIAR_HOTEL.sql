

CREATE PROCEDURE [dbo].[SP_INSTALACION_COPIAR_HOTEL]
/*
*****SCRIPT DE GARRIDO 29/09/2017*****
*/
	@COD_NEW varchar (3),
     @COD_OLD varchar (3),
	@CONCEPTODEF INT ,
	@ERROR VARCHAR (200) OUTPUT		

AS
IF @COD_OLD = ''
BEGIN

BEGIN TRY
 
DELETE FROM HOTEL_NIVELES WHERE CODIGOHOT = @COD_NEW AND CODNIVEL NOT IN (SELECT DISTINCT (FK_CODNIVEL) FROM RELCONCSPRODUC WHERE CODIGOHOT=@COD_NEW)
INSERT INTO HOTEL_NIVELES (CODIGOHOT, CODNIVEL, DESCRIPCION, COD_DESCRIPCION, FK_CODNIVEL_PADRE, ORDERID, ORDEN, ISDEF, IMPRIMIR) VALUES -- (@COD_NEW	,''	,''	,'0'	,''	,'0'	,'0'	,'False'	,'True'	)
 (@COD_NEW	,'$CDIA'	,'CUADRE DIA'	,'0'	,''	,'0'	,'2000'	,'False'	,'True'	)	
, (	@COD_NEW	,'$TCC'	,'TOTAL CLIENTES CASA'	,'0'	,'$CDIA'	,'0'	,'2800'	,'False'	,'True'	)	
, (	@COD_NEW	,'$TCCA'	,'TOTAL CLIENTES CASA ANT.'	,'0'	,'$CDIA'	,'0'	,'2100'	,'False'	,'True'	)	
, (	@COD_NEW	,'$TCOB'	,'TOTAL COBRADO'	,'0'	,'$CDIA'	,'0'	,'2500'	,'False'	,'True'	)	
, (	@COD_NEW	,'$TDEP'	,'TOTAL DEPOSITOS'	,'0'	,'$CDIA'	,'0'	,'2600'	,'False'	,'True'	)	
, (	@COD_NEW	,'$TDTO'	,'TOTAL DTO/COMISIÓN'	,'0'	,'$CDIA'	,'0'	,'2300'	,'False'	,'True'	)	
, (	@COD_NEW	,'$TFAN'	,'TOTAL FACTURACIÓN ANT.'	,'0'	,'$CDIA'	,'0'	,'2700'	,'False'	,'True'	)	
, (	@COD_NEW	,'$TIVA'	,'TOTAL IMPUESTO'	,'0'	,'$CDIA'	,'0'	,'2400'	,'False'	,'True'	)	
, (	@COD_NEW	,'$TPRO'	,'TOTAL PRODUCCIÓN'	,'0'	,'$CDIA'	,'0'	,'2200'	,'False'	,'True'	)	
, (	@COD_NEW	,'*CYD'	,'COMISIONES Y DESCUENTOS'	,'1'	,''	,'0'	,'1003'	,'False'	,'True'	)	
, (	@COD_NEW	,'*EST'	,'ESTADISTICA'	,'1'	,'*REO'	,'0'	,'1002'	,'False'	,'True'	)	
, (	@COD_NEW	,'*OCU'	,'OCUPACIÓN'	,'1'	,'*REO'	,'0'	,'1001'	,'False'	,'True'	)	
, (	@COD_NEW	,'*REO'	,'RESUMEN OCUPACIÓN'	,'1'	,''	,'0'	,'1000'	,'False'	,'True'	)	
, (	@COD_NEW	,'*THAB'	,'TOTAL HABITACIONES'	,'1'	,''	,'0'	,'1001'	,'False'	,'True'	)	
, (	@COD_NEW	,'ALO'	,'ALOJAMIENTO'	,'0'	,''	,'0'	,'100'	,'False'	,'True'	)	
, (	@COD_NEW	,'ANT'	,'ANTICIPOS'	,'0'	,'NP'	,'0'	,'640'	,'False'	,'True'	)	
, (	@COD_NEW	,'AUD'	,'AUDIOVISUALES'	,'0'	,'CYE'	,'0'	,'430'	,'False'	,'True'	)	
, (	@COD_NEW	,'AYB'	,'F&B'	,'0'	,''	,'0'	,'200'	,'False'	,'True'	)	
, (	@COD_NEW	,'BAR'	,'BAR - CAFETERIA'	,'0'	,'AYB'	,'0'	,'210'	,'False'	,'True'	)	
, (	@COD_NEW	,'COFF'	,'COFFE BREAK'	,'0'	,'CYE'	,'0'	,'415'	,'False'	,'True'	)	
, (	@COD_NEW	,'CTEL'	,'COMUNICACIONES'	,'0'	,'OTR'	,'0'	,'525'	,'False'	,'True'	)	
, (	@COD_NEW	,'CYE'	,'CONVENCIONES Y EVENTOS'	,'0'	,''	,'0'	,'400'	,'False'	,'True'	)	
, (	@COD_NEW	,'DEP'	,'DEPOSITOS'	,'0'	,'NP'	,'0'	,'650'	,'False'	,'True'	)	
, (	@COD_NEW	,'DES'	,'DESAYUNO'	,'0'	,'AYB'	,'0'	,'220'	,'False'	,'True'	)	
, (	@COD_NEW	,'DYC'	,'DESCUENTOS Y COMISIONES'	,'0'	,'NP'	,'0'	,'630'	,'False'	,'True'	)	
, (	@COD_NEW	,'HAB'	,'HABITACIÓN'	,'0'	,'ALO'	,'0'	,'110'	,'False'	,'True'	)	
, (	@COD_NEW	,'LAV'	,'LAVANDERIA'	,'0'	,'OTR'	,'0'	,'530'	,'False'	,'True'	)	
, (	@COD_NEW	,'MIN'	,'MINIBAR'	,'0'	,'AYB'	,'0'	,'230'	,'False'	,'True'	)	
, (	@COD_NEW	,'NP'	,'ESPECIALES'	,'0'	,''	,'0'	,'600'	,'False'	,'True'	)	
, (	@COD_NEW	,'OTR'	,'OTROS INGRESOS'	,'0'	,''	,'0'	,'500'	,'False'	,'True'	)	
, (	@COD_NEW	,'PAQ'	,'PAQUETE'	,'0'	,''	,'0'	,'1000'	,'False'	,'True'	)	
, (	@COD_NEW	,'PARK'	,'PARKING'	,'0'	,'OTR'	,'0'	,'520'	,'False'	,'True'	)	
, (	@COD_NEW	,'PPV'	,'PAY PER VIEW'	,'0'	,'OTR'	,'0'	,'510'	,'False'	,'True'	)	
, (	@COD_NEW	,'RES'	,'RESTAURACIÓN'	,'0'	,'AYB'	,'0'	,'340'	,'False'	,'True'	)	
, (	@COD_NEW	,'RESC'	,'RESTAURANTE CONVENCIONES'	,'0'	,'CYE'	,'0'	,'410'	,'False'	,'True'	)	
, (	@COD_NEW	,'ROOM'	,'ROOM SERVICE'	,'0'	,'AYB'	,'0'	,'350'	,'False'	,'True'	)	
, (	@COD_NEW	,'SAL'	,'SALONES'	,'0'	,'CYE'	,'0'	,'420'	,'False'	,'True'	)	
, (	@COD_NEW	,'TAX'	,'TASAS'	,'0'	,'NP'	,'0'	,'620'	,'False'	,'True'	)	
, (	@COD_NEW	,'TBA'	,'TERRAZA - BAR'	,'0'	,'AYB'	,'0'	,'215'	,'False'	,'True'	)	
, (	@COD_NEW	,'VAR'	,'VARIOS'	,'0'	,'OTR'	,'0'	,'540'	,'False'	,'True'	)	
, (	@COD_NEW	,'VNP'	,'VARIOS NO PRODUCTIVOS'	,'0'	,'NP'	,'0'	,'610'	,'False'	,'True'	)	
, (	@COD_NEW	,'VRHB'	,'VARIOS HABITACIÓN'	,'0'	,'ALO'	,'0'	,'120'	,'False'	,'True'	)	
, (	@COD_NEW	,'VRSL'	,'VARIOS SALÓN'	,'0'	,'CYE'	,'0'	,'440'	,'False'	,'True'	)	
	

END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR HOTEL_NIVELES_0',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR HOTEL_NIVELES_0',@COD_NEW,'OK');																																										
SET @ERROR = NULL




BEGIN TRY 
INSERT INTO HOTEL_MODULO ([CODIGOHOT],[CODMODULO],[DESCRIPCION],[ORDEN],[SUPERFICIE],[LONGITUD],[ANCHURA],[ALTURA],[LUZNATUR],[VENTANAS],[AIREACON],[ENCHU220],[ENCHU380],[TOMASTV],[TOMASPC],[PUERANCHO],[PUERALTO],[PESOMAX],[PLANTA],[PERMITEOVER]) 
VALUES (	@COD_NEW	,''	,''	,'0'	,'0.000'	,'0.000'	,'0.000'	,'0.000'	,'0'	,'0'	,'0'	,'0'	,'0'	,'0'	,'0'	,'0.000'	,'0.000'	,'0'	,'0'	,'0'	)

END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR HOTEL_MODULO',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR HOTEL_MODULO',@COD_NEW,'OK');																																										
SET @ERROR = NULL

--SELECT * FROM concsproduc
   /*CONCEPTOS DE SISTEMA*/
BEGIN TRY
DELETE FROM CONCSPRODUC WHERE SISTEMA = 1
INSERT INTO CONCSPRODUC ([CODIGOCP],[DESCRIPCION],[FK_CONCEPTOSREPLIC],[CODIGOTIHA],[COD_DESCRIPCION_FACTURA],[PAX],[ESTADO_GESTION_WEB],[USO_FRECUENTE],[COD_DESCRIPCION],[FK_CODGRUPO_CONCEPTO],[FK_CODCLASIF_CONCEPTO],[FK_CODNIVEL],[ORDEN],[DESGLOSE],[CONTENIDO],[PRECIOX],[FK_TIPO_FOLIO_DEFECTO],[TIPO_IVA_HOTEL],[CUENTA_CONTABLE],[CENTRO_COSTE],[CUENTA_ANALITICA],[CP_VENTA],[CP_PRODUCCION],[AFECTA_CAJA],[DURACION],[SISTEMA]) VALUES 

('IVA0'	,'IVA Tipo 0'	,'OTR'	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('IVA1'	,'IVA Tipo 1'	,'OTR'	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'1'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*DTO'	,'Descuentos'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$DTO'	,'Descuentos'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$ANTI'	,'ANTICIPOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$ANPA'	,'ANTICIPOS APLICADOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$TGOUR'	,'TICKET GOURMET'	,'GEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,' '	,' '	,'$TCOB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'1'	),
('$AMEX'	,'AMEX'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$AYB'	,'F&B'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$BANQ'	,'CONVENCIONESS Y EVENTOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$CLC'	,'CLIENTES CASA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$CLCA'	,'CLIENTES CASA ANT.'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$COMD'	,'Comisiones Deducidas'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$COMI'	,'Comisiones Intermediario'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$COMN'	,'Comisioness NO Deducidas'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$CRE'	,'CREDITO'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$DIN'	,'DINERS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$DP'	,'DEPÓSITOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$EFEC'	,'EFECTIVO'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$FACF'	,'FACTURACIÓN ANTICIPADA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$HAB'	,'HABITACIÓN'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$IVA0'	,'IVA 10%'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$IVA1'	,'IVA 21%'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$IVA2'	,'IVA %'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$IVA3'	,'IVA %'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$MAE'	,'MAESTRO'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$NP'	,'NO PRODUCTIVOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$OTR'	,'OTROS INGRESOS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$PFA'	,'PROD.COBRADA ANTICIPADA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$TRAN'	,'TRANSFERENCIA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$VISA'	,'VISA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*BLOQ'	,'BLOQUEADES'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*CLX'	,'CANCELACIONES'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*COMD'	,'Comisioness Deducidas'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*COMI'	,'Comisiones Intermediario'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*COMN'	,'Comisiones NO Deducidas'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*CSH'	,'CLIENTES SIN HAB.'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*GRA'	,'GRATUITADES'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*LLEG'	,'LLEGADAS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*MAX'	,'MAX.DISPONIBLES'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*NSE'	,'NO SHOW'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*NSP'	,'NO SHOW FACT.'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*OCP'	,'OCUPADAS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*OTR'	,'OTROS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*OUT'	,'OUT ORDER'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*RAP'	,'RAPPELS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*SAL'	,'SALIDAS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*SCP'	,'SUP.OCUPADAS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*UCS'	,'USO CASA'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*USO'	,'USO DIURNO'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('*VIP'	,'CLIENTES VIP'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('IVA2'	,'IVA Tipo 2'	,'OTR'	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'2'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('IVA3'	,'IVA Tipo 3'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'3'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$OT'	,'OTROS'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$CAJAR'	,'CAJA REGALO'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$MC'	,'MASTERCARD'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	),
('$RET'	,'RETENCION'	,''	,''	,'0'	,'0'	,'D'	,'0'	,'0'	,''	,' '	,''	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'0'	,'0'	,''	,'1'	,'1'	)

END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CONC SISTEMA',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CONC SISTEMA',@COD_NEW,'OK');																																										
SET @ERROR = NULL

BEGIN TRY
DELETE FROM RELCONCSPRODUC WHERE CODIGOHOT = @COD_NEW
INSERT INTO RELCONCSPRODUC (CODIGOHOT,	CODIGOCP,	DESCRIPCION,	CODIGOREL,	NUM_HABS,	COD_DESCRIPCION_FACTURA,	ORDEN,	DESC_INGLES,	DESC_FRANCES,	DESC_ALEMAN,	ESTADO_GESTION_WEB,	COD_DESCRIPCION,	DESGLOSE,	FK_CODTIPOHAB,	FK_CODNIVEL,	FK_CODGRUPO_CONCEPTO,	FK_CODCLASIF_CONCEPTO,	CONTENIDO,	PRECIOX,	TIPO_IVA_HOTEL,	FK_TIPO_FOLIO_DEFECTO,	CUENTA_CONTABLE,	CENTRO_COSTE,	CUENTA_ANALITICA,	CP_VENTA,	CP_PRODUCCION,	AFECTA_CAJA,	FK_CODTIPO_CONCEPTO,	TIPO_CARGO,	DURACION,	SISTEMA,	CODIGOPMS,	FK_ID_CODCOBRO,	CP_DETALLE,	CP_COBRO_ELECTRONICO,	CP_EDITABLE,	CP_DIVISIBLE,	FK_GRUPO_OCUPACION,	TIPO_ESTADISTICA_OCUP,	ANULADO,	CP_ELIMINABLE,	CP_DESGLOSAENRESERVA,	CP_COMISIONABLE,	CAMBIAR_SIGNO) VALUES

(@COD_NEW	,'$ALO'	,'ALOJAMIENTO'	,'$HAB'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TPRO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$AM'	,'AMEX'	,'$AMEX'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$AMEX'	,'AMEX'	,'$AMEX'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$AMM'	,'AMEX MANUAL'	,'$AMEX'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$ANPA'	,'ANTICIPOS APLICADOS'	,'$ANPA'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDEP'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$ANTI'	,'ANTICIPOS'	,'$ANTI'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDEP'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$AYB'	,'F&B'	,'$AYB'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TPRO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$BANQ'	,'CONVENCIONESS Y EVENTOS'	,'$BANQ'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TPRO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$CAJAR'	,'CREDITO'	,'$CAJAR'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$CBAN'	,'CONTADOS BANQUETE'	,'$EFEC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$CBAR'	,'CONTADOS BAR'	,'$EFEC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$CCAF'	,'CONTADOS CAFETERIA'	,'$EFEC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$CCMD'	,'COMISIONES DEDUCIDAS'	,'$COMD'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDTO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$CCMI'	,'COMISIONES INTERMEDIARIO'	,'$COMI'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDTO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$CCMN'	,'COMISIONESS NO DEDUCIDAS'	,'$COMN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDTO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$CDES'	,'CONTADOS DESAYUNO'	,'$EFEC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$CDTO'	,'DESCUENTOS'	,'$DTO'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDTO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$CLC'	,'CLIENTES CASA'	,'$CLC'	,'0'	,'0'	,'20'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCC'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$CLCA'	,'CLIENTES CASA ANT.'	,'$CLCA'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCCA'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$COMD'	,'COMISIONES DEDUCIDAS'	,'$COMD'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDTO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$COMI'	,'COMISIONES INTERMEDIARIO'	,'$COMI'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDTO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$COMN'	,'COMISIONESS NO DEDUCIDAS'	,'$COMN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TDTO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$CR'	,'CREDITO'	,'$CRE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$CRE'	,'CREDITO'	,'$CRE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$CRES'	,'CONTADOS RESTAURANTE'	,'$EFEC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$CYE'	,'CONVENCIONES Y EVENTOS'	,'$BANQ'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TPRO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$DE'	,'DEPÓSITO'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$DI'	,'DINERS'	,'$DIN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$DIM'	,'DINERS MANUAL'	,'$DIN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$DIN'	,'DINERS'	,'$DIN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$DP'	,'DEPÓSITOS'	,'$DP'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$DTO'	,'DESCUENTOS'	,'$DTO'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$EF'	,'EFECTIVO'	,'$EFEC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$EFEC'	,'EFECTIVO'	,'$EFEC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$FACF'	,'FACTURACIÓN ANTICIPADA'	,'$FACF'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TFAN'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$FANC'	,'PROD.ANTICIPADA NO COBRADA'	,'$CLC'	,'0'	,'0'	,'10'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCC'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$FNCA'	,'PROD.ANT.NO COBRADA ANT.'	,'$CLC'	,'0'	,'0'	,'15'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCC'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$HAB'	,'HABITACIÓN'	,'$HAB'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TPRO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$IVA'	,'Cambio IVA'	,'$TRAN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$IVA0'	,'IVA 10%'	,'$IVA0'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TIVA'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$IVA1'	,'IVA 21%'	,'$IVA1'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TIVA'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$IVA2'	,'IVA %'	,'$IVA2'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TIVA'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$IVA3'	,'IVA %'	,'$IVA3'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TIVA'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$JCB'	,'JCB'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$JCBM'	,'JCB MANUAL'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$MAE'	,'MAESTRO'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$MC'	,'MASTERCARD'	,'$MC'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$MCM'	,'MASTERCARD MANUAL'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$NP'	,'NO PRODUCTIVOS'	,'$NP'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TPRO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$OT'	,'OTROS'	,'$OT'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$OTR'	,'OTROS INGRESOS'	,'$OTR'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TPRO'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$PFA'	,'PROD.COBRADA ANTICIPADA'	,'$PFA'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TFAN'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$RET'	,'RETENCION'	,'$RET'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$SW'	,'SWITCH'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$SWM'	,'SWITCH MANUAL'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$TR'	,'TRANSFERENCIA'	,'$TRAN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$VI'	,'VISA'	,'$VISA'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$VIM'	,'VISA MANUAL'	,'$VISA'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$VIS*'	,'VISA Sitef'	,'$MAE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'$VISA'	,'VISA'	,'$VISA'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'$TCOB'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*BLOQ'	,'BLOQUEADES'	,'*BLOQ'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*CCMD'	,'COMISIONES DEDUCIDAS'	,'*COMD'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*CCMI'	,'COMISIONES INTERMEDIARIO'	,'*COMI'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*CCMN'	,'COMISIONES NO DEDUCIDAS'	,'*COMN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*CDTO'	,'DESCUENTOS'	,'*DTO'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*CLX'	,'CANCELACIONES'	,'*CLX'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*COMD'	,'COMISIONESS DEDUCIDAS'	,'*COMD'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*COMI'	,'COMISIONES INTERMEDIARIO'	,'*COMI'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*COMN'	,'COMISIONES NO DEDUCIDAS'	,'*COMN'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*CSH'	,'CLIENTES SIN HAB.'	,'*CSH'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*DTO'	,'DESCUENTOS'	,'*DTO'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*CYD'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*GRA'	,'GRATUITADES'	,'*GRA'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*LLEG'	,'LLEGADAS'	,'*LLEG'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*MAX'	,'MAX.DISPONIBLES'	,'*MAX'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*NSE'	,'NO SHOW'	,'*NSE'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*NSP'	,'NO SHOW FACT.'	,'*NSP'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*OCP'	,'OCUPADAS'	,'*OCP'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*OTR'	,'OTROS'	,'*OTR'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*OUT'	,'OUT ORDER'	,'*OUT'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*RAP'	,'RAPPELS'	,'*RAP'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*SAL'	,'SALIDAS'	,'*SAL'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*SCP'	,'SUP.OCUPADAS'	,'*SCP'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*UCS'	,'USO CASA'	,'*UCS'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*USO'	,'USO DIURNO'	,'*USO'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*OCU'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'*VIP'	,'CLIENTES VIP'	,'*VIP'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,'*EST'	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'IVA0'	,'IVA TIPO 0'	,'IVA0'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,''	,' '	,' '	,'0'	,'H'	,'0'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'IVA1'	,'IVA TIPO 1'	,'IVA1'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,''	,' '	,' '	,'0'	,'H'	,'1'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'IVA2'	,'IVA TIPO 2'	,'IVA2'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,''	,' '	,' '	,'0'	,'H'	,'2'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	),
(@COD_NEW	,'IVA3'	,'IVA TIPO 3'	,'IVA3'	,'0'	,'0'	,'0'	,''	,''	,''	,'D'	,'0'	,'0'	,''	,''	,' '	,' '	,'0'	,'H'	,'3'	,'P'	,''	,''	,''	,'0'	,'0'	,''	,'C'	,'C'	,'1'	,'1'	,NULL	,NULL	,'0'	,'0'	,'1'	,'1'	,NULL	,NULL	,'0'	,'1'	,'0'	,'1'	,'0'	)



END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CONCEPTOS SISTEMA',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CONCEPTOS SISTEMA',@COD_NEW,'OK');																																										
SET @ERROR = NULL


   /*CONCEPTOS  EXCEPTO HABITACION*/
BEGIN TRY

INSERT INTO CONCSPRODUC ([CODIGOCP],[DESCRIPCION],[FK_CONCEPTOSREPLIC],[CODIGOTIHA],[COD_DESCRIPCION_FACTURA],[PAX],[ESTADO_GESTION_WEB],[USO_FRECUENTE],[COD_DESCRIPCION],[FK_CODGRUPO_CONCEPTO],[FK_CODCLASIF_CONCEPTO],[FK_CODNIVEL],[ORDEN],[DESGLOSE],[CONTENIDO],[PRECIOX],[FK_TIPO_FOLIO_DEFECTO],[TIPO_IVA_HOTEL],[CUENTA_CONTABLE],[CENTRO_COSTE],[CUENTA_ANALITICA],[CP_VENTA],[CP_PRODUCCION],[AFECTA_CAJA],[DURACION],[SISTEMA]) VALUES (	'SH'	,'SUPLEMENTO HABITACION'	,'HAB'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'HAB'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'NSH'	,'NO SHOW'	,'HAB'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'HAB'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'EARLY'	,'EARLY BOOKING'	,'HAB'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'HAB'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'LATE'	,'LATE CHECKOUT'	,'HAB'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'HAB'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'UP'	,'UPSELLING HAB'	,'HAB'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'HAB'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'CXL1'	,'CANCELACION 10%'	,'HAB'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'HAB'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'CUNA'	,'CUNA'	,'HAB'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'HAB'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'CEX'	,'CAMA EXTRA'	,'HAB'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'HAB'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'DEP2'	,'DEPOSITO 21%'	,'DEP'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'P'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'DPR'	,'DEPOSITO (Recibo)'	,'DEP'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'DEP1'	,'DEPOSITO 10%'	,'DEP'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'ANEF'	,'ANTICIPO EFECTIVO'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'ANVI'	,'ANTICIPO VISA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'ANAX'	,'ANTICIPO AMEX'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'ANTF'	,'ANTICIPO TRANSFERENCIA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'BRK'	,'DESAYUNO'	,'PEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'DEX'	,'DESAYUNO EXTRA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'RS'	,'ROOM SERVICE'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'MB'	,'MINIBAR'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'ALM'	,'ALMUERZO'	,'PEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'CEN'	,'CENA'	,'PEN'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'PC'	,'PENSION COMPLETA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'CAF'	,'CAFETERIA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'REA'	,'RESTAURANTE ALMUERZO CARTA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'REC'	,'RESTAURANTE CENA CARTA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'SPB'	,'SUPLEMENTO BEBIDAS'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'DUP'	,'DESAYUNO UPSELLING'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'PIS'	,'BAR PISCINA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'REAB'	,'RTE. BUFFET ALMUERZO'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'RECB'	,'RTE. BUFFET CENA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'DESN'	,'DESAYUNO NIÑO'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'PCS'	,'PENSION COMPLETA ALM SAL'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'ALMS'	,'ALMUERZO DIA SALIDA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'REAP'	,'REST. ALMUERZO GRUPOS PASANTES'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'RECP'	,'REST. CENA     GRUPOS PASANTES'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'CENU'	,'CENA UPSELLING'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'ALMU'	,'ALMUERZO UPSELLING'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'PIC'	,'PICNIC'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'METR'	,'MENU TRABAJO'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'MND'	,'MENU DEL DIA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'PICS'	,'PICNIC DIA SALIDA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'TEL'	,'TELEFONO'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'PKG'	,'PARKING'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'FAX'	,'FAX'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'LAV'	,'LAVANDERIA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'VAR1'	,'VARIOS 10%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'FOT'	,'FOTOCOPIAS'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'COC'	,'COCKTAIL'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'VAR2'	,'VARIOS 21%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'SAL'	,'ALQUILER SALA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'AUD'	,'AUDIOVISUALES'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'COF'	,'COFFEE BREAK'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'BAN'	,'BANQUETE'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'BRL'	,'BARRA LIBRE'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'CRB'	,'CARRO BEBIDAS'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'VBAN07'	,'VARIOS BANQUETE IVA 10%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'VSAL10'	,'VARIOS SALAS IVA 10%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'VSAL21'	,'VARIOS SALAS IVA 21%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'SBA'	,'SUPL SALA REST ALMUERZO'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'SBC'	,'SUPL SALA REST CENA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'SBB'	,'SUPL SALA REST BANQUETE'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'BODA'	,'BODA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'BACO'	,'BAUTIZO / COMUNION'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'CDX'	,'CENTRO DEPORTIVO *'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'UNIC'	,'UNICEF'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'SMA'	,'SERVICIO MALETEROS'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'EXC'	,'EXCURSIONES'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'CJA'	,'CORTADOR DE JAMON'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'DJ'	,'DJ'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'SPA'	,'CIRCUITO SPA TERMAL        21%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'SPAM'	,'CIRCUITO SPA TERMAL+MASAJE 21%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'MASJ'	,'MASAJE                     21%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'TRAP'	,'TRATAMIENTO ESPECIAL       21%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'TRAT'	,'TRATAMIENTO ESTETICA       21%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'SPAP'	,'PRODUCTOS SPA              21%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'DCC'	,'DESEMBOLSO CUENTA CLIENTE'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'TOA'	,'DEPOSITO TOALLA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'VTPAD'	,'PADEL'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'VTLUD'	,'LUDOTECA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'FUTB'	,'FUTBOL'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'MASC'	,'SUPLEMENTO MASCOTA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'VAÑ1'	,'VALOR AÑADIDO 10%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'VAÑ2'	,'VALOR AÑADIDO 21%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'DCF'	,'DEPOSITO CAJA FUERTE'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'TIENDA'	,'TIENDA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'RSS'	,'RESPONSABILIDAD SOC. SERCOTEL'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'PKGAL'	,'PARKING ALOJADOS'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'PKGAB'	,'PARKING ABONADOS'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'PKGMA'	,'PARKING MAQUINAS'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'PKRET'	,'PARKING CON RETENCION'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'CON'	,'CONVENCION'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'RETIRO'	,'SALON RETIRO'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'SAL'	,'0'	,'0'	,'0'	,'H'	,'P'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'CONSULA'	,'SALON CONSULA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'SAL'	,'0'	,'0'	,'0'	,'H'	,'P'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'CALETA'	,'SALON CALETA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'SAL'	,'0'	,'0'	,'0'	,'H'	,'P'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'LIMON'	,'SALON LIMONAR'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'SAL'	,'0'	,'0'	,'0'	,'H'	,'P'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'ADUANA'	,'SALON ADUANA '	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'SAL'	,'0'	,'0'	,'0'	,'H'	,'P'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'GUADAL'	,'SALON GUADALMEDINA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'SAL'	,'0'	,'0'	,'0'	,'H'	,'P'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'RECIBO'	,'RECIBO'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'P'	,'2'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'TAX'	,'TAXA TURISTICA'	,'OTR'	,''	,'0'	,'0'	,'0'	,'0'	,'0'	,''	,' '	,'VAR'	,'1000'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'TIPS'	,'PROPINAS'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'P'	,'3'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'VGOLF'	,'VARIOS GOLF'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'TRS'	,'TRIPLE SUPERIOR'	,'HAB'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'HAB'	,'0'	,'0'	,'0'	,'H'	,'P'	,'0'	,'7050010000'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'LOBBY'	,'LOBBY'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'PENS'	,'PENSION'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'ALMUP'	,'ALMUERZO UPSELLING'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'CENUP'	,'CENA UPSELLING'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'DE'	,'DESAYUNO'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010007'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'DEUP'	,'DESAYUNO UPSELLING'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010007'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'MDIA'	,'MENU DEL DIA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'MERI'	,'MERIENDA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010009'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'MGT'	,'MENU GRUPO TURISTICO'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'MPA'	,'MEDIA PENSION ALMUERZO'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'MPC'	,'MEDIA PENSION CENA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'REB'	,'RESTAURANTE BEBIDA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'REUP'	,'RESTAURANTE UPSELLING'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'VBAN10'	,'VARIOS RESTAURACIÓN'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'BIKE'	,'ALQUILER BICI'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010006'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'LUGG'	,'SERVICIO MALETEROS 21%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,'7050010006'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'MAS'	,'MASAJE'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,'7050010006'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'PKGUP'	,'PARKING UPSELLING'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010004'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'SPM'	,'SERVICIO SPA MASAJES'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010020'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'VAR10'	,'VARIOS IVA 10%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010006'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'VAR21'	,'VARIOS IVA 21%'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'1'	,'7050010006'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'DV'	,'DESVIO HABITACION'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VRHB'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010000'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'SUP'	,'SUPL. HABITACION'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VRHB'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010000'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'SSRA'	,'SUPL. SALA REST. ALMUERZO'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VRSL'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010012'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'SSRB'	,'SUPL. SALA REST. BANQUETE'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VRSL'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010012'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'SSRC'	,'SUPL. SALA REST. CENA'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VRSL'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,'7050010012'	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'VARR'	,'VARIOS RESTAURANTE'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'RES'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'UNI'	,'UNICEF'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'P'	,'3'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	
,(	'FINGP'	,'FINGER BUFFET'	,'OTR'	,''	,'0'	,'0'	,'A'	,'1'	,'0'	,''	,' '	,'VAR'	,'0'	,'0'	,'0'	,'H'	,'E'	,'0'	,''	,''	,''	,'1'	,'1'	,''	,'1'	,'0'	)																	



END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CONCEPTOS',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CONCEPTOS',@COD_NEW,'OK');																																										
SET @ERROR = NULL

BEGIN TRY

INSERT INTO RELCONCSPRODUC ([CODIGOHOT],[CODIGOCP],[DESCRIPCION],[CODIGOREL],[NUM_HABS],[COD_DESCRIPCION_FACTURA],[ORDEN],[DESC_INGLES],[DESC_FRANCES],[DESC_ALEMAN],[ESTADO_GESTION_WEB],[COD_DESCRIPCION],[DESGLOSE],[FK_CODTIPOHAB],[FK_CODNIVEL],[FK_CODGRUPO_CONCEPTO] ,[FK_CODCLASIF_CONCEPTO],[CONTENIDO],[PRECIOX],[TIPO_IVA_HOTEL],[FK_TIPO_FOLIO_DEFECTO],[CUENTA_CONTABLE],[CENTRO_COSTE],[CUENTA_ANALITICA],[CP_VENTA],[CP_PRODUCCION],[AFECTA_CAJA],[FK_CODTIPO_CONCEPTO],[TIPO_CARGO],[DURACION],[SISTEMA],[CODIGOPMS],[FK_ID_CODCOBRO],[CP_DETALLE],[CP_COBRO_ELECTRONICO],[CP_EDITABLE],[CP_DIVISIBLE],[FK_GRUPO_OCUPACION],[TIPO_ESTADISTICA_OCUP],[ANULADO],[CP_ELIMINABLE],[CP_DESGLOSAENRESERVA],[CP_COMISIONABLE]) VALUES (	@COD_NEW	,'ALM'	,'ALMUERZO'	,'ALM'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'P'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'ALMUP'	,'ALMUERZO UPSELLING'	,'ALMUP'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'ANAX'	,'ANTICIPO AMEX'	,'ANAX'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VNP'	,' '	,' '	,'0'	,'S'	,'2'	,'E'	,'4380000001'	,''	,''	,'1'	,'1'	,''	,'C'	,'A'	,'1'	,'0'	,'NULL'	,'44'	,'0'	,'0'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'ANEF'	,'ANTICIPO EFECTIVO'	,'ANEF'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VNP'	,' '	,' '	,'0'	,'S'	,'2'	,'E'	,'4380000001'	,''	,''	,'1'	,'1'	,''	,'C'	,'A'	,'1'	,'0'	,'NULL'	,'43'	,'0'	,'0'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'ANTF'	,'ANTICIPO TRANSFERENCIA'	,'ANTF'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VNP'	,' '	,' '	,'0'	,'S'	,'2'	,'E'	,'4380000001'	,''	,''	,'1'	,'1'	,''	,'C'	,'A'	,'1'	,'0'	,'NULL'	,'53'	,'0'	,'0'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'ANVI'	,'ANTICIPO VISA'	,'ANVI'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VNP'	,' '	,' '	,'0'	,'S'	,'2'	,'E'	,'4380000001'	,''	,''	,'1'	,'1'	,''	,'C'	,'A'	,'1'	,'0'	,'NULL'	,'46'	,'0'	,'0'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'AUD'	,'AUDIOVISUALES'	,'AUD'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRSL'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010005'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'BACO'	,'BAUTIZO / COMUNION'	,'BACO'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'SAL'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'BAN'	,'BANQUETES'	,'BAN'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'SAL'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'BIKE'	,'ALQUILER BICI'	,'BIKE'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010006'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'BODA'	,'BODA'	,'BODA'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'SAL'	,' '	,' '	,'0'	,'S'	,'1'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'BRK'	,'DESAYUNO'	,'BRK'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010007'	,''	,''	,'1'	,'1'	,''	,'P'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'BRL'	,'BARRA LIBRE'	,'BRL'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'P'	,'1'	,'E'	,'7050010009'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'CAF'	,'CAFETERIA'	,'CAF'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010009'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'CDX'	,'CENTRO DEPORTIVO'	,'CDX'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010006'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'CEN'	,'CENA INCLUIDA'	,'CEN'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'P'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'CENUP'	,'CENA UPSELLING'	,'CENUP'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'CEX'	,'CAMA EXTRA'	,'CEX'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRHB'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010000'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'*SCP'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'COC'	,'COCKTAIL'	,'COC'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010009'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'COF'	,'COFFEE BREAK'	,'COF'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010009'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'CUNA'	,'CUNA'	,'CUNA'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRHB'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010000'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'*SCP'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'CXL1'	,'CANCELACION 10%'	,'CXL1'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRHB'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010000'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'*CLX'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'DEP1'	,'DEPOSITO 10%'	,'DEP1'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VNP'	,' '	,' '	,'0'	,'P'	,'0'	,'P'	,'4380000001'	,''	,''	,'1'	,'1'	,''	,'D'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'1'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'DEP2'	,'DEPOSITO 21%'	,'DEP2'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VNP'	,' '	,' '	,'0'	,'P'	,'1'	,'P'	,'4380000001'	,''	,''	,'1'	,'1'	,''	,'D'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'1'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'DEUP'	,'DESAYUNO UPSELLING'	,'DEUP'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010007'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'DEX'	,'DESAYUNO EXTRA'	,'DEX'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010007'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'DPR'	,'DEPOSITO (RECIBO)'	,'DPR'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VNP'	,' '	,' '	,'0'	,'S'	,'2'	,'P'	,'4380000001'	,''	,''	,'1'	,'1'	,''	,'D'	,'A'	,'1'	,'0'	,'NULL'	,'79'	,'0'	,'0'	,'1'	,'0'	,'NULL'	,'NULL'	,'1'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'DV'	,'DESVIO HABITACION'	,'DV'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRHB'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010000'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'*NSP'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'EARLY'	,'EARLY BOOKING'	,'EARLY'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRHB'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010000'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'*SCP'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'EXC'	,'EXCURSIONES'	,'EXC'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010006'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'FOT'	,'FOTOCOPIAS'	,'FOT'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010001'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'LATE'	,'LATE CHECKOUT'	,'LATE'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRHB'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010000'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'*SCP'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'LAV'	,'LAVANDERIA'	,'LAV'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010003'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'LUGG'	,'SERVICIO MALETEROS 21%'	,'LUGG'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'1'	,'E'	,'7050010006'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'MAS'	,'MASAJE'	,'MAS'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'1'	,'E'	,'7050010006'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'MASC'	,'SUPL. MASCOTA'	,'MASC'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'P'	,'0'	,'E'	,'7050010006'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'*SCP'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'MB'	,'MINIBAR'	,'MB'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010008'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'1'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'MDIA'	,'MENU DEL DIA'	,'MDIA'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'MERI'	,'MERIENDA'	,'MERI'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010009'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'METR'	,'MENU TRABAJO'	,'METR'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'MGT'	,'MENU GRUPO TURISTICO'	,'MGT'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'MPA'	,'MEDIA PENSION ALMUERZO'	,'MPA'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'MPC'	,'MEDIA PENSION CENA'	,'MPC'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'NSH'	,'NO SHOW'	,'NSH'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRHB'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010000'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'*NSP'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'PC'	,'PENSION COMPLETA'	,'PC'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'PIC'	,'PIC-NIC'	,'PIC'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'PIS'	,'BAR PISCINA'	,'PIS'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010009'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'PKG'	,'PARKING'	,'PKG'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'1'	,'E'	,'7050010004'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'PKGUP'	,'PARKING UPSELLING'	,'PKGUP'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010004'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'REA'	,'RESTAURANTE ALMUERZO CARTA'	,'REA'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'REAB'	,'REST. ALMUERZO BUFFET'	,'REAB'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'REAP'	,'REST. ALMUERZO GRUPOS PASANTES'	,'REAP'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'REB'	,'RESTAURANTE BEBIDA'	,'REB'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'REC'	,'RESTAURANTE CENA CARTA'	,'REC'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'RECB'	,'REST. CENA BUFFET'	,'RECB'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'RECP'	,'REST. CENA GRUPOS PASANTES'	,'RECP'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'REUP'	,'RESTAURANTE UPSELLING'	,'REUP'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'RS'	,'ROOM SERVICE'	,'RS'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010011'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'RSS'	,'RESPONSABILIDAD SOC. SERCOTEL'	,'RSS'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'5550000004'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'SAL'	,'ALQUILER SALA'	,'SAL'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'SAL'	,' '	,' '	,'0'	,'P'	,'1'	,'E'	,'7050010013'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'SH'	,'SUPLEMENTO HABITACION'	,'SH'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRHB'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010000'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'*SCP'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'SPA'	,'CIRCUITO SPA TERMAL 21%'	,'SPA'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'1'	,'E'	,'7050010020'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'SPAM'	,'CIRCUITO SPA TERMAL + MASAJE 21%'	,'SPAM'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010020'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'SPB'	,'SUPLEMENTO BEBIDAS'	,'SPB'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010009'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'SPM'	,'SERVICIO SPA MASAJES'	,'SPM'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010020'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'SSRA'	,'SUPL. SALA REST. ALMUERZO'	,'SSRA'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRSL'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010012'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'SSRB'	,'SUPL. SALA REST. BANQUETE'	,'SSRB'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRSL'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010012'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'SSRC'	,'SUPL. SALA REST. CENA'	,'SSRC'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRSL'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010012'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'SUP'	,'SUPL. HABITACION'	,'SUP'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRHB'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010000'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'*SCP'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'TAX'	,'TASA TURISTICA'	,'TAX'	,'0'	,'0'	,'100'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'TAX'	,' '	,' '	,'0'	,'P'	,'0'	,'E'	,'4750000006'	,''	,''	,'1'	,'1'	,''	,'T'	,'T'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'0'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'TEL'	,'TELEFONO'	,'TEL'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010001'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'TIENDA'	,'TIENDA'	,'TIENDA'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010006'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'TIPS'	,'PROPINAS'	,'TIPS'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'P'	,'3'	,'P'	,''	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'UNI'	,'DONATIVO UNICEF'	,'UNI'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'2'	,'E'	,'5550000004'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'UP'	,'UPSELLING HABITACION'	,'UP'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRHB'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010000'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'*SCP'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'VAR10'	,'VARIOS IVA 10%'	,'VAR10'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010006'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'VAR21'	,'VARIOS IVA 21%'	,'VAR21'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VAR'	,' '	,' '	,'0'	,'S'	,'1'	,'E'	,'7050010006'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'VBAN10'	,'VARIOS RESTAURACIÓN'	,'VBAN10'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'RES'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010010'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'VSAL10'	,'VARIOS SALAS IVA 10%'	,'VSAL10'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRSL'	,' '	,' '	,'0'	,'S'	,'0'	,'E'	,'7050010013'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)
, (	@COD_NEW	,'VSAL21'	,'VARIOS SALAS IVA 21%'	,'VSAL21'	,'0'	,'0'	,'0'	,''	,''	,''	,'A'	,'0'	,'0'	,''	,'VRSL'	,' '	,' '	,'0'	,'S'	,'1'	,'E'	,'7050010013'	,''	,''	,'1'	,'1'	,''	,'C'	,'C'	,'1'	,'0'	,'NULL'	,'NULL'	,'0'	,'0'	,'1'	,'1'	,'NULL'	,'NULL'	,'0'	,'1'	,'0'	,'1'	)

END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CONCEPTOS',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CONCEPTOS',@COD_NEW,'OK');																																										
SET @ERROR = NULL

/*BEGIN TRY
INSERT INTO HOTEL_TIPO_COBRO ([FK_CODIGOHOT],[FK_ID_COBRO],[CODCOBRO],[DESCRIPCION],[FK_GRUPOCOBRO],[CREDITO],[CUENTA_CONTABLE],[FK_CODCLIENTE],[TRASPCONTABLE_DET],[REQUIERE_FACTURA],[SITEF],[ACTIVO_COBRO],[ACTIVO_CREDITO],[ACTIVO],[CENTRO_COSTE],[CUENTA_ANALITICA],[ACTIVO_LIQUIDACION_EFECTIVO],[ACTIVO_LIQUIDACION_TARJETAS],[COD_DESCRIPCION],[CREDITO_COD_COBRO],[CREDITO_COD_SITUACION],[GRUPO_CREDITO],[ACTIVO_INFORME]) VALUES (	@COD_NEW	,'43'	,'EF'	,'Efectivo'	,'E'	,'0'	,'5700000000'	,'0'	,'1'	,'1'	,'0'	,'1'	,'1'	,'A'	,''	,''	,'0'	,'0'	,'6635'	,''	,''	,'NULL'	,'1')
,(	@COD_NEW	,'44'	,'AM'	,'American Express'	,'T'	,'0'	,'4400000003'	,'0'	,'1'	,'1'	,'0'	,'1'	,'1'	,'A'	,''	,''	,'0'	,'0'	,'6628'	,''	,''	,'NULL'	,'1'	)
,(	@COD_NEW	,'45'	,'CR'	,'Crédito'	,'C'	,'1'	,''	,'0'	,'1'	,'1'	,'0'	,'1'	,'1'	,'A'	,''	,''	,'0'	,'0'	,'6632'	,''	,''	,'NULL'	,'1'	)
,(	@COD_NEW	,'46'	,'VI'	,'Visa'	,'T'	,'0'	,'4400000001'	,'0'	,'1'	,'1'	,'0'	,'1'	,'1'	,'A'	,''	,''	,'0'	,'0'	,'6641'	,''	,''	,'NULL'	,'1')
,(	@COD_NEW	,'52'	,'CH'	,'Cheque'	,'O'	,'0'	,'5720000099'	,'0'	,'1'	,'1'	,'0'	,'0'	,'1'	,'A'	,''	,''	,'0'	,'0'	,'6630'	,''	,''	,'NULL'	,'1'	)
,(	@COD_NEW	,'53'	,'TR'	,'Transferencia'	,'O'	,'0'	,'5720000099'	,'0'	,'1'	,'1'	,'0'	,'1'	,'1'	,'A'	,''	,''	,'0'	,'0'	,'6640'	,''	,''	,'NULL'	,'1'	)
,(	@COD_NEW	,'56'	,'OT'	,'Otros'	,'O'	,'0'	,'5720000099'	,'0'	,'1'	,'1'	,'0'	,'1'	,'1'	,'A'	,''	,''	,'0'	,'0'	,'0'	,''	,''	,'NULL'	,'1')	
,(	@COD_NEW	,'69'	,'MC'	,'Mastercard'	,'T'	,'0'	,'4400000001'	,'0'	,'1'	,'1'	,'0'	,'1'	,'1'	,'A'	,''	,''	,'0'	,'0'	,'7239'	,''	,''	,'NULL'	,'1'	)
,(	@COD_NEW	,'78'	,'MAE'	,'Maestro'	,'T'	,'0'	,'4400000001'	,'0'	,'1'	,'1'	,'0'	,'1'	,'1'	,'A'	,''	,''	,'0'	,'0'	,'7240'	,''	,''	,'NULL'	,'1'	)
,(	@COD_NEW	,'79'	,'DEP'	,'Deposito'	,'T'	,'0'	,'4380000001'	,'0'	,'1'	,'1'	,'0'	,'1'	,'1'	,'A'	,''	,''	,'0'	,'0'	,'7241'	,''	,''	,'NULL'	,'1'	)
,(	@COD_NEW	,'80'	,'RET'	,'Retencion 19%'	,'E'	,'0'	,'4730000000'	,'0'	,'1'	,'1'	,'0'	,'1'	,'0'	,'A'	,''	,''	,'0'	,'0'	,'0'	,''	,''	,'NULL'	,'1'	)

END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR HOTEL_TIPO_COBRO',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR HOTEL_TIPO_COBRO',@COD_NEW,'OK');																																										
SET @ERROR = NULL
*/

BEGIN TRY
DELETE FROM HOTEL_CONFIG_CIERRE_PROCESOS WHERE FK_CODIGOHOT =@COD_NEW 
INSERT INTO HOTEL_CONFIG_CIERRE_PROCESOS				
      ([FK_CODIGOHOT]				
      ,[FK_CODPROCESO]				
      ,[ORDEN]				
      ,[ACTIVO])				
VALUES (@COD_NEW	,'SPCIE0'	,'0'	,'1'	),
       (@COD_NEW	,'SPCIE1'	,'10'	,'1'	),
       (@COD_NEW	,'SPCIE10'	,'170'	,'0'	),
       (@COD_NEW	,'SPCIE11'	,'120'	,'1'	),
       (@COD_NEW	,'SPCIE12'	,'130'	,'1'	),
       (@COD_NEW	,'SPCIE13'	,'30'	,'1'	),
       (@COD_NEW	,'SPCIE2'	,'20'	,'1'	),
       (@COD_NEW	,'SPCIE20'	,'110'	,'0'	),
       (@COD_NEW	,'SPCIE3'	,'40'	,'1'	),
       (@COD_NEW	,'SPCIE30'	,'180'	,'1'	),
       (@COD_NEW	,'SPCIE4'	,'50'	,'1'	),
       (@COD_NEW	,'SPCIE40'	,'190'	,'0'	),
       (@COD_NEW	,'SPCIE5'	,'60'	,'1'	),
       (@COD_NEW	,'SPCIE50'	,'185'	,'1'	),
       (@COD_NEW	,'SPCIE6'	,'70'	,'1'	),
       (@COD_NEW	,'SPCIE7'	,'90'	,'1'	),
       (@COD_NEW	,'SPCIE8'	,'100'	,'0'	),
       (@COD_NEW	,'SPCIE9'	,'80'	,'1'	),
       (@COD_NEW	,'SPCIEPRE01'	,'10'	,'1'	),
       (@COD_NEW	,'SPCIEPRE02'	,'10'	,'1'	)

END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CIERRE_PROCESOS',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CIERRE_PROCESOS',@COD_NEW,'OK');																																										
SET @ERROR = NULL


BEGIN TRY
INSERT INTO FOF_INFORME_PREVISION_SERVICIOS ([FK_CODIGOHOT],[FK_CODIGOCP],[AGRUPACION],[ORDEN],[SIEMPRE_VISIBLE],[GRUPO_TOTAL],[VER_PREVSERVICIOS],[VER_BOOKING],[VER_ROOMRACK],[VER_RESERVA_NUMCAMPO]) VALUES (	@COD_NEW	,'ALM'	,'GRP'	,'50'	,'1'	,'ALM'	,'1'	,'1'	,'0'	,'NULL'	)
, (	@COD_NEW	,'ALM'	,'IND'	,'20'	,'1'	,'ALM'	,'1'	,'1'	,'0'	,'NULL'	)
, (	@COD_NEW	,'BRK'	,'GRP'	,'40'	,'1'	,'BRK'	,'1'	,'1'	,'0'	,'NULL'	)
, (	@COD_NEW	,'BRK'	,'IND'	,'10'	,'1'	,'BRK'	,'1'	,'1'	,'0'	,'NULL'	)
, (	@COD_NEW	,'CEN'	,'GRP'	,'60'	,'1'	,'CEN'	,'1'	,'1'	,'0'	,'NULL'	)
, (	@COD_NEW	,'CEN'	,'IND'	,'30'	,'1'	,'CEN'	,'1'	,'1'	,'0'	,'NULL'	)
, (	@COD_NEW	,'CEX'	,'IND'	,'70'	,'1'	,'CEX'	,'1'	,'1'	,'1'	,'1'	)
, (	@COD_NEW	,'SAL'	,'GRP'	,'80'	,'1'	,'SAL'	,'1'	,'1'	,'1'	,'1'	)
, (	@COD_NEW	,'SAL'	,'IND'	,'80'	,'1'	,'SAL'	,'1'	,'1'	,'1'	,'1'	)



END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR PREVISION SERVICIOS',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR PREVISION SERVICIOS',@COD_NEW,'OK');																																										
SET @ERROR = NULL

BEGIN TRY
INSERT INTO HOTEL_REGIMEN_CONTENIDO ([FK_CODIGOHOT] ,[FK_CODREGIMEN] ,[FK_CODIGOCP] ,[FIJO] ,[PORC] ,[ORDEN],[EntradaPorDefecto]) VALUES (	@COD_NEW	,'BB'	,'BRK'	,'17000'	,'100000'	,'1'	,'0'	),
 (	@COD_NEW	,'MP'	,'BRK'	,'17000'	,'48000'	,'1'	,'0'	),
 (	@COD_NEW	,'MP'	,'CEN'	,'19000'	,'52000'	,'3'	,'1'	),
 (	@COD_NEW	,'PC'	,'ALM'	,'19000'	,'35000'	,'2'	,'0'	),
 (	@COD_NEW	,'PC'	,'BRK'	,'17000'	,'30000'	,'1'	,'0'	),
 (	@COD_NEW	,'PC'	,'CEN'	,'19000'	,'35000'	,'3'	,'1'	)

END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR REGIMEN_CONTENIDO',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR REGIMEN_CONTENIDO',@COD_NEW,'OK');																																										
SET @ERROR = NULL

BEGIN TRY
DELETE FROM HOTEL_CONFIG_DESGLOSE WHERE FK_CODIGOHOT = @COD_NEW
INSERT INTO HOTEL_CONFIG_DESGLOSE 
      ([FK_CODIGOHOT]
      ,[PORC_HAB]
      ,[PORC_PEN]
      ,[FIJO_HAB]
      ,[FIJO_PEN])
VALUES (@COD_NEW,'0.000','100.000','0.000','0.000')
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CONFIG_DESGLOSE',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CONFIG_DESGLOSE',@COD_NEW,'OK');																																										
SET @ERROR = NULL


BEGIN TRY
DELETE FROM HOTEL_CONCSPRODUC_INFORMES WHERE [CODIGOHOT] = @COD_NEW
INSERT INTO HOTEL_CONCSPRODUC_INFORMES									
      ([CODIGOHOT]									
      ,[CODIGOCP]									
      ,[CODINFORME]									
      ,[PAGINA]									
      ,[VISIBLE]									
      ,[CALCULAR]									
      ,[OCUPACION]									
      ,[INGRESO]									
      ,[MULTIPLICA])									
VALUES (@COD_NEW	,'$ALO'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'$AM'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),
       (@COD_NEW	,'$AMEX'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$AMM'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$ANPA'	,'99'	,'6'	,'1'	,'1'	,'0'	,'0'	,'-1'	),
       (@COD_NEW	,'$ANTI'	,'99'	,'6'	,'1'	,'1'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$ANTR'	,'99'	,'6'	,'1'	,'1'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$AYB'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'$BANQ'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'$CAJA1'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),
       (@COD_NEW	,'$CAJA2'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),
       (@COD_NEW	,'$CBAN'	,'99'	,'3'	,'0'	,'0'	,'0'	,'0'	,'0'	),
       (@COD_NEW	,'$CBAN'	,'99'	,'4'	,'0'	,'0'	,'0'	,'0'	,'0'	),
       (@COD_NEW	,'$CBAN'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'0'	),
       (@COD_NEW	,'$CBAR'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$CCAF'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$CCMD'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'-1'	),
       (@COD_NEW	,'$CCMI'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'0'	),
       (@COD_NEW	,'$CCMN'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'0'	),
       (@COD_NEW	,'$CDES'	,'99'	,'3'	,'0'	,'0'	,'0'	,'0'	,'0'	),
       (@COD_NEW	,'$CDES'	,'99'	,'4'	,'0'	,'0'	,'0'	,'0'	,'0'	),
       (@COD_NEW	,'$CDES'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'0'	),
       (@COD_NEW	,'$CDTO'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'-1'	),
       (@COD_NEW	,'$CH'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),
       (@COD_NEW	,'$CLC'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'0'	),
       (@COD_NEW	,'$CLCA'	,'99'	,'3'	,'0'	,'0'	,'0'	,'0'	,'0'	),
       (@COD_NEW	,'$CLCA'	,'99'	,'4'	,'0'	,'0'	,'0'	,'0'	,'0'	),
       (@COD_NEW	,'$CLCA'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'1'	),
       (@COD_NEW	,'$CR'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),
       (@COD_NEW	,'$CRE'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$CRES'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$CYE'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'$DE'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),
       (@COD_NEW	,'$DEP'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),
       (@COD_NEW	,'$DI'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),
       (@COD_NEW	,'$DIM'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$DIN'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$DP'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'$EF'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),
       (@COD_NEW	,'$EFEC'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$FACF'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'1'	),
       (@COD_NEW	,'$FANC'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'1'	),
       (@COD_NEW	,'$FNCA'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'-1'	),
       (@COD_NEW	,'$HAB'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$IVA'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),
       (@COD_NEW	,'$IVA0'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'1'	),
       (@COD_NEW	,'$IVA1'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'1'	),
       (@COD_NEW	,'$IVA2'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'1'	),
       (@COD_NEW	,'$IVA3'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'1'	),
       (@COD_NEW	,'$JCB'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$JCBM'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$KUTXA'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),
       (@COD_NEW	,'$MAE'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$MC'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$MCM'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$NP'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'$OTR'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'$PFA'	,'99'	,'6'	,'1'	,'1'	,'0'	,'1'	,'-1'	),
       (@COD_NEW	,'$SW'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$SWM'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$TR'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),
       (@COD_NEW	,'$VI'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),
       (@COD_NEW	,'$VIM'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'$VIS*'	,'99'	,'6'	,'1'	,'1'	,'1'	,'1'	,'-1'	),
       (@COD_NEW	,'$VISA'	,'99'	,'6'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'*BLOQ'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'*CLX'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'*COMD'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'-1'	),
       (@COD_NEW	,'*COMI'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'0'	),
       (@COD_NEW	,'*COMN'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'0'	),
       (@COD_NEW	,'*CSH'	,'99'	,'5'	,'1'	,'1'	,'0'	,'1'	,'1'	),
       (@COD_NEW	,'*DTO'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'-1'	),
       (@COD_NEW	,'*GRA'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'*LLEG'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'*MAX'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'*NSE'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'*NSP'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'*OCP'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'*OTR'	,'99'	,'5'	,'1'	,'1'	,'0'	,'1'	,'1'	),
       (@COD_NEW	,'*OUT'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'*RAP'	,'99'	,'5'	,'1'	,'1'	,'0'	,'1'	,'1'	),
       (@COD_NEW	,'*SAL'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'*SCP'	,'99'	,'5'	,'1'	,'1'	,'0'	,'1'	,'1'	),
       (@COD_NEW	,'*UCS'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'*USO'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),
       (@COD_NEW	,'*VIP'	,'99'	,'5'	,'1'	,'1'	,'1'	,'1'	,'1'	),
	  (@COD_NEW	,'IVA0'	,'99'	,'1'	,'1'	,'1'	,'0'	,'0'	,'1'),
       (@COD_NEW	,'IVA0'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'IVA0'	,'99'	,'3'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'IVA0'	,'99'	,'4'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'IVA1'	,'99'	,'1'	,'1'	,'1'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'IVA1'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'IVA1'	,'99'	,'3'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'IVA1'	,'99'	,'4'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'IVA2'	,'99'	,'1'	,'1'	,'1'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'IVA2'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'IVA2'	,'99'	,'3'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'IVA2'	,'99'	,'4'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'IVA3'	,'99'	,'1'	,'1'	,'1'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'IVA3'	,'99'	,'2'	,'1'	,'1'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'IVA3'	,'99'	,'3'	,'0'	,'0'	,'0'	,'0'	,'1'	),
       (@COD_NEW	,'IVA3'	,'99'	,'4'	,'0'	,'0'	,'0'	,'0'	,'1'	)

END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'COPIAR INFORME PROD SIST',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR INFORME PROD SIST',@COD_NEW,'OK');																																										
SET @ERROR = NULL

BEGIN TRY
INSERT INTO CONCSPRODUC
([CODIGOCP]
           ,[DESCRIPCION]
           ,[FK_CONCEPTOSREPLIC]
           ,[CODIGOTIHA]
           ,[COD_DESCRIPCION_FACTURA]
           ,[PAX]
           ,[ESTADO_GESTION_WEB]
           ,[USO_FRECUENTE]
           ,[COD_DESCRIPCION]
           ,[FK_CODGRUPO_CONCEPTO]
           ,[FK_CODCLASIF_CONCEPTO]
           ,[FK_CODNIVEL]
           ,[ORDEN]
           ,[DESGLOSE]
           ,[CONTENIDO]
           ,[PRECIOX]
           ,[FK_TIPO_FOLIO_DEFECTO]
           ,[TIPO_IVA_HOTEL]
           ,[CUENTA_CONTABLE]
           ,[CENTRO_COSTE]
           ,[CUENTA_ANALITICA]
           ,[CP_VENTA]
           ,[CP_PRODUCCION]
           ,[AFECTA_CAJA]
           ,[DURACION]
           ,[SISTEMA])
SELECT CODTIPOHAB
      ,DESCRIPCION
      ,'HAB'
      ,CODTIPOHAB
      ,'0'
      ,'2'
      ,'A'
      ,'1'
      ,'0'
      ,''
      ,''
      ,'VAR'
      ,'1000'
      ,'0'
      ,'0'
      ,'H'
      ,'P'
      ,'0'
      ,''
      ,''
      ,''
      ,'1'
      ,'1'
      ,''
      ,'1'
      ,'0'
FROM HOTEL_TIPO_HAB
WHERE FK_CODIGOHOT = @COD_NEW and CODTIPOHAB <> '' AND CODTIPOHAB NOT IN (SELECT CODIGOCP FROM CONCSPRODUC)
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CONCSPRODUC TIPOHAB',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CONCSPRODUC TIPOHAB',@COD_NEW,'OK');																																										
SET @ERROR = NULL


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
      ,[TIPO_ESTADISTICA_OCUP])
SELECT FK_CODIGOHOT
      ,CODTIPOHAB
      ,DESCRIPCION
      ,CODTIPOHAB
      ,'0'
      ,'0'
      ,'0'
      ,''
      ,''
      ,''
      ,'A'
      ,'0'
      ,'0'
      ,CODTIPOHAB
      ,'HAB'
      ,''
      ,''
      ,'0'
      ,'H'
      ,'0'
      ,'P'
      ,''
      ,''
      ,''
      ,'1'
      ,'1'
      ,''
      ,'H'
      ,'C'
      ,'1'
      ,'0'
      ,''
      ,''
      ,'0'
      ,'0'
      ,'1'
      ,'1'
      ,NULL
      ,''
FROM HOTEL_TIPO_HAB
WHERE FK_CODIGOHOT = @COD_NEW  and CODTIPOHAB <> '' AND CODTIPOHAB NOT IN (SELECT CODIGOCP FROM RELCONCSPRODUC WHERE CODIGOHOT = @COD_NEW)
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR RELCONCS TIPOHAB',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR RELCONCS TIPOHAB',@COD_NEW,'OK');																																										
SET @ERROR = NULL


BEGIN TRY
INSERT INTO TIPO_SERVICIO_GOBERNANTA  ([CODSERVICIO],[DESCRIPCION],[TEXTOBREVE],[FRECUENCIA]) VALUES  ('SAB','SABANA','SAB','')
INSERT INTO HOTEL_CONFIG_SERVICIO_GOBERNANTA ([FK_CODIGOHOT],[FK_CODSERVICIO],[ACTIVO],[ORDEN])  VALUES (@COD_NEW,'SAB','1','1')
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR SERVICIO GOBER',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR SERVICIO GOBER',@COD_NEW,'OK');	
SET @ERROR = NULL

BEGIN TRY 
EXEC.SP_MANTENIMIENTO_INSERTAR_INFORMEPRODUCCION @COD_NEW
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'REVISAR INFORME DE PRODUCCION',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'REVISAR INFORME DE PRODUCCION',@COD_NEW,'OK');	
SET @ERROR = NULL


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
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR POLITICAS',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR POLITICAS',@COD_NEW,'OK');	
SET @ERROR = NULL



END ELSE BEGIN

/*********************************/
/*********************************/
/*********************************/
/*********************************/




/*COPIAR HOTEL ANTERIOR OLD  */




/*********************************/
/*********************************/
/*********************************/
/*********************************/
/*********************************/






BEGIN TRY
SET @ERROR = NULL

INSERT INTO HOTEL_NIVELES
      ([CODIGOHOT]
      ,[CODNIVEL]
      ,[DESCRIPCION]
      ,[COD_DESCRIPCION]
      ,[FK_CODNIVEL_PADRE]
      ,[ORDERID]
      ,[ORDEN]
      ,[ISDEF]
      ,[IMPRIMIR])
SELECT @COD_NEW
      ,[CODNIVEL]
      ,[DESCRIPCION]
      ,[COD_DESCRIPCION]
      ,[FK_CODNIVEL_PADRE]
      ,[ORDERID]
      ,[ORDEN]
      ,[ISDEF]
      ,[IMPRIMIR]
FROM HOTEL_NIVELES WHERE CODIGOHOT = @COD_OLD AND CODNIVEL NOT IN (SELECT CODNIVEL FROM HOTEL_NIVELES WHERE CODIGOHOT = @COD_NEW)

END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR HOTEL_NIVELES_1',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR HOTEL_NIVELES_1',@COD_NEW,'OK');																																										
SET @ERROR = NULL




BEGIN TRY 
INSERT INTO HOTEL_MODULO
      ([CODIGOHOT]
      ,[CODMODULO]
      ,[DESCRIPCION]
      ,[ORDEN]
      ,[SUPERFICIE]
      ,[LONGITUD]
      ,[ANCHURA]
      ,[ALTURA]
      ,[LUZNATUR]
      ,[VENTANAS]
      ,[AIREACON]
      ,[ENCHU220]
      ,[ENCHU380]
      ,[TOMASTV]
      ,[TOMASPC]
      ,[PUERANCHO]
      ,[PUERALTO]
      ,[PESOMAX]
      ,[PLANTA]
      ,[PERMITEOVER])
SELECT @COD_NEW
      ,[CODMODULO]
      ,[DESCRIPCION]
      ,[ORDEN]
      ,[SUPERFICIE]
      ,[LONGITUD]
      ,[ANCHURA]
      ,[ALTURA]
      ,[LUZNATUR]
      ,[VENTANAS]
      ,[AIREACON]
      ,[ENCHU220]
      ,[ENCHU380]
      ,[TOMASTV]
      ,[TOMASPC]
      ,[PUERANCHO]
      ,[PUERALTO]
      ,[PESOMAX]
      ,[PLANTA]
      ,[PERMITEOVER]
FROM HOTEL_MODULO WHERE CODIGOHOT = @COD_OLD

END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR HOTEL_MODULO',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR HOTEL_MODULO',@COD_NEW,'OK');																																										
SET @ERROR = NULL


   /*CONCEPTOS DE SISTEMA*/
BEGIN TRY
INSERT INTO RELCONCSPRODUC
      ([CODIGOHOT]
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
      ,[TIPO_ESTADISTICA_OCUP]
      ,[ANULADO])
SELECT @COD_NEW
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
      ,[TIPO_ESTADISTICA_OCUP]
      ,[ANULADO]
FROM RELCONCSPRODUC WHERE CODIGOHOT = @COD_OLD AND FK_CODTIPOHAB = '' AND SISTEMA = '1'
AND CODIGOCP NOT IN (SELECT CODIGOCP FROM RELCONCSPRODUC WHERE CODIGOHOT = @COD_NEW)
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'COP CONCETPOS SIS',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'COP CONCETPOS SIS',@COD_NEW,'OK');																																										
SET @ERROR = NULL


   /*CONCEPTOS  EXCEPTO HABITACION*/
BEGIN TRY
INSERT INTO RELCONCSPRODUC
      ([CODIGOHOT]
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
      ,[TIPO_ESTADISTICA_OCUP]
      ,[ANULADO])
SELECT @COD_NEW
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
      ,[TIPO_ESTADISTICA_OCUP]
      ,[ANULADO]
FROM RELCONCSPRODUC WHERE CODIGOHOT = @COD_OLD AND FK_CODTIPOHAB = '' AND SISTEMA = '0' and codigocp <> ''
AND CODIGOCP NOT IN (SELECT CODIGOCP FROM RELCONCSPRODUC WHERE CODIGOHOT = @COD_NEW)
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'COPIAR CONCETPOS',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'COPIAR CONCETPOS',@COD_NEW,'OK');																																										
SET @ERROR = NULL

BEGIN TRY
INSERT INTO HOTEL_TIPO_COBRO 
      ([FK_CODIGOHOT]
      ,[FK_ID_COBRO]
      ,[CODCOBRO]
      ,[DESCRIPCION]
      ,[FK_GRUPOCOBRO]
      ,[CREDITO]
      ,[CUENTA_CONTABLE]
      ,[FK_CODCLIENTE]
      ,[TRASPCONTABLE_DET]
      ,[REQUIERE_FACTURA]
      ,[SITEF]
      ,[ACTIVO_COBRO]
      ,[ACTIVO_CREDITO]
      ,[ACTIVO]
      ,[CENTRO_COSTE]
      ,[CUENTA_ANALITICA]
      ,[ACTIVO_LIQUIDACION_EFECTIVO]
      ,[ACTIVO_LIQUIDACION_TARJETAS]
      ,[COD_DESCRIPCION]
      ,[CREDITO_COD_COBRO]
      ,[CREDITO_COD_SITUACION]
      ,[GRUPO_CREDITO])
SELECT @COD_NEW
      ,[FK_ID_COBRO]
      ,[CODCOBRO]
      ,[DESCRIPCION]
      ,[FK_GRUPOCOBRO]
      ,[CREDITO]
      ,[CUENTA_CONTABLE]
      ,[FK_CODCLIENTE]
      ,[TRASPCONTABLE_DET]
      ,[REQUIERE_FACTURA]
      ,[SITEF]
      ,[ACTIVO_COBRO]
      ,[ACTIVO_CREDITO]
      ,[ACTIVO]
      ,[CENTRO_COSTE]
      ,[CUENTA_ANALITICA]
      ,[ACTIVO_LIQUIDACION_EFECTIVO]
      ,[ACTIVO_LIQUIDACION_TARJETAS]
      ,[COD_DESCRIPCION]
      ,[CREDITO_COD_COBRO]
      ,[CREDITO_COD_SITUACION]
      ,[GRUPO_CREDITO]
FROM HOTEL_TIPO_COBRO WHERE FK_CODIGOHOT = @COD_OLD
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'COPIAR HOTEL_TIPO_COBRO',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR HOTEL_TIPO_COBRO',@COD_NEW,'OK');																																										
SET @ERROR = NULL


BEGIN TRY
DELETE FROM HOTEL_CONFIG_CIERRE_PROCESOS WHERE FK_CODIGOHOT =@COD_NEW 
INSERT INTO HOTEL_CONFIG_CIERRE_PROCESOS /*PUEDE DAR ERROR PORQUE YA ESTÉ CREADO*/
      ([FK_CODIGOHOT]
      ,[FK_CODPROCESO]
      ,[ORDEN]
      ,[ACTIVO])
SELECT @COD_NEW
      ,[FK_CODPROCESO]
      ,[ORDEN]
      ,[ACTIVO]
FROM HOTEL_CONFIG_CIERRE_PROCESOS WHERE FK_CODIGOHOT = @COD_OLD
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'COPIAR CIERRE_PROCESOS',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CIERRE_PROCESOS',@COD_NEW,'OK');																																										
SET @ERROR = NULL


BEGIN TRY
INSERT INTO FOF_INFORME_PREVISION_SERVICIOS  
      ([FK_CODIGOHOT]
      ,[FK_CODIGOCP]
      ,[AGRUPACION]
      ,[ORDEN]
      ,[SIEMPRE_VISIBLE]
      ,[GRUPO_TOTAL]
      ,[VER_PREVSERVICIOS]
      ,[VER_BOOKING]
      ,[VER_ROOMRACK]
      ,[VER_RESERVA_NUMCAMPO])
SELECT @COD_NEW
      ,[FK_CODIGOCP]
      ,[AGRUPACION]
      ,[ORDEN]
      ,[SIEMPRE_VISIBLE]
      ,[GRUPO_TOTAL]
      ,[VER_PREVSERVICIOS]
      ,[VER_BOOKING]
      ,[VER_ROOMRACK]
      ,[VER_RESERVA_NUMCAMPO]
FROM FOF_INFORME_PREVISION_SERVICIOS WHERE FK_CODIGOHOT = @COD_OLD
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'COPIAR PREVISION SERVICIOS',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR PREVISION SERVICIOS',@COD_NEW,'OK');																																										
SET @ERROR = NULL

BEGIN TRY
INSERT INTO HOTEL_REGIMEN_CONTENIDO 
      ([FK_CODIGOHOT]
      ,[FK_CODREGIMEN]
      ,[FK_CODIGOCP]
      ,[FIJO]
      ,[PORC]
      ,[ORDEN]
      ,[EntradaPorDefecto])
SELECT @COD_NEW
      ,[FK_CODREGIMEN]
      ,[FK_CODIGOCP]
      ,[FIJO]
      ,[PORC]
      ,[ORDEN]
      ,[EntradaPorDefecto]
FROM HOTEL_REGIMEN_CONTENIDO WHERE FK_CODIGOHOT = @COD_OLD
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'COPIAR REGIMEN_CONTENIDO',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR REGIMEN_CONTENIDO',@COD_NEW,'OK');																																										
SET @ERROR = NULL

BEGIN TRY
DELETE FROM HOTEL_CONFIG_DESGLOSE WHERE FK_CODIGOHOT = @COD_NEW
INSERT INTO HOTEL_CONFIG_DESGLOSE 
      ([FK_CODIGOHOT]
      ,[PORC_HAB]
      ,[PORC_PEN]
      ,[FIJO_HAB]
      ,[FIJO_PEN])
SELECT @COD_NEW
      ,[PORC_HAB]
      ,[PORC_PEN]
      ,[FIJO_HAB]
      ,[FIJO_PEN]
FROM HOTEL_CONFIG_DESGLOSE WHERE FK_CODIGOHOT = @COD_OLD
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'COPIAR CONFIG_DESGLOSE',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CONFIG_DESGLOSE',@COD_NEW,'OK');																																										
SET @ERROR = NULL

BEGIN TRY
DELETE FROM HOTEL_CONCSPRODUC_INFORMES WHERE [CODIGOHOT] = @COD_NEW
INSERT INTO HOTEL_CONCSPRODUC_INFORMES
      ([CODIGOHOT]
      ,[CODIGOCP]
      ,[CODINFORME]
      ,[PAGINA]
      ,[VISIBLE]
      ,[CALCULAR]
      ,[OCUPACION]
      ,[INGRESO]
      ,[MULTIPLICA])
	-- DECLARE @COD_NEW VARCHAR (5) = '111'
	-- DECLARE @COD_OLD VARCHAR (5) = '003'
SELECT @COD_NEW
      ,hci.[CODIGOCP]
      ,hci.[CODINFORME]
      ,hci.[PAGINA]
      ,hci.[VISIBLE]
      ,hci.[CALCULAR]
      ,hci.[OCUPACION]
      ,hci.[INGRESO]
      ,hci.[MULTIPLICA]
FROM HOTEL_CONCSPRODUC_INFORMES hci
left join  RELCONCSPRODUC  r
on r.CODIGOCP = hci.CODIGOCP AND HCI.CODIGOHOT = R.CODIGOHOT
WHERE r.FK_CODTIPOHAB = '' AND
hci.CODIGOHOT = @COD_OLD and
r.codigohot = @cod_old
AND HCI.CODIGOCP LIKE '*%' --OR HCI.CODIGOCP LIKE '$%'
group by hci.codigocp,hci.[CODINFORME]
      ,hci.[PAGINA]
      ,hci.[VISIBLE]
      ,hci.[CALCULAR]
      ,hci.[OCUPACION]
      ,hci.[INGRESO]
      ,hci.[MULTIPLICA]
	 ORDER BY CODIGOCP


	 INSERT INTO HOTEL_CONCSPRODUC_INFORMES
      ([CODIGOHOT]
      ,[CODIGOCP]
      ,[CODINFORME]
      ,[PAGINA]
      ,[VISIBLE]
      ,[CALCULAR]
      ,[OCUPACION]
      ,[INGRESO]
      ,[MULTIPLICA])
	-- DECLARE @COD_NEW VARCHAR (5) = '111'
	-- DECLARE @COD_OLD VARCHAR (5) = '003'
SELECT @COD_NEW
      ,hci.[CODIGOCP]
      ,hci.[CODINFORME]
      ,hci.[PAGINA]
      ,hci.[VISIBLE]
      ,hci.[CALCULAR]
      ,hci.[OCUPACION]
      ,hci.[INGRESO]
      ,hci.[MULTIPLICA]
FROM HOTEL_CONCSPRODUC_INFORMES hci
left join  RELCONCSPRODUC  r
on r.CODIGOCP = hci.CODIGOCP AND HCI.CODIGOHOT = R.CODIGOHOT
WHERE r.FK_CODTIPOHAB = '' AND
hci.CODIGOHOT = @COD_OLD and
r.codigohot = @cod_old
AND HCI.CODIGOCP LIKE '$%'
group by hci.codigocp,hci.[CODINFORME]
      ,hci.[PAGINA]
      ,hci.[VISIBLE]
      ,hci.[CALCULAR]
      ,hci.[OCUPACION]
      ,hci.[INGRESO]
      ,hci.[MULTIPLICA]
	 ORDER BY CODIGOCP



END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH
SELECT * FROM HOTELES

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR INFORME PRODUCCION',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR INFORME PRODUCCION',@COD_NEW,'OK');																																										
SET @ERROR = NULL

BEGIN TRY
INSERT INTO CONCSPRODUC
([CODIGOCP]
           ,[DESCRIPCION]
           ,[FK_CONCEPTOSREPLIC]
           ,[CODIGOTIHA]
           ,[COD_DESCRIPCION_FACTURA]
           ,[PAX]
           ,[ESTADO_GESTION_WEB]
           ,[USO_FRECUENTE]
           ,[COD_DESCRIPCION]
           ,[FK_CODGRUPO_CONCEPTO]
           ,[FK_CODCLASIF_CONCEPTO]
           ,[FK_CODNIVEL]
           ,[ORDEN]
           ,[DESGLOSE]
           ,[CONTENIDO]
           ,[PRECIOX]
           ,[FK_TIPO_FOLIO_DEFECTO]
           ,[TIPO_IVA_HOTEL]
           ,[CUENTA_CONTABLE]
           ,[CENTRO_COSTE]
           ,[CUENTA_ANALITICA]
           ,[CP_VENTA]
           ,[CP_PRODUCCION]
           ,[AFECTA_CAJA]
           ,[DURACION]
           ,[SISTEMA])
SELECT CODTIPOHAB
      ,DESCRIPCION
      ,'HAB'
      ,CODTIPOHAB
      ,'0'
      ,'2'
      ,'A'
      ,'1'
      ,'0'
      ,''
      ,''
      ,'VAR'
      ,'1000'
      ,'0'
      ,'0'
      ,'H'
      ,'P'
      ,'0'
      ,''
      ,''
      ,''
      ,'1'
      ,'1'
      ,''
      ,'1'
      ,'0'
FROM HOTEL_TIPO_HAB
WHERE FK_CODIGOHOT = @COD_NEW and CODTIPOHAB <> '' AND CODTIPOHAB NOT IN (SELECT CODIGOCP FROM CONCSPRODUC)
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CONCSPRODIC TIPOHAB',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR CONCSPRODUC TIPOHAB',@COD_NEW,'OK');																																										
SET @ERROR = NULL


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
      ,[TIPO_ESTADISTICA_OCUP])
SELECT FK_CODIGOHOT
      ,CODTIPOHAB
      ,DESCRIPCION
      ,CODTIPOHAB
      ,'0'
      ,'0'
      ,'0'
      ,''
      ,''
      ,''
      ,'A'
      ,'0'
      ,'0'
      ,CODTIPOHAB
      ,'HAB'
      ,''
      ,''
      ,'0'
      ,'H'
      ,'0'
      ,'P'
      ,''
      ,''
      ,''
      ,'1'
      ,'1'
      ,''
      ,'H'
      ,'C'
      ,'1'
      ,'0'
      ,''
      ,''
      ,'0'
      ,'0'
      ,'1'
      ,'1'
      ,NULL
      ,''
FROM HOTEL_TIPO_HAB
WHERE FK_CODIGOHOT = @COD_NEW  and CODTIPOHAB <> '' AND CODTIPOHAB NOT IN (SELECT CODIGOCP FROM RELCONCSPRODUC WHERE CODIGOHOT = @COD_NEW)
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR RELCONCS TIPOHAB',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR RELCONCS TIPOHAB',@COD_NEW,'OK');																																										
SET @ERROR = NULL



   BEGIN TRY
IF NOT EXISTS (SELECT * FROM TIPO_SERVICIO_GOBERNANTA WHERE CODSERVICIO = 'SAB') INSERT INTO TIPO_SERVICIO_GOBERNANTA  ([CODSERVICIO],[DESCRIPCION],[TEXTOBREVE],[FRECUENCIA]) VALUES  ('SAB','SABANA','SAB','')
IF NOT EXISTS (SELECT * FROM  HOTEL_CONFIG_SERVICIO_GOBERNANTA WHERE FK_CODIGOHOT = @COD_NEW and FK_CODSERVICIO = 'SAB')     INSERT INTO HOTEL_CONFIG_SERVICIO_GOBERNANTA ([FK_CODIGOHOT],[FK_CODSERVICIO],[ACTIVO],[ORDEN])  VALUES (@COD_NEW,'SAB','1','1')
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR SERVICIO GOBER',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'CREAR SERVICIO GOBER',@COD_NEW,'OK');	
SET @ERROR = NULL

BEGIN TRY 
EXEC.SP_MANTENIMIENTO_INSERTAR_INFORMEPRODUCCION @COD_NEW
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
SET @ERROR = ERROR_MESSAGE()
END CATCH

IF @ERROR <> ''
 BEGIN
   
   INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'REVISAR INFORME DE PRODUCCION',@COD_NEW,@ERROR)
   END ELSE  INSERT INTO INSTALACION_LOG_ERROR VALUES (getdate(),@COD_NEW,'REVISAR INFORME DE PRODUCCION',@COD_NEW,'OK');	
SET @ERROR = NULL

/*****Script de Garrido*****/
END
