unit frmDailyAttndU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.DBCtrls;

type
  TfrmDailyAttnd = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    dtpCdate: TDateTimePicker;
    Date: TLabel;
    edtSection: TComboBox;
    dblkClass: TDBLookupComboBox;
    Label3: TLabel;
    edtRoll: TEdit;
    btnMArkAbsent: TButton;
    lblStName: TLabel;
    btnFind: TButton;
    procedure dtpCdateChange(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnMArkAbsentClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    stid:integer;
  end;

var
  frmDailyAttnd: TfrmDailyAttnd;

implementation

{$R *.dfm}

uses MyDataU;

procedure TfrmDailyAttnd.btnFindClick(Sender: TObject);
var sql:string;
begin
mydata.qryCustom.close;
sql:=format('select studid,name from studmast where clcode=%s and section="%s" and rollno=%s',
[dblkClass.KeyValue,edtSection.Text,edtRoll.Text]);
mydata.qryCustom.SQL.Text:=sql;
mydata.qryCustom.Open;
if mydata.qryCustom.IsEmpty then
  begin lblStname.Caption:='Invalid selection '; btnMArkAbsent.Enabled:=false;end
else
 begin
 lblStname.Caption:=mydata.qryCustom.Fields[1].Value;
 stid:=mydata.qryCustom.Fields[0].Value;
 btnMArkAbsent.Enabled:=true;
 end;
end;

procedure TfrmDailyAttnd.btnMArkAbsentClick(Sender: TObject);
begin
mydata.qryCustom.SQL.text:=format('insert into studattend(studid,dte) values(%d,"%s")',
[stid,FormatDateTime('yyyy-mm-dd',dtpCdate.Date)]);
mydata.qryCustom.Execute;
mydata.qryStudAttnd.Refresh;
end;

procedure TfrmDailyAttnd.dtpCdateChange(Sender: TObject);
begin
mydata.qryStudAttnd.FilterSQL:='dte="'+FormatDateTime('yyyy-mm-dd',dtpCdate.Date)+'"';

end;

procedure TfrmDailyAttnd.FormActivate(Sender: TObject);
begin
dtpCdate.Date:=now;
dtpCdateChange(self);
mydata.qryStudAttnd.Open;
mydata.ClMast.Open;
end;

procedure TfrmDailyAttnd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mydata.ClMast.close;
mydata.qryStudAttnd.close;
end;

end.
