program ConsoleProject;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  FastMM5 in '..\..\FastMM5.pas',
  FastMM5Init in '..\..\FastMM5Init.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
