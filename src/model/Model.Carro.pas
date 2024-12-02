unit Model.Carro;

interface

uses
  Model.Interfaces, Data.DB, DAO.Interfaces;

type
  TModelCarro = class(TInterfacedObject, IModelCarro)
  private
    FId : integer;
    FModelo: string;
    FAnoLancamento : integer;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IModelCarro;

    function Id : integer; overload;
    function Id(AValue : integer) : IModelCarro overload;
    function Modelo : string; overload;
    function Modelo(AValue: string) : IModelCarro; overload;
    function AnoLancamento : integer; overload;
    function AnoLancamento(AValue : integer) : IModelCarro; overload;
  end;

implementation

{ TModelCarro }

constructor TModelCarro.Create;
begin

end;

class function TModelCarro.New: IModelCarro;
begin
  Result := Self.Create;
end;

destructor TModelCarro.Destroy;
begin

  inherited;
end;

function TModelCarro.AnoLancamento(AValue: integer): IModelCarro;
begin
  Result := Self;
  FAnoLancamento := AValue;
end;

function TModelCarro.AnoLancamento: integer;
begin
  Result := FAnoLancamento;
end;

function TModelCarro.Id: integer;
begin
  Result := FId;
end;

function TModelCarro.Id(AValue: integer): IModelCarro;
begin
  Result := Self;
  FId := AValue;
end;

function TModelCarro.Modelo(AValue: string): IModelCarro;
begin
  Result := Self;
  FModelo := AValue;
end;

function TModelCarro.Modelo: string;
begin
  Result := FModelo;
end;

end.
