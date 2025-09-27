type
  TNode = record
    Value: Integer;    // Значение узла, которое будет хранить целое число
    Next: ^TNode;     // Указатель на следующий узел в деке
    Prev: ^TNode;     // Указатель на предыдущий узел в деке
  end;

  TDeque = record
    Front: ^TNode;    // Указатель на передний узел дека
    Back: ^TNode;     // Указатель на задний узел дека
  end;

var
  InputFile, OutputFile: TextFile; 
  Number: Integer;                  
  Count, I: Integer;                
  Deque: TDeque;                   

procedure InitDeque(var D: TDeque);
begin
  D.Front := nil;  // Инициализация указателя на передний узел
  D.Back := nil;   // Инициализация указателя на задний узел
end;

procedure PushBack(var D: TDeque; Value: Integer);
var
  NewNode: ^TNode; // Указатель на новый узел
begin
  New(NewNode); // Выделяем память для нового узла
  NewNode^.Value := Value; // Записываем значение в новый узел
  NewNode^.Next := nil; 
  NewNode^.Prev := D.Back; 

  if D.Back <> nil then // Проверяем, не пустой ли дек
    D.Back^.Next := NewNode; 

  D.Back := NewNode; // Обновляем указатель на задний узел дека

  if D.Front = nil then 
    D.Front := NewNode; 
end;

procedure PopBack(var D: TDeque; var Value: Integer);
var
  Temp: ^TNode; 
begin
  if D.Back <> nil then 
  begin
    Temp := D.Back; 
    Value := Temp^.Value; 

    D.Back := D.Back^.Prev; 

    if D.Back <> nil then
      D.Back^.Next := nil 
    else
      D.Front := nil; 

    Dispose(Temp); // Освобождаем память, занятую временным узлом
  end;
end;

begin

  InitDeque(Deque); 
  Write('Введите количество чисел для записи: '); 
  ReadLn(Count);
  AssignFile(InputFile, 'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\МДК 05.02 Сергеева\Лаб 15,16,17\ВВОД.txt'); 
  Rewrite(InputFile); 
  for I := 1 to Count do 
  begin
    Write('Введите число ', I, ': '); 
    ReadLn(Number); 
    PushBack(Deque, Number); 
    WriteLn(InputFile, Number); 
  end;

  CloseFile(InputFile); 
  AssignFile(OutputFile, 'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\МДК 05.02 Сергеева\Лаб 15,16,17\ВЫВОД.txt'); 
  Rewrite(OutputFile); 

  for I := Count downto 1 do // вывод чисел в обратном порядке
  begin
    PopBack(Deque, Number); // Извлекаем число из конца дека
    WriteLn(OutputFile, Number); // Записываем число в выходной файл
  end;

  CloseFile(OutputFile); 

  WriteLn('Числа успешно записаны и выведены в обратном порядке.'); 

end.
