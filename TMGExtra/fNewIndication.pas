unit fNewIndication;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  uTypes;

type
  TfrmNewIndication = class(TForm)
    lblNewIndication: TLabel;
    edtNewIndication: TEdit;
    lblNewICD: TLabel;
    edtNewICDCode: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure edtNICD9Change(Sender: TObject);
    procedure edtNewIndicationChange(Sender: TObject);
  private
    { Private declarations }
    function ValidInput: boolean;
    procedure CheckValidity;
    function GetIndication : string;
    function GetIndicationCode : string;

  public
    { Public declarations }
    property NewIndication_Text : string read GetIndication;
    property NewIndication_Code : string read GetIndicationCode;
  end;

//var
//  frmNewIndication: TfrmNewIndication;

implementation

{$R *.dfm}

procedure TfrmNewIndication.FormShow(Sender: TObject);
begin
  CheckValidity;
end;

function TfrmNewIndication.ValidInput: boolean;
begin
  Result := (Trim(edtNewIndication.Text) <> '')
            and (Length(edtNewIndication.Text) > 30)
            and (Trim(edtNewICDCode.Text) <> '');
end;

procedure TfrmNewIndication.CheckValidity;
begin
  btnOK.Enabled := ValidInput;
end;

function TfrmNewIndication.GetIndication : string;
begin
  Result := edtNewIndication.Text;
end;

function TfrmNewIndication.GetIndicationCode : string;
begin
  Result := edtNewICDCode.Text;
end;

procedure TfrmNewIndication.edtNICD9Change(Sender: TObject);
begin
  CheckValidity;
end;


procedure TfrmNewIndication.edtNewIndicationChange(Sender: TObject);
begin
  edtNewIndication.Color := VALID_COLOR[Length(edtNewIndication.Text) <= 30];
  CheckValidity;
end;

end.

































