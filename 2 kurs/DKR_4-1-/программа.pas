uses GraphABC;

function f(x: Real): Real;
begin
   f := x*x*x - 2*x*x + 4*x + 17; 
end;

procedure levPram(a, b, n: real; var plosh, pogr: Real);
var
    h, x, sum: Real;
    i: Integer;
begin
    h := (b - a) / n; // Ширина прямоугольника
    sum := 0;
    for i := 0 to trunc(n) - 1 do
    begin
        x := a + i * h;
        sum := sum + f(x);
    end;
    plosh := sum * h;
    pogr := abs(plosh - (f(b) + f(a)) * (b - a) / 2); // оценка погрешности
end;

var
    a, b, k, Sh: Real;
    n: Integer;
    menu: Char;
    plosh, pogr: Real; 
    x0, y0, x, y, x_next, height: Integer; 
    x1, y1: Real;
    firstPoint: Boolean;

begin
    SetWindowSize(1200, 800);
    
    repeat
        writeln('Меню:');
        writeln('1. Вычислить площадь фигуры');
        writeln('2. Визуализация');
        writeln('3. Выход');
        readln(menu);
        
        case menu of
            '1':
            begin          
                writeln('Введите нижний предел интегрирования (a): ');
                readln(a);
                writeln('Введите верхний предел интегрирования (b): ');
                readln(b);
                writeln('Введите количество подынтервалов: ');
                readln(n);
                
                levPram(a, b, n, plosh, pogr); 
                writeln('Площадь фигуры: ', plosh:0:6); 
                writeln('Оценка погрешности: ', pogr:0:6); 
            end;

            '2':
            begin              
                writeln('Введите нижний предел интегрирования (a): ');
                readln(a);
                writeln('Введите верхний предел интегрирования (b): ');
                readln(b);
                writeln('Введите количество подынтервалов: ');
                readln(n);
                writeln('Введите масштаб (k -от 5 до 30): ');
                readln(k);
                
                levPram(a, b, n, plosh, pogr); 
                clearwindow;
                
                x0 := 100; // Центр графика
                y0 := 700; // Центр графика
                line(10, y0, 1190, y0); // Горизонтальная ось
                line(x0, 10, x0, 690); // Вертикальная ось
                
                // Рисуем график функции
                x1 := a;
                firstPoint := True;

                while x1 <= b do
                begin 
                    y1 := f(x1);
                    x := x0 + round(x1 * k);
                    y := y0 - round(y1 * k);
                    SetPixel(x, y, clRed);
                    
                    if not firstPoint then
                        LineTo(x, y)
                    else
                    begin
                        MoveTo(x, y);
                        firstPoint := False;
                    end;
                    
                    x1 := x1 + 0.01; // Шаг для рисования функции
                end;

                // Штриховка области
                Sh := (b - a) / n;
                x1 := a;
                
                while x1 < b do
                begin 
                    y1 := f(x1);
                    x := x0 + round(x1 * k);
                    y := y0 - round(y1 * k);
                    x_next := x0 + round((x1 + Sh) * k); 
                    height := y0 - round(f(x1 + Sh) * k);
                    
                    // Рисуем прямоугольники
                    SetBrushColor(clBlue);
                    Rectangle(x, y, x_next, y0);
                    
                    x1 := x1 + Sh; // Переход к следующему прямоугольнику
                end;

                // Подписи осей
                SetBrushColor(clWhite); 
                TextOut(1150, y0 + 5, 'X'); // Подпись оси X
                TextOut(x0 + 5, 20, 'Y'); // Подпись оси Y

                writeln('Площадь фигуры: ', plosh:0:6);
                writeln('Оценка погрешности: ', pogr:0:6); 
                Sleep(5000); // Пауза для просмотра
            end;

            '3':
            begin
                writeln('Вы завершили работу.'); 
                Sleep(1000);
                CloseWindow;
            end;
            
            else
                writeln('Неверный выбор. Попробуйте снова.');
        end;

    until menu = '3';
end.
