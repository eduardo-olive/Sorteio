unit Model.Venda;

interface

uses
  Model.Interfaces, Data.DB, DAO.Interfaces;

type
  TModelVenda = class(TInterfacedObject, IModelVenda)
  private
    FId: integer;
    FIdCliente: integer;
    FIdCarro: integer;
    FDataVenda : TDateTime;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IModelVenda;

    function Id : integer; overload;
    function Id(AValue : integer) : IModelVenda overload;
    function IdCliente : integer; overload;
    function IdCliente(AValue : integer) : IModelVenda overload;
    function IdCarro : integer; overload;
    function IdCarro(AValue : integer) : IModelVenda overload;
    function DataVenda : TDateTime; overload;
    function DataVenda(AValue : TDateTime) : IModelVenda; overload;

    function Gravar : IModelVenda;
    function Alterar : IModelVenda;
    function BuscarPorId(AValue : integer) : IModelVenda;
    function BuscarTodos : IModelVenda;
    function Excluir(AValue : integer) : IModelVenda;
  end;

implementation

{ TModelVenda }

constructor TModelVenda.Create;
begin

end;

class function TModelVenda.New: IModelVenda;
begin
  Result := Self.Create;
end;

destructor TModelVenda.Destroy;
begin

  inherited;
end;

function TModelVenda.Alterar: IModelVenda;
begin
  Result := Self;
end;

function TModelVenda.BuscarPorId(AValue: integer): IModelVenda;
begin
  Result := Self;
end;

function TModelVenda.BuscarTodos: IModelVenda;
begin
  Result := Self;
end;

function TModelVenda.DataVenda(AValue: TDateTime): IModelVenda;
begin
  Result := Self;
  FDataVenda := AValue;
end;

function TModelVenda.DataVenda: TDateTime;
begin
  Result := FDataVenda;
end;

function TModelVenda.Excluir(AValue: integer): IModelVenda;
begin
  Result := Self;
end;

function TModelVenda.Gravar: IModelVenda;
begin
  Result := Self;
end;

function TModelVenda.Id(AValue: integer): IModelVenda;
begin
  Result := Self;
  FId := AValue;
end;

function TModelVenda.Id: integer;
begin
  Result := FId;
end;

function TModelVenda.IdCarro: integer;
begin
  Result := FIdCarro;
end;

function TModelVenda.IdCarro(AValue: integer): IModelVenda;
begin
  Result := Self;
  FIdCarro := AValue;
end;

function TModelVenda.IdCliente: integer;
begin
  Result := FIdCliente;
end;

function TModelVenda.IdCliente(AValue: integer): IModelVenda;
begin
  Result := Self;
  FIdCliente := AValue;
end;

end.
