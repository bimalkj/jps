unit frmTCu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, DB, MemDS, DBAccess,
  MyAccess;

type
  TfrmTC = class(TForm)
    Label15: TLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    DBMemo1: TDBMemo;
    Label12: TLabel;
    DBComboBox1: TDBComboBox;
    Query1: TMyQuery;
    RdGp2: TDBRadioGroup;
    CBx1: TComboBox;
    edtSearch: TEdit;
    btnSearch: TBitBtn;
    Query1admno: TStringField;
    Label6: TLabel;
    DBComboBox2: TDBComboBox;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    Label14: TLabel;
    DBComboBox3: TDBComboBox;
    Label16: TLabel;
    DBEdit10: TDBEdit;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    Label19: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label20: TLabel;
    DBEdit15: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit16: TDBEdit;
    RadioGroup1: TRadioGroup;
    Query1tcno: TIntegerField;
    Query1name: TStringField;
    DBEdit17: TDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit18: TDBEdit;
    chkBatch: TCheckBox;
    DBCheckBox1: TDBCheckBox;
    procedure btnPreviewClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBx1Change(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure chkBatchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTC: TfrmTC;
  rngIn:string;


implementation

uses MyDataU;

{$R *.dfm}

procedure TfrmTC.btnPreviewClick(Sender: TObject);
{
//var bmark:Tbookmark;
begin
//mydata.TcData.DisableControls;
//bmark:=mydata.TcData.GetBookmark;
//mydata.TcData.Filter:='Slno='+dbedit1.text;
//mydata.TcData.Filtered:=true;
//qrpTC.preview;
mydata.qryTcdata.Params[0].Value:=mydata.TcDataAdmNo.Value;
mydata.qryTcdata.Open;
mydata.frxmyrepo.LoadFromFile('.\frxtc.fr3');
mydata.frxmyrepo.ShowReport();
mydata.qryTcdata.Close;
//mydata.TcData.Filtered:=false;
//mydata.TcData.GotoBookmark(bmark);
//mydata.TcData.EnableControls;

end;}
var bmark:Tbookmark;
    repname:string;
begin
     case RadioGroup1.ItemIndex of
     0: begin
     repname:='.\frxDuration.fr3';
     end;
     1: begin
     repname:='.\frxcharc.fr3';
     end;
     2:repname:='.\frxTc.fr3';
     end;
//mydata.TcData.DisableControls;
//bmark:=mydata.TcData.GetBookmark;
//mydata.TcData.Filter:='Slno='+dbedit1.text;
//mydata.TcData.Filtered:=true;
//qrpTC.preview;
mydata.qryTcdata.Close;
if (not chkBatch.Checked) then
  mydata.qryTcdata.FilterSQL:='slno='+mydata.TcDataSlNo.AsString
else mydata.qryTcdata.FilterSQL:=rngin;
//mydata.qryTcdata.Params[0].Value:=mydata.TcDataAdmNo.Value;
mydata.qryTcdata.Open;
mydata.frxmyrepo.LoadFromFile(repname);
if sender=btnPreview then
      mydata.frxmyrepo.ShowReport()
      else
      begin
        mydata.frxmyrepo.PrepareReport;
        mydata.frxmyrepo.Print;
      end;
      //mydata.TcData.Filtered:=false;
//mydata.TcData.GotoBookmark(bmark);
//mydata.TcData.EnableControls;

end;




procedure TfrmTC.FormActivate(Sender: TObject);
begin
mydata.studmast.Open;
mydata.TcData.open;
mydata.rdbtnvalt.Open;
RdGp2.ItemIndex:=0;
RdGp2.Value:='AdmNo';
end;

procedure TfrmTC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mydata.TcData.close;
mydata.studmast.close;
mydata.RdBtnValT.Close;
end;

procedure TfrmTC.CBx1Change(Sender: TObject);
begin
 Query1.Close; Query1.SQL[3]:=rdgp2.Value;
 if CBx1.Text='=' then
  Query1.Params[0].AsString:=UpperCase(edtSearch.Text)
 else
  Query1.Params[0].AsString:='%'+UpperCase(edtSearch.Text)+'%';
end;

procedure TfrmTC.chkBatchClick(Sender: TObject);
begin
rngIn:='';
if chkBatch.Checked then
  begin
  rngIn:=InputBox('TC Sl range ','TC Sl range ','1-10');
  rngin:='SLNO between '+StringReplace(rngIn,'-',' and ',[]);
  //showmessage(' SLNO between '+rngIn);
  mydata.TcData.FilterSQL:=rngIn;
  //btnBatPrint.Enabled:=true;
  end
  else begin
  mydata.TcData.FilterSQL:='';
  //btnBatPrint.Enabled:=false;
  end;
end;

procedure TfrmTC.edtSearchChange(Sender: TObject);
begin
 Query1.Close; Query1.SQL[3]:=rdgp2.Value;
 if CBx1.Text='=' then
  Query1.Params[0].AsString:=UpperCase(edtSearch.Text)
 else
  Query1.Params[0].AsString:='%'+UpperCase(edtSearch.Text)+'%';
end;

procedure TfrmTC.btnSearchClick(Sender: TObject);
begin
if not Query1.Active then
begin
 Query1.Open; Query1.First;
end;
if edtSearch.Text<>'' then
begin
 if not Query1.IsEmpty then
 begin
  if not Query1.Eof then
  begin MyData.tcdata.Locate('Admno',Query1admno.Value,[]);Query1.Next;end
  else
  begin  Showmessage('No more matches');edtSearch.Text:='';Query1.Close;end;
 end
 else
 begin  Showmessage('Not found');edtSearch.Text:='';Query1.Close;end;
end
else  Showmessage('Enter search string!');                       //if not mydata.StudMast.Locate('StudId',edtsearch.Text,[]) then//Showmessage('Not found');
end;
//end;

end.
