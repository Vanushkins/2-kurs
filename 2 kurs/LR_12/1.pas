var
   filetext: text;
   a:string;
   i:integer;
begin
assign(filetext,'c:\text.txt');
rewrite(filetext);
for i:=1 to 10 do
    append(filetext);
reset(filetext);
close(filetext);
end.