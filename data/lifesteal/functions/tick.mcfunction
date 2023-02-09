scoreboard players add tick ls_tick 1
execute if score tick ls_tick matches 21.. run scoreboard players reset tick ls_tick

# If player joins, give them default 10 hearts
execute as @a store success score @s ls_firstJoin run scoreboard players get @s ls_firstJoin

# Resets the players health if the player joins for the first time
execute as @a[scores={ls_firstJoin=0}] run scoreboard players set @s ls_health 10

# Detect heart activation
execute as @r[nbt={SelectedItem: {tag: {Heart: 1b}}},gamemode=!spectator] at @s run function lifesteal:heart_right_click
execute as @r[scores={last_tick_heart_check=1},gamemode=!spectator] at @s run function lifesteal:heart_right_click
execute unless entity @a[nbt={SelectedItem: {tag: {Heart: 1b}}},gamemode=!spectator] run kill @e[type=armor_stand,tag=ls_rightClickDetector]

# Checks if a player has killed another player and then gives them a extra heart
execute as @a[scores={ls_killedPlayer=1..,ls_health=..19}] run scoreboard players add @s ls_health 1
execute as @a[scores={ls_death=1..,ls_health=2..}] run execute as @a[scores={ls_killedPlayer=1..,ls_health=..19}] run tellraw @s {"text": "+1 heart"}
execute as @a[scores={ls_killedPlayer=1..,ls_health=20}] run tellraw @s {"text": "+0 heart"}
execute as @a[scores={ls_killedPlayer=1..,ls_health=20}] run tellraw @a[scores={ls_death=1..}] {"text": "-0 heart"}
execute as @a[scores={ls_killedPlayer=1..,ls_health=20}] run scoreboard players remove @s ls_health 1

# Checks if a player has been killed and then takes a heart from them
execute as @a[scores={ls_death=1..,ls_health=2..}] run scoreboard players remove @s ls_health 1
execute as @a[scores={ls_death=1..,ls_health=2..}] run tellraw @s {"text": "-1 Heart"}
execute as @a[scores={ls_death=1..,ls_health=1}] run tellraw @s {"text": "-0 Heart"}
execute as @a[scores={ls_death=1..,ls_health=1}] run tellraw @a[scores={ls_killedPlayer=1..}] {"text": "+0 Heart"}
execute as @a[scores={ls_death=1..,ls_health=1}] run scoreboard players remove @a[scores={ls_killedPlayer=1..}] ls_health 1

# Keeps track of how many completed kills a player has
execute as @a[scores={ls_killedPlayer=1..}] at @s if entity @a[scores={ls_death=1..,ls_health=0}] run scoreboard players add @s ls_completedKills 1

# Recipe
execute if entity @a[nbt={Inventory: [{id: "minecraft:knowledge_book"}]}] run execute at @a[nbt={Inventory: [{id: "minecraft:knowledge_book"}]}] run summon minecraft:item ~ ~ ~ {Item: {id: "minecraft:firework_star", Count: 1b, tag: {owner: "none", Explosion: {Type: 0b, Colors: [I; 11743532]}, display: {Name: '[{"text":"Heart","italic":false,"color":"red"}]', Lore: ['[{"text":"Right click to use","italic":false}]']}, Enchantments: [{}], Heart: 1b}}}

execute if entity @a[nbt={Inventory: [{id: "minecraft:knowledge_book"}]}] run execute as @e[type=item,distance=..1,nbt={Item: {id: "minecraft:firework_star", Count: 1b, tag: {owner: "none", Explosion: {Type: 0b, Colors: [I; 11743532]}, display: {Name: '[{"text":"Heart","italic":false,"color":"red"}]', Lore: ['[{"text":"Right click to use","italic":false}]']}, Enchantments: [{}], Heart: 1b}}}] run data modify entity @s Item.tag.owner set from block 0 -64 0 Text1

execute if entity @a[nbt={Inventory: [{id: "minecraft:knowledge_book"}]}] run clear @a[nbt={Inventory: [{id: "minecraft:knowledge_book"}]}] minecraft:knowledge_book

# Checks if any player wants to extract a life and if yes then gives them a life
execute as @r[scores={extract-heart=1..,ls_health=..1}] run tellraw @s {"text":"You can not extract a heart if you have 1 or less hearts","color":"red"}
execute as @r[scores={extract-heart=1..},gamemode=spectator] run tellraw @s {"text":"You can not extract a heart if you are in spectator","color":"red"}
execute as @r[scores={extract-heart=1..,ls_health=2..},gamemode=!spectator] at @s run function lifesteal:give_life
scoreboard players reset @a extract-heart


# Updates the player health bar
execute as @a run function lifesteal:health_check
execute as @a[scores={ls_health=..0}] if score @s ls_banned matches 1.. run scoreboard players set @s ls_health 10
execute store result score @a[scores={ls_health=..0}] ls_ban_tick run scoreboard players get tick ls_tick
execute as @a[scores={ls_health=..0}] if score @s ls_ban_tick = tick ls_tick run scoreboard players set @s ls_banned 1
execute as @a unless score @s ls_ban_tick = tick ls_tick run scoreboard players set @s ls_banned 0
execute if score ban_on_death ls_global_settings matches 1 run scoreboard players set @s ls_health 1


# Resets all of the scores
scoreboard players set @a ls_killedPlayer 0
scoreboard players set @a ls_death 0
scoreboard players set @a ls_leave 0

scoreboard players enable @a extract-heart