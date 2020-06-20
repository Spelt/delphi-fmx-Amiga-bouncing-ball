program BouncingBall;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmMain in 'uFrmMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.RegisterFormFamily('frmMain', [TfrmMain]);
  Application.Run;
end.
