# If player was killed and killed by another player
execute as @a[scores={lifesteal-kills=1..}] run execute as @a[scores={lifesteal-deaths=1..}] run execute if score @s lifesteal-health matches 2.. run function lifesteal:on_death

# Reset deaths if died naturally
execute as @a[scores={lifesteal-deaths=1..}] run scoreboard players set @s lifesteal-deaths 0

# Update health on join
execute as @a[distance=0] run function lifesteal:update_health