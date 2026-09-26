# Initialize Scoreboards
scoreboard objectives add pi_total dummy "Total Blocks"
scoreboard objectives add pi_inside dummy "Inside Circle"
scoreboard objectives add pi_calc dummy "Estimated Pi x10000"
scoreboard objectives add pi_temp dummy

# Initialize values
scoreboard players set #Total pi_total 0
scoreboard players set #Inside pi_inside 0
scoreboard players set #Running pi_temp 0

# Set up team to hide collision/nametags if needed
scoreboard teams add pi_team
scoreboard teams option pi_team collisionRule never

tellraw @a [{"text":"[Monte Carlo Pi] ","color":"gold","bold":true},{"text":"Loaded! Type ","color":"yellow"},{"text":"/function pi:start","color":"green","underlined":true},{"text":" to begin.","color":"yellow"}]
