unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Data.DB, Vcl.StdCtrls, Controller.Interfaces,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;


type
  Cliente = Record
    Nome:string;
    Cpf:string;
  end;

  Carro = Record
    Modelo: string;
    AnoLancamento: integer;
  End;

  Venda = Record
    IdCliente: integer;
    IdCarro: integer;
    DataVenda: TDateTime;
  End;

  TForm1 = class(TForm)
    dsSorteio: TDataSource;
    btnGravar: TButton;
    DBGrid1: TDBGrid;
    btnGravarCarro: TButton;
    btnGravarVenda: TButton;
    btnClientesSorteados: TButton;
    btnVendasCarroMarea: TButton;
    btnQuantidadeVendasCarroUno: TButton;
    btnClientesSemCompras: TButton;
    btnExcluirVendasNaoSorteadas: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnClientesSorteadosClick(Sender: TObject);
    procedure btnVendasCarroMareaClick(Sender: TObject);
    procedure btnQuantidadeVendasCarroUnoClick(Sender: TObject);
    procedure btnClientesSemComprasClick(Sender: TObject);
    procedure btnExcluirVendasNaoSorteadasClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnGravarCarroClick(Sender: TObject);
    procedure btnGravarVendaClick(Sender: TObject);
  private
    { Private declarations }
    FControllerManipulaDados : IControllerManipulaDados;
    FControllerInserirDadosMock : IControllerInserirDadosMock;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  DAO.SQL,
  Model.Cliente,
  Model.Carro,
  Controller.ManipulaDados, Model.Venda, Controller.InserirDadosMock;

{$R *.dfm}

procedure TForm1.btnQuantidadeVendasCarroUnoClick(Sender: TObject);
var
  LSQL : string;
begin
  LSQL := GetSQLQuantidadeVendasCarroUnoPorCliente(TModelCarro
                                                      .New
                                                        .Modelo('Uno'));
  FControllerManipulaDados
    .ExecutarSql(LSQL);
end;

procedure TForm1.btnVendasCarroMareaClick(Sender: TObject);
var
  LSQL : string;
begin
  // CLIENTES SORTEADOS
  LSQL := GetSQLVendasCarroMarea(TModelCarro
                                          .New
                                            .Modelo('Marea'));

  FControllerManipulaDados
    .ExecutarSql(LSQL);
end;

procedure TForm1.btnClientesSemComprasClick(Sender: TObject);
var
  LSQL : string;
begin
  LSQL := GetSQLQuantidadeClienteSemCompra;

  FControllerManipulaDados
    .ExecutarSql(LSQL);
end;

procedure TForm1.btnClientesSorteadosClick(Sender: TObject);
var
  LSQL : string;
begin
  // CLIENTES SORTEADOS
  LSQL := GetSQLClientesSorteado(TModelCarro
                                          .New
                                            .Modelo('Marea'));
  FControllerManipulaDados
    .ExecutarSql(LSQL);
end;

procedure TForm1.btnExcluirVendasNaoSorteadasClick(Sender: TObject);
begin
  FControllerManipulaDados
    .InserirDadosBD(GetSQLExcluirVendasNaoSorteadas);
end;

procedure TForm1.btnGravarCarroClick(Sender: TObject);
begin
  FControllerInserirDadosMock
    .InserirCarros
end;

procedure TForm1.btnGravarClick(Sender: TObject);
begin
  FControllerInserirDadosMock
    .InserirClientes;
end;

procedure TForm1.btnGravarVendaClick(Sender: TObject);
begin
  FControllerInserirDadosMock
    .InserirVendas;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FControllerManipulaDados := TControllerManipulaDados.New(dsSorteio);
  FControllerManipulaDados
    .ExecutarSql('SELECT * FROM CLIENTES');

  FControllerInserirDadosMock := TControllerInserirDadosMock.New(FControllerManipulaDados);
end;

end.
