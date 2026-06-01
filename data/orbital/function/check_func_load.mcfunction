execute if score toggle_message_ toggle_message_ matches 1 run tellraw @a [{text:"Orbital Strike Cannon DataPack by ",color:gold},{text:"Stepan1411",color:red,click_event:{action:"open_url",url:"https://modrinth.com/user/Stepan1411_Studio"}},{text:" & "},{text:"Shanahan",color:red,click_event:{action:"open_url",url:"https://modrinth.com/user/Shanahan_7"}}]

# CHECK FUNCTIONS

scoreboard objectives add test_trigger dummy
scoreboard objectives add test_recipe_give dummy
scoreboard objectives add test_recipe_func dummy
scoreboard objectives add test_rod dummy
scoreboard objectives add test_dialog dummy
scoreboard objectives add test_load dummy

scoreboard players set test test_trigger 0
scoreboard players set test test_recipe_func 0
scoreboard players set test test_recipe_give 0
scoreboard players set test test_rod 0
scoreboard players set test test_dialog 0
scoreboard players set test test_load 0

schedule function orbital:check_func 20t