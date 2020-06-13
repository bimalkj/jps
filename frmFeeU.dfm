object frmFee: TfrmFee
  Left = 253
  Top = 164
  BorderStyle = bsDialog
  Caption = 'Fee Collection'
  ClientHeight = 444
  ClientWidth = 582
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
  object Label1: TLabel
    Left = 16
    Top = 64
    Width = 57
    Height = 13
    Caption = 'Receipt No.'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 424
    Top = 64
    Width = 23
    Height = 13
    Caption = 'Date'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 213
    Top = 48
    Width = 34
    Height = 13
    Caption = 'Stud Id'
    FocusControl = DBEdit3
  end
  object Label8: TLabel
    Left = 216
    Top = 128
    Width = 42
    Height = 13
    Caption = 'Late Fee'
    FocusControl = DBEdit8
    Visible = False
  end
  object Label9: TLabel
    Left = 16
    Top = 96
    Width = 75
    Height = 13
    Caption = 'Student'#39's Name'
    FocusControl = DBLookupComboBox1
  end
  object Label11: TLabel
    Left = 504
    Top = 88
    Width = 21
    Height = 13
    Caption = 'SEC'
  end
  object Label4: TLabel
    Left = 368
    Top = 128
    Width = 120
    Height = 13
    Caption = 'No of Terms Already Paid'
  end
  object DBText1: TDBText
    Left = 424
    Top = 104
    Width = 73
    Height = 17
    Color = clBtnHighlight
    DataField = 'clDesc'
    DataSource = MyData.tbfeeS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label10: TLabel
    Left = 424
    Top = 88
    Width = 22
    Height = 13
    Caption = 'STD'
  end
  object DBText2: TDBText
    Left = 504
    Top = 104
    Width = 49
    Height = 17
    Color = clBtnHighlight
    DataField = 'sec'
    DataSource = MyData.tbfeeS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText3: TDBText
    Left = 504
    Top = 128
    Width = 49
    Height = 17
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'NOTERMS'
    DataSource = MyData.studmastS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label12: TLabel
    Left = 16
    Top = 128
    Width = 61
    Height = 13
    Caption = 'Terms to pay'
    FocusControl = DBEdit4
  end
  object Label13: TLabel
    Left = 384
    Top = 312
    Width = 63
    Height = 13
    Caption = 'Total Amount'
    FocusControl = DBEdit5
    OnClick = btnAutoClick
  end
  object Label5: TLabel
    Left = 191
    Top = 8
    Width = 149
    Height = 29
    Caption = ' Fee  Collection '
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
  object btnInfo: TSpeedButton
    Left = 395
    Top = 91
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
      333333333337FF3333333333330003333333333333777F333333333333080333
      3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
      33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
      B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
      BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
      B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
      3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
      333333333337F33333333333333B333333333333333733333333}
    NumGlyphs = 2
    OnClick = btnInfoClick
  end
  object Label18: TLabel
    Left = 277
    Top = 48
    Width = 41
    Height = 13
    Caption = 'Adm No.'
    FocusControl = DBLookupComboBox4
  end
  object lblChq: TLabel
    Left = 16
    Top = 423
    Width = 12
    Height = 13
    Caption = '....'
    Color = clGradientActiveCaption
    ParentColor = False
  end
  object DBText4: TDBText
    Left = 464
    Top = 143
    Width = 88
    Height = 17
    Alignment = taRightJustify
    Color = clWhite
    DataField = 'M_PHONE'
    DataSource = MyData.studmastS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 104
    Top = 64
    Width = 105
    Height = 21
    DataField = 'MR_NO'
    DataSource = MyData.tbfeeS
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 464
    Top = 64
    Width = 88
    Height = 21
    DataField = 'MR_DATE'
    DataSource = MyData.tbfeeS
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 213
    Top = 64
    Width = 51
    Height = 21
    DataField = 'StudID'
    DataSource = MyData.tbfeeS
    TabOrder = 1
  end
  object DBCheckBox1: TDBCheckBox
    Left = 384
    Top = 280
    Width = 65
    Height = 17
    Caption = 'CASH'
    DataField = 'CASH'
    DataSource = MyData.tbfeeS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    ValueChecked = '1'
    ValueUnchecked = '0'
    OnClick = DBCheckBox1Click
  end
  object DBEdit8: TDBEdit
    Left = 272
    Top = 128
    Width = 64
    Height = 21
    DataField = 'LATE_FEE'
    DataSource = MyData.tbfeeS
    TabOrder = 6
    Visible = False
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 384
    Width = 264
    Height = 33
    DataSource = MyData.tbfeeS
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbCancel]
    TabOrder = 8
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 104
    Top = 91
    Width = 285
    Height = 21
    DataField = 'studname'
    DataSource = MyData.tbfeeS
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 160
    Width = 505
    Height = 105
    DataSource = MyData.tbfeeDetailS
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'AC_NO'
        Title.Alignment = taCenter
        Title.Caption = 'Item Code'
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'AC_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Descriptive Name'
        Width = 264
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_AMT'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Charge'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_AMTPAID'
        Title.Caption = 'Paid'
        Visible = True
      end>
  end
  object btnAuto: TBitBtn
    Left = 528
    Top = 160
    Width = 33
    Height = 105
    Caption = '&Auto'
    TabOrder = 10
    OnClick = btnAutoClick
  end
  object DBEdit4: TDBEdit
    Left = 104
    Top = 128
    Width = 64
    Height = 21
    DataField = 'NOTERM'
    DataSource = MyData.tbfeeS
    TabOrder = 5
  end
  object DBEdit5: TDBEdit
    Left = 456
    Top = 312
    Width = 73
    Height = 21
    DataField = 'tot_amt'
    DataSource = MyData.tbfeeS
    TabOrder = 11
  end
  object btnSave: TBitBtn
    Left = 333
    Top = 385
    Width = 76
    Height = 32
    Action = MyData.dsSav
    Caption = '&Save'
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = btnSaveClick
  end
  object btnNew: TBitBtn
    Left = 416
    Top = 385
    Width = 73
    Height = 32
    Action = MyData.dsIns
    Caption = '&New'
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object btnPreview: TBitBtn
    Left = 504
    Top = 384
    Width = 33
    Height = 33
    Hint = 'Preview'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      033333777777777773333330777777703333333773F333773333333330888033
      33333FFFF7FFF7FFFFFF0000000000000003777777777777777F0FFFFFFFFFF9
      FF037F3333333337337F0F78888888887F037F33FFFFFFFFF37F0F7000000000
      8F037F3777777777F37F0F70AAAAAAA08F037F37F3333337F37F0F70ADDDDDA0
      8F037F37F3333337F37F0F70A99A99A08F037F37F3333337F37F0F70A99A99A0
      8F037F37F3333337F37F0F70AAAAAAA08F037F37FFFFFFF7F37F0F7000000000
      8F037F3777777777337F0F77777777777F037F3333333333337F0FFFFFFFFFFF
      FF037FFFFFFFFFFFFF7F00000000000000037777777777777773}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnClick = btnPreviewClick
  end
  object btnPrint: TBitBtn
    Left = 536
    Top = 384
    Width = 33
    Height = 33
    Hint = 'Print'
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
    TabOrder = 15
    OnClick = btnPrintClick
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 271
    Width = 362
    Height = 63
    TabOrder = 16
    OnClick = DBCheckBox1Click
    object Label6: TLabel
      Left = 185
      Top = 35
      Width = 42
      Height = 13
      Caption = 'Chq. No.'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 8
      Top = 9
      Width = 25
      Height = 13
      Caption = 'Bank'
    end
    object Label14: TLabel
      Left = 182
      Top = 10
      Width = 25
      Height = 13
      Caption = 'Bran.'
    end
    object Label15: TLabel
      Left = 10
      Top = 36
      Width = 18
      Height = 13
      Caption = 'Amt'
    end
    object btnChqdetails: TSpeedButton
      Left = 324
      Top = 35
      Width = 23
      Height = 22
      Hint = 'Cheque details'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337FF3333333333330003333333333333777F333333333333080333
        3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
        33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
        B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
        BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
        B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
        3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
        333333333337F33333333333333B333333333333333733333333}
      NumGlyphs = 2
      OnClick = btnChqdetailsClick
    end
    object DBEdit6: TDBEdit
      Left = 233
      Top = 33
      Width = 85
      Height = 21
      DataField = 'CHQ_NO'
      DataSource = MyData.tbfeeS
      TabOrder = 3
      OnExit = DBEdit6Exit
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 57
      Top = 7
      Width = 122
      Height = 21
      DataField = 'bdesc'
      DataSource = MyData.tbfeeS
      TabOrder = 0
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 209
      Top = 8
      Width = 138
      Height = 21
      DataField = 'brdesc'
      DataSource = MyData.tbfeeS
      TabOrder = 1
    end
    object DBEdit7: TDBEdit
      Left = 57
      Top = 34
      Width = 122
      Height = 21
      DataField = 'CHQ_AMT'
      DataSource = MyData.tbfeeS
      TabOrder = 2
    end
  end
  object DBLookupComboBox4: TDBLookupComboBox
    Left = 277
    Top = 64
    Width = 141
    Height = 21
    DataField = 'ADMNO'
    DataSource = MyData.tbfeeS
    TabOrder = 2
  end
  object RdGp2: TDBRadioGroup
    Left = 16
    Top = 340
    Width = 513
    Height = 34
    Caption = ' &Look For : '
    Columns = 6
    DataField = 'FieldName'
    DataSource = MyData.RdBtnValD
    Items.Strings = (
      'Recpt. No.'
      'Admn. No.'
      'Name')
    TabOrder = 17
    Values.Strings = (
      'MR_NO'
      'AdmNo'
      'Name')
    OnChange = edtSearchChange
  end
  object CBx1: TComboBox
    Left = 249
    Top = 349
    Width = 49
    Height = 21
    TabOrder = 18
    Text = '='
    OnChange = edtSearchChange
    Items.Strings = (
      '='
      'Like')
  end
  object edtSearch: TEdit
    Left = 304
    Top = 349
    Width = 167
    Height = 21
    TabStop = False
    Color = clInfoBk
    TabOrder = 19
    OnChange = edtSearchChange
  end
  object btnSearch: TBitBtn
    Left = 478
    Top = 348
    Width = 48
    Height = 23
    Hint = 'Search'
    Caption = '&Find'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
    TabStop = False
    OnClick = btnSearchClick
  end
  object DBCheckBox2: TDBCheckBox
    Left = 16
    Top = 41
    Width = 169
    Height = 17
    Caption = 'Additional fee collection'
    Color = clBtnFace
    Ctl3D = True
    DataField = 'adhoc'
    DataSource = MyData.tbfeeS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 21
    ValueChecked = '1'
    ValueUnchecked = '0'
    OnClick = DBCheckBox2Click
  end
  object chkHead: TCheckBox
    Left = 408
    Top = 41
    Width = 153
    Height = 17
    Caption = 'No heading in printout'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 22
  end
  object Query1: TMyQuery
    Connection = MyData.myconn
    SQL.Strings = (
      'SELECT MR_NO,fee.studid,studmast.name'
      'FROM fee'
      'INNER JOIN studmast'
      'ON(studmast.studid=fee.studid)'
      'WHERE  UPPER(CAST('
      'fee.studid'
      'AS CHAR(40))) LIKE :empno')
    Left = 364
    Top = 6
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empno'
        Value = nil
      end>
    object Query1MR_NO: TStringField
      FieldName = 'MR_NO'
      Size = 14
    end
    object Query1studid: TFloatField
      FieldName = 'studid'
    end
    object Query1name: TStringField
      FieldName = 'name'
      Size = 40
    end
  end
end
