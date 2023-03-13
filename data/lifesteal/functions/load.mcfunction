title @a times 20 100 0
title @a title {"text":"LifeSteal Datapack:", "color": "red"}
title @a subtitle {"text":"Loaded Successfully","color":"dark_green"}

# Detect deaths of player
scoreboard objectives add lifesteal-deaths deathCount
# Detect the kills of player
scoreboard objectives add lifesteal-kills playerKillCount

# Keep track of player health
scoreboard objectives add lifesteal-health dummy