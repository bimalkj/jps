unit frmOtherRepU;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, Dialogs, Grids, DBGrids, ActnList, Menus,
  ToolWin, StdActns;

type
  TfrmOtherRep = class(TForm)
    btnPrint: TBitBtn;
    BitBtn1: TBitBtn;
    btnIncome: TSpeedButton;
    btnMemoList: TSpeedButton;
    REdit: TRichEdit;
    Memo1: TMemo;
    Bevel1: TBevel;
    Label1: TLabel;
    SDT: TDateTimePicker;
    Label2: TLabel;
    EDT: TDateTimePicker;
    cBox: TComboBox;
    btnCrList: TSpeedButton;
    ActionList1: TActionList;
    EditCopy1: TEditCopy;
    EditCut1: TEditCut;
    EditDelete1: TEditDelete;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    PopupMenu1: TPopupMenu;
    SelectAll1: TMenuItem;
    Copy1: TMenuItem;
    Clear1: TMenuItem;
    Size1: TMenuItem;
    ZoomOut1: TMenuItem;
    ZoomIn: TAction;
    ZoomOut: TAction;
    btnSalary: TSpeedButton;
    btnYrly: TSpeedButton;
    btnFeestmt: TSpeedButton;
    procedure btnPrintClick(Sender: TObject);
    procedure btnIncomeClick(Sender: TObject);
    procedure btnMemoListClick(Sender: TObject);
    procedure ZoomInExecute(Sender: TObject);
    procedure ZoomOutExecute(Sender: TObject);
    procedure btnCrListClick(Sender: TObject);
    procedure btnExpenseClick(Sender: TObject);
    procedure btnSalaryClick(Sender: TObject);
    procedure btnYrlyClick(Sender: TObject);
    procedure btnFeestmtClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOtherRep: TfrmOtherRep;

implementation

uses MyDataU,DB,myfuncU, genperfU;

{$R *.DFM}

procedure CreateReport(tm:TRichEdit;TDB:TDataSet;ar,sumfields:array of integer;ast:array of string;flt,flen:array of integer);
{
tm:RichEdit component
TDB :Table or Query
ar:array of number for difffernt alignment for fields
sumfields:array of number for summation field
ast:array of string for field heading
flt:array of integer for marking the field as float type
flen:alignment for displaying total
}
var
fc,i,maxfield,sum,j,cnt,fg,rc,ctr,totsp,fg1:integer;
st,st1,finalstr:string;
totamt:array of real;
begin
try
maxfield:=high(sumfields);
setlength(totamt,maxfield+1);
fg1:=1;
if flen[0]=0 then
  fg1:=0;
tm.lines.add('Report printed on :   '+ datetostr(date)+ '  at :  '+timetostr(time));
tm.lines.add('');

for i:=0 to maxfield do totamt[i]:=0;
st:='Sl. ';st1:='~~~~';fc:=TDB.fieldcount-1;
for i:=0 to fc do begin
if ast[i]='' then ast[i]:=TDB.fields[i].fieldname;
st:=st+padl(ast[i],ar[i]);
st1:=st1+repchar('~',ar[i]);
end;
tm.lines.add(st);tm.lines.add(st1);
rc:=0;
while not TDB.eof do begin
inc(rc);
st:='';
st:=format('%3d ',[rc]);
for i:=0 to fc do
begin
  fg:=0;
  for cnt:=0 to high(flt) do
  begin
    if i=sumfields[flt[cnt]] then
      fg:=1;
  end;
  if fg=1 then
    st:=st+padl(format('%.0f.00',[strtofloat(TDB.fields.fields[i].asstring)]),ar[i])
  else
    st:=st+padl(TDB.fields.fields[i].asstring,ar[i]);
end;
tm.lines.add(st);
if sumfields[0] <> 0 then
begin
  for i:=0 to maxfield do
  begin
    totamt[i]:=totamt[i]+ TDB.fields.fields[sumfields[i]].Value;
  end;
end;
TDB.next;
end;
tm.lines.add(st1);
if fg1=0 then
begin
  for i:=0 to maxfield do
  begin
     sum:=0;
     for j:=0 to sumfields[i] do
     begin
       sum:=sum+abs(ar[j]);
     end;
     if  i=0 then
       flen[i]:=(sum-9)*-1
     else
       {if i=1 then
         flen[i]:=sum-(flen[i-1]+7)
       else
         flen[i]:=sum-flen[i-1];}
     begin
       totsp:=0;
       for ctr:=0 to (i-1) do totsp:=totsp+abs(flen[ctr]);
       flen[i]:=-1*(sum-totsp);
     end;
     //flen[0]:=flen[0]-4;
  end;
end;
finalstr:='  Total : ';
if sumfields[0]>0 then
begin
   for i:=0 to maxfield do
   begin
     fg:=0;
     for cnt:=0 to high(flt) do
     begin
       if i=flt[cnt] then
         fg:=1;
     end;
     if fg=1 then
       finalstr:=finalstr+padl(format('%.0f.00',[totamt[i]]),flen[i])
     else
       finalstr:=finalstr+padl(floattostr(totamt[i]),flen[i]);
   end;
   tm.Lines.add(finalstr);
end;
except
Showmessage('Error');
end;
end;

procedure TfrmOtherRep.btnPrintClick(Sender: TObject);
begin
try
  if Redit.GetTextLen>1 then
  begin
  memo1.Lines.SaveToFile('PRN');
  Redit.Lines.SaveToFile('PRN');
  end
  else
  showmessage('Nothing to print');
except
  ShowMessage('Printer not responding');
end;

end;

procedure TfrmOtherRep.btnIncomeClick(Sender: TObject);
var tmp:string;
begin
Redit.Lines.clear;
redit.Lines.Add(#14+padc(genperf.edtOrgnm.text,40));
redit.Lines.add('');
tmp:='Income for '+datetostr(sdt.date);
if not (edt.date=sdt.date) then tmp:=tmp+' to '+datetostr(edt.date);
Redit.lines.add(tmp);Redit.Lines.Add('');
mydata.qryIncme.Params[0].Value:=SDT.date;
mydata.qryIncme.Params[1].Value:=EDT.date;
{tmp:='AcType=''Cr''';
mydata.qryAcList.filter:=tmp;
if cbox.text<>'' then
mydata.qryAcList.filter:=tmp+' and '+cbox.text;
mydata.qryAcList.Filtered:=true;}
mydata.qryIncme.Open;
createreport(Redit,Mydata.qryIncme,[-4,10,12,30,-10, -10],[4, 5],
['RecNo','Bill no','Date','Name','Amount', 'Late_Fee'],[1],[-26, -30]);
mydata.qryIncme.close;
end;

procedure TfrmOtherRep.btnMemoListClick(Sender: TObject);
var tmp:string;
begin
Redit.Lines.clear;
redit.Lines.Add(#14+padc(genperf.edtOrgnm.text,40));
redit.Lines.add('');
tmp:='Item Report for '+datetostr(sdt.date);
if not (edt.date=sdt.date) then tmp:=tmp+' to '+datetostr(edt.date);
Redit.lines.add(tmp);Redit.Lines.Add('');
mydata.qryAcHead.Params[0].Value:=SDT.date;
mydata.qryAcHead.Params[1].Value:=EDT.date;
{if cbox.text<>'' then
begin
mydata.qryTranList.filter:=cbox.text;
mydata.qryTranList.Filtered:=true;
end;}
mydata.qryAcHead.Open;
createreport(Redit,Mydata.qryAcHead,[30,-11],[1],
['Item','Amount'],[0],[-35]);
mydata.qryAcHead.close;
//mydata.qryAcHead.filtered:=false;
//mydata.qryAcHead.filter:='';
end;

procedure TfrmOtherRep.ZoomInExecute(Sender: TObject);
begin
Redit.Font.Size:=Redit.Font.Size+1;
end;

procedure TfrmOtherRep.ZoomOutExecute(Sender: TObject);
begin
Redit.Font.Size:=Redit.Font.Size-1;
end;

procedure TfrmOtherRep.btnCrListClick(Sender: TObject);
var tmp:string;
//cinc,closs,binc,bloss:real;
begin
Redit.Lines.clear;
redit.Lines.Add(#14+padc(genperf.edtOrgnm.text,40));
redit.Lines.add('');
tmp:='Bank Statment for '+datetostr(sdt.date);
if not (edt.date=sdt.date) then tmp:=tmp+' to '+datetostr(edt.date);
Redit.lines.add(tmp);Redit.Lines.Add('');
//Calculation Cash Income and expense
mydata.qryBank.Params[0].Value:=SDT.date;
mydata.qryBank.Params[1].Value:=EDT.date;
mydata.qryBank.Open;
createreport(Redit,Mydata.qryBank,[15,30,25,-11],[3],
['Chq No.','Bank','Branch','Amount'],[0],[-35]);
mydata.qryBank.close;
end;


procedure TfrmOtherRep.btnExpenseClick(Sender: TObject);
var tmp:string;
begin
Redit.Lines.clear;
redit.Lines.Add(#14+padc(genperf.edtOrgnm.text,40));
redit.Lines.add('');
tmp:='Vouchers List for '+datetostr(sdt.date);
if not (edt.date=sdt.date) then tmp:=tmp+' to '+datetostr(edt.date);
Redit.lines.add(tmp);Redit.Lines.Add('');
{mydata.qryAcList.Params[0].Value:=SDT.date;
mydata.qryAcList.Params[1].Value:=EDT.date;
tmp:='AcType=''Dr''';
mydata.qryAcList.filter:=tmp;
if cbox.text<>'' then
mydata.qryAcList.filter:=tmp+' and '+cbox.text;
mydata.qryAcList.Filtered:=true;
mydata.qryAcList.Open;
createreport(Redit,Mydata.qryAcList,[-4,20,2,-6,-10],[3,4],
['AcCode','Account','Type','Count','Amount'],[1],[-26,-12]);
mydata.qryAcList.close;
mydata.qryAcList.filtered:=false;
mydata.qryAcList.filter:='';}
end;

procedure TfrmOtherRep.btnSalaryClick(Sender: TObject);
var tmp:string;
begin
Redit.Lines.clear;
redit.Lines.Add(#14+padc(genperf.edtOrgnm.text,40));
redit.Lines.add('');
tmp:='Salary Statment for '+datetostr(sdt.date);
if not (edt.date=sdt.date) then tmp:=tmp+' to '+datetostr(edt.date);
Redit.lines.add(tmp);Redit.Lines.Add('');
mydata.qryPayroll.Params[0].Value:=SDT.date;
mydata.qryPayroll.Params[1].Value:=EDT.date;
mydata.qryPayroll.Open;
createreport(Redit,Mydata.qryPayroll,[30,10,-15],[2],
['Name','A/c','Amount'],[0],[-35]);
mydata.qryPayroll.close;
end;

procedure TfrmOtherRep.btnYrlyClick(Sender: TObject);
//var tmp:string;
begin
Redit.Lines.clear;
redit.Lines.Add(#14+padc(genperf.edtOrgnm.text,40));
redit.Lines.add('');
//tmp:='Salary Statment for '+datetostr(sdt.date);
//if not (edt.date=sdt.date) then tmp:=tmp+' to '+datetostr(edt.date);
//Redit.lines.add(tmp);Redit.Lines.Add('');
//mydata.qryYrly.Params[0].Value:=SDT.date;
//mydata.qryYrly.Params[1].Value:=EDT.date;
mydata.qryYrly.Open;
createreport(Redit,Mydata.qryYrly,[30,8,8,20,10,10,6,12,8,14],[4,5,6,7,8,9],
['Name','A/c','PF A/c','Payscale','Basic','DA','HRA','Gross','PF','Net Amt'],[0,1,3,4,5],[-67,11,6,12,8,14]);
mydata.qryYrly.close;
end;

procedure TfrmOtherRep.btnFeestmtClick(Sender: TObject);
var tmp:string;
//cinc,closs,binc,bloss:real;
begin
Redit.Lines.clear;
redit.Lines.Add(#14+padc(genperf.edtOrgnm.text,40));
redit.Lines.add('');
tmp:='Student wise fee collection for '+datetostr(sdt.date);
if not (edt.date=sdt.date) then tmp:=tmp+' to '+datetostr(edt.date);
Redit.lines.add(tmp);Redit.Lines.Add('');
//Calculation Cash Income and expense
mydata.qryfeeacc.Params[0].Value:=SDT.date;
mydata.qryFeeacc.Params[1].Value:=EDT.date;
mydata.qryFeeacc.Open;
createreport(Redit,Mydata.qryFeeacc,[15,4,6,25,-11],[4],
['Class','Sec','StudID','Name','Amount'],[0],[-35]);
mydata.qryFeeacc.close;
end;

end.
