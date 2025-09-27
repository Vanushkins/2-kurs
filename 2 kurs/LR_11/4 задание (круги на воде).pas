uses GraphABC;
var r,x,y: integer;
begin
x := 320;  
y := 200;
r := 100;  
while r <> 10 do
  begin   
   circle(x,y,r);
   r -= 10
  end;
end.