program five;
function gcd(a, b: integer): integer; // параметризация
begin
  if b = 0 then // база рекурсии
    gcd := a
  else // декомпозиция
    gcd := gcd(b, a mod b);
end;
var
  a, b: integer;
begin
  a := 3430;
  b := 1365;
  writeln('НОД(', a, ',', b, ') = ', gcd(a, b));
  readln;
end.
