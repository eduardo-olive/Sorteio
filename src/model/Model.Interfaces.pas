unit Model.Interfaces;

interface

type

  IModelCliente = interface
    ['{283A6C75-D6E8-4833-B64E-7F94888268D5}']
    function Id : integer; overload;
    function Id(AValue : integer) : IModelCliente overload;
    function Nome : string; overload;
    function Nome(AValue: string) : IModelCliente; overload;
    function CPF : string; overload;
    function CPF(AValue : string) : IModelCliente; overload;
  end;

  IModelCarro = interface
    ['{F01D7371-DB0A-4D16-B0BD-47146128B5EF}']
    function Id : integer; overload;
    function Id(AValue : integer) : IModelCarro overload;
    function Modelo : string; overload;
    function Modelo(AValue: string) : IModelCarro; overload;
    function AnoLancamento : integer; overload;
    function AnoLancamento(AValue : integer) : IModelCarro; overload;
  end;

  IModelVenda = interface
    ['{416AE86F-3FFF-4C19-B5C6-046798299320}']
    function Id : integer; overload;
    function Id(AValue : integer) : IModelVenda overload;
    function IdCliente : integer; overload;
    function IdCliente(AValue : integer) : IModelVenda overload;
    function IdCarro : integer; overload;
    function IdCarro(AValue : integer) : IModelVenda overload;
    function DataVenda : TDateTime; overload;
    function DataVenda(AValue : TDateTime) : IModelVenda; overload;
  end;

implementation

end.
