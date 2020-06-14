--  Random search zone spawning

--  SCENARIO
--  You want a selection of potential spawn zones and a unit will spawn somewhere within one of those zones at random

--  REQUIREMENTS
--  Moose (2.5.0 used)

--  PREPARATION
--  1. Define a target with the name "SearchTarget" in the mission editor
--  2. Draw a list of zones in the editor with the names SearchZone1, SearchZone2, ...

--  CODE
--  Define list of search zones, with the names matching the editor
SEARCH_ZONES = { ZONE:New( "SearchZone1" ), ZONE:New( "SearchZone2" ), ZONE:New( "SearchZone3" ) }

--  Create spawn, random search zone and spawn within there
TARGET = SPAWN:New( "SearchTarget" )
    :InitRandomizeZones( SEARCH_ZONES )
    :Spawn()