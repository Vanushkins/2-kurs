unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TKalculator }

  TKalculator = class(TForm)
    Sloz_SumAndNachPr: TEdit;
    Pr_SumAndNachPr: TEdit;
    Informacia: TMemo;
    Poschitat: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Clean: TButton;
    Pr_Amortizacia: TEdit;
    Sloz_Amortizacia: TEdit;
    Nachalnaya: TEdit;
    Procent: TEdit;
    Period: TEdit;
    procedure CleanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure PoschitatClick(Sender: TObject);
  private

  public

  end;

var
  Kalculator: TKalculator;

implementation

{$R *.lfm}

{ TKalculator }

procedure TKalculator.Label4Click(Sender: TObject);
begin

end;

procedure TKalculator.PoschitatClick(Sender: TObject);
Var Na,Pr,Per,SumPr,SumSl, AmortPr,AmortSl,a,ProcentA:double;
  i,perInt: integer;
begin
  Na:=StrToFloatDef(Nachalnaya.Text,0);
  Pr:=StrToFloatDef(Procent.Text,0);
  Per:=StrToFloatDef(Period.Text,0);
  SumPr:= Na*(1+(Pr/100 * Per));
  SumSl:= Na * Power(1 + Pr / 100, Per);
  AmortPr:= Na-((Na*Pr*Per) / 100);
  AmortSl:= Na * Power(1 - Pr / 100, Per);
  Pr_SumAndNachPr.Text:=FloatToStr(SumPr);
  Sloz_SumAndNachPr.Text:=FloatToStr(SumSl);
  Pr_Amortizacia.Text:=FloatToStr(AmortPr);
  Sloz_Amortizacia.Text:=FloatToStr(AmortSl);
    if (Na = 0) or (Pr = 0) or (Per = 0) then
  begin
    ShowMessage('Введите числа в поля!');
    Exit;
  end;
    perInt:= StrToInt(Period.Text);
    ProcentA:= (Na*Pr)/100;
    a := Na;
    Informacia.Lines.Add('Рассчёт простого процента по годам:');
    for i := 1 to PerInt do
     begin
       a:= a + ProcentA;
       Informacia.Lines.Add('Год '+FloatToStr(i)+' = '+FloatToStr(a));
     end;
    Informacia.Lines.Add(''); // Пустая строка для разделения
Informacia.Lines.Add('Рассчёт сложного процента по годам:');
a := Na; // Сбрасываем значение к начальной сумме
for i := 1 to PerInt do
begin
  a := a * (1 + Pr/100);
  Informacia.Lines.Add('Год '+FloatToStr(i)+' = '+FloatToStr(a));
end;
end;

procedure TKalculator.FormCreate(Sender: TObject);
begin

end;

procedure TKalculator.CleanClick(Sender: TObject);
begin
  Sloz_SumAndNachPr.Text:= '';
  Pr_SumAndNachPr.Text:= '';
  Pr_Amortizacia.Text:= '';
  Sloz_Amortizacia.Text:= '';
  Nachalnaya.Text:= '';
  Procent.Text:= '';
  Period.Text:= '';
  Informacia.clear;
end;

end.

