#execute if score @s Box.Charging matches 2 run playsound entity.vex.charge
execute if score @s Box.Charging matches 1 run function core:throw_box/trigger/throwed



execute if score @s Box.Charging matches 1.. run scoreboard players remove @s Box.Charging 1
