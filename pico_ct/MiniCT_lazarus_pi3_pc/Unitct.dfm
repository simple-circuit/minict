object Form1: TForm1
  Left = 157
  Height = 687
  Top = 172
  Width = 980
  Caption = 'N7VK Mini Curve Tracer'
  ClientHeight = 668
  ClientWidth = 980
  Color = clBtnFace
  Constraints.MinHeight = 640
  Constraints.MinWidth = 980
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Icon.Data = {
    FE0200000000010001002020100000000000E802000016000000280000002000
    0000400000000100040000000000800200000000000000000000000000000000
    0000000000000000800000800000008080008000000080008000808000008080
    8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
    FF00777772277777777777777777777777777777722777777777777777777777
    7777788882287788888877888887788888877888822877888888778888877888
    8887788882287788888877888887788888877888822877888888778888877888
    8887788882287788888877888887788888877888822877888888778888877888
    8887777772277777777777777777777777777777722777777777777777777777
    7777788882287788888877888887788888877888822877888888778888877888
    8887788882287788888877888887788888877888822877888888778888877888
    8887788882287788888877888887788888877888822222222222222888877888
    8887777772222222222222222777777777777777777777777777777222277777
    7777788888887788888877888222788888877888888877888888778888822888
    8887788888887788888877888887228888877888888877888888778888872288
    8887788888887788888877888887228888877777777777777777777777777227
    7777777777777777777777777777722777777888888877888888778888877228
    8887788888887788888877888887722888877888888877888888778888877228
    8887788888887788888877888887722888877888888877888888778888877228
    8887788888887788888877888887788888877777777777777777777777777777
    7777000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000
  }
  KeyPreview = True
  Menu = MainMenu1
  OnCreate = FormCreate
  OnDestroy = FomrDestroy
  OnKeyDown = formkeydown
  OnKeyUp = formkeyup
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  ShowHint = True
  LCLVersion = '1.0.8.0'
  object Bevel3: TBevel
    Left = 520
    Height = 134
    Top = 8
    Width = 112
  end
  object Bevel10: TBevel
    Left = 520
    Height = 112
    Top = 318
    Width = 237
    Shape = bsFrame
  end
  object Shape1: TShape
    Left = 520
    Height = 163
    Top = 436
    Width = 408
    Brush.Color = clInactiveCaption
    Shape = stRoundRect
  end
  object Bevel8: TBevel
    Left = 591
    Height = 60
    Top = 444
    Width = 175
  end
  object Bevel15: TBevel
    Left = 527
    Height = 26
    Top = 383
    Width = 178
  end
  object ImageWave: TImage
    Left = 529
    Height = 20
    Top = 385
    Width = 178
    OnMouseDown = wavemousedown
    Picture.Data = {
      07544269746D6170A6070000424DA6070000000000007600000028000000B100
      0000140000000100040000000000300700000000000000000000100000000000
      0000000000000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF002222222222222BBBB222022222222222BB222220222222222BBBBBBBBBB0
      222222222222222222202222222222222222222022222222222222222220222B
      BBB22222BBBB222022222BB2222222B22220BBBBBBBBB2222222B00000002222
      222222222B22B222022222222222BB222220222222222B22222222B022222222
      2222222222202222222222222222222022222222222222222220222B22B22222
      B22B22202222B2B222222B2B2220B2222222B2222222B0000000222222222222
      B2222B2202222222222B22B22220222222222B22222222B02222222222222222
      2220222222222222222222202222222222222222222022B2222B222B2222B220
      2222B22B22222B2B2220B2222222B2222222B000000022222222222B222222B2
      02222222222B22B22220222222222B22222222B0222222222222222222202222
      2222222222222220222222222222222222202B222222B2B222222B20222B222B
      2222B222B220B2222222B2222222B000000022222222222B222222B202222222
      222B222B2220222222222B22222222B022222222222222222220222222222222
      22222220222222222222222222202B222222B2B222222B2022B22222B222B222
      B220B2222222B2222222B00000002222222222B2222222B20222222222B2222B
      2220222222222B22222222B02222222222222222222022222222222222222220
      22222222222222222220B2222222BB2222222BB022B22222B22B22222B20B222
      2222B2222222B00000002222222222B22222222B0222222222B22222B2202222
      22222B22222222B0222222222222222222202222222222222222222022222222
      222222222220B22222222B22222222B02B2222222B2B22222B20B2222222B222
      2222B00000002222222222B22222222B0222222222B22222B220222222222B22
      222222B022222222222222222220222222222222222222202222222222222222
      2220B22222222B22222222B02B2222222BB2222222B0B2222222B2222222B000
      00002222222222B22222222B022222222B2222222B20222222222B22222222B0
      222222222222222222202222222222222222222022222222222222222220B222
      22222B22222222B0B222222222B222222220B2222222BBBBBBBBB00000008888
      8888888888888888888888888888888888888888888888888888888888888888
      8888888888888888888888888888888888888888888888888888888888888888
      8888888888888888888888888888888888888888888880000000B22222222B22
      222222220B2222222B2222222220B22222222B2222222220B22222222B222222
      22B0B22222222B22222222B0B22222222BBBBBBBBBB022222222222222222220
      22222222222222222220222222222222222220000000B22222222B2222222222
      0B222222B22222222220B22222222B2222222220B22222222B22222222B02B22
      2222B2B2222222B0B22222222B22222222B02222222222222222222022222222
      222222222220222222222222222220000000B22222222B222222222202B22222
      B22222222220B22222222B2222222220B22222222B22222222B02B222222B2B2
      22222B20B22222222B22222222B0222222222222222222202222222222222222
      2220222222222222222220000000B22222222B222222222202B22222B2222222
      2220B22222222B2222222220B22222222B22222222B022B2222B222B22222B20
      B22222222B22222222B022222222222222222220222222222222222222202222
      222222222222200000002B222222B22222222222022B222B222222222220B222
      22222B22222222202B222222B2B222222B2022B2222B222B2222B220B2222222
      2B22222222B02222222222222222222022222222222222222220222222222222
      2222200000002B222222B22222222222022B222B222222222220B22222222B22
      222222202B222222B2B222222B20222B222B2222B222B220B22222222B222222
      22B0222222222222222222202222222222222222222022222222222222222000
      00002B222222B222222222220222B22B222222222220B22222222B2222222220
      2B222222B2B222222B20222B22B22222B22B2220B22222222B22222222B02222
      22222222222222202222222222222222222022222222222222222000000022B2
      222B2222222222220222B2B2222222222220B22222222B222222222022B2222B
      222B2222B2202222B2B222222B2B2220B22222222B22222222B0222222222222
      2222222022222222222222222220222222222222222220000000222B22B22222
      2222222202222BB2222222222220B22222222B2222222220222B22B22222B22B
      22202222BB2222222BB22220B22222222B22222222B022222222222222222220
      22222222222222222220222222222222222220000000222BBBB2222222222222
      02222B22222222222220BBBBBBBBBB2222222220222BBBB22222BBBB22202222
      2B22222222B22220BBBBBBBBBB22222222B02222222222222222222022222222
      222222222220222222222222222220000000
    }
  end
  object Shape12: TShape
    Left = 7
    Height = 111
    Top = 528
    Width = 230
    Brush.Color = clInactiveCaption
    OnMouseMove = OnMouseMove2
    Shape = stRoundRect
  end
  object Bevel6: TBevel
    Left = 764
    Height = 60
    Top = 370
    Width = 164
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 638
    Height = 84
    Top = 8
    Width = 127
    Shape = bsFrame
  end
  object Bevel4: TBevel
    Left = 520
    Height = 164
    Top = 148
    Width = 112
    Shape = bsFrame
  end
  object Bevel5: TBevel
    Left = 638
    Height = 126
    Top = 97
    Width = 127
    Shape = bsFrame
  end
  object Shape11: TShape
    Left = 244
    Height = 111
    Top = 528
    Width = 230
    Brush.Color = clInactiveCaption
    OnMouseMove = OnMouseMove2
    Shape = stRoundRect
  end
  object Labelipd: TLabel
    Left = 148
    Height = 15
    Top = 609
    Width = 82
    AutoSize = False
    Caption = '5.00mA/Div.'
    Color = clInactiveCaption
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    OnClick = LabelipdClick
  end
  object LabelVO: TLabel
    Left = 52
    Height = 17
    Top = 580
    Width = 67
    Caption = 'VO 0 Div.'
    Color = clInactiveCaption
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    OnClick = LabelVOClick
  end
  object LabelIO: TLabel
    Left = 155
    Height = 17
    Top = 580
    Width = 62
    Caption = 'IO 0 Div.'
    Color = clInactiveCaption
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    OnClick = LabelIOClick
  end
  object Label1: TLabel
    Left = 644
    Height = 15
    Top = 126
    Width = 32
    Caption = 'Start'
    Color = clBtnFace
    ParentColor = False
    Transparent = False
  end
  object Label7: TLabel
    Left = 644
    Height = 15
    Top = 148
    Width = 30
    Caption = 'Step'
    Color = clBtnFace
    ParentColor = False
    Transparent = False
  end
  object Labelch0: TLabel
    Left = 801
    Height = 15
    Top = 377
    Width = 21
    Caption = '0.0'
    Color = clBtnFace
    ParentColor = False
    Transparent = False
  end
  object Labelch1: TLabel
    Left = 882
    Height = 15
    Top = 377
    Width = 21
    Caption = '0.0'
    Color = clBtnFace
    ParentColor = False
    Transparent = False
  end
  object Labelch2: TLabel
    Left = 852
    Height = 15
    Top = 407
    Width = 68
    Caption = 'Samples ='
    Color = clBtnFace
    ParentColor = False
    Transparent = False
    Visible = False
  end
  object Labelch3: TLabel
    Left = 801
    Height = 15
    Top = 392
    Width = 21
    Caption = '0.0'
    Color = clBtnFace
    ParentColor = False
    Transparent = False
  end
  object Labelch4: TLabel
    Left = 882
    Height = 15
    Top = 392
    Width = 21
    Caption = '0.0'
    Color = clBtnFace
    ParentColor = False
    Transparent = False
  end
  object Label12: TLabel
    Left = 325
    Height = 15
    Top = 560
    Width = 77
    Caption = 'Sweep Step'
    Color = clInactiveCaption
    ParentColor = False
    Transparent = False
    WordWrap = True
    OnClick = Label12Click
  end
  object Label13: TLabel
    Left = 325
    Height = 15
    Top = 593
    Width = 61
    Caption = 'Trace No.'
    Color = clInactiveCaption
    ParentColor = False
    Transparent = False
    OnClick = Label13Click
  end
  object Label14: TLabel
    Left = 251
    Height = 15
    Top = 543
    Width = 22
    Caption = 'S/N'
    Color = clInactiveCaption
    ParentColor = False
    Transparent = False
  end
  object LabelSP: TLabel
    Left = 590
    Height = 15
    Top = 156
    Width = 37
    Caption = '0.00V'
    ParentColor = False
  end
  object LabelSS: TLabel
    Left = 590
    Height = 15
    Top = 207
    Width = 37
    Caption = '0.00V'
    ParentColor = False
  end
  object LabelSG: TLabel
    Left = 588
    Height = 15
    Top = 259
    Width = 53
    Caption = '000.0uA'
    ParentColor = False
  end
  object Label15: TLabel
    Left = 646
    Height = 15
    Top = 104
    Width = 84
    Caption = 'Slow Sweep'
    Color = clBtnFace
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object LabelMPV: TLabel
    Left = 727
    Height = 15
    Top = 126
    Width = 45
    Caption = '00.00V'
    Color = clBtnFace
    ParentColor = False
    Transparent = False
  end
  object LabelSPV: TLabel
    Left = 727
    Height = 15
    Top = 148
    Width = 37
    Caption = '0.01V'
    Color = clBtnFace
    ParentColor = False
    Transparent = False
  end
  object Labelv: TLabel
    Left = 535
    Height = 21
    Top = 41
    Width = 13
    Caption = 'V'
    Color = clBtnFace
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Labeli: TLabel
    Left = 535
    Height = 21
    Top = 63
    Width = 7
    Caption = 'I'
    Color = clBtnFace
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label26: TLabel
    Left = 527
    Height = 15
    Top = 444
    Width = 85
    Caption = 'Sample Point'
    Color = clInactiveCaption
    ParentColor = False
    Transparent = False
    OnClick = Label26Click
  end
  object LabelNdex: TLabel
    Left = 646
    Height = 15
    Top = 15
    Width = 46
    Caption = 'For : ...'
    ParentColor = False
  end
  object LabelWait: TLabel
    Left = 646
    Height = 15
    Top = 45
    Width = 55
    Caption = 'Wait : ...'
    ParentColor = False
  end
  object LabelLine: TLabel
    Left = 646
    Height = 15
    Top = 60
    Width = 48
    Caption = 'Line: ...'
    ParentColor = False
  end
  object LabelendV: TLabel
    Left = 646
    Height = 15
    Top = 170
    Width = 90
    Caption = 'End-V = 2.55V'
    Color = clBtnFace
    ParentColor = False
    Transparent = False
  end
  object Label2: TLabel
    Left = 256
    Height = 29
    Top = 558
    Width = 21
    Caption = '+'
    Color = clInactiveCaption
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label3: TLabel
    Left = 258
    Height = 29
    Top = 580
    Width = 11
    Caption = '-'
    Color = clInactiveCaption
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object LabelRslope: TLabel
    Left = 777
    Height = 15
    Top = 542
    Width = 53
    Caption = 'Value = '
    Color = clInactiveCaption
    ParentColor = False
    Transparent = False
  end
  object LabelPP: TLabel
    Left = 598
    Height = 15
    Top = 508
    Width = 95
    Caption = 'Point: .. Step:..'
    Color = clInactiveCaption
    ParentColor = False
    Transparent = False
  end
  object Label4: TLabel
    Left = 325
    Height = 15
    Top = 617
    Width = 77
    Caption = 'No. To Disp.'
    Color = clInactiveCaption
    ParentColor = False
    Transparent = False
    OnClick = Label4Click
  end
  object Label5: TLabel
    Left = 532
    Height = 29
    Top = 532
    Width = 21
    Caption = '+'
    Color = clInactiveCaption
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    ParentColor = False
    ParentFont = False
    Transparent = False
    OnClick = Label5Click
  end
  object Label6: TLabel
    Left = 536
    Height = 29
    Top = 562
    Width = 11
    Caption = '-'
    Color = clInactiveCaption
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    ParentColor = False
    ParentFont = False
    Transparent = False
    OnClick = Label6Click
  end
  object Labelvpd: TLabel
    Left = 46
    Height = 15
    Top = 609
    Width = 60
    AutoSize = False
    Caption = '5.00V/Div.'
    Color = clInactiveCaption
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    OnClick = LabelvpdClick
  end
  object LabelAC: TLabel
    Left = 527
    Height = 15
    Top = 412
    Width = 94
    Caption = 'AC: Sine Wave'
    ParentColor = False
    OnClick = LabelACClick
  end
  object BX0: TShape
    Left = 528
    Height = 20
    Top = 385
    Width = 20
    Brush.Style = bsClear
    Pen.Color = clYellow
    Pen.Mode = pmNotXor
    Pen.Width = 8
    OnMouseDown = mousew0
  end
  object BX1: TShape
    Left = 547
    Height = 20
    Top = 385
    Width = 20
    Brush.Style = bsClear
    Pen.Color = clYellow
    Pen.Mode = pmNotXor
    Pen.Width = 8
    OnMouseDown = mousew1
    Visible = False
  end
  object BX2: TShape
    Left = 566
    Height = 20
    Top = 385
    Width = 20
    Brush.Style = bsClear
    Pen.Color = clYellow
    Pen.Mode = pmNotXor
    Pen.Width = 8
    OnMouseDown = mousew2
    Visible = False
  end
  object BX3: TShape
    Left = 587
    Height = 20
    Top = 385
    Width = 20
    Brush.Style = bsClear
    Pen.Color = clYellow
    Pen.Mode = pmNotXor
    Pen.Width = 8
    OnMouseDown = mousew3
    Visible = False
  end
  object BX4: TShape
    Left = 606
    Height = 20
    Top = 385
    Width = 19
    Brush.Style = bsClear
    Pen.Color = clYellow
    Pen.Mode = pmNotXor
    Pen.Width = 8
    OnMouseDown = mousew4
    Visible = False
  end
  object BX5: TShape
    Left = 626
    Height = 20
    Top = 385
    Width = 20
    Brush.Style = bsClear
    Pen.Color = clYellow
    Pen.Mode = pmNotXor
    Pen.Width = 8
    OnMouseDown = mousew5
    Visible = False
  end
  object BX6: TShape
    Left = 646
    Height = 20
    Top = 385
    Width = 20
    Brush.Style = bsClear
    Pen.Color = clYellow
    Pen.Mode = pmNotXor
    Pen.Width = 8
    OnMouseDown = mousew6
    Visible = False
  end
  object BX7: TShape
    Left = 667
    Height = 20
    Top = 385
    Width = 19
    Brush.Style = bsClear
    Pen.Color = clYellow
    Pen.Mode = pmNotXor
    Pen.Width = 8
    OnMouseDown = mousew7
    Visible = False
  end
  object BX8: TShape
    Left = 689
    Height = 20
    Top = 385
    Width = 19
    Brush.Style = bsClear
    Pen.Color = clYellow
    Pen.Mode = pmNotXor
    Pen.Width = 8
    OnMouseDown = mousew8
    Visible = False
  end
  object LabelPIS: TLabel
    Left = 682
    Height = 15
    Top = 447
    Width = 27
    Caption = 'IC ='
    Color = clInactiveCaption
    ParentColor = False
    Transparent = False
  end
  object LabelRefI: TLabel
    Left = 682
    Height = 15
    Top = 466
    Width = 46
    Caption = 'Ref. I ='
    Color = clInactiveCaption
    ParentColor = False
    Transparent = False
  end
  object LabelDI: TLabel
    Left = 682
    Height = 15
    Top = 486
    Width = 27
    Caption = 'DI ='
    Color = clInactiveCaption
    ParentColor = False
    Transparent = False
  end
  object LabelDV: TLabel
    Left = 609
    Height = 15
    Top = 486
    Width = 31
    Caption = 'DV ='
    Color = clInactiveCaption
    ParentColor = False
    Transparent = False
  end
  object LabelRefV: TLabel
    Left = 594
    Height = 15
    Top = 466
    Width = 50
    Caption = 'Ref. V ='
    Color = clInactiveCaption
    ParentColor = False
    Transparent = False
  end
  object LabelPVS: TLabel
    Left = 609
    Height = 15
    Top = 447
    Width = 31
    Caption = 'VC ='
    Color = clInactiveCaption
    ParentColor = False
    Transparent = False
  end
  object nocal: TImage
    Left = 712
    Height = 32
    Top = 385
    Width = 32
    AutoSize = True
    Picture.Data = {
      07544269746D617076020000424D760200000000000076000000280000002000
      0000200000000100040000000000000200000000000000000000100000000000
      0000000000000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00FFFFFFFFF999999999999999FFFFFFFFFFFFFFF9999999999999999999FF
      FFFFFFFFFF999999999999999999999FFFFFFFFF99999999FFFFFFFFF9999999
      9FFFFFFF999999FFFFFFFFFFFFF999999FFFFFF999999FFFFFFFFFFFFFFF9999
      99FFFF99999F9FFFFFFFFFFFFFFFFF99999FFF99999FF9FFFFFFFFFFFFFFFF99
      999FF99999FFFF9FFFFFFFFFFFFFFFF99999F9999FFFFFF9FFFFFFFFFFFFFFFF
      9999F9999FFFFFFF9FFFFFFFFFFFFFFF99999999FF80006F918FFFFF84800000
      69999999F308FF14F96FFFFF3684FFFFF9999999F18FFFF1889FFFF80884FFFF
      F999999984FFFFFFFF1900006F84FFFFF999999984FFFFFFFF849FF18F84FFFF
      F999999984FFFFFFFFF18984FF84FFFFF999999984FFFFFFFFF36F96FF84FFFF
      F9999999F18FFF808FF84849FF84FFFFF9999999F84FFF16FFFF176F9F84FFFF
      F99999999F80006FFFFF808FF984FFFF9999F9999FFFFFFFFFFFFFFFF9FFFFFF
      9999F99999FFFFFFFFFFFFFFFF9FFFF99999FF99999FFFFFFFFFFFFFFFF9FF99
      999FFF99999FFFFFFFFFFFFFFFFF9F99999FFFF999999FFFFFFFFFFFFFFF9999
      99FFFFFF999999FFFFFFFFFFFFF999999FFFFFFF99999999FFFFFFFFF9999999
      9FFFFFFFFF999999999999999999999FFFFFFFFFFFF9999999999999999999FF
      FFFFFFFFFFFFF999999999999999FFFFFFFFFFFFFFFFFFF9999999999FFFFFFF
      FFFF
    }
    Transparent = True
  end
  object Label8: TLabel
    Left = 675
    Height = 15
    Top = 604
    Width = 103
    Caption = 'Command Echo:'
    Color = clMenu
    ParentColor = False
    Transparent = False
    Visible = False
  end
  object Label9: TLabel
    Left = 535
    Height = 15
    Top = 23
    Width = 99
    Caption = 'Mouse Cursor'
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    ParentColor = False
    ParentFont = False
  end
  object LabelIdex: TLabel
    Left = 646
    Height = 15
    Top = 30
    Width = 46
    Caption = 'Fori: ...'
    ParentColor = False
  end
  object LabelS: TLabel
    Left = 646
    Height = 15
    Top = 74
    Width = 17
    Caption = '....'
    ParentColor = False
  end
  object Label18: TLabel
    Left = 771
    Height = 15
    Top = 377
    Width = 31
    Caption = 'VC ='
    ParentColor = False
  end
  object Label19: TLabel
    Left = 845
    Height = 15
    Top = 377
    Width = 47
    Caption = 'IC uA ='
    ParentColor = False
  end
  object Label20: TLabel
    Left = 845
    Height = 15
    Top = 392
    Width = 47
    Caption = 'IB uA ='
    ParentColor = False
  end
  object Label21: TLabel
    Left = 771
    Height = 15
    Top = 392
    Width = 31
    Caption = 'VB ='
    ParentColor = False
  end
  object RunSweep: TButton
    Left = 616
    Height = 30
    Top = 326
    Width = 75
    Caption = 'Run Sweep'
    OnClick = RunSweepClick
    TabOrder = 0
  end
  object UpDownVO: TUpDown
    Left = 15
    Height = 23
    Top = 572
    Width = 30
    Min = -10
    Max = 10
    Orientation = udHorizontal
    Position = 0
    TabOrder = 1
    Wrap = False
    OnClick = UpDownVOClick
  end
  object UpDownIO: TUpDown
    Left = 120
    Height = 23
    Top = 569
    Width = 31
    Min = -10
    Max = 10
    Orientation = udHorizontal
    Position = 0
    TabOrder = 2
    Wrap = False
    OnClick = UpDownIOClick
  end
  object Memo1: TMemo
    Left = 771
    Height = 355
    Top = 8
    Width = 156
    Font.CharSet = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 3
    WordWrap = False
  end
  object CollectorStart: TSpinEdit
    Left = 668
    Height = 20
    Hint = 'Voltage = Integer Value / 100'
    Top = 126
    Width = 52
    Increment = 10
    MaxValue = 1500
    MinValue = -1500
    TabOrder = 4
  end
  object CollectorStep: TSpinEdit
    Left = 668
    Height = 20
    Hint = 'Voltage := Integer Value / 100'
    Top = 148
    Width = 52
    MaxValue = 1000
    MinValue = -1000
    TabOrder = 5
    Value = 10
  end
  object Setvalues: TButton
    Left = 653
    Height = 23
    Top = 193
    Width = 100
    Caption = 'Set Sweep Values'
    OnClick = SetvaluesClick
    TabOrder = 6
  end
  object ReadVoltages: TButton
    Left = 771
    Height = 15
    Hint = 'Stops Sweep and Reads DC Values'
    Top = 407
    Width = 75
    Caption = 'Read Voltages'
    OnClick = ReadVoltagesClick
    TabOrder = 7
  end
  object Edit1: TEdit
    Left = 520
    Height = 22
    Top = 616
    Width = 409
    AutoSize = False
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    ParentFont = False
    TabOrder = 8
    Visible = False
  end
  object CollectorV: TSpinEdit
    Left = 527
    Height = 20
    Hint = 'Voltage = Integer  Value / 100'
    Top = 156
    Width = 60
    MaxValue = 1500
    MinValue = -1500
    TabOrder = 9
  end
  object BaseVolts: TSpinEdit
    Left = 527
    Height = 20
    Hint = 'Voltage = Integer Value / 100'
    Top = 207
    Width = 60
    MaxValue = 1000
    MinValue = -1000
    TabOrder = 10
  end
  object BaseuA: TSpinEdit
    Left = 527
    Height = 20
    Hint = 'Current in uA = Integer Value / 10'
    Top = 259
    Width = 60
    MaxValue = 2000
    MinValue = -2000
    TabOrder = 11
  end
  object SetCollector: TButton
    Left = 527
    Height = 23
    Hint = 'Stops Sweep and sets Collector to DC Value'
    Top = 180
    Width = 102
    Caption = 'Set Collector V/100'
    OnClick = SetCollectorClick
    TabOrder = 12
  end
  object SetBaseV: TButton
    Left = 527
    Height = 23
    Top = 232
    Width = 83
    Caption = 'Set Base V/100'
    OnClick = SetBaseVClick
    TabOrder = 13
  end
  object SetBaseI: TButton
    Left = 527
    Height = 23
    Top = 283
    Width = 90
    Caption = 'Set Base I uA/10'
    OnClick = SetBaseIClick
    TabOrder = 14
  end
  object TraceNumber: TSpinEdit
    Left = 273
    Height = 20
    Top = 587
    Width = 45
    MaxValue = 1024
    MinValue = 1
    OnChange = TraceNumberChange
    TabOrder = 15
    Value = 1
  end
  object SweepStep: TSpinEdit
    Left = 273
    Height = 20
    Top = 561
    Width = 45
    MaxValue = 1024
    MinValue = 1
    OnChange = SweepStepChange
    TabOrder = 16
    Value = 1
  end
  object tubetype: TEdit
    Left = 273
    Height = 20
    Top = 535
    Width = 119
    TabOrder = 17
  end
  object CheckF: TCheckBox
    Left = 697
    Height = 26
    Top = 358
    Width = 26
    TabOrder = 18
  end
  object Avg8: TButton
    Left = 697
    Height = 30
    Top = 326
    Width = 53
    Caption = 'Avg 8'
    OnClick = Avg8Click
    TabOrder = 19
  end
  object buttonmulti: TButton
    Left = 170
    Height = 23
    Top = 332
    Width = 60
    Caption = 'buttonmulti'
    OnClick = buttonmultiClick
    TabOrder = 20
    Visible = False
  end
  object CheckGV: TCheckBox
    Left = 399
    Height = 26
    Top = 609
    Width = 81
    Caption = 'Base uA'
    Color = clInactiveCaption
    OnClick = CheckGVClick
    OnMouseDown = checkgvdown
    ParentColor = False
    TabOrder = 21
  end
  object ButtonRunScript: TButton
    Left = 697
    Height = 23
    Top = 15
    Width = 60
    Caption = 'Run Script'
    OnClick = ButtonRunScriptClick
    TabOrder = 22
  end
  object PlotType: TRadioGroup
    Left = 402
    Height = 68
    Top = 535
    Width = 59
    AutoFill = True
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.TopBottomSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 1
    ClientHeight = 64
    ClientWidth = 55
    Color = clInactiveCaption
    ItemIndex = 0
    Items.Strings = (
      '.'
      '.'
    )
    OnClick = Onplottype
    ParentColor = False
    TabOrder = 23
  end
  object ReDraw: TButton
    Left = 155
    Height = 23
    Top = 538
    Width = 45
    Caption = 'ReDraw'
    OnClick = ReDrawClick
    TabOrder = 24
  end
  object SamplePoint: TSpinEdit
    Left = 535
    Height = 20
    Top = 458
    Width = 52
    MaxValue = 513
    MinValue = -1
    OnChange = SamplePointChange
    TabOrder = 26
  end
  object CheckBox1: TCheckBox
    Left = 623
    Height = 26
    Top = 362
    Width = 26
    OnClick = Live
    TabOrder = 27
  end
  object CheckCursor: TCheckBox
    Left = 535
    Height = 26
    Top = 483
    Width = 26
    Color = clInactiveCaption
    OnClick = Oncheckcursor
    ParentColor = False
    TabOrder = 28
  end
  object Button11: TButton
    Left = 535
    Height = 23
    Top = 503
    Width = 52
    Caption = 'Mark'
    OnClick = Button11Click
    TabOrder = 29
  end
  object CheckBaseV: TCheckBox
    Left = 399
    Height = 26
    Top = 609
    Width = 73
    Caption = 'Base V'
    Color = clInactiveCaption
    OnClick = CheckBaseVClick
    OnMouseDown = checkbasedown
    ParentColor = False
    TabOrder = 30
  end
  object SpinMsteps: TSpinEdit
    Left = 273
    Height = 20
    Top = 613
    Width = 45
    MaxValue = 10
    MinValue = 1
    OnChange = SpinMstepsChange
    TabOrder = 31
    Value = 1
  end
  object BitBtn2: TBitBtn
    Left = 66
    Height = 25
    Top = 535
    Width = 25
    Glyph.Data = {
      06020000424D0602000000000000760000002800000019000000190000000100
      0400000000009001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      0888888888888000000082888888888808888888888880000000882888888888
      0888888888888000000088828888888808888888888880000000888828888888
      0888888888888000000088888288888808888888888880000000888888288888
      0888888888888000000088888882888808888888888880000000888888882888
      0888888888888000000088888888828808888888888880000000888888888828
      0888888888888000000088888888888208888888888880000000000000000000
      2000000000000000000088888888888802888888888880000000888888888888
      0828888888888000000088888888888808828888888880000000888888888888
      0888288888888000000088888888888808888288888880000000888888888888
      0888882888888000000088888888888808888882888880000000888888888888
      0888888828888000000088888888888808888888828880000000888888888888
      0888888888288000000088888888888808888888888280000000888888888888
      08888888888880000000
    }
    OnClick = BitBtn2Click
    TabOrder = 32
  end
  object BitBtn3: TBitBtn
    Left = 103
    Height = 25
    Top = 535
    Width = 25
    Glyph.Data = {
      06020000424D0602000000000000760000002800000019000000190000000100
      0400000000009001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888880000000088888888888888888888888800000000882222888888
      8888888888880000000088888822222222222888888800000000888888888888
      8888822888880000000088888888888888888822888800000000888888888888
      8888888288880000000088888888888888888888288800000000888888888888
      8888888828880000000088228888888888888888288800000000888822222222
      2888888822880000000088888888888822222288828800000000888888888888
      8888882282880000000088888888888888888882228800000000888888888888
      8888888822880000000088888888888888888888222800000000888888888888
      8888888882280000000088888888888888888888822800000000822222888888
      8888888882280000000088888222222222228888882800000000888888888888
      8888222228280000000088888888888888888888822800000000888888888888
      8888888888220000000088888888888888888888888200000000000000000000
      00000000000000000000
    }
    OnClick = BitBtn3Click
    TabOrder = 33
  end
  object BitBtn1: TBitBtn
    Left = 30
    Height = 25
    Top = 535
    Width = 24
    Glyph.Data = {
      06020000424D0602000000000000760000002800000019000000190000000100
      0400000000009001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888888000000080000000000000000000000080000000802888888888
      8888888888888000000080222222222222222222228880000000802888888888
      8888888888888000000080288888888888888888888880000000802888888888
      8888888888888000000080228888888888888888888880000000802288888888
      8888888888888000000080822888888888888888888880000000808222222222
      2222222222288000000080828888888888888888888880000000808828888888
      8888888888888000000080882888888888888888888880000000808822888888
      8888888888888000000080888228888888888888888880000000808888288888
      8888888888888000000080888822888888888888888880000000808888882222
      2222222228888000000080888888888888888888888880000000808888888888
      8888888888888000000080888888888888888888888880000000808888888888
      8888888888888000000080888888888888888888888880000000888888888888
      88888888888880000000
    }
    OnClick = BitBtn1Click
    TabOrder = 34
  end
  object SpinPC: TSpinEdit
    Left = 550
    Height = 20
    Top = 536
    Width = 45
    MaxValue = 1024
    MinValue = 1
    OnChange = SpinPCChange
    TabOrder = 35
    Value = 1
  end
  object SpinNC: TSpinEdit
    Left = 550
    Height = 20
    Top = 566
    Width = 45
    MaxValue = 1024
    MinValue = 1
    OnChange = SpinNCChange
    TabOrder = 36
    Value = 1
  end
  object RadioCompare: TRadioGroup
    Left = 601
    Height = 60
    Top = 534
    Width = 68
    AutoFill = True
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.TopBottomSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 1
    ClientHeight = 56
    ClientWidth = 64
    Color = clInactiveCaption
    ItemIndex = 0
    Items.Strings = (
      '.'
      '.'
      '.'
    )
    OnClick = RadioCompareClick
    ParentColor = False
    TabOrder = 37
  end
  object Button4: TButton
    Left = 675
    Height = 15
    Hint = 'Swaps Part and Compare Traces'
    Top = 540
    Width = 45
    Caption = 'Swap'
    OnClick = Button4Click
    TabOrder = 38
  end
  object CheckAuto: TCheckBox
    Left = 325
    Height = 26
    Top = 574
    Width = 26
    Color = clInactiveCaption
    ParentColor = False
    TabOrder = 39
  end
  object RadioVG: TRadioGroup
    Left = 638
    Height = 82
    Top = 230
    Width = 53
    AutoFill = True
    Caption = 'Vgain'
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.TopBottomSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 1
    ClientHeight = 56
    ClientWidth = 49
    Enabled = False
    Font.Color = clGrayText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    ItemIndex = 0
    Items.Strings = (
      'x1'
      'x4.5'
    )
    ParentFont = False
    TabOrder = 40
  end
  object RadioSR: TRadioGroup
    Left = 697
    Height = 82
    Top = 230
    Width = 68
    AutoFill = True
    Caption = 'Sense R'
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.TopBottomSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 1
    ClientHeight = 56
    ClientWidth = 64
    Enabled = False
    Font.Color = clGrayText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    ItemIndex = 1
    Items.Strings = (
      '500'
      '1.5K'
      '15K'
      '100K'
      '1M /oo'
    )
    ParentFont = False
    TabOrder = 41
  end
  object RadioSweep: TRadioGroup
    Left = 527
    Height = 52
    Top = 326
    Width = 85
    AutoFill = True
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.TopBottomSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 1
    ClientHeight = 48
    ClientWidth = 81
    ItemIndex = 0
    Items.Strings = (
      '.'
      '.'
    )
    OnClick = RadioSweepClick
    TabOrder = 42
  end
  object ListBox1: TListBox
    Left = 771
    Height = 98
    Top = 442
    Width = 141
    Items.Strings = (
      '0: Resistance'
      '1: Beta'
      '2: Transconductance'
      '3: Early Voltage'
      '4: Capacitance'
      '5: V-Max'
      '6: V-Min'
      '7: I-Max'
      '8: I-Min'
      '9: Temperature'
      '10: Zmag'
      '11: Phase'
      '12: Zreal'
      '13: Zimag'
      '14: Series Inductance'
      '15: Ymag'
      '16: Yreal'
      '17: Yimag'
      '18: Parallel Capacitance'
      '19: Parallel Resistance'
    )
    ItemHeight = 19
    OnClick = ListBox1Click
    ScrollWidth = 165
    TabOrder = 43
  end
  object ButtonRunC: TButton
    Left = 550
    Height = 23
    Top = 111
    Width = 52
    Caption = 'Run'
    OnClick = ButtonRunCClick
    TabOrder = 44
    Visible = False
  end
  object Memo2: TMemo
    Left = 296
    Height = 119
    Top = 16
    Width = 186
    Lines.Strings = (
      ''
    )
    TabOrder = 25
    Visible = False
  end
  object RadioCal: TRadioGroup
    Left = 527
    Height = 97
    Top = 10
    Width = 97
    AutoFill = True
    Caption = 'Cal Mode'
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.TopBottomSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 2
    ClientHeight = 68
    ClientWidth = 93
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'MVZ'
      'MVC'
      'MIZ'
      'MIC'
      'CVZ'
      'CVC'
      'BVZ'
      'BVC'
      'BIZ'
      'BIC'
    )
    OnClick = RadioCalClick
    TabOrder = 45
    Visible = False
  end
  object liveupdate: TCheckBox
    Left = 778
    Height = 26
    Top = 557
    Width = 26
    Color = clInactiveCaption
    ParentColor = False
    TabOrder = 46
  end
  object PanelR: TPanel
    Left = 340
    Height = 156
    Top = 142
    Width = 134
    ClientHeight = 156
    ClientWidth = 134
    TabOrder = 47
    Visible = False
    object Label10: TLabel
      Left = 30
      Height = 15
      Top = 7
      Width = 25
      Caption = '500'
      ParentColor = False
    end
    object Label11: TLabel
      Left = 22
      Height = 15
      Top = 30
      Width = 33
      Caption = '1500'
      ParentColor = False
    end
    object Label16: TLabel
      Left = 30
      Height = 15
      Top = 52
      Width = 26
      Caption = '15K'
      ParentColor = False
    end
    object Label17: TLabel
      Left = 22
      Height = 15
      Top = 74
      Width = 34
      Caption = '100K'
      ParentColor = False
    end
    object Label22: TLabel
      Left = 22
      Height = 15
      Top = 96
      Width = 36
      Caption = '1Meg'
      ParentColor = False
    end
    object SetR: TButton
      Left = 37
      Height = 23
      Top = 126
      Width = 67
      Caption = 'Set R Values'
      OnClick = SetRClick
      TabOrder = 0
    end
    object EditR0: TEdit
      Left = 52
      Height = 20
      Top = 7
      Width = 74
      TabOrder = 1
    end
    object EditR1: TEdit
      Left = 52
      Height = 20
      Top = 30
      Width = 74
      TabOrder = 2
    end
    object EditR2: TEdit
      Left = 52
      Height = 20
      Top = 52
      Width = 74
      TabOrder = 3
    end
    object EditR3: TEdit
      Left = 52
      Height = 20
      Top = 74
      Width = 74
      TabOrder = 4
    end
    object EditR4: TEdit
      Left = 52
      Height = 20
      Top = 96
      Width = 74
      TabOrder = 5
    end
  end
  object EditHid: TEdit
    Left = 734
    Height = 20
    Top = 525
    Width = 16
    TabOrder = 48
    Visible = False
  end
  object SweepTypeText: TStaticText
    Left = 535
    Height = 14
    Top = 320
    Width = 54
    Caption = 'SweepType'
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    OnClick = Onsweeptextclick
    ParentFont = False
    TabOrder = 49
  end
  object CompareText: TStaticText
    Left = 609
    Height = 16
    Top = 525
    Width = 47
    Caption = 'Compare'
    Color = clInactiveCaption
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    OnClick = CompareTextClick
    ParentFont = False
    ParentColor = False
    TabOrder = 50
  end
  object ACSweepText: TStaticText
    Left = 551
    Height = 16
    Top = 340
    Width = 57
    Caption = 'AC Sweep'
    OnClick = ACSweepTextClick
    TabOrder = 51
  end
  object SlowSweepText: TStaticText
    Left = 550
    Height = 16
    Top = 359
    Width = 67
    Caption = 'Slow Sweep'
    OnClick = SlowSweepTextClick
    TabOrder = 52
  end
  object OffText: TStaticText
    Left = 626
    Height = 16
    Top = 548
    Width = 20
    Caption = 'Off'
    Color = clInactiveCaption
    OnClick = OffTextClick
    ParentColor = False
    TabOrder = 53
  end
  object ToTraceText: TStaticText
    Left = 626
    Height = 16
    Top = 562
    Width = 44
    Caption = 'to Trace'
    Color = clInactiveCaption
    OnClick = ToTraceTextClick
    ParentColor = False
    TabOrder = 54
  end
  object toPartText: TStaticText
    Left = 626
    Height = 16
    Top = 577
    Width = 35
    Caption = 'to Part'
    Color = clInactiveCaption
    OnClick = toPartTextClick
    ParentColor = False
    TabOrder = 55
  end
  object XYText: TStaticText
    Left = 426
    Height = 16
    Top = 554
    Width = 32
    Caption = 'X-Y   '
    Color = clInactiveCaption
    OnClick = XYTextClick
    ParentColor = False
    TabOrder = 56
  end
  object XTText: TStaticText
    Left = 426
    Height = 16
    Top = 580
    Width = 30
    Caption = 'X-t    '
    Color = clInactiveCaption
    OnClick = XTTextClick
    ParentColor = False
    TabOrder = 57
  end
  object PlotTypeText: TStaticText
    Left = 406
    Height = 14
    Top = 534
    Width = 46
    Caption = 'Plot Type'
    Color = clInactiveCaption
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    OnClick = PlotTypeTextClick
    ParentFont = False
    ParentColor = False
    TabOrder = 58
  end
  object UpdateWithSweepText: TStaticText
    Left = 793
    Height = 16
    Top = 559
    Width = 108
    Caption = 'Update (With Sweep)'
    Color = clInactiveCaption
    OnClick = UpdateWithSweepTextClick
    ParentColor = False
    TabOrder = 59
  end
  object AutoIncText: TStaticText
    Left = 340
    Height = 16
    Top = 576
    Width = 44
    Caption = 'Auto Inc'
    Color = clInactiveCaption
    OnClick = AutoIncTextClick
    ParentColor = False
    TabOrder = 61
  end
  object CursorText: TStaticText
    Left = 550
    Height = 16
    Top = 485
    Width = 37
    Caption = 'Cursor'
    Color = clInactiveCaption
    OnClick = CursorTextClick
    ParentColor = False
    TabOrder = 63
  end
  object LiveText: TStaticText
    Left = 640
    Height = 16
    Top = 363
    Width = 39
    Caption = ' Live    '
    OnClick = LiveTextClick
    TabOrder = 65
  end
  object FilterOnText: TStaticText
    Left = 712
    Height = 16
    Top = 362
    Width = 44
    Caption = 'Filter On'
    OnClick = FilterOnTextClick
    TabOrder = 60
  end
  object ZeroLeads: TButton
    Left = 889
    Height = 16
    Top = 543
    Width = 31
    Caption = 'Zero'
    OnClick = ZeroLeadsClick
    TabOrder = 62
  end
  object ButtonExample: TButton
    Left = 369
    Height = 23
    Top = 406
    Width = 75
    Caption = 'ButtonExample'
    OnClick = ButtonExampleClick
    TabOrder = 64
    Visible = False
  end
  object UpDown1: TUpDown
    Left = 15
    Height = 25
    Top = 605
    Width = 25
    Min = 0
    Position = 0
    TabOrder = 66
    Wrap = False
  end
  object UpDown2: TUpDown
    Left = 120
    Height = 31
    Top = 599
    Width = 22
    Min = 0
    Position = 0
    TabOrder = 67
    Wrap = False
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer1Timer
    left = 272
    top = 264
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Curve Data Files|*.txt|Script File|*.scr|Bit Map|*.bmp'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    left = 304
    top = 264
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.*.txt'
    Filter = 'Curve Data Files|*.txt|Script Files|*.scr|Help File|*.html'
    left = 272
    top = 232
  end
  object MainMenu1: TMainMenu
    left = 304
    top = 233
    object mnuFile: TMenuItem
      Caption = 'Data File'
      RadioItem = True
      object save21: TMenuItem
        Caption = 'Save'
        OnClick = mnusave21click
      end
      object Load1: TMenuItem
        Caption = 'Load'
        OnClick = Load1Click
      end
      object LoadCompare1: TMenuItem
        Caption = 'Load Compare'
        OnClick = LoadCompare1Click
      end
      object Export1: TMenuItem
        Caption = 'Export'
        object Trace1: TMenuItem
          Caption = 'Trace'
          OnClick = Trace1Click
        end
        object All1: TMenuItem
          Caption = 'All'
          OnClick = All1Click
        end
      end
      object mnuExit: TMenuItem
        Caption = 'Exit'
        OnClick = mnuExitClick
      end
    end
    object Copy1: TMenuItem
      Caption = 'Image'
      object Copy2: TMenuItem
        Caption = 'Copy Plot to Clipboard'
        OnClick = Copy2Click
      end
      object PrintPlot1: TMenuItem
        Caption = 'Print Plot'
        OnClick = PrintPlot1Click
      end
      object SavetoFile1: TMenuItem
        Caption = 'Save to File'
        OnClick = SavetoFile1Click
      end
      object Labels1: TMenuItem
        Caption = 'Labels Show/Hide'
        object VIperDiv1: TMenuItem
          Caption = '0: V-I per Div.'
          Checked = True
          GroupIndex = 10
          RadioItem = True
          OnClick = VIperDiv1Click
        end
        object Offsets1: TMenuItem
          Caption = '1: Offsets'
          GroupIndex = 11
          RadioItem = True
          OnClick = Offsets1Click
        end
        object SN1: TMenuItem
          Caption = '2: S/N'
          GroupIndex = 12
          RadioItem = True
          OnClick = SN1Click
        end
        object StepTrace1: TMenuItem
          Caption = '3: Trace, Step'
          GroupIndex = 13
          RadioItem = True
          OnClick = StepTrace1Click
        end
        object CompareTrace1: TMenuItem
          Caption = '4: Compare Trace'
          GroupIndex = 14
          RadioItem = True
          OnClick = CompareTrace1Click
        end
        object CursorVI1: TMenuItem
          Caption = '5: Cursor V-I'
          GroupIndex = 15
          RadioItem = True
          OnClick = CursorVI1Click
        end
        object Value2: TMenuItem
          Caption = '6: Value'
          GroupIndex = 16
          RadioItem = True
          OnClick = Value2Click
        end
      end
      object BaseLabelPosition1: TMenuItem
        Caption = 'Base Label Position'
        object N01: TMenuItem
          Caption = '64'
          GroupIndex = 41
          RadioItem = True
          OnClick = N01Click
        end
        object N1281: TMenuItem
          Caption = '128'
          Checked = True
          GroupIndex = 41
          RadioItem = True
          OnClick = N1281Click
        end
        object N2561: TMenuItem
          Caption = '255'
          GroupIndex = 41
          RadioItem = True
          OnClick = N2561Click
        end
      end
    end
    object ComPort1: TMenuItem
      Caption = 'Com Port'
      GroupIndex = 1
      RadioItem = True
      object Com11: TMenuItem
        Caption = 'ttyUSB0'
        GroupIndex = 4
        RadioItem = True
        OnClick = Com11Click
      end
      object Com21: TMenuItem
        Caption = 'ttyUSB1'
        GroupIndex = 4
        RadioItem = True
        OnClick = Com21Click
      end
      object Com31: TMenuItem
        Caption = 'ttyUSB2'
        GroupIndex = 4
        RadioItem = True
        OnClick = Com31Click
      end
      object Com41: TMenuItem
        Caption = 'ttyUSB3'
        GroupIndex = 4
        RadioItem = True
        OnClick = Com41Click
      end
      object Com51: TMenuItem
        Caption = 'ttyUSB4'
        GroupIndex = 4
        RadioItem = True
        OnClick = Com51Click
      end
      object Com61: TMenuItem
        Caption = 'ttyUSB5'
        GroupIndex = 4
        RadioItem = True
        OnClick = Com61Click
      end
      object Com71: TMenuItem
        Caption = 'ttyUSB6'
        GroupIndex = 4
        RadioItem = True
        OnClick = Com71Click
      end
      object Com81: TMenuItem
        Caption = 'ttyUSB7'
        GroupIndex = 4
        RadioItem = True
        OnClick = Com81Click
      end
      object Com91: TMenuItem
        Caption = 'ttyUSB8'
        GroupIndex = 4
        RadioItem = True
        OnClick = Com91Click
      end
      object Com101: TMenuItem
        Caption = 'ttyUSB9'
        GroupIndex = 4
        RadioItem = True
        OnClick = Com101Click
      end
      object Com111: TMenuItem
        Caption = 'ttyS0'
        GroupIndex = 4
        RadioItem = True
        OnClick = Com111Click
      end
      object Com121: TMenuItem
        Caption = 'ttyS1'
        GroupIndex = 4
        RadioItem = True
        OnClick = Com121Click
      end
      object Com131: TMenuItem
        Caption = 'ttyS2'
        GroupIndex = 4
        RadioItem = True
        OnClick = Com131Click
      end
      object Com141: TMenuItem
        Caption = 'ttyS3'
        GroupIndex = 4
        RadioItem = True
        OnClick = Com141Click
      end
      object Com151: TMenuItem
        Caption = 'ttyS4'
        GroupIndex = 4
        OnClick = Com151Click
      end
      object Com161: TMenuItem
        Caption = 'ttyS5'
        GroupIndex = 4
        OnClick = Com161Click
      end
      object Com171: TMenuItem
        Caption = 'ttyS6'
        GroupIndex = 4
        OnClick = Com171Click
      end
      object Com181: TMenuItem
        Caption = 'ttyS7'
        GroupIndex = 4
        OnClick = Com181Click
      end
      object Com191: TMenuItem
        Caption = 'ttyS8'
        GroupIndex = 4
        OnClick = Com191Click
      end
      object Com201: TMenuItem
        Caption = 'ttyS9'
        GroupIndex = 4
        OnClick = Com201Click
      end
    end
    object Clear1: TMenuItem
      Caption = 'Clear'
      GroupIndex = 1
      RadioItem = True
      object Yes1: TMenuItem
        Caption = 'All Traces'
        OnClick = Yes1Click
      end
      object CurrentTrace1: TMenuItem
        Caption = 'Current Trace'
        OnClick = CurrentTrace1Click
      end
    end
    object Calibrate1: TMenuItem
      Caption = 'Calibration'
      GroupIndex = 1
      RadioItem = True
      object Save1: TMenuItem
        Caption = 'Save Cal'
        object yes2: TMenuItem
          Caption = 'yes'
          OnClick = yes2Click
        end
      end
      object Load2: TMenuItem
        Caption = 'Load Cal'
        OnClick = Load2Click
      end
      object ShowCalMenu1: TMenuItem
        Caption = 'Show Cal Menu'
        GroupIndex = 62
        RadioItem = True
        OnClick = ShowCalMenu1Click
      end
      object ShowResistorMenu1: TMenuItem
        Caption = 'Show Resistor Menu'
        GroupIndex = 63
        RadioItem = True
        OnClick = ShowResistorMenu1Click
      end
    end
    object MultiPlot1: TMenuItem
      Caption = 'Multi Plot'
      GroupIndex = 1
      RadioItem = True
      OnClick = MultiPlot1Click
    end
    object Sound1: TMenuItem
      Caption = 'Diagnostics'
      GroupIndex = 1
      RadioItem = True
      object On1: TMenuItem
        Caption = 'Echo On'
        RadioItem = True
        OnClick = On1Click
      end
      object AutoUpdateOff1: TMenuItem
        Caption = 'Auto Update Off'
        GroupIndex = 1
        RadioItem = True
        OnClick = AutoUpdateOff1Click
      end
    end
    object Rate1: TMenuItem
      Caption = 'Rate'
      GroupIndex = 1
      object N05X1: TMenuItem
        Caption = '5Hz 2.5Hz'
        GroupIndex = 5
        RadioItem = True
        OnClick = N05X1Click
      end
      object N10X1: TMenuItem
        Caption = '10Hz 5Hz'
        Checked = True
        GroupIndex = 5
        RadioItem = True
        OnClick = N10X1Click
      end
      object N20X1: TMenuItem
        Caption = 'Max'
        GroupIndex = 5
        RadioItem = True
        OnClick = N20X1Click
      end
    end
    object Sount1: TMenuItem
      Caption = 'Sound'
      GroupIndex = 1
      object On2: TMenuItem
        Caption = 'On'
        GroupIndex = 6
        RadioItem = True
        OnClick = On2Click
      end
    end
    object S1: TMenuItem
      Caption = 'Script File'
      GroupIndex = 1
      object Save2: TMenuItem
        Caption = 'Save'
        OnClick = Save2Click
      end
      object Load3: TMenuItem
        Caption = 'Load'
        OnClick = Load3Click
      end
      object Append1: TMenuItem
        Caption = 'Append'
        OnClick = Append1Click
      end
      object SetUp1: TMenuItem
        Caption = 'Make SetUp'
        object Yes3: TMenuItem
          Caption = 'Yes'
          OnClick = Yes3Click
        end
      end
      object Clear3: TMenuItem
        Caption = 'Clear'
        object Yes4: TMenuItem
          Caption = 'Yes'
          OnClick = Yes4Click
        end
      end
    end
    object ScriptItems1: TMenuItem
      Caption = 'Script Item'
      GroupIndex = 1
      object Acquire1: TMenuItem
        Caption = 'Acquire'
        object runsweep1: TMenuItem
          Caption = 'runsweep'
          OnClick = runsweep1Click
        end
        object avg8sweeps1: TMenuItem
          Caption = 'avg8'
          OnClick = avg8sweeps1Click
        end
        object readvoltages1: TMenuItem
          Caption = 'readvoltages'
          OnClick = readvoltages1Click
        end
        object filter01: TMenuItem
          Caption = 'filter 0'
          OnClick = filter01Click
        end
        object live01: TMenuItem
          Caption = 'live 0'
          OnClick = live01Click
        end
        object clear2: TMenuItem
          Caption = 'clear'
          OnClick = clear2Click
        end
        object runbasestep1: TMenuItem
          Caption = 'runbasei+ 20'
          OnClick = runbasestep1Click
        end
        object runbasevstep201: TMenuItem
          Caption = 'runbasev+ 20'
          OnClick = runbasevstep201Click
        end
      end
      object Loops1: TMenuItem
        Caption = 'Control'
        object for101: TMenuItem
          Caption = 'for 10'
          OnClick = for101Click
        end
        object next1: TMenuItem
          Caption = 'next'
          OnClick = next1Click
        end
        object fori101: TMenuItem
          Caption = 'fori 10'
          OnClick = fori101Click
        end
        object nexti1: TMenuItem
          Caption = 'nexti'
          OnClick = nexti1Click
        end
        object loop1: TMenuItem
          Caption = 'loop'
          OnClick = loop1Click
        end
        object end1: TMenuItem
          Caption = 'end'
          OnClick = end1Click
        end
        object wait51: TMenuItem
          Caption = 'wait 5'
          OnClick = wait51Click
        end
        object pause1: TMenuItem
          Caption = 'pause'
          OnClick = pause1Click
        end
        object stop1: TMenuItem
          Caption = 'stop'
          OnClick = stop1Click
        end
      end
      object Cursor1: TMenuItem
        Caption = 'Cursor'
        object samplepoint01: TMenuItem
          Caption = 'samplepoint 0'
          OnClick = samplepoint01Click
        end
        object cursor01: TMenuItem
          Caption = 'cursor 0'
          OnClick = cursor01Click
        end
        object mark1: TMenuItem
          Caption = 'mark'
          OnClick = mark1Click
        end
        object Compare01: TMenuItem
          Caption = 'compare 0'
          OnClick = Compare01Click
        end
        object comparestep1: TMenuItem
          Caption = 'comparestep 1'
          OnClick = comparestep1Click
        end
        object comparetrace11: TMenuItem
          Caption = 'comparetrace 1'
          OnClick = comparetrace11Click
        end
        object value1: TMenuItem
          Caption = 'value 0'
          OnClick = value1Click
        end
        object update01: TMenuItem
          Caption = 'update 0'
          OnClick = update01Click
        end
        object show01: TMenuItem
          Caption = 'show 0'
          OnClick = show01Click
        end
        object hide01: TMenuItem
          Caption = 'hide 0'
          OnClick = hide01Click
        end
      end
      object Display1: TMenuItem
        Caption = 'Display'
        object vperdiv1: TMenuItem
          Caption = 'vperdiv 0'
          OnClick = vperdiv1Click
        end
        object iperdiv01: TMenuItem
          Caption = 'iperdiv 0'
          OnClick = iperdiv01Click
        end
        object voffset01: TMenuItem
          Caption = 'voffset 0'
          OnClick = voffset01Click
        end
        object ioffset01: TMenuItem
          Caption = 'ioffset 0'
          OnClick = ioffset01Click
        end
        object sweepstep11: TMenuItem
          Caption = 'sweepstep 1'
          OnClick = sweepstep11Click
        end
        object incsweepstep1: TMenuItem
          Caption = 'incsweepstep'
          OnClick = incsweepstep1Click
        end
        object autoinc01: TMenuItem
          Caption = 'autoinc 0'
          OnClick = autoinc01Click
        end
        object traceno11: TMenuItem
          Caption = 'traceno 1'
          OnClick = traceno11Click
        end
        object inctraceno1: TMenuItem
          Caption = 'inctraceno'
          OnClick = inctraceno1Click
        end
        object notodisp11: TMenuItem
          Caption = 'notodisp 1'
          OnClick = notodisp11Click
        end
        object plottype01: TMenuItem
          Caption = 'plottype 0'
          OnClick = plottype01Click
        end
        object baseuav1: TMenuItem
          Caption = 'baseuav 0'
          OnClick = baseuav1Click
        end
        object baseat1: TMenuItem
          Caption = 'baseat 255'
          OnClick = baseat1Click
        end
      end
      object Set1: TMenuItem
        Caption = 'Set'
        object setsweepvalues1: TMenuItem
          Caption = 'setsweepvalues'
          OnClick = setsweepvalues1Click
        end
        object minplate01: TMenuItem
          Caption = 'startcollector 0'
          OnClick = minplate01Click
        end
        object minscreen01: TMenuItem
          Caption = 'stepcollector 0'
          OnClick = minscreen01Click
        end
        object setplate4001: TMenuItem
          Caption = 'setcolletor 400'
          OnClick = setplate4001Click
        end
        object setscreen4001: TMenuItem
          Caption = 'setbasev 400'
          OnClick = setscreen4001Click
        end
        object setgrid101: TMenuItem
          Caption = 'setbasei 10'
          OnClick = setgrid101Click
        end
        object incmaxgrid101: TMenuItem
          Caption = 'addbasei 10'
          OnClick = incmaxgrid101Click
        end
        object decmaxgrid101: TMenuItem
          Caption = 'addbasev -10'
          OnClick = decmaxgrid101Click
        end
        object addcollv101: TMenuItem
          Caption = 'addcollv 10'
          OnClick = addcollv101Click
        end
      end
      object Waveform1: TMenuItem
        Caption = 'Waveform'
        object wave01: TMenuItem
          Caption = 'wave 0'
          OnClick = wave01Click
        end
        object sweeptype01: TMenuItem
          Caption = 'sweeptype 0'
          OnClick = sweeptype01Click
        end
        object random1: TMenuItem
          Caption = 'random'
          OnClick = random1Click
        end
        object customwave1: TMenuItem
          Caption = 'custom 8192'
          OnClick = customwave1Click
        end
        object sin16x1: TMenuItem
          Caption = 'sin16x'
          OnClick = sin16x1Click
        end
      end
      object Comment1: TMenuItem
        Caption = 'File'
        object namescript11: TMenuItem
          Caption = 'name file1'
          OnClick = namescript11Click
        end
        object newtimestamp01: TMenuItem
          Caption = 'open n s t'
          OnClick = newtimestamp01Click
        end
        object storeread1: TMenuItem
          Caption = 'storeread'
          OnClick = storeread1Click
        end
        object storecursor1: TMenuItem
          Caption = 'storecursor'
          OnClick = storecursor1Click
        end
        object storevalue1: TMenuItem
          Caption = 'storevalue'
          OnClick = storevalue1Click
        end
        object storetrace1: TMenuItem
          Caption = 'storetrace'
          OnClick = storetrace1Click
        end
        object storeremcomment1: TMenuItem
          Caption = 'storerem comment'
          OnClick = storeremcomment1Click
        end
        object savefilenst1: TMenuItem
          Caption = 'savefile n s t'
          OnClick = savefilenst1Click
        end
        object storeimage1: TMenuItem
          Caption = 'saveimage n s t'
          OnClick = storeimage1Click
        end
        object loadfilefilename1: TMenuItem
          Caption = 'loadfile filename'
          OnClick = loadfilefilename1Click
        end
        object loadimageimagename1: TMenuItem
          Caption = 'loadimage imagename'
          OnClick = loadimageimagename1Click
        end
      end
      object Remark1: TMenuItem
        Caption = 'Remark'
        object remcomment1: TMenuItem
          Caption = 'rem comment'
          OnClick = remcomment1Click
        end
        object popupcomment1: TMenuItem
          Caption = 'popup comment'
          OnClick = popupcomment1Click
        end
      end
      object Plot1: TMenuItem
        Caption = 'Special Plot'
        object resetplot1: TMenuItem
          Caption = 'plotreset'
          OnClick = resetplot1Click
        end
        object plotbvic1: TMenuItem
          Caption = 'plotbvic'
          OnClick = plotbvic1Click
        end
        object plotcvib1: TMenuItem
          Caption = 'plotcvib'
          OnClick = plotcvib1Click
        end
        object plotcvic1: TMenuItem
          Caption = 'plotcvic'
          OnClick = plotcvic1Click
        end
        object plotbvcv1: TMenuItem
          Caption = 'plotbvcv'
          OnClick = plotbvcv1Click
        end
      end
    end
    object Reset1: TMenuItem
      Caption = 'Script Control'
      GroupIndex = 1
      object Pause2: TMenuItem
        Caption = 'Pause'
        GroupIndex = 31
        RadioItem = True
        OnClick = Pause2Click
      end
      object Stop2: TMenuItem
        Caption = 'Stop'
        GroupIndex = 31
        OnClick = Stop2Click
      end
      object SingleStep1: TMenuItem
        Caption = 'Single Step'
        GroupIndex = 44
        RadioItem = True
        OnClick = SingleStep1Click
      end
      object StepTime1: TMenuItem
        Caption = 'Step Time'
        GroupIndex = 44
        object N001sperstep1: TMenuItem
          Caption = '0.01s per step'
          Checked = True
          GroupIndex = 34
          RadioItem = True
          OnClick = N001sperstep1Click
        end
        object N01secperstep1: TMenuItem
          Caption = '0.1sec per step'
          GroupIndex = 34
          RadioItem = True
          OnClick = N01secperstep1Click
        end
        object N1secperstep1: TMenuItem
          Caption = '1sec perstep'
          GroupIndex = 34
          RadioItem = True
          OnClick = N1secperstep1Click
        end
      end
      object ResetRunSweep1: TMenuItem
        Caption = 'Reset Run Sweep'
        GroupIndex = 44
        OnClick = ResetRunSweep1Click
      end
    end
    object HTMLHelp1: TMenuItem
      Caption = 'HTML Help'
      GroupIndex = 1
      OnClick = HTMLHelp1Click
    end
    object About1: TMenuItem
      Caption = 'About'
      GroupIndex = 1
      OnClick = About1Click
    end
  end
  object tmrchkstatus: TTimer
    Enabled = False
    Interval = 2
    OnTimer = tmrchkstatusTimer
    left = 448
    top = 336
  end
  object Timer5: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer5Timer
    left = 736
    top = 64
  end
  object Timer6: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer6Timer
    left = 272
    top = 296
  end
  object Timer7: TTimer
    Enabled = False
    Interval = 35
    OnTimer = Timer7Timer
    left = 448
    top = 368
  end
  object PrintDialog1: TPrintDialog
    left = 304
    top = 296
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    left = 304
    top = 328
  end
end
