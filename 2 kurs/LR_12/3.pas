var
  f:text;
  S:string;
begin
  assign(f,'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\лаб 12\задание 3.txt');
  append(f);
  writeln('Введите строку ');
  readln(S);
  write(f,S,',');
  close(f);
end.