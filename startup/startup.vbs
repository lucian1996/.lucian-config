Set WshShell = CreateObject("WScript.Shell")

WshShell.Run "cmd /c ""C:\ProgramData\Microsoft\Windows\Start Menu\Programs\UAD Powered Plug-Ins\Console.lnk""", 0, False
WScript.Sleep 8000 ' 10-second delay

WshShell.Run "cmd /c ""C:\ProgramData\Microsoft\Windows\Start Menu\Programs\QjackCtl.lnk""", 0, False
WScript.Sleep 3000 ' 10-second delay

WshShell.Run "cmd /c ""C:\Users\Lucian\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\VB Audio\Voicemeeter\Voicemeeter Banana.LNK""", 0, False

Set WshShell = Nothing
