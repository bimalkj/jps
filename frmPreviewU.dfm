object frmPreview: TfrmPreview
  Left = 206
  Top = 192
  BorderStyle = bsDialog
  Caption = 'Preview'
  ClientHeight = 232
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnPrint: TBitBtn
    Left = 39
    Top = 199
    Width = 73
    Height = 25
    Caption = '&Print'
    TabOrder = 0
    OnClick = btnPrintClick
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
  end
  object BitBtn1: TBitBtn
    Left = 384
    Top = 199
    Width = 73
    Height = 25
    TabOrder = 1
    Kind = bkClose
  end
  object Memo1: TMemo
    Left = 8
    Top = 15
    Width = 476
    Height = 170
    Font.Charset = OEM_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Terminal'
    Font.Style = []
    Lines.Strings = (
      ' ')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Memo2: TMemo
    Left = 8
    Top = 15
    Width = 476
    Height = 170
    Font.Charset = OEM_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Terminal'
    Font.Style = []
    Lines.Strings = (
      ' ')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 3
    Visible = False
  end
end
