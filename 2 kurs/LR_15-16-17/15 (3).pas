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

begin
  Write('Введите количество игрушек (макс. ', MaxToys, '): ');
  ReadLn(count);
  
  if count > MaxToys then
    count := MaxToys;

  for i := 1 to count do
  begin
    with toys[i] do
    begin
      Write('Введите название товара (', i, '): ');
      ReadLn(name);
      
      Write('Введите цену товара (', i, '): ');
      ReadLn(price);
      
      Write('Введите возрастной диапазон (', i, '): ');
      ReadLn(age);
    end;
  end;

  WriteLn('Данные о игрушках:');
  for i := 1 to count do
  begin
    with toys[i] do
    begin
      WriteLn('Игрушка ', i, ':');
      WriteLn('Название: ', name);
      WriteLn('Цена: ', price:0:2);
      WriteLn('Возрастной диапазон: ', age);
    end;
  end;
end.
