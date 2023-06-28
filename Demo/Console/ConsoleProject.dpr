program ConsoleProject;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  FastMM5Init in '..\..\FastMM5Init.pas',
  FastMM5 in '..\..\FastMM5.pas',
  System.SysUtils;

type
  TLogger = class
    procedure Log(const APText, APCaption: PWideChar);
  end;

  { TLogger }

procedure TLogger.Log(const APText, APCaption: PWideChar);
begin
  Writeln(APText, '---------------', APCaption);
end;

var
  logger: TLogger;

begin
  try
    FastMM_Start;

    // FastMM_SetOutput(mmotMessageBox, mmetUnexpectedMemoryLeakDetail);
    FastMM_SetOutput(mmotMessageBox, [mmetUnexpectedMemoryLeakSummary]);
    // FastMM_SetOutput(mmotConsole, [mmetUnexpectedMemoryLeakSummary]);

    FASTMM_ReportEvent := logger.Log;

    Writeln('0');
    FastMM_Report;

    var
    obj := TObject.Create;

    Writeln('1');
    FastMM_Report;

    var
    objd := TObject.Create;

    Writeln('2');
    FastMM_Report;

    var
    objs := TObject.Create;

    Writeln('3');
    FastMM_Report;

    FastMM_Stop;

    var
      s: string;
    Readln(s);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
