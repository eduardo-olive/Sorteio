unit DAO.Interfaces;

interface

uses
  Model.Interfaces;

type

  IDAOManipulaDados = interface

    function InserirDadosBD(ASQLInsert : string) : IDAOManipulaDados;
    function ExecutarSql(ASQLSelect : string) : IDAOManipulaDados;
  end;

implementation

end.