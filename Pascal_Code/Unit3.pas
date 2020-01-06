unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFormP = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormP: TFormP;

implementation

{$R *.DFM}

procedure TFormP.Button1Click(Sender: TObject);
begin
 formp.hide;
end;

end.
