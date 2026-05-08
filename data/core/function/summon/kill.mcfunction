execute as @e[tag=CantBox] at @s on passengers run ride @s dismount
execute as @e[tag=CantBox] run function core:kill_tp
scoreboard players set @s box_status 2


scoreboard players set @s box_cd 10