unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    control_area: TGroupBox;
    Label1: TLabel;
    total_time: TEdit;
    away_time: TEdit;
    home_time: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    reset: TButton;
    exit: TButton;
    home_percent: TEdit;
    away_percent: TEdit;
    home: TTimer;
    away: TTimer;
    ontop: TCheckBox;
    Label2: TLabel;
    Label5: TLabel;
    about: TButton;
    status: TLabel;
    swap: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure control_areaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure homeTimer(Sender: TObject);
    procedure exitClick(Sender: TObject);
    procedure resetClick(Sender: TObject);
    procedure ontopClick(Sender: TObject);
    procedure awayTimer(Sender: TObject);
    procedure aboutClick(Sender: TObject);
    procedure Label5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure swapClick(Sender: TObject);
  private
    procedure ResetTime;
    procedure StopTimers;
    function CountToTime(count: integer): string;
    procedure UpdateTotal;
    procedure UpdatePercentage;
    procedure ClearTextBoxes;
    procedure LeftAsHome;
    procedure LeftAsAway;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  _total_time: integer;
  _home_time: integer;
  _away_time: integer;
  mbHome, mbAway: TMouseButton;

procedure TForm1.aboutClick(Sender: TObject);
begin
  ShowMessage('Author: ybbhuwyg@wecn' + #13
      + 'email: sylecn@gmail.com' + #13 + #13
      + 'date: 2010-03-21' + #13
      + 'Usage:' + #13
      + '  If the Home team has the ball, left click on the control area;' + #13
      + '  If the Away team has the ball, right click on the control area;' + #13
      + '  If the game goes to dead ball status, do middle click to pause '
      + '  the timer.' + #13
      + '  The time and percentage statictics are shown straight forward.' + #13
      + #13
      + '  To toggle left/right click, check left click for away team.'
      + '  To reset all timer, click Reset.' + #13
      + '  To exit the program, click Exit.');
end;

procedure TForm1.awayTimer(Sender: TObject);
begin
  Inc(_away_time);
  Inc(_total_time);
  away_time.Text := CountToTime(_away_time);
  UpdateTotal;
  UpdatePercentage;
end;

procedure TForm1.swapClick(Sender: TObject);
begin
  if swap.Checked then
    LeftAsAway
  else
    LeftAsHome;
end;

procedure TForm1.ClearTextBoxes;
begin
  home_time.Text := '';
  away_time.Text := '';
  home_percent.Text := '';
  away_percent.Text := '';
  total_time.Text := '';
  status.Caption := 'Stopped';
end;

procedure TForm1.control_areaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbHome then
  begin
    status.Caption := 'Home';
    home.Enabled := true;
    away.Enabled := false;
  end
  else if Button = mbAway then
  begin
    status.Caption := 'Away';
    home.Enabled := false;
    away.Enabled := true;
  end
  else if Button = mbMiddle then
  begin
      status.Caption := 'Paused';
      StopTimers;
  end;
end;

// return readable time in string
function TForm1.CountToTime(count: integer): string;
var
  interval: integer;
  h, m, s, ms: integer;
begin
  interval := home.Interval;
  ms := count * interval;
  s := ms div 1000;
  ms := ms mod 1000;
  m := s div 60;
  s := s mod 60;
  h := m div 60;
  m := m mod 60;
  if h = 0 then
  begin
    Result := Format('%.2d:%.2d:%d', [m, s, ms div interval]);
  end
  else
  begin
    Result := Format('%d:%.2d:%.2d', [h, m, s]);
  end;
end;

procedure TForm1.exitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  StopTimers;
  ResetTime;
  LeftAsHome;
end;

procedure TForm1.homeTimer(Sender: TObject);
begin
  Inc(_home_time);
  Inc(_total_time);
  home_time.Text := CountToTime(_home_time);
  UpdateTotal;
  UpdatePercentage;
end;

procedure TForm1.Label2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  control_areaMouseDown(Sender, Button, Shift, X, Y);
end;

procedure TForm1.Label5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  control_areaMouseDown(Sender, Button, Shift, X, Y);
end;

procedure TForm1.LeftAsAway;
begin
  label2.Caption := 'left click=switch to away, right click=switch to home';
  mbHome := mbRight;
  mbAway := mbLeft;
end;

procedure TForm1.LeftAsHome;
begin
  label2.Caption := 'left click=switch to home, right click=switch to away';
  mbHome := mbLeft;
  mbAway := mbRight;
end;

procedure TForm1.ontopClick(Sender: TObject);
begin
  if ontop.Checked then
    self.FormStyle := fsStayOnTop
  else
    self.FormStyle := fsNormal;
end;

procedure TForm1.resetClick(Sender: TObject);
begin
  StopTimers;
  ResetTime;
  ClearTextBoxes;
end;

procedure TForm1.ResetTime;
begin
  _total_time := 0;
  _home_time := 0;
  _away_time := 0;
end;

procedure TForm1.StopTimers;
begin
  home.Enabled := false;
  away.Enabled := false;
end;

procedure TForm1.UpdatePercentage;
begin
  home_percent.Text := Format('%.1f%%', [(_home_time * 100.0) / _total_time]);
  away_percent.Text := Format('%.1f%%', [(_away_time * 100.0) / _total_time]);
end;

procedure TForm1.UpdateTotal;
begin
  total_time.Text := CountToTime(_home_time + _away_time);
end;

end.
