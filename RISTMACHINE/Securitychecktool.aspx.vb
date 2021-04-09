Option Strict On
Option Explicit On

Imports System.IO
Imports System.Net
Imports System.Net.Mail
Imports System.Security.Cryptography

Public Class Securitychecktool
    Inherits Page
    Private Property Mcno() As String
    Private Property Status() As String



    Private Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()

        Else
            'Getdata for edit
            If Not String.IsNullOrEmpty(Request.QueryString("ep3mcno")) Then

                Mcno = Request.QueryString("ep3mcno")

                Select Case CheckStatus(Mcno)

                    Case 0 '0 = Not Finish

                      If lnksave.Text <> "UPDATE"
                          Getdata()

                          lnksave.Text = "UPDATE"
                      End If
                       
                    Case 1
                        lnksave.Text = "CAN'T UPDATE"
                End Select


                'If lnksave.Text <> "UPDATE"
                '    Getdata()

                '    lnksave.Text = "UPDATE"
                'End If


                Exit Sub
             End If

            'If Not String.IsNullOrEmpty(Request.QueryString("ep3mcno")) Then

            '    Select Case CheckStatus(Request.QueryString("ep3mcno"))
            '        Case 0
                        
            '            lnksave.Text = "UPDATE"
            '            Getdata()

            '        Case 1
            '            lnksave.Text = "CAN'T UPDATE"
            '    End Select

                   
            'Else
            '    lnksave.Text = "Save"

            '    'If CountAttfilePageThree(Request.QueryString("ep3mcno")) <> 0 
                     
                    

                   

            '    'End If

                
            '    Exit Sub
            'End If

        End If
    End Sub

    Private Shared Function CountAttfilePageThree(mcno As String) As Integer
        Dim countfile As Integer
        Using db As New  DBRISTMCDataContext
            
            Try
                ' Mcno = Request.QueryString("emcno")
                Dim getfilecount  = db.TB_MACHINE_TOOL_CHECK_P3s.Count(Function (x) x.MC_NO = mcno)

                countfile = getfilecount
               
            
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
               

            Finally
                
                db.Dispose()
            End Try
                
        End Using
        Return countfile
    End Function

    Private Function FindMcno(fmcno As String) As Integer
        ' local variable declaration */
        Dim result As Integer
        Using db As New DBRISTMCDataContext
            Try

                Dim getdata = db.TB_MACHINE_TOOL_CHECK_P3s.Count(Function (x) x.MC_NO = fmcno)

                result = getdata

            Catch ex As Exception
                
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

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
        Status = Request.QueryString("status")
        Using db As New DBRISTMCDataContext()
            Try

                
                Dim getdata = db.TB_MACHINE_TOOL_CHECK_P3s.Where(Function(x) x.MC_NO = Mcno).ToList()
                

                If getdata IsNot Nothing Then

                    lbstatus.Text = Status

                    For Each s In getdata
                        lbmcno.Text = s.MC_NO

                        select_imp1_1.Value = s.A1_1_BEFORE_IMPORT
                        tb_imp1_1.Value = s.A1_1_BEFORE_IMPORT_NOTE
                        select_str1_1.Value = s.A1_1_BEFORE_START_WORK
                        tb_str1_1.Value = s.A1_1_BEFORE_START_WORK_NOTE

                        select_imp1_2.Value = s.A1_2_BEFORE_IMPORT
                        tb_imp1_2.Value = s.A1_2_BEFORE_IMPORT_NOTE
                        select_str1_2.Value = s.A1_2_BEFORE_START_WORK
                        tb_str1_2.Value = s.A1_2_BEFORE_START_WORK_NOTE
                       
                        select_imp1_A.Value = s.A1_A_BEFORE_IMPORT
                        tb_imp1_A.Value = s.A1_A_BEFORE_IMPORT_NOTE
                        select_str1_A.Value = s.A1_A_BEFORE_START_WORK
                        tb_str1_A.Value = s.A1_A_BEFORE_START_WORK_NOTE

                        select_imp1_3.Value = s.A1_3_BEFORE_IMPORT
                        tb_imp1_3.Value = s.A1_3_BEFORE_IMPORT_NOTE
                        select_str1_3.Value = s.A1_3_BEFORE_START_WORK
                        tb_str1_3.Value = s.A1_3_BEFORE_START_WORK_NOTE

                        select_imp1_4.Value = s.A1_4_BEFORE_IMPORT
                        tb_imp1_4.Value = s.A1_4_BEFORE_IMPORT_NOTE
                        select_str1_4.Value = s.A1_4_BEFORE_START_WORK
                        tb_str1_4.Value = s.A1_4_BEFORE_START_WORK_NOTE

                        select_imp1_5.Value = s.A1_5_BEFORE_IMPORT
                        tb_imp1_5.Value = s.A1_5_BEFORE_IMPORT_NOTE
                        select_str1_5.Value = s.A1_5_BEFORE_START_WORK
                        tb_str1_5.Value = s.A1_5_BEFORE_START_WORK_NOTE

                        select_imp1_6.Value = s.A1_6_BEFORE_IMPORT
                        tb_imp1_6.Value = s.A1_6_BEFORE_IMPORT_NOTE
                        select_str1_6.Value = s.A1_6_BEFORE_START_WORK
                        tb_str1_6.Value = s.A1_6_BEFORE_START_WORK_NOTE

                        select_imp1_7.Value = s.A1_7_BEFORE_IMPORT
                        tb_imp1_7.Value = s.A1_7_BEFORE_IMPORT_NOTE
                        select_str1_7.Value = s.A1_7_BEFORE_START_WORK
                        tb_str1_7.Value = s.A1_7_BEFORE_START_WORK_NOTE

                        select_imp1_8.Value = s.A1_8_BEFORE_IMPORT
                        tb_imp1_8.Value = s.A1_8_BEFORE_IMPORT_NOTE
                        select_str1_8.Value = s.A1_8_BEFORE_START_WORK
                        tb_str1_8.Value = s.A1_8_BEFORE_START_WORK_NOTE

                        select_imp1_9.Value = s.A1_9_BEFORE_IMPORT
                        tb_imp1_9.Value = s.A1_9_BEFORE_IMPORT_NOTE
                        select_str1_9.Value = s.A1_9_BEFORE_START_WORK
                        tb_str1_9.Value = s.A1_9_BEFORE_START_WORK_NOTE

                        select_imp1_10.Value = s.A1_10_BEFORE_IMPORT
                        tb_imp1_10.Value = s.A1_10_BEFORE_IMPORT_NOTE
                        select_str1_10.Value = s.A1_10_BEFORE_START_WORK
                        tb_str1_10.Value = s.A1_10_BEFORE_START_WORK_NOTE

                        select_imp1_11.Value = s.A1_11_BEFORE_IMPORT
                        tb_imp1_11.Value = s.A1_11_BEFORE_IMPORT_NOTE
                        select_str1_11.Value = s.A1_11_BEFORE_START_WORK
                        tb_str1_11.Value = s.A1_11_BEFORE_START_WORK_NOTE
                        '/////////////////////////////////////////////////'
                        select_imp12_1.Value = s.A2_1_BEFORE_IMPORT
                        tb_imp12_1.Value = s.A2_1_BEFORE_IMPORT_NOTE
                        select_str12_1.Value = s.A2_1_BEFORE_START_WORK
                        tb_str12_1.Value = s.A2_1_BEFORE_START_WORK_NOTE

                        select_imp12_2.Value = s.A2_2_BEFORE_IMPORT
                        tb_imp12_2.Value = s.A2_2_BEFORE_IMPORT_NOTE
                        select_str12_2.Value = s.A2_2_BEFORE_START_WORK
                        tb_str12_2.Value = s.A2_2_BEFORE_START_WORK_NOTE

                        select_imp12_3.Value = s.A2_3_BEFORE_IMPORT
                        tb_imp12_3.Value = s.A2_3_BEFORE_IMPORT_NOTE
                        select_str12_3.Value = s.A2_3_BEFORE_START_WORK
                        tb_str12_3.Value = s.A2_3_BEFORE_START_WORK_NOTE

                        select_imp12_4.Value = s.A2_4_BEFORE_IMPORT
                        tb_imp12_4.Value = s.A2_4_BEFORE_IMPORT_NOTE
                        select_str12_4.Value = s.A2_4_BEFORE_START_WORK
                        tb_str12_4.Value = s.A2_4_BEFORE_START_WORK_NOTE

                        select_imp12_5.Value = s.A2_5_BEFORE_IMPORT
                        tb_imp12_5.Value = s.A2_5_BEFORE_IMPORT_NOTE
                        select_str12_5.Value = s.A2_5_BEFORE_START_WORK
                        tb_str12_5.Value = s.A2_5_BEFORE_START_WORK_NOTE

                        select_imp12_6.Value = s.A2_6_BEFORE_IMPORT
                        tb_imp12_6.Value = s.A2_6_BEFORE_IMPORT_NOTE
                        select_str12_6.Value = s.A2_6_BEFORE_START_WORK
                        tb_str12_6.Value = s.A2_6_BEFORE_START_WORK_NOTE

                        select_imp12_7.Value = s.A2_7_BEFORE_IMPORT
                        tb_imp12_7.Value = s.A2_7_BEFORE_IMPORT_NOTE
                        select_str12_7.Value = s.A2_7_BEFORE_START_WORK
                        tb_str12_7.Value = s.A2_7_BEFORE_START_WORK_NOTE

                        select_imp2_1.Value = s.B1_1_BEFORE_IMPORT
                        tb_imp2_1.Value = s.B1_1_BEFORE_IMPORT_NOTE
                        select_str2_1.Value = s.B1_1_BEFORE_START_WORK
                        tb_str2_1.Value = s.B1_1_BEFORE_START_WORK_NOTE

                        select_imp2_2.Value = s.B1_2_BEFORE_IMPORT
                        tb_imp2_2.Value = s.B1_2_BEFORE_IMPORT_NOTE
                        select_str2_2.Value = s.B1_2_BEFORE_START_WORK
                        tb_str2_2.Value = s.B1_2_BEFORE_START_WORK_NOTE

                        select_imp2_3.Value = s.B1_3_BEFORE_IMPORT
                        tb_imp2_3.Value = s.B1_3_BEFORE_IMPORT_NOTE
                        select_str2_3.Value = s.B1_3_BEFORE_START_WORK
                        tb_str2_3.Value = s.B1_3_BEFORE_START_WORK_NOTE

                        select_imp2_4.Value = s.B1_4_BEFORE_IMPORT
                        tb_imp2_4.Value = s.B1_4_BEFORE_IMPORT_NOTE
                        select_str2_4.Value = s.B1_4_BEFORE_START_WORK
                        tb_str2_4.Value = s.B1_4_BEFORE_START_WORK_NOTE

                        select_imp2_5.Value = s.B1_5_BEFORE_IMPORT
                        tb_imp2_5.Value = s.B1_5_BEFORE_IMPORT_NOTE
                        select_str2_5.Value = s.B1_5_BEFORE_START_WORK
                        tb_str2_5.Value = s.B1_5_BEFORE_START_WORK_NOTE
                        '/////////////////////////////////////////////////////////////
                        select_imp31_1.Value = s.C1_1_BEFORE_IMPORT
                        tb_imp31_1.Value = s.C1_1_BEFORE_IMPORT_NOTE
                        select_str31_1.Value = s.C1_1_BEFORE_START_WORK
                        tb_str31_1.Value = s.C1_1_BEFORE_START_WORK_NOTE

                        select_imp31_2.Value = s.C1_2_BEFORE_IMPORT
                        tb_imp31_2.Value = s.C1_2_BEFORE_IMPORT_NOTE
                        select_str31_2.Value = s.C1_2_BEFORE_START_WORK
                        tb_str31_2.Value = s.C1_2_BEFORE_START_WORK_NOTE

                        select_imp31_3.Value = s.C1_3_BEFORE_IMPORT
                        tb_imp31_3.Value = s.C1_3_BEFORE_IMPORT_NOTE
                        select_str31_3.Value = s.C1_3_BEFORE_START_WORK
                        tb_str31_3.Value = s.C1_3_BEFORE_START_WORK_NOTE

                        select_imp31_4.Value = s.C1_4_BEFORE_IMPORT
                        tb_imp31_4.Value = s.C1_4_BEFORE_IMPORT_NOTE
                        select_str31_4.Value = s.C1_4_BEFORE_START_WORK
                        tb_str31_4.Value = s.C1_4_BEFORE_START_WORK_NOTE

                        select_imp31_5.Value = s.C1_5_BEFORE_IMPORT
                        tb_imp31_5.Value = s.C1_5_BEFORE_IMPORT_NOTE
                        select_str31_5.Value = s.C1_5_BEFORE_START_WORK
                        tb_str31_5.Value = s.C1_5_BEFORE_START_WORK_NOTE

                        select_imp31_6.Value = s.C1_6_BEFORE_IMPORT
                        tb_imp31_6.Value = s.C1_6_BEFORE_IMPORT_NOTE
                        select_str31_6.Value = s.C1_6_BEFORE_START_WORK
                        tb_str31_6.Value = s.C1_6_BEFORE_START_WORK_NOTE

                        select_imp31_7.Value = s.C1_7_BEFORE_IMPORT
                        tb_imp31_7.Value = s.C1_7_BEFORE_IMPORT_NOTE
                        select_str31_7.Value = s.C1_7_BEFORE_START_WORK
                        tb_str31_7.Value = s.C1_7_BEFORE_START_WORK_NOTE

                        select_imp31_8.Value = s.C1_8_BEFORE_IMPORT
                        tb_imp31_8.Value = s.C1_8_BEFORE_IMPORT_NOTE
                        select_str31_8.Value = s.C1_8_BEFORE_START_WORK
                        tb_str31_8.Value = s.C1_8_BEFORE_START_WORK_NOTE

                        select_imp31_9.Value = s.C1_9_BEFORE_IMPORT
                        tb_imp31_9.Value = s.C1_9_BEFORE_IMPORT_NOTE
                        select_str31_9.Value = s.C1_9_BEFORE_START_WORK
                        tb_str31_9.Value = s.C1_9_BEFORE_START_WORK_NOTE

                        select_imp31_10.Value = s.C1_10_BEFORE_IMPORT
                        tb_imp31_10.Value = s.C1_10_BEFORE_IMPORT_NOTE
                        select_str31_10.Value = s.C1_10_BEFORE_START_WORK
                        tb_str31_10.Value = s.C1_10_BEFORE_START_WORK_NOTE

                        select_imp32_A.Value = s.C2_A_BEFORE_IMPORT
                        tb_imp32_A.Value = s.C2_A_BEFORE_IMPORT_NOTE
                        select_str32_A.Value = s.C2_A_BEFORE_START_WORK
                        tb_str32_A.Value = s.C2_A_BEFORE_START_WORK_NOTE

                        select_imp32_B.Value = s.C2_B_BEFORE_IMPORT
                        tb_imp32_B.Value = s.C2_B_BEFORE_IMPORT_NOTE
                        select_str32_B.Value = s.C2_B_BEFORE_START_WORK
                        tb_str32_B.Value = s.C2_B_BEFORE_START_WORK_NOTE

                        select_imp32_C.Value = s.C2_C_BEFORE_IMPORT
                        tb_imp32_C.Value = s.C2_C_BEFORE_IMPORT_NOTE
                        select_str32_C.Value = s.C2_C_BEFORE_START_WORK
                        tb_str32_C.Value = s.C2_C_BEFORE_START_WORK_NOTE

                        select_imp32_D.Value = s.C2_D_BEFORE_IMPORT
                        tb_imp32_D.Value = s.C2_D_BEFORE_IMPORT_NOTE
                        select_str32_D.Value = s.C2_D_BEFORE_START_WORK
                        tb_str32_D.Value = s.C2_D_BEFORE_START_WORK_NOTE

                        select_imp32_E.Value = s.C2_E_BEFORE_IMPORT
                        tb_imp32_E.Value = s.C2_E_BEFORE_IMPORT_NOTE
                        select_str32_E.Value = s.C2_E_BEFORE_START_WORK
                        tb_str32_E.Value = s.C2_E_BEFORE_START_WORK_NOTE

                        select_imp32_F.Value = s.C2_F_BEFORE_IMPORT
                        tb_imp32_F.Value = s.C2_F_BEFORE_IMPORT_NOTE
                        select_str32_F.Value = s.C2_F_BEFORE_START_WORK
                        tb_str32_F.Value = s.C2_F_BEFORE_START_WORK_NOTE

                        select_imp32_G.Value = s.C2_G_BEFORE_IMPORT
                        tb_imp32_G.Value = s.C2_G_BEFORE_IMPORT_NOTE
                        select_str32_G.Value = s.C2_G_BEFORE_START_WORK
                        tb_str32_G.Value = s.C2_G_BEFORE_START_WORK_NOTE

                        select_imp33_A.Value = s.C3_A_BEFORE_IMPORT
                        tb_imp33_A.Value = s.C3_A_BEFORE_IMPORT_NOTE
                        select_str33_A.Value = s.C3_A_BEFORE_START_WORK
                        tb_str33_A.Value = s.C3_A_BEFORE_START_WORK_NOTE

                        select_imp33_B.Value = s.C3_B_BEFORE_IMPORT
                        tb_imp33_B.Value = s.C3_B_BEFORE_IMPORT_NOTE
                        select_str33_B.Value = s.C3_B_BEFORE_START_WORK
                        tb_str33_B.Value = s.C3_B_BEFORE_START_WORK_NOTE

                        select_imp33_C.Value = s.C3_C_BEFORE_IMPORT
                        tb_imp33_C.Value = s.C3_C_BEFORE_IMPORT_NOTE
                        select_str33_C.Value = s.C3_C_BEFORE_START_WORK
                        tb_str33_C.Value = s.C3_C_BEFORE_START_WORK_NOTE

                        select_imp33_D.Value = s.C3_D_BEFORE_IMPORT
                        tb_imp33_D.Value = s.C3_D_BEFORE_IMPORT_NOTE
                        select_str33_D.Value = s.C3_D_BEFORE_START_WORK
                        tb_str33_D.Value = s.C3_D_BEFORE_START_WORK_NOTE

                        select_imp33_E.Value = s.C3_E_BEFORE_IMPORT
                        tb_imp33_E.Value = s.C3_E_BEFORE_IMPORT_NOTE
                        select_str33_E.Value = s.C3_E_BEFORE_START_WORK
                        tb_str33_E.Value = s.C3_E_BEFORE_START_WORK_NOTE

                        select_imp33_F.Value = s.C3_F_BEFORE_IMPORT
                        tb_imp33_F.Value = s.C3_F_BEFORE_IMPORT_NOTE
                        select_str33_F.Value = s.C3_F_BEFORE_START_WORK
                        tb_str33_F.Value = s.C3_F_BEFORE_START_WORK_NOTE

                        select_imp34_A.Value = s.C4_A_BEFORE_IMPORT
                        tb_imp34_A.Value = s.C4_A_BEFORE_IMPORT_NOTE
                        select_str34_A.Value = s.C4_A_BEFORE_START_WORK
                        tb_str34_A.Value = s.C4_A_BEFORE_START_WORK_NOTE

                        select_imp34_B.Value = s.C4_B_BEFORE_IMPORT
                        tb_imp34_B.Value = s.C4_B_BEFORE_IMPORT_NOTE
                        select_str34_B.Value = s.C4_B_BEFORE_START_WORK
                        tb_str34_B.Value = s.C4_B_BEFORE_START_WORK_NOTE

                        select_imp34_C.Value = s.C4_C_BEFORE_IMPORT
                        tb_imp34_C.Value = s.C4_C_BEFORE_IMPORT_NOTE
                        select_str34_C.Value = s.C4_C_BEFORE_START_WORK
                        tb_str34_C.Value = s.C4_C_BEFORE_START_WORK_NOTE
                        '////////////////////////////////////////////////////////////////////////////////////
                        select_imp4_A.Value = s.D_A_BEFORE_IMPORT
                        tb_imp4_A.Value = s.D_A_BEFORE_IMPORT_NOTE
                        select_str4_A.Value = s.D_A_BEFORE_START_WORK
                        tb_str4_A.Value = s.D_A_BEFORE_START_WORK_NOTE

                        select_imp4_B.Value = s.D_B_BEFORE_IMPORT
                        tb_imp4_B.Value = s.D_B_BEFORE_IMPORT_NOTE
                        select_str4_B.Value = s.D_B_BEFORE_START_WORK
                        tb_str4_B.Value = s.D_B_BEFORE_START_WORK_NOTE

                        select_imp4_C.Value = s.D_C_BEFORE_IMPORT
                        tb_imp4_C.Value = s.D_C_BEFORE_IMPORT_NOTE
                        select_str4_C.Value = s.D_C_BEFORE_START_WORK
                        tb_str4_C.Value = s.D_C_BEFORE_START_WORK_NOTE

                        select_imp4_D.Value = s.D_D_BEFORE_IMPORT
                        tb_imp4_D.Value = s.D_D_BEFORE_IMPORT_NOTE
                        select_str4_D.Value = s.D_D_BEFORE_START_WORK
                        tb_str4_D.Value = s.D_D_BEFORE_START_WORK_NOTE

                        select_imp4_E.Value = s.D_E_BEFORE_IMPORT
                        tb_imp4_E.Value = s.D_E_BEFORE_IMPORT_NOTE
                        select_str4_E.Value = s.D_E_BEFORE_START_WORK
                        tb_str4_E.Value = s.D_E_BEFORE_START_WORK_NOTE

                        select_imp4_F.Value = s.D_F_BEFORE_IMPORT
                        tb_imp4_F.Value = s.D_F_BEFORE_IMPORT_NOTE
                        select_str4_F.Value = s.D_F_BEFORE_START_WORK
                        tb_str4_F.Value = s.D_F_BEFORE_START_WORK_NOTE

                        select_imp4_G.Value = s.D_G_BEFORE_IMPORT
                        tb_imp4_G.Value = s.D_G_BEFORE_IMPORT_NOTE
                        select_str4_G.Value = s.D_G_BEFORE_START_WORK
                        tb_str4_G.Value = s.D_G_BEFORE_START_WORK_NOTE
                        '///////////////////////////////////////////////////////////////
                        select_imp51_A.Value = s.E1_A_BEFORE_IMPORT
                        tb_imp51_A.Value = s.E1_A_BEFORE_IMPORT_NOTE
                        select_str51_A.Value = s.E1_A_BEFORE_START_WORK
                        tb_str51_A.Value = s.E1_A_BEFORE_START_WORK_NOTE

                        select_imp51_B.Value = s.E1_B_BEFORE_IMPORT
                        tb_imp51_B.Value = s.E1_B_BEFORE_IMPORT_NOTE
                        select_str51_B.Value = s.E1_B_BEFORE_START_WORK
                        tb_str51_B.Value = s.E1_B_BEFORE_START_WORK_NOTE

                        select_imp52_A.Value = s.E2_A_BEFORE_IMPORT
                        tb_imp52_A.Value = s.E2_A_BEFORE_IMPORT_NOTE
                        select_str52_A.Value = s.E2_A_BEFORE_START_WORK
                        tb_str52_A.Value = s.E2_A_BEFORE_START_WORK_NOTE

                        select_imp52_B.Value = s.E2_B_BEFORE_IMPORT
                        tb_imp52_B.Value = s.E2_B_BEFORE_IMPORT_NOTE
                        select_str52_B.Value = s.E2_B_BEFORE_START_WORK
                        tb_str52_B.Value = s.E2_B_BEFORE_START_WORK_NOTE

                        select_imp52_C.Value = s.E2_C_BEFORE_IMPORT
                        tb_imp52_C.Value = s.E2_C_BEFORE_IMPORT_NOTE
                        select_str52_C.Value = s.E2_C_BEFORE_START_WORK
                        tb_str52_C.Value = s.E2_C_BEFORE_START_WORK_NOTE

                        select_imp53_A.Value = s.E3_A_BEFORE_IMPORT
                        tb_imp53_A.Value = s.E3_A_BEFORE_IMPORT_NOTE
                        select_str53_A.Value = s.E3_A_BEFORE_START_WORK
                        tb_str53_A.Value = s.E3_A_BEFORE_START_WORK_NOTE

                        select_imp53_B.Value = s.E3_B_BEFORE_IMPORT
                        tb_imp53_B.Value = s.E3_B_BEFORE_IMPORT_NOTE
                        select_str53_B.Value = s.E3_B_BEFORE_START_WORK
                        tb_str53_B.Value = s.E3_B_BEFORE_START_WORK_NOTE

                        select_imp53_C.Value = s.E3_C_BEFORE_IMPORT
                        tb_imp53_C.Value = s.E3_C_BEFORE_IMPORT_NOTE
                        select_str53_C.Value = s.E3_C_BEFORE_START_WORK
                        tb_str53_C.Value = s.E3_C_BEFORE_START_WORK_NOTE

                        select_imp53_D.Value = s.E3_D_BEFORE_IMPORT
                        tb_imp53_D.Value = s.E3_D_BEFORE_IMPORT_NOTE
                        select_str53_D.Value = s.E3_D_BEFORE_START_WORK
                        tb_str53_D.Value = s.E3_D_BEFORE_START_WORK_NOTE

                        select_imp54_A.Value = s.E4_A_BEFORE_IMPORT
                        tb_imp54_A.Value = s.E4_A_BEFORE_IMPORT_NOTE
                        select_str54_A.Value = s.E4_A_BEFORE_START_WORK
                        tb_str54_A.Value = s.E4_A_BEFORE_START_WORK_NOTE

                        select_imp54_B.Value = s.E4_B_BEFORE_IMPORT
                        tb_imp54_B.Value = s.E4_B_BEFORE_IMPORT_NOTE
                        select_str54_B.Value = s.E4_B_BEFORE_START_WORK
                        tb_str54_B.Value = s.E4_B_BEFORE_START_WORK_NOTE

                        select_imp54_C.Value = s.E4_C_BEFORE_IMPORT
                        tb_imp54_C.Value = s.E4_C_BEFORE_IMPORT_NOTE
                        select_str54_C.Value = s.E4_C_BEFORE_START_WORK
                        tb_str54_C.Value = s.E4_C_BEFORE_START_WORK_NOTE

                        select_imp54_D.Value = s.E4_D_BEFORE_IMPORT
                        tb_imp54_D.Value = s.E4_D_BEFORE_IMPORT_NOTE
                        select_str54_D.Value = s.E4_D_BEFORE_START_WORK
                        tb_str54_D.Value = s.E4_D_BEFORE_START_WORK_NOTE


                        'CHECK ATTACH FILE FOR BUUTON DOWNLOAD
                        If Not String.IsNullOrEmpty(s.DOCUMENT_ATTACH_NAME) Then
                            lnkdownloadbefore.Visible = True
                            lbnamefilebefore.Visible = True
                            lbnamefilebefore.Text = s.DOCUMENT_ATTACH_NAME
                        Else 
                            lnkdownloadbefore.Visible = False
                            lbnamefilebefore.Visible = False
                        End If

                    Next

                End If
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                    
                

                ClientScript.RegisterStartupScript([GetType](), "alert", "alert(""" & message & """);", True)
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

    Private Shared Function CheckStatus(mcno As String) As Integer

        'Dim dt As Date
        'If Date.TryParse(value, dt) Then

        '    Return value
        'End If
        Dim statusid As Integer
        Dim statusname As String
        Using db As New  DBRISTMCDataContext
            
            Try
                ' Mcno = Request.QueryString("emcno")
                Dim getstatus  = db.TB_MACHINE_TOOL_CHECK_P3s.Where(Function(x) x.MC_NO = mcno).ToList()

                For Each g In getstatus
                    statusid = CInt(g.STATUS_ID)
                    statusname = g.STATUS_NAME
                Next
              
            
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
               
            Finally
                
                db.Dispose()
            End Try
                
        End Using


        Return statusid
    End Function


    'Private Shared Function CountAttfilePageTwo(mcno As String) As Integer
    '    Dim countfile As Integer
    '    Using db As New  DBRISTMCDataContext
            
    '        Try
    '            ' Mcno = Request.QueryString("emcno")
    '            Dim getfilecount  = db.TB_FILE_ATTACHes.Count(Function(x) x.MC_NO = mcno)

    '            countfile = getfilecount
               
            
    '        Catch ex As Exception
    '            dim errorSend = New ExceptionLogging()
    '            errorSend.SendErrorTomail(ex)
    '            'Write Error to Log.txt
    '            ExceptionLogging.LogError(ex)
               
    '        Finally
                
    '            db.Dispose()
    '        End Try
                
    '    End Using
    '    Return countfile
    'End Function

    Private Sub UpdateData
        Using db = New DBRISTMCDataContext

            Try
                Mcno = Request.QueryString("ep3mcno")

                Dim opnocookie As HttpCookie = Request.Cookies("opno")
                Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
                

                Dim ipcookie As HttpCookie = Request.Cookies("ip")
                Dim ip as String = If(ipcookie IsNot Nothing, ipcookie.Value.Split("="c)(1), "undefined")

                Dim p3 = db.TB_MACHINE_TOOL_CHECK_P3s.FirstOrDefault(Function (x) x.MC_NO = Mcno)

                If p3 IsNot Nothing

                    'Dim dt As Date



                    p3.MC_NO = Mcno

                    p3.A1_1_BEFORE_IMPORT = select_imp1_1.Items(select_imp1_1.SelectedIndex).Value
                    p3.A1_1_BEFORE_IMPORT_NOTE = tb_imp1_1.Value
                    p3.A1_1_BEFORE_START_WORK = select_str1_1.Items(select_str1_1.SelectedIndex).Value
                    p3.A1_1_BEFORE_START_WORK_NOTE = tb_str1_1.Value


                    p3.A1_2_BEFORE_IMPORT = select_imp1_2.Items(select_imp1_2.SelectedIndex).Value
                    p3.A1_2_BEFORE_IMPORT_NOTE = tb_imp1_2.Value
                    p3.A1_2_BEFORE_START_WORK = select_str1_2.Items(select_str1_2.SelectedIndex).Value
                    p3.A1_2_BEFORE_START_WORK_NOTE = tb_str1_2.Value


                    p3.A1_A_BEFORE_IMPORT = select_imp1_A.Items(select_imp1_A.SelectedIndex).Value
                    p3.A1_A_BEFORE_IMPORT_NOTE = tb_imp1_A.Value
                    p3.A1_A_BEFORE_START_WORK = select_str1_A.Items(select_str1_A.SelectedIndex).Value
                    p3.A1_A_BEFORE_START_WORK_NOTE = tb_str1_A.Value

                    p3.A1_3_BEFORE_IMPORT = select_imp1_3.Items(select_imp1_3.SelectedIndex).Value
                    p3.A1_3_BEFORE_IMPORT_NOTE = tb_imp1_3.Value
                    p3.A1_3_BEFORE_START_WORK = select_str1_3.Items(select_str1_3.SelectedIndex).Value
                    p3.A1_3_BEFORE_START_WORK_NOTE = tb_str1_3.Value

                    p3.A1_4_BEFORE_IMPORT = select_imp1_4.Items(select_imp1_4.SelectedIndex).Value
                    p3.A1_4_BEFORE_IMPORT_NOTE = tb_imp1_4.Value
                    p3.A1_4_BEFORE_START_WORK = select_str1_4.Items(select_str1_4.SelectedIndex).Value
                    p3.A1_4_BEFORE_START_WORK_NOTE = tb_str1_4.Value

                    p3.A1_5_BEFORE_IMPORT = select_imp1_5.Items(select_imp1_5.SelectedIndex).Value
                    p3.A1_5_BEFORE_IMPORT_NOTE = tb_imp1_5.Value
                    p3.A1_5_BEFORE_START_WORK = select_str1_5.Items(select_str1_5.SelectedIndex).Value
                    p3.A1_5_BEFORE_START_WORK_NOTE = tb_str1_5.Value

                    p3.A1_6_BEFORE_IMPORT = select_imp1_6.Items(select_imp1_6.SelectedIndex).Value
                    p3.A1_6_BEFORE_IMPORT_NOTE = tb_imp1_6.Value
                    p3.A1_6_BEFORE_START_WORK = select_str1_6.Items(select_str1_6.SelectedIndex).Value
                    p3.A1_6_BEFORE_START_WORK_NOTE = tb_str1_6.Value

                    p3.A1_7_BEFORE_IMPORT = select_imp1_7.Items(select_imp1_7.SelectedIndex).Value
                    p3.A1_7_BEFORE_IMPORT_NOTE = tb_imp1_7.Value
                    p3.A1_7_BEFORE_START_WORK =select_str1_7.Items(select_str1_7.SelectedIndex).Value
                    p3.A1_7_BEFORE_START_WORK_NOTE = tb_str1_7.Value

                    p3.A1_8_BEFORE_IMPORT = select_imp1_8.Items(select_imp1_8.SelectedIndex).Value
                    p3.A1_8_BEFORE_IMPORT_NOTE = tb_imp1_8.Value
                    p3.A1_8_BEFORE_START_WORK = select_str1_8.Items(select_str1_8.SelectedIndex).Value
                    p3.A1_8_BEFORE_START_WORK_NOTE = tb_str1_8.Value

                    p3.A1_9_BEFORE_IMPORT = select_imp1_9.Items(select_imp1_9.SelectedIndex).Value
                    p3.A1_9_BEFORE_IMPORT_NOTE = tb_imp1_9.Value
                    p3.A1_9_BEFORE_START_WORK = select_str1_9.Items(select_str1_9.SelectedIndex).Value
                    p3.A1_9_BEFORE_START_WORK_NOTE = tb_str1_9.Value

                    p3.A1_10_BEFORE_IMPORT = select_imp1_10.Items(select_imp1_10.SelectedIndex).Value
                    p3.A1_10_BEFORE_IMPORT_NOTE = tb_imp1_10.Value
                    p3.A1_10_BEFORE_START_WORK = select_str1_10.Items(select_str1_10.SelectedIndex).Value
                    p3.A1_10_BEFORE_START_WORK_NOTE = tb_str1_10.Value

                    p3.A1_11_BEFORE_IMPORT = select_imp1_11.Items(select_imp1_11.SelectedIndex).Value
                    p3.A1_11_BEFORE_IMPORT_NOTE = tb_imp1_11.Value
                    p3.A1_11_BEFORE_START_WORK = select_str1_11.Items(select_str1_11.SelectedIndex).Value
                    p3.A1_11_BEFORE_START_WORK_NOTE = tb_str1_11.Value
                    '///////////////////////////////////////////////////////////////////////////////////////'
                    p3.A2_1_BEFORE_IMPORT = select_imp12_1.Items(select_imp12_1.SelectedIndex).Value
                    p3.A2_1_BEFORE_IMPORT_NOTE = tb_imp12_1.Value
                    p3.A2_1_BEFORE_START_WORK = select_str12_1.Items(select_str12_1.SelectedIndex).Value
                    p3.A2_1_BEFORE_START_WORK_NOTE = tb_str12_1.Value

                    p3.A2_2_BEFORE_IMPORT = select_imp12_2.Items(select_imp12_2.SelectedIndex).Value
                    p3.A2_2_BEFORE_IMPORT_NOTE = tb_imp12_2.Value
                    p3.A2_2_BEFORE_START_WORK = select_str12_2.Items(select_str12_2.SelectedIndex).Value
                    p3.A2_2_BEFORE_START_WORK_NOTE = tb_str12_2.Value

                    p3.A2_3_BEFORE_IMPORT = select_imp12_3.Items(select_imp12_3.SelectedIndex).Value
                    p3.A2_3_BEFORE_IMPORT_NOTE = tb_imp12_3.Value
                    p3.A2_3_BEFORE_START_WORK = select_str12_3.Items(select_str12_3.SelectedIndex).Value
                    p3.A2_3_BEFORE_START_WORK_NOTE = tb_str12_3.Value

                    p3.A2_4_BEFORE_IMPORT = select_imp12_4.Items(select_imp12_4.SelectedIndex).Value
                    p3.A2_4_BEFORE_IMPORT_NOTE = tb_imp12_4.Value
                    p3.A2_4_BEFORE_START_WORK = select_str12_4.Items(select_str12_4.SelectedIndex).Value
                    p3.A2_4_BEFORE_START_WORK_NOTE = tb_str12_4.Value

                    p3.A2_5_BEFORE_IMPORT = select_imp12_5.Items(select_imp12_5.SelectedIndex).Value
                    p3.A2_5_BEFORE_IMPORT_NOTE = tb_imp12_5.Value
                    p3.A2_5_BEFORE_START_WORK = select_str12_5.Items(select_str12_5.SelectedIndex).Value
                    p3.A2_5_BEFORE_START_WORK_NOTE = tb_str12_5.Value

                    p3.A2_6_BEFORE_IMPORT = select_imp12_6.Items(select_imp12_6.SelectedIndex).Value
                    p3.A2_6_BEFORE_IMPORT_NOTE = tb_imp12_6.Value
                    p3.A2_6_BEFORE_START_WORK = select_str12_6.Items(select_str12_6.SelectedIndex).Value
                    p3.A2_6_BEFORE_START_WORK_NOTE = tb_str12_6.Value

                    p3.A2_7_BEFORE_IMPORT = select_imp12_7.Items(select_imp12_7.SelectedIndex).Value
                    p3.A2_7_BEFORE_IMPORT_NOTE = tb_imp12_7.Value
                    p3.A2_7_BEFORE_START_WORK = select_str12_7.Items(select_str12_7.SelectedIndex).Value
                    p3.A2_7_BEFORE_START_WORK_NOTE = tb_str12_7.Value
                    '////////////////////////////////////////////////////////////////////////////////////////////////////
                    p3.B1_1_BEFORE_IMPORT = select_imp2_1.Items(select_imp2_1.SelectedIndex).Value
                    p3.B1_1_BEFORE_IMPORT_NOTE = tb_imp2_1.Value
                    p3.B1_1_BEFORE_START_WORK = select_str2_1.Items(select_str2_1.SelectedIndex).Value
                    p3.B1_1_BEFORE_START_WORK_NOTE = tb_str2_1.Value

                    p3.B1_2_BEFORE_IMPORT = select_imp2_2.Items(select_imp2_2.SelectedIndex).Value
                    p3.B1_2_BEFORE_IMPORT_NOTE = tb_imp2_2.Value
                    p3.B1_2_BEFORE_START_WORK = select_str2_2.Items(select_str2_2.SelectedIndex).Value
                    p3.B1_2_BEFORE_START_WORK_NOTE = tb_str2_2.Value

                    p3.B1_3_BEFORE_IMPORT = select_imp2_3.Items(select_imp2_3.SelectedIndex).Value
                    p3.B1_3_BEFORE_IMPORT_NOTE = tb_imp2_3.Value
                    p3.B1_3_BEFORE_START_WORK = select_str2_3.Items(select_str2_3.SelectedIndex).Value
                    p3.B1_3_BEFORE_START_WORK_NOTE = tb_str2_3.Value

                    p3.B1_4_BEFORE_IMPORT = select_imp2_4.Items(select_imp2_4.SelectedIndex).Value
                    p3.B1_4_BEFORE_IMPORT_NOTE = tb_imp2_4.Value
                    p3.B1_4_BEFORE_START_WORK = select_str2_4.Items(select_str2_4.SelectedIndex).Value
                    p3.B1_4_BEFORE_START_WORK_NOTE = tb_str2_4.Value
                  
                    p3.B1_5_BEFORE_IMPORT = select_imp2_5.Items(select_imp2_5.SelectedIndex).Value
                    p3.B1_5_BEFORE_IMPORT_NOTE = tb_imp2_5.Value
                    p3.B1_5_BEFORE_START_WORK = select_str2_5.Items(select_str2_5.SelectedIndex).Value
                    p3.B1_5_BEFORE_START_WORK_NOTE = tb_str2_5.Value
                    '//////////////////////////////////////////////////////////////////////////////////////////////////////'
                    p3.C1_1_BEFORE_IMPORT = select_imp31_1.Items(select_imp31_1.SelectedIndex).Value
                    p3.C1_1_BEFORE_IMPORT_NOTE = tb_imp31_1.Value
                    p3.C1_1_BEFORE_START_WORK = select_str31_1.Items(select_str31_1.SelectedIndex).Value
                    p3.C1_1_BEFORE_START_WORK_NOTE = tb_str31_1.Value

                    p3.C1_2_BEFORE_IMPORT = select_imp31_2.Items(select_imp31_2.SelectedIndex).Value
                    p3.C1_2_BEFORE_IMPORT_NOTE = tb_imp31_2.Value
                    p3.C1_2_BEFORE_START_WORK = select_str31_2.Items(select_str31_2.SelectedIndex).Value
                    p3.C1_2_BEFORE_START_WORK_NOTE = tb_str31_2.Value

                    p3.C1_3_BEFORE_IMPORT = select_imp31_3.Items(select_imp31_3.SelectedIndex).Value
                    p3.C1_3_BEFORE_IMPORT_NOTE = tb_imp31_3.Value
                    p3.C1_3_BEFORE_START_WORK = select_str31_3.Items(select_str31_3.SelectedIndex).Value
                    p3.C1_3_BEFORE_START_WORK_NOTE = tb_str31_3.Value

                    p3.C1_4_BEFORE_IMPORT = select_imp31_4.Items(select_imp31_4.SelectedIndex).Value
                    p3.C1_4_BEFORE_IMPORT_NOTE = tb_imp31_4.Value
                    p3.C1_4_BEFORE_START_WORK = select_str31_4.Items(select_str31_4.SelectedIndex).Value
                    p3.C1_4_BEFORE_START_WORK_NOTE = tb_str31_4.Value

                    p3.C1_5_BEFORE_IMPORT = select_imp31_5.Items(select_imp31_5.SelectedIndex).Value
                    p3.C1_5_BEFORE_IMPORT_NOTE = tb_imp31_5.Value
                    p3.C1_5_BEFORE_START_WORK = select_str31_5.Items(select_str31_5.SelectedIndex).Value
                    p3.C1_5_BEFORE_START_WORK_NOTE = tb_str31_5.Value

                    p3.C1_6_BEFORE_IMPORT = select_imp31_6.Items(select_imp31_6.SelectedIndex).Value
                    p3.C1_6_BEFORE_IMPORT_NOTE = tb_imp31_6.Value
                    p3.C1_6_BEFORE_START_WORK = select_str31_6.Items(select_str31_6.SelectedIndex).Value
                    p3.C1_6_BEFORE_START_WORK_NOTE = tb_str31_6.Value

                    p3.C1_7_BEFORE_IMPORT = select_imp31_7.Items(select_imp31_7.SelectedIndex).Value
                    p3.C1_7_BEFORE_IMPORT_NOTE = tb_imp31_7.Value
                    p3.C1_7_BEFORE_START_WORK = select_str31_7.Items(select_str31_7.SelectedIndex).Value
                    p3.C1_7_BEFORE_START_WORK_NOTE = tb_str31_7.Value

                    p3.C1_8_BEFORE_IMPORT = select_imp31_8.Items(select_imp31_8.SelectedIndex).Value
                    p3.C1_8_BEFORE_IMPORT_NOTE = tb_imp31_8.Value
                    p3.C1_8_BEFORE_START_WORK = select_str31_8.Items(select_str31_8.SelectedIndex).Value
                    p3.C1_8_BEFORE_START_WORK_NOTE = tb_str31_8.Value

                    p3.C1_9_BEFORE_IMPORT = select_imp31_9.Items(select_imp31_9.SelectedIndex).Value
                    p3.C1_9_BEFORE_IMPORT_NOTE = tb_imp31_9.Value
                    p3.C1_9_BEFORE_START_WORK = select_str31_9.Items(select_str31_9.SelectedIndex).Value
                    p3.C1_9_BEFORE_START_WORK_NOTE = tb_str31_9.Value

                    p3.C1_10_BEFORE_IMPORT = select_imp31_10.Items(select_imp31_10.SelectedIndex).Value
                    p3.C1_10_BEFORE_IMPORT_NOTE = tb_imp31_10.Value
                    p3.C1_10_BEFORE_START_WORK = select_str31_10.Items(select_str31_10.SelectedIndex).Value
                    p3.C1_10_BEFORE_START_WORK_NOTE = tb_str31_10.Value
                    '///////////////////////////////////////////////////////////////////////////////////'
                    p3.C2_A_BEFORE_IMPORT = select_imp32_A.Items(select_imp32_A.SelectedIndex).Value
                    p3.C2_A_BEFORE_IMPORT_NOTE = tb_imp32_A.Value
                    p3.C2_A_BEFORE_START_WORK = select_str32_A.Items(select_str32_A.SelectedIndex).Value
                    p3.C2_A_BEFORE_START_WORK_NOTE = tb_str32_A.Value

                    p3.C2_B_BEFORE_IMPORT = select_imp32_B.Items(select_imp32_B.SelectedIndex).Value
                    p3.C2_B_BEFORE_IMPORT_NOTE = tb_imp32_B.Value
                    p3.C2_B_BEFORE_START_WORK = select_str32_B.Items(select_str32_B.SelectedIndex).Value
                    p3.C2_B_BEFORE_START_WORK_NOTE = tb_str32_B.Value

                    p3.C2_C_BEFORE_IMPORT = select_imp32_C.Items(select_imp32_C.SelectedIndex).Value
                    p3.C2_C_BEFORE_IMPORT_NOTE = tb_imp32_C.Value
                    p3.C2_C_BEFORE_START_WORK = select_str32_C.Items(select_str32_C.SelectedIndex).Value
                    p3.C2_C_BEFORE_START_WORK_NOTE = tb_str32_C.Value

                    p3.C2_D_BEFORE_IMPORT = select_imp32_D.Items(select_imp32_D.SelectedIndex).Value
                    p3.C2_D_BEFORE_IMPORT_NOTE = tb_imp32_D.Value
                    p3.C2_D_BEFORE_START_WORK = select_str32_D.Items(select_str32_D.SelectedIndex).Value
                    p3.C2_D_BEFORE_START_WORK_NOTE = tb_str32_D.Value

                    p3.C2_E_BEFORE_IMPORT = select_imp32_E.Items(select_imp32_E.SelectedIndex).Value
                    p3.C2_E_BEFORE_IMPORT_NOTE = tb_imp32_E.Value
                    p3.C2_E_BEFORE_START_WORK = select_str32_E.Items(select_str32_E.SelectedIndex).Value
                    p3.C2_E_BEFORE_START_WORK_NOTE = tb_str32_E.Value

                    p3.C2_F_BEFORE_IMPORT = select_imp32_F.Items(select_imp32_F.SelectedIndex).Value
                    p3.C2_F_BEFORE_IMPORT_NOTE = tb_imp32_F.Value
                    p3.C2_F_BEFORE_START_WORK = select_str32_F.Items(select_str32_F.SelectedIndex).Value
                    p3.C2_F_BEFORE_START_WORK_NOTE = tb_str32_F.Value

                    p3.C2_G_BEFORE_IMPORT = select_imp32_G.Items(select_imp32_G.SelectedIndex).Value
                    p3.C2_G_BEFORE_IMPORT_NOTE = tb_imp32_G.Value
                    p3.C2_G_BEFORE_START_WORK = select_str32_G.Items(select_str32_G.SelectedIndex).Value
                    p3.C2_G_BEFORE_START_WORK_NOTE = tb_str32_G.Value
                    '//////////////////////////////////////////////////////////////////////////////////'
                    p3.C3_A_BEFORE_IMPORT = select_imp33_A.Items(select_imp33_A.SelectedIndex).Value
                    p3.C3_A_BEFORE_IMPORT_NOTE = tb_imp33_A.Value
                    p3.C3_A_BEFORE_START_WORK = select_str33_A.Items(select_str33_A.SelectedIndex).Value
                    p3.C3_A_BEFORE_START_WORK_NOTE = tb_str33_A.Value

                    p3.C3_B_BEFORE_IMPORT = select_imp33_B.Items(select_imp33_B.SelectedIndex).Value
                    p3.C3_B_BEFORE_IMPORT_NOTE = tb_imp33_B.Value
                    p3.C3_B_BEFORE_START_WORK = select_str33_B.Items(select_str33_B.SelectedIndex).Value
                    p3.C3_B_BEFORE_START_WORK_NOTE = tb_str33_B.Value

                    p3.C3_C_BEFORE_IMPORT = select_imp33_C.Items(select_imp33_C.SelectedIndex).Value
                    p3.C3_C_BEFORE_IMPORT_NOTE = tb_imp33_C.Value
                    p3.C3_C_BEFORE_START_WORK = select_str33_C.Items(select_str33_C.SelectedIndex).Value
                    p3.C3_C_BEFORE_START_WORK_NOTE = tb_str33_C.Value

                    p3.C3_D_BEFORE_IMPORT = select_imp33_D.Items(select_imp33_D.SelectedIndex).Value
                    p3.C3_D_BEFORE_IMPORT_NOTE = tb_imp33_D.Value
                    p3.C3_D_BEFORE_START_WORK = select_str33_D.Items(select_str33_D.SelectedIndex).Value
                    p3.C3_D_BEFORE_START_WORK_NOTE = tb_str33_D.Value

                    p3.C3_E_BEFORE_IMPORT = select_imp33_E.Items(select_imp33_E.SelectedIndex).Value
                    p3.C3_E_BEFORE_IMPORT_NOTE = tb_imp33_E.Value
                    p3.C3_E_BEFORE_START_WORK = select_str33_E.Items(select_str33_E.SelectedIndex).Value
                    p3.C3_E_BEFORE_START_WORK_NOTE = tb_str33_E.Value

                    p3.C3_F_BEFORE_IMPORT = select_imp33_F.Items(select_imp33_F.SelectedIndex).Value
                    p3.C3_F_BEFORE_IMPORT_NOTE = tb_imp33_F.Value
                    p3.C3_F_BEFORE_START_WORK = select_str33_F.Items(select_str33_F.SelectedIndex).Value
                    p3.C3_F_BEFORE_START_WORK_NOTE = tb_str33_F.Value
                    '///////////////////////////////////////////////////////////////////////////////////'
                    p3.C4_A_BEFORE_IMPORT = select_imp34_A.Items(select_imp34_A.SelectedIndex).Value
                    p3.C4_A_BEFORE_IMPORT_NOTE = tb_imp34_A.Value
                    p3.C4_A_BEFORE_START_WORK = select_str34_A.Items(select_str34_A.SelectedIndex).Value
                    p3.C4_A_BEFORE_START_WORK_NOTE = tb_str34_A.Value

                    p3.C4_B_BEFORE_IMPORT = select_imp34_B.Items(select_imp34_B.SelectedIndex).Value
                    p3.C4_B_BEFORE_IMPORT_NOTE = tb_imp34_B.Value
                    p3.C4_B_BEFORE_START_WORK = select_str34_B.Items(select_str34_B.SelectedIndex).Value
                    p3.C4_B_BEFORE_START_WORK_NOTE = tb_str34_B.Value

                    p3.C4_C_BEFORE_IMPORT = select_imp34_C.Items(select_imp34_C.SelectedIndex).Value
                    p3.C4_C_BEFORE_IMPORT_NOTE = tb_imp34_C.Value
                    p3.C4_C_BEFORE_START_WORK = select_str34_C.Items(select_str34_C.SelectedIndex).Value
                    p3.C4_C_BEFORE_START_WORK_NOTE = tb_str34_C.Value
                    '///////////////////////////////////////////////////////////////////////////////////'
                    p3.D_A_BEFORE_IMPORT = select_imp4_A.Items(select_imp4_A.SelectedIndex).Value
                    p3.D_A_BEFORE_IMPORT_NOTE = tb_imp4_A.Value
                    p3.D_A_BEFORE_START_WORK = select_str4_A.Items(select_str4_A.SelectedIndex).Value
                    p3.D_A_BEFORE_START_WORK_NOTE = tb_str4_A.Value

                    p3.D_B_BEFORE_IMPORT = select_imp4_B.Items(select_imp4_B.SelectedIndex).Value
                    p3.D_B_BEFORE_IMPORT_NOTE = tb_imp4_B.Value
                    p3.D_B_BEFORE_START_WORK = select_str4_B.Items(select_str4_B.SelectedIndex).Value
                    p3.D_B_BEFORE_START_WORK_NOTE = tb_str4_B.Value

                    p3.D_C_BEFORE_IMPORT = select_imp4_C.Items(select_imp4_C.SelectedIndex).Value
                    p3.D_C_BEFORE_IMPORT_NOTE = tb_imp4_C.Value
                    p3.D_C_BEFORE_START_WORK = select_str4_C.Items(select_str4_C.SelectedIndex).Value
                    p3.D_C_BEFORE_START_WORK_NOTE = tb_str4_C.Value

                    p3.D_D_BEFORE_IMPORT = select_imp4_D.Items(select_imp4_D.SelectedIndex).Value
                    p3.D_D_BEFORE_IMPORT_NOTE = tb_imp4_D.Value
                    p3.D_D_BEFORE_START_WORK = select_str4_D.Items(select_str4_D.SelectedIndex).Value
                    p3.D_D_BEFORE_START_WORK_NOTE = tb_str4_D.Value

                    p3.D_E_BEFORE_IMPORT = select_imp4_E.Items(select_imp4_E.SelectedIndex).Value
                    p3.D_E_BEFORE_IMPORT_NOTE = tb_imp4_E.Value
                    p3.D_E_BEFORE_START_WORK = select_str4_E.Items(select_str4_E.SelectedIndex).Value
                    p3.D_E_BEFORE_START_WORK_NOTE = tb_str4_E.Value

                    p3.D_F_BEFORE_IMPORT = select_imp4_F.Items(select_imp4_F.SelectedIndex).Value
                    p3.D_F_BEFORE_IMPORT_NOTE = tb_imp4_F.Value
                    p3.D_F_BEFORE_START_WORK = select_str4_F.Items(select_str4_F.SelectedIndex).Value
                    p3.D_F_BEFORE_START_WORK_NOTE = tb_str4_F.Value

                    p3.D_G_BEFORE_IMPORT = select_imp4_G.Items(select_imp4_G.SelectedIndex).Value
                    p3.D_G_BEFORE_IMPORT_NOTE = tb_imp4_G.Value
                    p3.D_G_BEFORE_START_WORK = select_str4_G.Items(select_str4_G.SelectedIndex).Value
                    p3.D_G_BEFORE_START_WORK_NOTE = tb_str4_G.Value
                    '/////////////////////////////////////////////////////////////////////////////////'
                    p3.E1_A_BEFORE_IMPORT = select_imp51_A.Items(select_imp51_A.SelectedIndex).Value
                    p3.E1_A_BEFORE_IMPORT_NOTE = tb_imp51_A.Value
                    p3.E1_A_BEFORE_START_WORK = select_str51_A.Items(select_str51_A.SelectedIndex).Value
                    p3.E1_A_BEFORE_START_WORK_NOTE = tb_str51_A.Value

                    p3.E1_B_BEFORE_IMPORT = select_imp51_B.Items(select_imp51_B.SelectedIndex).Value
                    p3.E1_B_BEFORE_IMPORT_NOTE = tb_imp51_B.Value
                    p3.E1_B_BEFORE_START_WORK = select_str51_B.Items(select_str51_B.SelectedIndex).Value
                    p3.E1_B_BEFORE_START_WORK_NOTE = tb_str51_B.Value

                    p3.E2_A_BEFORE_IMPORT = select_imp52_A.Items(select_imp52_A.SelectedIndex).Value
                    p3.E2_A_BEFORE_IMPORT_NOTE = tb_imp52_A.Value
                    p3.E2_A_BEFORE_START_WORK = select_str52_A.Items(select_str52_A.SelectedIndex).Value
                    p3.E2_A_BEFORE_START_WORK_NOTE = tb_str52_A.Value

                    p3.E2_B_BEFORE_IMPORT = select_imp52_B.Items(select_imp52_B.SelectedIndex).Value
                    p3.E2_B_BEFORE_IMPORT_NOTE = tb_imp52_B.Value
                    p3.E2_B_BEFORE_START_WORK = select_str52_B.Items(select_str52_B.SelectedIndex).Value
                    p3.E2_B_BEFORE_START_WORK_NOTE = tb_str52_B.Value

                    p3.E2_C_BEFORE_IMPORT = select_imp52_C.Items(select_imp52_C.SelectedIndex).Value
                    p3.E2_C_BEFORE_IMPORT_NOTE = tb_imp52_C.Value
                    p3.E2_C_BEFORE_START_WORK = select_str52_C.Items(select_str52_C.SelectedIndex).Value
                    p3.E2_C_BEFORE_START_WORK_NOTE = tb_str52_C.Value

                    p3.E3_A_BEFORE_IMPORT = select_imp53_A.Items(select_imp53_A.SelectedIndex).Value
                    p3.E3_A_BEFORE_IMPORT_NOTE = tb_imp53_A.Value
                    p3.E3_A_BEFORE_START_WORK = select_str53_A.Items(select_str53_A.SelectedIndex).Value
                    p3.E3_A_BEFORE_START_WORK_NOTE = tb_str53_A.Value

                    p3.E3_B_BEFORE_IMPORT = select_imp53_B.Items(select_imp53_B.SelectedIndex).Value
                    p3.E3_B_BEFORE_IMPORT_NOTE = tb_imp53_B.Value
                    p3.E3_B_BEFORE_START_WORK = select_str53_B.Items(select_str53_B.SelectedIndex).Value
                    p3.E3_B_BEFORE_START_WORK_NOTE = tb_str53_B.Value

                    p3.E3_C_BEFORE_IMPORT = select_imp53_C.Items(select_imp53_C.SelectedIndex).Value
                    p3.E3_C_BEFORE_IMPORT_NOTE = tb_imp53_C.Value
                    p3.E3_C_BEFORE_START_WORK = select_str53_C.Items(select_str53_C.SelectedIndex).Value
                    p3.E3_C_BEFORE_START_WORK_NOTE = tb_str53_C.Value

                    p3.E3_D_BEFORE_IMPORT = select_imp53_D.Items(select_imp53_D.SelectedIndex).Value
                    p3.E3_D_BEFORE_IMPORT_NOTE = tb_imp53_D.Value
                    p3.E3_D_BEFORE_START_WORK = select_str53_D.Items(select_str53_D.SelectedIndex).Value
                    p3.E3_D_BEFORE_START_WORK_NOTE = tb_str53_D.Value

                    p3.E4_A_BEFORE_IMPORT = select_imp54_A.Items(select_imp54_A.SelectedIndex).Value
                    p3.E4_A_BEFORE_IMPORT_NOTE = tb_imp54_A.Value
                    p3.E4_A_BEFORE_START_WORK = select_str54_A.Items(select_str54_A.SelectedIndex).Value
                    p3.E4_A_BEFORE_START_WORK_NOTE = tb_str54_A.Value

                    p3.E4_B_BEFORE_IMPORT = select_imp54_B.Items(select_imp54_B.SelectedIndex).Value
                    p3.E4_B_BEFORE_IMPORT_NOTE = tb_imp54_B.Value
                    p3.E4_B_BEFORE_START_WORK = select_str54_B.Items(select_str54_B.SelectedIndex).Value
                    p3.E4_B_BEFORE_START_WORK_NOTE = tb_str54_B.Value

                    p3.E4_C_BEFORE_IMPORT = select_imp54_C.Items(select_imp54_C.SelectedIndex).Value
                    p3.E4_C_BEFORE_IMPORT_NOTE = tb_imp54_C.Value
                    p3.E4_C_BEFORE_START_WORK = select_str54_C.Items(select_str54_C.SelectedIndex).Value
                    p3.E4_C_BEFORE_START_WORK_NOTE = tb_str54_C.Value

                    p3.E4_D_BEFORE_IMPORT = select_imp54_D.Items(select_imp54_D.SelectedIndex).Value
                    p3.E4_D_BEFORE_IMPORT_NOTE = tb_imp54_D.Value
                    p3.E4_D_BEFORE_START_WORK = select_str54_D.Items(select_str54_D.SelectedIndex).Value
                    p3.E4_D_BEFORE_START_WORK_NOTE = tb_str54_D.Value


                    p3.IP = ip
                    p3.OPNO_UPDATE = opno
                    p3.DATE_UPDATE = Date.Now

                   
                    If lbnamefilebefore.Text.Trim() = ""
                        ''//Function Save Attach file  3 
                        Dim uploadfilebefore As HttpCookie = Request.Cookies("filebefore")
                        Dim nameuploadbefore as String = If(uploadfilebefore IsNot Nothing, uploadfilebefore.Value.Split("="c)(1), "undefined")
                        'Dim nameuploadErs = CType(Session("fileErs"), String)
                        Dim filePathuploadbefore as String
                        Dim filenameuploadbefore As String
                        Dim fsuploadbefore As FileStream
                        Dim bruploadbefore As BinaryReader
                        Dim bytesuploadbefore As Byte()
                        Dim doccontentypebefore As string

               

                        If nameuploadbefore Isnot Nothing


                            filePathuploadbefore = Server.MapPath("upload/" & nameuploadbefore & "")
                            filenameuploadbefore = Path.GetFileName(filePathuploadbefore)
                            fsuploadbefore = New FileStream(filePathuploadbefore, FileMode.Open, FileAccess.Read)
                            bruploadbefore = New BinaryReader(fsuploadbefore)
                            bytesuploadbefore = bruploadbefore.ReadBytes(Convert.ToInt32(fsuploadbefore.Length))
                            doccontentypebefore = MimeMapping.GetMimeMapping(filenameuploadbefore)
                            bruploadbefore.Close()
                            fsuploadbefore.Close()

                        End If


                        p3.DOCUMENT_ATTACH_NAME = filenameuploadbefore
                        p3.DOCUMENT_ATTACH_CONTENT_TYPE = doccontentypebefore
                        p3.DOCUMENT_ATTACH_DATA = bytesuploadbefore
                    End If
                   

                    p3.STATUS_ID = 1
                    p3.STATUS_NAME = "REQUESTED"


                    db.SubmitChanges()


                End If

                SendEmailToRequest()

                SendEmailToSectMgr
                
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "UpdateComplete()", True)
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
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

    Private Sub InsertData

        Using db = New DBRISTMCDataContext
            Try

                Dim opnocookie As HttpCookie = Request.Cookies("opno")
                Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")


                Dim ipcookie As HttpCookie = Request.Cookies("ip")
                Dim ip as String = If(ipcookie IsNot Nothing, ipcookie.Value.Split("="c)(1), "undefined")
                Mcno = Request.QueryString("ep3mcno")

                'function insert TB_MACHINE_TOOL_CHECK_P3
                Dim p3 = New TB_MACHINE_TOOL_CHECK_P3()


                Dim dt As Date


                p3.MC_NO = Mcno

                p3.A1_1_BEFORE_IMPORT = select_imp1_1.Items(select_imp1_1.SelectedIndex).Value
                p3.A1_1_BEFORE_IMPORT_NOTE = tb_imp1_1.Value
                p3.A1_1_BEFORE_START_WORK = select_str1_1.Items(select_str1_1.SelectedIndex).Value
                p3.A1_1_BEFORE_START_WORK_NOTE = tb_str1_1.Value


                p3.A1_2_BEFORE_IMPORT = select_imp1_2.Items(select_imp1_2.SelectedIndex).Value
                p3.A1_2_BEFORE_IMPORT_NOTE = tb_imp1_2.Value
                p3.A1_2_BEFORE_START_WORK = select_str1_2.Items(select_str1_2.SelectedIndex).Value
                p3.A1_2_BEFORE_START_WORK_NOTE = tb_str1_2.Value


                p3.A1_A_BEFORE_IMPORT = select_imp1_A.Items(select_imp1_A.SelectedIndex).Value
                p3.A1_A_BEFORE_IMPORT_NOTE = tb_imp1_A.Value
                p3.A1_A_BEFORE_START_WORK = select_str1_A.Items(select_str1_A.SelectedIndex).Value
                p3.A1_A_BEFORE_START_WORK_NOTE = tb_str1_A.Value

                p3.A1_3_BEFORE_IMPORT = select_imp1_3.Items(select_imp1_3.SelectedIndex).Value
                p3.A1_3_BEFORE_IMPORT_NOTE = tb_imp1_3.Value
                p3.A1_3_BEFORE_START_WORK = select_str1_3.Items(select_str1_3.SelectedIndex).Value
                p3.A1_3_BEFORE_START_WORK_NOTE = tb_str1_3.Value

                p3.A1_4_BEFORE_IMPORT = select_imp1_4.Items(select_imp1_4.SelectedIndex).Value
                p3.A1_4_BEFORE_IMPORT_NOTE = tb_imp1_4.Value
                p3.A1_4_BEFORE_START_WORK = select_str1_4.Items(select_str1_4.SelectedIndex).Value
                p3.A1_4_BEFORE_START_WORK_NOTE = tb_str1_4.Value

                p3.A1_5_BEFORE_IMPORT = select_imp1_5.Items(select_imp1_5.SelectedIndex).Value
                p3.A1_5_BEFORE_IMPORT_NOTE = tb_imp1_5.Value
                p3.A1_5_BEFORE_START_WORK = select_str1_5.Items(select_str1_5.SelectedIndex).Value
                p3.A1_5_BEFORE_START_WORK_NOTE = tb_str1_5.Value

                p3.A1_6_BEFORE_IMPORT = select_imp1_6.Items(select_imp1_6.SelectedIndex).Value
                p3.A1_6_BEFORE_IMPORT_NOTE = tb_imp1_6.Value
                p3.A1_6_BEFORE_START_WORK = select_str1_6.Items(select_str1_6.SelectedIndex).Value
                p3.A1_6_BEFORE_START_WORK_NOTE = tb_str1_6.Value

                p3.A1_7_BEFORE_IMPORT = select_imp1_7.Items(select_imp1_7.SelectedIndex).Value
                p3.A1_7_BEFORE_IMPORT_NOTE = tb_imp1_7.Value
                p3.A1_7_BEFORE_START_WORK =select_str1_7.Items(select_str1_7.SelectedIndex).Value
                p3.A1_7_BEFORE_START_WORK_NOTE = tb_str1_7.Value

                p3.A1_8_BEFORE_IMPORT = select_imp1_8.Items(select_imp1_8.SelectedIndex).Value
                p3.A1_8_BEFORE_IMPORT_NOTE = tb_imp1_8.Value
                p3.A1_8_BEFORE_START_WORK = select_str1_8.Items(select_str1_8.SelectedIndex).Value
                p3.A1_8_BEFORE_START_WORK_NOTE = tb_str1_8.Value

                p3.A1_9_BEFORE_IMPORT = select_imp1_9.Items(select_imp1_9.SelectedIndex).Value
                p3.A1_9_BEFORE_IMPORT_NOTE = tb_imp1_9.Value
                p3.A1_9_BEFORE_START_WORK = select_str1_9.Items(select_str1_9.SelectedIndex).Value
                p3.A1_9_BEFORE_START_WORK_NOTE = tb_str1_9.Value

                p3.A1_10_BEFORE_IMPORT = select_imp1_10.Items(select_imp1_10.SelectedIndex).Value
                p3.A1_10_BEFORE_IMPORT_NOTE = tb_imp1_10.Value
                p3.A1_10_BEFORE_START_WORK = select_str1_10.Items(select_str1_10.SelectedIndex).Value
                p3.A1_10_BEFORE_START_WORK_NOTE = tb_str1_10.Value

                p3.A1_11_BEFORE_IMPORT = select_imp1_11.Items(select_imp1_11.SelectedIndex).Value
                p3.A1_11_BEFORE_IMPORT_NOTE = tb_imp1_11.Value
                p3.A1_11_BEFORE_START_WORK = select_str1_11.Items(select_str1_11.SelectedIndex).Value
                p3.A1_11_BEFORE_START_WORK_NOTE = tb_str1_11.Value
                '///////////////////////////////////////////////////////////////////////////////////////'
                p3.A2_1_BEFORE_IMPORT = select_imp12_1.Items(select_imp12_1.SelectedIndex).Value
                p3.A2_1_BEFORE_IMPORT_NOTE = tb_imp12_1.Value
                p3.A2_1_BEFORE_START_WORK = select_str12_1.Items(select_str12_1.SelectedIndex).Value
                p3.A2_1_BEFORE_START_WORK_NOTE = tb_str12_1.Value

                p3.A2_2_BEFORE_IMPORT = select_imp12_2.Items(select_imp12_2.SelectedIndex).Value
                p3.A2_2_BEFORE_IMPORT_NOTE = tb_imp12_2.Value
                p3.A2_2_BEFORE_START_WORK = select_str12_2.Items(select_str12_2.SelectedIndex).Value
                p3.A2_2_BEFORE_START_WORK_NOTE = tb_str12_2.Value

                p3.A2_3_BEFORE_IMPORT = select_imp12_3.Items(select_imp12_3.SelectedIndex).Value
                p3.A2_3_BEFORE_IMPORT_NOTE = tb_imp12_3.Value
                p3.A2_3_BEFORE_START_WORK = select_str12_3.Items(select_str12_3.SelectedIndex).Value
                p3.A2_3_BEFORE_START_WORK_NOTE = tb_str12_3.Value

                p3.A2_4_BEFORE_IMPORT = select_imp12_4.Items(select_imp12_4.SelectedIndex).Value
                p3.A2_4_BEFORE_IMPORT_NOTE = tb_imp12_4.Value
                p3.A2_4_BEFORE_START_WORK = select_str12_4.Items(select_str12_4.SelectedIndex).Value
                p3.A2_4_BEFORE_START_WORK_NOTE = tb_str12_4.Value

                p3.A2_5_BEFORE_IMPORT = select_imp12_5.Items(select_imp12_5.SelectedIndex).Value
                p3.A2_5_BEFORE_IMPORT_NOTE = tb_imp12_5.Value
                p3.A2_5_BEFORE_START_WORK = select_str12_5.Items(select_str12_5.SelectedIndex).Value
                p3.A2_5_BEFORE_START_WORK_NOTE = tb_str12_5.Value

                p3.A2_6_BEFORE_IMPORT = select_imp12_6.Items(select_imp12_6.SelectedIndex).Value
                p3.A2_6_BEFORE_IMPORT_NOTE = tb_imp12_6.Value
                p3.A2_6_BEFORE_START_WORK = select_str12_6.Items(select_str12_6.SelectedIndex).Value
                p3.A2_6_BEFORE_START_WORK_NOTE = tb_str12_6.Value

                p3.A2_7_BEFORE_IMPORT = select_imp12_7.Items(select_imp12_7.SelectedIndex).Value
                p3.A2_7_BEFORE_IMPORT_NOTE = tb_imp12_7.Value
                p3.A2_7_BEFORE_START_WORK = select_str12_7.Items(select_str12_7.SelectedIndex).Value
                p3.A2_7_BEFORE_START_WORK_NOTE = tb_str12_7.Value
                '////////////////////////////////////////////////////////////////////////////////////////////////////
                p3.B1_1_BEFORE_IMPORT = select_imp2_1.Items(select_imp2_1.SelectedIndex).Value
                p3.B1_1_BEFORE_IMPORT_NOTE = tb_imp2_1.Value
                p3.B1_1_BEFORE_START_WORK = select_str2_1.Items(select_str2_1.SelectedIndex).Value
                p3.B1_1_BEFORE_START_WORK_NOTE = tb_str2_1.Value

                p3.B1_2_BEFORE_IMPORT = select_imp2_2.Items(select_imp2_2.SelectedIndex).Value
                p3.B1_2_BEFORE_IMPORT_NOTE = tb_imp2_2.Value
                p3.B1_2_BEFORE_START_WORK = select_str2_2.Items(select_str2_2.SelectedIndex).Value
                p3.B1_2_BEFORE_START_WORK_NOTE = tb_str2_2.Value

                p3.B1_3_BEFORE_IMPORT = select_imp2_3.Items(select_imp2_3.SelectedIndex).Value
                p3.B1_3_BEFORE_IMPORT_NOTE = tb_imp2_3.Value
                p3.B1_3_BEFORE_START_WORK = select_str2_3.Items(select_str2_3.SelectedIndex).Value
                p3.B1_3_BEFORE_START_WORK_NOTE = tb_str2_3.Value

                p3.B1_4_BEFORE_IMPORT = select_imp2_4.Items(select_imp2_4.SelectedIndex).Value
                p3.B1_4_BEFORE_IMPORT_NOTE = tb_imp2_4.Value
                p3.B1_4_BEFORE_START_WORK = select_str2_4.Items(select_str2_4.SelectedIndex).Value
                p3.B1_4_BEFORE_START_WORK_NOTE = tb_str2_4.Value
              
                p3.B1_5_BEFORE_IMPORT = select_imp2_5.Items(select_imp2_5.SelectedIndex).Value
                p3.B1_5_BEFORE_IMPORT_NOTE = tb_imp2_5.Value
                p3.B1_5_BEFORE_START_WORK = select_str2_5.Items(select_str2_5.SelectedIndex).Value
                p3.B1_5_BEFORE_START_WORK_NOTE = tb_str2_5.Value
                '//////////////////////////////////////////////////////////////////////////////////////////////////////'
                p3.C1_1_BEFORE_IMPORT = select_imp31_1.Items(select_imp31_1.SelectedIndex).Value
                p3.C1_1_BEFORE_IMPORT_NOTE = tb_imp31_1.Value
                p3.C1_1_BEFORE_START_WORK = select_str31_1.Items(select_str31_1.SelectedIndex).Value
                p3.C1_1_BEFORE_START_WORK_NOTE = tb_str31_1.Value

                p3.C1_2_BEFORE_IMPORT = select_imp31_2.Items(select_imp31_2.SelectedIndex).Value
                p3.C1_2_BEFORE_IMPORT_NOTE = tb_imp31_2.Value
                p3.C1_2_BEFORE_START_WORK = select_str31_2.Items(select_str31_2.SelectedIndex).Value
                p3.C1_2_BEFORE_START_WORK_NOTE = tb_str31_2.Value

                p3.C1_3_BEFORE_IMPORT = select_imp31_3.Items(select_imp31_3.SelectedIndex).Value
                p3.C1_3_BEFORE_IMPORT_NOTE = tb_imp31_3.Value
                p3.C1_3_BEFORE_START_WORK = select_str31_3.Items(select_str31_3.SelectedIndex).Value
                p3.C1_3_BEFORE_START_WORK_NOTE = tb_str31_3.Value

                p3.C1_4_BEFORE_IMPORT = select_imp31_4.Items(select_imp31_4.SelectedIndex).Value
                p3.C1_4_BEFORE_IMPORT_NOTE = tb_imp31_4.Value
                p3.C1_4_BEFORE_START_WORK = select_str31_4.Items(select_str31_4.SelectedIndex).Value
                p3.C1_4_BEFORE_START_WORK_NOTE = tb_str31_4.Value

                p3.C1_5_BEFORE_IMPORT = select_imp31_5.Items(select_imp31_5.SelectedIndex).Value
                p3.C1_5_BEFORE_IMPORT_NOTE = tb_imp31_5.Value
                p3.C1_5_BEFORE_START_WORK = select_str31_5.Items(select_str31_5.SelectedIndex).Value
                p3.C1_5_BEFORE_START_WORK_NOTE = tb_str31_5.Value

                p3.C1_6_BEFORE_IMPORT = select_imp31_6.Items(select_imp31_6.SelectedIndex).Value
                p3.C1_6_BEFORE_IMPORT_NOTE = tb_imp31_6.Value
                p3.C1_6_BEFORE_START_WORK = select_str31_6.Items(select_str31_6.SelectedIndex).Value
                p3.C1_6_BEFORE_START_WORK_NOTE = tb_str31_6.Value

                p3.C1_7_BEFORE_IMPORT = select_imp31_7.Items(select_imp31_7.SelectedIndex).Value
                p3.C1_7_BEFORE_IMPORT_NOTE = tb_imp31_7.Value
                p3.C1_7_BEFORE_START_WORK = select_str31_7.Items(select_str31_7.SelectedIndex).Value
                p3.C1_7_BEFORE_START_WORK_NOTE = tb_str31_7.Value

                p3.C1_8_BEFORE_IMPORT = select_imp31_8.Items(select_imp31_8.SelectedIndex).Value
                p3.C1_8_BEFORE_IMPORT_NOTE = tb_imp31_8.Value
                p3.C1_8_BEFORE_START_WORK = select_str31_8.Items(select_str31_8.SelectedIndex).Value
                p3.C1_8_BEFORE_START_WORK_NOTE = tb_str31_8.Value

                p3.C1_9_BEFORE_IMPORT = select_imp31_9.Items(select_imp31_9.SelectedIndex).Value
                p3.C1_9_BEFORE_IMPORT_NOTE = tb_imp31_9.Value
                p3.C1_9_BEFORE_START_WORK = select_str31_9.Items(select_str31_9.SelectedIndex).Value
                p3.C1_9_BEFORE_START_WORK_NOTE = tb_str31_9.Value

                p3.C1_10_BEFORE_IMPORT = select_imp31_10.Items(select_imp31_10.SelectedIndex).Value
                p3.C1_10_BEFORE_IMPORT_NOTE = tb_imp31_10.Value
                p3.C1_10_BEFORE_START_WORK = select_str31_10.Items(select_str31_10.SelectedIndex).Value
                p3.C1_10_BEFORE_START_WORK_NOTE = tb_str31_10.Value
                '///////////////////////////////////////////////////////////////////////////////////'
                p3.C2_A_BEFORE_IMPORT = select_imp32_A.Items(select_imp32_A.SelectedIndex).Value
                p3.C2_A_BEFORE_IMPORT_NOTE = tb_imp32_A.Value
                p3.C2_A_BEFORE_START_WORK = select_str32_A.Items(select_str32_A.SelectedIndex).Value
                p3.C2_A_BEFORE_START_WORK_NOTE = tb_str32_A.Value

                p3.C2_B_BEFORE_IMPORT = select_imp32_B.Items(select_imp32_B.SelectedIndex).Value
                p3.C2_B_BEFORE_IMPORT_NOTE = tb_imp32_B.Value
                p3.C2_B_BEFORE_START_WORK = select_str32_B.Items(select_str32_B.SelectedIndex).Value
                p3.C2_B_BEFORE_START_WORK_NOTE = tb_str32_B.Value

                p3.C2_C_BEFORE_IMPORT = select_imp32_C.Items(select_imp32_C.SelectedIndex).Value
                p3.C2_C_BEFORE_IMPORT_NOTE = tb_imp32_C.Value
                p3.C2_C_BEFORE_START_WORK = select_str32_C.Items(select_str32_C.SelectedIndex).Value
                p3.C2_C_BEFORE_START_WORK_NOTE = tb_str32_C.Value

                p3.C2_D_BEFORE_IMPORT = select_imp32_D.Items(select_imp32_D.SelectedIndex).Value
                p3.C2_D_BEFORE_IMPORT_NOTE = tb_imp32_D.Value
                p3.C2_D_BEFORE_START_WORK = select_str32_D.Items(select_str32_D.SelectedIndex).Value
                p3.C2_D_BEFORE_START_WORK_NOTE = tb_str32_D.Value

                p3.C2_E_BEFORE_IMPORT = select_imp32_E.Items(select_imp32_E.SelectedIndex).Value
                p3.C2_E_BEFORE_IMPORT_NOTE = tb_imp32_E.Value
                p3.C2_E_BEFORE_START_WORK = select_str32_E.Items(select_str32_E.SelectedIndex).Value
                p3.C2_E_BEFORE_START_WORK_NOTE = tb_str32_E.Value

                p3.C2_F_BEFORE_IMPORT = select_imp32_F.Items(select_imp32_F.SelectedIndex).Value
                p3.C2_F_BEFORE_IMPORT_NOTE = tb_imp32_F.Value
                p3.C2_F_BEFORE_START_WORK = select_str32_F.Items(select_str32_F.SelectedIndex).Value
                p3.C2_F_BEFORE_START_WORK_NOTE = tb_str32_F.Value

                p3.C2_G_BEFORE_IMPORT = select_imp32_G.Items(select_imp32_G.SelectedIndex).Value
                p3.C2_G_BEFORE_IMPORT_NOTE = tb_imp32_G.Value
                p3.C2_G_BEFORE_START_WORK = select_str32_G.Items(select_str32_G.SelectedIndex).Value
                p3.C2_G_BEFORE_START_WORK_NOTE = tb_str32_G.Value
                '//////////////////////////////////////////////////////////////////////////////////'
                p3.C3_A_BEFORE_IMPORT = select_imp33_A.Items(select_imp33_A.SelectedIndex).Value
                p3.C3_A_BEFORE_IMPORT_NOTE = tb_imp33_A.Value
                p3.C3_A_BEFORE_START_WORK = select_str33_A.Items(select_str33_A.SelectedIndex).Value
                p3.C3_A_BEFORE_START_WORK_NOTE = tb_str33_A.Value

                p3.C3_B_BEFORE_IMPORT = select_imp33_B.Items(select_imp33_B.SelectedIndex).Value
                p3.C3_B_BEFORE_IMPORT_NOTE = tb_imp33_B.Value
                p3.C3_B_BEFORE_START_WORK = select_str33_B.Items(select_str33_B.SelectedIndex).Value
                p3.C3_B_BEFORE_START_WORK_NOTE = tb_str33_B.Value

                p3.C3_C_BEFORE_IMPORT = select_imp33_C.Items(select_imp33_C.SelectedIndex).Value
                p3.C3_C_BEFORE_IMPORT_NOTE = tb_imp33_C.Value
                p3.C3_C_BEFORE_START_WORK = select_str33_C.Items(select_str33_C.SelectedIndex).Value
                p3.C3_C_BEFORE_START_WORK_NOTE = tb_str33_C.Value

                p3.C3_D_BEFORE_IMPORT = select_imp33_D.Items(select_imp33_D.SelectedIndex).Value
                p3.C3_D_BEFORE_IMPORT_NOTE = tb_imp33_D.Value
                p3.C3_D_BEFORE_START_WORK = select_str33_D.Items(select_str33_D.SelectedIndex).Value
                p3.C3_D_BEFORE_START_WORK_NOTE = tb_str33_D.Value

                p3.C3_E_BEFORE_IMPORT = select_imp33_E.Items(select_imp33_E.SelectedIndex).Value
                p3.C3_E_BEFORE_IMPORT_NOTE = tb_imp33_E.Value
                p3.C3_E_BEFORE_START_WORK = select_str33_E.Items(select_str33_E.SelectedIndex).Value
                p3.C3_E_BEFORE_START_WORK_NOTE = tb_str33_E.Value

                p3.C3_F_BEFORE_IMPORT = select_imp33_F.Items(select_imp33_F.SelectedIndex).Value
                p3.C3_F_BEFORE_IMPORT_NOTE = tb_imp33_F.Value
                p3.C3_F_BEFORE_START_WORK = select_str33_F.Items(select_str33_F.SelectedIndex).Value
                p3.C3_F_BEFORE_START_WORK_NOTE = tb_str33_F.Value
                '///////////////////////////////////////////////////////////////////////////////////'
                p3.C4_A_BEFORE_IMPORT = select_imp34_A.Items(select_imp34_A.SelectedIndex).Value
                p3.C4_A_BEFORE_IMPORT_NOTE = tb_imp34_A.Value
                p3.C4_A_BEFORE_START_WORK = select_str34_A.Items(select_str34_A.SelectedIndex).Value
                p3.C4_A_BEFORE_START_WORK_NOTE = tb_str34_A.Value

                p3.C4_B_BEFORE_IMPORT = select_imp34_B.Items(select_imp34_B.SelectedIndex).Value
                p3.C4_B_BEFORE_IMPORT_NOTE = tb_imp34_B.Value
                p3.C4_B_BEFORE_START_WORK = select_str34_B.Items(select_str34_B.SelectedIndex).Value
                p3.C4_B_BEFORE_START_WORK_NOTE = tb_str34_B.Value

                p3.C4_C_BEFORE_IMPORT = select_imp34_C.Items(select_imp34_C.SelectedIndex).Value
                p3.C4_C_BEFORE_IMPORT_NOTE = tb_imp34_C.Value
                p3.C4_C_BEFORE_START_WORK = select_str34_C.Items(select_str34_C.SelectedIndex).Value
                p3.C4_C_BEFORE_START_WORK_NOTE = tb_str34_C.Value
                '///////////////////////////////////////////////////////////////////////////////////'
                p3.D_A_BEFORE_IMPORT = select_imp4_A.Items(select_imp4_A.SelectedIndex).Value
                p3.D_A_BEFORE_IMPORT_NOTE = tb_imp4_A.Value
                p3.D_A_BEFORE_START_WORK = select_str4_A.Items(select_str4_A.SelectedIndex).Value
                p3.D_A_BEFORE_START_WORK_NOTE = tb_str4_A.Value

                p3.D_B_BEFORE_IMPORT = select_imp4_B.Items(select_imp4_B.SelectedIndex).Value
                p3.D_B_BEFORE_IMPORT_NOTE = tb_imp4_B.Value
                p3.D_B_BEFORE_START_WORK = select_str4_B.Items(select_str4_B.SelectedIndex).Value
                p3.D_B_BEFORE_START_WORK_NOTE = tb_str4_B.Value

                p3.D_C_BEFORE_IMPORT = select_imp4_C.Items(select_imp4_C.SelectedIndex).Value
                p3.D_C_BEFORE_IMPORT_NOTE = tb_imp4_C.Value
                p3.D_C_BEFORE_START_WORK = select_str4_C.Items(select_str4_C.SelectedIndex).Value
                p3.D_C_BEFORE_START_WORK_NOTE = tb_str4_C.Value

                p3.D_D_BEFORE_IMPORT = select_imp4_D.Items(select_imp4_D.SelectedIndex).Value
                p3.D_D_BEFORE_IMPORT_NOTE = tb_imp4_D.Value
                p3.D_D_BEFORE_START_WORK = select_str4_D.Items(select_str4_D.SelectedIndex).Value
                p3.D_D_BEFORE_START_WORK_NOTE = tb_str4_D.Value

                p3.D_E_BEFORE_IMPORT = select_imp4_E.Items(select_imp4_E.SelectedIndex).Value
                p3.D_E_BEFORE_IMPORT_NOTE = tb_imp4_E.Value
                p3.D_E_BEFORE_START_WORK = select_str4_E.Items(select_str4_E.SelectedIndex).Value
                p3.D_E_BEFORE_START_WORK_NOTE = tb_str4_E.Value

                p3.D_F_BEFORE_IMPORT = select_imp4_F.Items(select_imp4_F.SelectedIndex).Value
                p3.D_F_BEFORE_IMPORT_NOTE = tb_imp4_F.Value
                p3.D_F_BEFORE_START_WORK = select_str4_F.Items(select_str4_F.SelectedIndex).Value
                p3.D_F_BEFORE_START_WORK_NOTE = tb_str4_F.Value

                p3.D_G_BEFORE_IMPORT = select_imp4_G.Items(select_imp4_G.SelectedIndex).Value
                p3.D_G_BEFORE_IMPORT_NOTE = tb_imp4_G.Value
                p3.D_G_BEFORE_START_WORK = select_str4_G.Items(select_str4_G.SelectedIndex).Value
                p3.D_G_BEFORE_START_WORK_NOTE = tb_str4_G.Value
                '/////////////////////////////////////////////////////////////////////////////////'
                p3.E1_A_BEFORE_IMPORT = select_imp51_A.Items(select_imp51_A.SelectedIndex).Value
                p3.E1_A_BEFORE_IMPORT_NOTE = tb_imp51_A.Value
                p3.E1_A_BEFORE_START_WORK = select_str51_A.Items(select_str51_A.SelectedIndex).Value
                p3.E1_A_BEFORE_START_WORK_NOTE = tb_str51_A.Value

                p3.E1_B_BEFORE_IMPORT = select_imp51_B.Items(select_imp51_B.SelectedIndex).Value
                p3.E1_B_BEFORE_IMPORT_NOTE = tb_imp51_B.Value
                p3.E1_B_BEFORE_START_WORK = select_str51_B.Items(select_str51_B.SelectedIndex).Value
                p3.E1_B_BEFORE_START_WORK_NOTE = tb_str51_B.Value

                p3.E2_A_BEFORE_IMPORT = select_imp52_A.Items(select_imp52_A.SelectedIndex).Value
                p3.E2_A_BEFORE_IMPORT_NOTE = tb_imp52_A.Value
                p3.E2_A_BEFORE_START_WORK = select_str52_A.Items(select_str52_A.SelectedIndex).Value
                p3.E2_A_BEFORE_START_WORK_NOTE = tb_str52_A.Value

                p3.E2_B_BEFORE_IMPORT = select_imp52_B.Items(select_imp52_B.SelectedIndex).Value
                p3.E2_B_BEFORE_IMPORT_NOTE = tb_imp52_B.Value
                p3.E2_B_BEFORE_START_WORK = select_str52_B.Items(select_str52_B.SelectedIndex).Value
                p3.E2_B_BEFORE_START_WORK_NOTE = tb_str52_B.Value

                p3.E2_C_BEFORE_IMPORT = select_imp52_C.Items(select_imp52_C.SelectedIndex).Value
                p3.E2_C_BEFORE_IMPORT_NOTE = tb_imp52_C.Value
                p3.E2_C_BEFORE_START_WORK = select_str52_C.Items(select_str52_C.SelectedIndex).Value
                p3.E2_C_BEFORE_START_WORK_NOTE = tb_str52_C.Value

                p3.E3_A_BEFORE_IMPORT = select_imp53_A.Items(select_imp53_A.SelectedIndex).Value
                p3.E3_A_BEFORE_IMPORT_NOTE = tb_imp53_A.Value
                p3.E3_A_BEFORE_START_WORK = select_str53_A.Items(select_str53_A.SelectedIndex).Value
                p3.E3_A_BEFORE_START_WORK_NOTE = tb_str53_A.Value

                p3.E3_B_BEFORE_IMPORT = select_imp53_B.Items(select_imp53_B.SelectedIndex).Value
                p3.E3_B_BEFORE_IMPORT_NOTE = tb_imp53_B.Value
                p3.E3_B_BEFORE_START_WORK = select_str53_B.Items(select_str53_B.SelectedIndex).Value
                p3.E3_B_BEFORE_START_WORK_NOTE = tb_str53_B.Value

                p3.E3_C_BEFORE_IMPORT = select_imp53_C.Items(select_imp53_C.SelectedIndex).Value
                p3.E3_C_BEFORE_IMPORT_NOTE = tb_imp53_C.Value
                p3.E3_C_BEFORE_START_WORK = select_str53_C.Items(select_str53_C.SelectedIndex).Value
                p3.E3_C_BEFORE_START_WORK_NOTE = tb_str53_C.Value

                p3.E3_D_BEFORE_IMPORT = select_imp53_D.Items(select_imp53_D.SelectedIndex).Value
                p3.E3_D_BEFORE_IMPORT_NOTE = tb_imp53_D.Value
                p3.E3_D_BEFORE_START_WORK = select_str53_D.Items(select_str53_D.SelectedIndex).Value
                p3.E3_D_BEFORE_START_WORK_NOTE = tb_str53_D.Value

                p3.E4_A_BEFORE_IMPORT = select_imp54_A.Items(select_imp54_A.SelectedIndex).Value
                p3.E4_A_BEFORE_IMPORT_NOTE = tb_imp54_A.Value
                p3.E4_A_BEFORE_START_WORK = select_str54_A.Items(select_str54_A.SelectedIndex).Value
                p3.E4_A_BEFORE_START_WORK_NOTE = tb_str54_A.Value

                p3.E4_B_BEFORE_IMPORT = select_imp54_B.Items(select_imp54_B.SelectedIndex).Value
                p3.E4_B_BEFORE_IMPORT_NOTE = tb_imp54_B.Value
                p3.E4_B_BEFORE_START_WORK = select_str54_B.Items(select_str54_B.SelectedIndex).Value
                p3.E4_B_BEFORE_START_WORK_NOTE = tb_str54_B.Value

                p3.E4_C_BEFORE_IMPORT = select_imp54_C.Items(select_imp54_C.SelectedIndex).Value
                p3.E4_C_BEFORE_IMPORT_NOTE = tb_imp54_C.Value
                p3.E4_C_BEFORE_START_WORK = select_str54_C.Items(select_str54_C.SelectedIndex).Value
                p3.E4_C_BEFORE_START_WORK_NOTE = tb_str54_C.Value

                p3.E4_D_BEFORE_IMPORT = select_imp54_D.Items(select_imp54_D.SelectedIndex).Value
                p3.E4_D_BEFORE_IMPORT_NOTE = tb_imp54_D.Value
                p3.E4_D_BEFORE_START_WORK = select_str54_D.Items(select_str54_D.SelectedIndex).Value
                p3.E4_D_BEFORE_START_WORK_NOTE = tb_str54_D.Value

                ''//Function Save Attach file  3 
                Dim uploadfilebefore As HttpCookie = Request.Cookies("filebefore")
                Dim nameuploadbefore as String = If(uploadfilebefore IsNot Nothing, uploadfilebefore.Value.Split("="c)(1), "undefined")
                'Dim nameuploadErs = CType(Session("fileErs"), String)
                Dim filePathuploadbefore as String
                Dim filenameuploadbefore As String
                Dim fsuploadbefore As FileStream
                Dim bruploadbefore As BinaryReader
                Dim bytesuploadbefore As Byte()
                Dim doccontentypebefore As string

               

                If nameuploadbefore Isnot Nothing

                    filePathuploadbefore = Server.MapPath("upload/" & nameuploadbefore & "")
                    filenameuploadbefore = Path.GetFileName(filePathuploadbefore)
                    fsuploadbefore = New FileStream(filePathuploadbefore, FileMode.Open, FileAccess.Read)
                    bruploadbefore = New BinaryReader(fsuploadbefore)
                    bytesuploadbefore = bruploadbefore.ReadBytes(Convert.ToInt32(fsuploadbefore.Length))
                    doccontentypebefore = MimeMapping.GetMimeMapping(filenameuploadbefore)
                    bruploadbefore.Close()
                    fsuploadbefore.Close()
                    
                End If

                p3.DOCUMENT_ATTACH_NAME = filenameuploadbefore
                p3.DOCUMENT_ATTACH_CONTENT_TYPE = doccontentypebefore
                p3.DOCUMENT_ATTACH_DATA = bytesuploadbefore



                p3.IP = ip
                p3.OPNO_UPDATE = opno
                p3.DATE_UPDATE = Date.Now

                db.TB_MACHINE_TOOL_CHECK_P3s.InsertOnSubmit(p3)
                db.SubmitChanges()

                '#send mail to request entry for preview details
                SendEmailToRequest
                



            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"


                'NotifySticker(message, 4, 624)

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "InsertComplete()", True)
            End Try
        End Using
    End Sub
    Private Sub SendEmailToRequest()
        Dim username As String = String.Empty
       
        Dim email As String = String.Empty
        Dim rmcno As String = HttpUtility.UrlEncode(Encrypt(Mcno))
        Dim opnocookie As HttpCookie = Request.Cookies("opno")
        Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
       
        Using db As New DBRISTMCDataContext()

            Try
                Dim getemail As IEnumerable(Of User) = db.Users.Where(Function(o) o.OperatorNo = opno).ToList()

                For Each n In getemail
                    username = n.Username
                    email = n.Email
                    'password = n.Password

                Next

                If Not String.IsNullOrEmpty(email) Then
                    BindGrid
                    Using sw As New StringWriter()
                        Using hw As New HtmlTextWriter(sw)
                            gvDetailsMcno.RenderControl(hw)
                            Dim mm As New MailMessage("RISTMCSYSTEM@rist.local", email)
                            mm.Subject = "Your Machine Register No " & Mcno 
                            mm.Body = String.Format("Hi {0},<br /><br />
                                                    Your machine register no. " & Mcno & "<br /><br />
                                                    Please see details link <a href='http://10.29.1.86/RISTMACHINE/ViewApprove.aspx?rmcno={1} '>Click</a> <br /><br />
                                                    <hr />" & sw.ToString() & "<br /><br />
                                                    Thank You.", username, rmcno)
                            mm.IsBodyHtml = True
                            Dim smtp As New SmtpClient()
                            smtp.Host = "10.29.1.240"
                            smtp.EnableSsl = False
                            Dim networkCred As New NetworkCredential()
                            networkCred.UserName = "RISTMCSYSTEM@rist.local"
                            networkCred.Password = "Rist2018"
                            smtp.UseDefaultCredentials = True
                            smtp.Credentials = networkCred
                            smtp.Port = 25
                            smtp.Send(mm)
                        End Using
                   End Using
                    
                Else
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "RecoverypasswordNotComplete()", True)
                  
                End If

            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
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

    Private sub SendEmailToSectMgr
        Dim emailsectEnc As string 
        Dim emailsect As string 
        Dim opnosect As string
        Dim sectmcno As String = HttpUtility.UrlEncode(Encrypt(Mcno))

        Using db As New DBRISTMCDataContext()
            Try
                'searchflow step for sectmgr with req opno
                Dim opreq As String = String.Empty

               

                Dim reqno = db.TB_MACHINE_DATAs.Where(Function(x) x.MC_NO = Mcno).Select(Function(x) New With{.OpnoAdd=x.OPNO_ADD})

                For Each x In reqno
                    opreq = x.OpnoAdd
                Next


               
                Dim s = db.TB_FLOW_REQUESTs.Where(Function(x) x.REQUEST_OP = opreq)


                For Each e In s
                    
                    opnosect = e.SECT_MGR_STAMP
                    emailsect = e.SECT_MGR_EMAIL
                    emailsectEnc = HttpUtility.UrlEncode(Encrypt(e.SECT_MGR_EMAIL))
                    
                    BindGridForMgr
                    Using sw As New StringWriter()
                        Using hw As New HtmlTextWriter(sw)
                            gvmailapprove.RenderControl(hw)
                            Dim mm As New MailMessage("RISTMCSYSTEM@rist.local", emailsect)
                            mm.Subject = "Machine Register No. "& Mcno & ""
                            mm.Body = String.Format("Hi {0},<br /><br />
                                                    Machine register no. " & Mcno & "<br /><br />
                                                    Waiting for Sect.Mgr Approve
                                                    Please see details link <a href='http://10.29.1.86/RISTMACHINE/ViewApprove.aspx?smcno={1}&semail={2}'>Click</a> <br /><br />
                                                    <hr />" & sw.ToString() & "<br /><br />
                                                    Thank You.", opnosect, sectmcno, emailsectEnc)
                            mm.IsBodyHtml = True
                            Dim smtp As New SmtpClient()
                            smtp.Host = "10.29.1.240"
                            smtp.EnableSsl = False
                            Dim networkCred As New NetworkCredential()
                            networkCred.UserName = "RISTMCSYSTEM@rist.local"
                            networkCred.Password = "Rist2018"
                            smtp.UseDefaultCredentials = True
                            smtp.Credentials = networkCred
                            smtp.Port = 25
                            smtp.Send(mm)
                        End Using
                    End Using
                   
                Next

            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True) 
            Finally
                db.Dispose()
            End Try
        End Using
    End sub
    Private Sub BindGridForMgr()
        Using db As New DBRISTMCDataContext()
            Try
                Mcno = Request.QueryString("ep3mcno")

                gvmailapprove.DataSource = db.TB_MACHINE_DATAs.
                    Where(Function(m) m.MC_NO = Mcno).
                    Select(Function(m) New with {m.MC_NO, m.MAKER, m.COUNTRY, m.SUPPLIER, m.PROVIDER, m.TEL, 
                        m.DIVISION, m.DEPARTMENT, m.SECTION, m.REGISTER_DATE,m.TYPE_MC,m.STATUS_NAME})
                gvmailapprove.DataBind()
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
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
    Private Sub BindGrid()
        Using db As New DBRISTMCDataContext()
            Try
                gvDetailsMcno.DataSource = From m In db.TB_MACHINE_DATAs
                    Where m.MC_NO = Mcno
                    Select New with {m.MC_NO, m.MAKER, m.COUNTRY, m.SUPPLIER, m.PROVIDER, m.TEL, 
                        m.DIVISION, m.DEPARTMENT, m.SECTION, m.REGISTER_DATE}
                gvDetailsMcno.DataBind()
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
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
    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Verifies that the control is rendered
    End Sub
    Private Shared Function Encrypt(clearText As String) As String
        Dim EncryptionKey As String = "RISTMC18NOVSYS"
        Dim clearBytes As Byte() = Encoding.Unicode.GetBytes(clearText)
        Using encryptor As Aes = Aes.Create()
            Dim pdb As New Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D, _
                                                                         &H65, &H64, &H76, &H65, &H64, &H65, _
                                                                         &H76})
            encryptor.Key = pdb.GetBytes(32)
            encryptor.IV = pdb.GetBytes(16)
            Using ms As New MemoryStream()
                Using cs As New CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write)
                    cs.Write(clearBytes, 0, clearBytes.Length)
                    cs.Close()
                End Using
                clearText = Convert.ToBase64String(ms.ToArray())
            End Using
        End Using
        Return clearText
    End Function
    Private Shared Function Decrypt(cipherText As String) As String
        Const encryptionKey As String = "RISTMC18NOVSYS"
        'If cipherText Is Nothing 
        '    Exit Function
        'Else 
            cipherText = cipherText.Replace(" ", "+")
        'End If
       
        Dim cipherBytes As Byte() = Convert.FromBase64String(cipherText)
        Using encryptor As Aes = Aes.Create()
            Dim pdb As New Rfc2898DeriveBytes(encryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D, _
                                                                         &H65, &H64, &H76, &H65, &H64, &H65, _
                                                                         &H76})
            encryptor.Key = pdb.GetBytes(32)
            encryptor.IV = pdb.GetBytes(16)
            Using ms As New MemoryStream()
                Using cs As New CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write)
                    cs.Write(cipherBytes, 0, cipherBytes.Length)
                    cs.Close()
                End Using
                cipherText = Encoding.Unicode.GetString(ms.ToArray())
            End Using
        End Using
        Return cipherText
    End Function


    Protected Sub DownloadFilebefore
       
        Using db As New  DBRISTMCDataContext
            Try
                Mcno = Request.QueryString("ep3mcno")
                Dim getfile As IEnumerable(Of TB_MACHINE_TOOL_CHECK_P3) = db.TB_MACHINE_TOOL_CHECK_P3s.Where(Function(r) r.MC_NO = Mcno).ToList()
                If getfile IsNot Nothing Then

                    For Each file In getfile

                        Response.ContentType = file.DOCUMENT_ATTACH_CONTENT_TYPE
                        Response.AddHeader("content-disposition", "attachment; filename=" & file.DOCUMENT_ATTACH_NAME)
                        Response.BinaryWrite(file.DOCUMENT_ATTACH_DATA)
                        Response.Flush()
                        Response.[End]()

                    Next

                End If
            Catch unusedThreadAbortException1 As Threading.ThreadAbortException
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
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



   
   
End Class