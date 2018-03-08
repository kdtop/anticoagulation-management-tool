unit fCompletedVisitLetter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Vcl.ComCtrls, Vcl.Buttons, uFlowsheet,
  ORCtrls, ORFn, ORNet, Trpcb, StrUtils, System.UITypes,
  uTypes, uHTMLTools, TMGHTML2;

type
  TfrmCompletedVisitLetter = class(TForm)
    pnlHTMLColorBorder: TPanel;
    pcLetterType: TPageControl;
    tsDocStartMgmt: TTabSheet;
    tsDocInterval: TTabSheet;
    tsDocMissedAppt: TTabSheet;
    tsDocDischarge: TTabSheet;
    pnlDocStart: TPanel;
    pnlDocInterval: TPanel;
    pnlDocMissedAppt: TPanel;
    pnlDocDischarge: TPanel;
    rgMedsChanged: TRadioGroup;
    gbxInstructions: TGroupBox;
    lblHoldDays: TLabel;
    lblTabsToday: TLabel;
    ckbHold: TCheckBox;
    edtNumHoldDays: TEdit;
    ckbTake: TCheckBox;
    edtTakeNumTabsToday: TEdit;
    pnlBottom: TPanel;
    btnCancel: TBitBtn;
    btnDone: TBitBtn;
    lblNewAppt: TLabel;
    lblNAppt: TLabel;
    lblMADt: TLabel;
    dtpMissedAppt: TDateTimePicker;
    ckbPtMovedAway: TCheckBox;
    ckbPtViolatedAgreement: TCheckBox;
    ckbPtDC: TCheckBox;
    edtPtDCdByName: TEdit;
    lblDCOn: TLabel;
    dtpDC: TDateTimePicker;
    lblDCFor: TLabel;
    edtPtMovedAway: TEdit;
    edtDCReason: TEdit;
    memComments2: TMemo;
    lblComments: TLabel;
    Label1: TLabel;
    memComments1: TMemo;
    Label2: TLabel;
    memComments3: TMemo;
    Label3: TLabel;
    memComments4: TMemo;
    btnMemClear1: TButton;
    btnMemClear2: TButton;
    btnMemClear3: TButton;
    btnMemClear4: TButton;
    btnPrint: TBitBtn;
    pnlHTMLObjHolder: TPanel;
    pnlBtnBorder: TPanel;
    btnRegenerate: TBitBtn;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckbTakeClick(Sender: TObject);
    procedure ckbHoldClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgMedsChangedClick(Sender: TObject);
    procedure edtTakeNumTabsTodayChange(Sender: TObject);
    procedure edtNumHoldDaysChange(Sender: TObject);
    procedure dtpMissedApptChange(Sender: TObject);
    procedure btnRegenerateClick(Sender: TObject);
    procedure ckbPtMovedAwayClick(Sender: TObject);
    procedure ckbPtViolatedAgreementClick(Sender: TObject);
    procedure ckbPtDCClick(Sender: TObject);
    procedure dtpDCChange(Sender: TObject);
    procedure edtDCReasonChange(Sender: TObject);
    procedure edtPtMovedAwayChange(Sender: TObject);
    procedure tsDocMissedApptShow(Sender: TObject);
    procedure memComments1Exit(Sender: TObject);
    procedure memComments4Exit(Sender: TObject);
    procedure memComments3Exit(Sender: TObject);
    procedure memComments2Exit(Sender: TObject);
    procedure btnMemClearClick(Sender: TObject);
    procedure edtPtDCdByNameChange(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure memCommentsChange(Sender: TObject);
    procedure pcLetterTypeChange(Sender: TObject);
  private
    { Private declarations }
    FAppState : TAppState;
    FFlowsheet : TOneFlowsheet;  //for convenience
    FPushingOutData : boolean;
    FAutoDCClick : boolean;
    Changed : boolean;
    procedure Initialize;
    procedure GenerateNote;
    procedure DataToGUI;
    procedure PullInstructionsData;
    procedure PullDCInfo;
    procedure DataToMemComments;
    procedure SetModifiedStatus(Modified : boolean);
  public
    { Public declarations }
    HtmlEditor : THtmlObj;
    function ShowModal(AppState : TAppState; AFlowsheet : TOneFlowsheet) : integer; overload;
  end;

//var
//  frmCompletedVisitLetter: TfrmCompletedVisitLetter;

implementation

{$R *.dfm}

uses uTMGMods, uUtility;

const
  VALID_COLOR : array[false..true] of TColor = (clInvalid, clWindow);

procedure TfrmCompletedVisitLetter.GenerateNote;
begin
  //Later add a check if user has edited note, and if so warn about losing changes.
  if pcLetterType.ActivePage = tsDocStartMgmt then begin
    GenerateIntakeNote(FAppState, FFlowsheet, HtmlEditor);
  end else if pcLetterType.ActivePage = tsDocInterval then begin
    GenerateInterimNote(FAppState, FFlowsheet, HtmlEditor);
  end else if pcLetterType.ActivePage = tsDocMissedAppt then begin
    GenerateMissedApptNote(FAppState, FFlowsheet, HtmlEditor);
  end else if pcLetterType.ActivePage = tsDocDischarge then begin
    GenerateDCNote(FAppState, FFlowsheet, HtmlEditor);
  end;
end;

procedure TfrmCompletedVisitLetter.DataToGUI;
const
  MEDS_CHANGED_INDEX : array[false..true] of integer = (1, 0);
begin
  FPushingOutData := true;
  FAutoDCClick := false;
  DataToMemComments;
  SetModifiedStatus(False);

  //Tab 1
  if assigned(tsDocStartMgmt.PageControl) then begin
    //none
  end;

  //Tab 2
  if assigned(tsDocInterval.PageControl) then begin
    //NOTE: Control 'tsDocInterval' has no parent window error below
    rgMedsChanged.ItemIndex := MEDS_CHANGED_INDEX[FFlowsheet.DosingEdited];
    edtNumHoldDays.Text := FFlowsheet.DocsHoldNumOfDays;
    ckbHold.Checked := (FFlowsheet.DocsHoldNumOfDays <> '');
    edtTakeNumTabsToday.Text := FFlowsheet.DocsTakeNumTabsToday;
    ckbTake.Checked := (FFlowsheet.DocsTakeNumTabsToday <> '');
  end;

  //Tab 3
  if assigned(tsDocMissedAppt.PageControl) then begin
    dtpMissedAppt.DateTime := FAppState.AppointmentNoShowDate;
    lblNAppt.Caption := DateToStr(FAppstate.Patient.NextScheduledINRCheckDate);
  end;

  //Tab 4
  if assigned(tsDocDischarge.PageControl) then begin
    ckbPtMovedAway.Checked := FFlowsheet.DocsPtMoved;
    edtPtMovedAway.Text := FFlowsheet.DocsPtTransferTo;
    edtPtMovedAway.Enabled := FFlowsheet.DocsPtMoved;
    ckbPtViolatedAgreement.Checked := FAppState.Patient.ViolatedAgreement;
    dtpDC.DateTime := IfThenDT(FAppState.Patient.DischargedDate <> 0, FAppState.Patient.DischargedDate, Now);
    edtDCReason.Text := FAppState.Patient.DischargedReason;
  end;

  FPushingOutData := false;
end;

procedure TfrmCompletedVisitLetter.dtpDCChange(Sender: TObject);
begin
  if FPushingOutData then exit;
  FAppState.Patient.DischargedDate := dtpDC.DateTime;
end;

procedure TfrmCompletedVisitLetter.dtpMissedApptChange(Sender: TObject);
begin
  if FPushingOutData then exit;
  FAppState.AppointmentNoShowDate := dtpMissedAppt.DateTime;
  SetModifiedStatus(True);
end;

procedure TfrmCompletedVisitLetter.Initialize;
var
  PC_FOR_TS_STATE : array[false..true] of TPageControl;
begin
  PC_FOR_TS_STATE[false] := nil;
  PC_FOR_TS_STATE[true]  := pcLetterType;
  tsDocStartMgmt.PageControl  := PC_FOR_TS_STATE[FAppState.Patient.NewPatient];
  tsDocInterval.PageControl   := PC_FOR_TS_STATE[not FAppState.Patient.NewPatient];
  tsDocMissedAppt.PageControl := PC_FOR_TS_STATE[FAppState.AppointmentShowStatus = tsvNoShow];
  tsDocDischarge.PageControl  := PC_FOR_TS_STATE[not FAppState.Patient.NewPatient or FAppState.Patient.DischargedFromClinic];
  Application.ProcessMessages;

  if FAppState.Patient.DischargedFromClinic then begin
    pcLetterType.ActivePage := tsDocMissedAppt;
  end else if Assigned(tsDocMissedAppt.PageControl) then begin
    pcLetterType.ActivePage := tsDocMissedAppt;
  end else if Assigned(tsDocInterval.PageControl) then begin
    pcLetterType.ActivePage := tsDocInterval;
  end else if Assigned(tsDocStartMgmt.PageControl) then begin
    pcLetterType.ActivePage := tsDocStartMgmt;
  end;
  DataToGUI;
  GenerateNote;
end;

procedure TfrmCompletedVisitLetter.memCommentsChange(Sender: TObject);
begin
  btnMemClear1.Visible := true;
  btnMemClear2.Visible := true;
  btnMemClear3.Visible := true;
  btnMemClear4.Visible := true;
  SetModifiedStatus(True);
end;

procedure TfrmCompletedVisitLetter.memComments1Exit(Sender: TObject);
begin
  FFlowsheet.PatientInstructions.Assign(memComments1.Lines);
  DataToMemComments;
end;

procedure TfrmCompletedVisitLetter.memComments2Exit(Sender: TObject);
begin
  FFlowsheet.PatientInstructions.Assign(memComments2.Lines);
  DataToMemComments;
end;

procedure TfrmCompletedVisitLetter.memComments3Exit(Sender: TObject);
begin
  FFlowsheet.PatientInstructions.Assign(memComments3.Lines);
  DataToMemComments;
end;

procedure TfrmCompletedVisitLetter.memComments4Exit(Sender: TObject);
begin
  FFlowsheet.PatientInstructions.Assign(memComments4.Lines);
  DataToMemComments;
end;

procedure TfrmCompletedVisitLetter.DataToMemComments;
begin
  if Assigned(tsDocStartMgmt.PageControl)  then memComments1.Lines.Assign(FFlowsheet.PatientInstructions);
  if Assigned(tsDocInterval.PageControl)   then memComments2.Lines.Assign(FFlowsheet.PatientInstructions);
  if Assigned(tsDocMissedAppt.PageControl) then memComments3.Lines.Assign(FFlowsheet.PatientInstructions);
  if Assigned(tsDocDischarge.PageControl)  then memComments4.Lines.Assign(FFlowsheet.PatientInstructions);
end;

procedure TfrmCompletedVisitLetter.pcLetterTypeChange(Sender: TObject);
begin
  SetModifiedStatus(True);
end;

procedure TfrmCompletedVisitLetter.rgMedsChangedClick(Sender: TObject);
const
  MEDS_CHANGED_BOOL : array[-1..1] of boolean = (false, true, false);

begin
  if FPushingOutData then exit;
  FFlowsheet.DosingEdited := MEDS_CHANGED_BOOL[rgMedsChanged.ItemIndex];
  SetModifiedStatus(True);
end;

function TfrmCompletedVisitLetter.ShowModal(AppState : TAppState; AFlowsheet : TOneFlowsheet) : integer;
// It might be that AFlowsheet is not the same as AppState.CurrentNewFlowsheet
begin
  FAppState := AppState;
  FFlowsheet := AFlowsheet;
  Initialize;
  Result := Self.ShowModal;
end;

procedure TfrmCompletedVisitLetter.tsDocMissedApptShow(Sender: TObject);
begin
  if not IsFutureDate(FAppState.Patient.NextScheduledINRCheckDate) then begin
    InfoBox('You must select a future Return Date to create a Missed Appt note.' + CRLF +
            'Close this form, select a return date, then try again.',
            'Invalid Return Date', MB_OK or MB_ICONEXCLAMATION);
    pcLetterType.ActivePage := tsDocInterval;
  end;
end;

procedure TfrmCompletedVisitLetter.PullInstructionsData;
begin
  FFlowsheet.DocsTakeNumTabsToday := IfThenStr(ckbTake.Checked, edtTakeNumTabsToday.Text, '');
  FFlowsheet.DocsHoldNumOfDays := edtNumHoldDays.Text;
end;

procedure TfrmCompletedVisitLetter.btnMemClearClick(Sender: TObject);
begin
  FFlowsheet.PatientInstructions.Clear;
  btnMemClear1.Visible := false;
  btnMemClear2.Visible := false;
  btnMemClear3.Visible := false;
  btnMemClear4.Visible := false;
  DataToMemComments;
end;

procedure TfrmCompletedVisitLetter.btnPrintClick(Sender: TObject);
begin
  HtmlEditor.Print;  //could be HtmlEditor.PrintPreview
end;

procedure TfrmCompletedVisitLetter.btnRegenerateClick(Sender: TObject);
begin
  GenerateNote;
  SetModifiedStatus(False);
end;

procedure TfrmCompletedVisitLetter.ckbHoldClick(Sender: TObject);
begin
  if FPushingOutData then exit;
  FPushingOutData := true;

  SetModifiedStatus(True);
  edtNumHoldDays.Enabled := ckbHold.Checked;
  if not ckbHold.Checked then edtNumHoldDays.Text := '';
  lblHoldDays.Enabled := ckbHold.Checked;
  ckbTake.Checked := false;
  edtTakeNumTabsToday.Text := '';
  edtNumHoldDaysChange(Self);
  edtTakeNumTabsTodayChange(Self);
  FPushingOutData := false;
  PullInstructionsData;
end;

procedure TfrmCompletedVisitLetter.ckbTakeClick(Sender: TObject);
begin
  if FPushingOutData then exit;
  FPushingOutData := true;
  SetModifiedStatus(True);

  edtTakeNumTabsToday.Enabled := ckbTake.Checked;
  if not ckbTake.Checked then edtTakeNumTabsToday.Text := '';
  lblTabsToday.Enabled := ckbTake.Checked;
  ckbHold.Checked := false;
  edtNumHoldDays.Text := '';
  edtNumHoldDaysChange(Self);
  edtTakeNumTabsTodayChange(Self);
  FPushingOutData := false;
  PullInstructionsData;
end;


procedure TfrmCompletedVisitLetter.PullDCInfo;
begin
  SetModifiedStatus(True);
  FFlowsheet.DocsPtMoved := ckbPtMovedAway.Checked;
  FFlowsheet.DocsPtTransferTo := IfThenStr(edtPtMovedAway.Enabled, edtPtMovedAway.Text, '');
  FAppState.Patient.ViolatedAgreement := ckbPtViolatedAgreement.Checked;
  FAppState.Patient.DischargedReason := edtDCReason.Text;
  FAppState.Patient.DischargedDate := IfThenDT(ckbPtDC.Checked, dtpDC.DateTime, 0);
  FAppState.Patient.DischargedReason := IfThenStr(ckbPtDC.Checked, edtDCReason.Text, '');
end;

procedure TfrmCompletedVisitLetter.ckbPtDCClick(Sender: TObject);
begin
  if FPushingOutData then exit;
  if ckbPtDC.Checked and not FAutoDCClick then begin
    if MessageDlg('This will set patient status to DISCHARGED',mtConfirmation, mbOKCancel, 0) <> mrOK then begin
      FPushingOutData := true;
      ckbPtDC.Checked := false;
      FPushingOutData := false;
      exit;
    end;
  end;
  edtPtDCdByName.Enabled := ckbPtDC.Checked;
  edtPtDCdByName.Text := IfThenStr(ckbPtDC.Checked, FAppState.Provider.Name, '');
  lblDCOn.Enabled := ckbPtDC.Checked;
  dtpDC.Enabled := ckbPtDC.Checked;
  lblDCFor.Enabled := ckbPtDC.Checked;
  edtDCReason.Enabled := ckbPtDC.Checked;
  PullDCInfo;
end;

procedure TfrmCompletedVisitLetter.ckbPtMovedAwayClick(Sender: TObject);
begin
  if FPushingOutData then exit;
  edtPtMovedAway.Enabled := ckbPtMovedAway.Checked;
  if ckbPtMovedAway.Checked and not ckbPtDC.checked then begin
    MessageDlg('Since patient has moved away, will also consider discharged.', mtInformation, [mbOK],0);
    if edtDCReason.Text = '' then edtDCReason.Text := 'Moved away';
    FAutoDCClick := true;
    ckbPtDC.Checked := true;  //does this trigger event??
    FAutoDCClick := false;
  end;
  PullDCInfo;
end;

procedure TfrmCompletedVisitLetter.ckbPtViolatedAgreementClick(Sender: TObject);
begin
  if FPushingOutData then exit;
  PullDCInfo;
end;

procedure TfrmCompletedVisitLetter.edtPtDCdByNameChange(Sender: TObject);
begin
  if FPushingOutData then exit;
  PullDCInfo;
end;

procedure TfrmCompletedVisitLetter.edtPtMovedAwayChange(Sender: TObject);
begin
  if FPushingOutData then exit;
  PullDCInfo;
end;

procedure TfrmCompletedVisitLetter.edtDCReasonChange(Sender: TObject);
begin
  if FPushingOutData then exit;
  PullDCInfo;
end;

procedure TfrmCompletedVisitLetter.SetModifiedStatus(Modified : boolean);
const
  BORDER_COLOR : array[false..true] of TColor = (clBtnFace, clInvalid);
  BUTTON_FONT_COLOR : array[false..true] of TColor = (clBlack, clRed);
begin
  Changed := Modified;
  pnlHTMLColorBorder.Color := BORDER_COLOR[Modified];
  pnlBtnBorder.Color := BORDER_COLOR[Modified];
  btnRegenerate.Font.Color := BUTTON_FONT_COLOR[Modified];
end;

procedure TfrmCompletedVisitLetter.edtNumHoldDaysChange(Sender: TObject);
var Valid : boolean;
begin
  Valid := (StrToIntDef(edtNumHoldDays.Text ,-1) <> -1) or (ckbHold.Checked = false);
  SetModifiedStatus(True);
  edtNumHoldDays.Color := VALID_COLOR[Valid];
  if FPushingOutData then exit;
  PullInstructionsData;
end;

procedure TfrmCompletedVisitLetter.edtTakeNumTabsTodayChange(Sender: TObject);
var Valid : boolean;
begin
  Valid := (StrToIntDef(edtTakeNumTabsToday.Text,-1) <> -1) or (ckbTake.Checked = false);
  SetModifiedStatus(True);
  edtTakeNumTabsToday.Color := VALID_COLOR[Valid];
  if FPushingOutData then exit;
  PullInstructionsData;
end;


procedure TfrmCompletedVisitLetter.FormCreate(Sender: TObject);
begin
  HtmlEditor := THtmlObj.Create(pnlHTMLObjHolder, Application);
  TWinControl(HtmlEditor).Parent:= pnlHTMLObjHolder;
  TWinControl(HtmlEditor).Align:=alClient;
  HtmlEditor.Loaded();
  HtmlEditor.HTMLText := '<p>';
  HtmlEditor.Editable := False;
  FPushingOutData := false;
end;

procedure TfrmCompletedVisitLetter.FormDestroy(Sender: TObject);
begin
  HtmlEditor.Free;
end;

procedure TfrmCompletedVisitLetter.FormShow(Sender: TObject);
begin
end;

(*
procedure TfrmAnticoagulate.btnCVLClick(Sender: TObject);
var
  doseit, inrit, NextAppStr: String;
  STab, MTab, TTab, WTab, HTab, FTab, ATab: String;
begin
  if btnCVL.Caption = '&OK' then
  begin
    if (ckbHold.Checked = true) and (edtHDays.Text = '') then
    begin
      InfoBox('Please indicate number of days to hold Warfarin (Coumadin).',
              'Hold Interval Needed', MB_OK or MB_ICONEXCLAMATION);
      exit;
    end;
    if (ckbTake.Checked = true) and ((edtTTabs.Text = '')) then
      InfoBox('Please indicate number of tablets to take for adjustment dose.',
              'Number of Tablets Needed', MB_OK or MB_ICONEXCLAMATION);
    if (ckbHold.Checked = true) and (edtHdays.Text <> '') then
    begin
      MNote := 'Please HOLD (do not take any Warfarin (Coumadin)) as you were directed on ' +
               FormatDateTime('dddddd', Today) + ' and for the next ' +
               IntToStr(StrToInt(edtHDays.Text)-1)+ ' days.  '+#13#10+#13#10+
               'Then continue with the schedule below.'+#13#10;
      MNoteCl := 'Please contact us if you have any questions, concerns, signs of bleeding, or if you need to reschedule this appointment. '+#13#10;
      if StrToInt(edtHDays.Text) = 2 then
        MNote := 'Please HOLD (do not take any Warfarin (Coumadin)) as you were directed on ' +
                  FormatDateTime('dddddd', Today) + ' and the next day.  Then continue with the schedule below.'+#13#10;
      if StrToInt(edtHDays.Text) <= 1 then
        MNote := 'Please HOLD (do not take any Warfarin (Coumadin)) as you were directed on ' +
                  FormatDateTime('dddddd', Today) + '.  Then continue with the schedule below.'+#13#10;
    end;
    if (ckbTake.Checked = true) and (edtTTabs.Text <> '') then
    begin
      MNote := 'Using a ' + cboPS.Text + 'mg tablet please take ' + edtTTabs.Text +
               ' tablets on ' + FormatDateTime('dddddd', Today) +
               '.  Then continue with the schedule below.' + #13#10;
      MNoteCl := 'Remember to let us know if you have missed Warfarin (Coumadin) doses, '+
                 'taken extra Warfarin (Coumadin) doses, or if you need to reschedule this appointment. ' + #13#10;
      //'Please contact us if you have missed any doses of warfarin within the previous 10 days or if you have any questions, concerns, signs of bleeding, or if you need to reschedule this appointment. ' + #13#10;
    end;
    if ckbWS.Checked = true then
    begin
      MNote := 'There is a ***CHANGE*** to your weekly Warfarin (Coumadin) dosing, please see the weekly dosing schedule below.' + #13#10;
      MNoteCl := 'Remember to let us know if you have missed Warfarin (Coumadin) doses, '+
                 'taken extra Warfarin (Coumadin) doses, or if you need to reschedule this appointment. ' + #13#10;
      //'Please contact us if you have missed any doses of warfarin within the previous 10 days or if you have any questions, concerns, signs of bleeding, or if you need to reschedule this appointment. ' + #13#10;
    end;
    memCL.Lines[0] := MNote;

    memCL.Visible := true;
    lblCL.Visible := true;
    btnCVL.Width := 90;
    btnCVL.Left := 125;
    btnCVL.Caption := '&Preview/Print';
  end
  else if btnCVL.Caption = '&Preview/Print' then
  begin
    Instruct := memCL.Text;
    PatientInstructions.Clear;
    PatientInstructions.Add(memCL.Text);

    {//kt implement later ...
    if Piece(edtCTSun.Text,'.',2) = '5' then
    begin
      if Piece(edtCTSun.Text,'.',1) = '0' then
        STab := 'xxx'
      else
        STab := Piece(edtCTSun.Text,'.',1) + 'xxx'   //KT NOTE:  All these 'xxx''s were very very long strings with gibberish.  I think corrupted.
    end
    else if Piece(edtCTSun.Text,'.',2) = '25' then
    begin
      if Piece(edtCTSun.Text,'.',1) = '0' then
        STab := 'xxx'
      else
        STab := Piece(edtCTSun.Text,'.',1) + 'xxx'
    end
    else if Piece(edtCTSun.Text,'.',2) = '75' then
    begin
      if Piece(edtCTSun.Text,'.',1) = '0' then
        STab := 'xxx'
      else
        STab := Piece(edtCTSun.Text,'.',1) + 'xxx'
    end
    else
      STab := edtCTSun.Text;

    // Monday
    if Piece(edtCTMon.Text,'.',2) = '5' then
    begin
      if Piece(edtCTMon.Text,'.',1) = '0' then
        MTab := 'xxx'
      else
        MTab := Piece(edtCTMon.Text,'.',1) + 'xxx'
    end
    else if Piece(edtCTMon.Text,'.',2) = '25' then
    begin
      if Piece(edtCTMon.Text,'.',1) = '0' then edtCTMon.Text := 'xxx.
      else
        MTab := Piece(edtCTMon.Text,'.',1) + 'xxx'
    end
    else if Piece(edtCTMon.Text,'.',2) = '75' then
    begin
      if Piece(edtCTMon.Text,'.',1) = '0' then
        MTab := 'xxx'
      else
        MTab := Piece(edtCTMon.Text,'.',1) + 'xxx'
    end
    else
      MTab := edtCTMon.Text;

    // Tuesday
    if Piece(edtCTTue.Text,'.',2) = '5' then
    begin
      if Piece(edtCTTue.Text,'.',1) = '0' then
        TTab := 'xxx'
      else
        TTab := Piece(edtCTTue.Text,'.',1) + 'xxx'
    end
    else if Piece(edtCTTue.Text,'.',2) = '25' then
    begin
      if Piece(edtCTTue.Text,'.',1) = '0' then
        TTab := 'xxx'
      else
        TTab := Piece(edtCTTue.Text,'.',1) + 'xxx'
    end
    else if Piece(edtCTTue.Text,'.',2) = '75' then
    begin
      if Piece(edtCTTue.Text,'.',1) = '0' then
        TTab := 'xxxx'
      else
        TTab := Piece(edtCTTue.Text,'.',1) + 'xxx'
    end
    else
      TTab := edtCTTue.Text;

    // Wednesday
    if Piece(edtCTWed.Text,'.',2) = '5' then
    begin
      if Piece(edtCTWed.Text,'.',1) = '0' then
        WTab := 'xxx'
      else
        WTab := Piece(edtCTWed.Text,'.',1) + 'xxx'
    end
    else if Piece(edtCTWed.Text,'.',2) = '25' then
    begin
      if Piece(edtCTWed.Text,'.',1) = '0' then
        WTab := 'xxx'
      else
        WTab := Piece(edtCTWed.Text,'.',1) + 'xxx'
    end
    else if Piece(edtCTWed.Text,'.',2) = '75' then
    begin
      if Piece(edtCTWed.Text,'.',1) = '0' then
        WTab := 'xxx'
      else
        WTab := Piece(edtCTWed.Text,'.',1) + 'xxx'
    end
    else
      WTab := edtCTWed.Text;

    // Thursday
    if Piece(edtCTThu.Text,'.',2) = '5' then
    begin
      if Piece(edtCTThu.Text,'.',1) = '0' then
        HTab := 'xxx'
      else
        HTab := Piece(edtCTThu.Text,'.',1) + 'xxx'
    end
    else if Piece(edtCTThu.Text,'.',2) = '25' then
    begin
      if Piece(edtCTThu.Text,'.',1) = '0' then
        HTab := 'xxx'
      else
        HTab := Piece(edtCTThu.Text,'.',1) + 'xxx'
    end
    else if Piece(edtCTThu.Text,'.',2) = '75' then
    begin
      if Piece(edtCTThu.Text,'.',1) = '0' then
        HTab := 'xxx'
      else
        HTab := Piece(edtCTThu.Text,'.',1) + 'xxx'
    end
    else
      HTab := edtCTThu.Text;

    // Friday
    if Piece(edtCTFri.Text,'.',2) = '5' then
    begin
      if Piece(edtCTFri.Text,'.',1) = '0' then
        FTab := 'xxx'
      else
        FTab := Piece(edtCTFri.Text,'.',1) + 'xxx'
    end
    else if Piece(edtCTFri.Text,'.',2) = '25' then
    begin
      if Piece(edtCTFri.Text,'.',1) = '0' then
        FTab := 'xxx'
      else
        FTab := Piece(edtCTFri.Text,'.',1) + 'xxx'
    end
    else if Piece(edtCTFri.Text,'.',2) = '75' then
    begin
      if Piece(edtCTFri.Text,'.',1) = '0' then
        FTab := 'xxx'
      else
        FTab := Piece(edtCTFri.Text,'.',1) + 'xxx'
    end
    else
      FTab := edtCTFri.Text;

    // Saturday
    if Piece(edtCTSat.Text,'.',2) = '5' then
    begin
      if Piece(edtCTSat.Text,'.',1) = '0' then
        ATab := 'xxx'
      else
        ATab := Piece(edtCTSat.Text,'.',1) + 'xxx'
    end
    else if Piece(edtCTSat.Text,'.',2) = '25' then
    begin
      if Piece(edtCTSat.Text,'.',1) = '0' then
        ATab := 'xxx'
      else
        ATab := Piece(edtCTSat.Text,'.',1) + 'xxx'
    end
    else if Piece(edtCTSat.Text,'.',2) = '75' then
    begin
      if Piece(edtCTSat.Text,'.',1) = '0' then
        ATab := 'xxx'
      else
        ATab := Piece(edtCTSat.Text,'.',1) + 'xxx'
    end
    else
      ATab := edtCTSat.Text;
    // END - Fractional Tablet Formatting for Letter.
    } //kt

    if lblINRdt.Caption <> '' then
      inrit := 'Your last INR was ' + lblINRval.Caption + ' taken on ' + FormatDateTime('dddddd', StrToDate(lblINRdt.Caption));
    Doseit := 'Your weekly Warfarin (Coumadin) dose is (using a ' + cboPS.text + ' mg tablet):';
    NextAppStr := FormatDateTime('dddddd', dtpNextApp.DateTime);
    if dtpAppTime.Visible then
      NextAppStr := NextAppStr + ' at ' + FormatDateTime('hh:nn ampm', dtpAppTime.Time);
    case StrToInt(LetterINRTime) of
      0, 1:
        NextAppStr := NextAppStr + '.';
      2:
        NextAppStr := NextAppStr + ' in the morning.';
      3:
        NextAppStr := NextAppStr + ' in the afternoon.';
      4:
        NextAppStr := NextAppStr + ' per Lab procedures as directed.';
    end;
    RvProject.ProjectFile := NetworkPath + 'CVisit.rav';
    With RvProject do
    begin
      open;
      SetParam('Heading1', SiteHead);
      SetParam('siteadr1', SiteAddA);
      SetParam('FAX','FAX:      ' + ClinicFAX);
      if SiteAddB <> '' then
      begin
        SetParam('siteadr2', SiteAddB);
        SetParam('siteadr3', SiteAddC);
      end
      else
        SetParam('siteadr2', SiteAddC);

      SetParam('X', GName);
      SetParam('INR', inrit);
      SetParam('Date', lblINRdt.Caption);
      SetParam('adr1', lblSadr1.Caption);
      SetParam('adr2', lblSadr2.Caption);
      SetParam('adr3', lblSadr3.Caption);
      SetParam('adr4', lblCSZ.Caption);
      SetParam('SUNT', STab);
      SetParam('MONT', MTab);
      SetParam('TUET', TTab);
      SetParam('WEDT', WTab);
      SetParam('THUT', HTab);
      SetParam('FRIT', FTab);
      SetParam('SATT', ATab);
      SetParam('SUNM', lblCMSun.Caption);
      SetParam('MONM', lblCMMon.Caption);
      SetParam('TUEM', lblCMTue.Caption);
      SetParam('WEDM', lblCMWed.Caption);
      SetParam('THUM', lblCMThur.Caption);
      SetParam('FRIM', lblCMFri.Caption);
      SetParam('SATM', lblCMSat.Caption);
      SetParam('addtext', Instruct);
      SetParam('ProvN', ProvName);
      SetParam('TDate', FormatDateTime('mmmm dd, yyyy', Today));
      SetParam('NextAppt', NextAppStr);
      SetParam('MNote', MNoteCl);
      SetParam('Dose', Doseit);
      SetParam('clinic', ClinicName);
      SetParam('phone', ClinicPhone);
      if TollFreePhone <> '' then
        SetParam('TollFreeTag', 'or call Toll-free:')
      else
        SetParam('TollFreeTag', '');
      SetParam('TollFree', TollFreePhone);
      SetParam('sig', SigName);
      SetParam('title', SigTitle);
      ExecuteReport('VComp');
      Close;
      FreeOnRelease;
    end;
    gbxCA.Visible := false;
    ToggleExitVisible(btnCV);
    btnCV.SetFocus;
  end;
end;


*)


(*

procedure TfrmAnticoagulate.GenerateInterimNote;
var
  TabStr: string;
  i: Integer;
  AdvEvents: String;
  DoseMgs: String;
  DoseTabs: String;
  DoseHeader: String;
  FollowVerb, lHCT: String;
begin
  TabStr := '   ';
  if LocationChanged then
    FollowVerb := 'will now'
  else
    FollowVerb := 'continues to';
  IndiText := 'Patient ' + FollowVerb + ' be followed in the ' + SiteName;
  if not (pos('CLINIC', UpperCase(SiteName)) > 0) then
    IndiText := IndiText + ' Clinic.';
  IndiText := IndiText + CRLF + 'Primary Indication: ';
  if AutoPrimaryIndicationText <> '' then
    IndiText := IndiText + AutoPrimaryIndicationText + CRLF +
                '  Add''l Indication: ' + cbxIndic.text + '.' + CRLF
  else
    IndiText := Inditext + cbxIndic.Text + '.' + CRLF;

  TargetT := '  INR Target Range: ' + cbxINRGoal.text;
  SevText := 'Patient was started on Warfarin (Coumadin): ' + edtSDate.Text + '.';
  //dosing info
  DoseHeader := TabStr + TabStr + 'Sun' + TabStr + 'Mon' + TabStr + 'Tue' + TabStr +
               'Wed' + TabStr + 'Thu' + TabStr + 'Fri' + TabStr + 'Sat' + TabStr +
               TabStr + 'Tot';
  {//kt implement later
  DoseTabs := 'tab' + PadString(edtCTSun.Text) + edtCTSun.Text + PadString(edtCTMon.Text) +
              edtCTMon.Text + PadString(edtCTTue.Text) + edtCTTue.Text +
              PadString(edtCTWed.Text) + edtCTWed.Text + PadString(edtCTThu.Text) +
              edtCTThu.Text + PadString(edtCTFri.Text) + edtCTFri.Text +
              PadString(edtCTSat.Text) + edtCTSat.Text + TabStr +
              PadString(edtTotT1.Text) + edtTotT1.Text; //kt TO DO, implement edtTotT2
  DoseMgs := 'mgs' + PadString(edtCMSun.Text) + edtCMSun.Text +
             PadString(edtCMMon.Text) + edtCMMon.Text + PadString(edtCMTue.Text) +
             edtCMTue.Text + PadString(edtCMWed.Text) + edtCMWed.Text +
             PadString(edtCMThu.Text) + edtCMThu.Text + PadString(edtCMFri.Text) +
             edtCMFri.Text + PadString(edtCMSat.Text) + edtCMSat.Text + TabStr +
             PadString(edtTotM.Text) + edtTotM.Text;
  }
  //current INR
  CINR := '       Current INR: ' + lblINRval.caption;
  lHCT := '          Last HCT: ';
  if HGBFlag then
    lHCT := '          Last Hgb: ';

  lHCT := lHCT + lblHCT.Caption + ' on ' + lblHCTDate.Caption;

  //complications
  AdvEvents := Complications();
  fstext := 'To see the anticoagulation flow sheet for this patient, go to the Reports';
  fstexta := 'Tab. Click on Anticoagulation Flowsheet.';
  FTitle := InterimNote;
  lblNBox.Caption := 'Anticoagulation Clinic Note:';
  //build memDCnote text
  memDCnote.Lines.Add(IndiText);
  if ckbIncludeRisksInNote.Checked then
  begin
    memDCnote.Lines.Add(' Secondary Indication(s)/Risks:');
    for i := 0 to memRisk.Lines.Count - 1 do
      memDCnote.Lines.Add('  ' + memRisk.Lines[i]);
  end;
  memDCnote.Lines.Add('');
  memDCnote.Lines.Add(SevText);
  memDCnote.Lines.Add(TargetT);
  memDCnote.Lines.Add(CINR);
  memDCnote.Lines.Add(lHCT);
  memDCnote.Lines.Add(' ');
  //Conditionally include Pt. Instructions from Letter
  if (ckbCAInclInst.Checked or ckbMAInclInst.Checked) and (PatientInstructions.Count > 0) then
  begin
    memDCnote.Lines.Add('Patient Instructions (from Letter):');
    for i := 0 to PatientInstructions.Count - 1 do
      memDCnote.Lines.Add(PatientInstructions[i]);
    memDCNote.Lines.Add(' ');
  end;
  //Conditionally include dosing table
  if ckbTWD.Checked then
  begin
    memDCnote.Lines.Add(' Total Weekly Dose: ' + lblTotM.Caption + ' mg.');
    memDCnote.Lines.Add(' ');
    memDCnote.Lines.Add('Current Dosing is (using a ' + cboPS.Text + ' mg tablet):');
    memDCnote.Lines.Add(DoseHeader);
    memDCnote.Lines.Add(DoseTabs);
    memDCnote.Lines.Add(DoseMgs);
    memDCnote.Lines.Add(' ');
  end;
  //Conditionally include Adverse Event(s)
  if AdvEvents <> '' then
  begin
    memDCNote.Lines.Add('Complication(s):');
    //Add complications to note
    if pos('MB:', AdvEvents) > 0 then
      memDCNote.Lines.Add('  Major Bleed(s):');
    for i := 1 to DelimCount(AdvEvents, '^') do
      if pos('MB:', Piece(AdvEvents, '^', i)) > 0 then
        memDCNote.Lines.Add('    ' + Piece(Piece(AdvEvents, '^', i), ':', 2))
      else if pos('C:', Piece(AdvEvents, '^', i)) = 0 then
        memDCNote.Lines.Add('  ' + Piece(AdvEvents, '^', i));
    //Add comments to note
    if pos('C:', AdvEvents) > 0 then
      memDCNote.Lines.Add('  Comments:');
    for i := 1 to DelimCount(AdvEvents, '^') do
      if pos('C:', Piece(AdvEvents, '^', i)) > 0 then
        memDCNote.Lines.Add('    ' + Piece(Piece(AdvEvents, '^', i), ':', 2));
    memDCNote.Lines.Add(' ');
  end;
  //Remainder of note
  memDCnote.Lines.Add(fsText);
  memDCnote.Lines.Add(fsTexta);
  GeneratedNoteText := memDCnote.Lines.Text;
  TMGGenerateInterimNote(HTMlDCNote); //kt 12/17
end;


*)

end.
