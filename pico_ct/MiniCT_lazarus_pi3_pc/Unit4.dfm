object FormAbout: TFormAbout
  Left = 342
  Height = 304
  Top = 127
  Width = 476
  Caption = 'About MiniCT'
  ClientHeight = 304
  ClientWidth = 476
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  LCLVersion = '1.0.8.0'
  object Memo1: TMemo
    Left = 8
    Height = 265
    Top = 0
    Width = 449
    Lines.Strings = (
      'MiniCT'
      ''
      'Copyright 2012 Veikko Kanto'
      ''
      '   Licensed under the Apache License, Version 2.0 (the "License");'
      '   you may not use this file except in compliance with the License.'
      '   You may obtain a copy of the License at'
      ''
      '    http://www.apache.org/licenses/LICENSE-2.0'
      ''
      '   Unless required by applicable law or agreed to in writing, software'
      '   distributed under the License is distributed on an "AS IS" BASIS,'
      '   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.'
      '   See the License for the specific language governing permissions and'
      '   limitations under the License.'
    )
    ReadOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 184
    Height = 25
    Top = 216
    Width = 65
    Caption = 'OK'
    OnClick = Button1Click
    TabOrder = 1
  end
end