execute as @a at @s run function core:throw_box/tick


execute as @e[type=item,nbt={Item:{id:"minecraft:chest",components:{"minecraft:custom_data":{box_throwed:1}}}}] at @s run function core:throw_box/box_tick/nomal



execute as @a unless score @s player_id matches 0.. run function core:player/id/start