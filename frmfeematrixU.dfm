object frmfeematrix: Tfrmfeematrix
  Left = 284
  Top = 149
  BorderStyle = bsDialog
  Caption = 'Fee Matrix'
  ClientHeight = 284
  ClientWidth = 564
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
  object Label5: TLabel
    Left = 201
    Top = 8
    Width = 134
    Height = 29
    Caption = '   FEE  MATRIX   '
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
    Left = 24
    Top = 64
    Width = 25
    Height = 13
    Caption = 'Code'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 112
    Top = 65
    Width = 53
    Height = 13
    Caption = 'Description'
    FocusControl = DBEdit2
  end
  object DBEdit1: TDBEdit
    Left = 56
    Top = 64
    Width = 34
    Height = 21
    DataField = 'code'
    DataSource = MyData.dsFeeProf
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 168
    Top = 64
    Width = 233
    Height = 21
    DataField = 'descr'
    DataSource = MyData.dsFeeProf
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 96
    Width = 377
    Height = 129
    DataSource = MyData.dsfeematrix1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'AC_NO'
        Title.Caption = 'Code'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACDESC'
        Title.Caption = 'Description'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FEE'
        Title.Caption = 'Amount'
        Width = 85
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 24
    Top = 240
    Width = 248
    Height = 33
    DataSource = MyData.dsFeeProf
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
    Kind = dbnHorizontal
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 472
    Top = 240
    Width = 65
    Height = 33
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 4
  end
  object DBGrid2: TDBGrid
    Left = 408
    Top = 64
    Width = 145
    Height = 161
    DataSource = MyData.dsFeeProfDet
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'fee_prof_code'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'clcode'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'clCaption'
        Title.Caption = 'Class'
        Visible = True
      end>
  end
end
