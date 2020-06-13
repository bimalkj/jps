unit frmXlreportU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.DBCtrls;

type
  TfrmXlreport = class(TForm)
    dbgAdhoc: TDBAdvGrid;
    Splitter1: TSplitter;
    btnExport: TBitBtn;
    SaveDialog1: TSaveDialog;
    DBLookupComboBox1: TDBLookupComboBox;
    btnGo: TSpeedButton;
    procedure btnExportClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmXlreport: TfrmXlreport;

implementation

{$R *.dfm}

uses MyDataU;

procedure TfrmXlreport.btnExportClick(Sender: TObject);
begin
if SaveDialog1.Execute then
try
  dbgAdhoc.SaveToXLS(SaveDialog1.FileName);
  showmessage('File exported successfully');
except on E:exception do
  showmessage(e.Message);
end;
end;

procedure TfrmXlreport.btnGoClick(Sender: TObject);
var sql,tmp:string;
i:integer;

begin
sql:=mydata.tbRepMastrep_sql.GetAsWideString;i:=0;
while (pos(':_',sql)>0) do
begin
inc(i);
tmp:=InputBox('Value input','Input parameter '+inttostr(i)+' :','');
sql:=StringReplace(sql,':_',tmp,[]);
end;
mydata.qryAdHocSQL.close;
mydata.qryAdHocSQL.SQL.Text:=sql;
//showmessage(mydata.qryAdHocSQL.SQL.Text);
mydata.qryAdHocSQL.Open;
//dbgAdhoc.Reload;
end;

procedure TfrmXlreport.FormActivate(Sender: TObject);
begin
mydata.tbRepMast.Open;
end;

procedure TfrmXlreport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mydata.tbRepMast.close;
end;

end.
