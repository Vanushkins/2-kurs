uses GraphABC;

const
  Size = 8; // Размер доски
  CellSize = 50; // Размер клетки

var
  i, j: integer;
  x, y: integer;

begin
  for i := 0 to Size - 1 do //проходит по строкам
  begin
    for j := 0 to Size - 1 do //проходит по столбцам
    begin
      x := j * CellSize; 
      y := i * CellSize; 

      if (i + j) mod 2 = 0 then
      begin
        SetBrushColor(clBlack); 
      end
      else
      begin
        SetBrushColor(clWhite); 
      end;
      FillRectangle(x, y, x + CellSize, y + CellSize);
    end;
  end;


end.