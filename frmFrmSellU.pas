unit frmFrmSellU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask;

type
  TfrmSell = class(TForm)
    Label15: TLabel;
    DBNavigator1: TDBNavigator;
    btnSave: TBitBtn;
    btnNew: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSell: TfrmSell;

implementation

uses MyDataU;

{$R *.dfm}

procedure TfrmSell.FormActivate(Sender: TObject);
begin
mydata.tbItems.open;
mydata.tbTrans.open;
end;

procedure TfrmSell.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mydata.tbItems.close;
mydata.tbTrans.close;
end;

procedure TfrmSell.btnNewClick(Sender: TObject);
begin
mydata.tbTrans.insert;
end;

procedure TfrmSell.btnSaveClick(Sender: TObject);
begin
mydata.tbTrans.post;
end;

end.