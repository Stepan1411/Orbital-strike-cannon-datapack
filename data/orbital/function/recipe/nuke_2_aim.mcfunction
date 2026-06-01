clear @s minecraft:knowledge_book[minecraft:custom_data={recipe_nuke_2_aim:1b}]
execute if score craft_toggle_ craft_toggle_ matches 1 run give @s fishing_rod[damage=63,custom_name='[{"text":"NUKE POWER 2 (aim)","italic":false}]',custom_data={nuke_aim_2:1b}]
execute if score craft_toggle_ craft_toggle_ matches 0 run give @s minecraft:tnt 5
execute if score craft_toggle_ craft_toggle_ matches 0 run give @s minecraft:fishing_rod
execute if score craft_toggle_ craft_toggle_ matches 0 run give @s minecraft:redstone 2