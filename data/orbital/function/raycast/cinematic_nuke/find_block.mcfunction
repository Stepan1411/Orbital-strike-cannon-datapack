# Двигаемся шагами вперёд и ищем блок
execute if block ^ ^ ^0.5 air run function orbital:raycast/cinematic_nuke/find_block_step
execute unless block ^ ^ ^0.5 air run summon minecraft:armor_stand ^ ^ ^0.5 {NoGravity:1b,Invisible:0b,Marker:0b,Tags:["stab3"]}
execute unless block ^ ^ ^0.5 air run function orbital:raycast/cinematic_nuke/run_stab