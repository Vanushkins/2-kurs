type
  PNode = ^TNode; // Объявление указателя на узел
  TNode = record
    Data: integer;
    Next: PNode; // Указатель на следующий узел
  end;
var
  Head, Current: PNode; // Указатель на голову списка, указатель для текущего узла при обходе списка
  i, Value: integer;
begin
  Head := nil;
  for i := 1 to 10 do
  begin
    New(Current); // Выделение памяти для нового узла
    write('Введите элемент ', i, ': ');
    readln(Value); 
    Current^.Data := Value; // Заполнение данными
    Current^.Next := Head; // Указатель на предыдущий элемент
    Head := Current; // Обновление головы списка
  end;
  writeln('Список чисел:');
  Current := Head; // Начинаем с головы списка
  while Current <> nil do
  begin
    writeln(Current^.Data); 
    Current := Current^.Next; // Переход к следующему узлу
  end;
  writeln; 
  writeln('Четные элементы списка:');
  Current := Head; // Снова начинаем с головы списка
  while Current <> nil do
  begin
    if Current^.Data mod 2 = 0 then // Проверка на четность
      writeln(Current^.Data); 
    Current := Current^.Next; // Переход к следующему узлу
  end;
  // Освобождение памяти 
  Current := Head;
  while Current <> nil do
  begin
    Head := Current^.Next; // Сохранение следующего узла
    Dispose(Current); // Освобождение памяти текущего узла
    Current := Head; // Переход к следующему узлу
  end;
end.