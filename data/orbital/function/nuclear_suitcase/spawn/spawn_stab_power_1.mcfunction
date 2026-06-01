execute align xyz run summon minecraft:marker ~ ~ ~ {Tags:["stab_1", "osc"]}
execute as @n[tag=osc] store result score @n[tag=osc] posX run data get entity @n[tag=osc] Pos[0]
execute as @n[tag=osc] store result score @s posY run data get entity @n[tag=osc] Pos[1]
execute as @n[tag=osc] store result score @s posZ run data get entity @n[tag=osc] Pos[2]
tellraw @s [{"text":"Spawn coords: ","color":"gold"},{"score":{"name":"@n[tag=osc]","objective":"posX"}},{"text":" "},{"score":{"name":"@s","objective":"posY"}},{"text":" "},{"score":{"name":"@s","objective":"posZ"}}]
