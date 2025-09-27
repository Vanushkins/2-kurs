program three;
var x, y: integer;
function stepen(a, b: integer): integer; // параметризация
begin
  if b = 0 then // база рекурсии
    stepen := 1
  else if b > 0 then // декоспозиция
    stepen := a * stepen(a, b - 1)
  else // декоспозиция
    stepen := 1 div a * stepen(1 div a, -b); //для отрицательной степени
end;
begin
  writeln('Число?');
  readln(x);
  writeln('Степень?');
  readln(y);
  writeln(stepen(x, y));
end.
