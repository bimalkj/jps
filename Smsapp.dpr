program smsapp;

uses
  Forms,
  usermgrfrmU in 'usermgrfrmU.pas' {usermgrfrm},
  userU in 'userU.pas' {userfrm},
  myfuncU in 'myfuncU.pas',
  MyDataU in 'MyDataU.pas' {MyData: TDataModule},
  frmAdmStudMastXIU in 'frmAdmStudMastXIU.pas' {frmAdmStudMastXI},
  frmDsgMastU in 'frmDsgMastU.pas' {frmDsgMast},
  frmRepMastU in 'frmRepMastU.pas' {frmRepMast},
  frmItemMastU in 'frmItemMastU.pas' {frmItemMast},
  frmSubGrpMastU in 'frmSubGrpMastU.pas' {frmSubGrpMast},
  qrpRep1U in 'qrpRep1U.pas' {qrpRep1: TQuickRep},
  splashFormU in 'splashFormU.pas' {splashForm},
  AboutU in 'AboutU.pas' {AboutBox},
  frmfeematrixU in 'frmfeematrixU.pas' {frmfeematrix},
  frmBankMastU in 'frmBankMastU.pas' {frmBankMast},
  QrpMarkEntryU in 'QrpMarkEntryU.pas' {QrpMarkDet: TQuickRep},
  dlgStudMarkU in 'dlgStudMarkU.pas' {DlgStudMark},
  QrpStudMarkU in 'QrpStudMarkU.pas' {QrpStudMark: TQuickRep},
  frmTTableU in 'frmTTableU.pas' {frmTTable},
  frmSchWizU in 'frmSchWizU.pas' {frmSchWiz},
  frmClTableU in 'frmClTableU.pas' {frmClTable},
  frmTchTableU in 'frmTchTableU.pas' {frmTchTable},
  frmMiscRepU in 'frmMiscRepU.pas' {frmMiscRep},
  frmPreviewU in 'frmPreviewU.pas' {frmPreview},
  frmTCu in 'frmTCu.pas' {frmTC},
  qrpBirthU in 'qrpBirthU.pas' {qrpBirth: TQuickRep},
  frmBirthU in 'frmBirthU.pas' {frmBirth},
  qrpCllistU in 'qrpCllistU.pas' {qrpCLlist: TQuickRep},
  QrrotStudU in 'QrrotStudU.pas' {Qrptotalstud: TQuickRep},
  QrpHouseu in 'QrpHouseu.pas' {QrpHouse: TQuickRep},
  dlgRepoU in 'dlgRepoU.pas' {DlgRepo},
  QrpGroupU in 'QrpGroupU.pas' {QrpGroup: TQuickRep},
  frmCLMastU in 'frmCLMastU.pas' {frmCLMast},
  frmOtherRepU in 'frmOtherRepU.pas' {frmOtherRep},
  frmSubjU in 'frmSubjU.pas' {frmSubj},
  frmFeeU in 'frmFeeU.pas' {frmFee},
  MainFrmU in 'MainFrmU.pas' {MainFrm},
  stud_detU in 'stud_detU.pas' {Stud_Det},
  frmClListU in 'frmClListU.pas' {frmClList},
  qrpCllist1U in 'qrpCllist1U.pas' {qrpCLlist1: TQuickRep},
  genperfU in 'genperfU.pas' {genperf},
  frmReplaceU in 'frmReplaceU.pas' {frmReplace},
  frmAttendenceU in 'frmAttendenceU.pas' {frmAttendence},
  FmxUtils in 'FmxUtils.pas',
  frmStfApplnU in 'frmStfApplnU.pas' {frmStfAppln},
  frmXeroxU in 'frmXeroxU.pas' {frmXerox},
  frmClroomMastU in 'frmClroomMastU.pas' {frmClroomMast},
  frmTMastU in 'frmTMastU.pas' {frmTMast},
  exmdataU in 'exmdataU.pas' {exmdata: TDataModule},
  frmexsubmastU in 'frmexsubmastU.pas' {frmExsubmast},
  frmNSheetU in 'frmNSheetU.pas' {frmNSheet},
  frmexmmastU in 'frmexmmastU.pas' {frmExmmast},
  frmRepoU in 'frmRepoU.pas' {frmRepo},
  frmRptCrdU in 'frmRptCrdU.pas' {frmRptCrd},
  frmXmSlctU in 'frmXmSlctU.pas' {frmXmSlct},
  frmSearchU in 'frmSearchU.pas' {frmSearch},
  frmSheetU in 'frmSheetU.pas' {frmSheet},
  frmDepMastU in 'frmDepMastU.pas' {frmDepMast},
  frmDocTypeU in 'frmDocTypeU.pas' {frmDocType},
  frmXlreportU in 'frmXlreportU.pas' {frmXlreport},
  frmHandicapU in 'frmHandicapU.pas' {frmHandicap},
  frmRelationsU in 'frmRelationsU.pas' {frmRelations},
  frmStudMastU in 'frmStudMastU.pas' {frmStudMast},
  frmCompanyU in 'frmCompanyU.pas' {frmCompany},
  frmAdmLocU in 'frmAdmLocU.pas' {frmAdmLoc},
  frmFrmSellU in 'frmFrmSellU.pas' {frmSell},
  frmAdmStudMastU in 'frmAdmStudMastU.pas' {frmAdmStudMast},
  frmCatMastU in 'frmCatMastU.pas' {frmCatMast},
  frmXlclasslistU in 'frmXlclasslistU.pas' {frmXlclasslist},
  frmAdmitCardOthU in 'frmAdmitCardOthU.pas' {frmAdmitCardOth},
  frmBounceU in 'frmBounceU.pas' {frmBounce},
  frmDailyAttndU in 'frmDailyAttndU.pas' {frmDailyAttnd},
  frmDueDtU in 'frmDueDtU.pas' {frmDueDt},
  frmAdmitCardU in 'frmAdmitCardU.pas' {frmAdmitCard},
  frmSMSSendU in 'frmSMSSendU.pas' {frmSMSSend},
  frmAdHocU in 'frmAdHocU.pas' {frmAdHoc};

{$R *.RES}

begin
  SplashForm:=TsplashForm.create(Application);
  SplashForm.Show;SplashForm.update;
  Application.Initialize;
  //Application.Title := 'SMSAPP for NHES';
  Application.CreateForm(TMyData, MyData);
  if not mydata.myconn.Connected then Application.Terminate;
  Application.CreateForm(Tuserfrm, userfrm);
  Application.CreateForm(TfrmAdmitCard, frmAdmitCard);
  Application.CreateForm(TfrmAdmitCardOth, frmAdmitCardOth);
  Application.CreateForm(Texmdata, exmdata);
  Application.CreateForm(Tusermgrfrm, usermgrfrm);
  Application.CreateForm(TfrmAdmStudMastXI, frmAdmStudMastXI);
  Application.CreateForm(TfrmDsgMast, frmDsgMast);
  Application.CreateForm(TfrmRepMast, frmRepMast);
  Application.CreateForm(TfrmItemMast, frmItemMast);
  Application.CreateForm(TfrmSubGrpMast, frmSubGrpMast);
  Application.CreateForm(TqrpRep1, qrpRep1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(Tfrmfeematrix, frmfeematrix);
  Application.CreateForm(TfrmBankMast, frmBankMast);
  Application.CreateForm(TQrpMarkDet, QrpMarkDet);
  Application.CreateForm(TDlgStudMark, DlgStudMark);
  Application.CreateForm(TQrpStudMark, QrpStudMark);
  Application.CreateForm(TfrmTTable, frmTTable);
  Application.CreateForm(TfrmSchWiz, frmSchWiz);
  Application.CreateForm(TfrmClTable, frmClTable);
  Application.CreateForm(TfrmTchTable, frmTchTable);
  Application.CreateForm(TfrmMiscRep, frmMiscRep);
  Application.CreateForm(TfrmPreview, frmPreview);
  Application.CreateForm(TfrmTC, frmTC);
  Application.CreateForm(TqrpBirth, qrpBirth);
  Application.CreateForm(TfrmBirth, frmBirth);
  Application.CreateForm(TqrpCLlist, qrpCLlist);
  Application.CreateForm(TQrptotalstud, Qrptotalstud);
  Application.CreateForm(TQrpHouse, QrpHouse);
  Application.CreateForm(TDlgRepo, DlgRepo);
  Application.CreateForm(TQrpGroup, QrpGroup);
  Application.CreateForm(TfrmCLMast, frmCLMast);
  Application.CreateForm(TfrmOtherRep, frmOtherRep);
  Application.CreateForm(TfrmSubj, frmSubj);
  Application.CreateForm(TfrmFee, frmFee);
  Application.CreateForm(TMainFrm, MainFrm);
  Application.CreateForm(TStud_Det, Stud_Det);
  Application.CreateForm(TfrmClList, frmClList);
  Application.CreateForm(TqrpCLlist1, qrpCLlist1);
  Application.CreateForm(Tgenperf, genperf);
  Application.CreateForm(TfrmReplace, frmReplace);
  Application.CreateForm(TfrmAttendence, frmAttendence);
  Application.CreateForm(TfrmStfAppln, frmStfAppln);
  Application.CreateForm(TfrmXerox, frmXerox);
  Application.CreateForm(TfrmClroomMast, frmClroomMast);
  Application.CreateForm(TfrmTMast, frmTMast);
  Application.CreateForm(TfrmExsubmast, frmExsubmast);
  Application.CreateForm(TfrmNSheet, frmNSheet);
  Application.CreateForm(TfrmExmmast, frmExmmast);
  Application.CreateForm(TfrmRepo, frmRepo);
  Application.CreateForm(TfrmRptCrd, frmRptCrd);
  Application.CreateForm(TfrmXmSlct, frmXmSlct);
  Application.CreateForm(TfrmSearch, frmSearch);
  Application.CreateForm(TfrmSheet, frmSheet);
  Application.CreateForm(TfrmDepMast, frmDepMast);
  Application.CreateForm(TfrmDocType, frmDocType);
  Application.CreateForm(TfrmXlreport, frmXlreport);
  Application.CreateForm(TfrmHandicap, frmHandicap);
  Application.CreateForm(TfrmRelations, frmRelations);
  Application.CreateForm(TfrmStudMast, frmStudMast);
  Application.CreateForm(TfrmCompany, frmCompany);
  Application.CreateForm(TfrmAdmLoc, frmAdmLoc);
  Application.CreateForm(TfrmSell, frmSell);
  Application.CreateForm(TfrmAdmStudMast, frmAdmStudMast);
  Application.CreateForm(TfrmCatMast, frmCatMast);
  Application.CreateForm(TfrmXlclasslist, frmXlclasslist);
  Application.CreateForm(TfrmAdmitCard, frmAdmitCard);
  Application.CreateForm(TfrmBounce, frmBounce);
  Application.CreateForm(TfrmDailyAttnd, frmDailyAttnd);
  Application.CreateForm(TfrmDueDt, frmDueDt);
  Application.CreateForm(TfrmSMSSend, frmSMSSend);
    Application.CreateForm(TfrmAdHoc, frmAdHoc);
  SplashForm.hide;SplashForm.free;
  Application.Run;
end.
