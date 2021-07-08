# EasyESP
 A plugin that adds a new ESP for the Administration. Plugin is easy to edit. This plugin will work **exclusively in** [Helix](https://github.com/NebulousCloud/helix) **gamemode 
from** [NebulousCloud](https://github.com/NebulousCloud). Plugin changes the amount of data depending on the distance of the administrator from the player!

The plugin was developed by **AsterionProject**. Discord of our project: [discord.gg/Cz3EQJ7WrF](https://discord.gg/Cz3EQJ7WrF)
![asterion](https://i.imgur.com/qJtYDKM.png)
 
 ### function list
 ```lua
 PLUGIN:AddPlayerESPCustomization() -- Adds new values for the player
 PLUGIN:AddEntityESPCustomization() -- Adds new values for the entity
 ```
 
 
If you want to add new entities to the render list, you will need to modify the **PLUGIN.entslist** table. An example of the finished code below:
```lua
PLUGIN.entslist = {
    ["ix_item"] = Color(157, 111, 210),
    ["ix_vendor"] = Color(197, 199, 62),
    ["ix_container"] = Color(41, 175, 34)
}
```

Pictures from the latest version of the plugin
![gm1](https://i.imgur.com/3i5CkCy.png)
![gm2](https://i.imgur.com/M1kLLtg.png)
![gm3](https://i.imgur.com/j4ZgZdk.png)
![gm4](https://i.imgur.com/Warqo4j.png)
![gm5](https://i.imgur.com/1ovak1t.png)

An example of a finished **cl_config.lua** file
![alt text](https://i.imgur.com/NDEpsdq.png)
