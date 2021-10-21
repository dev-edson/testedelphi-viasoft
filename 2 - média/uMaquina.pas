unit uMaquina;

interface

uses
  uIMaquina, Classes, uTroco, SysUtils;

type

  TMaquina = class(TInterfacedObject, IMaquina)
  public
    function MontarTroco(Troco: Double): TList;
  end;

implementation

uses math;

function TMaquina.MontarTroco(Troco: Double): TList;
var
  retorno : Tlist;
  aux : Ttroco;
  restante, valor : currency;
  nNotas : integer;
  cedula : Tcedula;

begin
  retorno := Tlist.Create;
  restante := Troco;
  if restante >= 0 then
  begin
    for valor in cvalorCedula do
    begin
      nNotas := 0;
      if restante >= valor then
      begin
        nNotas := trunc(restante / valor);
        restante := restante - Trunc(valor * 100)/100 * nNotas;

        if valor = 100 then
          cedula := ceNota100
        else
          if valor = 50 then
            cedula := ceNota50
          else
            if valor = 20 then
              cedula := ceNota20
            else
              if valor = 10 then
                cedula := ceNota10
              else
                if valor = 5 then
                  cedula :=  ceNota5
                else
                  if valor = 2 then
                    cedula := ceNota2
                  else
                    if valor = 1 then
                     cedula := ceMoeda100
                    else
                      if valor = 0.5 then
                        cedula := ceMoeda50
                      else
                        if valor = 0.25 then
                          cedula := ceMoeda25
                        else
                          if valor = 0.1 then
                            cedula := ceMoeda10
                          else
                            if valor = 0.05 then
                              cedula := ceMoeda5
                            else
                              if valor = 0.01 then
                                cedula := ceMoeda1;

        aux := Ttroco.Create( cedula , nNotas);
        retorno.Add(aux);
      end;
      if restante <= 0 then
         break;

    end;
    Result := retorno;
  end
  else
    Result := nil;
end;

end.

