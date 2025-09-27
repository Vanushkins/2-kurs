uses graphABC;
var a,x1,x2,x3,y1,y2:integer;

procedure square(x,y:integer);
begin
setbrushcolor(clBlack);
rectangle(x-a,y-a,x+a,y+a);
end;
var x,y:integer;
begin
setwindowsize(400,400);
a:=20;//половина стороны квадрата
x1:=a;//левая точка траектории
x2:=windowwidth div 2;//средняя точка
x3:=windowwidth-a;//правая точка
y1:=windowheight-a;//низ траектории
y2:=a; 
x:=x1;//ставим квадрат в левую нижнюю точку
y:=y1;
while x<=x2 do //движемся от точки  к точке 2
 begin
  clearwindow; 

  square(x,y);
  sleep(5); //задержка
  x:=x+1; //на 1 вправо
  y:=y-2;//на 2 вверх
  redraw; //перерисовываем
 end;
while x<=x3 do//движемся от точки 2 к точке 3
 begin
  clearwindow;

  square(x,y);
  sleep(20);
  x:=x+1;//1 вправо
  y:=y+2;//на 2 вниз
  redraw;
 end;
end.