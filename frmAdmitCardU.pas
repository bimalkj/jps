unit frmAdmitCardU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,frxCross, frxClass, frxDBSet;

type
  TfrmAdmitCard = class(TForm)
    dtpExdate: TDateTimePicker;
    Label1: TLabel;
    dtpExTime: TDateTimePicker;
    dtpReptime: TDateTimePicker;
    Label2: TLabel;
    Label6: TLabel;
    edtVenue: TEdit;
    Label3: TLabel;
    btnAdmitCard: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdmitCardClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdmitCard: TfrmAdmitCard;

implementation

{$R *.dfm}

uses MyDataU;

procedure TfrmAdmitCard.btnAdmitCardClick(Sender: TObject);
begin
mydata.frxReport1.LoadFromFile('frxAdmitCard.fr3',true);
(mydata.frxReport1.findobject('mmVenue') as TfrxMemoview).Text:='Venue :'+edtVenue.text;
(mydata.frxReport1.findobject('mmExdt') as TfrxMemoview).Text:=
'Examination Date : '+FormatDateTime('dd/mmm/yyyy',dtpExdate.Date)+'  Time :'+
 timetostr(dtpExTime.Time)+'            Reporting time :'+timetostr(dtpReptime.Time);

//if repnme='./feeheadstud.fr3' then
//     'Fee Heads For Groups';
mydata.frxreport1.ShowReport();
end;

procedure TfrmAdmitCard.FormActivate(Sender: TObject);
begin
dtpExdate.Date:=mydata.mfile.ReadDate('AdmitCard','ExamDate',date());
dtpExTime.Time:=mydata.mfile.ReadTime('AdmitCard','ExamTime',time());
dtpReptime.Time:=mydata.mfile.ReadTime('AdmitCard','RepTime',time());
mydata.adm_studmastXI.Open;
end;

procedure TfrmAdmitCard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mydata.adm_studmastXI.Close;
mydata.mfile.WriteDate('AdmitCard','ExamDate',dtpExdate.Date);
mydata.mfile.WriteTime('AdmitCard','ExamTime',dtpExTime.Time);
mydata.mfile.WriteTime('AdmitCard','RepTime',dtpReptime.Time);
end;

end.
