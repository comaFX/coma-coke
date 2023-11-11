# coma-coke
QB-CORE based drug processing for coke and crack using a modified version of [ps-drugprocessing](https://github.com/Project-Sloth/ps-drugprocessing)

Feel free to join [Discord](https://discord.gg/nFZreK2NRX) for any questions or suggestions

<ul>
<li>Process coca leaves into raw coke</li>
<li>Bag up raw coke for selling to locals or personal use</li>
<li>Cook raw coke and baking soda to make crack for selling to locals or personal use</li>
<li>Bag raw coke into keys and 1/4 keys</li>
<li>Break down coke keys and 1/4 keys to raw coke</li>
</ul>

| Dependencies  | Optional |
| ------------- | ------------- |
| [qb-core](https://github.com/qbcore-framework/qb-core)    | [pickle_xp](https://github.com/PickleModifications/pickle_xp)  |
| [PolyZone](https://github.com/mkafrin/PolyZone)  | 
| [qb-target](https://github.com/qbcore-framework/qb-target)  |               
| [bob74_ipl](https://github.com/Bob74/bob74_ipl)  |            


# Items to add to qb-core/shared/items.lua
```lua
['cokekey'] = {['name'] = 'cokekey',  ['label'] = 'Coke Key',  ['weight'] = 5,  ['type'] = 'item',  ['image'] = 'coma-coke-key.png',  ['unique'] = false,  ['useable'] = false,  ['shouldClose'] = false,  ['combinable'] = nil,  ['description'] = 'Key to the coke room'},
["coke"] = {["name"] = "coke",  ["label"] = "Raw Coke",  ["weight"] = 2,  ["type"] = "item",  ["image"] = "coke.png",  ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false,  ["combinable"] = nil,  ["description"] = "Unprocessed Coke"},
['scale'] = {['name'] = 'scale',  ['label'] = 'Scale',  ['weight'] = 400,  ['type'] = 'item',  ['image'] = 'finescale.png',  ['unique'] = false,  ['useable'] = false,  ['shouldClose'] = false,  ['combinable'] = nil,   ['description'] = 'Tools of the trade'},
["bakingsoda"] = {["name"] = "bakingsoda",  ["label"] = "Baking Soda",  ["weight"] = 200,  ["type"] = "item",  ["image"] = "bakingsoda.png",  ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false,  ["combinable"] = nil,  ["description"] = "Baking Soda"},
["coca_leaf"] = {["name"] = "coca_leaf",  ["label"] = "Coca leaves",  ["weight"] = 400,  ["type"] = "item",  ["image"] = "coca_leaf.png",  ["unique"] = false,  ["useable"] = false, 	["shouldClose"] = false,  ["combinable"] = nil,  ["description"] = "Unprocessed Coca leaves"},
["sulfuric_acid"] = {["name"] = "sulfuric_acid",  ["label"] = "Sulfuric Acid",  ["weight"] = 1000,  ["type"] = "item",  ["image"] = "sulfuric_acid.png",  ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false,  ["combinable"] = nil,  ["description"] = "Chemicals, handle with care!"},
---These Items should already be included with qb-drugs. Edit as needed or add if you do not have them
['cokebaggy'] = {['name'] = 'cokebaggy',  ['label'] = 'Coke Baggies',  ['weight'] = 2,  ['type'] = 'item',  ['image'] = 'cocaine_baggy.png',  ['unique'] = false,  ['useable'] = true,  ['shouldClose'] = true,  ['combinable'] = nil,  ['description'] = 'To get happy real quick'},
['crack_baggy'] = {['name'] = 'crack_baggy',  ['label'] = 'Bag of Crack',  ['weight'] = 2,  ['type'] = 'item',  ['image'] = 'crack_baggy.png',  ['unique'] = false,  ['useable'] = true,  ['shouldClose'] = true,  ['combinable'] = nil,  ['description'] = 'To get happy faster'},
['coke_brick'] = {['name'] = 'coke_brick',  ['label'] = 'Key of Coke',  ['weight'] = 1000,  ['type'] = 'item',  ['image'] = 'coke_brick.png',  ['unique'] = true,  ['useable'] = false,  ['shouldClose'] = true,['combinable'] = nil,  ['description'] = 'Ready for distribution'},
['coke_small_brick'] = {['name'] = 'coke_small_brick',  ['label'] = '1/4 Key of Coke',  ['weight'] = 250,  ['type'] = 'item',  ['image'] = 'coke_small_brick.png',  ['unique'] = true,  ['useable'] = false,  ['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = 'Ready for distribution'},
```

# Locations

### The current location of the Coke Room. It can be easily moved using the [config.lua](https://github.com/comaFX/coma-coke/blob/main/config.lua)
117.94, -1684.11, 32.5

### Coca Plant Spawn Location
-1478.66, 4571.05, 37.68

### Sulfuric Acid Spawn Location
599.21, 2887.87, 39.77




