unit Controller.Interfaces;

interface

type

  IControllerManipulaDados = interface
    ['{0DACA5A1-D78D-4DD4-B24D-BECB529879B9}']
    function InserirDadosBD(ASQLInsert : string) : IControllerManipulaDados;
    function ExecutarSql(ASQLSelect : string) : IControllerManipulaDados;

    function DeletaVendasNaoSorteadas : IControllerManipulaDados;
  end;

  IControllerInserirDadosMock = interface
    ['{1E0AE2EE-ADD0-4E8C-A9CD-DC12DA254E2F}']
    function InserirClientes : IControllerInserirDadosMock;
    function InserirCarros : IControllerInserirDadosMock;
    function InserirVendas : IControllerInserirDadosMock;
  end;

implementation

end.
