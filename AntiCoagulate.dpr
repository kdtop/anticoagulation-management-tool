program AntiCoagulate;

uses
  Forms,
  fAboutACM in 'fAboutACM.pas' {frmAboutACM},
  fSplash in 'fSplash.pas' {frmSplashACM},
  fPCE in 'fPCE.pas' {frmPCE},
  mPCE in 'mPCE.pas',
  mVisitRelated in 'mVisitRelated.pas' {fraVisitRelated: TFrame},
  fxBroker in 'fxBroker.pas' {frmBroker},
  uInit in 'uInit.pas',
  fTimeout in 'fTimeout.pas' {frmTimeout},
  fBridgeCommentsDialog in 'fBridgeCommentsDialog.pas' {frmBridgeCommentDlg},
  uTMGMods in 'TMGExtra\uTMGMods.pas',
  fAnticoagulator in 'fAnticoagulator.pas' {frmAnticoagulate},
  fCompletedVisitLetter in 'TMGExtra\fCompletedVisitLetter.pas' {frmCompletedVisitLetter},
  fEndAnticoagMgmt in 'TMGExtra\fEndAnticoagMgmt.pas' {frmEndAnticoagationManagement},
  fStartAnticoagMgmt in 'TMGExtra\fStartAnticoagMgmt.pas' {frmStartAnticoagationManagement},
  rRPCs in 'TMGExtra\rRPCs.pas',
  fMissedAppt in 'TMGExtra\fMissedAppt.pas' {frmMissedAppt},
  fCompleteConsult in 'TMGExtra\fCompleteConsult.pas' {frmCompleteConsult},
  fSignItem in 'TMGExtra\fSignItem.pas' {frmSignItem},
  fEditFlowsheet in 'fEditFlowsheet.pas' {frmEditFlowsheetEntry},
  uTypes in 'TMGExtra\uTypes.pas',
  fReminder in 'TMGExtra\fReminder.pas' {frmReminder},
  uUtility in 'TMGExtra\uUtility.pas',
  uFlowsheet in 'TMGExtra\uFlowsheet.pas',
  uPastINRs in 'uPastINRs.pas',
  fCustomINRGoal in 'TMGExtra\fCustomINRGoal.pas' {frmCustomINRGoal},
  fNewPatientInstructions in 'TMGExtra\fNewPatientInstructions.pas' {frmNewPatientInstructions},
  fNewIndication in 'TMGExtra\fNewIndication.pas' {frmNewIndication},
  fActivityDetail in 'TMGExtra\fActivityDetail.pas' {frmActivityDetail},
  fUnlockPatient in 'TMGExtra\fUnlockPatient.pas' {frmUnlockPatient},
  fEditComplications in 'TMGExtra\fEditComplications.pas' {frmEditComplications},
  fOutsideLab in 'TMGExtra\fOutsideLab.pas' {frmOutsideLab},
  fPatientInformation in 'TMGExtra\fPatientInformation.pas' {frmPatientInformation},
  fCosign in 'fCosign.pas' {frmCosign},
  fViewFlowsheetGrid in 'TMGExtra\fViewFlowsheetGrid.pas' {frmViewFlowsheetGrid},
  uEvaluateExpr in 'TMGExtra\uEvaluateExpr.pas',
  uParseBlocks in 'TMGExtra\uParseBlocks.pas',
  uHTMLTools in 'TMGExtra\uHTMLTools.pas';

{$R *.RES}

begin
  Application.Initialize;
  SplashOpen;
  Application.Title := 'Anticoagulation Management';
  Application.HelpFile := 'Anticoag_help_file.hlp';
  Application.CreateForm(TfrmAnticoagulate, frmAnticoagulate);
  SplashClose;
  if not AbortingExecution then Application.Run;
end.
