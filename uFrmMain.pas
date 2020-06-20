unit uFrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Viewport3D,
  System.Math.Vectors, FMX.Controls3D, FMX.Objects3D, FMX.MaterialSources,
  FMX.Ani, FMX.Types3D, FMX.Media, FMX.Effects;

type
  TfrmMain = class(TForm)
    Viewport3D1: TViewport3D;
    Grid3D1: TGrid3D;
    SphereAmiga: TSphere;
    faRotation: TFloatAnimation;
    faX: TFloatAnimation;
    faY: TFloatAnimation;
    Grid3D2: TGrid3D;
    LightMaterialSource1: TLightMaterialSource;
    Light1: TLight;
    procedure FormResize(Sender: TObject);
    procedure faXProcess(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure faYProcess(Sender: TObject);
  private
    fResourceFolder: string;
  end;

var
  frmMain: TfrmMain;

implementation

uses mmSystem;

{$R *.fmx}


procedure TfrmMain.FormCreate(Sender: TObject);
begin

  fResourceFolder := ExpandFileName(ExtractFileDir(ParamStr(0)) +  '\..\..\resources\');

  var halfBall := SphereAmiga.Height / 2;
  SphereAmiga.Position.Y := -(SphereAmiga.Height - 1);
  faX.StartValue := -(Grid3D1.Width / 2) + halfBall;
  faX.StopValue := Grid3D1.Width / 2 - halfBall;
  faY.StopValue := Grid3D1.Position.Y - halfBall;
  faY.StartValue := -faY.StopValue * 1.5;
end;

procedure TfrmMain.faXProcess(Sender: TObject);
begin
  if (SphereAmiga.Position.X = faX.StartValue) or
    (SphereAmiga.Position.X = faX.StopValue) then
  begin

    if fResourceFolder = '' then
      exit;

    sndPlaySound(Pchar(fResourceFolder + 'ball1.wav'), SND_NODEFAULT Or
      SND_ASYNC);

  end;

end;

procedure TfrmMain.faYProcess(Sender: TObject);
begin

  if (SphereAmiga.Position.Y = faY.StopValue) then
  begin

    if fResourceFolder = '' then
      exit;

    sndPlaySound(Pchar(fResourceFolder + 'ball2.wav'), SND_NODEFAULT Or
      SND_ASYNC);

  end;

end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  // Optional: update when form is resizing
  Application.ProcessMessages();
end;

end.
