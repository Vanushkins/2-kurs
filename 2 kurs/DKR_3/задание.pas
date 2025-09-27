program matodLevPram;
var
  menu: integer;
  a, b, n, plosh, pogr: real;
function f(x: real): real;
begin
  f := x*x*x - 2*x*x + 4*x + 17;
end;

procedure levPram(a, b, n: real; var plosh, pogr: real);
var
  h, x, sum: real;
  i: integer;
begin
  h := (b - a) / n; // Ширина прямоугольника
  sum := 0;
  for i := 0 to trunc(n) -1 do
  begin
    x := a + i * h;
    sum := sum + f(x);
  end;
  plosh := sum * h;
  pogr := abs(plosh - (f(b) + f(a))*(b - a) / 2); // оценка погрешности
end;
begin
  repeat
    writeln('Меню:');
    writeln('1. Вычислить площадь');
    writeln('2. Выход');
    write('Введите ваш выбор: ');
    readln(menu);
    case menu of
      1:
        begin
          write('Введите левую границу интегрирования (a): ');
          readln(a);
          write('Введите правую границу интегрирования (b): ');
          readln(b);
          write('Введите количество прямоугольников (n): ');
          readln(n);
          plosh:=0;
          pogr:=0;
          levPram(a, b, n,plosh,pogr);
          writeln('Площадь фигуры: ', plosh:0:4);
          writeln('Оценка погрешности: ', pogr:0:4);
        end;
      2: writeln('Программа завершена.');
      else writeln('Неверный выбор.');
    end;
  until menu = 2;
end.
