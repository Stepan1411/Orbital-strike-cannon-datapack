# /trigger commands
function orbital:dialog

execute as @a[scores={remove_all_charges=1..}] run function orbital:nuclear_suitcase/remove_all
scoreboard players set @a[scores={remove_all_charges=1..}] remove_all_charges 0
execute at @a run scoreboard players enable @a remove_all_charges

execute as @a[scores={charges_list=1..}] run function orbital:nuclear_suitcase/list
scoreboard players set @a[scores={charges_list=1..}] charges_list 0
execute at @a run scoreboard players enable @a charges_list

execute as @a[scores={launch=1..}] run function orbital:nuclear_suitcase/launch
scoreboard players set @a[scores={launch=1..}] launch 0
execute at @a run scoreboard players enable @a launch

execute as @a[scores={toggle_message=1}] run scoreboard players set toggle_message_ toggle_message_ 0
execute at @a run scoreboard players enable @a toggle_message

execute as @a[scores={toggle_message=0}] run scoreboard players set toggle_message_ toggle_message_ 1
execute at @a run scoreboard players enable @a toggle_message

execute as @a[scores={craft_toggle=1}] run scoreboard players set craft_toggle_ craft_toggle_ 0
execute at @a run scoreboard players enable @a craft_toggle

execute as @a[scores={craft_toggle=0}] run scoreboard players set craft_toggle_ craft_toggle_ 1
execute at @a run scoreboard players enable @a craft_toggle

execute as @a[scores={delete_nearest=1..}] run kill @n[tag=osc]
scoreboard players set @a[scores={delete_nearest=1..}] delete_nearest 0
execute at @a run scoreboard players enable @a delete_nearest

execute as @a[scores={add_stab_charge=1}] positioned as @s run function orbital:nuclear_suitcase/spawn/spawn_stab_power_1
execute as @a[scores={add_stab_charge=2}] positioned as @s run function orbital:nuclear_suitcase/spawn/spawn_stab_power_2
execute as @a[scores={add_stab_charge=3}] positioned as @s run function orbital:nuclear_suitcase/spawn/spawn_stab_power_3
scoreboard players enable @a add_stab_charge
scoreboard players set @a[scores={add_stab_charge=..3}] add_stab_charge 0

execute as @a[scores={add_nuke_charge=1}] positioned as @s run function orbital:nuclear_suitcase/spawn/spawn_nuke_power_1
execute as @a[scores={add_nuke_charge=2}] positioned as @s run function orbital:nuclear_suitcase/spawn/spawn_nuke_power_2
execute as @a[scores={add_nuke_charge=3}] positioned as @s run function orbital:nuclear_suitcase/spawn/spawn_nuke_power_3
scoreboard players enable @a add_nuke_charge
scoreboard players set @a[scores={add_nuke_charge=..3}] add_nuke_charge 0

scoreboard players set test test_trigger 1