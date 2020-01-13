
ALTER PROCEDURE [dbo].[SP_MANTENIMIENTO_HOTEL]

  @CodigoHot    Varchar (3),
  @Desde    Datetime,
  @Hasta  Datetime,
  @PVarchar Varchar (50), 
  @PDatetime Datetime, 
  @PParametro1 int,
  @PParametro2 int,
  @Pbit bit,
  @Parametro Int 
  
AS BEGIN

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
	      EXEC.[SP_MANTENIMIENTO_REVISA_CIERRE]@CodigoHot,@desde
    End


	If (@Parametro = '3') /*Parametro en BETA */
      Begin                      /*Funci?n que compara crs_drerserva con FOF_HABITACION_BOOKING (Planning) para buscar diferencias y repara */

                 if @CodigoHot > ''  /*Si la app nos da codigohot */
                   Begin

                       
                         Declare CURSOR_ASSIGN Cursor Local For 
                           Select DISTINCT (CD.ID),CD.CODIGOHOT,CD.FK_CODHAB 
                             From  crs_dreserva CD (nolock) 
                       		                         INNER JOIN FOF_HABITACION_BOOKING FHB
                                                          on FHB.ID_CRS_DRESERVA = CD.ID
                                                            INNER JOIN HOTEL_HABITACION HH
                                                            ON FHB.FK_CODHAB = HH.CODHAB and FHB.FK_CODIGOHOT = HH.FK_CODIGOHOT
                                                              INNER JOIN HOTEL_HABITACION HH2
                                	                             ON CD.FK_CODHAB = HH2.CODHAB AND CD.CODIGOHOT = HH2.FK_CODIGOHOT
                                                        WHERE 
                                                        FHB.FK_CODHAB <> CD.FK_CODHAB and
                                                        FHB.DESDE >= dbo.FN_HOY()AND
                       						      --FHB.FK_CODIGOHOT = '900' AND
											 CD.ESTADO <> 'CLX'
                       
                         Open CURSOR_ASSIGN 
                         Fetch Next From CURSOR_ASSIGN 
                           into @CODIGOHOT, @CODHAB, @ID_DRESERVA 
                       
                         While (@@FETCH_STATUS = 0) 
                         Begin 
					 
					  SET @FECHA_HORA = GETDATE()
                           
					  Exec SP_CAMBIO_HABITACION @Codigohot,@Codhab,@Codhab,@Id_dreserva,''
                   
				       INSERT INTO [INSTALACION_LOG_ERROR]
					  SELECT @FECHA_HORA , @CODIGOHOT , 'REASIGNACION',@Id_dreserva,@Codhab

                           Fetch Next From CURSOR_ASSIGN 
                             into @CODIGOHOT, @CODHAB, @ID_DRESERVA 
                         End 
                         Close CURSOR_ASSIGN 
                         Deallocate CURSOR_ASSIGN 
	 
	           End Else
	             Begin      /*multihotel la app no nos da codigohot */
		            
		
                       Declare CURSOR_ASSIGN Cursor Local For 
                         Select DISTINCT (CD.ID),CD.CODIGOHOT,CD.FK_CODHAB 
                           From  crs_dreserva CD (nolock) 
                     		                         INNER JOIN FOF_HABITACION_BOOKING FHB
                                                        on FHB.ID_CRS_DRESERVA = CD.ID
                                                          INNER JOIN HOTEL_HABITACION HH
                                                          ON FHB.FK_CODHAB = HH.CODHAB and FHB.FK_CODIGOHOT = HH.FK_CODIGOHOT
                                                            INNER JOIN HOTEL_HABITACION HH2
                              	                             ON CD.FK_CODHAB = HH2.CODHAB AND CD.CODIGOHOT = HH2.FK_CODIGOHOT
                                                      WHERE 
                                                      FHB.FK_CODHAB <> CD.FK_CODHAB and
                                                      FHB.DESDE >= dbo.FN_HOY() AND
										    CD.ESTADO <> 'CLX'
                     
                       Open CURSOR_ASSIGN 
                       Fetch Next From CURSOR_ASSIGN 
                         into @CODIGOHOT, @CODHAB, @ID_DRESERVA 
                     
                       While (@@FETCH_STATUS = 0) 
                       Begin 
				      
					  SET @FECHA_HORA = GETDATE()
                           
					  Exec.SP_CAMBIO_HABITACION @Codigohot,@Codhab,@Codhab,@Id_dreserva,''
                   
				       INSERT INTO [INSTALACION_LOG_ERROR]
					  SELECT @FECHA_HORA , @CODIGOHOT , 'REASIGNACION',@Id_dreserva,@Codhab

                         Fetch Next From CURSOR_ASSIGN 
                           into @CODIGOHOT, @CODHAB, @ID_DRESERVA 
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




	   If (@Parametro = '8') /*Revisa Cierre*/
	Begin    
	DELETE FROM CRS_DRESERVA WHERE ID_MRESERVA = @PParametro1 AND FK_TIPO_CREACION_RESERVA = 'BLOQB'



END


  If (@Parametro = '9') /*Cambia comisionista*/
	Begin    
	UPDATE FOF_FOLIO_CLIENTE SET FK_CODEMPRESA = @PParametro1 WHERE fk_id_folio = @Pparametro2
	



END




  If (@Parametro = '10') /*cerrar facturas rectificadas*/
	Begin    
	
       update fof_folio
       set factura = 1, FACTURA_RECTIFICA = NULL,id_folio_rectifica = null, id_folio_abona = 0, fk_creacion_folio = 'RES', fk_codtipofra = 'F1'
       where id = @PParametro2



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


End 


END








GO

