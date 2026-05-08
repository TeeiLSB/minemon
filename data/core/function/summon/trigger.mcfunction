execute if score @s box_cd matches 0 if score @s box_status matches 1 run function core:summon/kill

tag @s add Summoner
execute if score @s box_cd matches 0 if score @s box_status matches 0 run function core:summon/summon with entity @s SelectedItem.components."minecraft:custom_data".mdata
tag @s remove Summoner

execute if score @s box_cd matches 0 if score @s box_status matches 2 run scoreboard players set @s box_status 0
execute if score @s box_cd matches 0 if score @s box_status matches 2 run scoreboard players set @s box_cd 10
# なにもいない=0 ➡ いる=1 ➡ いるから消す=2 ➡ なにもいない=0





# reset
advancement revoke @s only core:summon