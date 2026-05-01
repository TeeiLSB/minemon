# 投げた人を識別してPlayerGetをつける
execute store result score #UUID Temporary run data get entity @n[tag=This,type=item] Thrower
execute as @a store result score @s UUID run data get entity @s UUID
execute as @a if score @s UUID = #UUID Temporary run tag @s add PlayerGet
scoreboard players reset #UUID Temporary

# 捕まえられたモブのdataをストレージに保存
data modify storage lib: mdata.health set from entity @s Health


data modify storage lib: mdata.equipment set from entity @s equipment
execute unless data entity @s equipment run data modify storage lib: mdata.equipment set value {mainhand:{id:"minecraft:air"}}


function core:catched/nametest

# ボールを作成して投げた人に渡す
function core:catched/ball_init with storage lib: mdata
data remove storage lib: mdata

# tagをreset
tag @p[tag=PlayerGet] remove PlayerGet

# 捕まえられたモブを消す
tp @s ~ -1024 ~
kill @s

# itemを消す
kill @n[tag=This,type=item]
