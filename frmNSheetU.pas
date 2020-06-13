unit frmNSheetU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, ExtCtrls, DB;

type
  TfrmNSheet = class(TForm)
    DBNavigator1: TDBNavigator;
    btnSave: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    btnPopulate: TBitBtn;
    DBLookupComboBox2: TDBLookupComboBox;
    DBText1: TDBText;
    DBText2: TDBText;
    DBLookupComboBox3: TDBLookupComboBox;
    btnPub: TSpeedButton;
    Label15: TLabel;
    btnGo: TBitBtn;
    edtSection: TComboBox;
    dbText3: TDBText;
    dbtSheetid: TDBText;
    Bevel1: TBevel;
    dbchkLocked: TDBCheckBox;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure btnPopulateClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnPubClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNSheet: TfrmNSheet;

implementation

uses exmdataU, frmRptCrdU, frmXmSlctU, frmSearchU;

{$R *.dfm}

procedure TfrmNSheet.FormActivate(Sender: TObject);
begin
exmdata.sheetdet.IndexFieldNames:='SheetId;RlNo';
exmdata.exmmast.open;
exmdata.excldet.open;
//exmdata.excldet1.open;

exmdata.sheet.open;
exmdata.CLMast.open;
exmdata.exsubmast.open;
exmdata.exsubmast1.open;
exmdata.excldet.Open;
exmdata.sheetdet.open;
exmdata.CLMast.Locate('clcode',exmdata.sheetClcode.value,[]);
end;

procedure TfrmNSheet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
exmdata.excldet.close;
exmdata.sheet.close;
exmdata.sheetdet.close;
exmdata.CLMast.close;
exmdata.exsubmast.close;
exmdata.exsubmast1.close;
exmdata.exmMast.close;
exmdata.excldet.close;
exmdata.sheetdet.IndexFieldNames:='SheetId;StudId';
end;

procedure TfrmNSheet.DBLookupComboBox2Click(Sender: TObject);
begin
exmdata.CLMast.Locate('clcode',exmdata.excldetclid.value,[]);
end;

procedure TfrmNSheet.btnPopulateClick(Sender: TObject);
begin
if exmdata.sheetdet.IsEmpty then
begin
exmdata.qryCllist.Close;
exmdata.qryCllist.Params[0].Value :=exmdata.sheetClCode.value;
exmdata.qryCllist.Params[1].Value :=UpperCase(edtSection.Text);
exmdata.qryCllist.Open;
  if exmdata.qryCllist.IsEmpty then showmessage('Invalid Section')
  else
  begin
  exmdata.qryCllist.First;
  while not exmdata.qryCllist.Eof do
    begin
    exmdata.sheetdet.Append;
    exmdata.sheetdetStudId.Value:=exmdata.qryCllistStudId.Value;
    exmdata.sheetdetAdmNo.Value:=exmdata.qryCllistAdmNo.Value;
    exmdata.sheetdetRlNo.Value:=exmdata.qryCllistRollNo.Value;
    exmdata.qryCllist.Next;
    end;
  exmdata.sheetdet.Post;
  showmessage('Successfully populated');
  end;
end
else showmessage('Already populated ');
end;

procedure TfrmNSheet.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
exmdata.CLMast.Locate('clcode',exmdata.sheetClcode.value,[]);
end;

procedure TfrmNSheet.DBGrid1DblClick(Sender: TObject);
begin
frmRptCrd.sntBy:='frmSht';frmRptCrd.clCdStr:=exmdata.sheetClCode.AsString;
frmRptCrd.studIdStr:=exmdata.sheetdetStudId.AsString;
frmRptCrd.kpTbOpn:=True; frmXmSlct.ShowModal; frmRptCrd.kpTbOpn:=False;
end;

procedure TfrmNSheet.btnPubClick(Sender: TObject);
begin
 frmSearch.ShowModal;
end;

procedure TfrmNSheet.btnGoClick(Sender: TObject);
var strsql:string;
begin
with exmdata do
  begin
    strsql:='select sheetid from sheet where exmid='+exmmastExmid.AsString;
    strsql:=strsql+' and clcode='+excldetclid.AsString;
    strsql:=strsql+' and section='''+edtSection.text+'''';
    strsql:=strsql+' and subid='+exsubmastSubjid.AsString;
  //memo1.Lines.add(strsql);
  qryTemp.SQL.Text:=strsql;
  qryTemp.Open;
  if (qryTemp.RecordCount>0) then
  sheet.Locate('sheetid',qryTemp.fieldvalues['sheetid'],[])
  else if (messagedlg('Do you want to generate this sheet',
  mtConfirmation, [mbYes, mbNo], 0)=mryes) then
    begin
    sheet.InsertRecord([0,excldetclid.value,exmmastExmid.value,
    exsubmastSubjid,edtSection.text]);
    end;
  end;
end;

end.
