unit frmTTableU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, DBCGrids, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids,variants,
  ExtCtrls;

type
  TfrmTTable = class(TForm)
    DBCtrlGrid1: TDBCtrlGrid;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    btnValidate: TBitBtn;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBText2: TDBText;
    Label15: TLabel;
    Memo1: TMemo;
    Label5: TLabel;
    btnCopy: TBitBtn;
    GroupBox1: TGroupBox;
    edtClass: TLabeledEdit;
    edtDay: TLabeledEdit;
    edtTeacher: TLabeledEdit;
    btnFilter: TBitBtn;
    btnFreePeriod: TBitBtn;
    BitBtn2: TBitBtn;
    btnSearch: TBitBtn;
    edtSub: TEdit;
    Label7: TLabel;
    edtperiod: TEdit;
    label8: TLabel;
    procedure btnGeneralClick(Sender: TObject);
    procedure btnValidateClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCopyClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnFreePeriodClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTTable: TfrmTTable;

implementation

uses MyDataU, frmClroomMastU;

{$R *.DFM}
procedure swap(var a,b:integer);
var tmp:integer;
begin
tmp:=a;a:=b;b:=tmp;
end;

procedure TfrmTTable.btnGeneralClick(Sender: TObject);
begin
frmClroomMast.showmodal;
end;

procedure TfrmTTable.btnValidateClick(Sender: TObject);
var notch,nod,nop:integer;
i,j,k:integer;
fstr:string;
begin
nod:=mydata.mfile.ReadInteger('General','No of days',6);
nop:=mydata.mfile.ReadInteger('General','No of Periods',6);
notch:=mydata.mfile.ReadInteger('General','No of teachers',10);
memo1.Lines.clear;
mydata.tbttable.DisableControls;
for i:=1 to notch do
 for j:=1 to nod   do
   for k:=1 to nop do
        with mydata do
        begin
        //
        fstr:=format('Teacher=%d and day=%d and period=%d',
        [i,j,k]);
        tbttable.Filtered:=false;
        tbttable.filter:=fstr;
        tbttable.Filtered:=true;
                if tbttable.RecordCount>1 then memo1.Lines.add('Duplicate for '+fstr);
                //if tbttable.RecordCount<1 then memo1.Lines.Add('Idle for '+fstr);
        end;

//mydata.tbttable.Filter:='';
mydata.tbttable.filtered:=false;
mydata.tbttable.EnableControls;
end;

procedure TfrmTTable.FormActivate(Sender: TObject);
begin
mydata.tbclmast.open;
mydata.tbttable.Open;
mydata.tbsubdet1.Open;
mydata.tbClassDet1.open;
mydata.tbTeacher1.Open;
btnCopy.Enabled:=not(mydata.mfile.ReadString('General','Time Table','copied')='copied');
//btnFilter.Enabled:=false;
//mydata.tbschdata.Open;
end;

procedure TfrmTTable.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mydata.tbclmast.close;
mydata.tbttable.close;
mydata.tbsubdet1.Close;
mydata.tbClassDet1.Close;
mydata.tbTeacher1.close;
//mydata.tbschdata.close;
end;

procedure TfrmTTable.btnCopyClick(Sender: TObject);
        type
        tmTable = Record
        period,ccode,Teacher:integer;
        Subject:string;
        end;
var
artmTable:array of tmTable;
nod,i,j,rcnt:integer;
begin
mydata.tbttable.DisableControls;
mydata.tbttable.Filtered:=false;
rcnt:=mydata.tbttable.RecordCount;
SetLength(artmTable,rcnt+1);
mydata.tbttable.first;
for i:=0 to rcnt-1 do
        with mydata do
        begin
        artmTable[i].period:=tbttablePeriod.AsInteger;
        artmTable[i].ccode:=tbttableCCode.AsInteger;
        artmTable[i].Teacher:=tbttableTeacher.AsInteger;
       // artmTable[i].Subject:=tbttableSubject.Value;
        tbttable.Next;
        end;
nod:=mydata.mfile.ReadInteger('General','No of days',6);
for i:=2 to nod do
  for j:=0 to rcnt-1 do
        with mydata do
        begin
        tbttable.insert;
        tbttableDay.Value:=i;
        tbttablePeriod.Value:=artmTable[j].period;
        tbttableCCode.value:=artmTable[j].ccode;
        tbttableTeacher.value:=artmTable[j].Teacher;
       // tbttableSubject.Value:=artmTable[j].Subject;
        tbttable.post;
        end;
btnFilterClick(self);
mydata.tbttable.EnableControls;
mydata.mfile.WriteString('General','Time Table','copied');
btnCopy.Enabled:=false;
end;

procedure addfilter(txt,fltr:string;var fst:string);
begin
if fltr<>'' then
 if fst<>'' then
 fst:=fst+' And '+txt+fltr
 else
 fst:=txt+fltr;
end;

procedure TfrmTTable.btnFilterClick(Sender: TObject);
var fstr:string;
begin
mydata.tbttable.Filtered:=false;
fstr:='';
AddFilter('Day=',edtDay.Text,fstr);
AddFilter('CCode=',edtClass.Text,fstr);
AddFilter('Teacher=',edtTeacher.Text,fstr);
mydata.tbttable.Filter:=fstr;
mydata.tbttable.Filtered:=not(fstr='');
end;

procedure TfrmTTable.btnFreePeriodClick(Sender: TObject);
var nod,nop:integer;
i,j,k:integer;
fstr:string;
begin
if edtTeacher.Text='' then
raise exception.Create('Invalid Teacher Code');
nod:=mydata.mfile.ReadInteger('General','No of days',6);
nop:=mydata.mfile.ReadInteger('General','No of Periods',6);
//notch:=mfile.ReadInteger('General','No of teachers',10);
memo1.Lines.clear;
mydata.tbttable.DisableControls;
//for i:=1 to notch do
i:=strtoint(edtTeacher.text);
 for j:=1 to nod   do
   for k:=1 to nop do
        with mydata do
        begin
        fstr:=format('Teacher=%d and day=%d and period=%d',
        [i,j,k]);
        tbttable.Filtered:=false;
        tbttable.filter:=fstr;
        tbttable.Filtered:=true;
                if tbttable.RecordCount<1 then
                memo1.Lines.add(format('Idle for day %d Period %d',[j,k]));
        end;

//edtTeacher.Text:='';
mydata.tbttable.Filtered:=false;
mydata.tbttable.EnableControls;
end;

procedure TfrmTTable.btnSearchClick(Sender: TObject);
begin
memo1.Lines.Add('Start'+inttostr(mydata.tbsubdet1.recordcount));
  with mydata do
  begin
  tbTeacher1.First;
    while not tbTeacher1.Eof do
    begin
        tbSubDet1.First;
//        if tbSubDet1.locate('SID;TID',vararrayof([strtoint(edtsub.Text),tbTeacher1TID.Value]),[]) then
  if tbSubDet1.locate('SID;TID',vararrayof([tbttableSID.Value,tbTeacher1TID.Value]),[]) then memo1.Lines.Add('Subject'+tbttableSubDesc.Value);
        if tbSubDet1.locate('SID;TID',vararrayof([tbttableSID.Value,tbTeacher1TID.Value]),[]) then
        begin
          tbClassDet1.First;
          if tbClassDet1.Locate('Slno;CID',vararrayof([tbSubDet1Slno.Value,strtoint(edtClass.Text)]),[]) then
            memo1.Lines.Add('Teacher found'+tbTeacher1Descr.AsString+'For the subject'+tbSubDet1subdesc.Value);
        end;
    tbTeacher1.Next;
    end;
  end;
end;
end.