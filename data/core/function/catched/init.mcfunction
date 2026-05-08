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
# inventory
data modify storage lib: mdata.equipment set from entity @s equipment
execute unless data entity @s equipment run data modify storage lib: mdata.equipment set value {mainhand:{id:"minecraft:air"}}
# variant
data modify storage lib: mdata.variant set from entity @s variant
execute unless data entity @s variant run data modify storage lib: mdata.variant set value none
# type (fish size)
data modify storage lib: mdata.fish set from entity @s type
execute unless data entity @s type run data modify storage lib: mdata.fish set value none
# Variant (tropical fish)
data modify storage lib: mdata.fishvar set from entity @s Variant
execute unless data entity @s Variant run data modify storage lib: mdata.fishvar set value none
# Size (Slime)
data modify storage lib: mdata.slimesize set from entity @s Size
execute unless data entity @s Size run data modify storage lib: mdata.slimesize set value none
# Color (sheep)
data modify storage lib: mdata.color set from entity @s Color
execute unless data entity @s Color run data modify storage lib: mdata.color set value none
# Owner (tame)
data modify storage lib: mdata.tamer set from entity @s Owner
execute unless data entity @s Owner run data modify storage lib: mdata.tamer set value 0
# CollarColor (wolf,cat)
data modify storage lib: mdata.clcolor set from entity @s CollarColor
execute unless data entity @s CollarColor run data modify storage lib: mdata.clcolor set value none
# IsBaby
data modify storage lib: mdata.isbaby set from entity @s IsBaby
execute unless data entity @s IsBaby run data modify storage lib: mdata.isbaby set value none
# Age (small animal)
data modify storage lib: mdata.age set from entity @s Age
execute unless data entity @s Age run data modify storage lib: mdata.age set value 0

execute as @p[tag=PlayerGet] run function core:player/get_name/run

function core:catched/nametest

# ボールを作成して投げた人に渡す
function core:catched/ball_init with storage lib: mdata
data remove storage lib: mdata

# test execute as @a[tag=PlayerGet] run say I have PlayerGet Tag

# tagをreset
tag @a[tag=PlayerGet] remove PlayerGet

# 捕まえられたモブを消す
function core:kill_tp

# itemを消す
#kill @n[tag=This,type=item]
