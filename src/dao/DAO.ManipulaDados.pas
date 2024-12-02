unit DAO.ManipulaDados;

interface

uses
  DAO.Interfaces, Data.DB, DAO.Conexao, FireDAC.Comp.Client;

type
  TDAOManipulaDados = class(TInterfacedObject, IDAOManipulaDados)
  private
    FConexao: TConexao;
    FDQryManipulaDados: TFDQuery;
    FDataSource: TDataSource;
  public
    constructor Create(ADataSource : TDataSource);
    destructor Destroy; override;
    class function New(ADataSource : TDataSource) : IDAOManipulaDados;

    function InserirDadosBD(ASQLInsert : string) : IDAOManipulaDados;
    function ExecutarSql(ASQLSelect : string) : IDAOManipulaDados;
  end;

implementation

uses
  System.SysUtils;

{ TDAOManipulaDados }

constructor TDAOManipulaDados.Create(ADataSource: TDataSource);
begin
  FConexao := TConexao.Create;

  FDQryManipulaDados := TFDQuery.Create(nil);
  FDQryManipulaDados.Connection := FConexao.GetConexao;

  FDataSource := ADatasource;
  FDataSource.DataSet := TDataSet(FDQryManipulaDados);
end;

destructor TDAOManipulaDados.Destroy;
begin
  FDQryManipulaDados.Destroy;
  FConexao.Destroy;
  inherited;
end;

function TDAOManipulaDados.ExecutarSql(ASQLSelect: string): IDAOManipulaDados;
begin
  try
    FDQryManipulaDados.Close;
    FDQryManipulaDados.SQL.Clear;
    FDQryManipulaDados.SQL.Add(ASQLSelect);
    FDQryManipulaDados.Open;
  except on E: Exception do
    raise Exception.Create('Error ao listar: ' + E.Message);
  end;

end;

function TDAOManipulaDados.InserirDadosBD(ASQLInsert: string): IDAOManipulaDados;
begin
  try
    FDQryManipulaDados.Close;
    FDQryManipulaDados.SQL.Clear;
    FDQryManipulaDados.SQL.Add(ASQLInsert);
    FDQryManipulaDados.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao alterar: ' + E.Message);
  end;

end;

class function TDAOManipulaDados.New(ADataSource: TDataSource): IDAOManipulaDados;
begin
  Result := Self.Create(ADataSource);
end;

end.
