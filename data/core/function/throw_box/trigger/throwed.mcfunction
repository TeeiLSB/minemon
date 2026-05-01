
playsound entity.egg.throw

scoreboard players operation $MotionPower Temporary = @s Box.ThrowStrength

tag @s add Thrower

execute anchored eyes positioned ^ ^ ^ rotated as @s run loot spawn ~ ~ ~ loot core:nomal
execute anchored eyes positioned ^ ^ ^ as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{box_throwed:1}}}},distance=0] run data modify entity @s Thrower set from entity @p[tag=Thrower] UUID
execute anchored eyes positioned ^ ^ ^ as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{box_throwed:1}}}},distance=0] run data merge entity @s {PickupDelay:32767,PortalCooldown:65s,Glowing:1b}
execute anchored eyes positioned ^ ^ ^ as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{box_throwed:1}}}},distance=0] run function core:motion/apply

tag @s remove Thrower



scoreboard players set @s Box.ThrowStrength 0

clear @s recovery_compass[custom_data={mob_box:1}] 1