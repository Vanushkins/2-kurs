program two;
function sumTo(n: integer): integer; // параметризация
begin
  if n <= 0 then // база рекурсии
    sumTo := 0
  else
    sumTo := n + sumTo(n - 1); // декомпозиция
end;
var
  n: integer;
begin
  Write('Введите n: ');
  ReadLn(n);
  WriteLn('Сумма чисел от 1 до ', n, ' равна: ', sumTo(n));
  ReadLn;
end.
