object genperf: Tgenperf
  Left = 272
  Top = 99
  BorderStyle = bsDialog
  Caption = 'General Preference'
  ClientHeight = 454
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 91
    Top = 16
    Width = 114
    Height = 28
    Caption = ' Preference '
    Color = clHighlight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -23
    Font.Name = 'Impact'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label1: TLabel
    Left = 16
    Top = 56
    Width = 94
    Height = 13
    Caption = 'Name of the School'
  end
  object Label3: TLabel
    Left = 16
    Top = 160
    Width = 58
    Height = 13
    Caption = 'Page Footer'
  end
  object Label4: TLabel
    Left = 16
    Top = 96
    Width = 63
    Height = 13
    Caption = 'Page Header'
  end
  object Label2: TLabel
    Left = 200
    Top = 277
    Width = 76
    Height = 13
    Caption = 'Months per term'
  end
  object Label8: TLabel
    Left = 16
    Top = 277
    Width = 62
    Height = 13
    Caption = 'Session Start'
  end
  object Label9: TLabel
    Left = 16
    Top = 321
    Width = 70
    Height = 13
    Caption = 'Lines per page'
  end
  object Label10: TLabel
    Left = 200
    Top = 318
    Width = 59
    Height = 13
    Caption = 'Lines to skip'
  end
  object Label6: TLabel
    Left = 16
    Top = 373
    Width = 82
    Height = 13
    Caption = 'Last date for fees'
  end
  object Label7: TLabel
    Left = 17
    Top = 240
    Width = 76
    Height = 13
    Caption = 'Age cut-off date'
  end
  object edtOrgnm: TEdit
    Left = 16
    Top = 72
    Width = 257
    Height = 21
    TabOrder = 0
  end
  object btnOk: TBitBtn
    Left = 56
    Top = 413
    Width = 73
    Height = 33
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOkClick
  end
  object mmPageHeader: TMemo
    Left = 16
    Top = 112
    Width = 257
    Height = 49
    TabOrder = 2
  end
  object mmPageFooter: TMemo
    Left = 16
    Top = 176
    Width = 257
    Height = 49
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 160
    Top = 413
    Width = 73
    Height = 33
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 4
  end
  object edtMnthTerm: TEdit
    Left = 200
    Top = 293
    Width = 73
    Height = 21
    TabOrder = 5
  end
  object edtsession: TEdit
    Left = 16
    Top = 293
    Width = 73
    Height = 21
    TabOrder = 6
  end
  object edtLinesPage: TEdit
    Left = 16
    Top = 337
    Width = 73
    Height = 21
    TabOrder = 7
    Text = '68'
  end
  object Memo3: TMemo
    Left = 216
    Top = 32
    Width = 73
    Height = 33
    Lines.Strings = (
      'Memo3')
    TabOrder = 8
    Visible = False
  end
  object edtLineSkip: TEdit
    Left = 200
    Top = 334
    Width = 73
    Height = 21
    TabOrder = 9
    Text = '5'
  end
  object updFeeLastdt: TUpDown
    Left = 259
    Top = 370
    Width = 16
    Height = 21
    Associate = edtFeeLastDt
    Min = 1
    Max = 31
    Position = 25
    TabOrder = 10
  end
  object edtFeeLastDt: TEdit
    Left = 200
    Top = 370
    Width = 59
    Height = 21
    TabOrder = 11
    Text = '25'
  end
  object dtpAgeCutOff: TDateTimePicker
    Left = 136
    Top = 240
    Width = 139
    Height = 21
    Date = 41444.457489351850000000
    Time = 41444.457489351850000000
    TabOrder = 12
  end
end
