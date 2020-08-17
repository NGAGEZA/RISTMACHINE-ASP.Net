Imports System.Net

Public Class Securitychecktool
    Inherits Page
    Protected Property Mcno() As String
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()

        Else
            'Getdata for edit Page 3
            If Not String.IsNullOrEmpty(Request.QueryString("ep3mcno")) Then
                Mcno = Request.QueryString("ep3mcno")

               if FindMcno(Mcno) = 0


                   lnksave.Text = "Save"
                   lbmcno.Text = Mcno

               End If

                If lnksave.Text <> "UPDATE"
                    Getdata()
                    lnksave.Text = "UPDATE"
                End If



            End If

        End If
    End Sub
    Public Function FindMcno(fmcno As String) As Integer
        ' local variable declaration */
        Dim result As Integer
        Using db As New DBRISTMCDataContext
            Try

                Dim getdata = db.TB_SECURITies.Where(Function(x) x.MC_NO = fmcno).ToList()

                result = getdata.Count

            Catch ex As Exception
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                    
                NotifySticker(message,4,624)

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally

                FindMcno = result
                db.Dispose()
               ' ClientScript.RegisterStartupScript(Me.GetType(), "alert", "UpdateComplete()", True)
            End Try
        End Using

        
        
    End Function
    Private Sub Getdata()

        Mcno = Request.QueryString("ep3mcno")
        
        Using db As New DBRISTMCDataContext()
            Try

                
                Dim getdata = db.TB_SECURITies.Where(Function(x) x.MC_NO = Mcno).ToList()


                If getdata IsNot Nothing Then

                    For Each s In getdata
                        lbmcno.Text = s.MC_NO

                        choice1.Value = s.R_1
                        tbpb1.Value = s.PB1.Trim()
                        tbresp1.Value = s.RS1.Trim()
                        If s.DT1 IsNot Nothing Then tbdt1.Value = s.DT1

                        choice2.Value = s.R_2
                        tbpb2.Value = s.PB2.Trim()
                        tbresp2.Value = s.RS2.Trim()
                        if s.DT2 IsNot Nothing Then tbdt2.Value = s.DT2

                        choice3.Value = s.R_3
                        tbpb3.Value = s.PB3.Trim()
                        tbresp3.Value = s.RS3.Trim()
                        If s.DT3 IsNot Nothing Then tbdt3.Value = s.DT3

                        choice4.Value = s.R_4
                        tbpb4.Value = s.PB4.Trim()
                        tbresp4.Value = s.RS4.Trim()
                        If s.DT4 IsNot Nothing Then tbdt4.Value = s.DT4

                        choice5.Value = s.R_5
                        tbpb5.Value = s.PB5.Trim()
                        tbresp5.Value = s.RS5.Trim()
                        If s.DT5 IsNot Nothing Then tbdt5.Value = s.DT5

                        choice6.Value = s.R_6
                        tbpb6.Value = s.PB6.Trim()
                        tbresp6.Value = s.RS6.Trim()
                        If s.DT6 IsNot Nothing Then tbdt6.Value = s.DT6

                        choice7.Value = s.R_7
                        tbpb7.Value = s.PB7.Trim()
                        tbresp7.Value = s.RS7.Trim()
                        If s.DT7 IsNot Nothing Then tbdt7.Value = s.DT7

                        choice8.Value = s.R_8
                        tbpb8.Value = s.PB8.Trim()
                        tbresp8.Value = s.RS8.Trim()
                        If s.DT8 IsNot Nothing Then tbdt8.Value = s.DT8

                        choice9.Value = s.R_9
                        tbpb9.Value = s.PB9.Trim()
                        tbresp9.Value = s.RS9.Trim()
                        If s.DT9 IsNot Nothing Then tbdt9.Value = s.DT9

                        choicex10.Value = s.R_10
                        tbpbx10.Value = s.PB10.Trim()
                        tbrespx10.Value = s.RS10.Trim()
                        If s.DT10 IsNot Nothing Then tbdtx10.Value = s.DT10

                        choicex11.Value = s.R_11
                        tbpbx11.Value = s.PB11.Trim()
                        tbrespx11.Value = s.RS11.Trim()
                        If s.DT11 IsNot Nothing Then tbdtx11.Value = s.DT11

                        choiceb12.Value = s.R_12
                        tbpbb12.Value = s.PB12.Trim()
                        tbrespb12.Value = s.RS12.Trim()
                        If s.DT12 IsNot Nothing Then tbdtb12.Value = s.DT12

                        choicec13.Value = s.R_13
                        tbpbc13.Value = s.PB13.Trim()
                        tbrespc13.Value = s.RS13.Trim()
                        If s.DT13 IsNot Nothing Then tbdtc13.Value = s.DT13

                        choiced14.Value = s.R_14
                        tbpbd14.Value = s.PB14.Trim()
                        tbrespd14.Value = s.RS14.Trim()
                        If s.DT14 IsNot Nothing Then tbdtd14.Value = s.DT14

                        choicee15.Value = s.R_15
                        tbpbe15.Value = s.PB15.Trim()
                        tbrespe15.Value = s.RS15.Trim()
                        If s.DT15 IsNot Nothing Then tbdte15.Value = s.DT15

                        choicef16.Value = s.R_16
                        tbpbf16.Value = s.PB16.Trim()
                        tbrespf16.Value = s.RS16.Trim()
                        If s.DT16 IsNot Nothing Then tbdtf16.Value = s.DT16

                        choiceg17.Value = s.R_17
                        tbpbg17.Value = s.PB17.Trim()
                        tbrespg17.Value = s.RS17.Trim()
                        If s.DT17 IsNot Nothing Then tbdtg17.Value = s.DT17
                        
                        choiceh18.Value = s.R_18
                        tbpbh18.Value = s.PB18.Trim()
                        tbresph18.Value = s.RS18.Trim()
                        If s.DT18 IsNot Nothing Then tbdth18.Value = s.DT18

                        choicei19.Value = s.R_19
                        tbpbi19.Value = s.PB19.Trim()
                        tbrespi19.Value = s.RS19.Trim()
                        If s.DT19 IsNot Nothing Then tbdti19.Value = s.DT19

                        choicej20.Value = s.R_20
                        tbpbj20.Value = s.PB20.Trim()
                        tbrespj20.Value = s.RS20.Trim()
                        If s.DT20 IsNot Nothing Then tbdtj20.Value = s.DT20

                        choicek21.Value = s.R_21
                        tbpbk21.Value = s.PB21.Trim()
                        tbrespk21.Value = s.RS21.Trim()
                        If s.DT21 IsNot Nothing Then tbdtk21.Value = s.DT21

                        choicel22.Value = s.R_22
                        tbpbl22.Value = s.PB22.Trim()
                        tbrespl22.Value = s.RS22.Trim()
                        If s.DT22 IsNot Nothing Then tbdtl22.Value = s.DT22

                        choicem23.Value = s.R_23
                        tbpbm23.Value = s.PB23.Trim()
                        tbrespm23.Value = s.RS23.Trim()
                        If s.DT23 IsNot Nothing Then tbdtm23.Value = s.DT23

                        choicen24.Value = s.R_24
                        tbpbn24.Value = s.PB24.Trim()
                        tbrespn24.Value = s.RS24.Trim()
                        If s.DT24 IsNot Nothing Then tbdtn24.Value = s.DT24

                        choiceo25.Value = s.R_25
                        tbpbo25.Value = s.PB25.Trim()
                        tbrespo25.Value = s.RS25.Trim()
                        If s.DT25 IsNot Nothing Then tbdto25.Value = s.DT25

                        choicep26.Value = s.R_26
                        tbpbp26.Value = s.PB26.Trim()
                        tbrespp26.Value = s.RS26.Trim()
                        If s.DT26 IsNot Nothing Then tbdtp26.Value = s.DT26

                        choiceq27.Value = s.R_27
                        tbpbq27.Value = s.PB27.Trim()
                        tbrespq27.Value = s.RS27.Trim()
                        If s.DT27 IsNot Nothing Then tbdtq27.Value = s.DT27

                        choicer28.Value = s.R_28
                        tbpbr28.Value = s.PB28.Trim()
                        tbrespr28.Value = s.RS28.Trim()
                        If s.DT28 IsNot Nothing Then tbdtr28.Value = s.DT28

                        choices29.Value = s.R_29
                        tbpbs29.Value = s.PB29.Trim()
                        tbresps29.Value = s.RS29.Trim()
                        If s.DT29 IsNot Nothing Then tbdts29.Value = s.DT29

                        choicet30.Value = s.R_30
                        tbpbt30.Value = s.PB30.Trim()
                        tbrespt30.Value = s.RS30.Trim()
                        If s.DT30 IsNot Nothing Then tbdtt30.Value = s.DT30

                        choiceu31.Value = s.R_31
                        tbpbu31.Value = s.PB31.Trim()
                        tbrespu31.Value = s.RS31.Trim()
                        If s.DT31 IsNot Nothing Then tbdtu31.Value = s.DT31

                        choicev32.Value = s.R_32
                        tbpbv32.Value = s.PB32.Trim()
                        tbrespv32.Value = s.RS32.Trim()
                        If s.DT32 IsNot Nothing Then tbdtv32.Value = s.DT32

                        choicew33.Value = s.R_33
                        tbpbw33.Value = s.PB33.Trim()
                        tbrespw33.Value = s.RS33.Trim()
                        If s.DT33 IsNot Nothing Then tbdtw33.Value = s.DT33

                        choicex34.Value = s.R_34
                        tbpbx34.Value = s.PB34.Trim()
                        tbrespx34.Value = s.RS34.Trim()
                        If s.DT34 IsNot Nothing Then tbdtx34.Value = s.DT34

                        choicey35.Value = s.R_35
                        tbpby35.Value = s.PB35.Trim()
                        tbrespy35.Value = s.RS35.Trim()
                        If s.DT35 IsNot Nothing Then tbdty35.Value = s.DT35

                        choicez36.Value = s.R_36
                        tbpbz36.Value = s.PB36.Trim()
                        tbrespz36.Value = s.RS36.Trim()
                        If s.DT36 IsNot Nothing Then tbdtz36.Value = s.DT36

                        choiceza37.Value = s.R_37
                        tbpbza37.Value = s.PB37.Trim()
                        tbrespza37.Value = s.RS37.Trim()
                        If s.DT37 IsNot Nothing Then tbdtza37.Value = s.DT37

                        choicezx38.Value = s.R_38
                        tbpbzx38.Value = s.PB38.Trim()
                        tbrespzx38.Value = s.RS38.Trim()
                        If s.DT38 IsNot Nothing Then tbdtzx38.Value = s.DT38

                        choicezc39.Value = s.R_39
                        tbpbzc39.Value = s.PB39.Trim()
                        tbrespzc39.Value = s.RS39.Trim()
                        If s.DT39 IsNot Nothing Then tbdtzc39.Value = s.DT39

                        choicezv40.Value = s.R_40
                        tbpbzv40.Value = s.PB40.Trim()
                        tbrespzv40.Value = s.RS40.Trim()
                        If s.DT40 IsNot Nothing Then tbdtzv40.Value = s.DT40

                        choicezs41.Value = s.R_41
                        tbpbzs41.Value = s.PB41.Trim()
                        tbrespzs41.Value = s.RS41.Trim()
                        If s.DT41 IsNot Nothing Then tbdtzs41.Value = s.DT41
                    Next

                End If
            Catch ex As Exception

            End Try
        End Using

    End Sub
    Protected Sub Callfunction()
        Select Case lnksave.Text
          
            Case "UPDATE"
                UpdateData()
            Case "Save"
                InsertData()

           
        End Select
    End Sub
    'Public Function DbNullOrStringValue(value As String) As Object
    '    Dim dt As Date
    '    If Date.TryParse(value, dt) Then
           
    '        Return value
    '    End If
    '    'Return true
    'End Function

    Public Function DbNullOrStringValue(value As String) As Object
        If DbNullOrStringValue(value) Then
            Return value = ""
        Else
            Return value
        End If
    End Function
    Protected Sub UpdateData
        Using db = New DBRISTMCDataContext

            Try
                Mcno = Request.QueryString("ep3mcno")



                Dim opnocookie As HttpCookie = Request.Cookies("opno")
                Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
                

                Dim ipcookie As HttpCookie = Request.Cookies("ip")
                Dim ip as String = If(ipcookie IsNot Nothing, ipcookie.Value.Split("="c)(1), "undefined")

                Dim se = db.TB_SECURITies.FirstOrDefault(Function (x) x.MC_NO = Mcno)

                If se IsNot Nothing

                     Dim dt As Date

               

                    se.MC_NO = Mcno

                    se.R_1 = choice1.Value
                    se.PB1 = tbpb1.Value
                    se.RS1 = tbresp1.Value
                    If Date.TryParse(tbdt1.Value, dt) Then
                        se.DT1 = dt
                    End If

                    se.R_2 = choice2.Value
                    se.PB2 = tbpb2.Value
                    se.RS2 = tbresp2.Value
                    If Date.TryParse(tbdt2.Value, dt) Then
                        se.DT2 = dt
                    End If

                    se.R_3 = choice3.Value
                    se.PB3 = tbpb3.Value
                    se.RS3 = tbresp3.Value
                    If Date.TryParse(tbdt3.Value, dt) Then
                        se.DT3 = dt
                    End If

                    se.R_4 = choice4.Value
                    se.PB4 = tbpb4.Value
                    se.RS4 = tbresp4.Value
                    If Date.TryParse(tbdt4.Value, dt) Then
                        se.DT4 = dt
                    End If

                    se.R_4 = choice4.Value
                    se.PB4 = tbpb4.Value
                    se.RS4 = tbresp4.Value
                    If Date.TryParse(tbdt4.Value, dt) Then
                        se.DT4 = dt
                    End If

                    se.R_5 = choice5.Value
                    se.PB5 = tbpb5.Value
                    se.RS5 = tbresp5.Value
                    If Date.TryParse(tbdt5.Value, dt) Then
                        se.DT5 = dt
                    End If

                    se.R_6 = choice6.Value
                    se.PB6 = tbpb6.Value
                    se.RS6 = tbresp6.Value
                    If Date.TryParse(tbdt6.Value, dt) Then
                        se.DT6 = dt
                    End If
                   
                    se.R_7 = choice7.Value
                    se.PB7 = tbpb7.Value
                    se.RS7 = tbresp7.Value
                    If Date.TryParse(tbdt7.Value, dt) Then
                        se.DT7 = dt
                    End If

                    se.R_8 = choice8.Value
                    se.PB8 = tbpb8.Value
                    se.RS8 = tbresp8.Value
                    If Date.TryParse(tbdt8.Value, dt) Then
                        se.DT8 = dt
                    End If

                    se.R_9 = choice9.Value
                    se.PB9 = tbpb9.Value
                    se.RS9 = tbresp9.Value
                    If Date.TryParse(tbdt9.Value, dt) Then
                        se.DT9 = dt
                    End If

                    se.R_10 = choicex10.Value
                    se.PB10 = tbpbx10.Value
                    se.RS10 = tbrespx10.Value
                    If Date.TryParse(tbdtx10.Value, dt) Then
                        se.DT10 = dt
                    End If

                    se.R_11 = choicex11.Value
                    se.PB11 = tbpbx11.Value
                    se.RS11 = tbrespx11.Value
                    If Date.TryParse(tbdtx11.Value, dt) Then
                        se.DT11 = dt
                    End If

                    se.R_12 = choiceb12.Value
                    se.PB12 = tbpbb12.Value
                    se.RS12 = tbrespb12.Value
                    If Date.TryParse(tbdtb12.Value, dt) Then
                        se.DT12 = dt
                    End If

                    se.R_13 = choicec13.Value
                    se.PB13 = tbpbc13.Value
                    se.RS13 = tbrespc13.Value
                    If Date.TryParse(tbdtc13.Value, dt) Then
                        se.DT13 = dt
                    End If

                    se.R_14 = choiced14.Value
                    se.PB14 = tbpbd14.Value
                    se.RS14 = tbrespd14.Value
                    If Date.TryParse(tbdtd14.Value, dt) Then
                        se.DT14 = dt
                    End If

                    se.R_15 = choicee15.Value
                    se.PB15 = tbpbe15.Value
                    se.RS15 = tbrespe15.Value
                    If Date.TryParse(tbdte15.Value, dt) Then
                        se.DT15 = dt
                    End If

                    se.R_16 = choicef16.Value
                    se.PB16 = tbpbf16.Value
                    se.RS16 = tbrespf16.Value
                    If Date.TryParse(tbdtf16.Value, dt) Then
                        se.DT16 = dt
                    End If

                    se.R_17 = choiceg17.Value
                    se.PB17 = tbpbg17.Value
                    se.RS17 = tbrespg17.Value
                    If Date.TryParse(tbdtg17.Value, dt) Then
                        se.DT17 = dt
                    End If

                    se.R_18 = choiceh18.Value
                    se.PB18 = tbpbh18.Value
                    se.RS18 = tbresph18.Value
                    If Date.TryParse(tbdth18.Value, dt) Then
                        se.DT18 = dt
                    End If

                    se.R_19 = choicei19.Value
                    se.PB19 = tbpbi19.Value
                    se.RS19 = tbrespi19.Value
                    If Date.TryParse(tbdti19.Value, dt) Then
                        se.DT19 = dt
                    End If

                    se.R_20 = choicej20.Value
                    se.PB20 = tbpbj20.Value
                    se.RS20 = tbrespj20.Value
                    If Date.TryParse(tbdtj20.Value, dt) Then
                        se.DT20 = dt
                    End If

                    se.R_21 = choicek21.Value
                    se.PB21 = tbpbk21.Value
                    se.RS21 = tbrespk21.Value
                    If Date.TryParse(tbdtk21.Value, dt) Then
                        se.DT21 = dt
                    End If

                    se.R_22 = choicel22.Value
                    se.PB22 = tbpbl22.Value
                    se.RS22 = tbrespl22.Value
                    If Date.TryParse(tbdtl22.Value, dt) Then
                        se.DT22 = dt
                    End If

                    se.R_23 = choicem23.Value
                    se.PB23 = tbpbm23.Value
                    se.RS23 = tbrespm23.Value
                    If Date.TryParse(tbdtm23.Value, dt) Then
                        se.DT23 = dt
                    End If

                    se.R_24 = choicen24.Value
                    se.PB24 = tbpbn24.Value
                    se.RS24 = tbrespn24.Value
                    If Date.TryParse(tbdtn24.Value, dt) Then
                        se.DT24 = dt
                    End If

                    se.R_25 = choiceo25.Value
                    se.PB25 = tbpbo25.Value
                    se.RS25 = tbrespo25.Value
                    If Date.TryParse(tbdto25.Value, dt) Then
                        se.DT25 = dt
                    End If

                    se.R_26 = choicep26.Value
                    se.PB26 = tbpbp26.Value
                    se.RS26 = tbrespp26.Value
                    If Date.TryParse(tbdtp26.Value, dt) Then
                        se.DT26 = dt
                    End If

                    se.R_27 = choiceq27.Value
                    se.PB27 = tbpbq27.Value
                    se.RS27 = tbrespq27.Value
                    If Date.TryParse(tbdtq27.Value, dt) Then
                        se.DT27 = dt
                    End If

                    se.R_28 = choicer28.Value
                    se.PB28 = tbpbr28.Value
                    se.RS28 = tbrespr28.Value
                    If Date.TryParse(tbdtr28.Value, dt) Then
                        se.DT28 = dt
                    End If

                    se.R_29 = choices29.Value
                    se.PB29 = tbpbs29.Value
                    se.RS29 = tbresps29.Value
                    If Date.TryParse(tbdts29.Value, dt) Then
                        se.DT29 = dt
                    End If

                    se.R_30 = choicet30.Value
                    se.PB30 = tbpbt30.Value
                    se.RS30 = tbrespt30.Value
                    If Date.TryParse(tbdtt30.Value, dt) Then
                        se.DT30 = dt
                    End If

                    se.R_31 = choiceu31.Value
                    se.PB31 = tbpbu31.Value
                    se.RS31 = tbrespu31.Value
                    If Date.TryParse(tbdtu31.Value, dt) Then
                        se.DT31 = dt
                    End If

                    se.R_32 = choicev32.Value
                    se.PB32 = tbpbv32.Value
                    se.RS32 = tbrespv32.Value
                    If Date.TryParse(tbdtv32.Value, dt) Then
                        se.DT32 = dt
                    End If

                    se.R_33 = choicew33.Value
                    se.PB33 = tbpbw33.Value
                    se.RS33 = tbrespw33.Value
                    If Date.TryParse(tbdtw33.Value, dt) Then
                        se.DT33 = dt
                    End If

                    se.R_34 = choicex34.Value
                    se.PB34 = tbpbx34.Value
                    se.RS34 = tbrespx34.Value
                    If Date.TryParse(tbdtx34.Value, dt) Then
                        se.DT34 = dt
                    End If

                    se.R_35 = choicey35.Value
                    se.PB35 = tbpby35.Value
                    se.RS35 = tbrespy35.Value
                    If Date.TryParse(tbdty35.Value, dt) Then
                        se.DT35 = dt
                    End If

                    se.R_36 = choicez36.Value
                    se.PB36 = tbpbz36.Value
                    se.RS36 = tbrespz36.Value
                    If Date.TryParse(tbdtz36.Value, dt) Then
                        se.DT36 = dt
                    End If

                    se.R_37 = choiceza37.Value
                    se.PB37 = tbpbza37.Value
                    se.RS37 = tbrespza37.Value
                    If Date.TryParse(tbdtza37.Value, dt) Then
                        se.DT37 = dt
                    End If

                    se.R_38 = choicezx38.Value
                    se.PB38 = tbpbzx38.Value
                    se.RS38 = tbrespzx38.Value
                    If Date.TryParse(tbdtzx38.Value, dt) Then
                        se.DT38 = dt
                    End If

                    se.R_39 = choicezc39.Value
                    se.PB39 = tbpbzc39.Value
                    se.RS39 = tbrespzc39.Value
                    If Date.TryParse(tbdtzc39.Value, dt) Then
                        se.DT39 = dt
                    End If

                    se.R_40 = choicezv40.Value
                    se.PB40 = tbpbzv40.Value
                    se.RS40 = tbrespzv40.Value
                    If Date.TryParse(tbdtzv40.Value, dt) Then
                        se.DT40 = dt
                    End If

                    se.R_41 = choicezs41.Value
                    se.PB41 = tbpbzs41.Value
                    se.RS41 = tbrespzs41.Value
                    If Date.TryParse(tbdtzs41.Value, dt) Then
                        se.DT41 = dt
                    End If

                    se.IP = ip
                    se.OPNO_UPDATE = opno
                    se.DATE_UPDATE = DateTime.Now

                    db.SubmitChanges()


                End If

               
                
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "UpdateComplete()", True)
            Catch ex As Exception
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try

        End Using

    End Sub
  
    Protected Sub InsertData
     

        Using db = New DBRISTMCDataContext

            Try

                Dim opnocookie As HttpCookie = Request.Cookies("opno")
                Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
                

                Dim ipcookie As HttpCookie = Request.Cookies("ip")
                Dim ip as String = If(ipcookie IsNot Nothing, ipcookie.Value.Split("="c)(1), "undefined")
                Mcno = Request.QueryString("ep3mcno")
                'function insert TB_SECURITY
                Dim se = New TB_SECURITY()

                
                Dim dt As Date
               

                se.MC_NO = Mcno

                se.R_1 = choice1.Value
                se.PB1 = tbpb1.Value
                se.RS1 = tbresp1.Value
                If Date.TryParse(tbdt1.Value, dt) Then
                    se.DT1 = dt
                End If

                se.R_2 = choice2.Value
                se.PB2 = tbpb2.Value
                se.RS2 = tbresp2.Value
                If Date.TryParse(tbdt2.Value, dt) Then
                    se.DT2 = dt
                End If

                se.R_3 = choice3.Value
                se.PB3 = tbpb3.Value
                se.RS3 = tbresp3.Value
                If Date.TryParse(tbdt3.Value, dt) Then
                    se.DT3 = dt
                End If

                se.R_4 = choice4.Value
                se.PB4 = tbpb4.Value
                se.RS4 = tbresp4.Value
                If Date.TryParse(tbdt4.Value, dt) Then
                    se.DT4 = dt
                End If

                se.R_4 = choice4.Value
                se.PB4 = tbpb4.Value
                se.RS4 = tbresp4.Value
                If Date.TryParse(tbdt4.Value, dt) Then
                    se.DT4 = dt
                End If

                se.R_5 = choice5.Value
                se.PB5 = tbpb5.Value
                se.RS5 = tbresp5.Value
                If Date.TryParse(tbdt5.Value, dt) Then
                    se.DT5 = dt
                End If

                se.R_6 = choice6.Value
                se.PB6 = tbpb6.Value
                se.RS6 = tbresp6.Value
                If Date.TryParse(tbdt6.Value, dt) Then
                    se.DT6 = dt
                End If
               
                se.R_7 = choice7.Value
                se.PB7 = tbpb7.Value
                se.RS7 = tbresp7.Value
                If Date.TryParse(tbdt7.Value, dt) Then
                    se.DT7 = dt
                End If

                se.R_8 = choice8.Value
                se.PB8 = tbpb8.Value
                se.RS8 = tbresp8.Value
                If Date.TryParse(tbdt8.Value, dt) Then
                    se.DT8 = dt
                End If

                se.R_9 = choice9.Value
                se.PB9 = tbpb9.Value
                se.RS9 = tbresp9.Value
                If Date.TryParse(tbdt9.Value, dt) Then
                    se.DT9 = dt
                End If

                se.R_10 = choicex10.Value
                se.PB10 = tbpbx10.Value
                se.RS10 = tbrespx10.Value
                If Date.TryParse(tbdtx10.Value, dt) Then
                    se.DT10 = dt
                End If

                se.R_11 = choicex11.Value
                se.PB11 = tbpbx11.Value
                se.RS11 = tbrespx11.Value
                If Date.TryParse(tbdtx11.Value, dt) Then
                    se.DT11 = dt
                End If

                se.R_12 = choiceb12.Value
                se.PB12 = tbpbb12.Value
                se.RS12 = tbrespb12.Value
                If Date.TryParse(tbdtb12.Value, dt) Then
                    se.DT12 = dt
                End If

                se.R_13 = choicec13.Value
                se.PB13 = tbpbc13.Value
                se.RS13 = tbrespc13.Value
                If Date.TryParse(tbdtc13.Value, dt) Then
                    se.DT13 = dt
                End If

                se.R_14 = choiced14.Value
                se.PB14 = tbpbd14.Value
                se.RS14 = tbrespd14.Value
                If Date.TryParse(tbdtd14.Value, dt) Then
                    se.DT14 = dt
                End If

                se.R_15 = choicee15.Value
                se.PB15 = tbpbe15.Value
                se.RS15 = tbrespe15.Value
                If Date.TryParse(tbdte15.Value, dt) Then
                    se.DT15 = dt
                End If

                se.R_16 = choicef16.Value
                se.PB16 = tbpbf16.Value
                se.RS16 = tbrespf16.Value
                If Date.TryParse(tbdtf16.Value, dt) Then
                    se.DT16 = dt
                End If

                se.R_17 = choiceg17.Value
                se.PB17 = tbpbg17.Value
                se.RS17 = tbrespg17.Value
                If Date.TryParse(tbdtg17.Value, dt) Then
                    se.DT17 = dt
                End If

                se.R_18 = choiceh18.Value
                se.PB18 = tbpbh18.Value
                se.RS18 = tbresph18.Value
                If Date.TryParse(tbdth18.Value, dt) Then
                    se.DT18 = dt
                End If

                se.R_19 = choicei19.Value
                se.PB19 = tbpbi19.Value
                se.RS19 = tbrespi19.Value
                If Date.TryParse(tbdti19.Value, dt) Then
                    se.DT19 = dt
                End If

                se.R_20 = choicej20.Value
                se.PB20 = tbpbj20.Value
                se.RS20 = tbrespj20.Value
                If Date.TryParse(tbdtj20.Value, dt) Then
                    se.DT20 = dt
                End If

                se.R_21 = choicek21.Value
                se.PB21 = tbpbk21.Value
                se.RS21 = tbrespk21.Value
                If Date.TryParse(tbdtk21.Value, dt) Then
                    se.DT21 = dt
                End If

                se.R_22 = choicel22.Value
                se.PB22 = tbpbl22.Value
                se.RS22 = tbrespl22.Value
                If Date.TryParse(tbdtl22.Value, dt) Then
                    se.DT22 = dt
                End If

                se.R_23 = choicem23.Value
                se.PB23 = tbpbm23.Value
                se.RS23 = tbrespm23.Value
                If Date.TryParse(tbdtm23.Value, dt) Then
                    se.DT23 = dt
                End If

                se.R_24 = choicen24.Value
                se.PB24 = tbpbn24.Value
                se.RS24 = tbrespn24.Value
                If Date.TryParse(tbdtn24.Value, dt) Then
                    se.DT24 = dt
                End If

                se.R_25 = choiceo25.Value
                se.PB25 = tbpbo25.Value
                se.RS25 = tbrespo25.Value
                If Date.TryParse(tbdto25.Value, dt) Then
                    se.DT25 = dt
                End If

                se.R_26 = choicep26.Value
                se.PB26 = tbpbp26.Value
                se.RS26 = tbrespp26.Value
                If Date.TryParse(tbdtp26.Value, dt) Then
                    se.DT26 = dt
                End If

                se.R_27 = choiceq27.Value
                se.PB27 = tbpbq27.Value
                se.RS27 = tbrespq27.Value
                If Date.TryParse(tbdtq27.Value, dt) Then
                    se.DT27 = dt
                End If

                se.R_28 = choicer28.Value
                se.PB28 = tbpbr28.Value
                se.RS28 = tbrespr28.Value
                If Date.TryParse(tbdtr28.Value, dt) Then
                    se.DT28 = dt
                End If

                se.R_29 = choices29.Value
                se.PB29 = tbpbs29.Value
                se.RS29 = tbresps29.Value
                If Date.TryParse(tbdts29.Value, dt) Then
                    se.DT29 = dt
                End If

                se.R_30 = choicet30.Value
                se.PB30 = tbpbt30.Value
                se.RS30 = tbrespt30.Value
                If Date.TryParse(tbdtt30.Value, dt) Then
                    se.DT30 = dt
                End If

                se.R_31 = choiceu31.Value
                se.PB31 = tbpbu31.Value
                se.RS31 = tbrespu31.Value
                If Date.TryParse(tbdtu31.Value, dt) Then
                    se.DT31 = dt
                End If

                se.R_32 = choicev32.Value
                se.PB32 = tbpbv32.Value
                se.RS32 = tbrespv32.Value
                If Date.TryParse(tbdtv32.Value, dt) Then
                    se.DT32 = dt
                End If

                se.R_33 = choicew33.Value
                se.PB33 = tbpbw33.Value
                se.RS33 = tbrespw33.Value
                If Date.TryParse(tbdtw33.Value, dt) Then
                    se.DT33 = dt
                End If

                se.R_34 = choicex34.Value
                se.PB34 = tbpbx34.Value
                se.RS34 = tbrespx34.Value
                If Date.TryParse(tbdtx34.Value, dt) Then
                    se.DT34 = dt
                End If

                se.R_35 = choicey35.Value
                se.PB35 = tbpby35.Value
                se.RS35 = tbrespy35.Value
                If Date.TryParse(tbdty35.Value, dt) Then
                    se.DT35 = dt
                End If

                se.R_36 = choicez36.Value
                se.PB36 = tbpbz36.Value
                se.RS36 = tbrespz36.Value
                If Date.TryParse(tbdtz36.Value, dt) Then
                    se.DT36 = dt
                End If

                se.R_37 = choiceza37.Value
                se.PB37 = tbpbza37.Value
                se.RS37 = tbrespza37.Value
                If Date.TryParse(tbdtza37.Value, dt) Then
                    se.DT37 = dt
                End If

                se.R_38 = choicezx38.Value
                se.PB38 = tbpbzx38.Value
                se.RS38 = tbrespzx38.Value
                If Date.TryParse(tbdtzx38.Value, dt) Then
                    se.DT38 = dt
                End If

                se.R_39 = choicezc39.Value
                se.PB39 = tbpbzc39.Value
                se.RS39 = tbrespzc39.Value
                If Date.TryParse(tbdtzc39.Value, dt) Then
                    se.DT39 = dt
                End If

                se.R_40 = choicezv40.Value
                se.PB40 = tbpbzv40.Value
                se.RS40 = tbrespzv40.Value
                If Date.TryParse(tbdtzv40.Value, dt) Then
                    se.DT40 = dt
                End If

                se.R_41 = choicezs41.Value
                se.PB41 = tbpbzs41.Value
                se.RS41 = tbrespzs41.Value
                If Date.TryParse(tbdtzs41.Value, dt) Then
                    se.DT41 = dt
                End If



                db.TB_SECURITies.InsertOnSubmit(se)
                db.SubmitChanges()


                NotifySticker("Insert Data Ok",4,624)
           
              
                
                Catch ex As Exception
                    Dim message As String = $"Message: {ex.Message}\n\n"
                    message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                    message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                    message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                    
                    NotifySticker(message,4,624)

                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
                Finally
                    db.Dispose()
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "UpdateComplete()", True)
                End Try
        End Using
    End Sub


   
    Private Shared Sub NotifySticker(linemsg As String,stickerPackageId  As Integer, stickerId As Integer)
        _lineNotify(linemsg,stickerPackageId,stickerId)
    End Sub

   
    Private Shared Sub _lineNotify(strmsg As String, stkpkgid As Integer, stkid As Integer)

        Const token As String = "thhDkG5yQg5EBjXY5U4s5URbN72C83DCYSBTtJFjvbb"

        Try
            Dim request = CType(WebRequest.Create("https://notify-api.line.me/api/notify"), HttpWebRequest)
            Dim postData = $"message={strmsg}"

            If stkpkgid > 0 AndAlso stkid > 0 Then
                Dim stickerPackageId = $"stickerPackageId={stkpkgid}"
                Dim stickerId = $"stickerId={stkid}"
                postData += "&" & stickerPackageId & "&" & stickerId
            End If

            Dim data = Encoding.UTF8.GetBytes(postData)
            request.Method = "POST"
            request.ContentType = "application/x-www-form-urlencoded"
            request.ContentLength = data.Length
            request.Headers.Add("Authorization", "Bearer " & token)

            Using stream = request.GetRequestStream()
                stream.Write(data, 0, data.Length)
            End Using

         
        Catch ex As Exception
            Console.WriteLine(ex.ToString())
        End Try
    End Sub

   
End Class