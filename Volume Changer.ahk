Menu, Tray, Icon, ddores.dll, 89

; Created by Mitchell Thomas

; change spotift volume with ctrl num - or + this one works
^NumpadAdd::
{ 
run F:\Documents\Nircmd\nircmd.exe changeappvolume spotify.exe +0.1
return 
} 

^NumpadSub::
{ 
run F:\Documents\Nircmd\nircmd.exe changeappvolume spotify.exe -0.1
return 
}


; change firefox volume with ctrl shift - or = for some reason it changes the value in the mixer but doesnt apply it
^_::
{
run F:\Documents\Nircmd\nircmd.exe changeappvolume firefox.exe -0.1
return
}
^+::
{
run F:\Documents\Nircmd\nircmd.exe changeappvolume firefox.exe +0.1
return
}

;#IfWinExist ahk_class QWidget
;Media_Next::
;    ControlSend, ahk_parent, n  ; Next
;    return
;
;Media_Prev::
;    ControlSend, ahk_parent, p  ; Previous
;    return
;
;Media_Play_Pause::
;    ControlSend, ahk_parent, {Space}  ; Play/Pause
;    return
;
;!=::
;    ControlSend, ahk_parent, ^{up}  ; Volume up
;    return
;!-::
;    ControlSend, ahk_parent, ^{down}  ; Volume down
;    return

~Scrolllock::
{
GetKeyState, state, ScrollLock, T ; state will be 'D' if ScrollLock is on or 'U' if it is off
if ( state = "D" )
{
      run "F:\Documents\Nircmd\SoundVolumeView.exe" /Mute "RODE Microphone"
}
   Else
{
      run "F:\Documents\Nircmd\SoundVolumeView.exe" /Unmute "RODE Microphone"
}
return
}
