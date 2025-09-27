var
  i,j,q:integer;
  f1,f2,f3: file of integer;
  arr,arrch,arrnch: array[1..10] of integer;
  begin
  randomize;
  assign(f1,'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\лаб 13\задание 3.txt');
  assign(f2,'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\лаб 13\задание 3 четные позиции.txt');
  assign(f3,'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\лаб 13\задание 3 нечетные.txt');
  rewrite(f1);
  for i:=1 to 10 do 
    begin
    arr[i]:=random(50);
    write(f1, arr[i]);
    end;
  writeln('Изначальный массив: ', arr);
  rewrite(f2);
  rewrite(f3);
  j:=1;
  q:=1;
  for i:=1 to 10 do
  begin
    if arr[i] mod 2 = 0 then
    begin
      write(f2,arr[i]);
      arrch[j]:=arr[i];
      j+=1;
    end
    else
      begin
      write(f3,arr[i]);
      arrnch[q]:=arr[i];
      q+=1;
      end;
  end;
  writeln('Чётные: ',arrch);
   writeln('Нечётные: ',arrnch);
   close(f1);
   close(f2);
   close(f3);
  end.