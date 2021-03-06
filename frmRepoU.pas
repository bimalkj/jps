unit frmRepoU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons,DB, ExtCtrls, DBCtrls, Grids,
  DBGrids, frxClass, DBAccess, MyAccess, frxDBSet, MemDS, frxCross,
  frxExportPDF;

type
  TfrmRepo = class(TForm)
    btnBusList: TSpeedButton;
    BitBtn1: TBitBtn;
    REdit: TRichEdit;
    btnFeeCollec: TSpeedButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    SDT: TDateTimePicker;
    EDT: TDateTimePicker;
    btnDefaulter: TSpeedButton;
    btnFreeship: TSpeedButton;
    btnFeeHead: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    dbfilter: TDBLookupComboBox;
    btnPrint: TBitBtn;
    Memo1: TMemo;
    btnClass: TSpeedButton;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxCrossObject1: TfrxCrossObject;
    frxPDFExport1: TfrxPDFExport;
    procedure btnBusListClick(Sender: TObject);
    procedure btnFeeCollecClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDefaulterClick(Sender: TObject);
    procedure btnFreeshipClick(Sender: TObject);
    procedure btnFeeHeadClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrintClick(Sender: TObject);
    procedure btnClassClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRepo: TfrmRepo;

implementation

uses MyDataU,MyfuncU, genperfU;

{$R *.dfm}
procedure CreateReport(tm:TRichEdit;TDB:TDataSet;ar,sumfields:array of integer;ast:array of string;flt,flen:array of integer);
{
tm:RichEdit component
TDB :Table or Query
ar:array of number for difffernt alignment for fields
sumfields:array of number for summation field
ast:array of string for field heading
flt:array of integer for marking the field as float type
flen:array of integer of flt
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
tm.Lines.Add('');
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
finalstr:='';
if length(sumfields)>0 then
if sumfields[0]>0 then
begin
   finalstr:=finalstr+'Total : ';
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

procedure TfrmRepo.btnBusListClick(Sender: TObject);
var
i:integer;
begin
Redit.Lines.clear;
Redit.Lines.Add(#14+padc('Students travelling by Bus',40));
Redit.Lines.add('');
if dbfilter.Text<>'' then
Mydata.QrByBus.Filter:='ClCode='+QuotedStr(dbfilter.KeyValue)
else Mydata.QrByBus.Filter:='';
Mydata.QrByBus.Open;
i:=Mydata.QrByBus.RecordCount;
createreport(Redit,Mydata.QrByBus,[10,15,-16,3,0,0,0],[],
['Stud Id','Name','Roll No','Section','','',''],[],[]);
Redit.Lines.Add('Total Student travelling by bus :'+inttostr(i));
Mydata.QrByBus.close;
end;

procedure TfrmRepo.btnFeeCollecClick(Sender: TObject);
var tmp:string;
begin
Redit.Lines.clear;
tmp:='Fee Collection Register for'+datetostr(sdt.date);
if not (edt.date=sdt.date) then tmp:=tmp+' to '+datetostr(edt.date);
Redit.lines.add(tmp);
mydata.QryFeeColl.Params[0].Value:=SDT.Date;
mydata.QryFeeColl.Params[1].Value:=EDT.Date;
if not(dbfilter.Text='') then
begin
mydata.qryfeecoll.Filter:='Descr='''+dbfilter.Text+'''';
mydata.QryFeeColl.Filtered:=true;
end;
mydata.QryFeeColl.Open;
createreport(Redit,mydata.QryFeeColl,[7,24,10,6,-12,8,-9],[4],
['AdmNo','StudentName','Class','Section','Fee Amount','Receipt No','Book No'],[2,3,4],[-55]);
mydata.QryFeeColl.close;
mydata.QryFeeColl.filtered:=false;
mydata.QryFeeColl.filter:='';
end;

procedure TfrmRepo.FormActivate(Sender: TObject);
begin
frmRepo.SDT.DateTime :=date;
frmRepo.EDT.DateTime  :=date;
dbfilter.KeyValue:=Null;
mydata.CLMast.Open ;
end;

procedure TfrmRepo.btnDefaulterClick(Sender: TObject);
var
day,month,yr:word;
mth,term:integer;
begin
DecodeDate(date,yr,month,day); //mth:=month-strtoint(genperf.edtsession.text);
mth:=month-strtoint(genperf.edtsession.text);
if mth<=0 then mth:=12-abs(mth); //term:=(mth div strtoint(genperf.edit2.text))+1;
term:=(mth div strtoint(genperf.edtMnthTerm.text));
//term:=term;
mydata.spdefaulter.Active:=false;
mydata.spdefaulter.Params[0].Value:=term;
if (trim(dbfilter.Text)<>'') then
begin
mydata.spdefaulter.Filter:='clcaption='''+dbfilter.text+'''';
mydata.spdefaulter.Filtered:=true;
end else mydata.spdefaulter.Filtered:=false;
mydata.spdefaulter.Active:=true;
//ShowMessage(INTTOSTR(TERM));
frxReport1.LoadFromFile('frxdefaulterSumm.fr3', true) ;
frxReport1.ShowReport();



{DecodeDate(date,yr,month,day);
//mth:=month-strtoint(genperf.edtsession.text);
mth:=month-strtoint(genperf.edtsession.text);
if mth<=0 then mth:=12-abs(mth);
//term:=(mth div strtoint(genperf.edit2.text))+1;
term:=(mth div strtoint(genperf.edit2.text));
Redit.Lines.clear;
Redit.Lines.Add(#14+padc('Defaulter List',40));
Redit.Lines.add('');
mydata.QryDefaulter.Params[0].Value:=term;
mydata.QryDefaulter.Params[1].Value:=term;
//mydata.QryDefaulter.Params[2].Value:=term;
if (term > mydata.StudMastNOTERMS.Value) then mydata.QryDefaulter.SQL.Strings[2]:=',(clmast.mfee *(studmast.NOTERMS-:tm))-clmast.Adfee'
else mydata.QryDefaulter.SQL.Strings[2]:=',(clmast.mfee *(studmast.NOTERMS-:tm))+clmast.Adfee';
if not(dbfilter.Text='') then
begin
mydata.qryDefaulter.Filter:='Descr='''+dbfilter.Text+'''';
mydata.QryDefaulter.Filtered:=true;
end;
//mydata.QryDefaulter.Filtered:=true;
//showmessage(mydata.QryDefaulter.SQL.Text);
mydata.QryDefaulter.Open;
createreport(Redit,mydata.QryDefaulter,[15,3,-11,25,-8,-12,-7,0,-8],[4,5],
['Class','Sec','AdmNo','Name','NoTerms','Totalfees','Addfee','','FeesDue'],[1],[-60,-12]);
mydata.QryDefaulter.close;
mydata.QryDefaulter.filtered:=false;
mydata.QryDefaulter.filter:='';
}
end;


procedure TfrmRepo.btnFreeshipClick(Sender: TObject);
var
i:integer;
begin
Redit.Lines.clear;
Redit.Lines.Add(#14+padc('FreeShip Student',40));
Redit.Lines.add('');
Mydata.QryFreeship.Open;
i:=Mydata.QryFreeship.RecordCount;
createreport(Redit,Mydata.QryFreeship,[8,8,20,9,16,10],[],
['Class','Section','Name','Roll No','Guardian Name','Address'],[],[]);
Redit.Lines.Add('Total Number of Freeship Student :'+inttostr(i));
Mydata.QryFreeship.close;
end;


procedure TfrmRepo.btnFeeHeadClick(Sender: TObject);
var
tmpstr:string;
heading,rowstr:array[1..30] of string;
tot:array[1..30] of real;
colcnt,i:integer;
rowtot,tamt,gtot:real;
mrno:string;
begin
Redit.Lines.clear;
Redit.Lines.Add(#14+padc('Head Separation register',40));
redit.lines.Add(repchar('-',50));
for i:=1 to 30 do
        begin
        heading[i]:='';
        tot[i]:=0;
        end;
with mydata do
 begin
 QryFeehdwise.Params[0].Value:=SDT.Date;
 QryFeehdwise.Params[1].Value:=EDT.Date;
 qryFeehdwise.Open;
 tbAcMaster.open;
// qrfee.Sql.Strings[3]:='And
 colcnt:=tbAcMaster.RecordCount;gtot:=0;
 while not tbacmaster.Eof do
 begin
 heading[tbacmasterAC_NO.asinteger]:=mydata.tbAcMasterAC_CODE.value;
 tbacmaster.next;
 end;
   tmpstr:='Cls           Sec ADMNo   ';
   for i:=1 to colcnt do tmpstr:=tmpstr+format('%12s',[heading[i]]);
   tmpstr:=tmpstr+'      RowTotal' ;
 redit.Lines.add(tmpstr);
 tbacMaster.Close;
 redit.lines.Add(repchar('=',15*(colcnt+2)));
  while not qryFeehdwise.Eof do
        begin
        tmpstr:=format('%-14s %2s %-7S ',[qryfeehdwiseDescr.value,qryfeehdwisesection.value,qryfeehdwiseAdmNo.Asstring]);
        rowtot:=0;mrno:=qryfeehdwisemr_no.asstring;
        for i:=1 to colcnt do rowstr[i]:=format('%12s',[' ']);
        while (qryfeehdwisemr_no.value=mrno) and (not qryFeehdwise.eof) do
                begin
                i:=qryFeehdwiseAC_NO.asinteger;
                tamt:=0;if not (qryfeehdwiseAC_AMTpaid.IsNull) then tamt:=qryFeehdwiseAC_AMTpaid.value;
                rowstr[i]:=format('%12.2f',[tamt]);
                rowtot:=rowtot+tamt;
                tot[i]:=tot[i]+tamt;
                mrno:=qryfeehdwisemr_no.value;
                qryFeehdwise.next;
                end;
                for i:=1 to colcnt do tmpstr:=tmpstr+rowstr[i];
                tmpstr:=tmpstr+format('%12.2f',[rowtot]);gtot:=gtot+rowtot;
                redit.Lines.add(tmpstr);
        //qryFeehdwise.Next;
        end;
 qryFeehdwise.Close;
 redit.lines.Add(repchar('-',15*(colcnt+2)));
 tmpstr:='  Total          :        ';
 for i:=1 to colcnt do tmpstr:=tmpstr+format('%12f',[tot[i]]);
 tmpstr:=tmpstr+format('%12f',[gtot]);
 redit.lines.add(tmpstr);
 qrFee.close;
 tbFee.close;
 tbfeeDetail.close;
 end;
end;
procedure TfrmRepo.Button1Click(Sender: TObject);
//var
//i:integer;
//tmp:string;
begin
Redit.Lines.clear;
//tmp:='Total Number of TC issued     '+datetostr(sdt.date);
//if not (edt.date=sdt.date) then tmp:=tmp+' to '+datetostr(edt.date);
//Redit.lines.add(tmp);
{mydata.TcData.Filter :='Tcdate>='
 +#39+datetostr(edt.date)+#39+' and TcDate<=' +#39+datetostr(edt.date)+#39;
mydata.TcData.Filtered:=true;
mydata.TcData.Open;
i:=Mydata.TcData.RecordCount;
createreport(Redit,mydata.TcData,[8,8,6,6,15,5],[],
['AdmNo','TcNo','DateLeft','TCDate','Name','Class'],[],[]);
mydata.TcData.close;
mydata.Tcdata.filtered:=false;
mydata.Tcdata.filter:='';}
end;

procedure TfrmRepo.SpeedButton1Click(Sender: TObject);
var
//i:integer;
tmp:string;
begin
Redit.Lines.clear;
tmp:='Total Number of TC issued'+datetostr(sdt.date);
if not (edt.date=sdt.date) then tmp:=tmp+' to '+datetostr(edt.date);
Redit.lines.add(tmp);
mydata.QrTc.Filter :='Tcdate>='
 +#39+datetostr(sdt.date)+#39+' and TcDate<=' +#39+datetostr(edt.date)+#39;
mydata.QrTc.Filtered:=true;
mydata.QrTc.Open;
//i:=Mydata.QrTc.RecordCount;
createreport(Redit,Mydata.QrTc,[8,10,-12,10,20,5,8],[],
['AdmNo','TcDate','Date Left','CL Code','Name','Section','RollNo'],[],[]);
mydata.QrTc.close;
mydata.QrTc.filtered:=false;
mydata.QrTc.filter:='';
end;

procedure TfrmRepo.SpeedButton2Click(Sender: TObject);
var
tmp:string;
i:integer;
begin
Redit.Lines.clear;
tmp:='Total Admission for'+datetostr(sdt.date);
if not (edt.date=sdt.date) then tmp:=tmp+' to '+datetostr(edt.date);
Redit.lines.add(tmp);
mydata.Qrtotadm.Params[0].Value:=SDT.Date;
mydata.Qrtotadm.Params[1].Value:=EDT.Date;
mydata.Qrtotadm.Filtered:=true;
mydata.Qrtotadm.Open;
i:=Mydata.Qrtotadm.RecordCount;
createreport(Redit,mydata.Qrtotadm,[8,15,-6,8,12,15],[],
['StudId','Name','ClCode','Section','DOB','Fname'],[],[]);
Redit.Lines.Add('Total Number of Student :'+inttostr(i));
mydata.Qrtotadm.close;
mydata.Qrtotadm.filtered:=false;
mydata.Qrtotadm.filter:='';
end;


procedure TfrmRepo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mydata.ClMast.Close;
end;

procedure TfrmRepo.btnPrintClick(Sender: TObject);
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

procedure TfrmRepo.btnClassClick(Sender: TObject);
var tmp:string;
begin
Redit.Lines.clear;
tmp:='class wise Fee Collection report for'+datetostr(sdt.date);
if not (edt.date=sdt.date) then tmp:=tmp+' to '+datetostr(edt.date);
Redit.lines.add(tmp);
mydata.Qryclrep.Params[0].Value:=SDT.Date;
mydata.Qryclrep.Params[1].Value:=EDT.Date;
if not(dbfilter.Text='') then
begin
mydata.qryclrep.Filter:='Desc='''+dbfilter.Text+'''';
mydata.Qryclrep.Filtered:=true;
end;
mydata.Qryclrep.Open;
createreport(Redit,mydata.Qryclrep,[15,-25],[1],
['Class','Amount'],[0],[-40]);
mydata.Qryclrep.close;
mydata.Qryclrep.filtered:=false;
mydata.Qryclrep.filter:='';
end;


end.







