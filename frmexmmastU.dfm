object frmExmmast: TfrmExmmast
  Left = 224
  Top = 126
  Width = 631
  Height = 298
  Caption = 'Exam master'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label15: TLabel
    Left = 143
    Top = 8
    Width = 132
    Height = 29
    Caption = ' Exam master '
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
    Left = 32
    Top = 64
    Width = 38
    Height = 13
    Caption = 'Exam Id'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 32
    Top = 88
    Width = 53
    Height = 13
    Caption = 'Description'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 248
    Top = 64
    Width = 23
    Height = 13
    Caption = 'Date'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 32
    Top = 120
    Width = 46
    Height = 13
    Caption = 'Other info'
    FocusControl = DBMemo1
  end
  object Label5: TLabel
    Left = 408
    Top = 64
    Width = 148
    Height = 13
    Caption = 'Classes appearing for this exam'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 227
    Width = 228
    Height = 33
    DataSource = exmdata.exmmastS
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbCancel]
    TabOrder = 0
  end
  object btnSave: TBitBtn
    Left = 245
    Top = 228
    Width = 76
    Height = 32
    Action = exmdata.dspost
    Caption = '&Save'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
    Left = 326
    Top = 228
    Width = 73
    Height = 32
    Action = exmdata.dsins
    Caption = '&New'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
    Left = 96
    Top = 64
    Width = 65
    Height = 21
    DataField = 'Exmid'
    DataSource = exmdata.exmmastS
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 96
    Top = 88
    Width = 297
    Height = 21
    DataField = 'Exmdesc'
    DataSource = exmdata.exmmastS
    TabOrder = 4
  end
  object DBEdit3: TDBEdit
    Left = 288
    Top = 64
    Width = 105
    Height = 21
    DataField = 'Exmdate'
    DataSource = exmdata.exmmastS
    TabOrder = 5
  end
  object DBMemo1: TDBMemo
    Left = 96
    Top = 120
    Width = 297
    Height = 89
    DataField = 'Oinfo'
    DataSource = exmdata.exmmastS
    TabOrder = 6
  end
  object DBGrid1: TDBGrid
    Left = 408
    Top = 80
    Width = 209
    Height = 177
    DataSource = exmdata.excldetS
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CLID'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLDESCR'
        Title.Caption = 'Class'
        Visible = True
      end>
  end
end
