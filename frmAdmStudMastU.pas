unit frmAdmStudMastU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, ComCtrls, DB, DBTables,
  MemDS, DBAccess, MyAccess, Vcl.Grids, Vcl.DBGrids;

type
  TfrmAdmStudMast = class(TForm)
    Label15: TLabel;
    DBNavigator1: TDBNavigator;
    btnSave: TBitBtn;
    btnNew: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit9: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBImage1: TDBImage;
    DBRadioGroup1: TDBRadioGroup;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label19: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    Label21: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    Label25: TLabel;
    DBEdit17: TDBEdit;
    Label20: TLabel;
    DBMemo1: TDBMemo;
    Label22: TLabel;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    Label27: TLabel;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    Image2: TImage;
    Label16: TLabel;
    DBEdit10: TDBEdit;
    Image1: TImage;
    Label28: TLabel;
    DBEdit20: TDBEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label30: TLabel;
    DBComboBox4: TDBComboBox;
    DBMemo4: TDBMemo;
    Label31: TLabel;
    Label26: TLabel;
    DBEdit18: TDBEdit;
    DBEdit1: TDBEdit;
    RdGp2: TDBRadioGroup;
    CBx1: TComboBox;
    edtSearch: TEdit;
    btnSearch: TBitBtn;
    Query1: TMyQuery;
    Query1StudId: TFloatField;
    Query1Name: TStringField;
    Button1: TButton;
    Label34: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    TabSheet4: TTabSheet;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBGrid1: TDBGrid;
    DBImage2: TDBImage;
    Label35: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    DBEdit22: TDBEdit;
    Label40: TLabel;
    DBEdit23: TDBEdit;
    Label36: TLabel;
    Label37: TLabel;
    Label42: TLabel;
    DBEdit24: TDBEdit;
    Label41: TLabel;
    DBEdit25: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    Label43: TLabel;
    Label44: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    Label45: TLabel;
    DBEdit26: TDBEdit;
    Label46: TLabel;
    DBEdit27: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    btnAutoRej: TBitBtn;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    TabSheet5: TTabSheet;
    DBGrid2: TDBGrid;
    btnTrasfer: TSpeedButton;
    Label29: TLabel;
    DBEdit19: TDBEdit;
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSearchClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnAutoRejClick(Sender: TObject);
    procedure btnTrasferClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdmStudMast: TfrmAdmStudMast;

implementation

uses MyDataU, frmXeroxU, genperfU;

{$R *.DFM}

procedure TfrmAdmStudMast.btnAutoRejClick(Sender: TObject);
begin
try
mydata.sp_age_filter.Params[0].Value:=genperf.dtpAgeCutOff.Date;
mydata.sp_age_filter.ExecProc;
mydata.adm_studmast.Refresh;
  Showmessage('Data processed for age computation');
except on E:exception do
          Showmessage(E.Message);
end;

end;

procedure TfrmAdmStudMast.btnNewClick(Sender: TObject);
begin
if not (mydata.adm_StudMast.state in [dsinsert]) then
mydata.adm_StudMast.Insert else showmessage('Save the Record first');
end;

procedure TfrmAdmStudMast.btnSaveClick(Sender: TObject);
begin
Mydata.adm_studmast.post;
end;

procedure TfrmAdmStudMast.FormActivate(Sender: TObject);
begin
//MyData.actlstds:=MyData.studmast;
mydata.actAdm_studmastds:=mydata.adm_studmast;
mydata.CatgrMast.open;
mydata.tbFeeProf.open;
mydata.CLMast.open;
Mydata.adm_studmast.open;
mydata.tbDoc_type.Open;
mydata.tbAdmstud_docs.Open;
mydata.tbComp.Open;
mydata.tbRelmast.Open;
mydata.tbHandicap.Open;
//dbcombobox3.Items.LoadFromFile('house.txt');
mydata.rdbtnvalt.Open;
mydata.tbAdm_final.Open;
RdGp2.ItemIndex:=0;
RdGp2.Value:='AdmNo';
end;

procedure TfrmAdmStudMast.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
edtSearch.Text:='';
Query1.Close;
mydata.tbAdm_final.close;
mydata.tbDoc_type.close;
mydata.tbStud_docs.close;
Mydata.adm_studmast.close;
mydata.CatgrMast.close;
mydata.CLMast.close;
mydata.tbHandicap.close;
mydata.tbComp.close;
mydata.tbRelmast.close;
mydata.rdbtnvalt.close;
mydata.tbFeeProf.close;
MyData.actAdm_studmastds :=MyData.adm_studmast;
end;

procedure TfrmAdmStudMast.btnSearchClick(Sender: TObject);
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
  begin MyData.adm_StudMast.Locate('StudId',Query1StudId.Value,[]);Query1.Next;end
  else
  begin  Showmessage('No more matches');edtSearch.Text:='';Query1.Close;end;
 end
 else
 begin  Showmessage('Not found');edtSearch.Text:='';Query1.Close;end;
end
else  Showmessage('Enter search string!');                       //if not mydata.StudMast.Locate('StudId',edtsearch.Text,[]) then//Showmessage('Not found');
end;

procedure TfrmAdmStudMast.btnTrasferClick(Sender: TObject);
begin
try
mydata.mysp_transfer.Params[0].Value:=strtofloat(mydata.adm_studmastADMNO.Value);
mydata.mysp_transfer.ExecProc;
except on ex:exception do
    showmessage(ex.Message);
end;
end;

procedure TfrmAdmStudMast.edtSearchChange(Sender: TObject);
begin
 Query1.Close; Query1.SQL[3]:=rdgp2.Value;
 if CBx1.Text='=' then
  Query1.Params[0].AsString:=UpperCase(edtSearch.Text)
 else
  Query1.Params[0].AsString:='%'+UpperCase(edtSearch.Text)+'%';
end;

end.
