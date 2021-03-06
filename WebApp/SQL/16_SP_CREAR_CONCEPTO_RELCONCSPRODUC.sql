
CREATE PROCEDURE [dbo].[SP_CREAR_CONCEPTO_RELCONCSPRODUC]
@CODIGOHOT VARCHAR(3),
@CODIGOCP VARCHAR(5),
@DESCRIPCION VARCHAR(30),
@TIPO INT,
@IVA INT,
@ID_COBRO INT

AS

BEGIN

DECLARE @CODNIVEL VARCHAR(5)

SET @CODNIVEL = CASE @TIPO WHEN 1 THEN 'HAB' WHEN 2 THEN 'VRHB' WHEN 3 THEN 'VAR' WHEN 4 THEN 'RES' WHEN 5 THEN 'DEP' END

INSERT INTO RELCONCSPRODUC
VALUES (
		@CODIGOHOT
      ,@CODIGOCP
      ,@DESCRIPCION
      ,@CODIGOCP
      ,0
      ,0
      ,0
      ,@DESCRIPCION
      ,@DESCRIPCION
      ,@DESCRIPCION
      ,'A'
      ,0
      ,0
      ,CASE @CODNIVEL WHEN 'HAB' THEN @CODIGOCP ELSE '' END
      ,@CODNIVEL
      ,''
      ,1
      ,0
      ,'S'
      ,@IVA
      ,'P'
      ,''
      ,''
      ,''
      ,1
      ,1
      ,''
      ,CASE @CODNIVEL WHEN 'HAB' THEN 'H' WHEN 'DEP' THEN 'D' ELSE 'C' END
      ,CASE WHEN @CODNIVEL = 'DEP' AND (@IVA = 2 OR @IVA = 3) THEN 'A' ELSE 'C' END
      ,1
      ,0
      ,NULL
      ,@ID_COBRO
      ,0
      ,0
      ,CASE @CODNIVEL WHEN 'DEP' THEN 0 ELSE 1 END
      ,CASE @CODNIVEL WHEN 'DEP' THEN 0 ELSE 1 END
      ,CASE WHEN @CODNIVEL = 'VRHB' THEN '*SCP' WHEN @CODNIVEL = 'VRHB' AND @DESCRIPCION LIKE '%NO SHOW%' THEN '*NSP' ELSE NULL END
      ,0
      ,CASE @CODNIVEL WHEN 'DEP' THEN 0 ELSE 1 END
      ,0
      ,0
      ,0
      ,0
      ,NULL)
	
END

