unit frmHandicapU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmHandicap = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    Label15: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHandicap: TfrmHandicap;

implementation

{$R *.dfm}

uses MyDataU;

procedure TfrmHandicap.FormActivate(Sender: TObject);
begin
mydata.tbHandicap.Open;
end;

procedure TfrmHandicap.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mydata.tbHandicap.close;
end;

end.
