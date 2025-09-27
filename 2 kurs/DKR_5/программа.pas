program Sortirovka;
type
  TArray = array of Integer;
// Процедура сортировки вставками
procedure InsertionSort(var data: TArray; comparator: function(a, b: Integer): Integer);
var
  i, j, key: Integer;
begin
  for i := 1 to High(data) do
  begin
    key := data[i];
    j := i - 1;

    while (j >= 0) and (comparator(key, data[j]) < 0) do
    begin
      data[j + 1] := data[j];
      j := j - 1;
    end;
    data[j + 1] := key;
  end;
end;

// Процедура поразрядной сортировки
procedure RadixSort(var data: TArray; n: Integer);
var
  exp, i: Integer;
  output: TArray;
  count: array[0..9] of Integer;
  max: Integer;
begin
  SetLength(output, n);
  
  max := data[0];
  for i := 1 to n - 1 do
    if data[i] > max then
      max := data[i];

  exp := 1;
  while max div exp > 0 do
  begin
    for i := 0 to 9 do
      count[i] := 0;

    for i := 0 to n - 1 do
      Inc(count[(data[i] div exp) mod 10]); // Подсчет

    for i := 1 to 9 do
      count[i] := count[i] + count[i - 1]; // Кумулятивная сумма

    for i := n - 1 downto 0 do
    begin
      output[count[(data[i] div exp) mod 10] - 1] := data[i];
      Dec(count[(data[i] div exp) mod 10]); // Построение output
    end;

    for i := 0 to n - 1 do
      data[i] := output[i]; 

    exp := exp * 10; // Переход к следующему разряду
  end;
  end;

// Функция компаратора для сортировки 
function CompareAscending(a, b: Integer): Integer;
begin
  Result := a - b;
end;

// Процедура для считывания данных из файла
procedure ReadDataFromFile(const filename: string; var data: TArray; var count: Integer);
var
  f: TextFile;
  num: Integer;
begin
  AssignFile(f, filename);
  Reset(f);

  count := 0;
  SetLength(data, 1000); // Инициализируем массив

  while not Eof(f) do
  begin
    Read(f, num);
    if count < 1000 then
    begin
      data[count] := num;
      Inc(count);
    end
    else
      Break; // Прерываем, если массив заполнен
  end;

  SetLength(data, count); // Обрезаем массив до фактического количества элементов
  CloseFile(f);
end;

// Процедура для записи данных в файл
procedure WriteDataToFile(const filename: string; const data: TArray);
var
  f: TextFile;
  i: Integer;
begin
  AssignFile(f, filename);
  Rewrite(f);
  for i := Low(data) to High(data) do
    WriteLn(f, data[i]);
  CloseFile(f);
end;

var
  inputData: TArray; 
  count: Integer;
  time1,time2,time3,time4,totalTime:real;
  
begin
  // Считываем данные из файла
  ReadDataFromFile('C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\ДКР 5\числа.txt', inputData, count);

  if count = 0 then
  begin
    WriteLn('Ошибка: Нет данных для сортировки.');
    Exit;
  end;
  time1:= Milliseconds;
  InsertionSort(inputData, CompareAscending);
  time2:= Milliseconds;
  totalTime:=time2-time1;
  writeln('Для сортировки вставками понядобилось ',totalTime,' мс');
  // Сортировка вставками
  WriteDataToFile('C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\ДКР 5\вывод сортировки вставками.txt', inputData);
  // Считываем данные заново для поразрядной сортировки
  ReadDataFromFile('C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\ДКР 5\числа.txt', inputData, count);
time3:= Milliseconds;
RadixSort(inputData, count);
time4:=Milliseconds;
totalTime:=time4-time3;
writeln('Для поразрядной сортировки понадобилось ',totalTime,' мс');
  // Поразрядная сортировка
  WriteDataToFile('C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\ДКР 5\вывод сортировки с помощью поразрядного алгоритма.txt', inputData);

  WriteLn('Сортировка завершена. Результаты записаны в файлы.');
end.