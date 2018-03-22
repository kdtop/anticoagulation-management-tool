object frmPCE: TfrmPCE
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Service Connection'
  ClientHeight = 214
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TPanel
    Left = 0
    Top = 173
    Width = 444
    Height = 41
    Align = alBottom
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object btnCancel: TButton
      Left = 379
      Top = 8
      Width = 56
      Height = 25
      Hint = 'Click to Cancel Changes'
      Caption = '&Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
    end
    object btnOK: TButton
      Left = 318
      Top = 8
      Width = 56
      Height = 25
      Hint = 'Click to Accept changes'
      Caption = '&OK'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = btnOKClick
    end
  end
  object pnlForm: TPanel
    Left = 0
    Top = 0
    Width = 444
    Height = 173
    Align = alClient
    TabOrder = 1
    object pnlVisit: TPanel
      Left = 223
      Top = 1
      Width = 220
      Height = 171
      Align = alRight
      TabOrder = 1
      inline fraVisitRelated: TfraVisitRelated
        Left = 1
        Top = 1
        Width = 218
        Height = 169
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 218
        ExplicitHeight = 169
        inherited gbVisitRelatedTo: TGroupBox
          Width = 218
          Height = 169
          ExplicitWidth = 218
          ExplicitHeight = 169
        end
      end
    end
    object memSvcConn: TMemo
      Left = 1
      Top = 1
      Width = 220
      Height = 171
      Align = alLeft
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      Lines.Strings = (
        'Service Connected: 75%'
        'TRAUMATIC ARTHRITIS (50% SC)'
        'LOSS OF MOTION OF THUMB (25% SC)')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      OnEnter = memSvcConnEnter
    end
  end
end
