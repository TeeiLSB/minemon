# 投げた人を識別してPlayerGetをつける
execute store result score #UUID_1 Temporary run data get entity @n[tag=This,type=item] Thrower[0]
execute store result score #UUID_2 Temporary run data get entity @n[tag=This,type=item] Thrower[1]
execute store result score #UUID_3 Temporary run data get entity @n[tag=This,type=item] Thrower[2]
execute store result score #UUID_4 Temporary run data get entity @n[tag=This,type=item] Thrower[3]

execute as @a store result score @s UUID_1 run data get entity @s UUID[0]
execute as @a store result score @s UUID_2 run data get entity @s UUID[1]
execute as @a store result score @s UUID_3 run data get entity @s UUID[2]
execute as @a store result score @s UUID_4 run data get entity @s UUID[3]

execute as @a if score @s UUID_1 = #UUID_1 Temporary \
if score @s UUID_2 = #UUID_2 Temporary \
if score @s UUID_3 = #UUID_3 Temporary \
if score @s UUID_4 = #UUID_4 Temporary \
run tag @s add PlayerGet


# 捕まえられたモブのdataをストレージに保存
data modify storage lib: mdata.health set from entity @s Health


data modify storage lib: mdata.equipment set from entity @s equipment
execute unless data entity @s equipment run data modify storage lib: mdata.equipment set value {mainhand:{id:"minecraft:air"}}

execute store result storage lib: mdata.team int 1 run scoreboard players get @p[tag=PlayerGet] player_id

function core:catched/nametest

# ボールを作成して投げた人に渡す
function core:catched/ball_init with storage lib: mdata
data remove storage lib: mdata

# test execute as @a[tag=PlayerGet] run say I have PlayerGet Tag

# tagをreset
tag @a[tag=PlayerGet] remove PlayerGet

# 捕まえられたモブを消す
tp @s ~ -1024 ~
kill @s

# itemを消す
kill @n[tag=This,type=item]
