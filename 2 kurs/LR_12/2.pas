var 
  filetext:text;
  a,b,N,K:integer;
  i:integer;
begin
  assign(filetext,'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\лаб 12\задание 2.txt');
  rewrite(filetext);
  writeln('Введите количество строк');
  readln(N);
  writeln('Введите количество символов ');
  readln(K);
  a:=0;
  b:=0;
  while a<N do
  begin
    while b<K do
    begin
      write(filetext,'*');
      b:=b+1;
    end;
    writeln(filetext);
    b:=0;
    a:=a+1;
  end;
  close(filetext);
end.