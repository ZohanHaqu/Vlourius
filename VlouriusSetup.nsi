!define PRODUCT_NAME "Vlourius"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "Sourbert"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "Untitled333_20250207190058.ico"
!define MUI_UNICON "Untitled333_20250207190058.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "Vlourius is an upcoming Chromium-based browser developed by Sourbert Software.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\chrome.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Install\install.exe"
InstallDir "$PROGRAMFILES\Vlourius"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "chrome-win\chrome-win\First Run"
  File "chrome-win\chrome-win\D3DCompiler_47.dll"
  File "chrome-win\chrome-win\135.0.7005.0.manifest"
  File "chrome-win\chrome-win\chrome_elf.dll"
  File "chrome-win\chrome-win\chrome_200_percent.pak"
  File "chrome-win\chrome-win\chrome_100_percent.pak"
  File "chrome-win\chrome-win\chrome.exe"
  CreateDirectory "$SMPROGRAMS\Vlourius"
  CreateShortCut "$SMPROGRAMS\Vlourius\Vlourius.lnk" "$INSTDIR\chrome.exe"
  CreateShortCut "$DESKTOP\Vlourius.lnk" "$INSTDIR\chrome.exe"
  File "chrome-win\chrome-win\chrome.dll"
  File "chrome-win\chrome-win\dxil.dll"
  File "chrome-win\chrome-win\dxcompiler.dll"
  File "chrome-win\chrome-win\chrome_wer.dll"
  File "chrome-win\chrome-win\chrome_pwa_launcher.exe"
  File "chrome-win\chrome-win\chrome_proxy.exe"
  File "chrome-win\chrome-win\icudtl.dat"
  File "chrome-win\chrome-win\eventlog_provider.dll"
  File "chrome-win\chrome-win\elevation_service.exe"
  File "chrome-win\chrome-win\elevated_tracing_service.exe"
  File "chrome-win\chrome-win\libGLESv2.dll"
  File "chrome-win\chrome-win\libEGL.dll"
  File "chrome-win\chrome-win\interactive_ui_tests.exe"
  File "chrome-win\chrome-win\vulkan-1.dll"
  File "chrome-win\chrome-win\vk_swiftshader_icd.json"
  File "chrome-win\chrome-win\vk_swiftshader.dll"
  File "chrome-win\chrome-win\v8_context_snapshot.bin"
  File "chrome-win\chrome-win\setup.exe"
  File "chrome-win\chrome-win\resources.pak"
  File "chrome-win\chrome-win\notification_helper.exe"
  File "chrome-win\chrome-win\new_tab_page.js"
  File "chrome-win\chrome-win\new_tab_page.html"
SectionEnd

Section "Install Files"

    ; Create directories (not needed explicitly, NSIS will create them if missing)

    ; Set output path and copy files from each folder
    SetOutPath "$INSTDIR\locales"
    File /r "C:\Users\zohan\Downloads\chrome-win\chrome-win\locales\*.*"

    SetOutPath "$INSTDIR\MEIPreload"
    File /r "C:\Users\zohan\Downloads\chrome-win\chrome-win\MEIPreload\*.*"

    SetOutPath "$INSTDIR\PrivacySandboxAttestationsPreloaded"
    File /r "C:\Users\zohan\Downloads\chrome-win\chrome-win\PrivacySandboxAttestationsPreloaded\*.*"

SectionEnd

Section -AdditionalIcons
  CreateShortCut "$SMPROGRAMS\Vlourius\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\chrome.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\chrome.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Thank you for using Vlourius. You can uninstall now." IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\new_tab_page.html"
  Delete "$INSTDIR\new_tab_page.js"
  Delete "$INSTDIR\notification_helper.exe"
  Delete "$INSTDIR\resources.pak"
  Delete "$INSTDIR\setup.exe"
  Delete "$INSTDIR\v8_context_snapshot.bin"
  Delete "$INSTDIR\vk_swiftshader.dll"
  Delete "$INSTDIR\vk_swiftshader_icd.json"
  Delete "$INSTDIR\vulkan-1.dll"
  Delete "$INSTDIR\interactive_ui_tests.exe"
  Delete "$INSTDIR\libEGL.dll"
  Delete "$INSTDIR\libGLESv2.dll"
  Delete "$INSTDIR\elevated_tracing_service.exe"
  Delete "$INSTDIR\elevation_service.exe"
  Delete "$INSTDIR\eventlog_provider.dll"
  Delete "$INSTDIR\icudtl.dat"
  Delete "$INSTDIR\chrome_proxy.exe"
  Delete "$INSTDIR\chrome_pwa_launcher.exe"
  Delete "$INSTDIR\chrome_wer.dll"
  Delete "$INSTDIR\dxcompiler.dll"
  Delete "$INSTDIR\dxil.dll"
  Delete "$INSTDIR\chrome.dll"
  Delete "$INSTDIR\chrome.exe"
  Delete "$INSTDIR\chrome_100_percent.pak"
  Delete "$INSTDIR\chrome_200_percent.pak"
  Delete "$INSTDIR\chrome_elf.dll"
  Delete "$INSTDIR\135.0.7005.0.manifest"
  Delete "$INSTDIR\D3DCompiler_47.dll"
  Delete "$INSTDIR\First Run"

  Delete "$SMPROGRAMS\Vlourius\Uninstall.lnk"
  Delete "$DESKTOP\Vlourius.lnk"
  Delete "$SMPROGRAMS\Vlourius\Vlourius.lnk"

  RMDir "$SMPROGRAMS\Vlourius"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd
