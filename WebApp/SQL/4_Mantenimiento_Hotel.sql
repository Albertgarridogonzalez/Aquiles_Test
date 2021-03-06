
create PROCEDURE [dbo].[SP_MANTENIMIENTO_HOTEL]

  @CodigoHot    Varchar (3),
  @Desde    Datetime,
  @Hasta  Datetime,
  @PVarchar Varchar (50), 
  @PDatetime Datetime, 
  @PParametro1 int,
  @PParametro2 int,
  @Pbit bit,
  @Decimal1 decimal(19,2),
  @Parametro Int 
  
AS BEGIN
set language spanish;
Declare  @Codhab INT, 
         @Id_Dreserva Int,
	    @Fecha_Hora Datetime

    If (@Parametro = '1') /*Resconstruir Informe de Producción */
	   Begin
	
	       DECLARE @RC int
	       EXECUTE @RC = [dbo].[SP_FOF_RECONSTRUYE_PRODOCUP] 
                    @Codigohot
                   ,@Desde
                   ,@Hasta
	     
    END

    If (@Parametro = '2') /*Revisa Cierre*/
	   Begin
	   --  SELECT * FROM HOTEL_CIERRE_LOG
	       IF (@PBIT = 1)
	       BEGIN
	       
		   UPDATE HOTEL_CIERRE_PROCESOS_LOG SET FECHAHORA_FIN = GETDATE () , ERROR = '888'
		   FROM HOTEL_CIERRE_PROCESOS_LOG HCPL
		   LEFT JOIN HOTEL_CIERRE_LOG HCL
		   ON HCPL.FK_ID_HOTEL_PROCESO_CIERRE = HCL.ID 
		   WHERE HCL.FK_CODIGOHOT = @CODIGOHOT  AND HCL.FECHAHOTEL = @desde  AND HCPL.FECHAHORA_FIN IS NULL
            AND HCPL.FK_CODPROCESO NOT IN ('SPCIE0','SPCIE4')    

	       END ELSE
	       BEGIN
	           
	          EXEC.[SP_MANTENIMIENTO_REVISA_CIERRE]@CodigoHot,@desde

               UPDATE HOTEL_CIERRE_PROCESOS_LOG SET FECHAHORA_FIN = GETDATE () 
		   FROM HOTEL_CIERRE_PROCESOS_LOG HCPL
		   LEFT JOIN HOTEL_CIERRE_LOG HCL
		   ON HCPL.FK_ID_HOTEL_PROCESO_CIERRE = HCL.ID 
		   WHERE HCL.FK_CODIGOHOT = @CODIGOHOT  AND HCL.FECHAHOTEL = @desde  AND (HCPL.FECHAHORA_FIN IS NULL OR HCPL.ERROR IS NULL)
            AND HCPL.FK_CODPROCESO NOT IN ('SPCIE0','SPCIE4')    
	       END
    End



	If (@Parametro = '3') /*Parametro en BETA */
      Begin                      /*Funci�n que compara crs_drerserva con FOF_HABITACION_BOOKING (Planning) para buscar diferencias y repara */

                 if @CodigoHot > ''  /*Si la app nos da codigohot */
                   Begin

                       
                         Declare CURSOR_ASSIGN Cursor Local For 
                           Select DISTINCT (CD.ID),CD.CODIGOHOT,CD.FK_CODHAB 
                             From  crs_dreserva CD (nolock) 
                       		                         INNER JOIN FOF_HABITACION_BOOKING FHB
                                                          on FHB.ID_CRS_DRESERVA = CD.ID
                                                           --INNER JOIN HOTEL_HABITACION HH
                                                           --ON FHB.FK_CODHAB = HH.CODHAB and FHB.FK_CODIGOHOT = HH.FK_CODIGOHOT
                                                           --   INNER JOIN HOTEL_HABITACION HH2
                                	                      --      ON CD.FK_CODHAB = HH2.CODHAB AND CD.CODIGOHOT = HH2.FK_CODIGOHOT
                                                        WHERE 
                                                        FHB.FK_CODHAB <> CD.FK_CODHAB and
                                                        FHB.DESDE >= dbo.FN_HOY()AND
                       						      FHB.FK_CODIGOHOT = @CodigoHot AND
											 CD.CODIGOHOT = @CodigoHot AND
											 CD.ESTADO <> 'CLX'
                       
                         Open CURSOR_ASSIGN 
                         Fetch Next From CURSOR_ASSIGN 
                           into @ID_DRESERVA  ,@CODIGOHOT, @CODHAB 
                       
                         While (@@FETCH_STATUS = 0) 
                         Begin 
					 
					  SET @FECHA_HORA = GETDATE()
                           
					  Exec SP_CAMBIO_HABITACION @Codigohot,@Codhab,@Codhab,@Id_dreserva,''
                   -- Exec SP_CAMBIO_HABITACION '902','','',34637,''


				       INSERT INTO [INSTALACION_LOG_ERROR]
					  SELECT @FECHA_HORA , @CODIGOHOT , 'REASIGNACION',@Id_dreserva,@Codhab

                           Fetch Next From CURSOR_ASSIGN 
                             into @ID_DRESERVA  ,@CODIGOHOT, @CODHAB
                         End 
                         Close CURSOR_ASSIGN 
                         Deallocate CURSOR_ASSIGN 


					 Declare CURSOR_ASSIGN2 Cursor Local For 
                           Select DISTINCT (CD.ID),CD.CODIGOHOT,CD.FK_CODHAB 
                             From  crs_dreserva CD (nolock) 
                       		                         INNER JOIN FOF_HABITACION_BOOKING FHB
                                                          on FHB.ID_CRS_DRESERVA = CD.ID
                                                           --INNER JOIN HOTEL_HABITACION HH
                                                           --ON FHB.FK_CODHAB = HH.CODHAB and FHB.FK_CODIGOHOT = HH.FK_CODIGOHOT
                                                           --   INNER JOIN HOTEL_HABITACION HH2
                                	                      --      ON CD.FK_CODHAB = HH2.CODHAB AND CD.CODIGOHOT = HH2.FK_CODIGOHOT
                                                        WHERE 
                                                        FHB.FK_CODHAB <> CD.FK_CODHAB and
                                                        FHB.DESDE >= dbo.FN_HOY()AND
                       						      FHB.FK_CODIGOHOT = @CodigoHot AND
											 CD.CODIGOHOT = @CodigoHot AND
											 CD.ESTADO <> 'CLX'
                       
                         Open CURSOR_ASSIGN2 
                         Fetch Next From CURSOR_ASSIGN2 
                           into @ID_DRESERVA  ,@CODIGOHOT, @CODHAB
                       
                         While (@@FETCH_STATUS = 0) 
                         Begin 
					 
					  SET @FECHA_HORA = GETDATE()
                           
					 -- Exec SP_CAMBIO_HABITACION @Codigohot,@Codhab,'',@Id_dreserva,''
                           update crs_dreserva set fk_codhab = '' where id = @Id_dreserva


				       INSERT INTO [INSTALACION_LOG_ERROR]
					  SELECT @FECHA_HORA , @CODIGOHOT , 'REASIGNACION',@Id_dreserva,@Codhab

                           Fetch Next From CURSOR_ASSIGN2 
                             into @CODIGOHOT, @CODHAB, @ID_DRESERVA 
                         End 
                         Close CURSOR_ASSIGN2 
                         Deallocate CURSOR_ASSIGN2 


	 
	           End Else
	             Begin      /*multihotel la app no nos da codigohot */
		            
		
                       Declare CURSOR_ASSIGN Cursor Local For 
                                    Select DISTINCT (CD.ID),CD.CODIGOHOT,CD.FK_CODHAB 
                             From  crs_dreserva CD (nolock) 
                       		                         INNER JOIN FOF_HABITACION_BOOKING FHB
                                                          on FHB.ID_CRS_DRESERVA = CD.ID
                                                           --INNER JOIN HOTEL_HABITACION HH
                                                           --ON FHB.FK_CODHAB = HH.CODHAB and FHB.FK_CODIGOHOT = HH.FK_CODIGOHOT
                                                           --   INNER JOIN HOTEL_HABITACION HH2
                                	                      --      ON CD.FK_CODHAB = HH2.CODHAB AND CD.CODIGOHOT = HH2.FK_CODIGOHOT
                                                        WHERE 
                                                      FHB.FK_CODHAB <> CD.FK_CODHAB and
                                                      FHB.DESDE >= dbo.FN_HOY() AND
										    CD.ESTADO <> 'CLX'
                     
                       Open CURSOR_ASSIGN 
                       Fetch Next From CURSOR_ASSIGN 
                         into @ID_DRESERVA  ,@CODIGOHOT, @CODHAB
                     
                       While (@@FETCH_STATUS = 0) 
                       Begin 
				      
					  SET @FECHA_HORA = GETDATE()
                           
					  Exec.SP_CAMBIO_HABITACION @Codigohot,@Codhab,@Codhab,@Id_dreserva,''
                   
				       INSERT INTO [INSTALACION_LOG_ERROR]
					  SELECT @FECHA_HORA , @CODIGOHOT , 'REASIGNACION',@Id_dreserva,@Codhab

                         Fetch Next From CURSOR_ASSIGN 
                           into @ID_DRESERVA  ,@CODIGOHOT, @CODHAB
                       End 
                       Close CURSOR_ASSIGN 
                       Deallocate CURSOR_ASSIGN 
		   		       
	            End
    End 


	  If (@Parametro = '4') /*Reconst. cargos reservas a futuro*/
	BEGIN
	IF @PParametro1 <> 0
	
	Begin
	  
	     Declare @CHECKIN datetime 
          Declare @USUARIO varchar (10)  
          Declare CURSOR_RSV Cursor Local For 
                    Select DR.ID, DR.CHECKIN, 'TESIPRO'
                       From CRS_DRESERVA DR (NOLOCK) 
                       Where (DR.CODIGOHOT = @CodigoHot) And (DR.CHECKIN >= dbo.FN_HOY()) And (DR.FK_CODCONDICION <> 'CKI')  AND DR.ID_MRESERVA = @PParametro1
                    Order by DR.CHECKIN 
                 
                   Open CURSOR_RSV 
                   Fetch Next From CURSOR_RSV 
                     into @ID_DRESERVA, @CHECKIN, @USUARIO 
                 
                   While (@@FETCH_STATUS = 0) 
                   Begin 
                     Exec dbo.SP_RESERVA_CRS_CREARCARGOS_DETALLE @ID_DRESERVA, @USUARIO, 0 
                     Fetch Next From CURSOR_RSV 
                       into @ID_DRESERVA, @CHECKIN, @USUARIO 
                   End 
                   Close CURSOR_RSV 
                   Deallocate CURSOR_RSV
             END Else 
		   BEGIN
	                  
                       Declare CURSOR_RSV Cursor Local For 
                                 Select DR.ID, DR.CHECKIN, 'TESIPRO'
                                    From CRS_DRESERVA DR (NOLOCK) 
                                    Where (DR.CODIGOHOT = @CodigoHot) And (DR.CHECKIN >= dbo.FN_HOY()) And (DR.FK_CODCONDICION <> 'CKI') 
                                 Order by DR.CHECKIN 
                              
                                Open CURSOR_RSV 
                                Fetch Next From CURSOR_RSV 
                                  into @ID_DRESERVA, @CHECKIN, @USUARIO 
                              
                                While (@@FETCH_STATUS = 0) 
                                Begin 
                                  Exec dbo.SP_RESERVA_CRS_CREARCARGOS_DETALLE @ID_DRESERVA, @USUARIO, 0 
                                  Fetch Next From CURSOR_RSV 
                                    into @ID_DRESERVA, @CHECKIN, @USUARIO 
                                End 
                                Close CURSOR_RSV 
                                Deallocate CURSOR_RSV
                  END
					
					       
                 
           
                 

End 



   If (@Parametro = '5') /*Reconst. cargos reservas a futuro ya en checkin*/
	BEGIN
  
          Declare CURSOR_RSV Cursor Local For 
                    Select DR.ID, DR.CHECKIN, 'TESIPRO'
                       From CRS_DRESERVA DR (NOLOCK) 
                       Where (DR.CODIGOHOT = @CodigoHot) And (DR.CHECKIN >= dbo.FN_HOY()) And (DR.FK_CODCONDICION = 'CKI')  AND DR.ID_MRESERVA = @PParametro1
                    Order by DR.CHECKIN 
                 
                   Open CURSOR_RSV 
                   Fetch Next From CURSOR_RSV 
                     into @ID_DRESERVA, @CHECKIN, @USUARIO 
                 
                   While (@@FETCH_STATUS = 0) 
                   Begin 
                     Exec dbo.SP_RESERVA_CRS_CREARCARGOS_DETALLE @ID_DRESERVA, @USUARIO, 0 
                     Fetch Next From CURSOR_RSV 
                       into @ID_DRESERVA, @CHECKIN, @USUARIO 
                   End 
                   Close CURSOR_RSV 
                   Deallocate CURSOR_RSV
             
         

End 

   If (@Parametro = '6') /*indica no cerrable*/
	Begin    
	UPDATE FOF_FOLIO SET NO_CERRABLE = @Pbit WHERE ID = @PParametro1
 End


    If (@Parametro = '7') /*Cargos desaparecidos ejemplo togumar*/
	Begin    
	If @Pparametro2 in (select id from fof_folio where fk_id_dreserva = @Pparametro1) and @Codigohot in (select fk_codigohot from fof_folio where fk_id_dreserva = @Pparametro1)
	Begin	
	UPDATE FOF_FOLIO_ITEM SET  ID_FOLIO = @Pparametro2 WHERE fk_id_dreserva = @PParametro1 and id_folio in (select id from fof_folio where fk_id_dreserva = @PParametro1 and numfactura <> 0 ) and fecha_hotel is null
     End

end

	   If (@Parametro = '8') /*Revisa Cierre*/
	Begin    
	DELETE FROM CRS_DRESERVA WHERE ID_MRESERVA = @PParametro1 AND FK_TIPO_CREACION_RESERVA = 'BLOQB'



END

-- select * from FOF_FOLIO_CLIENTE   select * from instalacion_log_error
  If (@Parametro = '9') /*Cambia comisionista*/
	Begin    
	if not exists (select * from FOF_FOLIO_CLIENTE where fk_id_folio = @Pparametro2)
	begin
	insert into FOF_FOLIO_CLIENTE SELECT @Pparametro2,POSICION,FK_CODEMPRESA,COMISIONISTA,VISIBLE,EDITABLE FROM FOF_FOLIO_CLIENTE WHERE FK_ID_FOLIO = @PParametro1
	end
	else
	begin
	DELETE FROM FOF_FOLIO_CLIENTE WHERE FK_ID_FOLIO = @Pparametro2
	insert into FOF_FOLIO_CLIENTE SELECT @Pparametro2,POSICION,FK_CODEMPRESA,COMISIONISTA,VISIBLE,EDITABLE FROM FOF_FOLIO_CLIENTE WHERE FK_ID_FOLIO = @PParametro1
	
	end
	



END




  If (@Parametro = '10') /*cerrar facturas rectificadas*/
	Begin    
	
       update fof_folio
       set factura = 1, FACTURA_RECTIFICA = NULL,id_folio_rectifica = null, id_folio_abona = 0, fk_creacion_folio = 'RES', fk_codtipofra = 'F1'
       where id = @PParametro1
	  insert into FOF_FOLIO_CIERREFORZADO values (@PParametro1,GETDATE(),GETDATE())


END

  If (@Parametro = '11') /*CUADRAR CUADRE DIA A CASCOPORRIX*/
	Begin    
	
		INSERT INTO LISTADO_PROD_PDTE_FRAR_AFTER
		SELECT @CodigoHot      ,@Desde      ,0      ,'TES'      ,1      ,'TESIPRO'      ,NULL      ,NULL      ,1      ,0      ,0      ,0      ,0      ,0      ,0
			,0      ,0      ,@Decimal1      ,0      ,@Decimal1      ,0      ,0      ,0      ,0      ,''      ,NULL      ,0      ,''      ,''      ,0      ,0

         
END


  If (@Parametro = '12') /*DARLE CODFOLIO A FOLIO*/
	Begin    
	
		UPDATE FOF_FOLIO
		SET CODFOLIO = @PParametro2,     -- 
		FK_CODHAB =  @PParametro2
		WHERE  FK_CODIGOHOT = @CODIGOHOT 
		AND ID = @PParametro1

END


If (@Parametro = '13') /*RESERVA BUGGEADA*/
	Begin    
	
update  CRS_DRESERVA_PROFILE
set PN_DOCUMENT_TYPE = 'PST'
WHERE id_dreservas = @PParametro1

END


If (@Parametro = '14') /*DDEPOSITO RESERVA*/
	Begin    

INSERT INTO DDEPOSITO_RESERVA
SELECT DDEP.ID, 2, NULL, CD.ID, NULL,NULL,NULL, 'TESI', GETDATE ()
FROM DDEPOSITO DDEP
LEFT JOIN MDEPOSITO MDEP
ON MDEP.ID = DDEP.FK_ID_MDEPOSITO
LEFT JOIN CRS_DRESERVA CD
ON MDEP.FK_ID_MRESERVA = CD.ID_MRESERVA 
WHERE CD.ID = @PPARAMETRO1

END




If (@Parametro = '15') /*CIERRE FORZADO FOLIO*/
	Begin    
	
INSERT INTO FOF_FOLIO_CIERREFORZADO
VALUES (@PParametro1 ,GETDATE (), GETDATE())

END





If (@Parametro = '50') /*cerrar facturas rectificadas*/
	Begin    
	
     SELECT top 1 * FROM HOTEL_CIERRE_LOG WHERE FK_CODIGOHOT ='" & codigohot & "' ORDER BY FECHAHOTEL DESC



END





If (@Parametro = '100')  /*Comapra crs_drerserva con FOF_HABITACION_BOOKING (Planning) para buscar diferencias*/
  Begin 
                If @Codigohot > '' /*Si la app nos da codigohot */
	             Begin
                   (select FHB.FK_CODIGOHOT,CD.CODIGOHOT, FHB.FK_CODMODHAB, FHB.FK_CODHAB, CD.FK_CODHAB, FHB.DESDE, FHB.HASTA, CD.ID_MRESERVA, CD.ID, HH.DESCRIPCION As HABITACION_PLANNING, HH2.DESCRIPCION As HABITACION_RESERVA from crs_dreserva CD (nolock)
                    RIGHT JOIN FOF_HABITACION_BOOKING FHB
                    on FHB.ID_CRS_DRESERVA = CD.ID
                      INNER JOIN HOTEL_HABITACION HH
                      ON FHB.FK_CODHAB = HH.CODHAB and FHB.FK_CODIGOHOT = HH.FK_CODIGOHOT
                        INNER JOIN HOTEL_HABITACION HH2
                   	ON CD.FK_CODHAB = HH2.CODHAB AND CD.CODIGOHOT = HH2.FK_CODIGOHOT
                   WHERE 
                    FHB.FK_CODIGOHOT = @Codigohot and
                    FHB.FK_CODHAB <> CD.FK_CODHAB and
                    FHB.DESDE >= dbo.FN_HOY() and 
				CD.ESTADO <> 'CLX'
                    )
	             
                End Else
	               Begin   /*multihotel la app no nos da codigohot */
	   	       (select FHB.FK_CODIGOHOT,CD.CODIGOHOT, FHB.FK_CODMODHAB, FHB.FK_CODHAB, CD.FK_CODHAB, FHB.DESDE, FHB.HASTA, CD.ID_MRESERVA, CD.ID, HH.DESCRIPCION As HABITACION_PLANNING, HH2.DESCRIPCION As HABITACION_RESERVA from crs_dreserva CD (nolock)
                    RIGHT JOIN FOF_HABITACION_BOOKING FHB
                    on FHB.ID_CRS_DRESERVA = CD.ID
                      INNER JOIN HOTEL_HABITACION HH
                      ON FHB.FK_CODHAB = HH.CODHAB and FHB.FK_CODIGOHOT = HH.FK_CODIGOHOT
                        INNER JOIN HOTEL_HABITACION HH2
                   	ON CD.FK_CODHAB = HH2.CODHAB AND CD.CODIGOHOT = HH2.FK_CODIGOHOT
                   WHERE 
                    FHB.FK_CODHAB <> CD.FK_CODHAB and
                    FHB.DESDE >= dbo.FN_HOY() AND
                    CD.ESTADO <> 'CLX')
                   End
  
End

    If (@Parametro = '101') /*habitación out of order no decuenta de crs */
	Begin
              Select DESCRIPCION, FK_TIPOHAB from HOTEL_HABITACION
               Where FK_TIPOHAB NOT IN (Select CODIGOCP from RELCONCSPRODUC Where CODIGOHOT = @Codigohot ) and FK_CODIGOHOT = @Codigohot
              Select DESCRIPCION, FK_TIPOHAB from HOTEL_MODULO_HAB
               Where FK_TIPOHAB NOT IN (Select CODIGOCP from RELCONCSPRODUC Where CODIGOHOT = @Codigohot) and FK_CODIGOHOT = @Codigohot
 
 End 

 	   
                 

End
  
    If (@Parametro = '102') /*Estado Conectores */
	Begin
	      SELECT * FROM CONECTOR_TEMPO_ACTIVIDAD   





END



