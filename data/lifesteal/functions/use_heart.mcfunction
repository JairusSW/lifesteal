#say used heart
say "use_heart"
scoreboard players add @s ls_health 1
execute if score @s ls_health matches 21.. run execute at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:firework_star", Count:1b, tag:{owner:"none", Explosion:{Type:0b, Colors:[I;11743532]},display:{Name:'[{"text":"Heart","italic":false,"color":"red"}]',Lore:['[{"text":"Right click to use","italic":false}]']},Enchantments:[{}],Heart:1b}}}
execute if score @s ls_health matches 21.. run attribute @s generic.max_health base set 40