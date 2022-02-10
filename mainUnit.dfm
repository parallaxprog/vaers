object mainForm: TmainForm
  Left = 0
  Top = 0
  Caption = 'Vaccine Adverse Events Reporting System (VAERS) Data Analyzer'
  ClientHeight = 655
  ClientWidth = 1370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TPageControl
    Left = 0
    Top = 0
    Width = 1370
    Height = 636
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 0
    object tsExtract: TTabSheet
      Caption = '   Data Extraction   '
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 73
        Align = alTop
        TabOrder = 0
        DesignSize = (
          1362
          73)
        object SpeedButton1: TSpeedButton
          Left = 583
          Top = 8
          Width = 154
          Height = 49
          Caption = 'Stop Extraction'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            42080000424D4208000000000000420000002800000020000000200000000100
            10000300000000080000120B0000120B00000000000000000000007C0000E003
            00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDD7F5977DE7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDE7F5977BD7BFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FD572CB653877FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F3877CB65D472FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FD472C25CA15C25613877FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F38772561A15CC25CB472FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FD472E35CA05CA05CA15C25613877
            FF7FFF7FFF7FFF7FFF7FFF7F38772561A15CA05CA05CE35CD472FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FD472E25CA15CA15CA15CA15CA15C2561
            3877FF7FFF7FFF7FFF7F38772561A15CA15CA15CA15CA15CE25CD472FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FD472035DC160C160C160C160C160C160C160
            25613877FF7FFF7F38772561C160C160C160C160C160C160C160035DD472FF7F
            FF7FFF7FFF7FFF7FFF7FDD7FD572E25CC160C160C160C160C160C160C160C160
            C1604561597759774561C160C160C160C160C160C160C160C160C160E25CD572
            DD7FFF7FFF7FFF7FFF7F3877AA65E164E164E160E160E160E160E160E160E160
            E160E16025612561E160E160E160E160E160E160E160E160E160E164E164AA65
            3877FF7FFF7FFF7FFF7FDE7F38774565026D0165E260E260E260E260E260E260
            E260E160E260E260E160E260E260E260E260E260E260E2600165026D45653877
            DE7FFF7FFF7FFF7FFF7FFF7FFF7F377745692271026502650265026502650265
            026502650265026502650265026502650265026502650265227145653877FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F38774569227122692265226522652265
            22652265226522652265226522652265226522652269227145693877FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F3777456943712269226522652265
            2265226522652265226522652265226522652269437145693877FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F387745696375436943694369
            436943694369436943694369436943694369637565693877FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F38776669636D43694369
            43694369436943694369436943694369636D66693877FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F59776661636963696369
            63696369636963696369636963696369636966615977FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F387766656369836D836D836D
            836D836D836D836D836D836D836D836D836D636966653877FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F38776665846D846D846D846D846D
            846D846D846D846D846D846D846D846D846D846D846D66653877FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F38776665A46DA46DA46DA46DA46DA46D
            A46DA46DA46DA46DA46DA46DA46DA46DA46DA46DA46D846D66653877FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F38776665A46DC471A46DA46DA46DA46DA46D
            A46DA46DA471A471A46DA46DA46DA46DA46DA46DA46DC471A46D66653877FF7F
            FF7FFF7FFF7FFF7FFF7FDE7F38776665A46DC571C471C471C471C471C471C471
            C471E575E579E579E575C471C471C471C471C471C471C471C571A46D66653877
            DE7FFF7FFF7FFF7FFF7F5977CA65C571E575C571E571E571E571E571E571C571
            E575057A86698669057AE575C571E571E571E571E571E571C571E575C571CA69
            3877FF7FFF7FFF7FFF7FDD7FD5726469257E0576E571E571E571E571E5710576
            257E8669397739778669257E0576E571E571E571E571E571E575257E846DB372
            BC7BFF7FFF7FFF7FFF7FFF7FFF7FD4728569267E057605720572E5710576267E
            86693877FF7FFF7F38778669267E0576E5710572E5710576267EA56D926EFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FB4728469467E26760576267A467EA769
            3877FF7FFF7FFF7FFF7F3877A769467E267A05720676467EA56D926EFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FD472A569467E467A467A86693877
            FF7FFF7FFF7FFF7FFF7FFF7F38778669467A467A467EA56D926EFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FB472A569677AA7693877FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F3877A769677AA56D926EFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FD472EC693877FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F3877EB69B372FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDD7F3977DE7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDE7F3877BD7BFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F}
          ParentFont = False
          OnClick = btnStopClick
        end
        object lblCount: TLabel
          Left = 1123
          Top = 11
          Width = 38
          Height = 16
          Anchors = [akTop, akRight]
          Caption = 'Count:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 1155
        end
        object Label1: TLabel
          Left = 757
          Top = 11
          Width = 59
          Height = 16
          Caption = 'Data type:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object btnSymptoms: TButton
          Left = 145
          Top = 8
          Width = 162
          Height = 49
          Caption = 'Read Symptoms file'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnSymptomsClick
        end
        object btnVax: TButton
          Left = 308
          Top = 8
          Width = 143
          Height = 49
          Caption = 'Read Vax file'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnVaxClick
        end
        object btnReadAll: TButton
          Left = 451
          Top = 8
          Width = 132
          Height = 49
          Caption = 'Read All Files'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnReadAllClick
        end
        object btnData: TButton
          Left = 7
          Top = 8
          Width = 137
          Height = 49
          Caption = 'Read Data file'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnDataClick
        end
        object edNum: TEdit
          Left = 1104
          Top = 33
          Width = 93
          Height = 24
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object Button3: TButton
          Left = 1215
          Top = 7
          Width = 137
          Height = 50
          Anchors = [akTop, akRight]
          Caption = 'Clear log'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = Button3Click
        end
        object cbDelete: TCheckBox
          Left = 919
          Top = 40
          Width = 194
          Height = 17
          Caption = 'Delete table data before insert'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object cbDatatype: TComboBox
          Left = 754
          Top = 33
          Width = 143
          Height = 24
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 7
          Text = 'Domestic data'
          Items.Strings = (
            'Domestic data'
            'Non-domestic data')
        end
        object cbInspection: TCheckBox
          Left = 919
          Top = 14
          Width = 208
          Height = 17
          Caption = 'Only generate inspection files'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 73
        Width = 1362
        Height = 535
        Align = alClient
        TabOrder = 1
        object Panel9: TPanel
          Left = 1
          Top = 10
          Width = 158
          Height = 524
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 158
            Height = 33
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Button1: TButton
              Left = 0
              Top = 0
              Width = 81
              Height = 33
              Align = alLeft
              Caption = 'Check all'
              TabOrder = 0
              OnClick = Button1Click
            end
            object Button2: TButton
              Left = 81
              Top = 0
              Width = 77
              Height = 33
              Align = alClient
              Caption = 'Clear all'
              TabOrder = 1
              OnClick = Button2Click
            end
          end
          object cbYears: TCheckListBox
            Left = 0
            Top = 33
            Width = 158
            Height = 491
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 19
            ParentFont = False
            TabOrder = 1
          end
        end
        object Panel12: TPanel
          Left = 159
          Top = 10
          Width = 1202
          Height = 524
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object meLog: TMemo
            Left = 0
            Top = 0
            Width = 1202
            Height = 524
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            ExplicitLeft = 6
            ExplicitTop = -1
          end
        end
        object pgBar: TProgressBar
          Left = 1
          Top = 1
          Width = 1360
          Height = 9
          Align = alTop
          TabOrder = 2
          StyleElements = [seFont, seClient]
        end
      end
    end
    object tsStats: TTabSheet
      Caption = '   Statistics     '
      ImageIndex = 1
      object vaxChart: TChart
        Left = 0
        Top = 105
        Width = 1362
        Height = 503
        BackWall.Color = clWhite
        Legend.Inverted = True
        Legend.Visible = False
        MarginBottom = 2
        MarginTop = 3
        Title.Margins.Left = 5
        Title.Text.Strings = (
          'TChart')
        Panning.MouseWheel = pmwNone
        RightAxis.Automatic = False
        RightAxis.AutomaticMaximum = False
        RightAxis.AutomaticMinimum = False
        RightAxis.Maximum = 30000.000000000000000000
        View3D = False
        View3DOptions.Perspective = 6
        View3DOptions.VertOffset = 14
        View3DWalls = False
        ZoomWheel = pmwNormal
        Align = alClient
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          12
          15
          12)
        ColorPaletteIndex = 13
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 105
        Align = alTop
        TabOrder = 1
        object Label11: TLabel
          Left = 102
          Top = 37
          Width = 28
          Height = 16
          Caption = '2022'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 102
          Top = 58
          Width = 28
          Height = 16
          Caption = '2021'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 17
          Top = 79
          Width = 112
          Height = 16
          Alignment = taRightJustify
          Caption = 'Average 1990-2020'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object btnUpdate: TButton
          Left = 9
          Top = 25
          Width = 81
          Height = 42
          Caption = 'Update'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnUpdateClick
        end
        object cbDeaths: TCheckBox
          Left = 137
          Top = 12
          Width = 75
          Height = 17
          Caption = 'Deaths'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 1
          OnClick = cbDeathsClick
        end
        object cbInjected: TCheckBox
          Left = 300
          Top = 12
          Width = 79
          Height = 17
          Caption = 'Individuals'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = cbInjectedClick
        end
        object cbInjections: TCheckBox
          Left = 384
          Top = 12
          Width = 84
          Height = 17
          Caption = 'Injections'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = cbInjectionsClick
        end
        object cbSymptoms2: TCheckBox
          Left = 461
          Top = 12
          Width = 80
          Height = 17
          Caption = 'Symptoms'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = cbSymptoms2Click
        end
        object cbHosp: TCheckBox
          Left = 543
          Top = 12
          Width = 73
          Height = 17
          Caption = 'Hospital'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = cbHospClick
        end
        object cbEmergency: TCheckBox
          Left = 623
          Top = 12
          Width = 73
          Height = 17
          Caption = 'ER/D Visit'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = cbEmergencyClick
        end
        object cbLifeThreat: TCheckBox
          Left = 705
          Top = 12
          Width = 81
          Height = 17
          Caption = 'Life threat'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = cbLifeThreatClick
        end
        object cbCovidDeaths: TCheckBox
          Left = 219
          Top = 12
          Width = 73
          Height = 17
          Caption = 'C19Vax D'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnClick = cbCovidDeathsClick
        end
        object sgStat: TStringGrid
          Left = 136
          Top = 33
          Width = 1055
          Height = 66
          ColCount = 13
          DefaultColWidth = 80
          DefaultRowHeight = 20
          FixedCols = 0
          RowCount = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssNone
          TabOrder = 9
          OnDrawCell = sgStatDrawCell
        end
        object cbDisp: TCheckBox
          Left = 786
          Top = 12
          Width = 79
          Height = 17
          Caption = 'Disabled'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          OnClick = cbDispClick
        end
        object cbExtStay: TCheckBox
          Left = 867
          Top = 12
          Width = 80
          Height = 17
          Caption = 'Ext. stay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          OnClick = cbExtStayClick
        end
        object cbFluVaxed: TCheckBox
          Left = 1192
          Top = 12
          Width = 80
          Height = 17
          Caption = 'FLU Vaxed'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 12
          OnClick = cbFluVaxedClick
        end
        object cbDef: TCheckBox
          Left = 1110
          Top = 12
          Width = 81
          Height = 17
          Caption = 'Birthdefect'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          OnClick = cbDefClick
        end
        object cbRec: TCheckBox
          Left = 1030
          Top = 12
          Width = 79
          Height = 17
          Caption = 'Recover'#39'd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          OnClick = cbRecClick
        end
        object cbOff: TCheckBox
          Left = 948
          Top = 12
          Width = 81
          Height = 17
          Caption = 'Office visit'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          OnClick = cbOffClick
        end
        object sgFlu: TStringGrid
          Left = 1190
          Top = 33
          Width = 185
          Height = 66
          ColCount = 2
          DefaultColWidth = 90
          DefaultRowHeight = 20
          FixedCols = 0
          RowCount = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssNone
          TabOrder = 16
          OnDrawCell = sgStatDrawCell
        end
        object cbC19Vax: TCheckBox
          Left = 1282
          Top = 12
          Width = 80
          Height = 17
          Caption = 'C19 Vaxed'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          OnClick = cbC19VaxClick
        end
      end
    end
    object tsQuery: TTabSheet
      Caption = '   Database Query   '
      ImageIndex = 2
      object Label2: TLabel
        Left = 14
        Top = 17
        Width = 39
        Height = 16
        Caption = 'Query:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblCountRes: TLabel
        Left = 193
        Top = 227
        Width = 74
        Height = 16
        Caption = 'Count result:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFrom: TLabel
        Left = 189
        Top = 21
        Width = 29
        Height = 13
        Caption = 'FROM'
      end
      object lblWhere: TLabel
        Left = 365
        Top = 21
        Width = 36
        Height = 13
        Caption = 'WHERE'
      end
      object lblAction: TLabel
        Left = 505
        Top = 226
        Width = 15
        Height = 16
        Alignment = taRightJustify
        Caption = '---'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 14
        Top = 55
        Width = 31
        Height = 16
        Caption = 'Year:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBGrid1: TDBGrid
        Left = 14
        Top = 258
        Width = 766
        Height = 111
        DataSource = userSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object meQuery: TMemo
        Left = 14
        Top = 82
        Width = 766
        Height = 124
        TabOrder = 1
      end
      object btnQuery: TButton
        Left = 14
        Top = 216
        Width = 146
        Height = 36
        Caption = 'Run Query'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnQueryClick
      end
      object edResult: TEdit
        Left = 271
        Top = 222
        Width = 144
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object btnSelect: TButton
        Left = 59
        Top = 11
        Width = 118
        Height = 31
        Caption = 'SELECT COUNT(*)'
        TabOrder = 4
        OnClick = btnSelectClick
      end
      object cbTable: TComboBox
        Left = 230
        Top = 16
        Width = 121
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 5
        Text = 'DATA'
        Items.Strings = (
          'DATA'
          'SYMPTOMS'
          'VAX'
          'ND-DATA'
          'ND-SYMPTOMS'
          'ND-VAX')
      end
      object cbDied: TCheckBox
        Left = 422
        Top = 19
        Width = 57
        Height = 17
        Caption = 'DIED'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object cbVaxed: TCheckBox
        Left = 485
        Top = 19
        Width = 114
        Height = 17
        Caption = 'VAX:COVID19'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object meQueryLog: TMemo
        Left = 14
        Top = 389
        Width = 766
        Height = 180
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object cbAgeBelow: TCheckBox
        Left = 598
        Top = 18
        Width = 91
        Height = 17
        Caption = 'AGE BELOW'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object cbAge: TComboBox
        Left = 695
        Top = 14
        Width = 82
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 5
        ParentFont = False
        TabOrder = 10
        Text = '30 YRS'
        Items.Strings = (
          '5 YRS'
          '10 YRS'
          '15 YRS'
          '20 YRS'
          '25 YRS'
          '30 YRS'
          '35 YRS'
          '40 YRS'
          '45 YRS'
          '50 YRS'
          '55 YRS'
          '50 YRS'
          '55 YRS'
          '60 YRS'
          '65 YRS'
          '70 YRS'
          '75 YRS'
          '80 YRS'
          '85 YRS'
          '90 YRS'
          '95 YRS'
          '100 YRS'
          ''
          ''
          '')
      end
      object pbQuery: TProgressBar
        Left = 536
        Top = 223
        Width = 241
        Height = 17
        Max = 10
        MarqueeInterval = 1
        TabOrder = 11
      end
      object cbGroup: TCheckBox
        Left = 230
        Top = 52
        Width = 103
        Height = 17
        Caption = 'GROUP BY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object cbSymptom: TCheckBox
        Left = 422
        Top = 51
        Width = 93
        Height = 17
        Caption = 'Symptom ='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        OnClick = cbSymptomClick
      end
      object cbSymptoms: TComboBox
        Left = 521
        Top = 48
        Width = 256
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 14
        Text = 'Myocarditis'
        Items.Strings = (
          'Myocarditis'
          'Pericarditis')
      end
      object cbQYears: TComboBox
        Left = 59
        Top = 51
        Width = 145
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 15
        Text = 'All years'
        Items.Strings = (
          'All years')
      end
    end
    object tsBackup: TTabSheet
      Caption = '   Backup   '
      ImageIndex = 3
    end
    object TabSheet1: TTabSheet
      Caption = '   Data Integrity Check   '
      ImageIndex = 4
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 67
        Align = alTop
        TabOrder = 0
        DesignSize = (
          1362
          67)
        object Label3: TLabel
          Left = 1076
          Top = 42
          Width = 38
          Height = 16
          Anchors = [akTop, akRight]
          Caption = 'Count:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 1108
        end
        object Label4: TLabel
          Left = 624
          Top = 42
          Width = 40
          Height = 16
          Caption = 'Result:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object btnCheckData: TButton
          Left = 8
          Top = 9
          Width = 146
          Height = 49
          Caption = 'Check Data Tables'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnCheckDataClick
        end
        object btnCheckVax: TButton
          Left = 160
          Top = 9
          Width = 130
          Height = 49
          Caption = 'Check Vax Tables'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnCheckVaxClick
        end
        object btnCheckSymp: TButton
          Left = 295
          Top = 9
          Width = 176
          Height = 49
          Caption = 'Check Symptoms Tables'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnCheckSympClick
        end
        object btnStopCheck: TButton
          Left = 477
          Top = 9
          Width = 127
          Height = 49
          Caption = 'Stop Checking'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnStopClick
        end
        object Button11: TButton
          Left = 1223
          Top = 8
          Width = 137
          Height = 50
          Anchors = [akTop, akRight]
          Caption = 'Clear log'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = Button11Click
        end
        object edCheckNum: TEdit
          Left = 1136
          Top = 34
          Width = 74
          Height = 24
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object edCheckResult: TEdit
          Left = 687
          Top = 34
          Width = 386
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
      end
      object meCheckLog: TMemo
        Left = 345
        Top = 67
        Width = 1017
        Height = 541
        Align = alClient
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object Panel14: TPanel
        Left = 0
        Top = 67
        Width = 169
        Height = 541
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        object cbCheckYears: TCheckListBox
          Left = 0
          Top = 33
          Width = 169
          Height = 508
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 19
          ParentFont = False
          TabOrder = 0
        end
        object Panel13: TPanel
          Left = 0
          Top = 0
          Width = 169
          Height = 33
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 169
            Height = 33
            Align = alBottom
            TabOrder = 0
            object Button4: TButton
              Left = 1
              Top = 1
              Width = 80
              Height = 31
              Align = alLeft
              Caption = 'Check all'
              TabOrder = 0
              OnClick = Button4Click
            end
            object Button5: TButton
              Left = 81
              Top = 1
              Width = 87
              Height = 31
              Align = alClient
              Caption = 'Clear all'
              TabOrder = 1
              OnClick = Button5Click
            end
          end
        end
      end
      object Panel15: TPanel
        Left = 169
        Top = 67
        Width = 176
        Height = 541
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 3
        object cbYearsChecked: TCheckListBox
          Left = 0
          Top = 33
          Width = 176
          Height = 508
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 19
          ParentFont = False
          TabOrder = 0
        end
        object Panel16: TPanel
          Left = 0
          Top = 0
          Width = 176
          Height = 33
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Years Checked OK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '   Run calculations   '
      ImageIndex = 5
      object Label5: TLabel
        Left = 630
        Top = 95
        Width = 31
        Height = 16
        Caption = 'Year:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 20
        Top = 93
        Width = 121
        Height = 16
        Caption = 'Select years to check'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 73
        Align = alTop
        TabOrder = 0
        object btnCalc: TButton
          Left = 16
          Top = 13
          Width = 137
          Height = 49
          Caption = 'Calculate'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnCalcClick
        end
        object Button10: TButton
          Left = 617
          Top = 13
          Width = 137
          Height = 49
          Caption = 'Stop Calculation'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = Button10Click
        end
      end
      object edCalcCount: TEdit
        Left = 680
        Top = 90
        Width = 74
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object meCalcLog: TMemo
        Left = 168
        Top = 123
        Width = 586
        Height = 470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object pbCalc: TProgressBar
        Left = 168
        Top = 93
        Width = 433
        Height = 17
        MarqueeInterval = 1
        TabOrder = 3
      end
      object cbCalcYears: TCheckListBox
        Left = 16
        Top = 152
        Width = 137
        Height = 441
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 19
        ParentFont = False
        TabOrder = 4
      end
      object Button12: TButton
        Left = 16
        Top = 123
        Width = 68
        Height = 23
        Caption = 'Check all'
        TabOrder = 5
        OnClick = Button12Click
      end
      object Button13: TButton
        Left = 86
        Top = 123
        Width = 67
        Height = 23
        Caption = 'Clear all'
        TabOrder = 6
        OnClick = Button13Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = '   LOT Distribution   '
      ImageIndex = 6
      object lotChart: TChart
        Left = 0
        Top = 73
        Width = 1362
        Height = 535
        BackWall.Color = clWhite
        Legend.Inverted = True
        Legend.Visible = False
        MarginBottom = 2
        MarginTop = 3
        Title.Margins.Left = 5
        Title.Text.Strings = (
          'TChart')
        Panning.MouseWheel = pmwNone
        RightAxis.Automatic = False
        RightAxis.AutomaticMaximum = False
        RightAxis.AutomaticMinimum = False
        RightAxis.Maximum = 30000.000000000000000000
        View3D = False
        View3DOptions.Perspective = 6
        View3DOptions.VertOffset = 14
        View3DWalls = False
        ZoomWheel = pmwNormal
        Align = alClient
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          12
          15
          12)
        ColorPaletteIndex = 13
      end
      object Panel17: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 73
        Align = alTop
        TabOrder = 1
        object Label10: TLabel
          Left = 456
          Top = 15
          Width = 60
          Height = 16
          Caption = 'LOT Count'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblLimit: TLabel
          Left = 328
          Top = 15
          Width = 62
          Height = 16
          Caption = 'Event Limit'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 859
          Top = 15
          Width = 62
          Height = 16
          Caption = 'ADV Share'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 585
          Top = 15
          Width = 61
          Height = 16
          Caption = 'LOT Share'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 689
          Top = 15
          Width = 72
          Height = 16
          Caption = 'ADV Reports'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 169
          Top = 15
          Width = 54
          Height = 16
          Caption = 'Data type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 1086
          Top = 15
          Width = 112
          Height = 16
          Caption = 'C19 "vax" LOT Rate'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 948
          Top = 15
          Width = 90
          Height = 16
          Caption = 'C19 "vax" LOTS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object btnLotUpdate: TButton
          Left = 13
          Top = 9
          Width = 128
          Height = 52
          Caption = 'Update'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnLotUpdateClick
        end
        object edCountLot: TEdit
          Left = 456
          Top = 37
          Width = 108
          Height = 24
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object cbLimit: TComboBox
          Left = 328
          Top = 37
          Width = 105
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 1
          ParentFont = False
          TabOrder = 2
          Text = '10'
          OnChange = tbLimitChange
          Items.Strings = (
            '1'
            '10'
            '20'
            '50'
            '100'
            '200'
            '500'
            '1000')
        end
        object edPercent: TEdit
          Left = 859
          Top = 37
          Width = 69
          Height = 24
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object edLotPercent: TEdit
          Left = 585
          Top = 37
          Width = 83
          Height = 24
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object edADVReports: TEdit
          Left = 689
          Top = 37
          Width = 147
          Height = 24
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object cbLotType: TComboBox
          Left = 169
          Top = 37
          Width = 128
          Height = 24
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 6
          Text = 'COVID19 LOTS'
          Items.Strings = (
            'COVID19 LOTS'
            'ALL VAX LOTS')
        end
        object edC19Share: TEdit
          Left = 1086
          Top = 37
          Width = 110
          Height = 24
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
        object edC19Inj: TEdit
          Left = 948
          Top = 37
          Width = 120
          Height = 24
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = '   Data Tables View   '
      ImageIndex = 7
      object DBGrid2: TDBGrid
        Left = 0
        Top = 69
        Width = 1362
        Height = 539
        Align = alClient
        DataSource = dstableQuery
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'VAERS_ID'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'YEAR'
            Width = 35
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'RECVDATE'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AGE_YRS'
            Title.Caption = 'AGE'
            Width = 30
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'SEX'
            Width = 20
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'RPT_DATE'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SYMPTOM_TEXT'
            Width = 500
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIED'
            Width = 60
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'DATEDIED'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'L_THREAT'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ER_VISIT'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HOSPITAL'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HOSPDAYS'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'X_STAY'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DISABLE'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RECOVD'
            Width = 50
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'VAX_DATE'
            Width = 70
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'ONSET_DATE'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMDAYS'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LAB_DATA'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'V_ADMINBY'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'V_FUNDBY'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTHER_MEDS'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUR_ILL'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HISTORY'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIOR_VAX'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPLTTYPE'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FORM_VERS'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TODAYS_DATE'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BIRTH_DEFECT'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OFC_VISIT'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ER_ED_VISIT'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALLERGIES'
            Width = 100
            Visible = True
          end>
      end
      object Panel19: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 69
        Align = alTop
        TabOrder = 1
        object Label31: TLabel
          Left = 840
          Top = 11
          Width = 80
          Height = 16
          Caption = 'Record count:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 505
          Top = 11
          Width = 54
          Height = 16
          Caption = 'Data type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 667
          Top = 11
          Width = 31
          Height = 16
          Caption = 'Year:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 337
          Top = 13
          Width = 32
          Height = 16
          Caption = 'Table'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Button16: TButton
          Left = 13
          Top = 9
          Width = 128
          Height = 52
          Caption = 'Open table'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Button16Click
        end
        object edTableRecs: TEdit
          Left = 840
          Top = 33
          Width = 108
          Height = 24
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object cbTableDatatype: TComboBox
          Left = 505
          Top = 33
          Width = 143
          Height = 24
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 2
          Text = 'Domestic data'
          Items.Strings = (
            'Domestic data'
            'Non-domestic data')
        end
        object ComboBox2: TComboBox
          Left = 667
          Top = 33
          Width = 145
          Height = 24
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object cbTableType: TComboBox
          Left = 337
          Top = 33
          Width = 143
          Height = 24
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 4
          Text = 'Patient data'
          Items.Strings = (
            'Patient data'
            'Symptoms data'
            'Vaccine data')
        end
        object Button17: TButton
          Left = 147
          Top = 9
          Width = 128
          Height = 52
          Caption = 'Close table'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = Button17Click
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = '  Vax Data Cleaning   '
      ImageIndex = 8
      object Panel20: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 69
        Align = alTop
        TabOrder = 0
        ExplicitTop = 8
        DesignSize = (
          1362
          69)
        object Label7: TLabel
          Left = 328
          Top = 15
          Width = 63
          Height = 16
          Caption = 'Line count:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 169
          Top = 15
          Width = 48
          Height = 16
          Caption = 'File type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 451
          Top = 40
          Width = 669
          Height = 16
          Caption = 
            'This routine will correct vax_type=COVID19 and vax_manu for rows' +
            ' missing this information, based on LOT identifier'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object SpeedButton2: TSpeedButton
          Left = 1191
          Top = 9
          Width = 154
          Height = 49
          Anchors = [akTop, akRight]
          Caption = 'Stop Extraction'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            42080000424D4208000000000000420000002800000020000000200000000100
            10000300000000080000120B0000120B00000000000000000000007C0000E003
            00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDD7F5977DE7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDE7F5977BD7BFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FD572CB653877FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F3877CB65D472FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FD472C25CA15C25613877FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F38772561A15CC25CB472FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FD472E35CA05CA05CA15C25613877
            FF7FFF7FFF7FFF7FFF7FFF7F38772561A15CA05CA05CE35CD472FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FD472E25CA15CA15CA15CA15CA15C2561
            3877FF7FFF7FFF7FFF7F38772561A15CA15CA15CA15CA15CE25CD472FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FD472035DC160C160C160C160C160C160C160
            25613877FF7FFF7F38772561C160C160C160C160C160C160C160035DD472FF7F
            FF7FFF7FFF7FFF7FFF7FDD7FD572E25CC160C160C160C160C160C160C160C160
            C1604561597759774561C160C160C160C160C160C160C160C160C160E25CD572
            DD7FFF7FFF7FFF7FFF7F3877AA65E164E164E160E160E160E160E160E160E160
            E160E16025612561E160E160E160E160E160E160E160E160E160E164E164AA65
            3877FF7FFF7FFF7FFF7FDE7F38774565026D0165E260E260E260E260E260E260
            E260E160E260E260E160E260E260E260E260E260E260E2600165026D45653877
            DE7FFF7FFF7FFF7FFF7FFF7FFF7F377745692271026502650265026502650265
            026502650265026502650265026502650265026502650265227145653877FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F38774569227122692265226522652265
            22652265226522652265226522652265226522652269227145693877FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F3777456943712269226522652265
            2265226522652265226522652265226522652269437145693877FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F387745696375436943694369
            436943694369436943694369436943694369637565693877FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F38776669636D43694369
            43694369436943694369436943694369636D66693877FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F59776661636963696369
            63696369636963696369636963696369636966615977FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F387766656369836D836D836D
            836D836D836D836D836D836D836D836D836D636966653877FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F38776665846D846D846D846D846D
            846D846D846D846D846D846D846D846D846D846D846D66653877FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F38776665A46DA46DA46DA46DA46DA46D
            A46DA46DA46DA46DA46DA46DA46DA46DA46DA46DA46D846D66653877FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F38776665A46DC471A46DA46DA46DA46DA46D
            A46DA46DA471A471A46DA46DA46DA46DA46DA46DA46DC471A46D66653877FF7F
            FF7FFF7FFF7FFF7FFF7FDE7F38776665A46DC571C471C471C471C471C471C471
            C471E575E579E579E575C471C471C471C471C471C471C471C571A46D66653877
            DE7FFF7FFF7FFF7FFF7F5977CA65C571E575C571E571E571E571E571E571C571
            E575057A86698669057AE575C571E571E571E571E571E571C571E575C571CA69
            3877FF7FFF7FFF7FFF7FDD7FD5726469257E0576E571E571E571E571E5710576
            257E8669397739778669257E0576E571E571E571E571E571E575257E846DB372
            BC7BFF7FFF7FFF7FFF7FFF7FFF7FD4728569267E057605720572E5710576267E
            86693877FF7FFF7F38778669267E0576E5710572E5710576267EA56D926EFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FB4728469467E26760576267A467EA769
            3877FF7FFF7FFF7FFF7F3877A769467E267A05720676467EA56D926EFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FD472A569467E467A467A86693877
            FF7FFF7FFF7FFF7FFF7FFF7F38778669467A467A467EA56D926EFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FB472A569677AA7693877FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F3877A769677AA56D926EFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FD472EC693877FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F3877EB69B372FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDD7F3977DE7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDE7F3877BD7BFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F}
          ParentFont = False
          OnClick = btnStopClick
        end
        object Button6: TButton
          Left = 13
          Top = 9
          Width = 128
          Height = 52
          Caption = ' Clean Vax Table'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Button6Click
        end
        object edCleanCount: TEdit
          Left = 328
          Top = 37
          Width = 108
          Height = 24
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object ComboBox1: TComboBox
          Left = 169
          Top = 37
          Width = 143
          Height = 24
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 2
          Text = 'Domestic data'
          Items.Strings = (
            'Domestic data'
            'Non-domestic data')
        end
      end
      object meClean: TMemo
        Left = 0
        Top = 69
        Width = 1362
        Height = 539
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        ExplicitLeft = 6
        ExplicitTop = -1
        ExplicitWidth = 1202
        ExplicitHeight = 524
      end
    end
    object TabSheet6: TTabSheet
      Caption = '   Visual Data Inspection   '
      ImageIndex = 9
      object Panel18: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 69
        Align = alTop
        TabOrder = 0
        object Label15: TLabel
          Left = 504
          Top = 15
          Width = 63
          Height = 16
          Caption = 'Line count:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 169
          Top = 15
          Width = 48
          Height = 16
          Caption = 'File type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 331
          Top = 15
          Width = 31
          Height = 16
          Caption = 'Year:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Button14: TButton
          Left = 13
          Top = 9
          Width = 128
          Height = 52
          Caption = 'Load file'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Button14Click
        end
        object edVisCount: TEdit
          Left = 504
          Top = 37
          Width = 108
          Height = 24
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object cbVisDom: TComboBox
          Left = 169
          Top = 37
          Width = 143
          Height = 24
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 2
          Text = 'Domestic data'
          Items.Strings = (
            'Domestic data'
            'Non-domestic data')
        end
        object cbVisYear: TComboBox
          Left = 331
          Top = 37
          Width = 145
          Height = 24
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object meVisual: TMemo
        Left = 0
        Top = 69
        Width = 1362
        Height = 539
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
      end
    end
    object TabSheet7: TTabSheet
      Caption = '  Studies List   '
      ImageIndex = 10
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 57
        Align = alTop
        TabOrder = 0
        object Label17: TLabel
          Left = 160
          Top = 18
          Width = 34
          Height = 16
          Caption = 'Filter:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 544
          Top = 18
          Width = 38
          Height = 16
          Caption = 'Count:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object btnOpenLink: TButton
          Left = 9
          Top = 0
          Width = 137
          Height = 49
          Caption = 'Open Link'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnOpenLinkClick
        end
        object btnUpdateStudies: TButton
          Left = 729
          Top = 2
          Width = 137
          Height = 49
          Caption = 'Update'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnUpdateStudiesClick
        end
        object edFilter: TEdit
          Left = 206
          Top = 15
          Width = 323
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edCount: TEdit
          Left = 590
          Top = 15
          Width = 107
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object btnClear: TButton
          Left = 872
          Top = 2
          Width = 137
          Height = 49
          Caption = 'Clear'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = btnClearClick
        end
      end
      object dbgStudies: TDBGrid
        Left = 0
        Top = 57
        Width = 1362
        Height = 551
        Align = alClient
        DataSource = dsstudyQuery
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = btnOpenLinkClick
        Columns = <
          item
            Expanded = False
            FieldName = 'title'
            Title.Caption = 'Study title'
            Width = 990
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'url'
            Title.Caption = 'URL'
            Width = 400
            Visible = True
          end>
      end
    end
    object TabSheet8: TTabSheet
      Caption = '  Manufacturers  '
      ImageIndex = 11
    end
    object tsSetup: TTabSheet
      Caption = '   Program Setup   '
      ImageIndex = 12
      object Panel7: TPanel
        Left = 0
        Top = 73
        Width = 1362
        Height = 535
        Align = alClient
        TabOrder = 0
        object Label19: TLabel
          Left = 10
          Top = 88
          Width = 119
          Height = 16
          Caption = 'Database username:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 276
          Top = 88
          Width = 60
          Height = 16
          Caption = 'Password:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblFilepath: TLabel
          Left = 10
          Top = 49
          Width = 125
          Height = 16
          Caption = 'VAERS datafiles path:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 716
          Top = 88
          Width = 28
          Height = 16
          Caption = 'Port:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 475
          Top = 88
          Width = 94
          Height = 16
          Caption = 'Database name:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label35: TLabel
          Left = 10
          Top = 126
          Width = 914
          Height = 16
          Caption = 
            'NB: For fast data import, set the global DB variable "local_infi' +
            'le" to  TRUE in MySQL setup file "my.ini", or click button above' +
            ' if using login with SUPER privileges.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 716
          Top = 20
          Width = 38
          Height = 16
          Caption = 'Count:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edUser: TEdit
          Left = 152
          Top = 85
          Width = 105
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'vaersuser'
        end
        object edPass: TEdit
          Left = 342
          Top = 85
          Width = 107
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 1
          Text = 'vaers909'
        end
        object edPath: TEdit
          Left = 152
          Top = 47
          Width = 673
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object btnPath: TButton
          Left = 864
          Top = 42
          Width = 129
          Height = 31
          Caption = 'Select folder'
          TabOrder = 3
          OnClick = btnPathClick
        end
        object meSetupLog: TMemo
          Left = 9
          Top = 152
          Width = 984
          Height = 385
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 4
        end
        object edPort: TEdit
          Left = 758
          Top = 85
          Width = 67
          Height = 24
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 5
          Text = '3306'
        end
        object edDB: TEdit
          Left = 581
          Top = 85
          Width = 116
          Height = 24
          Hint = 'Database name is hardcoded to "vaers"  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 6
          Text = 'vaers'
        end
        object cbCheck: TCheckBox
          Left = 152
          Top = 16
          Width = 401
          Height = 17
          Caption = 'Automatically check for online updates of 2022 VAERS data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object Button18: TButton
          Left = 864
          Top = 84
          Width = 129
          Height = 30
          Caption = 'Set DB local_infile=1'
          TabOrder = 8
          OnClick = Button18Click
        end
        object edInsCount: TEdit
          Left = 758
          Top = 17
          Width = 67
          Height = 24
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 9
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 1362
        Height = 73
        Align = alTop
        TabOrder = 1
        object btnCreateTables: TButton
          Left = 318
          Top = 13
          Width = 163
          Height = 49
          Caption = 'Create DB Tables'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnCreateTablesClick
        end
        object btnCheckTextfile: TButton
          Left = 9
          Top = 13
          Width = 148
          Height = 49
          Caption = 'Check textfiles'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnCheckTextfileClick
        end
        object btnConnect: TButton
          Left = 163
          Top = 13
          Width = 150
          Height = 49
          Caption = 'Test DB connection'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnConnectClick
        end
        object btnLoadFlu: TButton
          Left = 487
          Top = 13
          Width = 162
          Height = 49
          Caption = 'Load FLU History Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnLoadFluClick
        end
        object btnLoadStudies: TButton
          Left = 655
          Top = 13
          Width = 170
          Height = 49
          Caption = 'Load ADV Studies Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = btnLoadStudiesClick
        end
        object btnDownload: TButton
          Left = 1151
          Top = 13
          Width = 162
          Height = 49
          Caption = 'Download Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = btnDownloadClick
        end
        object btnLoadC19LotList: TButton
          Left = 831
          Top = 13
          Width = 154
          Height = 49
          Caption = 'Create Vax Lot C19'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = btnLoadC19LotListClick
        end
        object btnLoadLotList: TButton
          Left = 991
          Top = 13
          Width = 154
          Height = 49
          Caption = 'Create Vax Lot Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = btnLoadLotListClick
        end
      end
    end
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 636
    Width = 1370
    Height = 19
    Panels = <
      item
        Text = 'DB: not Connected'
        Width = 150
      end
      item
        Text = 'Fastload not Activated'
        Width = 200
      end
      item
        Width = 200
      end>
  end
  object mysql: TMySQLDatabase
    DatabaseName = 'vaers'
    UserName = 'vaersuser'
    UserPassword = 'vaers909'
    Host = '127.0.0.1'
    ConnectOptions = [coCompress]
    Params.Strings = (
      'Port=3306'
      'TIMEOUT=30'
      'DatabaseName=vaers'
      'Host=127.0.0.1'
      'UID=vaersuser'
      'PWD=vaers909'
      '')
    AfterConnect = mysqlAfterConnect
    AfterDisconnect = mysqlAfterDisconnect
    SSLProperties.TLSVersion = tlsAuto
    OnConnectionFailure = mysqlConnectionFailure
    DatasetOptions = []
    Left = 696
    Top = 264
  end
  object dataQuery: TMySQLQuery
    Database = mysql
    RequestLive = True
    SQL.Strings = (
      'select * from data;')
    Left = 1144
    Top = 176
  end
  object userSource: TDataSource
    DataSet = userQuery
    Left = 1032
    Top = 456
  end
  object saveDataQuery: TMySQLQuery
    Database = mysql
    Left = 1056
    Top = 368
  end
  object delQuery: TMySQLQuery
    Database = mysql
    Left = 632
    Top = 336
  end
  object MySQLBatch: TMySQLBatchExecute
    Database = mysql
    Delimiter = ';'
    Left = 1040
    Top = 112
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 1064
    Top = 168
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvTLSv1_2
    SSLOptions.SSLVersions = [sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 1080
    Top = 240
  end
  object userQuery: TMySQLQuery
    Database = mysql
    SQL.Strings = (
      'select * from data;')
    Left = 736
    Top = 352
  end
  object QueryTimer: TTimer
    Enabled = False
    OnTimer = QueryTimerTimer
    Left = 872
    Top = 336
  end
  object OpenDialog: TOpenDialog
    Left = 776
    Top = 264
  end
  object checkQuery: TMySQLQuery
    Database = mysql
    Left = 696
    Top = 440
  end
  object QueryCalcTimer: TTimer
    Enabled = False
    OnTimer = QueryCalcTimerTimer
    Left = 960
    Top = 344
  end
  object studyQuery: TMySQLQuery
    Database = mysql
    SQL.Strings = (
      'select title, url'
      'from studies'
      'order by title;')
    Left = 824
    Top = 424
    object studyQuerytitle: TWideStringField
      FieldName = 'title'
      Required = True
      Size = 1000
    end
    object studyQueryurl: TWideStringField
      FieldName = 'url'
      Required = True
      Size = 1000
    end
  end
  object dsstudyQuery: TDataSource
    DataSet = studyQuery
    Left = 888
    Top = 496
  end
  object LotQuery: TMySQLQuery
    Database = mysql
    Left = 600
    Top = 432
  end
  object lotDQuery: TMySQLDirectQuery
    Database = mysql
    Left = 520
    Top = 304
  end
  object tableQuery: TMySQLQuery
    Database = mysql
    Options.FetchOnDemand = True
    Options.FetchRows = 100
    Options.RefreshDelete = False
    SQL.Strings = (
      'select * from data;')
    Left = 296
    Top = 336
  end
  object dstableQuery: TDataSource
    AutoEdit = False
    DataSet = tableQuery
    Left = 296
    Top = 424
  end
  object sqlBatch: TMySQLBatchExecute
    Database = mysql
    Delimiter = ';'
    Left = 216
    Top = 280
  end
  object cleanTimer: TTimer
    Enabled = False
    OnTimer = cleanTimerTimer
    Left = 848
    Top = 256
  end
  object loadTimer: TTimer
    Interval = 2000
    OnTimer = loadTimerTimer
    Left = 800
    Top = 200
  end
end
