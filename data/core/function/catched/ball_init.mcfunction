$execute as @p[tag=PlayerGet] run tellraw @a [{"text":"§eやったー!"},{"selector":"@p[tag=PlayerGet]"},{"text":"が§c$(type)§eをつかまえた!"}]


$give @p[tag=PlayerGet] recovery_compass\
    [item_name={"text":"§f捕獲済みボックス"},custom_data={mdata:{health:$(health),type:$(type),owner:$(owner),equipment:$(equipment),fishvar:$(fishvar),slimesize:$(slimesize),color:$(color),tamer:$(tamer),clcolor:$(clcolor),isbaby:$(isbaby),age:$(age),var:{variant:"$(variant)"},fish:{type:"$(fish)"}},isboxed:1b},item_model=chest,\
    lore=[[{"text":"§eHP: §c$(health)"}],\
          [{"text":"§eType: §c$(type)"}],\
          [{"text":"§eOwner: §c$(owner)"}]],max_stack_size=1,\
            consumable={animation:"spyglass",consume_seconds:999999999,sound:intentionally_empty},\
                enchantments={"core:boxed":1}]

 
execute as @p[tag=PlayerGet] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 0.5


