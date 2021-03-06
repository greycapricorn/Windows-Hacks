 Menu, Tray, Icon, pifmgr.dll, 13
#NoEnv
#SingleInstance force
SendMode Input
SetTitleMatchMode, 2
SetWorkingDir %A_ScriptDir%

; Proudly Created by Mitchell Thomas

; This script enables me to use firefox in the background.
; If you press the menu/appskey (to the right of the right windows key on a full sized keyboard)
; as a modifier for another key the key you pressed will be sent to firefox in the background.
; This means you can fiddle with firefox without tabbing out of a game!
; When used in conjunction with the "Vimium" extension it enables easy navigation.

; Vimium firefox: https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/
; Vimium chrome: https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)

; Here are my Vimium custom key mappings (remove the semicolons): 
;unmapAll
;map <backspace> goBack2
;map \ LinkHints.activateMode
;map | LinkHints.activateModeToOpenInNewTab

; This means by pressing \ an overlay appears on all visable links on a webpage, you then type
; the assigned key combiniation to the link you want to click and vimium shall click it for you!

; I have it setup so that most common hotkey combinations will work (ctrl, alt, shift, ctrl + shift)
; The numpad is setup to change volume for my headphones when pressed without a hotkey, but when ctrl is used it
; will change the volume on my xbox and nintendo switch, which is hooked into line in and the audio out from my monitor's hdmi

; This script could be adapted to work with Google Chrome, 
; I have an older version that works on my github: https://github.com/MoltenZaz/Windows-Hacks/blob/master/Chrome%20Keyboard.ahk
; I think chrome needs the controlfocus command in order for it to work.

; Rarely a game will require you to reload the script after opening it to work, GTA V is the only example i've come across

; You can toggle the script to be always on by pressing appskey + capslock (so that you dont have to keep holding appskey while typing)

DoFocus = 0
ctrltoggle = 0
shifttoggle = 0
alttoggle = 0
toggle = 0
toggle2 = 0

Loop
{
WinWaitNotActive, Mozilla Firefox
Focus(DoFocus)
;ControlSend, ahk_parent, ^{Enter}, ahk_class MozillaWindowClass
WinWaitActive, Mozilla Firefox
DoFocus = 1
;ControlSend, ahk_parent, ^{Enter}, ahk_class MozillaWindowClass
}

Focus(DoFocus)
{
If (DoFocus = 1)
{
WinGetPos,,,FFW,FFH,Mozilla Firefox
If (FFW = 1920 && FFH = 1080)
{
return
}
If (FFW = 3440 && FFH = 1440)
{
return
}
ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
Sleep, 1
ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
Sleep, 1
DoFocus = 0
}
return
}

;oneHanded = 0

;~^!+AppsKey::
;{
;If oneHanded = 0
;{
;	oneHanded = 1
;	SoundBeep, 500, 50
;}
;Else
;{
;	oneHanded = 0
;	SoundBeep, 250, 50
;}
;Return
;}

;#if (oneHanded = 1)
;{
;RAlt::RShift
;RShift::Backspace
;}
;#if

~AppsKey & ~Capslock::
{
KeyDown := !KeyDown
If KeyDown
{
	toggle2 := 1
	mastertoggle := 1
	SoundBeep, 500, 50
}
Else
{
	toggle2 := 0
	if toggle = 0
	{
	mastertoggle := 0
	}
	SoundBeep, 250, 50
}
Return
}

AppsKey::
{
	; ; ; ;; ------------------------------------------------------------------- ;;
	; ; ; ; This section remaps appskey to backspace when using left hand dvorak
	; ; ; SetFormat, Integer, H
	; ; ; aac1:= % DllCall("GetKeyboardLayout", Int,DllCall("GetWindowThreadProcessId", int,WinActive("A"), Int,0))
	; ; ; send %aac1%
	; ; ; SetFormat, Integer, D
	; ; ; if aac1 = -0xFE5F3F7
	;if oneHanded = 1
	;{
	;SoundBeep, 500, 500
	; Send {Backspace Down}
	; keywait AppsKey
	; ; Send {Backspace Up}
	;AppsKey::Backspace
	;mastertoggle := 0
	;toggle := 0
	;return
	;}
	toggle := 1
	mastertoggle := 1
	keywait AppsKey
	toggle := 0
	if toggle2 = 0
	{
	mastertoggle := 0
	}
	return
}

#If (mastertoggle = 1)
{
LCtrl::
{
	ctrltoggle := 1
	keywait Ctrl
	ctrltoggle := 0
	return
}

LShift::
{
	shifttoggle := 1
	keywait Shift
	shifttoggle := 0
	return
}

LAlt::
{
	alttoggle := 1
	keywait Alt
	alttoggle := 0
	return
}
RCtrl::
{
	ctrltoggle := 1
	keywait Ctrl
	ctrltoggle := 0
	return
}

RShift::
{
	shifttoggle := 1
	keywait Shift
	shifttoggle := 0
	return
}

RAlt::
{
	alttoggle := 1
	keywait Alt
	alttoggle := 0
	return
}
}
#if

#if (ctrltoggle = 0 && shifttoggle = 0 && alttoggle = 0 && mastertoggle = 1)
{
; no modifiers go here
a::ControlSend, ahk_parent, a, ahk_class MozillaWindowClass
b::ControlSend, ahk_parent, b, ahk_class MozillaWindowClass
c::ControlSend, ahk_parent, c, ahk_class MozillaWindowClass
d::ControlSend, ahk_parent, d, ahk_class MozillaWindowClass
e::ControlSend, ahk_parent, e, ahk_class MozillaWindowClass
f::ControlSend, ahk_parent, f, ahk_class MozillaWindowClass
g::ControlSend, ahk_parent, g, ahk_class MozillaWindowClass
h::ControlSend, ahk_parent, h, ahk_class MozillaWindowClass
i::ControlSend, ahk_parent, i, ahk_class MozillaWindowClass
j::ControlSend, ahk_parent, j, ahk_class MozillaWindowClass
k::ControlSend, ahk_parent, k, ahk_class MozillaWindowClass
l::ControlSend, ahk_parent, l, ahk_class MozillaWindowClass
m::ControlSend, ahk_parent, m, ahk_class MozillaWindowClass
n::ControlSend, ahk_parent, n, ahk_class MozillaWindowClass
o::ControlSend, ahk_parent, o, ahk_class MozillaWindowClass
p::ControlSend, ahk_parent, p, ahk_class MozillaWindowClass
q::ControlSend, ahk_parent, q, ahk_class MozillaWindowClass
r::ControlSend, ahk_parent, r, ahk_class MozillaWindowClass
s::ControlSend, ahk_parent, s, ahk_class MozillaWindowClass
t::ControlSend, ahk_parent, t, ahk_class MozillaWindowClass
u::ControlSend, ahk_parent, u, ahk_class MozillaWindowClass
v::ControlSend, ahk_parent, v, ahk_class MozillaWindowClass
w::ControlSend, ahk_parent, w, ahk_class MozillaWindowClass
x::ControlSend, ahk_parent, x, ahk_class MozillaWindowClass
y::ControlSend, ahk_parent, y, ahk_class MozillaWindowClass
z::ControlSend, ahk_parent, z, ahk_class MozillaWindowClass
`::ControlSend, ahk_parent, ``, ahk_class MozillaWindowClass
1::ControlSend, ahk_parent, 1, ahk_class MozillaWindowClass
2::ControlSend, ahk_parent, 2, ahk_class MozillaWindowClass
3::ControlSend, ahk_parent, 3, ahk_class MozillaWindowClass
4::ControlSend, ahk_parent, 4, ahk_class MozillaWindowClass
5::ControlSend, ahk_parent, 5, ahk_class MozillaWindowClass
6::ControlSend, ahk_parent, 6, ahk_class MozillaWindowClass
7::ControlSend, ahk_parent, 7, ahk_class MozillaWindowClass
8::ControlSend, ahk_parent, 8, ahk_class MozillaWindowClass
9::ControlSend, ahk_parent, 9, ahk_class MozillaWindowClass
0::ControlSend, ahk_parent, 0, ahk_class MozillaWindowClass
-::ControlSend, ahk_parent, -, ahk_class MozillaWindowClass
=::ControlSend, ahk_parent, =, ahk_class MozillaWindowClass
[::ControlSend, ahk_parent, [, ahk_class MozillaWindowClass
]::ControlSend, ahk_parent, ], ahk_class MozillaWindowClass
\::ControlSend, ahk_parent, \, ahk_class MozillaWindowClass
`;::ControlSend, ahk_parent, `;, ahk_class MozillaWindowClass
'::ControlSend, ahk_parent, ', ahk_class MozillaWindowClass
,::ControlSend, ahk_parent, `,, ahk_class MozillaWindowClass
.::ControlSend, ahk_parent, ., ahk_class MozillaWindowClass
/::ControlSend, ahk_parent, /, ahk_class MozillaWindowClass
F1::ControlSend, ahk_parent, {F1}, ahk_class MozillaWindowClass
F2::ControlSend, ahk_parent, {F2}, ahk_class MozillaWindowClass
F3::ControlSend, ahk_parent, {F3}, ahk_class MozillaWindowClass
F4::ControlSend, ahk_parent, {F4}, ahk_class MozillaWindowClass
F5::ControlSend, ahk_parent, {F5}, ahk_class MozillaWindowClass
F6::ControlSend, ahk_parent, {F6}, ahk_class MozillaWindowClass
F7::ControlSend, ahk_parent, {F7}, ahk_class MozillaWindowClass
F8::ControlSend, ahk_parent, {F8}, ahk_class MozillaWindowClass
F9::ControlSend, ahk_parent, {F9}, ahk_class MozillaWindowClass
F10::ControlSend, ahk_parent, {F10}, ahk_class MozillaWindowClass
F11::ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
F12::ControlSend, ahk_parent, {F12}, ahk_class MozillaWindowClass
Enter::ControlSend, ahk_parent, {Enter}, ahk_class MozillaWindowClass
Tab::ControlSend, ahk_parent, {Tab}, ahk_class MozillaWindowClass
Left::ControlSend, ahk_parent, {Left}, ahk_class MozillaWindowClass
Right::ControlSend, ahk_parent, {Right}, ahk_class MozillaWindowClass
Up::ControlSend, ahk_parent, {Up}, ahk_class MozillaWindowClass
Down::ControlSend, ahk_parent, {Down}, ahk_class MozillaWindowClass
Backspace::ControlSend, ahk_parent, {Backspace}, ahk_class MozillaWindowClass
Delete::ControlSend, ahk_parent, {Delete}, ahk_class MozillaWindowClass
PgUp::ControlSend, ahk_parent, {PgUp}, ahk_class MozillaWindowClass
PgDn::ControlSend, ahk_parent, {PgDn}, ahk_class MozillaWindowClass
Space::ControlSend, ahk_parent, {Space}, ahk_class MozillaWindowClass
Home::ControlSend, ahk_parent, {Home}, ahk_class MozillaWindowClass
End::ControlSend, ahk_parent, {End}, ahk_class MozillaWindowClass
Esc::ControlSend, ahk_parent, {Esc}, ahk_class MozillaWindowClass
;~Pause::Reload
}
#if

#if (ctrltoggle = 1 && shifttoggle = 0 && alttoggle = 0 && mastertoggle = 1)
{
; ctrl goes here
a::ControlSend, ahk_parent, {Ctrl down}a{Ctrl up}, ahk_class MozillaWindowClass
b::ControlSend, ahk_parent, {Ctrl down}b{Ctrl up}, ahk_class MozillaWindowClass
c::ControlSend, ahk_parent, {Ctrl down}c{Ctrl up}, ahk_class MozillaWindowClass
d::ControlSend, ahk_parent, {Ctrl down}d{Ctrl up}, ahk_class MozillaWindowClass
e::ControlSend, ahk_parent, {Ctrl down}e{Ctrl up}, ahk_class MozillaWindowClass
f::ControlSend, ahk_parent, {Ctrl down}f{Ctrl up}, ahk_class MozillaWindowClass
g::ControlSend, ahk_parent, {Ctrl down}g{Ctrl up}, ahk_class MozillaWindowClass
h::ControlSend, ahk_parent, {Ctrl down}h{Ctrl up}, ahk_class MozillaWindowClass
i::ControlSend, ahk_parent, {Ctrl down}i{Ctrl up}, ahk_class MozillaWindowClass
j::ControlSend, ahk_parent, {Ctrl down}j{Ctrl up}, ahk_class MozillaWindowClass
k::ControlSend, ahk_parent, {Ctrl down}k{Ctrl up}, ahk_class MozillaWindowClass
l::ControlSend, ahk_parent, {Ctrl down}l{Ctrl up}, ahk_class MozillaWindowClass
m::ControlSend, ahk_parent, {Ctrl down}m{Ctrl up}, ahk_class MozillaWindowClass
n::ControlSend, ahk_parent, {Ctrl down}n{Ctrl up}, ahk_class MozillaWindowClass
o::ControlSend, ahk_parent, {Ctrl down}o{Ctrl up}, ahk_class MozillaWindowClass
p::ControlSend, ahk_parent, {Ctrl down}p{Ctrl up}, ahk_class MozillaWindowClass
q::ControlSend, ahk_parent, {Ctrl down}q{Ctrl up}, ahk_class MozillaWindowClass
r::ControlSend, ahk_parent, {Ctrl down}r{Ctrl up}, ahk_class MozillaWindowClass
s::ControlSend, ahk_parent, {Ctrl down}s{Ctrl up}, ahk_class MozillaWindowClass
t::ControlSend, ahk_parent, {Ctrl down}t{Ctrl up}, ahk_class MozillaWindowClass
u::ControlSend, ahk_parent, {Ctrl down}u{Ctrl up}, ahk_class MozillaWindowClass
v::ControlSend, ahk_parent, {Ctrl down}v{Ctrl up}, ahk_class MozillaWindowClass
w::ControlSend, ahk_parent, {Ctrl down}w{Ctrl up}, ahk_class MozillaWindowClass
x::ControlSend, ahk_parent, {Ctrl down}x{Ctrl up}, ahk_class MozillaWindowClass
y::ControlSend, ahk_parent, {Ctrl down}y{Ctrl up}, ahk_class MozillaWindowClass
z::ControlSend, ahk_parent, {Ctrl down}z{Ctrl up}, ahk_class MozillaWindowClass
~::ControlSend, ahk_parent, {Ctrl down}``{Ctrl up}, ahk_class MozillaWindowClass
1::ControlSend, ahk_parent, {Ctrl down}1{Ctrl up}, ahk_class MozillaWindowClass
2::ControlSend, ahk_parent, {Ctrl down}2{Ctrl up}, ahk_class MozillaWindowClass
3::ControlSend, ahk_parent, {Ctrl down}3{Ctrl up}, ahk_class MozillaWindowClass
4::ControlSend, ahk_parent, {Ctrl down}4{Ctrl up}, ahk_class MozillaWindowClass
5::ControlSend, ahk_parent, {Ctrl down}5{Ctrl up}, ahk_class MozillaWindowClass
6::ControlSend, ahk_parent, {Ctrl down}6{Ctrl up}, ahk_class MozillaWindowClass
7::ControlSend, ahk_parent, {Ctrl down}7{Ctrl up}, ahk_class MozillaWindowClass
8::ControlSend, ahk_parent, {Ctrl down}8{Ctrl up}, ahk_class MozillaWindowClass
9::ControlSend, ahk_parent, {Ctrl down}9{Ctrl up}, ahk_class MozillaWindowClass
0::ControlSend, ahk_parent, {Ctrl down}0{Ctrl up}, ahk_class MozillaWindowClass
-::ControlSend, ahk_parent, {Ctrl down}-{Ctrl up}, ahk_class MozillaWindowClass
=::ControlSend, ahk_parent, {Ctrl down}={Ctrl up}, ahk_class MozillaWindowClass
[::ControlSend, ahk_parent, {Ctrl down}[{Ctrl up}, ahk_class MozillaWindowClass
]::ControlSend, ahk_parent, {Ctrl down}]{Ctrl up}, ahk_class MozillaWindowClass
\::ControlSend, ahk_parent, {Ctrl down}\{Ctrl up}, ahk_class MozillaWindowClass
`;::ControlSend, ahk_parent, {Ctrl down}`;{Ctrl up}, ahk_class MozillaWindowClass
'::ControlSend, ahk_parent, {Ctrl down}'{Ctrl up}, ahk_class MozillaWindowClass
,::ControlSend, ahk_parent, {Ctrl down}`,{Ctrl up}, ahk_class MozillaWindowClass
.::ControlSend, ahk_parent, {Ctrl down}.{Ctrl up}, ahk_class MozillaWindowClass
/::ControlSend, ahk_parent, {Ctrl down}/{Ctrl up}, ahk_class MozillaWindowClass
F1::ControlSend, ahk_parent, {Ctrl down}{F1}{Ctrl up}, ahk_class MozillaWindowClass
F2::ControlSend, ahk_parent, {Ctrl down}{F2}{Ctrl up}, ahk_class MozillaWindowClass
F3::ControlSend, ahk_parent, {Ctrl down}{F3}{Ctrl up}, ahk_class MozillaWindowClass
F4::ControlSend, ahk_parent, {Ctrl down}{F4}{Ctrl up}, ahk_class MozillaWindowClass
F5::ControlSend, ahk_parent, {Ctrl down}{F5}{Ctrl up}, ahk_class MozillaWindowClass
F6::ControlSend, ahk_parent, {Ctrl down}{F6}{Ctrl up}, ahk_class MozillaWindowClass
F7::ControlSend, ahk_parent, {Ctrl down}{F7}{Ctrl up}, ahk_class MozillaWindowClass
F8::ControlSend, ahk_parent, {Ctrl down}{F8}{Ctrl up}, ahk_class MozillaWindowClass
F9::ControlSend, ahk_parent, {Ctrl down}{F9}{Ctrl up}, ahk_class MozillaWindowClass
F10::ControlSend, ahk_parent, {Ctrl down}{F10}{Ctrl up}, ahk_class MozillaWindowClass
F11::ControlSend, ahk_parent, {Ctrl down}{F11}{Ctrl up}, ahk_class MozillaWindowClass
F12::ControlSend, ahk_parent, {Ctrl down}{F12}{Ctrl up}, ahk_class MozillaWindowClass
Enter::ControlSend, ahk_parent, ^{Enter}, ahk_class MozillaWindowClass
Tab::ControlSend, ahk_parent, {Ctrl down}{Tab}{Ctrl up}, ahk_class MozillaWindowClass
Left::ControlSend, ahk_parent, {Ctrl down}{Left}{Ctrl up}, ahk_class MozillaWindowClass
Right::ControlSend, ahk_parent, {Ctrl down}{Right}{Ctrl up}, ahk_class MozillaWindowClass
Up::ControlSend, ahk_parent, {Ctrl down}{Up}{Ctrl up}, ahk_class MozillaWindowClass
Down::ControlSend, ahk_parent, {Ctrl down}{Down}{Ctrl up}, ahk_class MozillaWindowClass
Backspace::ControlSend, ahk_parent, {Ctrl down}{Backspace}{Ctrl up}, ahk_class MozillaWindowClass
Delete::ControlSend, ahk_parent, {Ctrl down}{Delete}{Ctrl up}, ahk_class MozillaWindowClass
PgUp::ControlSend, ahk_parent, {Ctrl down}{PgUp}{Ctrl up}, ahk_class MozillaWindowClass
PgDn::ControlSend, ahk_parent, {Ctrl down}{PgDn}{Ctrl up}, ahk_class MozillaWindowClass
Space::ControlSend, ahk_parent, {Ctrl down}{space}{Ctrl up}, ahk_class MozillaWindowClass
Home::ControlSend, ahk_parent, {Ctrl down}{Home}{Ctrl up}, ahk_class MozillaWindowClass
End::ControlSend, ahk_parent, {Ctrl down}{End}{Ctrl up}, ahk_class MozillaWindowClass
}
#if

#if (ctrltoggle = 1 && shifttoggle = 1 && alttoggle = 0 && mastertoggle = 1)
{
; ctrl shift goes here
a::ControlSend, ahk_parent, {Ctrl down}{Shift down}a{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
b::ControlSend, ahk_parent, {Ctrl down}{Shift down}b{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
c::ControlSend, ahk_parent, {Ctrl down}{Shift down}c{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
d::ControlSend, ahk_parent, {Ctrl down}{Shift down}d{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
e::ControlSend, ahk_parent, {Ctrl down}{Shift down}e{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
f::ControlSend, ahk_parent, {Ctrl down}{Shift down}f{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
g::ControlSend, ahk_parent, {Ctrl down}{Shift down}g{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
h::ControlSend, ahk_parent, {Ctrl down}{Shift down}h{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
i::ControlSend, ahk_parent, {Ctrl down}{Shift down}i{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
j::ControlSend, ahk_parent, {Ctrl down}{Shift down}j{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
k::ControlSend, ahk_parent, {Ctrl down}{Shift down}k{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
l::ControlSend, ahk_parent, {Ctrl down}{Shift down}l{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
m::ControlSend, ahk_parent, {Ctrl down}{Shift down}m{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
n::ControlSend, ahk_parent, {Ctrl down}{Shift down}n{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
o::ControlSend, ahk_parent, {Ctrl down}{Shift down}o{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
p::ControlSend, ahk_parent, {Ctrl down}{Shift down}p{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
q::ControlSend, ahk_parent, {Ctrl down}{Shift down}q{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
r::ControlSend, ahk_parent, {Ctrl down}{Shift down}r{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
s::ControlSend, ahk_parent, {Ctrl down}{Shift down}s{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
t::ControlSend, ahk_parent, {Ctrl down}{Shift down}t{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
u::ControlSend, ahk_parent, {Ctrl down}{Shift down}u{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
v::ControlSend, ahk_parent, {Ctrl down}{Shift down}v{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
w::ControlSend, ahk_parent, {Ctrl down}{Shift down}w{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
x::ControlSend, ahk_parent, {Ctrl down}{Shift down}x{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
y::ControlSend, ahk_parent, {Ctrl down}{Shift down}y{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
z::ControlSend, ahk_parent, {Ctrl down}{Shift down}z{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
Tab::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Tab}{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
Left::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Left}{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
Right::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Right}{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
Up::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Up}{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
Down::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Down}{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
Backspace::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Backspace}{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
Delete::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Delete}{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
PgUp::ControlSend, ahk_parent, {Ctrl down}{Shift down}{PgUp}{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
PgDn::ControlSend, ahk_parent, {Ctrl down}{Shift down}{PgDn}{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
Home::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Home}{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
End::ControlSend, ahk_parent, {Ctrl down}{Shift down}{End}{Ctrl up}{Shift up}, ahk_class MozillaWindowClass
}
#if

#if (ctrltoggle = 0 && shifttoggle = 0 && alttoggle = 1 && mastertoggle = 1)
{
; alt goes here
a::ControlSend, ahk_parent, {Alt down}a{Alt up}, ahk_class MozillaWindowClass
b::ControlSend, ahk_parent, {Alt down}b{Alt up}, ahk_class MozillaWindowClass
c::ControlSend, ahk_parent, {Alt down}c{Alt up}, ahk_class MozillaWindowClass
d::ControlSend, ahk_parent, {Alt down}d{Alt up}, ahk_class MozillaWindowClass
e::ControlSend, ahk_parent, {Alt down}e{Alt up}, ahk_class MozillaWindowClass
f::ControlSend, ahk_parent, {Alt down}f{Alt up}, ahk_class MozillaWindowClass
g::ControlSend, ahk_parent, {Alt down}g{Alt up}, ahk_class MozillaWindowClass
h::ControlSend, ahk_parent, {Alt down}h{Alt up}, ahk_class MozillaWindowClass
i::ControlSend, ahk_parent, {Alt down}i{Alt up}, ahk_class MozillaWindowClass
j::ControlSend, ahk_parent, {Alt down}j{Alt up}, ahk_class MozillaWindowClass
k::ControlSend, ahk_parent, {Alt down}k{Alt up}, ahk_class MozillaWindowClass
l::ControlSend, ahk_parent, {Alt down}l{Alt up}, ahk_class MozillaWindowClass
m::ControlSend, ahk_parent, {Alt down}m{Alt up}, ahk_class MozillaWindowClass
n::ControlSend, ahk_parent, {Alt down}n{Alt up}, ahk_class MozillaWindowClass
o::ControlSend, ahk_parent, {Alt down}o{Alt up}, ahk_class MozillaWindowClass
p::ControlSend, ahk_parent, {Alt down}p{Alt up}, ahk_class MozillaWindowClass
q::ControlSend, ahk_parent, {Alt down}q{Alt up}, ahk_class MozillaWindowClass
r::ControlSend, ahk_parent, {Alt down}r{Alt up}, ahk_class MozillaWindowClass
s::ControlSend, ahk_parent, {Alt down}s{Alt up}, ahk_class MozillaWindowClass
t::ControlSend, ahk_parent, {Alt down}t{Alt up}, ahk_class MozillaWindowClass
u::ControlSend, ahk_parent, {Alt down}u{Alt up}, ahk_class MozillaWindowClass
v::ControlSend, ahk_parent, {Alt down}v{Alt up}, ahk_class MozillaWindowClass
w::ControlSend, ahk_parent, {Alt down}w{Alt up}, ahk_class MozillaWindowClass
x::ControlSend, ahk_parent, {Alt down}x{Alt up}, ahk_class MozillaWindowClass
y::ControlSend, ahk_parent, {Alt down}y{Alt up}, ahk_class MozillaWindowClass
z::ControlSend, ahk_parent, {Alt down}z{Alt up}, ahk_class MozillaWindowClass
`::ControlSend, ahk_parent, {Alt down}``{Alt up}, ahk_class MozillaWindowClass
1::ControlSend, ahk_parent, {Alt down}1{Alt up}, ahk_class MozillaWindowClass
2::ControlSend, ahk_parent, {Alt down}2{Alt up}, ahk_class MozillaWindowClass
3::ControlSend, ahk_parent, {Alt down}3{Alt up}, ahk_class MozillaWindowClass
4::ControlSend, ahk_parent, {Alt down}4{Alt up}, ahk_class MozillaWindowClass
5::ControlSend, ahk_parent, {Alt down}5{Alt up}, ahk_class MozillaWindowClass
6::ControlSend, ahk_parent, {Alt down}6{Alt up}, ahk_class MozillaWindowClass
7::ControlSend, ahk_parent, {Alt down}7{Alt up}, ahk_class MozillaWindowClass
8::ControlSend, ahk_parent, {Alt down}8{Alt up}, ahk_class MozillaWindowClass
9::ControlSend, ahk_parent, {Alt down}9{Alt up}, ahk_class MozillaWindowClass
0::ControlSend, ahk_parent, {Alt down}0{Alt up}, ahk_class MozillaWindowClass
-::ControlSend, ahk_parent, {Alt down}-{Alt up}, ahk_class MozillaWindowClass
=::ControlSend, ahk_parent, {Alt down}={Alt up}, ahk_class MozillaWindowClass
[::ControlSend, ahk_parent, {Alt down}[{Alt up}, ahk_class MozillaWindowClass
]::ControlSend, ahk_parent, {Alt down}]{Alt up}, ahk_class MozillaWindowClass
\::ControlSend, ahk_parent, {Alt down}\{Alt up}, ahk_class MozillaWindowClass
`;::ControlSend, ahk_parent, {Alt down}`;{Alt up}, ahk_class MozillaWindowClass
'::ControlSend, ahk_parent, {Alt down}'{Alt up}, ahk_class MozillaWindowClass
,::ControlSend, ahk_parent, {Alt down}`{Alt up},, ahk_class MozillaWindowClass
.::ControlSend, ahk_parent, {Alt down}.{Alt up}, ahk_class MozillaWindowClass
/::ControlSend, ahk_parent, {Alt down}/{Alt up}, ahk_class MozillaWindowClass
F1::ControlSend, ahk_parent, {Alt down}{F1}{Alt up}, ahk_class MozillaWindowClass
F2::ControlSend, ahk_parent, {Alt down}{F2}{Alt up}, ahk_class MozillaWindowClass
F3::ControlSend, ahk_parent, {Alt down}{F3}{Alt up}, ahk_class MozillaWindowClass
F4::ControlSend, ahk_parent, {Alt down}{F4}{Alt up}, ahk_class MozillaWindowClass
F5::ControlSend, ahk_parent, {Alt down}{F5}{Alt up}, ahk_class MozillaWindowClass
F6::ControlSend, ahk_parent, {Alt down}{F6}{Alt up}, ahk_class MozillaWindowClass
F7::ControlSend, ahk_parent, {Alt down}{F7}{Alt up}, ahk_class MozillaWindowClass
F8::ControlSend, ahk_parent, {Alt down}{F8}{Alt up}, ahk_class MozillaWindowClass
F9::ControlSend, ahk_parent, {Alt down}{F9}{Alt up}, ahk_class MozillaWindowClass
F10::ControlSend, ahk_parent, {Alt down}{F10}{Alt up}, ahk_class MozillaWindowClass
F11::ControlSend, ahk_parent, {Alt down}{F11}{Alt up}, ahk_class MozillaWindowClass
F12::ControlSend, ahk_parent, {Alt down}{F12}{Alt up}, ahk_class MozillaWindowClass
Enter::ControlSend, ahk_parent, {Alt down}{Enter}{Alt up}, ahk_class MozillaWindowClass
Tab::Send, !{tab}
Left::ControlSend, ahk_parent, {Alt down}{Left}{Alt up}, ahk_class MozillaWindowClass
Right::ControlSend, ahk_parent, {Alt down}{Right}{Alt up}, ahk_class MozillaWindowClass
Up::ControlSend, ahk_parent, {Alt down}{Up}{Alt up}, ahk_class MozillaWindowClass
Down::ControlSend, ahk_parent, {Alt down}{Down}{Alt up}, ahk_class MozillaWindowClass
Backspace::ControlSend, ahk_parent, {Alt down}{Backspace}{Alt up}, ahk_class MozillaWindowClass
Delete::ControlSend, ahk_parent, {Alt down}{Delete}{Alt up}, ahk_class MozillaWindowClass
PgUp::ControlSend, ahk_parent, {Alt down}{PgUp}{Alt up}, ahk_class MozillaWindowClass
PgDn::ControlSend, ahk_parent, {Alt down}{PgDn}{Alt up}, ahk_class MozillaWindowClass
Space::ControlSend, ahk_parent, {Alt down}{space}{Alt up}, ahk_class MozillaWindowClass
Home::ControlSend, ahk_parent, {Alt down}{Home}{Alt up}, ahk_class MozillaWindowClass
End::ControlSend, ahk_parent, {Alt down}{End}{Alt up}, ahk_class MozillaWindowClass
}
#if

#if (ctrltoggle = 0 && shifttoggle = 1 && alttoggle = 0 && mastertoggle = 1)
{
; shift goes here
a::ControlSend, ahk_parent, {Shift down}a{Shift up}, ahk_class MozillaWindowClass
b::ControlSend, ahk_parent, {Shift down}b{Shift up}, ahk_class MozillaWindowClass
c::ControlSend, ahk_parent, {Shift down}c{Shift up}, ahk_class MozillaWindowClass
d::ControlSend, ahk_parent, {Shift down}d{Shift up}, ahk_class MozillaWindowClass
e::ControlSend, ahk_parent, {Shift down}e{Shift up}, ahk_class MozillaWindowClass
f::ControlSend, ahk_parent, {Shift down}f{Shift up}, ahk_class MozillaWindowClass
g::ControlSend, ahk_parent, {Shift down}g{Shift up}, ahk_class MozillaWindowClass
h::ControlSend, ahk_parent, {Shift down}h{Shift up}, ahk_class MozillaWindowClass
i::ControlSend, ahk_parent, {Shift down}i{Shift up}, ahk_class MozillaWindowClass
j::ControlSend, ahk_parent, {Shift down}j{Shift up}, ahk_class MozillaWindowClass
k::ControlSend, ahk_parent, {Shift down}k{Shift up}, ahk_class MozillaWindowClass
l::ControlSend, ahk_parent, {Shift down}l{Shift up}, ahk_class MozillaWindowClass
m::ControlSend, ahk_parent, {Shift down}m{Shift up}, ahk_class MozillaWindowClass
n::ControlSend, ahk_parent, {Shift down}n{Shift up}, ahk_class MozillaWindowClass
o::ControlSend, ahk_parent, {Shift down}o{Shift up}, ahk_class MozillaWindowClass
p::ControlSend, ahk_parent, {Shift down}p{Shift up}, ahk_class MozillaWindowClass
q::ControlSend, ahk_parent, {Shift down}q{Shift up}, ahk_class MozillaWindowClass
r::ControlSend, ahk_parent, {Shift down}r{Shift up}, ahk_class MozillaWindowClass
s::ControlSend, ahk_parent, {Shift down}s{Shift up}, ahk_class MozillaWindowClass
t::ControlSend, ahk_parent, {Shift down}t{Shift up}, ahk_class MozillaWindowClass
u::ControlSend, ahk_parent, {Shift down}u{Shift up}, ahk_class MozillaWindowClass
v::ControlSend, ahk_parent, {Shift down}v{Shift up}, ahk_class MozillaWindowClass
w::ControlSend, ahk_parent, {Shift down}w{Shift up}, ahk_class MozillaWindowClass
x::ControlSend, ahk_parent, {Shift down}x{Shift up}, ahk_class MozillaWindowClass
y::ControlSend, ahk_parent, {Shift down}y{Shift up}, ahk_class MozillaWindowClass
z::ControlSend, ahk_parent, {Shift down}z{Shift up}, ahk_class MozillaWindowClass
`::ControlSend, ahk_parent, {Shift down}``{Shift up}, ahk_class MozillaWindowClass
1::ControlSend, ahk_parent, {Shift down}1{Shift up}, ahk_class MozillaWindowClass
2::ControlSend, ahk_parent, {Shift down}2{Shift up}, ahk_class MozillaWindowClass
3::ControlSend, ahk_parent, {Shift down}3{Shift up}, ahk_class MozillaWindowClass
4::ControlSend, ahk_parent, {Shift down}4{Shift up}, ahk_class MozillaWindowClass
5::ControlSend, ahk_parent, {Shift down}5{Shift up}, ahk_class MozillaWindowClass
6::ControlSend, ahk_parent, {Shift down}6{Shift up}, ahk_class MozillaWindowClass
7::ControlSend, ahk_parent, {Shift down}7{Shift up}, ahk_class MozillaWindowClass
8::ControlSend, ahk_parent, {Shift down}8{Shift up}, ahk_class MozillaWindowClass
9::ControlSend, ahk_parent, {Shift down}9{Shift up}, ahk_class MozillaWindowClass
0::ControlSend, ahk_parent, {Shift down}0{Shift up}, ahk_class MozillaWindowClass
-::ControlSend, ahk_parent, {Shift down}-{Shift up}, ahk_class MozillaWindowClass
=::ControlSend, ahk_parent, {Shift down}={Shift up}, ahk_class MozillaWindowClass
[::ControlSend, ahk_parent, {Shift down}[{Shift up}, ahk_class MozillaWindowClass
]::ControlSend, ahk_parent, {Shift down}]{Shift up}, ahk_class MozillaWindowClass
\::ControlSend, ahk_parent, {Shift down}\{Shift up}, ahk_class MozillaWindowClass
`;::ControlSend, ahk_parent, {Shift down}`;{Shift up}, ahk_class MozillaWindowClass
'::ControlSend, ahk_parent, {Shift down}'{Shift up}, ahk_class MozillaWindowClass
,::ControlSend, ahk_parent, {Shift down}`,{Shift up}, ahk_class MozillaWindowClass
.::ControlSend, ahk_parent, {Shift down}.{Shift up}, ahk_class MozillaWindowClass
/::ControlSend, ahk_parent, {Shift down}/{Shift up}, ahk_class MozillaWindowClass
F1::ControlSend, ahk_parent, {Shift down}{F1}{Shift up}, ahk_class MozillaWindowClass
F2::ControlSend, ahk_parent, {Shift down}{F2}{Shift up}, ahk_class MozillaWindowClass
F3::ControlSend, ahk_parent, {Shift down}{F3}{Shift up}, ahk_class MozillaWindowClass
F4::ControlSend, ahk_parent, {Shift down}{F4}{Shift up}, ahk_class MozillaWindowClass
F5::ControlSend, ahk_parent, {Shift down}{F5}{Shift up}, ahk_class MozillaWindowClass
F6::ControlSend, ahk_parent, {Shift down}{F6}{Shift up}, ahk_class MozillaWindowClass
F7::ControlSend, ahk_parent, {Shift down}{F7}{Shift up}, ahk_class MozillaWindowClass
F8::ControlSend, ahk_parent, {Shift down}{F8}{Shift up}, ahk_class MozillaWindowClass
F9::ControlSend, ahk_parent, {Shift down}{F9}{Shift up}, ahk_class MozillaWindowClass
F10::ControlSend, ahk_parent, {Shift down}{F10}{Shift up}, ahk_class MozillaWindowClass
F11::ControlSend, ahk_parent, {Shift down}{F11}{Shift up}, ahk_class MozillaWindowClass
F12::ControlSend, ahk_parent, {Shift down}{F12}{Shift up}, ahk_class MozillaWindowClass
Enter::ControlSend, ahk_parent, {Shift down}{Enter}{Shift up}, ahk_class MozillaWindowClass
Tab::ControlSend, ahk_parent, {Shift down}{Tab}{Shift up}, ahk_class MozillaWindowClass
Left::ControlSend, ahk_parent, {Shift down}{Left}{Shift up}, ahk_class MozillaWindowClass
Right::ControlSend, ahk_parent, {Shift down}{Right}{Shift up}, ahk_class MozillaWindowClass
Up::ControlSend, ahk_parent, {Shift down}{Up}{Shift up}, ahk_class MozillaWindowClass
Down::ControlSend, ahk_parent, {Shift down}{Down}{Shift up}, ahk_class MozillaWindowClass
Backspace::ControlSend, ahk_parent, {Shift down}{Backspace}{Shift up}, ahk_class MozillaWindowClass
Delete::ControlSend, ahk_parent, {Shift down}{Delete}{Shift up}, ahk_class MozillaWindowClass
PgUp::ControlSend, ahk_parent, {Shift down}{PgUp}{Shift up}, ahk_class MozillaWindowClass
PgDn::ControlSend, ahk_parent, {Shift down}{PgDn}{Shift up}, ahk_class MozillaWindowClass
Space::ControlSend, ahk_parent, {Shift down}{space}{Shift up}, ahk_class MozillaWindowClass
Home::ControlSend, ahk_parent, {Shift down}{Home}{Shift up}, ahk_class MozillaWindowClass
End::ControlSend, ahk_parent, {Shift down}{End}{Shift up}, ahk_class MozillaWindowClass
}
#if
