    --  Name:                           ACT_RAT
    --  Author:                         Activity
    --  Last Modified On:               28/02/2020
    --  Description:
    --  Dependencies:                   Moose.lua
    --  Description:
    --      Sets up random air traffic by using MOOSE's RAT for domestic, red of blue sides and a custom script for 
    --      international "grey" flights.
    --  Usage:
    --      1. flags 91, 92, 93 are used to enable domestic red, domestic blue and intl flights respectively
    --         ensure there flags are set to "on" in mission editor
    --      2. domestic red and blue flights use templates set up in the mission editor, ensure names match those in script.
    --      3. intl flights are all late activated, custom set up flights.
--Define Settings

--trigger.action.outText("RAT init", 1)

flag1 = trigger.misc.getUserFlag("91")
flag2 = trigger.misc.getUserFlag("92")
flag3 = trigger.misc.getUserFlag("93")

intlflights = 3
intlflightlist= {}

if flag1 == 1 then
    c130red=RAT:New("RAT C130 RED")
    c130red:SetTerminalType(AIRBASE.TerminalType.OpenBig)
    c130red:Spawn(3)
    
    heli1red=RAT:New("RAT HELI RED 1")
    heli1red:Spawn(1)

    heli2red=RAT:New("RAT HELI RED 2")
    heli2red:Spawn(2)

    --trigger.action.outText("RAT1 init", 1)
end

if flag2 == 1 then
    c130blue=RAT:New("RAT C130 BLUE")
    c130blue:SetTerminalType(AIRBASE.TerminalType.OpenBig)
    c130blue:Spawn(3)
    --trigger.action.outText("RAT2 init", 1)
end

if flag3 == 1 then
    for i = 1,intlflights,1 do
        local flightId = math.random(1,6) --second number is numder of presets in ME
        intlflightlist[i] = SPAWN:New("RAT INTL #00"..tostring(flightId))
        intlflightlist[i]:Spawn()
        intlflightlist[i]:InitCleanUp( 120 )
        --trigger.action.outText("INTL flight spawned", 1)
    end
end