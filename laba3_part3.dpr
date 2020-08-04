program laba3_part3;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

const
  n = 3;  // количество элементов в массиве

type
 TMas= array [1 .. n] of integer;
var
 j: integer;
 NumberOfPerm: integer;// количество  перестановок
 Mas: Tmas;

procedure PermutationAlgoritm(left, right:integer; var NumberOfPerm: integer; var  mas:Tmas);
procedure  Permutation(left, right: integer; var NumberOfPerm: integer );
var
  i: integer;
  procedure Swap(var a, b: integer);
  var
    temp: integer;
  begin
    temp := a;
    a := b;
    b := temp;
  end;

begin
  if left = right then
  begin
    for i := 1 to n do    // вывод  перестановки
    write(mas[i]);
    writeln;
    inc(NumberOfPerm);    //подсчет количества перестановок
  end
  else
    for i:=left to right do    //сдвиг левой границы
    begin
      Swap(mas[i], mas[left]);
      Permutation(left+1,right,NumberOfPerm);
      Swap(mas[i], mas[left])
    end
end;

  begin
  Permutation(1,n,NumberOfPerm);
  end;

  begin
    writeln('Все перестановки элементов в массиве:');
    for j := 1 to n do
    mas[j]:=j;
    PermutationAlgoritm(1,n,NumberOfPerm,mas);
    writeln;
    writeln('Количество перестановок: ',NumberOfPerm);
    readln;
  readln;
  end.


