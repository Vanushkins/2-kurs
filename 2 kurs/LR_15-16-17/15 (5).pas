var
  years: Integer;
  ending: string;
  oneYear, twoToFourYears, fiveToNineYears, tenToTwentyYears: set of 0..99;

begin
  oneYear := [1];
  twoToFourYears := [2, 3, 4];
  fiveToNineYears := [5, 6, 7, 8, 9];
  tenToTwentyYears := [10, 11, 12, 13, 14, 15, 16, 17, 18, 19];

  Write('Введите количество лет: ');
  ReadLn(years);

  if (years mod 100) in oneYear then
    ending := 'год'
  else if (years mod 100) in twoToFourYears then
    ending := 'года'
  else if (years mod 100) in tenToTwentyYears then
    ending := 'лет'
  else if (years mod 10) in oneYear then
    ending := 'год'
  else if (years mod 10) in twoToFourYears then
    ending := 'года'
  else
    ending := 'лет';

  WriteLn(years, ' ', ending);
end.
