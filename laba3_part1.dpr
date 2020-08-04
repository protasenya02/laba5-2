program laba3_part1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  size = 2000;

type
  Tmas = array [1 .. size] of Integer;

var
  Amas, Bmas, Cmas, Lmas: Tmas;
  i, j, sravnenie, zamena, zamena1, sravnenie1, zamena2, sravnenie2, n, h: Integer;

  s: string;

procedure Swap(var A, B: Integer); // меняет местами элементы массива
var
  temp: Integer;
begin
  temp := A;
  A := B;
  B := temp;

end;

procedure TableHead;
begin
  Writeln('------------------------------------------------------------------------------------------------------------------');
  Writeln('|               |    Bubble Sort #1             |        Insertion Sort #2       |           Quick Sort #2        |');
  Writeln('|  Array        |---------------|---------------|---------------|----------------|---------------|----------------|');
  Writeln('|  type         |  Number of    |   Number of   |  Number of    |   Number of    |  Number of    |   Number of    |');
  Writeln('|               |  comparisons  |   exchanges   |  comparisons  |   exchanges    |  comparisons  |   exchanges    |');
  Writeln('|---------------|---------------|---------------|---------------|----------------|---------------|----------------|');
end;

procedure Table;
begin

  Writeln('|', n:5,
    '          |               |               |               |                |               |                |');
  Writeln('| ', s, ' | ', sravnenie1:13, ' | ', zamena1:14, '|', sravnenie:15,  '| ', zamena:15, '|', sravnenie2:15,  '| ', zamena2:15, '|');
  Writeln('|---------------|---------------|---------------|---------------|----------------|---------------|----------------|');

end;

procedure InsertionSort(var Amas: Tmas);
var
  x: Integer;
begin
  zamena := 0;
  sravnenie := 0;
  for i := 2 to n do
  begin
    x := Amas[i];
    inc(zamena);
    j := i - 1;
    inc(sravnenie);
    while (j >= 1) and (Amas[j] > x) do
    begin
      Amas[j + 1] := Amas[j];
      inc(zamena);
      j := j - 1;
      inc(sravnenie);
    end;
    Amas[j + 1] := x;
    inc(zamena);
  end;
end;

procedure BubbleSort(var Amas: Tmas);
begin
  zamena1 := 0;
  sravnenie1 := 0;
  for i := 1 to n - 1 do
  begin
    for j := 1 to n - i do
    begin
      if Amas[j] > Amas[j + 1] then
      begin
        Swap(Amas[j], Amas[j + 1]);
        zamena1 := zamena1 + 3;
      end;
      inc(sravnenie1);
    end;
  end;
end;

procedure QuickSort(var Mas: Tmas; const size: Integer;  //быстрая сортировка
                     var Comp, Exchange: Integer);
  Procedure QSort(L, R: Integer);
  var
    i, j, x: Integer;
  begin
    i := L;
    j := R;
    x := Mas[(L + R) div 2];
    repeat
      inc(Comp);
      while Mas[i] < x do
      begin
        inc(i);
        inc(Comp);
      end;
         inc(Comp);
      while Mas[j] > x do
      begin
        Dec(j);
        inc(Comp);
      end;

      if i <= j then
      begin
        Swap(Mas[i], Mas[j]);
        inc(Exchange,3);
        inc(i);
        Dec(j);
      end;

    until i > j;
    if j > L then
      QSort(L, j);

    if i < R then
      QSort(i, R);

  end;

  begin
    Comp := 0;
    Exchange := 0;
    QSort(1, size);
  end;

procedure NewArray(var first, second, third: Tmas); // копирует аmas в bmas cmas
begin
  for i := 1 to n do
  begin
    first[i] := Amas[i];
    second[i] := Amas[i];
    third[i] := Amas[i];
  end;
end;

procedure reverse(var B: Tmas); // разворот массивов
var
  tempmas: Tmas;
begin
  j := 1;
  for i := n downto 1 do
  begin
    tempmas[j] := B[i];
    inc(j);
  end;

  for i := 1 to n do
  begin
    B[i] := tempmas[i];
  end;
end;

begin
  TableHead;
  randomize;
  for i := 1 to size do // заполнение массива начального
  begin
    Amas[i] := random(100) - 50;
  end;

  n := 10;
  for h := 1 to 3 do
  begin
    NewArray(Bmas, Cmas, Lmas); // создание массивов amas bmas
    InsertionSort(Bmas); // сортировки выбором для несортированного
    BubbleSort(Cmas); // сортировка пузырьком
    QuickSort( Lmas, n, sravnenie2, zamena2); //быстрая сортировка
    s := 'el. unsorted ';
    Table;

    InsertionSort(Bmas);
    BubbleSort(Cmas);
    QuickSort( Lmas, n, sravnenie2, zamena2);
    s := 'el. sorted   '; // для отсортированного
    Table;

    reverse(Bmas); // разворот массивов
    reverse(Cmas);
    reverse (Lmas);

    InsertionSort(Bmas); // сортировка для обратно отсортированных массивов
    BubbleSort(Cmas);
    QuickSort( Lmas, n, sravnenie2, zamena2);
    s := 'el. bk sorted';
    Table;

    if n = 100 then
      n := 2000;
    if n = 10 then
      n := 100;

  end;

  readln;

end.
