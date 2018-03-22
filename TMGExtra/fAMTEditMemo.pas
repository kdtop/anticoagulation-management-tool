unit fAMTEditMemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmAMTEditMemo = class(TForm)
    pnlBottom: TPanel;
    btnCancel: TBitBtn;
    btnDone: TBitBtn;
    memMemo: TMemo;
    btnClear: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ShowModal(SourceSL : TStrings) : integer; overload;
  end;

//var
//  frmAMTEditMemo: TfrmAMTEditMemo;

implementation

{$R *.dfm}


procedure TfrmAMTEditMemo.btnClearClick(Sender: TObject);
begin
  memMemo.Clear;
end;

procedure TfrmAMTEditMemo.FormShow(Sender: TObject);
begin
  memMemo.SetFocus;
end;

function TfrmAMTEditMemo.ShowModal(SourceSL : TStrings) : integer;
begin
  memMemo.Lines.Assign(SourceSL);
  Result := Self.ShowModal();
end;


end.
