unit FastMM5Init;

interface

uses
  FastMM5;

function FastMM_Start: Boolean;
function FastMM_Stop: Boolean;
procedure FastMM_SetOutput(outputType: TFastMM_OutputType;
  memoryManagerEventTypes: TFastMM_MemoryManagerEventTypeSet);

implementation

function FastMM_Start: Boolean;
begin
  if FastMM_ShareMemoryManager then
  begin
    if FastMM_LoadDebugSupportLibrary then
    begin
      FastMM_EnterDebugMode;
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

procedure FastMM_SetOutput(outputType: TFastMM_OutputType;
  memoryManagerEventTypes: TFastMM_MemoryManagerEventTypeSet);
begin
  FastMM_OutputDebugStringEvents := [];
  FastMM_MessageBoxEvents := [];
  FastMM_LogToFileEvents := [];
  FastMM_ConsoleEvents := [];
  FastMM_ExternalEvents := [];

  if outputType = mmotMessageBox then
  begin
    FastMM_MessageBoxEvents := FastMM_MessageBoxEvents +
      memoryManagerEventTypes;
  end
  else if outputType = mmotFile then
  begin
    FastMM_SetEventLogFilename('MemoryReports.txt');
    FastMM_LogToFileEvents := FastMM_LogToFileEvents + memoryManagerEventTypes;
  end
  else if outputType = mmotConsole then
  begin
    FastMM_ConsoleEvents := FastMM_ConsoleEvents + memoryManagerEventTypes;
  end
  else if outputType = mmotDebugOutput then
  begin
    FastMM_OutputDebugStringEvents := FastMM_OutputDebugStringEvents +
      memoryManagerEventTypes;
  end
  else if outputType = mmotExternalEvent then
  begin
    FastMM_ExternalEvents := FastMM_ExternalEvents + memoryManagerEventTypes;
  end;
  begin
    FastMM_OutputDebugStringEvents := FastMM_OutputDebugStringEvents +
      memoryManagerEventTypes;
  end;
end;

initialization

FastMM_Initialize;

finalization

FastMM_MessageBoxEvents := [];
FastMM_Finalize;

end.
