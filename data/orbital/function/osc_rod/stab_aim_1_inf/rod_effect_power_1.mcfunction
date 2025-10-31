function orbital:raycast/stab_raycast_power_1/spawn_armor_stand
item replace entity @s weapon.mainhand with minecraft:air
execute at @s run schedule function orbital:osc_rod/stab_aim_1_inf/replace 2t
tag @s add replace1