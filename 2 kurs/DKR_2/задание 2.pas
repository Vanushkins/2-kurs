program w;
var lst:array of string;
lst2:array of string;
indexSlova,index,index2,koll,count,count2:integer;
maxPovtorSlova,a:string;
begin
  writeln('Введите количество слов: ');
  readln(koll);
  SetLength(lst,koll);
  writeln('Введите слова через Enter');
  for index:=0 to koll-1 do
    readln(lst[index]); 
lst2:=lst;
index:=0;
index2:=0;
count:=0;
count2:=0;
while index<=length(lst)-1 do
begin
  while index2<=length(lst)-1 do
  begin
    if lst[index]=lst2[index2] then
    begin
      count2:=count2+1;
      if count2>count then
        begin
        indexSlova:=index2;
        end;
      index2:=index2+1;
      end
    else index2:=index2+1;
    end;
    index2:=0;
    index:=index+1;
    if count2>count then
      count:=count2;
      count2:=0;
  end;
  if count=1 then
  begin
    writeln('Ни одно слово не повторяется :(');
  end
  else writeln('Самое повторяющееся слово: ','"',lst[indexSlova],'"','.','Количество повторений= ',count);
end.