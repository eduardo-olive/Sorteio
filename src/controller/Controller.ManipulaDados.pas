unit Controller.ManipulaDados;

interface

uses
  Controller.Interfaces,
  Data.DB,
  DAO.Interfaces;

type
  TControllerManipulaDados = class(TInterfacedObject, IControllerManipulaDados)
  private
    FDAOManipulaDados : IDAOManipulaDados;
  public
    constructor Create(ADataSource : TDataSource);
    destructor Destroy; override;
    class function New(ADataSource : TDataSource) : IControllerManipulaDados;

    function InserirDadosBD(ASQLInsert : string) : IControllerManipulaDados;
    function ExecutarSql(ASQLSelect : string) : IControllerManipulaDados;

    function DeletaVendasNaoSorteadas : IControllerManipulaDados;
  end;

implementation

uses
  System.SysUtils, DAO.ManipulaDados;

{ TControllerManipulaDados }

constructor TControllerManipulaDados.Create(ADataSource : TDataSource);
begin
  FDAOManipulaDados := TDAOManipulaDados.New(ADataSource);
end;

class function TControllerManipulaDados.New(ADataSource : TDataSource) : IControllerManipulaDados;
begin
  Result := Self.Create(ADataSource);
end;

function TControllerManipulaDados.DeletaVendasNaoSorteadas: IControllerManipulaDados;
begin
  Result := Self;
end;

destructor TControllerManipulaDados.Destroy;
begin

  inherited;
end;

function TControllerManipulaDados.ExecutarSql(ASQLSelect: string): IControllerManipulaDados;
begin
  Result := Self;
  FDAOManipulaDados.ExecutarSql(ASQLSelect);
end;

function TControllerManipulaDados.InserirDadosBD(ASQLInsert: string): IControllerManipulaDados;
begin
  Result := Self;
  FDAOManipulaDados.InserirDadosBD(ASQLInsert);
end;

end.
