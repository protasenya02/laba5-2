program laba3_part3;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

const
  n = 3;  // ���������� ��������� � �������

type
 TMas= array [1 .. n] of integer;
var
 j: integer;
 NumberOfPerm: integer;// ����������  ������������
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
    for i := 1 to n do    // �����  ������������
    write(mas[i]);
    writeln;
    inc(NumberOfPerm);    //������� ���������� ������������
  end
  else
    for i:=left to right do    //����� ����� �������
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
    writeln('��� ������������ ��������� � �������:');
    for j := 1 to n do
    mas[j]:=j;
    PermutationAlgoritm(1,n,NumberOfPerm,mas);
    writeln;
    writeln('���������� ������������: ',NumberOfPerm);
    readln;
  readln;
  end.


