object frmExsubmast: TfrmExsubmast
  Left = 198
  Top = 163
  Width = 524
  Height = 330
  Caption = 'Class wise subject master for exam'
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
    Left = 95
    Top = 16
    Width = 345
    Height = 29
    Caption = ' Class wise Subject Master for Exam '
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
    Left = 16
    Top = 64
    Width = 25
    Height = 13
    Caption = 'Code'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 128
    Top = 64
    Width = 53
    Height = 13
    Caption = 'Description'
    FocusControl = DBEdit2
  end
  object Label4: TLabel
    Left = 368
    Top = 64
    Width = 25
    Height = 13
    Caption = 'Class'
    FocusControl = DBEdit4
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 259
    Width = 228
    Height = 33
    DataSource = exmdata.CLMastS
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbCancel]
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 72
    Top = 64
    Width = 49
    Height = 21
    DataField = 'ClCode'
    DataSource = exmdata.CLMastS
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 192
    Top = 64
    Width = 153
    Height = 21
    DataField = 'Descr'
    DataSource = exmdata.CLMastS
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 408
    Top = 64
    Width = 89
    Height = 21
    DataField = 'Clcaption'
    DataSource = exmdata.CLMastS
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 96
    Width = 489
    Height = 153
    DataSource = exmdata.exsubmastS
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CLCODE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SUBGROUP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUBJDESC'
        Title.Caption = 'Subject'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FMARKS'
        Title.Caption = 'Full Marks'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PMARKS'
        Title.Caption = 'Pass Marks'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONT'
        Title.Caption = 'Still Valid'
        Width = 55
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 416
    Top = 259
    Width = 75
    Height = 33
    TabOrder = 5
    Kind = bkClose
  end
end
