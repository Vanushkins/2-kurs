unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,Unit2,
  Grids;

type

  { TBdForma }

  TBdForma = class(TForm)
    Dobavit: TButton;
    Redctirovat: TButton;
    Del: TButton;
    Sort: TButton;
    SG: TStringGrid;
    procedure DelClick(Sender: TObject);
    procedure DobavitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RedctirovatClick(Sender: TObject);
    procedure SortClick(Sender: TObject);
  private

  public

  end;
 type
  Sotrudnic = record
    Name: string[100];
    Telephon: string[20];
    DataBirthday:TDateTime;
    Dolznost: string[50];
    Udalenno: boolean;
  end;

var
  BdForma: TBdForma;
  adres: string; //адрес, откуда запущена программа

implementation

{$R *.lfm}

{ TBdForma }



procedure TBdForma.DobavitClick(Sender: TObject);
begin
  RedSotrudnik.sName.Text:= '';
  RedSotrudnik.sNomer.Text:= '';
  RedSotrudnik.ModalResult:= mrNone;
  RedSotrudnik.ShowModal;
  if (RedSotrudnik.sName.Text= '') or (RedSotrudnik.sNomer.Text= '') then exit;
  if RedSotrudnik.ModalResult <> mrOk then exit;
  SG.RowCount:= SG.RowCount + 1;
  SG.Cells[0, SG.RowCount-1]:= RedSotrudnik.sName.Text;
  SG.Cells[1, SG.RowCount-1]:= RedSotrudnik.sNomer.Text;
  SG.Cells[2, SG.RowCount-1]:= RedSotrudnik.Dolznost.Text;
  SG.Cells[3, SG.RowCount-1]:= RedSotrudnik.DataBirthday.Text;
  if RedSotrudnik.Udalenno.Checked then
  SG.Cells[4, SG.RowCount-1] := 'Да'
else
  SG.Cells[4, SG.RowCount-1] := 'Нет';
end;

procedure TBdForma.DelClick(Sender: TObject);
begin
  //если данных нет - выходим:
  if SG.RowCount = 1 then exit;
  //иначе выводим запрос на подтверждение:
  if MessageDlg('Требуется подтверждение',
                'Вы действительно хотите удалить контакт "' +
                SG.Cells[0, SG.Row] + '"?',
      mtConfirmation, [mbYes, mbNo, mbIgnore], 0) = mrYes then
         SG.DeleteRow(SG.Row);
end;


procedure TBdForma.FormClose(Sender: TObject; var CloseAction: TCloseAction);
  var
  MyCont: Sotrudnic; //для очередной записи
  f: file of Sotrudnic; //файл данных
  i: integer; //счетчик цикла
begin
  //если строки данных пусты, просто выходим:
  if SG.RowCount = 1 then exit;
  //иначе открываем файл для записи:
  try
    AssignFile(f, adres + 'sotrudniki.dat');
    Rewrite(f);
    //теперь цикл - от первой до последней записи сетки:
    for i:= 1 to SG.RowCount-1 do begin
      //получаем данные текущей записи:
      MyCont.Name:= SG.Cells[0, i];
      MyCont.Telephon:= SG.Cells[1, i];
      MyCont.Dolznost:= SG.Cells[2, i];
      MyCont.DataBirthday := StrToDate(SG.Cells[3, i]);
      MyCont.Udalenno := (SG.Cells[4, i] = 'Да'); // Если в таблице "Да"/"Нет"
      //записываем их:
      Write(f, MyCont);
    end;
  finally
    CloseFile(f);
  end;
end;

procedure TBdForma.FormCreate(Sender: TObject);
  var
    MyCont: Sotrudnic;
    f: file of Sotrudnic;
begin
     adres:= ExtractFilePath(ParamStr(0));
  //настроим сетку:
  SG.Cells[0, 0]:= 'ФИО';
  SG.Cells[1, 0]:= 'Телефон';
  SG.Cells[2, 0]:= 'Должность';
  SG.Cells[3, 0]:= 'Дата Рождения';
  SG.Cells[4, 0]:= 'Работает Удаленно';
  SG.ColWidths[0]:= 200;
  SG.ColWidths[1]:= 110;
  SG.ColWidths[2]:= 120;
  SG.ColWidths[3]:= 130;
  SG.ColWidths[4]:= 190;
  if not FileExists(adres + 'sotrudniki.dat') then exit;
   try
    AssignFile(f, adres + 'sotrudniki.dat');
    Reset(f);
     while not Eof(f) do begin
      //считываем новую запись:
      Read(f, MyCont);
      //добавляем в сетку новую строку, и заполняем её:
      SG.RowCount := SG.RowCount + 1;
     SG.Cells[0, SG.RowCount-1]:= MyCont.Name;
     SG.Cells[1, SG.RowCount-1]:= MyCont.Telephon;
     SG.Cells[2, SG.RowCount-1]:= MyCont.Dolznost;
     SG.Cells[3, SG.RowCount-1] := DateToStr(MyCont.DataBirthday);
    if MyCont.Udalenno then
        SG.Cells[4, SG.RowCount-1] := 'Да'
      else
        SG.Cells[4, SG.RowCount-1] := 'Нет';
    end;
  finally
    CloseFile(f); // Точка с запятой обязательна
  end;
end;

procedure TBdForma.RedctirovatClick(Sender: TObject);
begin
   if SG.RowCount = 1 then exit;
   RedSotrudnik.sName.Text:= SG.Cells[0, SG.Row];
   RedSotrudnik.sNomer.Text:= SG.Cells[1, SG.Row];
   RedSotrudnik.Dolznost.Text:= SG.Cells[2, SG.Row];
   RedSotrudnik.DataBirthday.Text:= SG.Cells[3, SG.Row];
   RedSotrudnik.Udalenno.Checked := (SG.Cells[4, SG.Row] = 'Да');
   RedSotrudnik.ModalResult:= mrNone;
   RedSotrudnik.ShowModal;
   if RedSotrudnik.ModalResult = mrOk then begin
    SG.Cells[0, SG.RowCount-1]:= RedSotrudnik.sName.Text;
    SG.Cells[1, SG.RowCount-1]:= RedSotrudnik.sNomer.Text;
    SG.Cells[2, SG.RowCount-1]:= RedSotrudnik.Dolznost.Text;
    SG.Cells[3, SG.RowCount-1]:= RedSotrudnik.DataBirthday.Text;
  if RedSotrudnik.Udalenno.Checked then
     SG.Cells[4, SG.RowCount-1] := 'Да'
else
    SG.Cells[4, SG.RowCount-1] := 'Нет';
end;
end;

procedure TBdForma.SortClick(Sender: TObject);
begin
  //если данных в сетке нет - просто выходим:
  if SG.RowCount = 1 then exit;
  //иначе сортируем список:
  SG.SortColRow(true, 0);
end;


end.

