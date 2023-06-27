unit FastMM5Init;

interface

uses
  FastMM5;

function FastMM_Start: Boolean;
function FastMM_Stop: Boolean;

implementation

function FastMM_Start: Boolean;
begin
  if FastMM_ShareMemoryManager then
  begin
    if FastMM_LoadDebugSupportLibrary then
    begin
      FastMM_EnterDebugMode;

      // FastMM_MessageBoxEvents := FastMM_MessageBoxEvents + [mmetUnexpectedMemoryLeakDetail];
      FastMM_MessageBoxEvents := FastMM_MessageBoxEvents +
        [mmetUnexpectedMemoryLeakSummary];
    end;
  end
  else
  begin
    FastMM_AttemptToUseSharedMemoryManager;
  end;
end;

function FastMM_Stop: Boolean;
begin
  FastMM_ExitDebugMode;
end;

initialization

FastMM_Initialize;

finalization

FastMM_MessageBoxEvents := [];
FastMM_Finalize;

end.
