Option Strict On
Option Explicit On

Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Public Class GetReport
    Inherits Page
    Dim _rpt As New ReportDocument()
    Dim _rpt2 As New ReportDocument()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()
        Else 

            If Not IsPostBack Then

                If Not String.IsNullOrEmpty(Request.QueryString("pmcno")) And Not String.IsNullOrEmpty(Request.QueryString("pageno")) Then

                    Select Case Request.QueryString("pageno")
                        'Page
                        Case "1"
                            Printpage1()
                        Case "2"
                            Printpage2()
                        Case "3"
                            'Printpage3()

                    End Select


                    
                Else
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "datanotfound()", True)

                End If

            End If


        End If
       
    End Sub

    'Private Sub GetFile()
    '    Using db As New DBRISTMCDataContext()

    '        'Dim cr As CrystalReport1 = New CrystalReport1()
    '        Dim results = (From r In db.TB_MACHINE_DATAs Where r.MC_NO = "MC-209"
    '                      Select New With {r.MC_NO,r.REGISTER_DATE,r.REGISTER_NEW_MC,r.CANCEL_MC,
    '                          r.CATEGORY1_NEW_MC,r.CATEGORY1_TF_MC,r.CATEGORY1_OTH_MC,r.CATEGORY1_MC_OTHER_DETAIL,
    '                          r.CATEGORY2_NEW_MODEL_MC,r.CATEGORY2_ORIGINAL_MODEL_MC,r.CATEGORY2_OTH_MODEL_MC,r.CATEGORY2_MC_OTHER_DETAIL,
    '                          r.MAKER,r.COUNTRY,r.SUPPLIER,r.PROVIDER,r.TEL,r.TYPE_MC,r.SIZE_HP_MC,r.DIVISION,r.DEPARTMENT,r.SECTION,
    '                          r.MC_NAME,r.MC_NO1,r.MC_NO2,r.MC_NO3,r.MC_NO4,r.MC_NO5,r.MC_NO6,r.MC_NO7,r.MC_NO8,r.MC_NO9,r.MC_NO10,
    '                          r.DANGER_CHEME_1,r.DANGER_CHEME_2,r.DANGER_CHEME_3,r.DANGER_CHEME_4,r.DANGER_CHEME_NAME,r.CAS_NO,
    '                          r.FLAMMABLE,r.CORROSIVE,r.POISON,r.GAS,r.SUBSTANCE_OTHER,r.SUBSTANCE_OTHER_DETAIL,r.OBJ_POWDER,r.OBJ_HEAT,r.OBJ_NOISE,r.OBJ_VIBRATE,
    '                          r.OBJ_POISONGAS,r.OBJ_WASTE_WATER,r.OBJ_RAY,r.OBJ_SMOKE,r.OBJ_ELECTRIC_WAVE,r.OBJ_OTHER,r.OBJ_OTHER_DETAIL,
    '                          r.OBJ_CHEME_NAME,r.EQUIPMENT_HELMET,r.EQUIPMENT_GLASSES,r.EQUIPMENT_CHEMICAL_MASK,r.EQUIPMENT_BIB_PROTECT_CHEMECAL,
    '                          r.EQUIPMENT_CHEMICAL_GLOVES,r.EQUIPMENT_HEAT_RESISTANT_GLOVES,r.EQUIPMENT_CUT_PROTECT_GLOVES,r.EQUIPMENT_EYE_COVER,
    '                          r.EQUIPMENT_FACE_SHIELD,r.EQUIPMENT_DUST_MASK,r.EQUIPMENT_CHEMICAL_PACK,r.EQUIPMENT_ELECTRIC_GLOVES,r.EQUIPMENT_OTHER,r.EQUIPMENT_OTHER_DETAIL,
    '                          r.LAW_MC,r.LAW_CHEMECALS,r.LAW_ENVIRONMENTAL,r.LAW_HIGH_PRESSURE_GAS,r.LAW_PREVENT_STOP_FIRE,r.LAW_FACTORY,r.LAW_FUEL_REGULATORY,
    '                          r.LAW_OTHER,r.LAW_OTHER_DETAIL,r.LAW_NAME,r.LAW_NOTICE,r.LAW_NOTICE_DETAIL,r.LAW_APPROVE,r.LAW_APPROVE_DETAIL,
    '                          r.LAW_CHECK,r.LAW_CHECK_DETAIL,r.IMG_TEMP_STAMP_DATA}).ToList()

    '        If results Isnot Nothing
    '            Dim cr As RegisterReport = New RegisterReport()
    '            '_rpt.Load(Server.MapPath("~/Report/RegisterReport.rpt"))
    '            cr.SetDataSource(results)
    '            CrystalReportViewer1.ReportSource = cr


    '            Dim namefile As String = "Report_" + "MC-209"
    '            _rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, namefile)
    '            db.Dispose()
    '            Response.[End]()
    '            Session.Clear()
    '        End If


    '        'CrystalReportViewer1.ReportSource = _rpt
    '    End Using

    '    'Private Sub SurroundingSub()
    '    'Dim cr As CrystalReport1 = New CrystalReport1()
    '    'Dim results = (From supp In dbdata.tSamples Where supp.ID = IDNUMBER Select New With {supp.Name, supp.Model, supp.Producer
    '    '        }).ToList()
    '    'cr.SetDataSource(results)
    '    'crystalReportsViewer1.ReportSource = cr
    '    'End Sub

    'End Sub

    Private Sub GetReport_Unload(sender As Object, e As EventArgs) Handles Me.Unload
        _rpt.Close()
        _rpt.Dispose()
        GC.Collect()
    End Sub
    Protected Sub Printpage1()
        Try
            Dim mcno As String
            mcno = Request.QueryString("pmcno")


            'For Page 1
            _rpt.Load(Server.MapPath("~/Report/RegisterReport.rpt"))
            Dim dsmc As DSMachine = GetData("SELECT * FROM TB_MACHINE_DATA WITH(NOLOCK) WHERE MC_NO = '" & mcno & "'")
            _rpt.SetDataSource(dsmc)
            Dim namefile As String = "Report_" + mcno
            _rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, namefile)
            Response.[End]()
        Catch ex As Exception
            Dim message As String = $"Message: {ex.Message}\n\n"
            message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
            message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
            message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
        End Try
    End Sub
      Protected Sub Printpage2()
        
            Try
                Dim mcno As String
                mcno = Request.QueryString("pmcno")


            Using db = New DBRISTMCDataContext

                db.ExecuteCommand("TRUNCATE TABLE TMP_REPORT2")
                Dim rgetfileupload As IEnumerable(Of TB_FILE_ATTACH) = db.TB_FILE_ATTACHes.Where(Function(f) f.MC_NO = mcno).ToList()
                
                Dim rptMcno as String
                Dim rptMcname As string
                Dim rptMcnumber As String

                Dim rpttitleno As Integer 

                Dim rptH1T1 As String
                Dim rptH1T2 As String
                Dim rptH1T3 As String
                Dim rptH1T4 As String
                Dim rptH1T5 As String
                Dim rptH1T6 As String
                Dim rptH1T7 As String
                Dim rptH1T8 As String

                Dim rptH2T1 As String
                Dim rptH2T2 As String
                Dim rptH2T3 As String
                Dim rptH2T4 As String
                Dim rptH2T5 As String
                Dim rptH2T6 As String
                Dim rptH2T7 As String
                Dim rptH2T8 As String

                Dim rptH3T1 As String
                Dim rptH3T2 As String
                Dim rptH3T3 As String
                Dim rptH3T4 As String
                Dim rptH3T5 As String
                Dim rptH3T6 As String
                Dim rptH3T7 As String
                Dim rptH3T8 As String

                Dim rptH4T1 As String
                Dim rptH4T2 As String
                Dim rptH4T3 As String
                Dim rptH4T4 As String
                Dim rptH4T5 As String
                Dim rptH4T6 As String
                Dim rptH4T7 As String
                Dim rptH4T8 As String

                Dim rptN1T1 As Integer
                Dim rptN1T2 As Integer
                Dim rptN1T3 As Integer
                Dim rptN1T4 As Integer
                Dim rptN1T5 As Integer
                Dim rptN1T6 As Integer
                Dim rptN1T7 As Integer
                Dim rptN1T8 As Integer

                Dim rptN2T1 As Integer
                Dim rptN2T2 As Integer
                Dim rptN2T3 As Integer
                Dim rptN2T4 As Integer
                Dim rptN2T5 As Integer
                Dim rptN2T6 As Integer
                Dim rptN2T7 As Integer
                Dim rptN2T8 As Integer

                Dim rptN3T1 As Integer
                Dim rptN3T2 As Integer
                Dim rptN3T3 As Integer
                Dim rptN3T4 As Integer
                Dim rptN3T5 As Integer
                Dim rptN3T6 As Integer
                Dim rptN3T7 As Integer
                Dim rptN3T8 As Integer

                Dim rptN4T1 As Integer
                Dim rptN4T2 As Integer
                Dim rptN4T3 As Integer
                Dim rptN4T4 As Integer
                Dim rptN4T5 As Integer
                Dim rptN4T6 As Integer
                Dim rptN4T7 As Integer
                Dim rptN4T8 As Integer

                Dim rptS1T1 As Boolean
                Dim rptS1T2 As Boolean
                Dim rptS1T3 As Boolean
                Dim rptS1T4 As Boolean
                Dim rptS1T5 As Boolean
                Dim rptS1T6 As Boolean
                Dim rptS1T7 As Boolean
                Dim rptS1T8 As Boolean

                Dim rptS2T1 As Boolean
                Dim rptS2T2 As Boolean
                Dim rptS2T3 As Boolean
                Dim rptS2T4 As Boolean
                Dim rptS2T5 As Boolean
                Dim rptS2T6 As Boolean
                Dim rptS2T7 As Boolean
                Dim rptS2T8 As Boolean

                Dim rptS3T1 As Boolean
                Dim rptS3T2 As Boolean
                Dim rptS3T3 As Boolean
                Dim rptS3T4 As Boolean
                Dim rptS3T5 As Boolean
                Dim rptS3T6 As Boolean
                Dim rptS3T7 As Boolean
                Dim rptS3T8 As Boolean

                Dim rptS4T1 As Boolean
                Dim rptS4T2 As Boolean
                Dim rptS4T3 As Boolean
                Dim rptS4T4 As Boolean
                Dim rptS4T5 As Boolean
                Dim rptS4T6 As Boolean
                Dim rptS4T7 As Boolean
                Dim rptS4T8 As Boolean

                Dim rptDivision As String
                Dim rptDepartment As String
                Dim rptSection As String
                Dim rptBuilding As String
                Dim rptFloor As String
                Dim rptProcess As String

                'Attachfile Front
                Dim rptfilename1 As String
                Dim rptcontentype1 As string
                Dim rptfilebyte1 As Byte()

                'Attachfile Back
                Dim rptfilename2 As String
                Dim rptcontentype2 As string
                Dim rptfilebyte2 As Byte()

                'Attachfile Layout
                Dim rptfilename3 As String
                Dim rptcontentype3 As string
                Dim rptfilebyte3 As Byte()




                Dim dt As DataTable = GetDataVpage()

                Dim rgetvpage1 = dt.AsEnumerable().Select(Function(v) New With {
                                                              .McNo = v.Field(Of String)("MC_NO"),
                                                              .McName = v.Field(Of String)("MC_NAME"),
                                                              .McNumber = v.Field(Of String)("MC_NUMBER"),
                                                              .Title = v.Field(Of Integer)("Title"),
                                                              .TitleNo = v.Field(Of Integer)("Title_No"),
                                                              .DetailTopic = v.Field(Of String)("Detail_topic"),
                                                              .Number = v.Field(Of Integer)("Number"),
                                                              .IsSelected = v.Field(Of Boolean)("IsSelected"),
                                                              .Division = v.Field(Of String)("DIVISION"),
                                                              .Department = v.Field(Of String)("DEPARTMENT"),
                                                              .Section = v.Field(Of String)("SECTION"),
                                                              .Building = v.Field(Of String)("BUILDING"),
                                                              .Floor = v.Field(Of String)("FLOOR"),
                                                              .Process = v.Field(Of String)("PROCESS")
                                                              }).Where(Function(v) v.McNo = mcno And v.Title = 1)

              

                Dim rgetvpage2 = dt.AsEnumerable().Select(Function(v) New With {
                                                             .McNo = v.Field(Of String)("MC_NO"),
                                                             .McName = v.Field(Of String)("MC_NAME"),
                                                             .McNumber = v.Field(Of String)("MC_NUMBER"),
                                                             .Title = v.Field(Of Integer)("Title"),
                                                             .TitleNo = v.Field(Of Integer)("Title_No"),
                                                             .DetailTopic = v.Field(Of String)("Detail_topic"),
                                                             .Number = v.Field(Of Integer)("Number"),
                                                             .IsSelected = v.Field(Of Boolean)("IsSelected"),
                                                             .Division = v.Field(Of String)("DIVISION"),
                                                             .Department = v.Field(Of String)("DEPARTMENT"),
                                                             .Section = v.Field(Of String)("SECTION"),
                                                             .Building = v.Field(Of String)("BUILDING"),
                                                             .Floor = v.Field(Of String)("FLOOR"),
                                                             .Process = v.Field(Of String)("PROCESS")
                                                             }).Where(Function(v) v.McNo = mcno And v.Title = 2)

                Dim rgetvpage3 = dt.AsEnumerable().Select(Function(v) New With {
                                                             .McNo = v.Field(Of String)("MC_NO"),
                                                             .McName = v.Field(Of String)("MC_NAME"),
                                                             .McNumber = v.Field(Of String)("MC_NUMBER"),
                                                             .Title = v.Field(Of Integer)("Title"),
                                                             .TitleNo = v.Field(Of Integer)("Title_No"),
                                                             .DetailTopic = v.Field(Of String)("Detail_topic"),
                                                             .Number = v.Field(Of Integer)("Number"),
                                                             .IsSelected = v.Field(Of Boolean)("IsSelected"),
                                                             .Division = v.Field(Of String)("DIVISION"),
                                                             .Department = v.Field(Of String)("DEPARTMENT"),
                                                             .Section = v.Field(Of String)("SECTION"),
                                                             .Building = v.Field(Of String)("BUILDING"),
                                                             .Floor = v.Field(Of String)("FLOOR"),
                                                             .Process = v.Field(Of String)("PROCESS")
                                                             }).Where(Function(v) v.McNo = mcno And v.Title = 3)

                Dim rgetvpage4 = dt.AsEnumerable().Select(Function(v) New With {
                                                             .McNo = v.Field(Of String)("MC_NO"),
                                                             .McName = v.Field(Of String)("MC_NAME"),
                                                             .McNumber = v.Field(Of String)("MC_NUMBER"),
                                                             .Title = v.Field(Of Integer)("Title"),
                                                             .TitleNo = v.Field(Of Integer)("Title_No"),
                                                             .DetailTopic = v.Field(Of String)("Detail_topic"),
                                                             .Number = v.Field(Of Integer)("Number"),
                                                             .IsSelected = v.Field(Of Boolean)("IsSelected"),
                                                             .Division = v.Field(Of String)("DIVISION"),
                                                             .Department = v.Field(Of String)("DEPARTMENT"),
                                                             .Section = v.Field(Of String)("SECTION"),
                                                             .Building = v.Field(Of String)("BUILDING"),
                                                             .Floor = v.Field(Of String)("FLOOR"),
                                                             .Process = v.Field(Of String)("PROCESS")
                                                             }).Where(Function(v) v.McNo = mcno And v.Title = 4)
               
                For Each x In rgetvpage1
                    rptMcno = x.McNo
                    rptMcname = x.McName
                    rptMcnumber = x.McNumber

                    rptDivision = x.DIVISION
                    rptDepartment = x.DEPARTMENT
                    rptSection = x.SECTION
                    rptBuilding = x.BUILDING
                    rptFloor = x.FLOOR
                    rptProcess = x.PROCESS
                    
                    rpttitleno = x.TitleNo

                    Select Case rpttitleno
                        Case 1
                            rptH1T1 = x.DetailTopic
                            rptN1T1 = x.Number
                            rptS1T1 = x.IsSelected
                        Case 2
                            rptH1T2 = x.DetailTopic
                            rptN1T2 = x.Number
                            rptS1T2 = x.IsSelected
                        Case 3
                            rptH1T3 = x.DetailTopic
                            rptN1T3 = x.Number
                            rptS1T3 = x.IsSelected
                        Case 4
                            rptH1T4 = x.DetailTopic
                            rptN1T4 = x.Number
                            rptS1T4 = x.IsSelected
                        Case 5
                            rptH1T5 = x.DetailTopic
                            rptN1T5 = x.Number
                            rptS1T5 = x.IsSelected
                        Case 6
                            rptH1T6 = x.DetailTopic
                            rptN1T6 = x.Number
                            rptS1T6 = x.IsSelected
                        Case 7
                            rptH1T7 = x.DetailTopic
                            rptN1T7 = x.Number
                            rptS1T7 = x.IsSelected
                        Case 8
                            rptH1T8 = x.DetailTopic
                            rptN1T8 = x.Number
                            rptS1T8 = x.IsSelected
                    End Select
                Next

                For Each x In rgetvpage2
                    rpttitleno = x.TitleNo
                    Select Case rpttitleno
                        Case 1
                            rptH2T1 = x.DetailTopic
                            rptN2T1 = x.Number
                            rptS2T1 = x.IsSelected
                        Case 2
                            rptH2T2 = x.DetailTopic
                            rptN2T2 = x.Number
                            rptS2T2 = x.IsSelected
                        Case 3
                            rptH2T3 = x.DetailTopic
                            rptN2T3 = x.Number
                            rptS2T3 = x.IsSelected
                        Case 4
                            rptH2T4 = x.DetailTopic
                            rptN2T4 = x.Number
                            rptS2T4 = x.IsSelected
                        Case 5
                            rptH2T5 = x.DetailTopic
                            rptN2T5 = x.Number
                            rptS2T5 = x.IsSelected
                        Case 6
                            rptH2T6 = x.DetailTopic
                            rptN2T6 = x.Number
                            rptS2T6 = x.IsSelected
                        Case 7
                            rptH2T7 = x.DetailTopic
                            rptN2T7 = x.Number
                            rptS2T7 = x.IsSelected
                        Case 8
                            rptH2T8 = x.DetailTopic
                            rptN2T8 = x.Number
                            rptS2T8 = x.IsSelected
                    End Select
                Next

                For Each x In rgetvpage3
                    rpttitleno = x.TitleNo
                    Select Case rpttitleno
                        Case 1
                            rptH3T1 = x.DetailTopic
                            rptN3T1 = x.Number
                            rptS3T1 = x.IsSelected
                        Case 2
                            rptH3T2 = x.DetailTopic
                            rptN3T2 = x.Number
                            rptS3T2 = x.IsSelected
                        Case 3
                            rptH3T3 = x.DetailTopic
                            rptN3T3 = x.Number
                            rptS3T3 = x.IsSelected
                        Case 4
                            rptH3T4 = x.DetailTopic
                            rptN3T4 = x.Number
                            rptS3T4 = x.IsSelected
                        Case 5
                            rptH3T5 = x.DetailTopic
                            rptN3T5 = x.Number
                            rptS3T5 = x.IsSelected
                        Case 6
                            rptH3T6 = x.DetailTopic
                            rptN3T6 = x.Number
                            rptS3T6 = x.IsSelected
                        Case 7
                            rptH3T7 = x.DetailTopic
                            rptN3T7 = x.Number
                            rptS3T7 = x.IsSelected
                        Case 8
                            rptH3T8 = x.DetailTopic
                            rptN3T8 = x.Number
                            rptS3T8 = x.IsSelected
                    End Select
                Next

                For Each x In rgetvpage4
                    rpttitleno = x.TitleNo
                    Select Case rpttitleno
                        Case 1
                            rptH4T1 = x.DetailTopic
                            rptN4T1 = x.Number
                            rptS4T1 = x.IsSelected
                        Case 2
                            rptH4T2 = x.DetailTopic
                            rptN4T2 = x.Number
                            rptS4T2 = x.IsSelected
                        Case 3
                            rptH4T3 = x.DetailTopic
                            rptN4T3 = x.Number
                            rptS4T3 = x.IsSelected
                        Case 4
                            rptH4T4 = x.DetailTopic
                            rptN4T4 = x.Number
                            rptS4T4 = x.IsSelected
                        Case 5
                            rptH4T5 = x.DetailTopic
                            rptN4T5 = x.Number
                            rptS4T5 = x.IsSelected
                        Case 6
                            rptH4T6 = x.DetailTopic
                            rptN4T6 = x.Number
                            rptS4T6 = x.IsSelected
                        Case 7
                            rptH4T7 = x.DetailTopic
                            rptN4T7 = x.Number
                            rptS4T7 = x.IsSelected
                        Case 8
                            rptH4T8 = x.DetailTopic
                            rptN4T8 = x.Number
                            rptS4T8 = x.IsSelected
                    End Select
                Next


               
                'get file upload 3 file
                For Each f In rgetfileupload
                    Select Case f.FILE_ATTACH_NO_GROUP
                        Case 1
                            rptfilename1 = f.FILE_ATTACH_NAME
                            rptcontentype1 = f.FILE_ATTACH_CONTENT_TYPE
                            rptfilebyte1 = f.FILE_ATTACH_DATA
                        Case 2
                            rptfilename2 = f.FILE_ATTACH_NAME
                            rptcontentype2 = f.FILE_ATTACH_CONTENT_TYPE
                            rptfilebyte2 = f.FILE_ATTACH_DATA
                        Case 3
                            rptfilename3 = f.FILE_ATTACH_NAME
                            rptcontentype3 = f.FILE_ATTACH_CONTENT_TYPE
                            rptfilebyte3 = f.FILE_ATTACH_DATA

                    End Select
                    
                Next

               'function insert TMP_REPORT2
                Dim r2 = New TMP_REPORT2()
                r2.MC_NO = rptMcno
                r2.MC_NAME = rptMcname
                r2.MC_NUMBER = rptMcnumber
                'Assign detail
                r2.Detail_T1_1 = rptH1T1
                r2.Detail_T1_2 = rptH1T2
                r2.Detail_T1_3 = rptH1T3
                r2.Detail_T1_4 = rptH1T4
                r2.Detail_T1_5 = rptH1T5
                r2.Detail_T1_6 = rptH1T6
                r2.Detail_T1_7 = rptH1T7
                r2.Detail_T1_8 = rptH1T8

                r2.Detail_T2_1 = rptH2T1
                r2.Detail_T2_2 = rptH2T2
                r2.Detail_T2_3 = rptH2T3
                r2.Detail_T2_4 = rptH2T4
                r2.Detail_T2_5 = rptH2T5
                r2.Detail_T2_6 = rptH2T6
                r2.Detail_T2_7 = rptH2T7
                r2.Detail_T2_8 = rptH2T8

                r2.Detail_T3_1 = rptH3T1
                r2.Detail_T3_2 = rptH3T2
                r2.Detail_T3_3 = rptH3T3
                r2.Detail_T3_4 = rptH3T4
                r2.Detail_T3_5 = rptH3T5
                r2.Detail_T3_6 = rptH3T6
                r2.Detail_T3_7 = rptH3T7
                r2.Detail_T3_8 = rptH3T8

                r2.Detail_T4_1 = rptH4T1
                r2.Detail_T4_2 = rptH4T2
                r2.Detail_T4_3 = rptH4T3
                r2.Detail_T4_4 = rptH4T4
                r2.Detail_T4_5 = rptH4T5
                r2.Detail_T4_6 = rptH4T6
                r2.Detail_T4_7 = rptH4T7
                r2.Detail_T4_8 = rptH4T8
                'End Assign detail

                'Assign number
                r2.Number_T1_1 = rptN1T1
                r2.Number_T1_2 = rptN1T2
                r2.Number_T1_3 = rptN1T3
                r2.Number_T1_4 = rptN1T4
                r2.Number_T1_5 = rptN1T5
                r2.Number_T1_6 = rptN1T6
                r2.Number_T1_7 = rptN1T7
                r2.Number_T1_8 = rptN1T8

                r2.Number_T2_1 = rptN2T1
                r2.Number_T2_2 = rptN2T2
                r2.Number_T2_3 = rptN2T3
                r2.Number_T2_4 = rptN2T4
                r2.Number_T2_5 = rptN2T5
                r2.Number_T2_6 = rptN2T6
                r2.Number_T2_7 = rptN2T7
                r2.Number_T2_8 = rptN2T8

                r2.Number_T3_1 = rptN3T1
                r2.Number_T3_2 = rptN3T2
                r2.Number_T3_3 = rptN3T3
                r2.Number_T3_4 = rptN3T4
                r2.Number_T3_5 = rptN3T5
                r2.Number_T3_6 = rptN3T6
                r2.Number_T3_7 = rptN3T7
                r2.Number_T3_8 = rptN3T8

                r2.Number_T4_1 = rptN4T1
                r2.Number_T4_2 = rptN4T2
                r2.Number_T4_3 = rptN4T3
                r2.Number_T4_4 = rptN4T4
                r2.Number_T4_5 = rptN4T5
                r2.Number_T4_6 = rptN4T6
                r2.Number_T4_7 = rptN4T7
                r2.Number_T4_8 = rptN4T8
                'End Assign number

                'Assign check select
                r2.IsSelected_T1_1 = rptS1T1
                r2.IsSelected_T1_2 = rptS1T2
                r2.IsSelected_T1_3 = rptS1T3
                r2.IsSelected_T1_4 = rptS1T4
                r2.IsSelected_T1_5 = rptS1T5
                r2.IsSelected_T1_6 = rptS1T6
                r2.IsSelected_T1_7 = rptS1T7
                r2.IsSelected_T1_8 = rptS1T8

                r2.IsSelected_T2_1 = rptS2T1
                r2.IsSelected_T2_2 = rptS2T2
                r2.IsSelected_T2_3 = rptS2T3
                r2.IsSelected_T2_4 = rptS2T4
                r2.IsSelected_T2_5 = rptS2T5
                r2.IsSelected_T2_6 = rptS2T6
                r2.IsSelected_T2_7 = rptS2T7
                r2.IsSelected_T2_8 = rptS2T8

                r2.IsSelected_T3_1 = rptS3T1
                r2.IsSelected_T3_2 = rptS3T2
                r2.IsSelected_T3_3 = rptS3T3
                r2.IsSelected_T3_4 = rptS3T4
                r2.IsSelected_T3_5 = rptS3T5
                r2.IsSelected_T3_6 = rptS3T6
                r2.IsSelected_T3_7 = rptS3T7
                r2.IsSelected_T3_8 = rptS3T8

                r2.IsSelected_T4_1 = rptS4T1
                r2.IsSelected_T4_2 = rptS4T2
                r2.IsSelected_T4_3 = rptS4T3
                r2.IsSelected_T4_4 = rptS4T4
                r2.IsSelected_T4_5 = rptS4T5
                r2.IsSelected_T4_6 = rptS4T6
                r2.IsSelected_T4_7 = rptS4T7
                r2.IsSelected_T4_8 = rptS4T8
                'End Assign check select

                r2.Division = rptDivision
                r2.Department =rptDepartment
                r2.Section = rptSection
                r2.Building = rptBuilding
                r2.Floor = rptFloor
                r2.Process = rptProcess

                'Assign Attachfile Front
                r2.FILE_ATTACH_NAME_1 = rptfilename1
                r2.FILE_ATTACH_CONTENT_TYPE_1 = rptcontentype1
                r2.FILE_ATTACH_DATA_1 = rptfilebyte1

                'Assign Attachfile Back
                r2.FILE_ATTACH_NAME_2 = rptfilename2
                r2.FILE_ATTACH_CONTENT_TYPE_2 = rptcontentype2
                r2.FILE_ATTACH_DATA_2 = rptfilebyte2

                'Assign Attachfile Layout
                r2.FILE_ATTACH_NAME_3 = rptfilename3
                r2.FILE_ATTACH_CONTENT_TYPE_3 = rptcontentype3
                r2.FILE_ATTACH_DATA_3 = rptfilebyte3




                db.TMP_REPORT2s.InsertOnSubmit(r2)
                db.SubmitChanges()

            

            End Using


                _rpt2.Load(Server.MapPath("~/Report/RegisterReport-Page2.rpt"))
                Dim dsmc2 As DSMachine = GetDatapage2("SELECT * FROM TMP_REPORT2 WITH(NOLOCK) WHERE MC_NO = '" & mcno & "'")
                _rpt2.SetDataSource(dsmc2)
                Dim namefile2 As String = "Report_Page2" + mcno
                _rpt2.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, namefile2)
                Response.[End]()
            
            Catch ex As Exception
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            
            End Try
      
    End Sub

    Protected Sub Export()
        Dim mcno As String 
        mcno = Request.QueryString("pmcno")
        _rpt.Load(Server.MapPath("~/Report/RegisterReport.rpt"))
        Dim dsmc As DSMachine = GetData("SELECT * FROM TB_MACHINE_DATA WHERE MC_NO = '" & mcno & "'")
        _rpt.SetDataSource(dsmc)
        Dim namefile As String = "Report_" + mcno
        _rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, namefile)
        Response.[End]()
    End Sub


    Private Function GetDataVpage() As DataTable
        Dim dt As New DataTable()
        Dim constr As String = ConfigurationManager.ConnectionStrings("ConMC").ConnectionString
        Dim sql As String = "SELECT * FROM V_PAGE2 WITH(NOLOCK)"
        Using conn As New SqlConnection(constr)
            Using cmd As New SqlCommand(sql)
                cmd.Connection = conn
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                End Using
            End Using
        End Using
 
        Return dt
    End Function


    Private Function GetData(query As String) As DSMachine
        Dim conStrMc As String = ConfigurationManager.ConnectionStrings("ConMC").ConnectionString
        Dim cmd As New SqlCommand(query)
        Using con As New SqlConnection(conStrMc)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
 
                sda.SelectCommand = cmd
                Using dsmc As New DSMachine()
                    sda.Fill(dsmc, "TB_MACHINE_DATA")
                    Return dsmc
                End Using
            End Using
        End Using
    End Function

    Private Function GetDatapage2(query As String) As DSMachine
        Dim conStrMc As String = ConfigurationManager.ConnectionStrings("ConMC").ConnectionString
        Dim cmd As New SqlCommand(query)
        Using con As New SqlConnection(conStrMc)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
 
                sda.SelectCommand = cmd
                Using dsmc As New DSMachine()
                    sda.Fill(dsmc, "TMP_REPORT2")
                    Return dsmc
                End Using
            End Using
        End Using
    End Function
    'Protected Sub PRINT_MCNO()
    '    Dim mcno As String = String.Empty
    '    'Dim mcnofull As String = String.Empty
    '    mcno = Request.QueryString("pmcno")
    '    'mcnofull = "MC-" + mcno
    '    Dim conStrMc As String = ConfigurationManager.ConnectionStrings("ConMC").ConnectionString
    '    Dim query As String = "SELECT * FROM TB_MACHINE_DATA WHERE MC_NO = '" & mcno & "'"
    '    'Dim Query As String = "SELECT ISSUE_DT, HEADQUATER FROM V_REPORT GROUP BY ISSUE_DT, HEADQUATER  HAVING  ISSUE_DT = '" & tb_issue_dt.Text & "'"
    '    Dim con As New SqlConnection(conStrMc)
    '    Dim cmd As New SqlCommand(query)
    '    Dim sda As New SqlDataAdapter()
    '    cmd.Connection = con
    '    sda.SelectCommand = cmd
    '    Dim ds As New DataSet()
    '    sda.Fill(ds)
    '    Dim dt As New DataTable()

    '    Try
    '        dt = ds.Tables(0)
    '        If dt.Rows.Count <> 0 Then



    '            _rpt.Load(Server.MapPath("~/Report/RegisterReport.rpt"))

    '            _rpt.SetDataSource(dt)
    '            ' _rpt.SetParameterValue("HQ", ddl_hq.SelectedValue)

    '            'rpt.SetParameterValue("HQ", HQ)


    '            Dim namefile As String = "Report_" + mcno
    '            _rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, namefile)
    '            Response.[End]()
    '            Session.Clear()
    '            ' Next row


    '        Else

    '            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "datanotfound()", True)
                   

    '        End If


    '    Catch ex As Exception
    '        Dim message As String = String.Format("Message: {0}\n\n", ex.Message)
    '        message &= String.Format("StackTrace: {0}\n\n", ex.StackTrace.Replace(Environment.NewLine, String.Empty))
    '        message &= String.Format("Source: {0}\n\n", ex.Source.Replace(Environment.NewLine, String.Empty))
    '        message &= String.Format("TargetSite: {0}", ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty))

    '        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
    '    Finally

    '    End Try

    'End Sub
End Class