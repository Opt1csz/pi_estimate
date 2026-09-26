# Summon a temporary marker at a random location across the 100x100 area (-50 to +50)
summon marker ~ ~20 ~ {Tags:["pi_dropper"]}
execute as @e[tag=pi_dropper,limit=1] run spreadplayers ~ ~ 0 50 false @s

# Measure distance squared from origin (R^2 = 2500 for radius 50)
# Scoreboard distance test: x^2 + z^2 <= 2500
execute as @e[tag=pi_dropper,limit=1] at @s store result score @s pi_temp run data get entity @s Pos[0]
execute as @e[tag=pi_dropper,limit=1] at @s store result score #Z pi_temp run data get entity @s Pos[2]

# Center offset correction relative to origin
# If inside distance <= 50 blocks (x^2 + z^2 <= 2500):
execute as @e[tag=pi_dropper,limit=1] at @s if entity @s[distance=..50] run setblock ~ ~-20 ~ lime_concrete
execute as @e[tag=pi_dropper,limit=1] at @s if entity @s[distance=..50] run scoreboard players add #Inside pi_inside 1

# If outside distance > 50 blocks:
execute as @e[tag=pi_dropper,limit=1] at @s unless entity @s[distance=..50] run setblock ~ ~-20 ~ red_concrete

# Update Total and clean up marker
scoreboard players add #Total pi_total 1
kill @e[tag=pi_dropper]
