object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Football Possession Timer'
  ClientHeight = 295
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 149
    Top = 8
    Width = 47
    Height = 13
    Caption = 'Total time'
  end
  object Label3: TLabel
    Left = 29
    Top = 8
    Width = 82
    Height = 13
    Caption = 'Home Possession'
  end
  object Label4: TLabel
    Left = 237
    Top = 8
    Width = 82
    Height = 13
    Caption = 'Away Possession'
  end
  object status: TLabel
    Left = 133
    Top = 54
    Width = 40
    Height = 13
    Caption = 'Stopped'
  end
  object total_time: TEdit
    Left = 133
    Top = 27
    Width = 87
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object away_time: TEdit
    Left = 237
    Top = 27
    Width = 87
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object home_time: TEdit
    Left = 24
    Top = 27
    Width = 87
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object reset: TButton
    Left = 72
    Top = 247
    Width = 75
    Height = 25
    Caption = '&Reset'
    TabOrder = 4
    OnClick = resetClick
  end
  object exit: TButton
    Left = 184
    Top = 247
    Width = 75
    Height = 25
    Caption = '&Exit'
    TabOrder = 5
    OnClick = exitClick
  end
  object home_percent: TEdit
    Left = 24
    Top = 54
    Width = 87
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object away_percent: TEdit
    Left = 237
    Top = 54
    Width = 87
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
  object ontop: TCheckBox
    Left = 24
    Top = 215
    Width = 97
    Height = 17
    Caption = 'window on top'
    Checked = True
    State = cbChecked
    TabOrder = 8
    OnClick = ontopClick
  end
  object control_area: TGroupBox
    Left = 24
    Top = 91
    Width = 300
    Height = 118
    Caption = 'control area'
    TabOrder = 0
    OnMouseDown = control_areaMouseDown
    object Label2: TLabel
      Left = 16
      Top = 25
      Width = 249
      Height = 13
      Caption = 'left click=switch to home, right click=switch to away'
      OnMouseDown = Label2MouseDown
    end
    object Label5: TLabel
      Left = 16
      Top = 44
      Width = 184
      Height = 13
      Caption = 'middle click=swith to dead ball (pause)'
      OnMouseDown = Label5MouseDown
    end
  end
  object about: TButton
    Left = 315
    Top = 215
    Width = 16
    Height = 18
    Caption = '?'
    TabOrder = 9
    OnClick = aboutClick
  end
  object swap: TCheckBox
    Left = 162
    Top = 215
    Width = 135
    Height = 17
    Caption = 'left click for away team'
    TabOrder = 10
    OnClick = swapClick
  end
  object home: TTimer
    Interval = 100
    OnTimer = homeTimer
    Left = 208
    Top = 176
  end
  object away: TTimer
    Interval = 100
    OnTimer = awayTimer
    Left = 248
    Top = 176
  end
end
