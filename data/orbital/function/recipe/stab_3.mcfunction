clear @s minecraft:knowledge_book[minecraft:custom_data={recipe_stab_3:1b}]
execute if score craft_toggle_ craft_toggle_ matches 1 run give @s fishing_rod[damage=63,custom_name='[{"text":"STAB POWER 3","italic":false}]',custom_data={stab_3:1b}]
execute if score craft_toggle_ craft_toggle_ matches 0 run give @s minecraft:tnt 4
execute if score craft_toggle_ craft_toggle_ matches 0 run give @s minecraft:fishing_rod