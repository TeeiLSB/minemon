scoreboard players set @s Box.Charging 2
execute if score @s Box.ThrowStrength matches ..100 run scoreboard players add @s Box.ThrowStrength 5

advancement revoke @s only core:1