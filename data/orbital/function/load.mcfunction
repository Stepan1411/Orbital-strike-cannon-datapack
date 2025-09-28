tellraw @a [{text:"Orbital Strike DataPack by ",color:gold},{text:"Stepan1411",color:red,click_event:{action:"open_url",url:"https://modrinth.com/user/Stepan1411_Studio"}}]
scoreboard objectives add used_rod minecraft.used:minecraft.fishing_rod
scoreboard objectives add orbital.rod_used dummy
schedule function orbital_strike:strike/timer/100t 100t
schedule clear orbital:tick