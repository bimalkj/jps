unit qrpBirthU;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqrpBirth = class(TQuickRep)
    DetailBand1: TQRBand;
    qrLine1: TQRLabel;
    qrLine2: TQRLabel;
    qrLine4: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText4: TQRDBText;
    qrCertName: TQRLabel;
    QRImage1: TQRImage;
    QRLabel24: TQRLabel;
    QRLabel1: TQRLabel;
    qrlLine3: TQRLabel;
    qrDate: TQRLabel;
    QRImage2: TQRImage;
  private

  public

  end;

var
  qrpBirth: TqrpBirth;

implementation

uses MyDataU;

{$R *.DFM}

end.
