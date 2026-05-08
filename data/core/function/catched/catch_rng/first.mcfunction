execute store result score #catch_power Temporary run data get entity @n[type=item,tag=This] Item.components."minecraft:custom_data".catch_power


execute store result score #health Temporary run data get entity @s Health
# ボールの確率補正によりHPを減らしたことにする
 scoreboard players operation #health Temporary -= #catch_power Temporary
execute store result score #max_health Temporary run attribute @s max_health base get



# HP割合
scoreboard players operation #HP_rate Temporary = #health Temporary
scoreboard players operation #HP_rate Temporary *= #100 Constant
scoreboard players operation #HP_rate Temporary /= #max_health Temporary

#曲線をつくろう
scoreboard players operation #chance Temporary = #100 Constant
scoreboard players operation #chance Temporary -= #HP_rate Temporary

scoreboard players operation #chance_temp Temporary = #chance Temporary
scoreboard players operation #chance Temporary *= #chance_temp Temporary
scoreboard players operation #chance Temporary *= #chance_temp Temporary

scoreboard players operation #chance Temporary /= #10000 Constant

# 乱数生成
execute store result score #rng Temporary run random value 1..100

# chanceの数が乱数より多い場合GET判定にする
execute if score #chance Temporary >= #rng Temporary run function core:catched/init
execute at @s run playsound block.note_block.bit ambient @a[distance=..15] ~ ~ ~

# boxを削除
kill @n[tag=This,type=item]

# test
tellraw @a ["§cHP=§f ",{"score":{"name":"#HP_rate","objective":"Temporary"}},"§7% §dRNG=§f ",{"score":{"name":"#rng","objective":"Temporary"}}," §aIF §7..§f",{"score":{"name":"#chance","objective":"Temporary"}}," = GET"]

# RESET
scoreboard players reset #chance Temporary
scoreboard players reset #catch_power Temporary
scoreboard players reset #rng Temporary
scoreboard players reset #health Temporary
scoreboard players reset #max_health Temporary
scoreboard players reset #HP_Rate Temporary