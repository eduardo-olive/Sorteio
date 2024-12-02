unit DAO.SQL;

interface

uses
  System.SysUtils,
  Model.Interfaces;

function GetSQLInsertCliente(ACliente : IModelCliente) : string;

function GetSQLInsertCarro(ACarro : IModelCarro) : string;

function GetSQLInsertVenda(AVenda : IModelVenda) : string;

function GetSQLVendasCarroMarea(ACarro : IModelCarro) : string;

function GetSQLQuantidadeVendasCarroUnoPorCliente(ACarro : IModelCarro) : string;

function GetSQLQuantidadeClienteSemCompra : string;

function GetSQLClientesSorteado(ACarro : IModelCarro) : string;

function GetSQLExcluirVendasNaoSorteadas : string;

implementation

function GetSQLInsertCliente(ACliente : IModelCliente) : string;
begin
  Result := Format('INSERT INTO CLIENTES (nome, cpf) VALUES (''%s'', ''%s'')', [ACliente.Nome, ACliente.CPF]);
end;

function GetSQLInsertCarro(ACarro : IModelCarro) : string;
begin
  Result := Format('INSERT INTO CARROS (MODELO, ANO_LANCAMENTO) VALUES (''%s'', %d)', [ACarro.Modelo, ACarro.AnoLancamento]);
end;

function GetSQLInsertVenda(AVenda : IModelVenda) : string;
begin
  Result := Format('INSERT INTO VENDAS (ID_CLIENTE, ID_CARRO, DATA_VENDA) VALUES (%d, %d, ''%s'')', [AVenda.IdCliente, AVenda.IdCarro, DateToStr(AVenda.DataVenda)]);
end;

function GetSQLVendasCarroMarea(ACarro : IModelCarro) : string;
begin
  Result := Format('SELECT COUNT(*) AS QUANTIDADE_VENDAS_MAREA ' +
            '  FROM VENDAS V                            ' +
            '  JOIN CARROS C ON V.ID_CARRO = C.ID ' +
            '  WHERE C.MODELO = %s', [QuotedStr(ACarro.Modelo)]);
end;

function GetSQLQuantidadeVendasCarroUnoPorCliente(ACarro : IModelCarro) : string;
begin
  Result := Format('SELECT CL.NOME, CL.CPF, COUNT(*) AS QUANTIDADE_VENDAS_UNO ' +
            '  FROM VENDAS V ' +
            '  JOIN CARROS C ON V.ID_CARRO = C.ID' +
            '  JOIN CLIENTES CL ON V.ID_CLIENTE = CL.ID ' +
            '  WHERE C.MODELO = %s' +
            '  GROUP BY CL.NOME, CL.CPF', [QuotedStr(ACarro.Modelo)]);
end;

function GetSQLQuantidadeClienteSemCompra : string;
begin
  Result := 'SELECT COUNT(*) AS QUANTIDADE_CLIENTES_SEM_COMPRA' +
            '  FROM CLIENTES        ' +
            '  WHERE ID NOT IN      ' +
            '    (SELECT ID_CLIENTE ' +
            '     FROM VENDAS)      ';
end;

function GetSQLClientesSorteado(ACarro : IModelCarro) : string;
begin
  Result := 'SELECT CL.ID,                           ' +
            '  CL.NOME,                              ' +
            '  CL.CPF, C.MODELO, C.ANO_LANCAMENTO     ' +
            '  FROM CLIENTES CL                      ' +
            '  JOIN VENDAS V ON CL.ID = V.ID_CLIENTE ' +
            '  JOIN CARROS C ON V.ID_CARRO = C.ID    ' +
            '  WHERE C.MODELO = ' + QuotedStr(ACarro.Modelo) +
            '    AND C.ANO_LANCAMENTO = 2021         ' +
            '    AND CL.CPF LIKE ''0%'' '              +
            '    AND CL.ID IN                        ' +
            '      (SELECT ID_CLIENTE                ' +
            '       FROM VENDAS                      ' +
            '       WHERE ID_CARRO IN                ' +
            '           (SELECT ID             ' +
            '            FROM CARROS                 ' +
            '            WHERE MODELO = ' + QuotedStr(ACarro.Modelo) + ')'+
            '       GROUP BY ID_CLIENTE              ' +
            '       HAVING COUNT(*) = 1)             ' +
            '  ORDER BY V.DATA_VENDA                 ';

end;

function GetSQLExcluirVendasNaoSorteadas : string;
begin
  Result := 'DELETE                                  ' +
            'FROM VENDAS V                           ' +
            'WHERE NOT EXISTS                        ' +
            '   (SELECT CL.ID                        ' +
            '    FROM CLIENTES CL                    ' +
            '    JOIN CARROS C ON V.id_carro = C.ID  ' +
            '    WHERE CL.ID = V.ID_CLIENTE          ' +
            '      AND C.MODELO = ''Marea''          ' +
            '      AND C.ANO_LANCAMENTO = 2021       ' +
            '      AND CL.CPF LIKE ''0%''            ' +
            '    GROUP BY CL.ID                      ' +
            '    HAVING COUNT(CL.ID) = 1)';
end;

end.
