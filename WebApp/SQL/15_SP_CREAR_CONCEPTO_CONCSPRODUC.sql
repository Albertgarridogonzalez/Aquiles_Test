

CREATE PROCEDURE [dbo].[SP_CREAR_CONCEPTO_CONCSPRODUC]
@CODIGOCP VARCHAR(5),
@DESCRIPCION VARCHAR(20) , 
@TIPO INT, 
@IVA INT

AS

BEGIN


DECLARE @CODNIVEL VARCHAR(5)

SET @CODNIVEL = CASE @TIPO WHEN 1 THEN 'HAB' WHEN 2 THEN 'VRHB' WHEN 3 THEN 'VAR' WHEN 4 THEN 'RES' WHEN 5 THEN 'DEP' END

INSERT INTO CONCSPRODUC
VALUES(@CODIGOCP
      ,@DESCRIPCION
      ,CASE @CODNIVEL WHEN 'HAB' THEN 'HAB' WHEN 'VRHB' THEN 'HAB' ELSE 'OTR' END
      ,''
      ,0
      ,1
      ,'A'
      ,0
      ,0
      ,''
      ,''
      ,@CODNIVEL
      ,0
      ,0
      ,0
      ,'S'
      ,'P'
      ,@IVA
      ,''
      ,''
      ,''
      ,1
      ,1
      ,0
      ,1
      ,0)
	
END

