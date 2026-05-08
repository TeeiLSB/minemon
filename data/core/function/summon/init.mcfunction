$team add $(owner)
$data merge entity @s {DeathLootTable:"entities/allay",Tags:["CantBox"],\
    Health:$(health),Team:"$(owner)",equipment:$(equipment),Variant:$(fishvar),Size:$(slimesize),Color:$(color),Owner:$(tamer),CollarColor:$(clcolor),IsBaby:$(isbaby),\
    Age:$(age)}


$data merge entity @s $(var)
$data merge entity @s $(fish)


$team join $(owner) @p[tag=Summoner]

