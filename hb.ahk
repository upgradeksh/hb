FileInstall, D:\autohotkey\bag.png,   %A_WorkingDir%\bag.png,   1
FileInstall, D:\autohotkey\bag_2.png, %A_WorkingDir%\bag_2.png, 1

SetDefaultMouseSpeed, 0
;SetMouseDelay, 10

#IfWinActive Helbreath Olympia 5.3

F1::INSERT

`::SendInput, {CTRL DOWN}p{CTRL UP}

LAlt & q::
OpenBag(20, -60)
return

LAlt & w::
OpenBag(68, -60)
return

LAlt & e::
OpenBag(116, -60)
return

LAlt & a::
SwapWand(45, -7)
return

LAlt & s::
SwapWand(79, -50)
return


SwapWand(x, y) {
    KeyWait Alt
    BlockInput On
    MouseGetPos, xpos, ypos
    ImageSearch FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *130 bag_2.png

    if ( errorlevel != 0 ) {
        SendInput, {F6}
        sleep 100

        ImageSearch FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *130 bag_2.png
        if ( errorlevel = 0 ) {
            Found = 1
        }
    }

    else {
        Found = 1
    }

    If (Found) {
        MultiClick(FoundX+x, FoundY+y, 3)
        MouseMove, xpos, ypos
        SendInput, {F6}
    }

    else {
        SendInput, NotFound(%errorlevel%)
    }

    BlockInput Off
    return
}

OpenBag(x,y) {
    KeyWait Control
    BlockInput On
    MouseGetPos, xpos, ypos
    ImageSearch FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *130 bag.png
    if ( errorlevel != 0 ) {
        SendInput, {F6}
        sleep 100

        ImageSearch FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *130 bag.png

        if ( errorlevel = 0 ) {
            OriginX = %FoundX%
            OriginY = %FoundY%
            FoundX += x
            FoundY += y
            Found = 1
        }
    }

    else {
        OriginX = %FoundX%
        OriginY = %FoundY%
        FoundX += x
        FoundY += y
        Found = 1
    }

    if (Found) {
        ;MultiClick(OriginX+20, OriginY-85, 2)
        Click %FoundX%, %FoundY%, 11
        sleep 40
        ;MultiClick(OriginX+68, OriginY-85, 3)
        SendInput, {F6}
        MouseMove, xpos, ypos
    }

    BlockInput Off
    return
}

MultiClick(x2,y2,i) {
    Click %x2%, %y2%, %i%
    sleep 100
}
