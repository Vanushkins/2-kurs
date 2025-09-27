type
  TStudent = record
    FIO: string;        // Ф.И.О.
    Birth: string;     // Дата рождения
    Kurs: Integer;     // Курс (значения 1..5)
  end;

var
  student: TStudent;
  n: Integer;

begin
  Write('Какое кол-во студентов вы хотите внести: ');
  ReadLn(n);
  
  while n <> 0 do begin 
    
  Write('Введите Ф.И.О.: ');
  ReadLn(student.FIO);
  
  Write('Введите дату рождения (дд.мм.гггг): ');
  ReadLn(student.Birth);
  
  Write('Введите курс (1-5): ');
  ReadLn(student.Kurs);
  
  
  WriteLn('Студент(ка) ', student.FIO, ' родился ', student.Birth, ', а в данный момент учиться на ', student.Kurs, ' курсе');
  n -= 1;
  end;

end.
