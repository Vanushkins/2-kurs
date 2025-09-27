program qq;
uses GraphABC,M;
var xa,ya,xb,yb,depth:integer;  
procedure dvizh(a:integer);
begin
  case a of
    VK_Up:
      begin
        ya:=ya-5;
        yb:=yb-5;
      end;
    VK_Down:
      begin
        ya:=ya+5;
        yb:=yb+5;
      end;
    VK_Left:
      begin
        xa:=xa-5;
        xb:=xb-5;
      end;
    VK_Right:
      begin
        xa:=xa+5;
        xb:=xb+5;
      end;
  end;
  Window.Clear;
end;
procedure glub(b:integer); 
begin
  case b of
    VK_w:depth:=depth+1;
    VK_s:depth:=depth-1;
  end;
  Window.Clear;
end;
procedure maschtab(c:char);
begin
  case c of
  'd':
  begin
    xa-=10;
    xb+=10;
  end;
  'a':
  begin
  xa+=10;
  xb-=10;
  end;
end;
Window.Clear;
end;
begin
  LockDrawing;
  setwindowsize(600,800);
  xa:=100;
  ya:=400;
  xb:=500;
  yb:=400;
  depth:=2;
  repeat
Window.Clear;
      fractal(xa,ya,xb,yb,depth);
      onKeyDown :=dvizh;  
      onKeyUp := glub;
      onKeyPress:=maschtab;
    redraw;
sleep(1);
  until false;
end.