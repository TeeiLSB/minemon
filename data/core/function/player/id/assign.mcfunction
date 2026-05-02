scoreboard players operation @s player_id = #counter next_player_id
execute store result storage temp: team.num int 1 run scoreboard players get @s player_id
function core:player/id/team with storage temp: team
data remove storage temp: team

# カウンターを+1
scoreboard players add #counter next_player_id 1

execute as @a[limit=1,sort=random,scores={player_id=0}] run function core:player/id/assign