program ConsoleProject;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  FastMM5 in '..\..\FastMM5.pas',
  FastMM5Init in '..\..\FastMM5Init.pas';

var
  res: string;

begin
  try
    Writeln('salam');

    FastMM_NeverUninstall := true;
    FastMM_MessageBoxEvents := FastMM_MessageBoxEvents +
      [mmetUnexpectedMemoryLeakSummary];
    FastMM_EnterDebugMode;

    Readln(res);

    if res = 'e' then
    begin
      FastMM_Report;

    end;

    Readln(res);
    var
    obj := TObject.Create;
    if res = 'e' then
    begin
      FastMM_Report;
    end;

    Readln(res);
    //
    if res = 'e' then
    begin
      FastMM_Report;
    end;

    FastMM_MessageBoxEvents := [];
    FastMM_ExitDebugMode;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
