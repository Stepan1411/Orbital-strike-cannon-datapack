# true

execute if score test test_trigger matches 1 run tell test test 
execute if score test test_recipe_give matches 1 run tell test test
execute if score test test_recipe_func matches 1 run tell test test 
execute if score test test_rod matches 1 run tell test test
execute if score test test_dialog matches 1 run tell test test
execute if score test test_load matches 1 run tell test test

# false

execute if score test test_trigger matches 0 run tellraw @a ["",{"text":"!WARNING!","bold":true,"color":"red"}," ",{"text":"Trigger functionality does not work, please report this to the developer!","color":"gold"}]
execute if score test test_recipe_give matches 0 run tellraw @a ["",{"text":"!WARNING!","bold":true,"color":"red"}," ",{"text":"Recipe give functionality does not work, please report this to the developer!","color":"gold"}]
execute if score test test_recipe_func matches 0 run tellraw @a ["",{"text":"!WARNING!","bold":true,"color":"red"}," ",{"text":"Recipe func functionality does not work, please report this to the developer!","color":"gold"}]
execute if score test test_rod matches 0 run tellraw @a ["",{"text":"!WARNING!","bold":true,"color":"red"}," ",{"text":"Rod functionality does not work, please report this to the developer!","color":"gold"}]
execute if score test test_load matches 0 run tellraw @a ["",{"text":"!WARNING!","bold":true,"color":"red"}," ",{"text":"Load functionality does not work, please report this to the developer!","color":"gold"}]
execute if score test test_dialog matches 0 run tellraw @a ["",{"text":"!WARNING!","bold":true,"color":"red"}," ",{"text":"Dialog functionality does not work, please restart server!","color":"gold"}]
