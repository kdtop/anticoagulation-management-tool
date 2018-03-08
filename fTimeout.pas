unit fTimeout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ORFn, VA508AccessibilityManager;

type
  TfrmTimeout = class(TForm)
    Label1: TStaticText;
    Label2: TStaticText;
    cmdContinue: TButton;
    lblCount: TStaticText;
    timCountDown: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure cmdContinueClick(Sender: TObject);
    procedure timCountDownTimer(Sender: TObject);
  private
    { Private declarations }
    FContinue: Boolean;
    FCount: Integer;
  end;

function AllowTimeout: Boolean;
function CountDown: integer;

implementation

{$R *.DFM}

function AllowTimeout: Boolean;
var
  frmTimeout: TfrmTimeout;
begin
  frmTimeout := TfrmTimeout.Create(Application);
  try
    ResizeFormToFont(TForm(frmTimeout));
    frmTimeout.ShowModal;
    Result := not frmTimeout.FContinue;
  finally
    frmTimeout.Release;
  end;
end;

function CountDown: integer;
begin
  result := 20;
end;

procedure TfrmTimeout.FormCreate(Sender: TObject);
begin
  inherited;
  Application.Restore;
  Application.BringToFront;
  MessageBeep(MB_ICONASTERISK);
  FCount := CountDown;
  lblCount.Caption := IntToStr(FCount);
end;

procedure TfrmTimeout.cmdContinueClick(Sender: TObject);
begin
  inherited;
  FContinue := True;
  Close;
end;

procedure TfrmTimeout.timCountDownTimer(Sender: TObject);
begin
  inherited;
  if FCount = CountDown then
  begin
    MessageBeep(MB_ICONASTERISK);
    timCountDown.Enabled  := False;
    timCountDown.Interval := 1000;
    timCountDown.Enabled  := True;
  end;
  Dec(FCount);
  lblCount.Caption := IntToStr(FCount);
  if FCount = 0 then
  begin
    timCountDown.Enabled := False;
    Close;
  end;
end;

end.
