unit FastMM5Init;

interface

uses
  FastMM5;

implementation

initialization

FastMM_Initialize;

if FastMM_ShareMemoryManager then
begin
  if FastMM_LoadDebugSupportLibrary then
  begin
    FastMM_EnterDebugMode;

    FastMM_MessageBoxEvents := FastMM_MessageBoxEvents +
      [mmetUnexpectedMemoryLeakDetail];
  end;
end
else
begin
  FastMM_AttemptToUseSharedMemoryManager;
end;

finalization

FastMM_ExitDebugMode;
FastMM_Finalize;
