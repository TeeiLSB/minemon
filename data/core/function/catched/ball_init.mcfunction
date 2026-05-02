$execute as @p[tag=PlayerGet] run tellraw @a [{"text":"§eやったー!"},{"selector":"@p[tag=PlayerGet]"},{"text":"が§c$(type)§eをつかまえた!"}]


$give @p[tag=PlayerGet] recovery_compass\
    [item_name={"text":"§f捕獲済みボックス"},custom_data={mdata:{health:$(health),type:$(type),team:$(team),equipment:$(equipment)},isboxed:1b},item_model=chest,\
    lore=[[{"text":"§eHP: §c$(health)"}],\
          [{"text":"§eType: §c$(type)"}]],max_stack_size=1]

 
execute as @p[tag=PlayerGet] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 0.5


