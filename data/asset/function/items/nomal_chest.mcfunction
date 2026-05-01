give @s recovery_compass\
    [\
        item_name={"text":"捕獲ボックス","color":"white"},\
            item_model=chest,\
                consumable={animation:"spyglass",sound:intentionally_empty,has_consume_particles:false,consume_seconds:999999999},\
                    lore=[[{"text":"低レベルなモブを捕獲することが","color":"gray",italic:false}],\
                        [{"text":"できる不思議なボックス。","color":"gray",italic:false}]],\
                        custom_data={mob_box:1}]