program six;
procedure fib(a, b: integer); // параметризация
begin
  if a + b <= 21 then  // база рекурсии
  begin
    writeln(a + b, ' ');
    fib(b, a + b);  // декомпозиция
  end;
end;
begin
  fib(0, 1); 
end.
