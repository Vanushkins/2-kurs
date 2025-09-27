function A (const s: string): Boolean;
var
  i: Integer;
begin
  if Length(s) = 0 then
    Exit;

  if not (s[1] in ['a'..'z', 'A'..'Z', '_']) then
    Exit;

  for i := 2 to Length(s) do
  begin
    if not (s[i] in ['a'..'z', 'A'..'Z', '0'..'9', '_']) then
      Exit;
  end;

  Result := True;
end;

var
  input: string;

begin
  Write('Введите строку: ');
  ReadLn(input);

  if A (input) then
    WriteLn('Строка допустима.')
  else
    WriteLn('Строка содержит недопустимые символы.');
end.


