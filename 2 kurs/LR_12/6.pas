program zadanie6;
var
  inputFile, outputFile: TextFile;
  line: string;
begin
  AssignFile(inputFile, 'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\лаб 12\Задание 6 input.txt');
  AssignFile(outputFile, 'C:\Users\1\OneDrive\Рабочий стол\2 курс ИСП\Основы алгаритмизации и программирования\лаб 12\Задание 6 Output.txt');
 
    reset(inputFile);
    rewrite(outputFile);
    
    while not EOF(inputFile) do
    begin
      ReadLn(inputFile, line);
      
      if Trim(line) <> '' then
        WriteLn(outputFile, line); 
    end;

 
    CloseFile(inputFile);
    CloseFile(outputFile);
  
  Writeln('Пустые строки удалены. Результат записан в output.txt');
end.
