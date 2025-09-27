program zadanie5;
var
  Inp, Out: TextFile;
  n, min, max: integer;
begin
  assignfile(Inp, 'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\лаб 12\задание 5 input.txt');
  reset(Inp);
  readln(Inp, n);
  min := n;
  max := n;
  while not eof(Inp) do
  begin
    readln(Inp, n);
    if n < min then
      min := n;
    if n > max then
      max := n;
  end;
  closefile(Inp);
  assignfile(Out, 'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\лаб 12\задание 5 output.txt');
  rewrite(Out);
  writeln(Out, 'Максимальное число: ', max);
  writeln(Out, 'Минимальное число: ', min);
  closefile(Out);
end.