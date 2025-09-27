program WordFrequencyList;

type
    PNode = ^TNode; // Указатель на узел
    TNode = record  // Структура узла
        Word: string;
        Frequency: Integer;
        Next: PNode; // Указатель на следующий узел
    end;

var
    Head: PNode;    // Указатель на начало списка
    InputWord: string;
    Found: Boolean;
    Current: PNode;

// Процедура для добавления слова в список
procedure AddWord(const NewWord: string);
var
    NewNode: PNode;
begin
    Found := False;
    Current := Head;

    // Проверяем, есть ли слово уже в списке
    while Current <> nil do
    begin
        if Current^.Word = NewWord then
        begin
            Current^.Frequency := Current^.Frequency + 1; // Увеличиваем частоту
            Found := True;
            Break;
        end;
        Current := Current^.Next; // Переход к следующему узлу
    end;

    // Если слово не найдено, добавляем его в список
    if not Found then
    begin
        New(NewNode); // Создаем новый узел
        NewNode^.Word := NewWord;
        NewNode^.Frequency := 1;
        NewNode^.Next := Head; // Добавляем новый узел в начало списка
        Head := NewNode;        // Обновляем голову списка
    end;
end;

// Процедура для вывода списка
procedure PrintList;
begin
    Current := Head;
    while Current <> nil do
    begin
        WriteLn(Current^.Word, ': ', Current^.Frequency);
        Current := Current^.Next; // Переход к следующему узлу
    end;
end;

// Процедура для освобождения памяти
procedure FreeList;
var
    Temp: PNode;
begin
    while Head <> nil do
    begin
        Temp := Head;       // Запоминаем текущий узел
        Head := Head^.Next; // Переходим к следующему узлу
        Dispose(Temp);      // Освобождаем память текущего узла
    end;
end;

begin
    Head := nil; // Инициализируем список как пустой

    WriteLn('Введите текст (для завершения введите "exit"):');

    repeat
        ReadLn(InputWord);
        if InputWord <> 'exit' then
            AddWord(LowerCase(InputWord)); // Добавляем слово в список
    until InputWord = 'exit';

    WriteLn('Алфавитно-частотный словарь:');
    PrintList; // Выводим список

    FreeList; // Освобождаем память
end.