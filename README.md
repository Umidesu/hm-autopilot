# autopilot
Better autopilot for FiveM

# config
client.lua

```
local speed = 20.0                      -- Max speed for Autopilot
local flag = 447                        -- Ai rules for Autopilot
local stop = 2.0                        -- Distance for vehicle to stop at destination

local models = {                        -- Allowed vehicle models
    "raiden"
}

local trigger = "Y"                     -- Key to activate autopilot
local abort = {32, 34, 8, 9, 73}        -- Keys to abort Autopilot

local command = "+hm-autopilot:start"   -- Command to trigger from chat
```

# FLAG


```
FLAG ENABLED - CONVERTED INTEGER - DESCRIPTION
00000000000000000000000000000001 - 1 - stop before vehicles
00000000000000000000000000000010 - 2 - stop before peds
00000000000000000000000000000100 - 4 - avoid vehicles
00000000000000000000000000001000 - 8 - avoid empty vehicles
00000000000000000000000000010000 - 16 - avoid peds
00000000000000000000000000100000 - 32 - avoid objects
00000000000000000000000001000000 - 64 - ?
00000000000000000000000010000000 - 128 - stop at traffic lights
00000000000000000000000100000000 - 256 - use blinkers
00000000000000000000001000000000 - 512 - allow going wrong way (only does it if the correct lane is full, will try to reach the correct lane again as soon as possible)
00000000000000000000010000000000 - 1024 - go in reverse gear (backwards)
00000000000000000000100000000000 - 2048 - ?
00000000000000000001000000000000 - 4096 - ?
00000000000000000010000000000000 - 8192 - ?
00000000000000000100000000000000 - 16384 - ?
00000000000000001000000000000000 - 32768 - ?
00000000000000010000000000000000 - 65536 - ?
00000000000000100000000000000000 - 131072 - ?
00000000000001000000000000000000 - 262144 - Take shortest path (Removes most pathing limits, the driver even goes on dirtroads)
00000000000010000000000000000000 - 524288 - Reckless (Allow overtaking vehicles if possible)
00000000000100000000000000000000 - 1048576 - ?
00000000001000000000000000000000 - 2097152 - ?
00000000010000000000000000000000 - 4194304 - Ignore roads (Uses local pathing, only works within 200~ meters around the player)
00000000100000000000000000000000 - 8388608 - ?
00000001000000000000000000000000 - 16777216 - Ignore all pathing (Goes straight to destination)
00000010000000000000000000000000 - 33554432 - ?
00000100000000000000000000000000 - 67108864 - ?
00001000000000000000000000000000 - 134217728 - ?
00010000000000000000000000000000 - 268435456 - ?
00100000000000000000000000000000 - 536870912 - avoid highways when possible (will use the highway if there is no other way to get to the destination)
01000000000000000000000000000000 - 1073741824 - ?```