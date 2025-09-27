unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
   close;
end;

procedure TForm1.Button1Click(Sender: TObject);
var a,b,h:double;
  c,d:double;
begin
  A:=StrToInt(Edit1.Text);
  B:=StrToInt(Edit2.Text);
  h:=StrToInt(Edit3.Text);
  while A<=B do
  begin
    C:=A;
    D:= power(A,2);
    memo1.Lines.add('A= '+FloatToStr(C)+' B= '+FloatToStr(D));
    A+=h;
    end;
end;

end.

