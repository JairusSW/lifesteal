# Detect deaths of player
scoreboard objectives add lifesteal-deaths deathCount
# Detect the kills of player
scoreboard objectives add lifesteal-kills playerKillCount

# Keep track of player health
scoreboard objectives add lifesteal-health dummy

# Detect player respawn
scoreboard objectives add lifesteal-is-dead deathCount