# Проверяем использование удочки каждые тик
execute as @a[scores={used_rod=1..}] run function orbital:special_rod/check_usage

team join red @e[tag=tnt_red]
scoreboard players reset @a used_rod