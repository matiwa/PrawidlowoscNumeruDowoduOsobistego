program PrawidlowoscNumeruDowoduOsobistego;
uses
SysUtils;

var
wartosciZnakow: array[0..35] of Char =
('0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
'U', 'V', 'W', 'X', 'Y', 'Z');

function przypiszWartoscDoLiter(znak: Char): Integer;
var
i: Integer;
begin
result := -1;
for i:=low(wartosciZnakow) to high(wartosciZnakow) do
if znak = wartosciZnakow[i] then
begin
result := i;
break;
end;
end;

var
numerDowoduOsobistego: String;
i, sumaKontrolna: Integer;

begin

writeln('1. Nie uzywaj spacji, myslnikow itp.');
writeln('2. Pisz tylko duze litery!');
writeln();
write('Podaj numer dowodu osobistego: ');
readln(numerDowoduOsobistego);

if length(numerDowoduOsobistego) <> 9 then
begin
writeln('Dlugosc numeru dowodu osobistego '+numerDowoduOsobistego+' jest nieprawidlowa!');
readln();
exit;
end;

for i:=1 to 3 do
if przypiszWartoscDoLiter(numerDowoduOsobistego[i]) < 10 then
begin
writeln('Seria dowodu osobistego '+numerDowoduOsobistego+' jest nieprawidlowa!');
readln();
exit;
end;
for i:=4 to 9 do
if (przypiszWartoscDoLiter(numerDowoduOsobistego[i]) < 0) or (przypiszWartoscDoLiter(numerDowoduOsobistego[i]) > 9) then
begin
writeln('Numer dowodu osobistego'+numerDowoduOsobistego+' jest nieprawidlowy!');
readln();
exit;
end;

sumaKontrolna := 7 * przypiszWartoscDoLiter(numerDowoduOsobistego[1]);
sumaKontrolna := sumaKontrolna + 3 * przypiszWartoscDoLiter(numerDowoduOsobistego[2]);
sumaKontrolna := sumaKontrolna + 1 * przypiszWartoscDoLiter(numerDowoduOsobistego[3]);
sumaKontrolna := sumaKontrolna + 7 * przypiszWartoscDoLiter(numerDowoduOsobistego[5]);
sumaKontrolna := sumaKontrolna + 3 * przypiszWartoscDoLiter(numerDowoduOsobistego[6]);
sumaKontrolna := sumaKontrolna + 1 * przypiszWartoscDoLiter(numerDowoduOsobistego[7]);
sumaKontrolna := sumaKontrolna + 7 * przypiszWartoscDoLiter(numerDowoduOsobistego[8]);
sumaKontrolna := sumaKontrolna + 3 * przypiszWartoscDoLiter(numerDowoduOsobistego[9]);
sumaKontrolna := sumaKontrolna mod 10;

if sumaKontrolna <> przypiszWartoscDoLiter(numerDowoduOsobistego[4]) then
writeln('Numer dowodu osobistego '+numerDowoduOsobistego+' jest niepoprawny')
else
writeln('Numer dowodu osobistego '+numerDowoduOsobistego+' jest poprawny');
readln();
end.
