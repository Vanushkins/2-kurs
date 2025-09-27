Unit M;
uses graphabc;
var xa,xb,ya,yb,depth:integer;
procedure fractal(x1,y1,x2,y2:real;depth:integer);//параметризация
var
  dx,dy,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7,x8,y8,x9,y9:real;
begin
  if depth=0 then//база
    line(round(x1),round(y1),round(x2),round(y2))
  else
  begin
    dx:=(x2-x1)/4;
    dy:=(y2-y1)/4;
    x3:=x1+dx;
    y3:=y1+dy;
    x4:=x3+dy;
    y4:=y3-dx;
    x5:=x4+dx;
    y5:=y4+dy;
    x6:=x5-dy;
    y6:=y5+dx;
    x7:=x6-dy;
    y7:=y6+dx;
    x8:=x7+dx;
    y8:=y7+dy;
    x9:=x8+dy;
    y9:=y8-dx;
    
    fractal(x3,y3,x4,y4,depth-1);//декомпозиция
    fractal(x1,y1,x3,y3,depth-1);//Декомпозиция
    fractal(x4,y4,x5,y5,depth-1);//дек
    fractal(x5,y5,x6,y6,depth-1);//дек
    fractal(x6,y6,x7,y7,depth-1);//дек
    fractal(x7,y7,x8,y8,depth-1);//дек
    fractal(x8,y8,x9,y9,depth-1);//дек
    fractal(x9,y9,x2,y2,depth-1);//дек
  end;
end;
begin
 fractal(xa,ya,xb,yb,depth); 
end.
