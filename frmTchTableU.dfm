object frmTchTable: TfrmTchTable
  Left = 149
  Top = 74
  BorderStyle = bsDialog
  Caption = 'Teacher'#39's Time Table'
  ClientHeight = 348
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label15: TLabel
    Left = 160
    Top = 16
    Width = 217
    Height = 29
    Caption = ' Teacher'#39's  Time Table '
    Color = clHighlight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Impact'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label1: TLabel
    Left = 192
    Top = 72
    Width = 13
    Height = 13
    Caption = '   '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtTeacher: TLabeledEdit
    Left = 88
    Top = 72
    Width = 65
    Height = 21
    EditLabel.Width = 72
    EditLabel.Height = 13
    EditLabel.Caption = 'Techer'#39's Code '
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 8
    Top = 104
    Width = 513
    Height = 193
    Font.Charset = OEM_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object btnGenerate: TBitBtn
    Left = 152
    Top = 72
    Width = 25
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300130000031
      00333773F77777FF7733331000909000133333377737F777FF33330098F0F890
      0333337733F733F77F33370980FFF08907333373373F373373F33099FF0FFFF9
      903337F3F373F33FF7F33090FFF0FF00903337F73337F37737F33099FFF0FFF9
      9033373F33F7F3F33733370980F0F0890733337FF737F7337F33330098F0F890
      03333F77FF3733377FFF000009999900000377777FFFFF77777F088700000008
      77037F3377777773337F088887707888870373F3337773F33373307880707088
      7033373FF737F73FF733337003303300733333777337FF777333333333000333
      3333333333777333333333333333333333333333333333333333}
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnGenerateClick
  end
  object btnPrint: TBitBtn
    Left = 72
    Top = 312
    Width = 65
    Height = 33
    Hint = 'Print'
    Caption = '&Print'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnPrintClick
  end
  object BitBtn1: TBitBtn
    Left = 376
    Top = 312
    Width = 81
    Height = 33
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 4
  end
end
