unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unitct;

{$R *.dfm}

procedure TForm2.ListBox1Click(Sender: TObject);
var
 i : integer;
begin
 i := listbox1.ItemIndex;
 form1.tracenumber.value := pins[0,i,0];
 form1.sweepstep.value := pins[0,i,1];

end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  form1.buttonmulti.click;
end;




end.
