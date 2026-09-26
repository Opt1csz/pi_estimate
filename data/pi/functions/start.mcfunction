# Set origin marker at current position
execute at @s run summon armor_stand ~ ~ ~ {Tags:["pi_origin"],NoGravity:1b,Invisible:1b}

# Reset counters
scoreboard players set #Total pi_total 0
scoreboard players set #Inside pi_inside 0
scoreboard players set #Running pi_temp 1

# Draw platform bounds (Square 100x100 at origin)
execute at @e[tag=pi_origin,limit=1] run fill ~-50 ~-1 ~-50 ~50 ~-1 ~50 black_stained_glass
execute at @e[tag=pi_origin,limit=1] run fill ~-50 ~ ~-50 ~50 ~ ~50 barrier outline

tellraw @a [{"text":"[Monte Carlo Pi] ","color":"gold"},{"text":"Simulation Started!","color":"green"}]
