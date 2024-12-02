unit Controller.InserirDadosMock;

interface

uses
  System.Generics.Collections,
  Model.Interfaces,
  Controller.Interfaces;

type
  TControllerInserirDadosMock = class(TInterfacedObject, IControllerInserirDadosMock)
  private
    FControllerManipulaDados : IControllerManipulaDados;
    FListaClientes : TList<IModelCliente>;
    FListaCarros : TList<IModelCarro>;
    FListaVendas : TList<IModelVenda>;
  public
    constructor Create(AControllerManipulaDados : IControllerManipulaDados);
    destructor Destroy; override;
    class function New(AControllerManipulaDados : IControllerManipulaDados) : IControllerInserirDadosMock;

    function InserirClientes : IControllerInserirDadosMock;
    function InserirCarros : IControllerInserirDadosMock;
    function InserirVendas : IControllerInserirDadosMock;
  end;

implementation

uses
  Model.Cliente, Model.Venda, Model.Carro, DAO.SQL, System.SysUtils;

{ TControllerInserirDadosMock }

constructor TControllerInserirDadosMock.Create(AControllerManipulaDados : IControllerManipulaDados);
begin
  FControllerManipulaDados := AControllerManipulaDados;
  FListaClientes := TList<IModelCliente>.Create;
  FListaCarros := TList<IModelCarro>.Create;
  FListaVendas := TList<IModelVenda>.Create;
end;

class function TControllerInserirDadosMock.New(AControllerManipulaDados : IControllerManipulaDados) : IControllerInserirDadosMock;
begin
  Result := Self.Create(AControllerManipulaDados);
end;

destructor TControllerInserirDadosMock.Destroy;
begin
  FListaClientes.Destroy;
  FListaCarros.Destroy;
  FListaVendas.Destroy;
  inherited;
end;

function TControllerInserirDadosMock.InserirCarros: IControllerInserirDadosMock;
var
  LModelCarro : IModelCarro;
begin

  FListaCarros
    .Add(TModelCarro
          .New
            .Modelo('Opala')
            .AnoLancamento(1989));
  FListaCarros
    .Add(TModelCarro
          .New
            .Modelo('Del Rey')
            .AnoLancamento(1987));
  FListaCarros
    .Add(TModelCarro
          .New
            .Modelo('Pampa')
            .AnoLancamento(1989));
  FListaCarros
    .Add(TModelCarro
          .New
            .Modelo('Saveiro')
            .AnoLancamento(1996));
  FListaCarros
    .Add(TModelCarro
          .New
            .Modelo('Omega')
            .AnoLancamento(1996));

  for LModelCarro in FListaCarros do
  begin
    FControllerManipulaDados
      .InserirDadosBD(GetSQLInsertCarro(LModelCarro));
  end;
end;

function TControllerInserirDadosMock.InserirClientes: IControllerInserirDadosMock;
var
  LModelCliente : IModelCliente;
begin
  FListaClientes
    .Add(TModelCliente
          .New
            .Nome('Paulo Silva')
            .CPF('12934467890'));
  FListaClientes
    .Add(TModelCliente
          .New
            .Nome('Maria Oliveira')
            .CPF('01122334255'));
  FListaClientes
    .Add(TModelCliente
          .New
            .Nome('Pedro Santos')
            .CPF('82133445966'));
  FListaClientes
    .Add(TModelCliente
          .New
            .Nome('Ana Costa')
            .CPF('01098265432'));
  FListaClientes
    .Add(TModelCliente
          .New
            .Nome('Beatriz Nunes')
            .CPF('01222238344'));


  for LModelCliente in FListaClientes do
  begin
    FControllerManipulaDados
      .InserirDadosBD(GetSQLInsertCliente(LModelCliente));
  end;

  FControllerManipulaDados
    .ExecutarSql('SELECT * FROM CLIENTES');
end;

function TControllerInserirDadosMock.InserirVendas: IControllerInserirDadosMock;
var
  LModelVenda : IModelVenda;
begin
  FListaVendas
    .Add(TModelVenda
          .New
            .IdCliente(11)
            .IdCarro(1)
            .DataVenda(StrToDateTime('01/01/2023')));
  FListaVendas
    .Add(TModelVenda
          .New
            .IdCliente(12)
            .IdCarro(2)
            .DataVenda(StrToDateTime('01/02/2019')));
  FListaVendas
    .Add(TModelVenda
          .New
            .IdCliente(3)
            .IdCarro(3)
            .DataVenda(StrToDateTime('01/03/2018')));
  FListaVendas
    .Add(TModelVenda
          .New
            .IdCliente(13)
            .IdCarro(4)
            .DataVenda(StrToDateTime('12/08/2022')));
  FListaVendas
    .Add(TModelVenda
          .New
            .IdCliente(14)
            .IdCarro(5)
            .DataVenda(StrToDateTime('03/07/2023')));

  for LModelVenda in FListaVendas do
  begin
    FControllerManipulaDados
      .InserirDadosBD(GetSQLInsertVenda(LModelVenda));
  end;
end;



end.
