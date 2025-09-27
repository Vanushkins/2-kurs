uses GraphABC;
begin
  Circle(100, 200, 100);
  FloodFill(100, 200, clred);
  Circle(500, 200, 100);
  FloodFill(500, 200, clyellow);
  MoveTo(200, 200);
  LineTo(400, 200);
  LineTo(300, 100);
  LineTo(200, 200);
  FloodFill(300, 150, clblue);
  MoveTo(200, 200);
  LineTo(300, 300);
  LineTo(400, 200);
  FloodFill(300, 250, clLime);
end.