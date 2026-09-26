# Only run wave if simulation is active
execute if score #Running pi_temp matches 1 run function pi:wave

# Display action bar statistics to all players
execute store result score #Temp1 pi_temp run scoreboard players get #Inside pi_inside
execute store result score #Temp2 pi_temp run scoreboard players get #Total pi_total

# Math: Pi * 10000 = (Inside * 40000) / Total
execute if score #Total pi_total matches 1.. run scoreboard players operation #Inside pi_inside *= #C40000 pi_temp
execute if score #Total pi_total matches 1.. run scoreboard players operation #Inside pi_inside /= #Total pi_total

title @a actionbar [{"text":"Total: ","color":"gray"},{"score":{"name":"#Total","objective":"pi_total"},"color":"white"},{"text":" | Inside: ","color":"gray"},{"score":{"name":"#Inside","objective":"pi_inside"},"color":"green"},{"text":" | Estimated Pi (x10k): ","color":"gold"},{"score":{"name":"#Inside","objective":"pi_inside"},"color":"yellow"}]

# Restore original Inside value
scoreboard players operation #Inside pi_inside = #Temp1 pi_temp
