say "Loser died"

# Give a heart to the killer
scoreboard players add @a[scores={lifesteal-kills=1..}] lifesteal-health 1

# Take a heart from killed
scoreboard players remove @s lifesteal-health 1

# Update health for killer
function lifesteal:update_health

# Update health for killed
execute as @a[scores={lifesteal-kills=1..}] run function lifesteal:update_health

# Reset player deaths
scoreboard players set @s lifesteal-deaths 0
# Reset kill count
scoreboard players set @a[scores={lifesteal-kills=1..}] lifesteal-kills 0