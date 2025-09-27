uses GraphABC;
var x:integer;
begin
x:=50;
while x <> 290 do
  begin
  circle(x,100,10);
  setbrushcolor(clrandom);
  SetPenColor(rgb(random(256), random(256), random(256)));
  x += 30
  end;  
end.