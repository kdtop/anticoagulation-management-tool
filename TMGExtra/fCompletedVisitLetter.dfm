object frmCompletedVisitLetter: TfrmCompletedVisitLetter
  Left = 0
  Top = 0
  Caption = 'Create Documentation'
  ClientHeight = 555
  ClientWidth = 744
  Color = clBtnFace
  Constraints.MinHeight = 420
  Constraints.MinWidth = 760
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHTMLColorBorder: TPanel
    Left = 0
    Top = 129
    Width = 744
    Height = 384
    Align = alClient
    BevelOuter = bvNone
    Color = clYellow
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      744
      384)
    object pnlHTMLObjHolder: TPanel
      Left = 5
      Top = 5
      Width = 733
      Height = 373
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      Caption = 'HTML Obj Will Go Here'
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      ParentBackground = False
      TabOrder = 0
    end
  end
  object pcLetterType: TPageControl
    Left = 0
    Top = 0
    Width = 744
    Height = 129
    ActivePage = tsDocDischarge
    Align = alTop
    TabOrder = 1
    OnChange = pcLetterTypeChange
    object tsDocStartMgmt: TTabSheet
      Caption = 'Intake'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlDocStart: TPanel
        Left = 0
        Top = 0
        Width = 736
        Height = 101
        Hint = 'Click to Clear Comments'
        ParentCustomHint = False
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label1: TLabel
          Left = 7
          Top = 5
          Width = 54
          Height = 13
          Caption = 'Comments:'
        end
        object memComments1: TMemo
          Left = 7
          Top = 24
          Width = 430
          Height = 50
          ScrollBars = ssVertical
          TabOrder = 0
          OnChange = memCommentsChange
          OnExit = memComments1Exit
        end
        object btnMemClear1: TButton
          Left = 7
          Top = 80
          Width = 40
          Height = 16
          Caption = 'C&lear'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = False
          OnClick = btnMemClearClick
        end
      end
    end
    object tsDocInterval: TTabSheet
      Caption = 'Interval'
      ImageIndex = 1
      object pnlDocInterval: TPanel
        Left = 0
        Top = 0
        Width = 736
        Height = 101
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          736
          101)
        object lblComments: TLabel
          Left = 321
          Top = 8
          Width = 54
          Height = 13
          Caption = 'Comments:'
        end
        object rgMedsChanged: TRadioGroup
          Left = 10
          Top = 10
          Width = 114
          Height = 65
          Caption = 'Medications'
          Items.Strings = (
            'Meds Changed'
            'No Med Change')
          TabOrder = 0
          OnClick = rgMedsChangedClick
        end
        object gbxInstructions: TGroupBox
          Left = 130
          Top = 10
          Width = 185
          Height = 65
          Caption = 'Instructions'
          TabOrder = 1
          object lblHoldDays: TLabel
            Left = 129
            Top = 17
            Width = 23
            Height = 13
            Caption = 'days'
            Enabled = False
          end
          object lblTabsToday: TLabel
            Left = 87
            Top = 43
            Width = 64
            Height = 13
            Caption = 'tablets today'
            Enabled = False
          end
          object ckbHold: TCheckBox
            Left = 3
            Top = 18
            Width = 85
            Height = 17
            Caption = '&Hold dose for'
            TabOrder = 0
            OnClick = ckbHoldClick
          end
          object edtNumHoldDays: TEdit
            Left = 94
            Top = 16
            Width = 29
            Height = 21
            Hint = 'Number of days'
            Enabled = False
            MaxLength = 1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnChange = edtNumHoldDaysChange
          end
          object ckbTake: TCheckBox
            Left = 3
            Top = 41
            Width = 45
            Height = 17
            Caption = '&Take'
            TabOrder = 2
            OnClick = ckbTakeClick
          end
          object edtTakeNumTabsToday: TEdit
            Left = 52
            Top = 41
            Width = 29
            Height = 21
            Hint = 'Number of days'
            MaxLength = 3
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnChange = edtTakeNumTabsTodayChange
          end
        end
        object memComments2: TMemo
          Left = 321
          Top = 27
          Width = 411
          Height = 48
          Anchors = [akLeft, akTop, akRight]
          ScrollBars = ssVertical
          TabOrder = 2
          OnChange = memCommentsChange
          OnExit = memComments2Exit
        end
        object btnMemClear2: TButton
          Left = 321
          Top = 81
          Width = 40
          Height = 16
          Caption = 'C&lear'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = False
          OnClick = btnMemClearClick
        end
      end
    end
    object tsDocMissedAppt: TTabSheet
      Caption = 'Missed Appt'
      ImageIndex = 2
      OnShow = tsDocMissedApptShow
      object pnlDocMissedAppt: TPanel
        Left = 0
        Top = 0
        Width = 736
        Height = 101
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          736
          101)
        object lblNewAppt: TLabel
          Left = 45
          Top = 5
          Width = 89
          Height = 13
          Caption = 'New Appointment:'
        end
        object lblNAppt: TLabel
          Left = 141
          Top = 5
          Width = 40
          Height = 13
          Caption = 'lblNAppt'
        end
        object lblMADt: TLabel
          Left = 8
          Top = 27
          Width = 126
          Height = 13
          Caption = 'Missed Appointment Date:'
        end
        object Label2: TLabel
          Left = 321
          Top = 7
          Width = 54
          Height = 13
          Caption = 'Comments:'
        end
        object dtpMissedAppt: TDateTimePicker
          Left = 141
          Top = 23
          Width = 101
          Height = 21
          Date = 37820.584724004600000000
          Time = 37820.584724004600000000
          TabOrder = 0
          OnChange = dtpMissedApptChange
        end
        object memComments3: TMemo
          Left = 321
          Top = 26
          Width = 411
          Height = 48
          Anchors = [akLeft, akTop, akRight]
          ScrollBars = ssVertical
          TabOrder = 1
          OnChange = memCommentsChange
          OnExit = memComments3Exit
        end
        object btnMemClear3: TButton
          Left = 321
          Top = 80
          Width = 40
          Height = 16
          Caption = 'C&lear'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = False
          OnClick = btnMemClearClick
        end
      end
    end
    object tsDocDischarge: TTabSheet
      Caption = 'Discharge'
      ImageIndex = 3
      object pnlDocDischarge: TPanel
        Left = 0
        Top = 0
        Width = 736
        Height = 101
        Align = alClient
        BevelOuter = bvNone
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          736
          101)
        object lblDCOn: TLabel
          Left = 183
          Top = 45
          Width = 12
          Height = 13
          Caption = 'on'
          Enabled = False
        end
        object lblDCFor: TLabel
          Left = 302
          Top = 44
          Width = 17
          Height = 13
          Alignment = taCenter
          BiDiMode = bdRightToLeft
          Caption = 'for '
          Enabled = False
          ParentBiDiMode = False
        end
        object Label3: TLabel
          Left = 409
          Top = 3
          Width = 54
          Height = 13
          Anchors = [akRight]
          Caption = 'Comments:'
          ExplicitLeft = 440
        end
        object ckbPtMovedAway: TCheckBox
          Left = 11
          Top = 4
          Width = 185
          Height = 17
          Caption = 'Pt moved; transferring mgmt to:'
          TabOrder = 0
          OnClick = ckbPtMovedAwayClick
        end
        object ckbPtViolatedAgreement: TCheckBox
          Left = 11
          Top = 24
          Width = 257
          Height = 17
          Caption = 'Pt violated Anticoagulation Treatment Agreement'
          TabOrder = 1
          OnClick = ckbPtViolatedAgreementClick
        end
        object ckbPtDC: TCheckBox
          Left = 11
          Top = 45
          Width = 65
          Height = 17
          Caption = 'D/C'#39'd by'
          TabOrder = 2
          OnClick = ckbPtDCClick
        end
        object edtPtDCdByName: TEdit
          Left = 75
          Top = 43
          Width = 102
          Height = 21
          Color = cl3DLight
          Enabled = False
          ReadOnly = True
          TabOrder = 3
          OnChange = edtPtDCdByNameChange
        end
        object dtpDC: TDateTimePicker
          Left = 207
          Top = 41
          Width = 89
          Height = 21
          Date = 37908.636825231480000000
          Time = 37908.636825231480000000
          Color = cl3DLight
          Enabled = False
          TabOrder = 4
          OnChange = dtpDCChange
        end
        object edtPtMovedAway: TEdit
          Left = 189
          Top = 3
          Width = 211
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          OnChange = edtPtMovedAwayChange
        end
        object edtDCReason: TEdit
          Left = 325
          Top = 41
          Width = 75
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Enabled = False
          TabOrder = 6
          OnChange = edtDCReasonChange
        end
        object memComments4: TMemo
          Left = 407
          Top = 22
          Width = 325
          Height = 53
          Anchors = [akRight]
          ScrollBars = ssVertical
          TabOrder = 7
          OnChange = memCommentsChange
          OnExit = memComments4Exit
        end
        object btnMemClear4: TButton
          Left = 413
          Top = 81
          Width = 40
          Height = 16
          Anchors = [akTop, akRight]
          Caption = 'C&lear'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Small Fonts'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Visible = False
          OnClick = btnMemClearClick
        end
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 513
    Width = 744
    Height = 42
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      744
      42)
    object btnCancel: TBitBtn
      Left = 460
      Top = 6
      Width = 86
      Height = 30
      Anchors = [akTop, akRight]
      Caption = '&Cancel'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF808080000000000000000000000000000000808080FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000800000FF00
        00FF0000FF0000FF0000FF000080000000FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF000000FF00FFFF00FFFF00FFFF00FF0000000000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF000000FF00FFFF00FF808080
        0000800000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF000080808080FF00FF0000000000FF0000FF0000FFFFFFFFFFFFFF00
        00FF0000FF0000FFFFFFFFFFFFFF0000FF0000FF0000FF000000FF00FF000000
        0000FF0000FF0000FF0000FFFFFFFFFFFFFF0000FFFFFFFFFFFFFF0000FF0000
        FF0000FF0000FF000000FF00FF0000000000FF0000FF0000FF0000FF0000FFFF
        FFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF000000FF00FF000000
        0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000
        FF0000FF0000FF000000FF00FF0000000000FF0000FF0000FF0000FFFFFFFFFF
        FFFF0000FFFFFFFFFFFFFF0000FF0000FF0000FF0000FF000000FF00FF808080
        0000800000FF0000FFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFF0000
        FF0000FF000080808080FF00FFFF00FF0000000000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF000000FF00FFFF00FFFF00FF
        FF00FF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000800000FF00
        00FF0000FF0000FF0000FF000080000000FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF808080000000000000000000000000000000808080FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ModalResult = 2
      TabOrder = 0
    end
    object btnDone: TBitBtn
      Left = 644
      Top = 6
      Width = 86
      Height = 30
      Anchors = [akTop, akRight]
      Caption = '&Done'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF299D49FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF30A2502DCC622AA84EFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A4522ACC5F20D25F28
        D05F2DA14EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF35A55529D16120D25FFFFFFF1FD15E27BF594FB16BFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF38A65729D16520D25F2EDA6B29AB512E
        DA6B21D3602AAE53FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF37A656
        2AD2651FD15E43E17B2FAD537BCA932CAB502EDA6B22D05F2BA24DFF00FFFF00
        FFFF00FFFF00FFFF00FF32A6562EDA6B21D15F7CF2A631B353FF00FFFF00FF38
        B25A2CAD502EDA6B21C4573FAD5EFF00FFFF00FFFF00FFFF00FFFF00FF32A656
        8EF8B633B658FF00FFFF00FFFF00FFFF00FFFF00FF2DAD511FCB5C2AB75538B2
        5AFF00FFFF00FFFF00FFFF00FFFF00FF32A656FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF2FB1541FC9572DAE51FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32B35620C2
        5538B25AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF34B75625B75238B25AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF37B65B25AD4838B25AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38B75C2EB04FFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF3EB961FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ModalResult = 1
      TabOrder = 1
    end
    object btnPrint: TBitBtn
      Left = 552
      Top = 6
      Width = 86
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = '&Print'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000D70D0000D70D00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA3
        A3A2969696969696969696969696969696969696969696969696A3A3A2FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF969696FFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFF
        FFFC969696FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF969696FFFFFC9696969696969696969696
        96969696969696FFFFFC969696FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF969696FFFFFCFFFFFC
        FFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFC969696FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF816F556E5A3C6E5A3C6E5A3C96
        9696FFFFFC969696969696969696969696969696969696FFFFFC9696966E5A3C
        6E5A3C6E5A3C816F55FF00FFFF00FFFF00FFFF00FFFF00FF816F559C886AB4A0
        82B4A082505050969696FFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFF
        FFFC969696505050B4A082B4A0829C886A816F55FF00FFFF00FFFF00FFFF00FF
        6E5A3CB4A082B4A082B4A0825050509A9A999696969696969696969696969696
        969696969696969696969A9A99505050B4A082B4A082B4A0826E5A3CFF00FFFF
        00FFFF00FFFF00FF6E5A3CB4A082B4A082B4A082505050969696969696969696
        969696969696969696969696969696969696969696505050B4A082B4A082B4A0
        826E5A3CFF00FFFF00FFFF00FFFF00FF6E5A3CB4A082B4A082B4A08250505073
        7373737373737373737373737373737373737373737373737373737373505050
        B4A082B4A082B4A0826E5A3CFF00FFFF00FFFF00FFFF00FF6E5A3CB4A082B4A0
        82B4A08282786982786982786982786982786982786982786982786982786982
        7869827869827869B4A082B4A082B4A0826E5A3CFF00FFFF00FFFF00FFFF00FF
        6E5A3CB4A183B8A589B8A589B8A589B8A589B8A589B8A589B8A589B8A589B8A5
        89B8A589B8A589B8A589B8A589B8A589B4A183B4A082B4A0826E5A3CFF00FFFF
        00FFFF00FFFF00FF786649C7B8A1CABBA5CABCA5CABCA5CABCA5CABCA5CABCA5
        CABCA5CABCA5CABCA5CABCA5CABCA5CABCA5CABCA5CABBA5C7B8A1B9A78AB4A0
        826E5A3CFF00FFFF00FFFF00FFFF00FF8C7C64CBBDA7CBBDA7CBBDA7CBBDA79E
        9D9A9696969696969696969696969696969696969696969696969E9D9ACBBDA7
        CBBDA7C3B49BB4A0826E5A3CFF00FFFF00FFFF00FFFF00FF968770BAAC96CBBD
        A7CBBDA7CBBDA7969696FFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFF
        FFFC969696CBBDA7CBBDA7C0B0969C886A816F55FF00FFFF00FFFF00FFFF00FF
        FF00FF9687708F7F678F80678F8067969696FFFFFCFFFFFCFFFFFCFFFFFCFFFF
        FCFFFFFCFFFFFCFFFFFC9696968F7F6786755C705C3F816F55FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF969696FFFFFCFFFFFC
        FFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFC969696FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF96
        9696FFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFC969696FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF969696FFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFCFF
        FFFC969696FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF969696FFFFFCFFFFFCFFFFFCFFFFFCFFFF
        FCFFFFFCFFFFFCFFFFFC969696FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA3A3A2969696969696
        969696969696969696969696969696969696A3A3A2FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 2
      OnClick = btnPrintClick
    end
    object pnlBtnBorder: TPanel
      Left = 5
      Top = 3
      Width = 151
      Height = 36
      BevelOuter = bvNone
      Color = clYellow
      ParentBackground = False
      TabOrder = 3
      object btnRegenerate: TBitBtn
        Left = 3
        Top = 3
        Width = 145
        Height = 30
        Caption = ' &Regenerate Note'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000C30E0000C30E00000001000000010000000000006365
          0000009A3100639A0000848684009CFFFF00C0C0C000CECFCE00FFFBFF00FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000060600000000
          0000000000000000000606060407070707070707070707070006060604080805
          0805020508050807000606060408050805020208050805070006060604080805
          0202020202050807000606060408050805020208030105070006060604080805
          0805020508010807000606060408050105080508050105070006060604080801
          0805020508050807000606060408050103080202050805070006060604080805
          0202020202050807000606060408080808080202050807070006060604080808
          0808020508000000000606060408080808080508050409000606060604080808
          0808080808040006060606060404040404040404040406060606}
        ParentFont = False
        TabOrder = 0
        OnClick = btnRegenerateClick
      end
    end
  end
end
