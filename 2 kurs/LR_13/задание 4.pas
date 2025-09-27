var
  i,sum:integer;
  f1,f2: file of integer;
  arr: array[1..10] of integer;
  begin
  randomize;
  assign(f1,'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\лаб 13\задание 4 input.txt');
  assign(f2,'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\лаб 13\задание 4 output.txt');
  rewrite(f1);
  for i:=1 to 10 do 
    begin
    arr[i]:=random(50);
    write(f1, arr[i]);
    end;
  writeln('Изначальный массив: ', arr);
  rewrite(f2);
  sum:=0;
  for i:=1 to 10 do
  begin
    if arr[i] mod 2 = 0 then
      sum+=arr[i]
  end;
  write(f2, sum);
  writeln('Сумма чётных: ', sum);
  close(f1);
  close(f2);
  end.