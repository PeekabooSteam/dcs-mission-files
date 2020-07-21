--  Name:                           ACT_A2A_Dispatcher
--  Author:                         Activity
--  Last Modified On:               28/02/2020
--  Description:
--  Dependencies:                   Moose.lua
--  Description:
--      Sets up the Moose A2A_Dispatcher class: https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/AI.AI_A2A_Dispatcher.html
--      The dispatcher sets up a specified area by unit "BORDER Red" for CAP and GCI.
--      the system spawns and manages patrolling units in the zone and uses a system
--      of early warning radars (EWR) to detect targets and intercept them. System
--      ensures there's always the amount of hostile flights * defaultOverhead on 
--      active patrol.
--  Usage:
--      1. Ensure EWR groups are called "EWR Red #001", "EWR Red #002", etc. optionally add "AWACS Red"
--      2. Use late activated helicopter with name "BORDER Red" to define to be patrolled area
--         The waypoints will mark the area.
--      3. Ensure Templates for CAP flights are called "CAP Red #001", "CAP Red #002", etc.
--      4. Make sure AIRBASE is set correctly, for list see https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/Wrapper.Airbase.html##(AIRBASE).Caucaus
--         or Moose.lua @ line 38473

--Define Settings
defaultOverhead = 0.5                       -- Balancing value for hostile flights vs friendly, 1 meaning equal
defaultGrouping = 2                         -- Number of planes in a flight
defaultFlightsAmount = 2                    -- Number of flights to be in the air by default
defaultTimerLow = 100                       -- Low end of time required between spawning new flight
defaultTimerHigh = 200                      -- High end of time required between spawning new flight
templatesCAP = {                            -- Templates used for spawning flights
    "CAP Red #001", "CAP Red #002"
}

airbase = AIRBASE.PersianGulf.Lar_Airbase   -- Defines airbase from which to spawn flights

--Define Detecting network
DetectionSetGroupRED = SET_GROUP:New()
DetectionSetGroupRED:FilterPrefixes( { "EWR Red", "AWACS Red"} )
DetectionSetGroupRED:FilterStart()

DetectionRED = DETECTION_AREAS:New( DetectionSetGroupRED, 50000 )

--Init Dispatcher
A2ADispatcherRED = AI_A2A_DISPATCHER:New( DetectionRED, 30000 )

--Define Border
BorderRED= ZONE_POLYGON:New( "BORDER Red", GROUP:FindByName( "BORDER Red" ) )
A2ADispatcherRED:SetBorderZone( BorderRED)

--Define EngageRadius
A2ADispatcherRED:SetEngageRadius( 150000 )

--Define Squadrons

A2ADispatcherRED:SetSquadron( "CAP_RED_1", airbase, templatesCAP )

--Define Squadron properties
A2ADispatcherRED:SetSquadronOverhead( "CAP_RED_1", defaultOverhead )
A2ADispatcherRED:SetSquadronGrouping( "CAP_RED_1", defaultGrouping )

--Define tankers
--A2ADispatcherRED:SetDefaultTanker( "TANKER Red #001" )

--Define CAP Squadron execution
A2ADispatcherRED:SetSquadronCap( "CAP_RED_1", BorderRED,  3000, 9000, 400, 800, 600, 900)
A2ADispatcherRED:SetSquadronCapInterval( "CAP_RED_1", defaultFlightsAmount, defaultTimerLow, defaultTimerHigh, 1)

--Enables updating display, helpfull for debugging but shows to all coalitions.
A2ADispatcherRED:SetTacticalDisplay( false )

--Define Defaults
A2ADispatcherRED:SetDefaultTakeOffInAir()
A2ADispatcherRED:SetDefaultLandingAtRunway()

