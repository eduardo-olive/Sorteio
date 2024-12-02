unit DAO.Conexao;

interface

uses
  IWSystem,
  Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.DApt,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB;

type
  TConexao = class
    private
      FConn: TFDConnection;
      FDPhysFBDriverLink: TFDPhysFBDriverLink;

      procedure ConfigurarConexao;
    public
      constructor Create;
      destructor Destroy; override;

      function GetConexao: TFDConnection;
  end;

implementation

const
    BANCO_DADOS = 'C:\Dev\Sorteio\bd\SORTEIO.FDB';

{ TConexao }

procedure TConexao.ConfigurarConexao;
begin
  FConn.DriverName := 'FB';
  FConn.Params.DriverID := 'FB';
  FConn.Params.Database := BANCO_DADOS;
  FConn.Params.UserName := 'SYSDBA';
  FConn.Params.Password := 'masterkey';
  FConn.Params.Add('Server=localhost');
  FConn.Params.Add('Port=3050');
  FConn.LoginPrompt := False;
  FConn.Connected := True;
end;

constructor TConexao.Create;
begin
  FConn := TFDConnection.Create(nil);

  ConfigurarConexao;

  Inherited;
end;

destructor TConexao.Destroy;
begin
  FConn.Connected := False;
  FConn.Destroy;
  inherited Destroy;
end;

function TConexao.GetConexao: TFDConnection;
begin
  Result := FConn;
end;

end.
