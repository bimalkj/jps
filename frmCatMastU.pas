unit frmCatMastU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxCheckBox, cxDBEdit;

type
  TfrmCatMast = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    Label15: TLabel;
    DBNavigator1: TDBNavigator;
    btnSave: TBitBtn;
    btnNew: TBitBtn;
    cxDBCheckBox1: TcxDBCheckBox;
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCatMast: TfrmCatMast;

implementation

uses MyDataU;

{$R *.DFM}

procedure TfrmCatMast.btnNewClick(Sender: TObject);
begin
MyData.CatgrMast.insert;
end;

procedure TfrmCatMast.btnSaveClick(Sender: TObject);
begin
MyData.CatgrMast.Post;
end;

procedure TfrmCatMast.FormActivate(Sender: TObject);
begin
MyData.CatgrMast.open;
end;

procedure TfrmCatMast.FormClose(Sender: TObject; var Action: TCloseAction);
begin
MyData.CatgrMast.close;
end;

end.