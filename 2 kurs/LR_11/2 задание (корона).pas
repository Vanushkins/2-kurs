uses GraphABC;
begin
  
  SetPenColor(clwhite);
  lineto(320,300);
  SetPenColor(clblack);
  lineto(160,75);
  lineto(200,300);
  lineto(200,300);
  lineto(440,300);
  lineto(480,75);
  lineto(320,300);
  circle(160,75,25);
  circle(480,75,25);
  moveto(320,50);
  lineto(360,300);
  lineto(280,300);
  lineto(320,50);
  circle(320,50,25);
  FloodFill(480,75,clgreen);
  FloodFill(160,75,clblue);
  FloodFill(320,50,clred);
  FloodFill(320,100,clred);
  FloodFill(201,299,clblue);
  FloodFill(439,299,clgreen);
  FloodFill(318,299,clred);
  FloodFill(324,299,clred);
end.