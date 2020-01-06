program Project1;

uses
  Forms,
  Unitct in 'Unitct.pas' {Form1},
  Unit2 in 'UNIT2.PAS' {Form2},
  Unit3 in 'Unit3.pas' {FormP},
  Unit4 in 'Unit4.pas' {FormAbout};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Mini CT';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TFormP, FormP);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
