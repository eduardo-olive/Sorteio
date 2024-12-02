unit DAO.Interfaces;

interface

uses
  Model.Interfaces;

type

  IDAOManipulaDados = interface
    ['{C3B6C1F8-5B60-4C1E-AE5B-4A940555D8D9}']
    function InserirDadosBD(ASQLInsert : string) : IDAOManipulaDados;
    function ExecutarSql(ASQLSelect : string) : IDAOManipulaDados;
  end;

implementation

end.
