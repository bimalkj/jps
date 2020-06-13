unit frmClListU;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, DBCtrls,frxClass;

type
  TfrmClList = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    ChBx: TCheckBox;
    RdGp: TRadioGroup;
    RdGp2: TRadioGroup;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    cbxGender: TComboBox;
    Label4: TLabel;
    cbxCat: TComboBox;
    Label5: TLabel;
    cbxCaste: TComboBox;
    Label6: TLabel;
    chkExcel: TCheckBox;
    chkAll: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClList: TfrmClList;

implementation

uses MyDataU, qrpCllistU, qrpCllist1U, frmPreviewU, genperfU, myfuncU,strutils,
  frmXlclasslistU;

{$R *.dfm}

procedure TfrmClList.FormActivate(Sender: TObject);
begin
mydata.StudMast.Open;
mydata.CLMast.Open;
ChBx.Checked:=False;
RdGp.ItemIndex:=0;
cbxCat.Items.Clear;
cbxCat.Items.add('ALL');
mydata.catgrmast.Open;
while not mydata.catgrmast.eof do
  begin
  cbxCat.Items.Add(mydata.catgrmastDESCR.Text);
  mydata.catgrmast.Next;
  end;
mydata.catgrmast.Close;
end;

procedure TfrmClList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mydata.CLMast.close;
mydata.StudMast.close;
end;

procedure TfrmClList.OKBtnClick(Sender: TObject);
var rlno:integer;
sl,i:integer;
begin
mydata.qryCllist.SQL[1]:=StringReplace(mydata.qryCllist.SQL[1],'FROM studmast','FROM v_studmast',[]);
sl:=0;
if(combobox1.Text='')or(DBlookupCombobox1.Text='')then
begin
 if ChBx.Checked then
  raise Exception.Create('Can not Allocate Roll Nos. while'+#13+
                         ' Class or Section not specified.');
 if(combobox1.Text='')and(DBlookupCombobox1.Text='')then
  mydata.qryCllist.SQL[2]:='where Clcode>0'
 else if(DBlookupCombobox1.Text='')then
 begin
  mydata.qryCllist.SQL[2]:='where Section=:sec and Clcode>0';
  mydata.qryCllist.Params[0].Value :=combobox1.Text;
 end
 else if(combobox1.Text='')then
 begin
  mydata.qryCllist.SQL[2]:='where ClCode=:ccode';
  mydata.qryCllist.Params[0].Value :=mydata.ClMastClcode.value;
 end;
end
else
begin
mydata.qryCllist.SQL[2]:='where ClCode=:ccode and Section=:sec';
mydata.qryCllist.Params[0].Value :=mydata.ClMastClcode.value;
mydata.qryCllist.Params[1].Value :=combobox1.Text;
end;
if cbxGender.Text<>'ALL' then
mydata.qryCllist.SQL[2]:=mydata.qryCllist.SQL[2]+' and SEX='''+leftstr(cbxGender.Text,1)+'''';
if cbxCaste.Text<>'ALL' then
mydata.qryCllist.SQL[2]:=mydata.qryCllist.SQL[2]+' and CASTE='''+cbxCaste.Text+'''';
if cbxCat.Text<>'ALL' then
mydata.qryCllist.SQL[2]:=mydata.qryCllist.SQL[2]+' and c.descr='''+cbxCat.Text+'''';
mydata.qryCllist.SQL[3]:='ORDER BY Name';
mydata.qryCllist.Open;
if  ChBx.Checked then
begin
rlno:=1;
mydata.qryCllist.First;
while not mydata.qryCllist.Eof do
begin
if mydata.StudMast.Locate('AdmNo',mydata.qryCllistAdmNo.Value,[]) then
begin
mydata.StudMast.Edit;
mydata.StudMastRollNo.Value:=rlno;
mydata.StudMast.Post;
rlno:=rlno+1
end;// if locate
mydata.qryCllist.Next
end;// while
end;// end if  ChBx.Checked then
mydata.qryCllist.Close;
mydata.qryCllist.SQL[3]:='ORDER BY RollNo';
mydata.qryCllist.Open;
if RdGp2.ItemIndex=0 then
begin
if RdGp.ItemIndex=0 then
begin
frmPreview.Width:=704;
frmPreview.Memo1.Width:=680;
frmPreview.BitBtn1.Left:=588;
end
else
begin
frmPreview.Width:=500;
frmPreview.Memo1.Width:=476;
end;
frmPreview.Position:=poDesktopCenter;
with frmPreview.Memo1 do
        begin
        Clear;
        Lines.Add(#27#67+chr(strtoint(genperf.edtLinesPage.Text))+#27#78+
                  chr(strtoint(genperf.edtLineSkip.Text)*2)+chr(14)+
                  padc(genperf.edtOrgnm.text,32));                             //        Lines.Add(#27#78#10);
//        Lines.Add(chr(14)+padc(genperf.edit1.text,32));    //        Lines.Add(#27#65+chr(lnspc)+#27#50);
        Lines.Add(chr(14)+padc(genperf.mmPageHeader.text,32));    //        Lines.Add(#27#65+chr(lnspc)+#27#50);
        Lines.Add('Date :'+DateTOStr(date));               //        Lines.Add(#27#65+chr(lnspc)+#27#50);
        Lines.Add(padc('Class list for '+dblookupcombobox1.Text+' '+
                   combobox1.Text,32));                    //        Lines.Add(#27#65+chr(lnspc)+#27#50);
       if RdGp.ItemIndex=0 then
        begin
        Lines.Add('Adm   Roll     Student''s                         '+
                  'Father''s                Date of');
        Lines.Add('No     No        Name                              Name'+
                  '                   Birth');             //        Lines.Add(#27#65+chr(lnspc)+#27#50);
        Lines.Add(repchar('=',82));
        genperf.Memo3.ReadOnly:=False;
        genperf.Memo3.Clear;
        for i:=0 to Lines.Count-1 do
         genperf.Memo3.Lines.Add(Lines[i]);
        genperf.Memo3.ReadOnly:=true;
        mydata.qryCllist.First;
        while not mydata.qryCllist.Eof do
        begin
        inc(sl);
        Lines.Add(format('%6s %4d %-30s %-30s %-10s',
                        [mydata.qryCllistAdmNo.Value,
                         mydata.qryCllistRollNo.AsInteger,
                         mydata.qryCllistName.Value,
                         mydata.qryCllistFName.Value,
                         mydata.qryCllistDoB.AsString]));   //        Lines.Add(#27#65+chr(lnspc)+#27#50);
        mydata.qryCllist.Next;
        end;                                                        {mydata.qryCllist.Open;        mydata.qryCllist.Open;        mydata.qryCllist.Open;        mydata.qryCllist.Open;}
        Lines.Add(repchar('-',82));
        end
        else
        begin
        Lines.Add('Adm   Roll     Student''s                  Date of');
        Lines.Add('No     No        Name                      Birth');             //        Lines.Add(#27#65+chr(lnspc)+#27#50);
        Lines.Add(repchar('=',52));
        genperf.Memo3.ReadOnly:=False;
        genperf.Memo3.Clear;
        for i:=0 to Lines.Count-1 do
         genperf.Memo3.Lines.Add(Lines[i]);
        genperf.Memo3.ReadOnly:=true;
        mydata.qryCllist.First;
        while not mydata.qryCllist.Eof do
        begin
        inc(sl);
        Lines.Add(format('%6s %4d %-30s %-10s',
                        [mydata.qryCllistAdmNo.Value,
                         mydata.qryCllistRollNo.AsInteger,
                         mydata.qryCllistName.Value,
                         mydata.qryCllistDoB.AsString]));   //        Lines.Add(#27#65+chr(lnspc)+#27#50);
        mydata.qryCllist.Next;
        end;                                                        {mydata.qryCllist.Open;        mydata.qryCllist.Open;        mydata.qryCllist.Open;        mydata.qryCllist.Open;}
        Lines.Add(repchar('-',52));
        end;
        Lines.Add('Total number of students : '+inttostr(sl));
        end;
frmPreview.showmodal;
frmPreview.Memo1.Width:=476;
frmPreview.Width:=500;
frmPreview.BitBtn1.Left:=384;
frmPreview.Position:=poDesktopCenter;
end         //if RdGp2.ItemIndex=0 then
else
begin
if RdGp.ItemIndex=0 then
begin
qrpcllist.QRCldesc.Caption:='Class List of '+DBLookupComboBox1.Text+''+
                             ComboBox1.Text;
qrpcllist.Preview;
end
else if RdGp.ItemIndex=1 then
begin
qrpcllist1.QRCldesc.Caption:='Class List of '+DBLookupComboBox1.Text+''+
                             ComboBox1.Text;
qrpcllist1.Preview;
end
else if RdGp.ItemIndex=2 then
     with mydata do begin
      qryCllist.Params[0].Value :=DBLookupComboBox1.KeyValue;
      qryCllist.Params[1].Value :=combobox1.Text;
      mydata.qryCllist.Open;
       frxReport1.LoadFromFile('frxClassList.fr3',true);
       (frxReport1.findobject('orgnm_memo') as TfrxMemoview).Text:=genperf.edtOrgnm.Text;
       (frxReport1.findobject('hdmemo') as TfrxMemoview).Text:='Class list '+DBLookupComboBox1.Text
       +' '+ComboBox1.Text;
        frxreport1.ShowReport();

     end
else if rdgp.ItemIndex=3 then
     with mydata do begin
     mydata.qryCllist.SQL[1]:=StringReplace(mydata.qryCllist.SQL[1],'FROM v_studmast','FROM studmast',[]);
     mydata.qryCllist.SQL[2]:=mydata.qryCllist.SQL[2]+' and NSO=1';
      qryCllist.Params[0].Value :=DBLookupComboBox1.KeyValue;
      qryCllist.Params[1].Value :=combobox1.Text;
      mydata.qryCllist.Open;
       frxReport1.LoadFromFile('frxClassList.fr3',true);
       (frxReport1.findobject('orgnm_memo') as TfrxMemoview).Text:=genperf.edtOrgnm.Text;
       (frxReport1.findobject('hdmemo') as TfrxMemoview).Text:='Class list '+DBLookupComboBox1.Text
       +' '+ComboBox1.Text;
        frxreport1.ShowReport();

     end
else if rdgp.ItemIndex=4 then
     with mydata do begin
     mydata.qryCllist.SQL[1]:=StringReplace(mydata.qryCllist.SQL[1],'FROM v_studmast','FROM studmast',[]);
     //mydata.qryCllist.SQL[2]:=mydata.qryCllist.SQL[2]+' and NSO=1';
      qryCllist.Params[0].Value :=DBLookupComboBox1.KeyValue;
      qryCllist.Params[1].Value :=combobox1.Text;
      mydata.qryCllist.Open;
       frxReport1.LoadFromFile('frxIdcard.fr3',true);
       (frxReport1.findobject('orgnm_memo') as TfrxMemoview).Text:=genperf.edtOrgnm.Text;
       (frxReport1.findobject('hdmemo') as TfrxMemoview).Text:='Class list '+DBLookupComboBox1.Text
       +' '+ComboBox1.Text;
        frxreport1.ShowReport();

     end
end;
if chkExcel.Checked then
  begin
  if chkall.Checked then
      mydata.ds_spcllist.DataSet:=mydata.sp_cllist
      else
      mydata.ds_spcllist.DataSet:=mydata.qryCllist;
  frmXLclasslist.showmodal;
  end;
mydata.qryCllist.Close;
end;

end.
