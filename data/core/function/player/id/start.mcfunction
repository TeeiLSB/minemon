# 次に割り振るIDを1にリセット
scoreboard players set #counter next_player_id 1

# 全プレイヤーの player_id を一旦クリア
scoreboard players set @a player_id 0

# ID未割り当てのプレイヤーに順番に付与
execute as @a[limit=1,sort=random,scores={player_id=0}] run function core:player/id/assign