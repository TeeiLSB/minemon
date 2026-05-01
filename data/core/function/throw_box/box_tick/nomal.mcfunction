execute if entity @s[type=item,nbt={Item:{id:"minecraft:chest",components:{"minecraft:custom_data":{box_throwed:1}}}},nbt={PortalCooldown:10}] run kill @s


tag @s add This

execute as @e[dx=0,type=!player,type=!item,tag=!CantBox] positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[dx=0] at @s run function core:catched/init



tag @s remove This
