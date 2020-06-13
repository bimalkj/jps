object userfrm: Tuserfrm
  Left = 199
  Top = 122
  ActiveControl = edtLogin
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Authentication'
  ClientHeight = 271
  ClientWidth = 227
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 26
    Height = 13
    Caption = 'Login'
  end
  object Label3: TLabel
    Left = 16
    Top = 72
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 152
    Width = 211
    Height = 105
  end
  object Label4: TLabel
    Left = 15
    Top = 163
    Width = 71
    Height = 13
    Caption = 'New Password'
  end
  object Label5: TLabel
    Left = 16
    Top = 195
    Width = 84
    Height = 13
    Caption = 'Confirm Password'
  end
  object Label6: TLabel
    Left = 44
    Top = 8
    Width = 138
    Height = 29
    Caption = ' Login  Screen '
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
  object btnLogin: TBitBtn
    Left = 32
    Top = 106
    Width = 65
    Height = 25
    Caption = '&Login'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnLoginClick
  end
  object btnChangePass: TBitBtn
    Left = 184
    Top = 72
    Width = 25
    Height = 25
    Hint = 'Change Password'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
      000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
      00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
      F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
      0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
      FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
      FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
      0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
      00333377737FFFFF773333303300000003333337337777777333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnChangePassClick
  end
  object edtLogin: TEdit
    Left = 72
    Top = 40
    Width = 105
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    Text = 'ADMIN'
  end
  object edtPass: TEdit
    Left = 119
    Top = 157
    Width = 84
    Height = 21
    PasswordChar = '*'
    TabOrder = 4
  end
  object edtPassConf: TEdit
    Left = 119
    Top = 189
    Width = 84
    Height = 21
    PasswordChar = '*'
    TabOrder = 5
  end
  object btnApplyPass: TButton
    Left = 119
    Top = 224
    Width = 84
    Height = 25
    Caption = '&Apply Changes'
    TabOrder = 6
    OnClick = btnApplyPassClick
  end
  object btnCancel: TBitBtn
    Left = 112
    Top = 106
    Width = 65
    Height = 25
    Caption = '&Cancel'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 7
    OnClick = btnCancelClick
  end
  object edtPassword: TEdit
    Left = 72
    Top = 72
    Width = 105
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnClick = edtPasswordEnter
    OnEnter = edtPasswordEnter
  end
end