unit dlgRepoU;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, DBCtrls, ComCtrls, frxCross, frxClass, frxDBSet,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxCore,
  cxDateUtils, frxExportXLS, Vcl.Dialogs, Vcl.ExtDlgs;

type
  TDlgRepo = class(TForm)
    CancelBtn: TButton;
    btnShow: TBitBtn;
    TreeView1: TTreeView;
    frxDBDataset1: TfrxDBDataset;
    frxCrossObject1: TfrxCrossObject;
    frxReport1: TfrxReport;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    frxDBDataset4: TfrxDBDataset;
    frxDBDataset5: TfrxDBDataset;
    sDate: TcxDateEdit;
    eDate: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    frxDBDfeaulter: TfrxDBDataset;
    updFilter: TUpDown;
    edtFilter: TEdit;
    Label3: TLabel;
    cbxDefaulter: TComboBox;
    Label4: TLabel;
    frxXLSExport1: TfrxXLSExport;
    dbcbxCatCode: TDBLookupComboBox;
    Label13: TLabel;
    btnExport: TBitBtn;
    mmOut: TMemo;
    SaveTextFileDialog1: TSaveTextFileDialog;
    Button1: TButton;
    procedure btnShowClick(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FormActivate(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExportClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DlgRepo: TDlgRepo;
  repnme:string;
  rep_head:string;
  adv_pay:boolean;

implementation

uses MyDataU, Variants, genperfU,strutils;

{$R *.dfm}

function getguid:string;
var Uid: TGuid;
msg:string;
begin
 CreateGuid(Uid);
 msg:=GuidToString(Uid);
 result:=copy(msg,2,36)+inttostr(length(msg));
end;


procedure TDlgRepo.btnExportClick(Sender: TObject);
var h1,h2,h3,f1,f2,f3,txml,dxml:string;
vchno:integer;
dtime:string;
tamt:real;
begin
h1:='<ENVELOPE>' +
' <HEADER>' +
'		<VERSION>1</VERSION>'+
'		<TALLYREQUEST>Import</TALLYREQUEST>'+
'		<TYPE>Data</TYPE>'+
'		<ID>Vouchers</ID>  '+
' </HEADER>' +
' <BODY>' +
'  <IMPORTDATA>' +
'   <REQUESTDESC>' +
//'    <REPORTNAME>Vouchers</REPORTNAME>' +
'    <STATICVARIABLES>' +
'         <IMPORTDUPS>@@DUPCOMBINE</IMPORTDUPS>'+
//'     <SVCURRENTCOMPANY>Jamshedpur Public School (15-16)</SVCURRENTCOMPANY>' +
'    </STATICVARIABLES>' +
'   </REQUESTDESC>' +
'   <REQUESTDATA>' +
'    <TALLYMESSAGE>';

h2:='<VOUCHER>' +
'      <OLDAUDITENTRYIDS.LIST TYPE="Number">' +
'       <OLDAUDITENTRYIDS>-1</OLDAUDITENTRYIDS>' +
'      </OLDAUDITENTRYIDS.LIST>' +
'      <DATE>20151031</DATE>' +
'      <GUID></GUID>' +
'      <NARRATION>4902/2003 SANDHYA RANI XI A</NARRATION>' +
'      <VOUCHERTYPENAME>Receipt</VOUCHERTYPENAME>' +
'      <VOUCHERNUMBER>3</VOUCHERNUMBER>'+
'      <PARTYLEDGERNAME>Union Bank of India,Tinplate</PARTYLEDGERNAME>' +
'      <CSTFORMISSUETYPE/>' +
'      <CSTFORMRECVTYPE/>' +
'      <FBTPAYMENTTYPE>Default</FBTPAYMENTTYPE>' +
'      <PERSISTEDVIEW>Accounting Voucher View</PERSISTEDVIEW>' +
'      <VCHGSTCLASS/>' +
'      <ENTEREDBY>JPS</ENTEREDBY>' +
'      <DIFFACTUALQTY>No</DIFFACTUALQTY>' +
'      <AUDITED>No</AUDITED>' +
'      <FORJOBCOSTING>No</FORJOBCOSTING>' +
'      <ISOPTIONAL>No</ISOPTIONAL>' +
'      <EFFECTIVEDATE>20151031</EFFECTIVEDATE>';
h3:= '      <ISFORJOBWORKIN>No</ISFORJOBWORKIN>' +
'      <ALLOWCONSUMPTION>No</ALLOWCONSUMPTION>' +
'      <USEFORINTEREST>No</USEFORINTEREST>' +
'      <USEFORGAINLOSS>No</USEFORGAINLOSS>' +
'      <USEFORGODOWNTRANSFER>No</USEFORGODOWNTRANSFER>' +
'      <USEFORCOMPOUND>No</USEFORCOMPOUND>' +
'      <ALTERID> 65650</ALTERID>' +
'      <EXCISEOPENING>No</EXCISEOPENING>' +
'      <USEFORFINALPRODUCTION>No</USEFORFINALPRODUCTION>' +
'      <ISCANCELLED>No</ISCANCELLED>' +
'      <HASCASHFLOW>Yes</HASCASHFLOW>' +
'      <ISPOSTDATED>No</ISPOSTDATED>' +
'      <USETRACKINGNUMBER>No</USETRACKINGNUMBER>' +
'      <ISINVOICE>No</ISINVOICE>' +
'      <MFGJOURNAL>No</MFGJOURNAL>' +
'      <HASDISCOUNTS>No</HASDISCOUNTS>' +
'      <ASPAYSLIP>No</ASPAYSLIP>' +
'      <ISCOSTCENTRE>No</ISCOSTCENTRE>' +
'      <ISSTXNONREALIZEDVCH>No</ISSTXNONREALIZEDVCH>' +
'      <ISEXCISEMANUFACTURERON>No</ISEXCISEMANUFACTURERON>' +
'      <ISBLANKCHEQUE>No</ISBLANKCHEQUE>' +
'      <ISVOID>No</ISVOID>' +
'      <ISONHOLD>No</ISONHOLD>' +
'      <ISDELETED>No</ISDELETED>' +
'      <ASORIGINAL>No</ASORIGINAL>' +
'      <VCHISFROMSYNC>No</VCHISFROMSYNC>' +
'      <MASTERID> 42182</MASTERID>' +
'      <VOUCHERKEY>181707181391920</VOUCHERKEY>' +
'      <OLDAUDITENTRIES.LIST>      </OLDAUDITENTRIES.LIST>' +
'      <ACCOUNTAUDITENTRIES.LIST>      </ACCOUNTAUDITENTRIES.LIST>' +
'      <AUDITENTRIES.LIST>      </AUDITENTRIES.LIST>' +
'      <INVOICEDELNOTES.LIST>      </INVOICEDELNOTES.LIST>' +
'      <INVOICEORDERLIST.LIST>      </INVOICEORDERLIST.LIST>' +
'      <INVOICEINDENTLIST.LIST>      </INVOICEINDENTLIST.LIST>' +
'      <ATTENDANCEENTRIES.LIST>      </ATTENDANCEENTRIES.LIST>' +
'      <ORIGINVOICEDETAILS.LIST>      </ORIGINVOICEDETAILS.LIST>' +
'      <INVOICEEXPORTLIST.LIST>      </INVOICEEXPORTLIST.LIST>';

txml:='      <ALLLEDGERENTRIES.LIST>' +
'       <OLDAUDITENTRYIDS.LIST TYPE="Number">' +
'        <OLDAUDITENTRYIDS>-1</OLDAUDITENTRYIDS>' +
'       </OLDAUDITENTRYIDS.LIST>' +
'       <LEDGERNAME>Tuition Fee</LEDGERNAME>' +
'       <GSTCLASS/>' +
'       <ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>' +
'       <LEDGERFROMITEM>No</LEDGERFROMITEM>' +
'       <REMOVEZEROENTRIES>No</REMOVEZEROENTRIES>' +
'       <ISPARTYLEDGER>No</ISPARTYLEDGER>' +
'       <ISLASTDEEMEDPOSITIVE>No</ISLASTDEEMEDPOSITIVE>' +
'       <AMOUNT>1020.00</AMOUNT>' +
'       <BANKALLOCATIONS.LIST>       </BANKALLOCATIONS.LIST>' +
'       <BILLALLOCATIONS.LIST>       </BILLALLOCATIONS.LIST>' +
'       <INTERESTCOLLECTION.LIST>       </INTERESTCOLLECTION.LIST>' +
'       <OLDAUDITENTRIES.LIST>       </OLDAUDITENTRIES.LIST>' +
'       <ACCOUNTAUDITENTRIES.LIST>       </ACCOUNTAUDITENTRIES.LIST>' +
'       <AUDITENTRIES.LIST>       </AUDITENTRIES.LIST>' +
'       <TAXBILLALLOCATIONS.LIST>       </TAXBILLALLOCATIONS.LIST>' +
'       <TAXOBJECTALLOCATIONS.LIST>       </TAXOBJECTALLOCATIONS.LIST>' +
'       <TDSEXPENSEALLOCATIONS.LIST>       </TDSEXPENSEALLOCATIONS.LIST>' +
'       <VATSTATUTORYDETAILS.LIST>       </VATSTATUTORYDETAILS.LIST>' +
'       <COSTTRACKALLOCATIONS.LIST>       </COSTTRACKALLOCATIONS.LIST>' +
'      </ALLLEDGERENTRIES.LIST>' +

'      <ALLLEDGERENTRIES.LIST>' +
'       <OLDAUDITENTRYIDS.LIST TYPE="Number">' +
'        <OLDAUDITENTRYIDS>-1</OLDAUDITENTRYIDS>' +
'       </OLDAUDITENTRYIDS.LIST>' +
'       <LEDGERNAME>Maintenance Fee</LEDGERNAME>' +
'       <GSTCLASS/>' +
'       <ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>' +
'       <LEDGERFROMITEM>No</LEDGERFROMITEM>' +
'       <REMOVEZEROENTRIES>No</REMOVEZEROENTRIES>' +
'       <ISPARTYLEDGER>No</ISPARTYLEDGER>' +
'       <ISLASTDEEMEDPOSITIVE>No</ISLASTDEEMEDPOSITIVE>' +
'       <AMOUNT>80.00</AMOUNT>' +
'       <BANKALLOCATIONS.LIST>       </BANKALLOCATIONS.LIST>' +
'       <BILLALLOCATIONS.LIST>       </BILLALLOCATIONS.LIST>' +
'       <INTERESTCOLLECTION.LIST>       </INTERESTCOLLECTION.LIST>' +
'       <OLDAUDITENTRIES.LIST>       </OLDAUDITENTRIES.LIST>' +
'       <ACCOUNTAUDITENTRIES.LIST>       </ACCOUNTAUDITENTRIES.LIST>' +
'       <AUDITENTRIES.LIST>       </AUDITENTRIES.LIST>' +
'       <TAXBILLALLOCATIONS.LIST>       </TAXBILLALLOCATIONS.LIST>' +
'       <TAXOBJECTALLOCATIONS.LIST>       </TAXOBJECTALLOCATIONS.LIST>' +
'       <TDSEXPENSEALLOCATIONS.LIST>       </TDSEXPENSEALLOCATIONS.LIST>' +
'       <VATSTATUTORYDETAILS.LIST>       </VATSTATUTORYDETAILS.LIST>' +
'       <COSTTRACKALLOCATIONS.LIST>       </COSTTRACKALLOCATIONS.LIST>' +
'      </ALLLEDGERENTRIES.LIST>' +

'      <ALLLEDGERENTRIES.LIST>' +
'       <OLDAUDITENTRYIDS.LIST TYPE="Number">' +
'        <OLDAUDITENTRYIDS>-1</OLDAUDITENTRYIDS>' +
'       </OLDAUDITENTRYIDS.LIST>' +
'       <LEDGERNAME>I-Classes</LEDGERNAME>' +
'       <GSTCLASS/>' +
'       <ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>' +
'       <LEDGERFROMITEM>No</LEDGERFROMITEM>' +
'       <REMOVEZEROENTRIES>No</REMOVEZEROENTRIES>' +
'       <ISPARTYLEDGER>No</ISPARTYLEDGER>' +
'       <ISLASTDEEMEDPOSITIVE>No</ISLASTDEEMEDPOSITIVE>' +
'       <AMOUNT>110.00</AMOUNT>' +
'       <BANKALLOCATIONS.LIST>       </BANKALLOCATIONS.LIST>' +
'       <BILLALLOCATIONS.LIST>       </BILLALLOCATIONS.LIST>' +
'       <INTERESTCOLLECTION.LIST>       </INTERESTCOLLECTION.LIST>' +
'       <OLDAUDITENTRIES.LIST>       </OLDAUDITENTRIES.LIST>' +
'       <ACCOUNTAUDITENTRIES.LIST>       </ACCOUNTAUDITENTRIES.LIST>' +
'       <AUDITENTRIES.LIST>       </AUDITENTRIES.LIST>' +
'       <TAXBILLALLOCATIONS.LIST>       </TAXBILLALLOCATIONS.LIST>' +
'       <TAXOBJECTALLOCATIONS.LIST>       </TAXOBJECTALLOCATIONS.LIST>' +
'       <TDSEXPENSEALLOCATIONS.LIST>       </TDSEXPENSEALLOCATIONS.LIST>' +
'       <VATSTATUTORYDETAILS.LIST>       </VATSTATUTORYDETAILS.LIST>' +
'       <COSTTRACKALLOCATIONS.LIST>       </COSTTRACKALLOCATIONS.LIST>' +
'      </ALLLEDGERENTRIES.LIST>' +

'      <ALLLEDGERENTRIES.LIST>' +
'       <OLDAUDITENTRYIDS.LIST TYPE="Number">' +
'        <OLDAUDITENTRYIDS>-1</OLDAUDITENTRYIDS>' +
'       </OLDAUDITENTRYIDS.LIST>' +
'       <LEDGERNAME>Term Fee</LEDGERNAME>' +
'       <GSTCLASS/>' +
'       <ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>' +
'       <LEDGERFROMITEM>No</LEDGERFROMITEM>' +
'       <REMOVEZEROENTRIES>No</REMOVEZEROENTRIES>' +
'       <ISPARTYLEDGER>No</ISPARTYLEDGER>' +
'       <ISLASTDEEMEDPOSITIVE>No</ISLASTDEEMEDPOSITIVE>' +
'       <AMOUNT>110.00</AMOUNT>' +
'       <BANKALLOCATIONS.LIST>       </BANKALLOCATIONS.LIST>' +
'       <BILLALLOCATIONS.LIST>       </BILLALLOCATIONS.LIST>' +
'       <INTERESTCOLLECTION.LIST>       </INTERESTCOLLECTION.LIST>' +
'       <OLDAUDITENTRIES.LIST>       </OLDAUDITENTRIES.LIST>' +
'       <ACCOUNTAUDITENTRIES.LIST>       </ACCOUNTAUDITENTRIES.LIST>' +
'       <AUDITENTRIES.LIST>       </AUDITENTRIES.LIST>' +
'       <TAXBILLALLOCATIONS.LIST>       </TAXBILLALLOCATIONS.LIST>' +
'       <TAXOBJECTALLOCATIONS.LIST>       </TAXOBJECTALLOCATIONS.LIST>' +
'       <TDSEXPENSEALLOCATIONS.LIST>       </TDSEXPENSEALLOCATIONS.LIST>' +
'       <VATSTATUTORYDETAILS.LIST>       </VATSTATUTORYDETAILS.LIST>' +
'       <COSTTRACKALLOCATIONS.LIST>       </COSTTRACKALLOCATIONS.LIST>' +
'      </ALLLEDGERENTRIES.LIST>' +

'      <ALLLEDGERENTRIES.LIST>' +
'       <OLDAUDITENTRYIDS.LIST TYPE="Number">' +
'        <OLDAUDITENTRYIDS>-1</OLDAUDITENTRYIDS>' +
'       </OLDAUDITENTRYIDS.LIST>' +
'       <LEDGERNAME>Lab. Fee</LEDGERNAME>' +
'       <GSTCLASS/>' +
'       <ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>' +
'       <LEDGERFROMITEM>No</LEDGERFROMITEM>' +
'       <REMOVEZEROENTRIES>No</REMOVEZEROENTRIES>' +
'       <ISPARTYLEDGER>No</ISPARTYLEDGER>' +
'       <ISLASTDEEMEDPOSITIVE>No</ISLASTDEEMEDPOSITIVE>' +
'       <AMOUNT>90.00</AMOUNT>' +
'       <BANKALLOCATIONS.LIST>       </BANKALLOCATIONS.LIST>' +
'       <BILLALLOCATIONS.LIST>       </BILLALLOCATIONS.LIST>' +
'       <INTERESTCOLLECTION.LIST>       </INTERESTCOLLECTION.LIST>' +
'       <OLDAUDITENTRIES.LIST>       </OLDAUDITENTRIES.LIST>' +
'       <ACCOUNTAUDITENTRIES.LIST>       </ACCOUNTAUDITENTRIES.LIST>' +
'       <AUDITENTRIES.LIST>       </AUDITENTRIES.LIST>' +
'       <TAXBILLALLOCATIONS.LIST>       </TAXBILLALLOCATIONS.LIST>' +
'       <TAXOBJECTALLOCATIONS.LIST>       </TAXOBJECTALLOCATIONS.LIST>' +
'       <TDSEXPENSEALLOCATIONS.LIST>       </TDSEXPENSEALLOCATIONS.LIST>' +
'       <VATSTATUTORYDETAILS.LIST>       </VATSTATUTORYDETAILS.LIST>' +
'       <COSTTRACKALLOCATIONS.LIST>       </COSTTRACKALLOCATIONS.LIST>' +
'      </ALLLEDGERENTRIES.LIST>' +

'      <ALLLEDGERENTRIES.LIST>' +
'       <OLDAUDITENTRYIDS.LIST TYPE="Number">' +
'        <OLDAUDITENTRYIDS>-1</OLDAUDITENTRYIDS>' +
'       </OLDAUDITENTRYIDS.LIST>' +
'       <LEDGERNAME>Misc. Fee</LEDGERNAME>' +
'       <GSTCLASS/>' +
'       <ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>' +
'       <LEDGERFROMITEM>No</LEDGERFROMITEM>' +
'       <REMOVEZEROENTRIES>No</REMOVEZEROENTRIES>' +
'       <ISPARTYLEDGER>No</ISPARTYLEDGER>' +
'       <ISLASTDEEMEDPOSITIVE>No</ISLASTDEEMEDPOSITIVE>' +
'       <AMOUNT>60.00</AMOUNT>' +
'       <BANKALLOCATIONS.LIST>       </BANKALLOCATIONS.LIST>' +
'       <BILLALLOCATIONS.LIST>       </BILLALLOCATIONS.LIST>' +
'       <INTERESTCOLLECTION.LIST>       </INTERESTCOLLECTION.LIST>' +
'       <OLDAUDITENTRIES.LIST>       </OLDAUDITENTRIES.LIST>' +
'       <ACCOUNTAUDITENTRIES.LIST>       </ACCOUNTAUDITENTRIES.LIST>' +
'       <AUDITENTRIES.LIST>       </AUDITENTRIES.LIST>' +
'       <TAXBILLALLOCATIONS.LIST>       </TAXBILLALLOCATIONS.LIST>' +
'       <TAXOBJECTALLOCATIONS.LIST>       </TAXOBJECTALLOCATIONS.LIST>' +
'       <TDSEXPENSEALLOCATIONS.LIST>       </TDSEXPENSEALLOCATIONS.LIST>' +
'       <VATSTATUTORYDETAILS.LIST>       </VATSTATUTORYDETAILS.LIST>' +
'       <COSTTRACKALLOCATIONS.LIST>       </COSTTRACKALLOCATIONS.LIST>' +
'      </ALLLEDGERENTRIES.LIST>' +

'      <ALLLEDGERENTRIES.LIST>' +
'       <OLDAUDITENTRYIDS.LIST TYPE="Number">' +
'        <OLDAUDITENTRYIDS>-1</OLDAUDITENTRYIDS>' +
'       </OLDAUDITENTRYIDS.LIST>' +
'       <LEDGERNAME>Admission Fee</LEDGERNAME>' +
'       <GSTCLASS/>' +
'       <ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>' +
'       <LEDGERFROMITEM>No</LEDGERFROMITEM>' +
'       <REMOVEZEROENTRIES>No</REMOVEZEROENTRIES>' +
'       <ISPARTYLEDGER>No</ISPARTYLEDGER>' +
'       <ISLASTDEEMEDPOSITIVE>No</ISLASTDEEMEDPOSITIVE>' +
'       <AMOUNT>2200.00</AMOUNT>' +
'       <BANKALLOCATIONS.LIST>       </BANKALLOCATIONS.LIST>' +
'       <BILLALLOCATIONS.LIST>       </BILLALLOCATIONS.LIST>' +
'       <INTERESTCOLLECTION.LIST>       </INTERESTCOLLECTION.LIST>' +
'       <OLDAUDITENTRIES.LIST>       </OLDAUDITENTRIES.LIST>' +
'       <ACCOUNTAUDITENTRIES.LIST>       </ACCOUNTAUDITENTRIES.LIST>' +
'       <AUDITENTRIES.LIST>       </AUDITENTRIES.LIST>' +
'       <TAXBILLALLOCATIONS.LIST>       </TAXBILLALLOCATIONS.LIST>' +
'       <TAXOBJECTALLOCATIONS.LIST>       </TAXOBJECTALLOCATIONS.LIST>' +
'       <TDSEXPENSEALLOCATIONS.LIST>       </TDSEXPENSEALLOCATIONS.LIST>' +
'       <VATSTATUTORYDETAILS.LIST>       </VATSTATUTORYDETAILS.LIST>' +
'       <COSTTRACKALLOCATIONS.LIST>       </COSTTRACKALLOCATIONS.LIST>' +
'      </ALLLEDGERENTRIES.LIST>' +

'      <ALLLEDGERENTRIES.LIST>' +
'       <OLDAUDITENTRYIDS.LIST TYPE="Number">' +
'        <OLDAUDITENTRYIDS>-1</OLDAUDITENTRYIDS>' +
'       </OLDAUDITENTRYIDS.LIST>' +
'       <LEDGERNAME>Caution Money Deposits</LEDGERNAME>' +
'       <GSTCLASS/>' +
'       <ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>' +
'       <LEDGERFROMITEM>No</LEDGERFROMITEM>' +
'       <REMOVEZEROENTRIES>No</REMOVEZEROENTRIES>' +
'       <ISPARTYLEDGER>No</ISPARTYLEDGER>' +
'       <ISLASTDEEMEDPOSITIVE>No</ISLASTDEEMEDPOSITIVE>' +
'       <AMOUNT>500.00</AMOUNT>' +
'       <BANKALLOCATIONS.LIST>       </BANKALLOCATIONS.LIST>' +
'       <BILLALLOCATIONS.LIST>       </BILLALLOCATIONS.LIST>' +
'       <INTERESTCOLLECTION.LIST>       </INTERESTCOLLECTION.LIST>' +
'       <OLDAUDITENTRIES.LIST>       </OLDAUDITENTRIES.LIST>' +
'       <ACCOUNTAUDITENTRIES.LIST>       </ACCOUNTAUDITENTRIES.LIST>' +
'       <AUDITENTRIES.LIST>       </AUDITENTRIES.LIST>' +
'       <TAXBILLALLOCATIONS.LIST>       </TAXBILLALLOCATIONS.LIST>' +
'       <TAXOBJECTALLOCATIONS.LIST>       </TAXOBJECTALLOCATIONS.LIST>' +
'       <TDSEXPENSEALLOCATIONS.LIST>       </TDSEXPENSEALLOCATIONS.LIST>' +
'       <VATSTATUTORYDETAILS.LIST>       </VATSTATUTORYDETAILS.LIST>' +
'       <COSTTRACKALLOCATIONS.LIST>       </COSTTRACKALLOCATIONS.LIST>' +
'      </ALLLEDGERENTRIES.LIST>' +

'      <ALLLEDGERENTRIES.LIST>' +
'       <OLDAUDITENTRYIDS.LIST TYPE="Number">' +
'        <OLDAUDITENTRYIDS>-1</OLDAUDITENTRYIDS>' +
'       </OLDAUDITENTRYIDS.LIST>' +
'       <LEDGERNAME>Educational Fee</LEDGERNAME>' +
'       <GSTCLASS/>' +
'       <ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>' +
'       <LEDGERFROMITEM>No</LEDGERFROMITEM>' +
'       <REMOVEZEROENTRIES>No</REMOVEZEROENTRIES>' +
'       <ISPARTYLEDGER>No</ISPARTYLEDGER>' +
'       <ISLASTDEEMEDPOSITIVE>No</ISLASTDEEMEDPOSITIVE>' +
'       <AMOUNT>500.00</AMOUNT>' +
'       <BANKALLOCATIONS.LIST>       </BANKALLOCATIONS.LIST>' +
'       <BILLALLOCATIONS.LIST>       </BILLALLOCATIONS.LIST>' +
'       <INTERESTCOLLECTION.LIST>       </INTERESTCOLLECTION.LIST>' +
'       <OLDAUDITENTRIES.LIST>       </OLDAUDITENTRIES.LIST>' +
'       <ACCOUNTAUDITENTRIES.LIST>       </ACCOUNTAUDITENTRIES.LIST>' +
'       <AUDITENTRIES.LIST>       </AUDITENTRIES.LIST>' +
'       <TAXBILLALLOCATIONS.LIST>       </TAXBILLALLOCATIONS.LIST>' +
'       <TAXOBJECTALLOCATIONS.LIST>       </TAXOBJECTALLOCATIONS.LIST>' +
'       <TDSEXPENSEALLOCATIONS.LIST>       </TDSEXPENSEALLOCATIONS.LIST>' +
'       <VATSTATUTORYDETAILS.LIST>       </VATSTATUTORYDETAILS.LIST>' +
'       <COSTTRACKALLOCATIONS.LIST>       </COSTTRACKALLOCATIONS.LIST>' +
'      </ALLLEDGERENTRIES.LIST>' +

'      <ALLLEDGERENTRIES.LIST>' +
'       <OLDAUDITENTRYIDS.LIST TYPE="Number">' +
'        <OLDAUDITENTRYIDS>-1</OLDAUDITENTRYIDS>' +
'       </OLDAUDITENTRYIDS.LIST>' +
'       <LEDGERNAME>Computer Fee</LEDGERNAME>' +
'       <GSTCLASS/>' +
'       <ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>' +
'       <LEDGERFROMITEM>No</LEDGERFROMITEM>' +
'       <REMOVEZEROENTRIES>No</REMOVEZEROENTRIES>' +
'       <ISPARTYLEDGER>No</ISPARTYLEDGER>' +
'       <ISLASTDEEMEDPOSITIVE>No</ISLASTDEEMEDPOSITIVE>' +
'       <AMOUNT>4000.00</AMOUNT>' +
'       <BANKALLOCATIONS.LIST>       </BANKALLOCATIONS.LIST>' +
'       <BILLALLOCATIONS.LIST>       </BILLALLOCATIONS.LIST>' +
'       <INTERESTCOLLECTION.LIST>       </INTERESTCOLLECTION.LIST>' +
'       <OLDAUDITENTRIES.LIST>       </OLDAUDITENTRIES.LIST>' +
'       <ACCOUNTAUDITENTRIES.LIST>       </ACCOUNTAUDITENTRIES.LIST>' +
'       <AUDITENTRIES.LIST>       </AUDITENTRIES.LIST>' +
'       <TAXBILLALLOCATIONS.LIST>       </TAXBILLALLOCATIONS.LIST>' +
'       <TAXOBJECTALLOCATIONS.LIST>       </TAXOBJECTALLOCATIONS.LIST>' +
'       <TDSEXPENSEALLOCATIONS.LIST>       </TDSEXPENSEALLOCATIONS.LIST>' +
'       <VATSTATUTORYDETAILS.LIST>       </VATSTATUTORYDETAILS.LIST>' +
'       <COSTTRACKALLOCATIONS.LIST>       </COSTTRACKALLOCATIONS.LIST>' +
'      </ALLLEDGERENTRIES.LIST>' +

'      <ALLLEDGERENTRIES.LIST>' +
'       <OLDAUDITENTRYIDS.LIST TYPE="Number">' +
'        <OLDAUDITENTRYIDS>-1</OLDAUDITENTRYIDS>' +
'       </OLDAUDITENTRYIDS.LIST>' +
'       <LEDGERNAME>Late &amp; Other Fine</LEDGERNAME>' +
'       <GSTCLASS/>' +
'       <ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>' +
'       <LEDGERFROMITEM>No</LEDGERFROMITEM>' +
'       <REMOVEZEROENTRIES>No</REMOVEZEROENTRIES>' +
'       <ISPARTYLEDGER>No</ISPARTYLEDGER>' +
'       <ISLASTDEEMEDPOSITIVE>No</ISLASTDEEMEDPOSITIVE>' +
'       <AMOUNT>40.00</AMOUNT>' +
'       <BANKALLOCATIONS.LIST>       </BANKALLOCATIONS.LIST>' +
'       <BILLALLOCATIONS.LIST>       </BILLALLOCATIONS.LIST>' +
'       <INTERESTCOLLECTION.LIST>       </INTERESTCOLLECTION.LIST>' +
'       <OLDAUDITENTRIES.LIST>       </OLDAUDITENTRIES.LIST>' +
'       <ACCOUNTAUDITENTRIES.LIST>       </ACCOUNTAUDITENTRIES.LIST>' +
'       <AUDITENTRIES.LIST>       </AUDITENTRIES.LIST>' +
'       <TAXBILLALLOCATIONS.LIST>       </TAXBILLALLOCATIONS.LIST>' +
'       <TAXOBJECTALLOCATIONS.LIST>       </TAXOBJECTALLOCATIONS.LIST>' +
'       <TDSEXPENSEALLOCATIONS.LIST>       </TDSEXPENSEALLOCATIONS.LIST>' +
'       <VATSTATUTORYDETAILS.LIST>       </VATSTATUTORYDETAILS.LIST>' +
'       <COSTTRACKALLOCATIONS.LIST>       </COSTTRACKALLOCATIONS.LIST>' +
'      </ALLLEDGERENTRIES.LIST>' +

'      <ALLLEDGERENTRIES.LIST>' +
'       <OLDAUDITENTRYIDS.LIST TYPE="Number">' +
'        <OLDAUDITENTRYIDS>-1</OLDAUDITENTRYIDS>' +
'       </OLDAUDITENTRYIDS.LIST>' +
'       <LEDGERNAME>Bank Charges</LEDGERNAME>' +
'       <GSTCLASS/>' +
'       <ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>' +
'       <LEDGERFROMITEM>No</LEDGERFROMITEM>' +
'       <REMOVEZEROENTRIES>No</REMOVEZEROENTRIES>' +
'       <ISPARTYLEDGER>No</ISPARTYLEDGER>' +
'       <ISLASTDEEMEDPOSITIVE>No</ISLASTDEEMEDPOSITIVE>' +
'       <AMOUNT>70.00</AMOUNT>' +
'       <BANKALLOCATIONS.LIST>       </BANKALLOCATIONS.LIST>' +
'       <BILLALLOCATIONS.LIST>       </BILLALLOCATIONS.LIST>' +
'       <INTERESTCOLLECTION.LIST>       </INTERESTCOLLECTION.LIST>' +
'       <OLDAUDITENTRIES.LIST>       </OLDAUDITENTRIES.LIST>' +
'       <ACCOUNTAUDITENTRIES.LIST>       </ACCOUNTAUDITENTRIES.LIST>' +
'       <AUDITENTRIES.LIST>       </AUDITENTRIES.LIST>' +
'       <TAXBILLALLOCATIONS.LIST>       </TAXBILLALLOCATIONS.LIST>' +
'       <TAXOBJECTALLOCATIONS.LIST>       </TAXOBJECTALLOCATIONS.LIST>' +
'       <TDSEXPENSEALLOCATIONS.LIST>       </TDSEXPENSEALLOCATIONS.LIST>' +
'       <VATSTATUTORYDETAILS.LIST>       </VATSTATUTORYDETAILS.LIST>' +
'       <COSTTRACKALLOCATIONS.LIST>       </COSTTRACKALLOCATIONS.LIST>' +
'      </ALLLEDGERENTRIES.LIST>';

f1:='      <ALLLEDGERENTRIES.LIST>' +
'       <OLDAUDITENTRYIDS.LIST TYPE="Number">' +
'        <OLDAUDITENTRYIDS>-1</OLDAUDITENTRYIDS>' +
'       </OLDAUDITENTRYIDS.LIST>' +
'       <LEDGERNAME>Union Bank of India,Tinplate</LEDGERNAME>' +
'       <GSTCLASS/>' +
'       <ISDEEMEDPOSITIVE>Yes</ISDEEMEDPOSITIVE>' +
'       <LEDGERFROMITEM>No</LEDGERFROMITEM>' +
'       <REMOVEZEROENTRIES>No</REMOVEZEROENTRIES>' +
'       <ISPARTYLEDGER>Yes</ISPARTYLEDGER>' +
'       <ISLASTDEEMEDPOSITIVE>Yes</ISLASTDEEMEDPOSITIVE>' +
'       <AMOUNT>-8780.00</AMOUNT>' +
'       <BANKALLOCATIONS.LIST>' +
'        <DATE>20151031</DATE>' +
'        <INSTRUMENTDATE>20151031</INSTRUMENTDATE>' +
'        <NAME>a5d390c3-c7a4-4944-acad-a5cebbbfba4f</NAME>' +
'        <TRANSACTIONTYPE>Cheque/DD</TRANSACTIONTYPE>' +
'        <BANKNAME>ORIENTAL</BANKNAME>' +
'        <PAYMENTFAVOURING>Tuition Fee</PAYMENTFAVOURING>' +
'        <INSTRUMENTNUMBER>118360</INSTRUMENTNUMBER>'+
'        <UNIQUEREFERENCENUMBER>3xp311ZiAfVvRZcL</UNIQUEREFERENCENUMBER>' +
'        <STATUS>No</STATUS>' +
'        <PAYMENTMODE>Transacted</PAYMENTMODE>' +
'        <BANKPARTYNAME>Tuition Fee</BANKPARTYNAME>' +
'        <ISCONNECTEDPAYMENT>No</ISCONNECTEDPAYMENT>' +
'        <ISSPLIT>No</ISSPLIT>' +
'        <ISCONTRACTUSED>No</ISCONTRACTUSED>' +
'        <CHEQUEPRINTED> 1</CHEQUEPRINTED>' +
'        <AMOUNT>-8780.00</AMOUNT>';

f2:=
//'        <CONTRACTDETAILS.LIST>        </CONTRACTDETAILS.LIST>' +
//'       </BANKALLOCATIONS.LIST>' +
//'       <BILLALLOCATIONS.LIST>       </BILLALLOCATIONS.LIST>' +
//'       <INTERESTCOLLECTION.LIST>       </INTERESTCOLLECTION.LIST>' +
//'       <OLDAUDITENTRIES.LIST>       </OLDAUDITENTRIES.LIST>' +
//'       <ACCOUNTAUDITENTRIES.LIST>       </ACCOUNTAUDITENTRIES.LIST>' +
//'       <AUDITENTRIES.LIST>       </AUDITENTRIES.LIST>' +
//'       <TAXBILLALLOCATIONS.LIST>       </TAXBILLALLOCATIONS.LIST>' +
//'       <TAXOBJECTALLOCATIONS.LIST>       </TAXOBJECTALLOCATIONS.LIST>' +
//'       <TDSEXPENSEALLOCATIONS.LIST>       </TDSEXPENSEALLOCATIONS.LIST>' +
//'       <VATSTATUTORYDETAILS.LIST>       </VATSTATUTORYDETAILS.LIST>' +
//'       <COSTTRACKALLOCATIONS.LIST>       </COSTTRACKALLOCATIONS.LIST>' +
'      </ALLLEDGERENTRIES.LIST>' +
//'      <PAYROLLMODEOFPAYMENT.LIST>      </PAYROLLMODEOFPAYMENT.LIST>' +
//'      <ATTDRECORDS.LIST>      </ATTDRECORDS.LIST>' +
'     </VOUCHER>';

f3:='    </TALLYMESSAGE>' +
'   </REQUESTDATA>' +
'  </IMPORTDATA>' +
' </BODY>' +
'</ENVELOPE>';
dtime:=FormatDateTime('yyyymmdd',sdate.Date);
vchno:=1;
mmout.Lines.Clear;
mmout.Lines.Add(h1);
with mydata do
  begin
  tbfee.FilterSQL:='MR_DATE="'+FormatDateTime('yyyy-mm-dd',sDate.Date)+'"';
  tbfee.Open;
  tbfeeDetail.Open;
  while not tbfee.eof do
  begin
    //mmout.Lines.Add(FormatDateTime('yyyymmdd',tbfeeMR_DATE.value)+' '+tbfeeMR_NO.AsString);
    //mmout.Lines.Add(format('%s %s %s %s',[tbfeeadmno.Value,mydata.tbfeestudname.Value,tbfeecldesc.Value,tbfeesec.Value]));
    h2:=format('<VOUCHER>' +
'      <DATE>%s</DATE>' +
//'      <GUID></GUID>' +
'      <NARRATION>%s %s %s %s</NARRATION>' +
'      <VOUCHERTYPENAME>Receipt</VOUCHERTYPENAME>' +
'      <VOUCHERNUMBER>%s%.3d</VOUCHERNUMBER>'+
//'      <LEDGERNAME>Union Bank of India,Tinplate</LEDGERNAME>' +
'      <EFFECTIVEDATE>%s</EFFECTIVEDATE>',[dtime,
tbfeeadmno.Value,mydata.tbfeestudname.Value,tbfeecldesc.Value,tbfeesec.Value,dtime,vchno,
dtime]);inc(vchno);

    mmout.Lines.Add(h2);
    tbfeeDetail.First;dxml:='';tamt:=0;
    while not tbfeeDetail.Eof do
    begin
    dxml:=dxml+format(
'      <ALLLEDGERENTRIES.LIST>' +
'       <LEDGERNAME>%s</LEDGERNAME>' +
'       <ISDEEMEDPOSITIVE>No</ISDEEMEDPOSITIVE>' +
'       <AMOUNT>%s</AMOUNT>' +
'      </ALLLEDGERENTRIES.LIST>',[replacestr(tbfeeDetailAC_NAME.Value,'&','&amp;'),tbfeeDetailAC_AMTPAID.asstring]);
      tamt:=tamt+tbfeeDetailAC_AMTPAID.Value;
      tbfeeDetail.Next;
    end;
    mmout.Lines.Add(dxml);
    f1:=format('      <ALLLEDGERENTRIES.LIST>' +
'       <LEDGERNAME>Union Bank of India,Tinplate</LEDGERNAME>' +
'       <ISDEEMEDPOSITIVE>Yes</ISDEEMEDPOSITIVE>' +
'       <ISPARTYLEDGER>Yes</ISPARTYLEDGER>' +
'       <ISLASTDEEMEDPOSITIVE>Yes</ISLASTDEEMEDPOSITIVE>' +
'       <AMOUNT>%10.2f</AMOUNT>' +
'       <BANKALLOCATIONS.LIST>' +
'        <DATE>%s</DATE>' +
'        <INSTRUMENTDATE>%s</INSTRUMENTDATE>' +
'        <NAME>'+getguid+'</NAME>' +
'        <TRANSACTIONTYPE>Cheque/DD</TRANSACTIONTYPE>' +
'        <BANKNAME>%s</BANKNAME>' +
'         <PAYMENTMODE>Transacted</PAYMENTMODE>'+
'        <PAYMENTFAVOURING>Tuition Fee</PAYMENTFAVOURING>' +
'        <INSTRUMENTNUMBER>%s</INSTRUMENTNUMBER>'+
//'        <UNIQUEREFERENCENUMBER></UNIQUEREFERENCENUMBER>' +
'        <STATUS>No</STATUS>' +
'        <AMOUNT>%10.2f</AMOUNT></BANKALLOCATIONS.LIST>',[0-mydata.tbfeeFEE_AMT.value,dtime,
      dtime,replacestr(tbfeebdesc.value,'&','&amp;'),tbfeechq_no.Value,0-tamt]);
    mmout.Lines.Add(f1);
    mmout.Lines.Add(f2);
    tbfee.Next;
  end;
  tbfeeDetail.Close;
  tbfee.Close;
  mmout.Lines.Add(f3);
  if (SaveTextFileDialog1.Execute) then
  begin
    mmout.Lines.SaveToFile(SaveTextFileDialog1.FileName);
  end;
end;
end;

procedure TDlgRepo.btnShowClick(Sender: TObject);
begin
TreeView1Change(self,TreeView1.Selected);
caption:=rep_head;
frxReport1.LoadFromFile(repnme,true);
(frxReport1.findobject('orgnm_memo') as TfrxMemoview).Text:=genperf.edtOrgnm.Text;
(frxReport1.findobject('hdmemo') as TfrxMemoview).Text:=rep_head;
if repnme='.\frxFeeBank.fr3' then
     (frxReport1.findobject('mmSummText') as TfrxMemoview).Text:=
     format('We are enclosing %s Nos. Cheque of Rs.%s/-. Please credit in our SB A/c No.4701.',
     [mydata.qryCustom.Fields[0].AsString,
      mydata.qryCustom.Fields[1].AsString]);

//if repnme='./feeheadstud.fr3' then
//     'Fee Heads For Groups';
frxreport1.ShowReport();
MyData.qryFeeFulldtl.SQL.Strings[8]:=' ';
//
end;


procedure TDlgRepo.Button1Click(Sender: TObject);
var Uid: TGuid;
msg:string;
begin
 CreateGuid(Uid);
 msg:=GuidToString(Uid);
 //msg:=StringReplace(msg,'{','',[rfReplaceAll]);
 //msg:=StringReplace(msg,'}','',[rfReplaceAll]);
 showmessage(copy(msg,2,36)+inttostr(length(msg)));
end;

procedure TDlgRepo.TreeView1Change(Sender: TObject; Node: TTreeNode);
var sc,ec,sql: String;
begin
     rep_head:=node.Text + ' ( '+sdate.EditText +'-'+edate.EditText+' )';
case node.StateIndex of
  1: begin repnme:='.\castrep.fr3';rep_head:='Cast wise count';end;
  2: begin repnme:='.\RelRep.fr3';rep_head:='Religion wise count';end;
  3: begin repnme:='.\AgeRep.fr3';rep_head:='Age wise count';end;
  4: begin repnme:='.\CatRep.fr3';rep_head:='Category report';end;
  5: begin
     MyData.qryfeeheadsall.close;
     MyData.qryfeeheadsall.Params[0].Value :=sDate.Date;
     MyData.qryfeeheadsall.Params[1].Value :=eDate.Date;
     MyData.qryfeeheadsall.Open;
     repnme:='.\fee1.fr3';
     end;
  6: begin
      adv_pay:=false;
      edtFilterChange(self);
     end;
  7: begin
      adv_pay:=true;
      edtFilterChange(self);
     end;
  12: begin
      adv_pay:=true;
      edtFilterChange(self);
      repnme:='.\frxDueSlip.fr3';
      rep_head:='Due slip';
     end;
  8:  begin
     MyData.qryFeeFulldtl.close;
     Mydata.qryfeeheadspl.SQL.Strings[5]:=' ';
     Mydata.qryfeeheadgnrl.SQL.Strings[5]:=' ';
     MyData.qryFeeFulldtl.SQL.Strings[8]:= ' ';
     MyData.qryFeeFulldtl.Params[0].Value :=sDate.Date;
     MyData.qryFeeFulldtl.Params[1].Value :=eDate.Date;
     MyData.qryFeeFulldtl.Open;
     repnme:='.\feeclasshead.fr3'
     end;
  9:begin
     MyData.qryFeeFulldtl.close;
     Mydata.qryfeeheadspl.SQL.Strings[5]:=' ';
     Mydata.qryfeeheadgnrl.SQL.Strings[5]:=' ';
     MyData.qryFeeFulldtl.SQL.Strings[8]:= ' ';
     MyData.qryFeeFulldtl.Params[0].Value :=sDate.Date;
     MyData.qryFeeFulldtl.Params[1].Value :=eDate.Date;
     MyData.qryFeeFulldtl.Open;
     repnme:='.\feeheadstud.fr3'
     end;
  10:begin
     MyData.CLMast.Open;
     Mydata.qryfeeheadspl.SQL.Strings[5]:=' ';
     Mydata.qryfeeheadgnrl.SQL.Strings[5]:=' ';
     sc:= InputBox('From Class','Enter Begining of Class','LKG');
     sc:=VarToStr(MyData.CLMast.Lookup('clcaption',sc,'clcode'));
     MyData.CLMast.Close;
     MyData.CLMast.Open;
     ec:=InputBox('To Class','Enter upto Class','STD');
     ec:=VarToStr(MyData.CLMast.Lookup('clcaption',ec,'clcode'));
     MyData.qryFeeFulldtl.close;
     MyData.qryFeeFulldtl.SQL.Strings[8]:=' And sm_studmast.Clcode between ' + sc+  ' and ' +ec;
     MyData.qryFeeFulldtl.Params[0].Value :=sDate.Date;
     MyData.qryFeeFulldtl.Params[1].Value :=eDate.Date;
     MyData.qryFeeFulldtl.Open;
     (frxReport1.findobject('hdmemo') as TfrxMemoview).Text:=
     'Fee Heads For Groups Of Classes';
     repnme:='.\feeheadstud.fr3';
     end;
   11:begin
     //We are enclosing 235 Nos. Cheque of Rs.3,47,670/-. Please credit in our SB A/c No.4701.
     mydata.qryCustom.close;
     sql:='select count(CHQ_NO),sum(CHQ_AMT) from (select distinct CHQ_NO,CHQ_AMT from fee f '
          +'WHERE  f.chq_amt is not null '
          +'and MR_DATE between '''+FormatDateTime('yyyy-mm-dd',sDate.Date)+''' and '''+FormatDateTime('yyyy-mm-dd',eDate.Date)+''') t';
     mydata.qryCustom.SQL.text:=sql;
     //showmessage(sql);
     mydata.qryCustom.Open;

     MyData.qryfeebank.close;
     MyData.qryfeebank.Params[0].Value :=sDate.Date;
     MyData.qryfeebank.Params[1].Value :=eDate.Date;
     MyData.qryfeebank.Open;
     repnme:='.\frxFeeBank.fr3';
   end;
   13: begin
     rep_head:='Bounced cheque report';
     mydata.qryBoucneChqDet.Close;
     MyData.qryBoucneChqDet.Params[0].Value :=sDate.Date;
     MyData.qryBoucneChqDet.Params[1].Value :=eDate.Date;
     MyData.qryBoucneChqDet.Open;
     repnme:='.\frxBounced.fr3';
   end;


end;

end;



procedure TDlgRepo.edtFilterChange(Sender: TObject);
var
day,month,yr:word;
mth,term:integer;
stext:string;
begin
      DecodeDate(date,yr,month,day); //mth:=month-strtoint(genperf.edtsession.text);
      mth:=month-strtoint(genperf.edtsession.text);
      if mth<=0 then mth:=12-abs(mth); //term:=(mth div strtoint(genperf.edit2.text))+1;
      term:=(mth div strtoint(genperf.edtMnthTerm.text));
      if (day>genperf.updFeeLastdt.Position) then term:=term+1;
      mydata.spdefaulter.close;
      rep_head:='Defaulter list as on '+FormatDateTime('dd/mm/yyyy',date);
      if adv_pay then
        begin
        mydata.spdefaulter.StoredProcName:='advance_fee';
        rep_head:='Advance fees as on '+FormatDateTime('dd/mm/yyyy',date);
        if (dbcbxCatCode.KeyValue<>null) then
        mydata.spdefaulter.Params[1].Value:=dbcbxCatCode.KeyValue
        else
        mydata.spdefaulter.Params[1].Value:=-1;
        end
      else
        begin
        mydata.spdefaulter.StoredProcName:='defaulter';
        if (updFilter.Position>0) then
          begin
          rep_head:='Defaulter list for '+inttostr(updFilter.Position)+' months';
          mydata.spdefaulter.StoredProcName:='defaulter_filter';
//          mydata.spdefaulter.Params[0].Value:=term;
          stext:=LowerCase(cbxDefaulter.Text);
          mydata.spdefaulter.Params[1].Value:=updFilter.Position;
          mydata.spdefaulter.Params[2].Value:=0;
          if stext='show all' then
            mydata.spdefaulter.Params[1].Value:=0-updFilter.Position
          else if stext='greater' then
            mydata.spdefaulter.Params[2].Value:=1;
          //caption:=stext;        //showmessage(mydata.spdefaulter.Params[2].AsString);
          end;

        end;
      mydata.spdefaulter.Params[0].Value:=term;
      mydata.spdefaulter.Open;
      repnme:='frxdefaulter.fr3';

      {      DecodeDate(date,yr,month,day); //mth:=month-strtoint(genperf.edtsession.text);
      mth:=month-strtoint(genperf.edtsession.text);
      if mth<=0 then mth:=12-abs(mth); //term:=(mth div strtoint(genperf.edit2.text))+1;
      term:=(mth div strtoint(genperf.edtMnthTerm.text));
      if (day>genperf.updFeeLastdt.Position) then term:=term+1;
      mydata.spdefaulter.close;
      rep_head:='Defaulter list';
      if (updFilter.Position=0) then
      begin
      if adv_pay then
        begin
        mydata.spdefaulter.StoredProcName:='advance_fee';
        rep_head:='Advance fees';
        end
      else
        mydata.spdefaulter.StoredProcName:='defaulter';
      mydata.spdefaulter.Params[0].Value:=term;
      end
      else
      begin
      rep_head:='Defaulter list for '+inttostr(updFilter.Position)+' months';
      mydata.spdefaulter.StoredProcName:='defaulter_filter';
      mydata.spdefaulter.Params[0].Value:=term;
      mydata.spdefaulter.Params[1].Value:=updFilter.Position;
      end;
      mydata.spdefaulter.Open;
      repnme:='frxdefaulter.fr3'; }

{      DecodeDate(date,yr,month,day); //mth:=month-strtoint(genperf.edtsession.text);
      mth:=month-strtoint(genperf.edtsession.text);
      if mth<=0 then mth:=12-abs(mth); //term:=(mth div strtoint(genperf.edit2.text))+1;
      term:=(mth div strtoint(genperf.edtMnthTerm.text));
      mydata.spdefaulter.close;
      rep_head:='Defaulter list';
      if (updFilter.Position=0) then
      begin
      if adv_pay then
        begin
        mydata.spdefaulter.StoredProcName:='advance_fee';
        rep_head:='Advance fees';
        end
      else
        mydata.spdefaulter.StoredProcName:='defaulter';
      mydata.spdefaulter.Params[0].Value:=term;
      end
      else
      begin
      rep_head:='Defaulter list for '+inttostr(updFilter.Position)+' months';
      mydata.spdefaulter.StoredProcName:='defaulter_filter';
      mydata.spdefaulter.Params[0].Value:=term;
      mydata.spdefaulter.Params[1].Value:=updFilter.Position;
      end;
      mydata.spdefaulter.Open;
      repnme:='frxdefaulter.fr3';}
end;

procedure TDlgRepo.FormActivate(Sender: TObject);
begin
rep_head:='';adv_pay:=false;
sdate.Date:=date;
edate.Date:=date;
mydata.qryCurrentStud.Close;
mydata.catgrmast.Open;
MyData.StudMast.Filtersql:= 'catcode<>0 and clcode<>99';
MyData.StudMast.Open;
//frxDBDataset1.Open;
MyData.qryCurrentStud.Open;
MyData.qryfeeheadsall.Open;
MyData.qryfeeheadgnrl.Open;
MyData.qryfeeheadspl.Open;
dbcbxCatCode.KeyValue:=null;
end;

procedure TDlgRepo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mydata.catgrmast.close;
end;

end.

