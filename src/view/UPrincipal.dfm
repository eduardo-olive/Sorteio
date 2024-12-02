object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 394
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnGravar: TButton
    Left = 8
    Top = 16
    Width = 97
    Height = 25
    Caption = 'Gravar Cliente'
    TabOrder = 0
    OnClick = btnGravarClick
  end
  object DBGrid1: TDBGrid
    Left = 111
    Top = 16
    Width = 562
    Height = 246
    DataSource = dsSorteio
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnGravarCarro: TButton
    Left = 8
    Top = 140
    Width = 97
    Height = 25
    Caption = 'Gravar Carro'
    TabOrder = 2
    OnClick = btnGravarCarroClick
  end
  object btnGravarVenda: TButton
    Left = 8
    Top = 255
    Width = 105
    Height = 25
    Caption = 'Gravar Venda'
    TabOrder = 3
    OnClick = btnGravarVendaClick
  end
  object btnClientesSorteados: TButton
    Left = 217
    Top = 268
    Width = 168
    Height = 25
    Caption = 'Clientes Sorteados'
    TabOrder = 4
    OnClick = btnClientesSorteadosClick
  end
  object btnVendasCarroMarea: TButton
    Left = 217
    Top = 299
    Width = 168
    Height = 25
    Caption = 'Quantidade Vendas Carro Marea'
    TabOrder = 5
    OnClick = btnVendasCarroMareaClick
  end
  object btnQuantidadeVendasCarroUno: TButton
    Left = 217
    Top = 330
    Width = 168
    Height = 25
    Caption = 'Quantidade Vendas Carro Uno'
    TabOrder = 6
    OnClick = btnQuantidadeVendasCarroUnoClick
  end
  object btnClientesSemCompras: TButton
    Left = 217
    Top = 361
    Width = 168
    Height = 25
    Caption = 'Clientes Sem Compras'
    TabOrder = 7
    OnClick = btnClientesSemComprasClick
  end
  object btnExcluirVendasNaoSorteadas: TButton
    Left = 489
    Top = 268
    Width = 168
    Height = 25
    Caption = 'Excluir Vendas N'#227'o Sorteadas'
    TabOrder = 8
    OnClick = btnExcluirVendasNaoSorteadasClick
  end
  object dsSorteio: TDataSource
    Left = 360
    Top = 64
  end
end
