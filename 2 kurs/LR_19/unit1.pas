unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,Math,
  Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure StaticText1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var A,B,C,D,E,F,p:double;
begin
  A:= StrToInt(Edit1.Text);
  B:= StrToInt(Edit2.Text);
  p:= 3.14;
  C:= Sqrt(p/A);
  D:= Sqrt(Sqrt(A+B)/(Power(A,A)+Power(B,B)));
  E:= A*Power(B,3);
  F:= C*D-E;
  memo1.Lines.add('Ответ: '+ FloatToStr(F));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   Edit2.Visible:= False;
   Label2.Visible:= False;
   Button1.Visible:=False;
   Button4.Visible:=True;
   memo1.Clear;
   Edit1.Clear;
   Edit2.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Edit2.Visible:= True;
Label2.Visible:= True;
Button1.Visible:=True;
Button4.Visible:=False;
memo1.Clear;
Edit1.Clear;
end;

procedure TForm1.Button4Click(Sender: TObject);
Var S,a,d,p,S1: double;
begin
   S:= StrToInt(Edit1.Text);
   a:= Sqrt(S);
   d:= a*Sqrt(2);
   p:=3.14;
   S1:=(p*power(d,2)/4);
   memo1.Lines.add('Сторона квадрата= '+ FloatToStr(a)+ ' Диагональ= '+FloatToStr(d)+ ' Площадь круга= '+ FloatToStr(S1));
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.StaticText1Click(Sender: TObject);
begin

end;

end.

