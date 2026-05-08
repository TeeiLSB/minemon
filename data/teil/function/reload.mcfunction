execute in overworld run summon marker 0.0 0.0 0.0 {UUID:[I; 2106,5308417,0,0]}

scoreboard objectives add Box.Charging dummy
scoreboard objectives add Box.ThrowStrength dummy


scoreboard objectives add Temporary dummy
scoreboard objectives add Constant dummy

scoreboard objectives add UUID_1 dummy
scoreboard objectives add UUID_2 dummy
scoreboard objectives add UUID_3 dummy
scoreboard objectives add UUID_4 dummy

scoreboard objectives add player_id dummy
scoreboard objectives add next_player_id dummy

scoreboard objectives add box_cd dummy
scoreboard objectives add box_status dummy


function teil:const



execute as @a unless score @s Box.ThrowStrength matches 0.. run scoreboard players set @s Box.ThrowStrength 0


execute in overworld run forceload add -16 -16 16 16
forceload add -16 -16 16 16

#シュルカーボックス
setblock 0 0 0 black_shulker_box


say Reloaded!