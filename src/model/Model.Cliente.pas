unit Model.Cliente;

interface

uses
  Model.Interfaces, DAO.Interfaces, Data.DB;

type
  TModelCliente = class(TInterfacedObject, IModelCliente)
  private
    FId : integer;
    FNome : string;
    FCPF : string;
  public
    constructor Create;
    destructor Destroy;
    class function New : IModelCliente;

    function Id : integer; overload;
    function Id(AValue : integer) : IModelCliente overload;
    function Nome : string; overload;
    function Nome(AValue: string) : IModelCliente; overload;
    function CPF : string; overload;
    function CPF(AValue : string) : IModelCliente; overload;
  end;

implementation

{ TModelCliente }

function TModelCliente.CPF: string;
begin
  Result := FCPF
end;

function TModelCliente.CPF(AValue: string): IModelCliente;
begin
  Result := Self;
  FCPF := AValue;
end;

constructor TModelCliente.Create;
begin

end;

destructor TModelCliente.Destroy;
begin

end;

function TModelCliente.Id(AValue: integer): IModelCliente;
begin
  Result := Self;
  FId := AValue;
end;

function TModelCliente.Id: integer;
begin
  Result := FId;
end;

class function TModelCliente.New: IModelCliente;
begin
  Result := Self.Create;
end;

function TModelCliente.Nome: string;
begin
  Result := FNome;
end;

function TModelCliente.Nome(AValue: string): IModelCliente;
begin
  Result := Self;
  FNome := AValue;
end;

end.
