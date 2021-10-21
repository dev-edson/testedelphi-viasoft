unit uSubstitui;

interface

uses
  uISubstitui;

type

  TSubstitui = class(TInterfacedObject, ISubstitui)
  public
    function Substituir(aStr, aVelho, aNovo: String): String;
  end;



implementation

function TSubstitui.Substituir(aStr, aVelho, aNovo: String): String;
var
    retorno, str : string;
    i, j, l, iTemp : integer;
begin
  retorno := '';
  i := 1;
  j := 1;
  str := aStr + '\';
  repeat
    if str[i] = aVelho[j] then
    begin
      repeat
        itemp := i;
        j := j +1;
        if aVelho[j] = '' then
        begin
           retorno := retorno + aNovo;
           i := i + j - 2;
           j := 1;
        end
        else
        begin
           itemp := 1 + itemp;
           if str[itemp] = aVelho[j] then
            j := j+ 1
           else
           begin
             for l := 1 to (itemp - i) do
              begin
                retorno := retorno + str[i];
                i := i+1;
                j := 1;
              end;
           end;
        end;
      until j = 1;
    end
    else
    begin
      retorno := retorno + str[i]   ;
      i:= i + 1;
    end;

  until str[i] = '\' ;

  result := retorno;
end;

end.

