object frmItems: TfrmItems
  Left = 187
  Top = 160
  BorderStyle = bsDialog
  Caption = 'Item Master'
  ClientHeight = 235
  ClientWidth = 500
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
    Left = 187
    Top = 16
    Width = 125
    Height = 29
    Caption = ' Item Master '
    Color = clHighlight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Impact'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 24
    Top = 64
    Width = 26
    Height = 13
    Caption = 'Sl No'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 24
    Top = 104
    Width = 53
    Height = 13
    Caption = 'Description'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 24
    Top = 144
    Width = 23
    Height = 13
    Caption = 'Rate'
    FocusControl = DBEdit3
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 187
    Width = 228
    Height = 33
    DataSource = MyData.dsItems
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbCancel]
    TabOrder = 0
  end
  object btnSave: TBitBtn
    Left = 277
    Top = 188
    Width = 76
    Height = 32
    Hint = 'Post'
    Caption = '&Save'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnSaveClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
      00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
      00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
      00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
      0003737FFFFFFFFF7F7330099999999900333777777777777733}
    NumGlyphs = 2
  end
  object btnNew: TBitBtn
    Left = 390
    Top = 188
    Width = 73
    Height = 32
    Hint = 'Insert'
    Caption = '&New'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnNewClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
      333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
      0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
      07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
      07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
      0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
      33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
      B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
      3BB33773333773333773B333333B3333333B7333333733333337}
    NumGlyphs = 2
  end
  object DBEdit1: TDBEdit
    Left = 88
    Top = 64
    Width = 134
    Height = 21
    DataField = 'ItemCode'
    DataSource = MyData.dsItems
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 88
    Top = 104
    Width = 394
    Height = 21
    DataField = 'Descr'
    DataSource = MyData.dsItems
    TabOrder = 4
  end
  object DBEdit3: TDBEdit
    Left = 88
    Top = 144
    Width = 134
    Height = 21
    DataField = 'Rte'
    DataSource = MyData.dsItems
    TabOrder = 5
  end
end
