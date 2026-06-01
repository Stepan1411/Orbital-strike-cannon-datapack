# Recipe check

execute as @a if items entity @s container.* minecraft:knowledge_book[minecraft:custom_data={recipe_nuke_1:1b}] run function orbital:recipe/nuke_1
execute as @a if items entity @s container.* minecraft:knowledge_book[minecraft:custom_data={recipe_nuke_1_aim:1b}] run function orbital:recipe/nuke_1_aim

execute as @a if items entity @s container.* minecraft:knowledge_book[minecraft:custom_data={recipe_nuke_2:1b}] run function orbital:recipe/nuke_2
execute as @a if items entity @s container.* minecraft:knowledge_book[minecraft:custom_data={recipe_nuke_2_aim:1b}] run function orbital:recipe/nuke_2_aim

execute as @a if items entity @s container.* minecraft:knowledge_book[minecraft:custom_data={recipe_nuke_3:1b}] run function orbital:recipe/nuke_3
execute as @a if items entity @s container.* minecraft:knowledge_book[minecraft:custom_data={recipe_nuke_3_aim:1b}] run function orbital:recipe/nuke_3_aim

execute as @a if items entity @s container.* minecraft:knowledge_book[minecraft:custom_data={recipe_stab_1:1b}] run function orbital:recipe/stab_1
execute as @a if items entity @s container.* minecraft:knowledge_book[minecraft:custom_data={recipe_stab_1_aim:1b}] run function orbital:recipe/stab_1_aim

execute as @a if items entity @s container.* minecraft:knowledge_book[minecraft:custom_data={recipe_stab_2:1b}] run function orbital:recipe/stab_2
execute as @a if items entity @s container.* minecraft:knowledge_book[minecraft:custom_data={recipe_stab_2_aim:1b}] run function orbital:recipe/stab_2_aim

execute as @a if items entity @s container.* minecraft:knowledge_book[minecraft:custom_data={recipe_stab_3:1b}] run function orbital:recipe/stab_3
execute as @a if items entity @s container.* minecraft:knowledge_book[minecraft:custom_data={recipe_stab_3_aim:1b}] run function orbital:recipe/stab_3_aim

scoreboard players set test test_recipe_func 1