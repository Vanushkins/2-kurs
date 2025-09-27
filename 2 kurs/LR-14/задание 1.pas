program one;
var a:integer;
function cifra(a:integer):integer; // параметризация
begin
if a>=0 then // база рекурсии
begin
  writeln(a);
end;
if a>0 then
begin
  a:=cifra(a-2); // декомпозиция
  end;
  end;
begin
  a:=25;
  cifra(a);
end.