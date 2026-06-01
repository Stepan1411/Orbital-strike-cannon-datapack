# Chat-based Nuclear Suitcase menu (1.21.1 compatible)
# Replaces the /dialog show command

tellraw @s ["",{"text":"[ NUCLEAR SUITCASE ]","color":"red","bold":true}]
tellraw @s ["",{"text":"  [Add Charge] ","color":"gold"},{"text":"/trigger add_stab_charge set <1-3>","color":"yellow","underlined":true}]
tellraw @s ["",{"text":"  [Add Charge] ","color":"gold"},{"text":"/trigger add_nuke_charge set <1-3>","color":"yellow","underlined":true}]
tellraw @s ["",{"text":"  [List Charges] ","color":"gold"},{"text":"/trigger charges_list","color":"yellow","underlined":true,"click_event":{"action":"run_command","value":"trigger charges_list"}}]
tellraw @s ["",{"text":"  [Delete Nearest] ","color":"gold"},{"text":"/trigger delete_nearest","color":"yellow","underlined":true,"click_event":{"action":"run_command","value":"trigger delete_nearest"}}]
tellraw @s ["",{"text":"  [Remove All] ","color":"gold"},{"text":"/trigger remove_all_charges","color":"yellow","underlined":true,"click_event":{"action":"run_command","value":"trigger remove_all_charges"}}]
tellraw @s ["",{"text":"  [LAUNCH] ","color":"red","bold":true},{"text":"/trigger launch","color":"red","underlined":true,"click_event":{"action":"run_command","value":"trigger launch"}}]

scoreboard players set test test_dialog 1