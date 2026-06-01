# Двигаемся шагами вперёд и ищем блок
execute if block ^ ^ ^0.5 air run function orbital:raycast/nuke_raycast_power_2/find_block_step
execute unless block ^ ^ ^0.5 air run summon minecraft:armor_stand ^ ^ ^0.5 {NoGravity:1b,Invisible:0b,Marker:0b,Tags:["nuke2"]}
execute unless block ^ ^ ^0.5 air run function orbital:raycast/nuke_raycast_power_2/run_nuke