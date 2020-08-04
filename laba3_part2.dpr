program laba3_part2;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var
  RingsCount, StartTower, FinishTower, TempTower: integer;

function SearchTempTower(StartTower, FinishTower: integer): integer;  //����� �������������� �������
begin

  if ((StartTower = 1) and (FinishTower = 2)) or
    ((StartTower = 2) and (FinishTower = 1)) then
    result := 3;
  if ((StartTower = 2) and (FinishTower = 3)) or
    ((StartTower = 3) and (FinishTower = 2)) then
    result := 1;
  if ((StartTower = 1) and (FinishTower = 3)) or
    ((StartTower = 3) and (FinishTower = 1)) then
    result := 2;

end;

procedure HanoiTower(n: integer; s1{1-�������� }, s2{2-1 �������� }, s3{3-� ��������}: integer);// ����������� ���������
                                                     //����������� �����

begin

  if n > 0 then

  begin

    HanoiTower(n - 1, s1, s3, s2); // ������������ �� ����������� ��������

    Writeln(s1, ' -> ', s2);   //����� ��������� � ����������� 1 ������

    HanoiTower(n - 1, s3, s2, s1);

  end;

end;

begin
  Writeln('������� ���������� �����:');
  readln(RingsCount);
  if RingsCount = 0 then
    Writeln('�� ����� ������������ ��������. ���������� ��� ���!')
  else
  begin
    Writeln('������� ��������� ��������(�������� �� 1 �� 3):');
    readln(StartTower);
    Writeln('������� ��������, �� ������� ���������� ����������� ������:');
    readln(FinishTower);
    TempTower := SearchTempTower(StartTower, FinishTower); // ����� ��������������
    if (FinishTower > 3) or (StartTower > 3) or (FinishTower = StartTower) then
      Writeln('�� ����� ������������ ��������. ���������� ��� ���!')
    else
    begin
      Writeln('��������� ����������� ����� � ������ ������� �� ������:');
      HanoiTower(RingsCount, StartTower, FinishTower, TempTower);    //����������� ������� ����������� �����
    end;
  end;
  readln;

end.
