--  Name:                           ACT_service
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

Spawn_AWACS_BLUE = SPAWN:New("AWACS Blue #001")
Spawn_AWACS_RED = SPAWN:New("AWACS Red #001")
Spawn_TANKER1 = SPAWN:New("TANKER Blue #001")
Spawn_TANKER2 = SPAWN:New("TANKER Blue #002")
Spawn_TANKER_RED = SPAWN:New("TANKER Red #001")

Spawn_AWACS_BLUE:Spawn()
Spawn_AWACS_RED:Spawn()
Spawn_TANKER1:Spawn()
Spawn_TANKER2:Spawn()
Spawn_TANKER_RED:Spawn()

Spawn_AWACS_BLUE:InitCleanUp( 20 )
Spawn_AWACS_RED:InitCleanUp( 20 )
Spawn_TANKER1:InitCleanUp( 20 )
Spawn_TANKER2:InitCleanUp( 20 )
Spawn_TANKER_RED:InitCleanUp( 20 )