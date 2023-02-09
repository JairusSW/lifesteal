execute if score @s ls_health matches 0 run attribute @s generic.max_health base set 2
execute if score @s ls_health matches 1 run attribute @s generic.max_health base set 2
execute if score @s ls_health matches 2 run attribute @s generic.max_health base set 4
execute if score @s ls_health matches 3 run attribute @s generic.max_health base set 6
execute if score @s ls_health matches 4 run attribute @s generic.max_health base set 8
execute if score @s ls_health matches 5 run attribute @s generic.max_health base set 10
execute if score @s ls_health matches 6 run attribute @s generic.max_health base set 12
execute if score @s ls_health matches 7 run attribute @s generic.max_health base set 14
execute if score @s ls_health matches 8 run attribute @s generic.max_health base set 16
execute if score @s ls_health matches 9 run attribute @s generic.max_health base set 18
execute if score @s ls_health matches 10 run attribute @s generic.max_health base set 20
execute if score @s ls_health matches 11 run attribute @s generic.max_health base set 22
execute if score @s ls_health matches 12 run attribute @s generic.max_health base set 24
execute if score @s ls_health matches 13 run attribute @s generic.max_health base set 26
execute if score @s ls_health matches 14 run attribute @s generic.max_health base set 28
execute if score @s ls_health matches 15 run attribute @s generic.max_health base set 30
execute if score @s ls_health matches 16 run attribute @s generic.max_health base set 32
execute if score @s ls_health matches 17 run attribute @s generic.max_health base set 34
execute if score @s ls_health matches 18 run attribute @s generic.max_health base set 36
execute if score @s ls_health matches 19 run attribute @s generic.max_health base set 38
execute if score @s ls_health matches 20 run attribute @s generic.max_health base set 40
execute if score @s ls_health matches 21 run attribute @s generic.max_health base set 40
execute if score @s ls_health matches 22 run attribute @s generic.max_health base set 40
execute if score @s ls_health matches 23 run attribute @s generic.max_health base set 40
execute if score @s ls_health matches 24 run attribute @s generic.max_health base set 40
execute if score @s ls_health matches 25 run attribute @s generic.max_health base set 40

# Updates the health
execute unless score @s ls_health = @s ls_lastHealth run effect give @s poison 1 1 true
execute unless score @s ls_health = @s ls_lastHealth run effect give @s regeneration 1 2 true

# Sets the last health score to the health score
execute store result score @s ls_lastHealth run scoreboard players get @s ls_health