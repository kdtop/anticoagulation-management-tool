unit fSignItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ORFn, ORCtrls, ExtCtrls, Hash;

type
  TfrmSignItem = class(TForm)
    txtESCode: TEdit;   //Was TCaptionEdit with Caption = 'Signature Code'
    lblESCode: TLabel;
    cmdOK: TButton;
    cmdCancel: TButton;
    lblText: TMemo;
    ckbAddCosigner: TCheckBox;   //kt added
    procedure cmdOKClick(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
  private
    function GetCosignerWanted : boolean;
    procedure Initialize(AText, ACaption: string);
  public
    ESCode: string;
    { Public declarations }
    function ShowModal(AText, ACaption: string) : integer;  overload;
    property CosignerWanted : boolean read GetCosignerWanted;
  end;

procedure SignatureForItem(FontSize: Integer; const AText, ACaption: string; var VESCode: string);

implementation

{$R *.DFM}
uses
  rRPCs;  //kt added 11/15

const
  TX_INVAL_MSG = 'Not a valid electronic signature code.  Enter a valid code or press Cancel.';
  TX_INVAL_CAP = 'Unrecognized Signature Code';


procedure SignatureForItem(FontSize: Integer; const AText, ACaption: string; var VESCode: string);
var
  frmSignItem: TfrmSignItem;
begin
  frmSignItem := TfrmSignItem.Create(Application);
  try
    ResizeAnchoredFormToFont(frmSignItem);
    with frmSignItem do begin
      ESCode := '';
      Caption := ACaption;
      lblText.Text := AText;
      txtESCode.Text := '';
      ShowModal;
      VESCode := ESCode;
    end;
  finally
    frmSignItem.Release;
  end;
end;

procedure TfrmSignItem.cmdOKClick(Sender: TObject);
begin
  if not ValidESCode(txtESCode.Text) then begin
    InfoBox(TX_INVAL_MSG, TX_INVAL_CAP, MB_OK);
    txtESCode.SetFocus;
    txtESCode.SelectAll;
    Exit;
  end;
  ESCode := Encrypt(txtESCode.Text);
  ModalResult := mrOK; //will effect closing form
  //Close;
end;

procedure TfrmSignItem.cmdCancelClick(Sender: TObject);
begin
  ESCode := '';
  ModalResult := mrCancel; //will effect closing form.
  //Close;
end;

function TfrmSignItem.GetCosignerWanted : boolean;
begin
  Result := ckbAddCosigner.Checked;
end;

procedure TfrmSignItem.Initialize(AText, ACaption: string);
begin
  ESCode := '';
  lblText.Text := AText;
  Caption := ACaption;
  txtESCode.Text := '';
end;


function TfrmSignItem.ShowModal(AText, ACaption: string) : integer;
begin
  Initialize(AText, ACaption);
  Result := ShowModal;
end;




end.
