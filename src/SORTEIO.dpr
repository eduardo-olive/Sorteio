program SORTEIO;

uses
  Vcl.Forms,
  UPrincipal in 'view\UPrincipal.pas' {Form1},
  Model.Cliente in 'model\Model.Cliente.pas',
  Model.Interfaces in 'model\Model.Interfaces.pas',
  DAO.Conexao in 'dao\DAO.Conexao.pas',
  DAO.Interfaces in 'dao\DAO.Interfaces.pas',
  Controller.Interfaces in 'controller\Controller.Interfaces.pas',
  Model.Carro in 'model\Model.Carro.pas',
  Model.Venda in 'model\Model.Venda.pas',
  Controller.ManipulaDados in 'controller\Controller.ManipulaDados.pas',
  DAO.ManipulaDados in 'dao\DAO.ManipulaDados.pas',
  DAO.SQL in 'dao\DAO.SQL.pas',
  Controller.InserirDadosMock in 'controller\Controller.InserirDadosMock.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

  ReportMemoryLeaksOnShutdown := True;
end.
