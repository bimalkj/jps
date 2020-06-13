unit AboutU;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, ExeInfo;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    OKButton: TButton;
    ProgramIcon: TImage;
    Version: TLabel;
    Copyright: TLabel;
    lblcright: TLabel;
    lblversion: TLabel;
    Image2: TImage;
    Image1: TImage;
    ExeInfo1: TExeInfo;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.DFM}

procedure TAboutBox.FormActivate(Sender: TObject);
begin
lblcright.Caption:=ExeInfo1.LegalCopyright;
lblversion.Caption:=exeinfo1.Version;
end;

end.
