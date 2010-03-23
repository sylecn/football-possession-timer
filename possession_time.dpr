program possession_time;

uses
  Forms,
  main in 'main.pas' {Form1};

{$R possession_time.KLR}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
