object frmTTable: TfrmTTable
  Left = 20
  Top = 26
  BorderStyle = bsDialog
  Caption = 'Sample Time Table'
  ClientHeight = 483
  ClientWidth = 756
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
    Left = 321
    Top = 8
    Width = 113
    Height = 29
    Caption = ' Time Table '
    Color = clHighlight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Impact'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 552
    Top = 280
    Width = 81
    Height = 13
    Caption = 'Validation Report'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label7: TLabel
    Left = 306
    Top = 450
    Width = 36
    Height = 13
    Caption = 'Subject'
  end
  object label8: TLabel
    Left = 77
    Top = 453
    Width = 30
    Height = 13
    Caption = 'Period'
  end
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 8
    Top = 48
    Width = 737
    Height = 224
    ColCount = 3
    DataSource = MyData.dsttable
    PanelHeight = 112
    PanelWidth = 240
    TabOrder = 0
    RowCount = 2
    object Label1: TLabel
      Left = 480
      Top = 16
      Width = 32
      Height = 13
      Caption = 'CCode'
    end
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 41
      Height = 13
      Caption = 'Period '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 56
      Top = 16
      Width = 51
      Height = 17
      Color = clBtnFace
      DataField = 'Period'
      DataSource = MyData.dsttable
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 40
      Width = 31
      Height = 13
      Caption = 'Class'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 64
      Width = 48
      Height = 13
      Caption = 'Teacher'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 88
      Width = 44
      Height = 13
      Caption = 'Subject'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 176
      Top = 8
      Width = 51
      Height = 17
      Alignment = taRightJustify
      Color = clInfoBk
      DataField = 'dname'
      DataSource = MyData.dsttable
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 72
      Top = 40
      Width = 97
      Height = 21
      DataField = 'clDesc'
      DataSource = MyData.dsttable
      TabOrder = 0
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 72
      Top = 64
      Width = 152
      Height = 21
      DataField = 'tchName'
      DataSource = MyData.dsttable
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 72
      Top = 88
      Width = 153
      Height = 21
      DataField = 'SubDesc'
      DataSource = MyData.dsttable
      TabOrder = 2
    end
  end
  object btnValidate: TBitBtn
    Left = 536
    Top = 408
    Width = 65
    Height = 33
    Caption = '&Validate'
    TabOrder = 1
    OnClick = btnValidateClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 280
    Width = 537
    Height = 113
    DataSource = MyData.dsttable
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DAY'
        Title.Caption = 'Day code'
        Width = 50
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'dname'
        Title.Caption = 'Day'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cldesc'
        Title.Caption = 'Class'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERIOD'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEACHER'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tchname'
        Title.Caption = 'Teacher'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'subdesc'
        Width = 97
        Visible = True
      end>
  end
  object Memo1: TMemo
    Left = 552
    Top = 296
    Width = 193
    Height = 97
    TabOrder = 3
  end
  object btnCopy: TBitBtn
    Left = 8
    Top = 408
    Width = 65
    Height = 33
    Hint = 'Copy Day 1 for remaining days'
    Caption = 'Copy'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
      007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
      7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
      99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnCopyClick
  end
  object GroupBox1: TGroupBox
    Left = 80
    Top = 400
    Width = 449
    Height = 41
    TabOrder = 5
    object edtClass: TLabeledEdit
      Left = 144
      Top = 12
      Width = 73
      Height = 21
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Class '
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object edtDay: TLabeledEdit
      Left = 32
      Top = 12
      Width = 73
      Height = 21
      EditLabel.Width = 22
      EditLabel.Height = 13
      EditLabel.Caption = 'Day '
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object edtTeacher: TLabeledEdit
      Left = 272
      Top = 12
      Width = 73
      Height = 21
      EditLabel.Width = 43
      EditLabel.Height = 13
      EditLabel.Caption = 'Teacher '
      LabelPosition = lpLeft
      TabOrder = 2
    end
    object btnFilter: TBitBtn
      Left = 366
      Top = 10
      Width = 75
      Height = 25
      Hint = 'Filter the Time table'
      Caption = 'Filter'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F777773FF333333008877700
        33333337733FFF773F33330887000777033333733F777FFF73F330880FAFAF07
        703337F37733377FF7F33080F00000F07033373733777337F73F087F00A2200F
        77037F3737333737FF7F080A0A2A220A07037F737F3333737F7F0F0F0AAAA20F
        07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373737F0F7F00FFA00F
        780373F737FFF737F3733080F00000F0803337F73377733737F330F80FAFAF08
        8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
        3333333773FFFF77333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnFilterClick
    end
  end
  object btnFreePeriod: TBitBtn
    Left = 608
    Top = 408
    Width = 73
    Height = 33
    Caption = '&Free Periods'
    TabOrder = 6
    OnClick = btnFreePeriodClick
  end
  object BitBtn2: TBitBtn
    Left = 688
    Top = 408
    Width = 65
    Height = 33
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 7
  end
  object btnSearch: TBitBtn
    Left = 536
    Top = 448
    Width = 121
    Height = 33
    Caption = 'Search For Teacher'
    TabOrder = 8
    OnClick = btnSearchClick
  end
  object edtSub: TEdit
    Left = 352
    Top = 448
    Width = 73
    Height = 21
    TabOrder = 9
  end
  object edtperiod: TEdit
    Left = 112
    Top = 448
    Width = 73
    Height = 21
    TabOrder = 10
  end
end
