unit frmStudMastU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, ComCtrls, DB, DBTables,
  MemDS, DBAccess, MyAccess, Vcl.Grids, Vcl.DBGrids, DBEditDateTimePicker;

type
  TfrmStudMast = class(TForm)
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
    Label3: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
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
    Label29: TLabel;
    DBComboBox3: TDBComboBox;
    Label30: TLabel;
    DBComboBox4: TDBComboBox;
    DBMemo4: TDBMemo;
    Label31: TLabel;
    Label26: TLabel;
    DBEdit18: TDBEdit;
    DBEdit1: TDBEdit;
    Label32: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label33: TLabel;
    DBEdit19: TDBEdit;
    Label48: TLabel;
    DBEdit21: TDBEdit;
    btnPrevCont: TSpeedButton;
    RdGp2: TDBRadioGroup;
    CBx1: TComboBox;
    edtSearch: TEdit;
    btnSearch: TBitBtn;
    btnRpCrd: TSpeedButton;
    Query1: TMyQuery;
    Query1StudId: TFloatField;
    Query1Name: TStringField;
    btnReset: TButton;
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
    DBLookupComboBox7: TDBLookupComboBox;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    DBEdit28: TDBEdit;
    Label49: TLabel;
    dbcNso: TDBCheckBox;
    DBEdit29: TDBEdit;
    DBLookupComboBox8: TDBLookupComboBox;
    dbDtpNSo: TDBEditDateTimePicker;
    edtResetNoterm: TEdit;
    UpDown1: TUpDown;
    btnDuration: TBitBtn;
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSearchClick(Sender: TObject);
    procedure btnPrevContClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnRpCrdClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure dbcNsoClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure btnDurationClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStudMast: TfrmStudMast;

implementation

uses MyDataU, frmRptCrdU, frmXmSlctU,  frmXeroxU;

{$R *.DFM}

procedure TfrmStudMast.btnDurationClick(Sender: TObject);
begin
mydata.frxReport1.LoadFromFile('.\frxDurCurr.fr3');
mydata.frxReport1.ShowReport();
end;

procedure TfrmStudMast.btnNewClick(Sender: TObject);
begin
if not (mydata.StudMast.state in [dsinsert]) then
mydata.StudMast.Insert else showmessage('Save the Record first');
end;

procedure TfrmStudMast.btnSaveClick(Sender: TObject);
begin
Mydata.studmast.post;
end;

procedure TfrmStudMast.FormActivate(Sender: TObject);
begin
MyData.actlstds:=MyData.studmast;
mydata.CatgrMast.open;
mydata.tbFeeProf.open;
mydata.CLMast.open;
Mydata.studmast.open;
mydata.tbDoc_type.Open;
mydata.tbStud_docs.Open;
mydata.tbComp.Open;
mydata.tbRelmast.Open;
mydata.tbHandicap.Open;
mydata.tcstatus.Open;
dbcombobox3.Items.LoadFromFile('house.txt');
mydata.rdbtnvalt.Open;
RdGp2.ItemIndex:=0;
RdGp2.Value:='AdmNo';
end;

procedure TfrmStudMast.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
edtSearch.Text:='';
Query1.Close;
mydata.tcstatus.close;
mydata.tbDoc_type.close;
mydata.tbStud_docs.close;
Mydata.studmast.close;
mydata.CatgrMast.close;
mydata.CLMast.close;
mydata.tbComp.close;
mydata.tbHandicap.close;
mydata.tbRelmast.close;
mydata.rdbtnvalt.close;
mydata.tbFeeProf.close;
MyData.actlstds:=MyData.dummyT;
end;

procedure TfrmStudMast.btnSearchClick(Sender: TObject);
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
  begin MyData.StudMast.Locate('StudId',Query1StudId.Value,[]);Query1.Next;end
  else
  begin  Showmessage('No more matches');edtSearch.Text:='';Query1.Close;end;
 end
 else
 begin  Showmessage('Not found');edtSearch.Text:='';Query1.Close;end;
end
else  Showmessage('Enter search string!');                       //if not mydata.StudMast.Locate('StudId',edtsearch.Text,[]) then//Showmessage('Not found');
end;

procedure TfrmStudMast.btnPrevContClick(Sender: TObject);
begin
if DBEdit21.Text<>'' then
begin
 frmXerox.Image1.Picture.LoadFromFile(DBEdit21.Text);
 frmXerox.ShowModal;
end
else
 showmessage('Invalid file name');
end;

procedure TfrmStudMast.edtSearchChange(Sender: TObject);
begin
 Query1.Close; Query1.SQL[3]:=rdgp2.Value;
 if CBx1.Text='=' then
  Query1.Params[0].AsString:=UpperCase(edtSearch.Text)
 else
  Query1.Params[0].AsString:='%'+UpperCase(edtSearch.Text)+'%';
end;

procedure TfrmStudMast.btnRpCrdClick(Sender: TObject);
begin
frmRptCrd.sntBy:='frmStud';
frmRptCrd.clCdStr:=mydata.StudMastClCode.AsString;
frmRptCrd.studIdStr:=mydata.StudMastStudId.AsString;
frmXmSlct.ShowModal;

end;

procedure TfrmStudMast.btnResetClick(Sender: TObject);
begin
if MessageBox(Handle,'Wish to reset term ','Reset Term',MB_YESNO)=mrYes then
begin
MyData.StudMast.Edit;
MyData.StudMastNOTERMS.Value:=strtoint(edtResetNoterm.Text);
MyData.StudMast.Post;
end;
end;
procedure TfrmStudMast.dbcNsoClick(Sender: TObject);
begin
dbDtpNSo.Enabled:=dbcNso.Checked;
end;

procedure TfrmStudMast.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
dbcNsoClick(self);
end;

end.
