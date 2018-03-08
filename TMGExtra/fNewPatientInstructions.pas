unit fNewPatientInstructions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmNewPatientInstructions = class(TForm)
    pnlNewPt: TPanel;
    memNewPtInst: TMemo;
    lblNewPtInst: TStaticText;
    btnClose: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmNewPatientInstructions: TfrmNewPatientInstructions;

implementation

{$R *.dfm}

procedure TfrmNewPatientInstructions.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmNewPatientInstructions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;  //should cause it to free itself.
end;

end.
