uses GraphABC;
var x,y,r: integer;
begin
x := 50;
y := 50;
r := 10;
  while ((x <> 370) and (y <> 370) and (r <> 90)) do 
   begin
   Circle(x,y,r);
   setbrushcolor(clrandom);
   SetPenColor(rgb(random(256), random(256), random(256)));
   x += 40;
   y += 40;
   r += 10;
   end;
end.

