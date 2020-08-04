program laba3_part2;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var
  RingsCount, StartTower, FinishTower, TempTower: integer;

function SearchTempTower(StartTower, FinishTower: integer): integer;  //поиск промежуточного стержня
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

procedure HanoiTower(n: integer; s1{1-стержень }, s2{2-1 стержень }, s3{3-й стержень}: integer);// рекурсивная процедура
                                                     //перемещения колец

begin

  if n > 0 then

  begin

    HanoiTower(n - 1, s1, s3, s2); // перестановка на независимый стержень

    Writeln(s1, ' -> ', s2);   //вывод сообщение о перемещении 1 кольуа

    HanoiTower(n - 1, s3, s2, s1);

  end;

end;

begin
  Writeln('Введите количество колец:');
  readln(RingsCount);
  if RingsCount = 0 then
    Writeln('Вы ввели некорректное значение. Попробуйте еще раз!')
  else
  begin
    Writeln('Введите начальный стержень(значение от 1 до 3):');
    readln(StartTower);
    Writeln('Введите стержень, на который необходимо переместить кольца:');
    readln(FinishTower);
    TempTower := SearchTempTower(StartTower, FinishTower); // поиск промежуточного
    if (FinishTower > 3) or (StartTower > 3) or (FinishTower = StartTower) then
      Writeln('Вы ввели некорректное значение. Попробуйте еще раз!')
    else
    begin
      Writeln('Результат перемещений колец с одного стержня на другой:');
      HanoiTower(RingsCount, StartTower, FinishTower, TempTower);    //рекурсивная процеду перемещения колец
    end;
  end;
  readln;

end.
