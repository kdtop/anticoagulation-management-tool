unit fxBroker;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DateUtils, ORNet, ORFn, ComCtrls, Buttons, ExtCtrls,
  ORCtrls, ORSystem, VA508AccessibilityManager;

type
  TfrmBroker = class(TForm)
    pnlTop: TORAutoPanel;
    lblMaxCalls: TLabel;
    txtMaxCalls: TCaptionEdit;
    cmdPrev: TBitBtn;
    cmdNext: TBitBtn;
    udMax: TUpDown;
    memData: TRichEdit;
    btnRLT: TButton;
    amgrMain: TVA508AccessibilityManager;
    lblCallID: TVA508StaticText;
    procedure cmdPrevClick(Sender: TObject);
    procedure cmdNextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRLTClick(Sender: TObject);
  private
    { Private declarations }
    FRetained: Integer;
    FCurrent: Integer;
  public
    { Public declarations }
  end;

procedure ShowBroker;
function HasSecurityKey(const KeyName: string): Boolean;

implementation

uses
  VA508AccessibilityRouter;

{$R *.DFM}

procedure ShowBroker;
var
  frmBroker: TfrmBroker;
begin
  frmBroker := TfrmBroker.Create(Application);
  try
    ResizeAnchoredFormToFont(frmBroker);
    with frmBroker do
    begin
      FRetained := RetainedRPCCount - 1;
      FCurrent := FRetained;
      LoadRPCData(memData.Lines, FCurrent);
      memData.SelStart := 0;
      lblCallID.Caption := 'Last Call Minus: ' + IntToStr(FRetained - FCurrent);
      lblCallID.TabStop := ScreenReaderSystemActive;
      ShowModal;
    end;
  finally
    frmBroker.Release;
  end;
end;

function HasSecurityKey(const KeyName: string): Boolean;
{ returns true if the currently logged in user has a given security key }
var
  x: string;
begin
  Result := False;
  x := sCallV('ORWU HASKEY', [KeyName]);
  if x = '1' then Result := True;
end;

procedure TfrmBroker.cmdPrevClick(Sender: TObject);
begin
  FCurrent := HigherOf(FCurrent - 1, 0);
  LoadRPCData(memData.Lines, FCurrent);
  memData.SelStart := 0;
  lblCallID.Caption := 'Last Call Minus: ' + IntToStr(FRetained - FCurrent);
end;

procedure TfrmBroker.cmdNextClick(Sender: TObject);
begin
  FCurrent := LowerOf(FCurrent + 1, FRetained);
  LoadRPCData(memData.Lines, FCurrent);
  memData.SelStart := 0;
  lblCallID.Caption := 'Last Call Minus: ' + IntToStr(FRetained - FCurrent);
end;

procedure TfrmBroker.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetRetainedRPCMax(StrToIntDef(txtMaxCalls.Text, 5))
end;

procedure TfrmBroker.FormResize(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmBroker.FormCreate(Sender: TObject);
begin
  udMax.Position := GetRPCMax;
end;

procedure TfrmBroker.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Key := 0;
    Close;
  end;
end;

procedure TfrmBroker.btnRLTClick(Sender: TObject);
var
  startTime, endTime: tDateTime;
  diffDisplay: string;
  theDiff: integer;
  isProgrammer: Boolean;
const
  TX_KEY  = 'XUPROGMODE';
  disclaimer = 'NOTE: Strictly relative indicator:';
begin
  // Check time lapse between a standard RPC call:
  startTime := now;
  isProgrammer :=  HasSecurityKey(TX_KEY);
  endTime := now;
  theDiff := milliSecondsBetween(endTime, startTime);
  diffDisplay := intToStr(theDiff);
  if not isProgrammer then
    InfoBox('How''d you get in here, anyway?!', 'It''s a Miracle!', MB_OK);

  // Show the results:
  InfoBox('Lapsed time (milliseconds) = ' + diffDisplay + '.', disclaimer, MB_OK);
end;

end.
