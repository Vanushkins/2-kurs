program q;
var a: array of integer;
nechet: array of integer;
koll,i,index,sum:integer;
begin
  write('Введите количество элементов в массиве: ');
  readln(koll);
  SetLength(a,koll);
  i:=0;
  while i<= koll-1 do
    begin
    readln(a[i]);
    i:=i+1;
    end;
index:=0;
SetLength(nechet,0);
while index<=koll-1 do
begin
  if index mod 2 = 0 then
    begin
    index:= index+1;
    continue;
    end
  else
    begin
      SetLength(nechet, Length(nechet) + 1);
      nechet[High(nechet)]:= a[index];
      index:=index+1;
    end;
  end;
sum:=0;
i:=0;
while i<=Length(nechet)-1 do
begin
  sum:=sum + nechet[i];
  i:=i+1;
  end;
write('Сумма элементов расположенных на нечётных позициях= ',sum);
end.