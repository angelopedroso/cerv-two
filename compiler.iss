#define AppName "CervTwo"
#define AppVersion "1.0.0"
#define AppPublisher "CervTwo"
#define AppExeName "cerv_two.exe"

[Setup]
AppId={{6bef510f-88e9-445f-8d19-85dd1f030d34}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
DefaultDirName={autopf}\{#AppName}
DefaultGroupName={#AppName}
OutputDir=output
OutputBaseFilename=CervTwoSetup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "portuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "Criar atalho na área de trabalho"; Flags: unchecked

[Files]
Source: "build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: recursesubdirs ignoreversion

[Icons]
Name: "{group}\CervTwo"; Filename: "{app}\{#AppExeName}"
Name: "{autodesktop}\CervTwo"; Filename: "{app}\{#AppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#AppExeName}"; Description: "Executar o aplicativo"; Flags: nowait postinstall skipifsilent