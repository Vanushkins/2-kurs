var
  i,indmax,indmin,max,min:integer;
  f1,f2: file of integer;
  arr: array[1..10] of integer;
  begin
  randomize;
  assign(f1,'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\лаб 13\задание 6 input.txt');
  assign(f2,'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\лаб 13\задание 6 output.txt');
  rewrite(f1);
  for i:=1 to 10 do 
    begin
    arr[i]:=random(50);
    write(f1, arr[i]);
    end;
  writeln('Изначальный массив: ', arr);
  rewrite(f2);
  indmax:=0; indmin:=0;
  max:=arr[1]; min:=arr[1];
  for i:=1 to 10 do
  begin
    if arr[i] > max then
      begin
      max:=arr[i];
      indmax:=i;
      end;
    if arr[i] < min then
      begin
      min:=arr[i];
      indmin:=i;
      end
  end;
  if indmax=0 then
    indmax+=1;
  if indmin=0 then
    indmin+=1;
  arr[indmax]:= min;
  arr[indmin]:= max;
  writeln('Ответ: ', arr);
  for i:=1 to 10 do
  begin
    write(f2,arr[i]);
  end;
  close(f1);
  close(f2);
  end.