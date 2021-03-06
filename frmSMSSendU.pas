unit frmSMSSendU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  Vcl.Buttons,system.json, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmSMSSend = class(TForm)
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    btnSend: TButton;
    btnGetList: TButton;
    btnCheckBal: TButton;
    NetHTTPRequest1: TNetHTTPRequest;
    NetHTTPClient1: TNetHTTPClient;
    PageControl1: TPageControl;
    pg_sendsms: TTabSheet;
    History: TTabSheet;
    mmPhoneList: TRichEdit;
    mmMsg: TMemo;
    mmLog: TMemo;
    DBGrid1: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSendClick(Sender: TObject);
    procedure btnGetListClick(Sender: TObject);
    procedure btnCheckBalClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSMSSend: TfrmSMSSend;

implementation

{$R *.dfm}

uses MyDataU,myfuncu;

procedure TfrmSMSSend.btnCheckBalClick(Sender: TObject);
var url,bal:string;
Ss: TStringStream;
jv: TJsonValue;
begin
{--Old code for request
bal:=getBalance(mydata.apikey);
mmlog.Lines.Add(bal);  }
Ss:= TStringStream.Create ( '' , TEncoding.Default);ss.Clear;
url := 'http://api.textlocal.in/balance/?apiKey='+mydata.apikey;
NetHTTPClient1.Get(url,ss);
//NetHTTPRequest1.Get(url,ss);
//ss.WriteString(Memo1.Text);
{ --- Using Post
    self.NetHTTPClient1.Accept := 'text/html, application/xhtml+xml, */*';
    self.NetHTTPClient1.ContentType := 'application/x-www-form-urlencoded';
    self.NetHTTPClient1.AcceptEncoding := 'UTF-8';
    ss.Position := 0 ;
    mmlog.Text:=NetHTTPRequest1.Post(url, ss).ContentAsString(tencoding.UTF8);
    //mmLog.Text:=self.NetHTTPClient1.Post(url, ss).ContentAsString(tencoding.UTF8);
    }
//
//{"balance":{"sms":5394},"status":"success"}
if (mydata.debug='debug123') then begin
mmlog.Lines.Add(ss.DataString);
mmlog.Lines.Add(url);
end;
jv:=TJSONObject.ParseJSONValue(ss.DataString);
bal:=jv.GetValue<string>('balance.sms');

mmlog.Lines.Add('Balance :'+bal);ss.Free;
end;

procedure TfrmSMSSend.btnGetListClick(Sender: TObject);
var clcode:string;
cnt,pcnt,i,sz:integer;
begin
mydata.qryCustom.close;sz:=80;
clcode:=DBLookupComboBox1.KeyValue;
mydata.qryCustom.SQL.Text:='select count(*) from studmast where '+
'catcode<>0 and M_PHONE is not null and clcode='+clcode;
mydata.qryCustom.Open;cnt:=mydata.qryCustom.Fields[0].Value;
pcnt:=1;if cnt>sz then pcnt:=round(cnt/sz);mmPhoneList.Lines.Clear;
for I := 1 to pcnt do
begin
mydata.qryCustom.close;
mydata.qryCustom.SQL.Text:='select group_concat(m_phone) numlist from (select m_phone from studmast where '+
'catcode<>0  and M_PHONE is not null and clcode='+clcode+
' '+format('limit %d,%d',[(i-1)*sz,i*sz])+  ') t';
mydata.qryCustom.Open;
mmPhoneList.Lines.Add(mydata.qryCustom.FieldValues['numlist'])
end

//mmMsg.Lines.AddStrings(mydata.qryCustom.SQL);
//mmPhoneList.Lines.Add(mydata.qryCustom.FieldValues['numlist']);
end;

procedure TfrmSMSSend.btnSendClick(Sender: TObject);
var url,stat,msg:string;
Ss: TStringStream;
jv: TJsonValue;
Params: TStringList;
begin
//SendSMS(const Username, Password, Sender, Numbers,msg: String): String;

//tmp:=Format(URL,[mydata.apikey,mydata.smssender,mmPhoneList.Text,(mmMsg.Text)]);
//mmlog.Lines.Add(tmp);
//tmp:=SendSMS(mydata.smsuid,mydata.apikey,mydata.smssender,mmPhoneList.Text,mmMsg.Text);

{--Old code for sending sms
tmp:=Send_SMS(mydata.apikey,mydata.smssender,mmPhoneList.Text,mmMsg.Text);
mmlog.Lines.Add(tmp);}
params := TStringList.Create;
//url := 'http://api.textlocal.in/send/?apiKey='+mydata.apikey+'&message='+mmMsg.Text+'&sender='+mydata.smssender+'&numbers='+mmPhoneList.Text;
url := 'http://api.textlocal.in/send/';
Ss:= TStringStream.Create ( '' , TEncoding.Default);ss.Clear;
params.Add('apiKey='+mydata.apikey);
params.Add('message='+mmMsg.Text);
params.Add('sender='+mydata.smssender);
params.Add('numbers='+mmPhoneList.Text);
//params.Add('test=1');

NetHTTPRequest1.Post(url, params,ss).ContentAsString(TEncoding.default);
jv:=TJSONObject.ParseJSONValue(ss.DataString);
stat:=jv.GetValue<string>('status');
msg:=jv.GetValue<string>('message.content');
mmLog.Lines.Add('Status  :'+stat);
mmLog.Lines.Add('Balance :'+jv.GetValue<string>('balance'));
mmLog.Lines.Add('Message :'+msg);
ss.Free;
if (stat='success') then
with mydata do
  begin
  smslog.append;
  smslogmessage.Value:=msg;
  smslognumsms.Value:=jv.GetValue<integer>('cost');
  smslogreclist.Value:=mmPhoneList.Text;
  smslog.Post;
  end;



//{"test_mode":true,"balance":5392,"batch_id":99,"cost":1,"num_messages":1,
//"message":{"num_parts":1,"sender":"TGRSCH","content":"Dear Parents , hhh"},"receipt_url":"",
//"custom":"","messages":[{"id":1,"recipient":919334615827}],"status":"success"}

//bal:=jv.GetValue<string>('balance.sms');
//mmlog.Lines.Add(ss.DataString);

end;

procedure TfrmSMSSend.FormActivate(Sender: TObject);
begin
MyData.actlstds:=MyData.dummyT;
mydata.StudMast.Open;
mydata.CLMast.Open;
mydata.smslog.Open;
//ChBx.Checked:=False;
//RdGp.ItemIndex:=0;
end;

procedure TfrmSMSSend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mydata.smslog.close;
mydata.CLMast.close;
mydata.StudMast.close;
end;

procedure TfrmSMSSend.SpeedButton1Click(Sender: TObject);
var url,bal:string;
Ss: TStringStream;
jv: TJsonValue;
begin
Ss:= TStringStream.Create ( '' , TEncoding.Default);
url := 'http://api.textlocal.in/balance/?apiKey='+mydata.apikey;
ss.Clear;
NetHTTPClient1.Get(url,ss);
//NetHTTPRequest1.Get(url,ss);
//ss.WriteString(Memo1.Text);
{ --- Using Post
    self.NetHTTPClient1.Accept := 'text/html, application/xhtml+xml, */*';
    self.NetHTTPClient1.ContentType := 'application/x-www-form-urlencoded';
    self.NetHTTPClient1.AcceptEncoding := 'UTF-8';
    ss.Position := 0 ;
    mmlog.Text:=NetHTTPRequest1.Post(url, ss).ContentAsString(tencoding.UTF8);
    //mmLog.Text:=self.NetHTTPClient1.Post(url, ss).ContentAsString(tencoding.UTF8);
    }
//
//{"balance":{"sms":5394},"status":"success"}
jv:=TJSONObject.ParseJSONValue(ss.DataString);
bal:=jv.GetValue<string>('balance.sms');
mmlog.Lines.Add(ss.DataString);
mmlog.Lines.Add(bal);
ss.Free;

end;

end.
