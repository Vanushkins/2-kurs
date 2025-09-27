type
  TToy = record
    name: string;   
    price: Real;    
    age: string;    
  end;

const
  MaxToys = 10; 

var
  toys: array[1..MaxToys] of TToy;
  i, count: Integer;
  toyFile: file;

begin
  Write('Введите количество игрушек (макс. ', MaxToys, '): ');
  ReadLn(count);
  
  if count > MaxToys then
    count := MaxToys;

  for i := 1 to count do
  begin
    Write('Введите название товара (', i, '): ');
    ReadLn(toys[i].name);
    
    Write('Введите цену товара (', i, '): ');
    ReadLn(toys[i].price);
    
    Write('Введите возрастной диапазон (', i, '): ');
    ReadLn(toys[i].age);
  end;

  AssignFile(toyFile, 'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\МДК 05.02 Сергеева\Лаб 15,16,17\игрушки.txt');
  Rewrite(toyFile);
  
  for i := 1 to count do
  begin
    Write(toyFile, toys[i]);
  end;

  CloseFile(toyFile);
 
  AssignFile(toyFile, 'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\МДК 05.02 Сергеева\Лаб 15,16,17\игрушки.txt');
  Reset(toyFile);
  
  WriteLn('Данные о игрушках из файла:');
  
  i := 1;
  while not EOF(toyFile) and (i <= MaxToys) do
  begin
    Read(toyFile, toys[i]);
    
    WriteLn('Игрушка ', i, ':');
    WriteLn('Название: ', toys[i].name);
    WriteLn('Цена: ', toys[i].price:0:2);
    WriteLn('Возрастной диапазон: ', toys[i].age);
    
    Inc(i);
  end;

  CloseFile(toyFile);
end.
