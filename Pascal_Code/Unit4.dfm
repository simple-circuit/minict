object FormAbout: TFormAbout
  Left = 264
  Top = 137
  Width = 476
  Height = 304
  Caption = 'About MiniCT'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 0
    Width = 449
    Height = 265
    Lines.Strings = (
      'MiniCT'
      ''
      'Copyright 2012 Veikko Kanto'
      ''
      
        '   Licensed under the Apache License, Version 2.0 (the "License"' +
        ');'
      
        '   you may not use this file except in compliance with the Licen' +
        'se.'
      '   You may obtain a copy of the License at'
      ''
      '    http://www.apache.org/licenses/LICENSE-2.0'
      ''
      
        '   Unless required by applicable law or agreed to in writing, so' +
        'ftware'
      
        '   distributed under the License is distributed on an "AS IS" BA' +
        'SIS,'
      
        '   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express ' +
        'or implied.'
      
        '   See the License for the specific language governing permissio' +
        'ns and'
      '   limitations under the License.')
    ReadOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 184
    Top = 216
    Width = 65
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
end
