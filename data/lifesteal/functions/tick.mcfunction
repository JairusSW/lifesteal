# Detect player deaths
execute as @e[scores={lifesteal-is-dead=1..},limit=1] run function lifesteal:death_detector

# Update health when respawned
execute as @e[tag=is-dead] run function lifesteal:update_health

# If player was killed and killed by another player
execute as @a[scores={lifesteal-kills=1..}] run execute as @a[scores={lifesteal-deaths=1..,lifesteal-health=2..}] run function lifesteal:on_death

# Reset deaths if died naturally
execute as @a[scores={lifesteal-deaths=1}] run scoreboard players set @s lifesteal-deaths 0