object frmBroker: TfrmBroker
  Left = 338
  Top = 235
  BorderIcons = [biSystemMenu]
  Caption = 'Broker Calls'
  ClientHeight = 273
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TORAutoPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 53
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblMaxCalls: TLabel
      Left = 8
      Top = 8
      Width = 91
      Height = 13
      Caption = 'Max Calls Retained'
    end
    object txtMaxCalls: TCaptionEdit
      Left = 8
      Top = 24
      Width = 81
      Height = 21
      Hint = 
        'Enter the number of calls to be retained, or use up or down curs' +
        'or keys to adjust.'
      TabOrder = 0
      Text = '10'
      Caption = 'Max Calls Retained'
    end
    object cmdPrev: TBitBtn
      Left = 319
      Top = 8
      Width = 50
      Height = 37
      Hint = 'Click to see results of previous RPC in call stack.'
      Caption = 'Prev'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = cmdPrevClick
      Glyph.Data = {
        36010000424D360100000000000076000000280000001E0000000C0000000100
        040000000000C000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777887777
        7777777778877777770077777008777777777777778777777700777700087777
        7777777777877777770077700008888888877777778888888800770000000000
        0087777777777777780070000000000000877777777777777800F00000000000
        008F7777777777777800FF0000000000008F77777777777778007FF00007FFFF
        FF77FF77777FFFFFF70077FF0008777777777FF7778777777700777FF0087777
        777777FF7787777777007777FFF777777777777FFF7777777700}
      Layout = blGlyphTop
    end
    object cmdNext: TBitBtn
      Left = 369
      Top = 8
      Width = 50
      Height = 37
      Hint = 'Click to see results of next RPC in call stack.'
      Caption = 'Next'
      TabOrder = 5
      OnClick = cmdNextClick
      Glyph.Data = {
        36010000424D360100000000000076000000280000001E0000000C0000000100
        040000000000C000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777778877
        777777777778877777007777777F00877777777777F7787777007777777F0008
        7777777777F77787770078888887000087778888887777787700F00000000000
        087F7777777777778700F00000000000008F7777777777777800F00000000000
        007F7777777777777700F00000000000077F7777777777777700FFFFFFFF0000
        777FFFFFFFF7777777007777777F00077777777777F7777777007777777F0077
        7777777777F7777777007777777FF7777777777777FF77777700}
      Layout = blGlyphTop
    end
    object udMax: TUpDown
      Left = 89
      Top = 24
      Width = 15
      Height = 21
      Hint = 
        'Use up- or down-cursor keys to increase or decrease the number o' +
        'f calls to be retained.'
      Associate = txtMaxCalls
      Min = 1
      Position = 10
      TabOrder = 1
    end
    object btnRLT: TButton
      Left = 257
      Top = 18
      Width = 31
      Height = 21
      Hint = 'Click to measure Relative Lapsed Time for a Standard RPC'
      Caption = 'RLT'
      TabOrder = 3
      OnClick = btnRLTClick
    end
    object lblCallID: TVA508StaticText
      Name = 'lblCallID'
      Left = 125
      Top = 20
      Width = 100
      Height = 15
      Alignment = taCenter
      AutoSize = True
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Last Broker Call - 0'
      Constraints.MinWidth = 100
      Padding.Left = 3
      Padding.Right = 3
      ParentColor = True
      TabOrder = 2
      ShowAccelChar = True
    end
  end
  object memData: TRichEdit
    Left = 0
    Top = 53
    Width = 427
    Height = 220
    Align = alClient
    HideScrollBars = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
    WantReturns = False
  end
  object amgrMain: TVA508AccessibilityManager
    Data = (
      (
        'Component = lblCallID'
        'Status = stsDefault')
      (
        'Component = txtMaxCalls'
        'Property = Hint'
        'Status = stsOK')
      (
        'Component = btnRLT'
        'Property = Hint'
        'Status = stsOK')
      (
        'Component = udMax'
        'Property = Hint'
        'Status = stsOK')
      (
        'Component = frmBroker'
        'Status = stsDefault')
      (
        'Component = cmdPrev'
        'Property = Hint'
        'Status = stsOK')
      (
        'Component = cmdNext'
        'Property = Hint'
        'Status = stsOK'))
  end
end
