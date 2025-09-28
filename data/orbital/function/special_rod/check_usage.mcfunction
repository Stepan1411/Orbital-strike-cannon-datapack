# Проверяем, что в руке особая удочка
execute if predicate orbital:has_special_rod run function orbital:special_rod/execute_effect

# Сбрасываем счётчик
scoreboard players set @s orbital.rod_used 0