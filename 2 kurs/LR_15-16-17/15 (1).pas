type
  TStudent = record
    FIO: string;        // Ф.И.О.
    Birth: string;     // Дата рождения
    Kurs: Integer;     // Курс 
  end;

var
  student: TStudent;

begin
  Write('Введите Ф.И.О.: ');
  ReadLn(student.FIO);
  
  Write('Введите дату рождения (дд.мм.гггг): ');
  ReadLn(student.Birth);
  
  Write('Введите курс (1-5): ');
  ReadLn(student.Kurs);
  
  
  WriteLn('Ф.И.О.: ', student.FIO);
  WriteLn('Дата рождения: ', student.Birth);
  WriteLn('Курс: ', student.Kurs);
end.
