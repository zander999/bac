-- GENERATED CODE
-- Node Box Editor, version 0.9.0
-- Namespace: test

minetest.register_node("bac:bac_box", {
	description = "Bac_box",
	tiles = {
		"gem.png",
		"check.png",
		"modern_tower.png",
		"front.jpg",
		"dim.png",
		"tron_cube.png"
	},
  light_source = 10,
	groups = {cracky=3},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox6
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox7
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5}, -- NodeBox8
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox10
		}
	}
});

minetest.register_craft({
	output = "bac:bac_box",
	recipe = {
		{"default:mese_crystal", "default:diamond", "default:mese_crystal"},
		{"default:stone", "default:chest", "default:stone"},
		{"default:stone", "default:stone", "default:stone"},
	}
})

minetest.register_tool("bac:bac_pick", {
    description = "Bac_Pick",
    inventory_image = "bac_pick.png",
		after_use = function(itemstack, user, pointed_thing)
		 itemstack:add_wear(2000)
	 end,
    tool_capabilities = {
        max_drop_level=9,
        groupcaps= {
            cracky={times={[1]=1.00, [2]=1.50, [3]=2.00}, uses=99, maxlevel=9}
        }
    }
});

minetest.register_craft({
	output = "bac:bac_pick",
	recipe = {
		{"bac:bac_box", "bac:bac_box", "bac:bac_box"},
		{"", "default:stick", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_tool("bac:bac_pick_upgraded", {
    description = "Bac_Pick_upgraded",
    inventory_image = "bac_pick_upgraded.png",
	after_use = function(itemstack, user, pointed_thing)
		itemstack:add_wear(200)
	end,
    tool_capabilities = {
        max_drop_level = 99,
        groupcaps = {
            cracky = {
				times = {
					[1]=0.50,
				 	[2]=1.00,
					[3]=1.50
				},
				uses=99, 
				maxlevel=99
			}
        }
    }
});

minetest.register_craft({
	output = "bac:bac_pick_upgraded",
	recipe = {
		{"", "default:mese_crystal", ""},
		{"", "bac:bac_pick", ""},
		{"", "", ""},
	}
})

minetest.register_tool("bac:bac_final", {
	description = "Bac final",
	inventory_image = "bac_final.png",
	after_use = function(itemstack, user, pointed_thing)
		itemstack:add_wear(20)
 	end,
	tool_capabilities = {
		max_drop_level=99,
		groupcaps={
			cracky={times={[1]=0.50, [2]=1.00, [3]=1.50}, uses=99, maxlevel=99},
			crumbly={times={[1]=0.50, [2]=1.00, [3]=1.50}, uses=99, maxlevel=99},
			snappy={times={[1]=0.50, [2]=1.00, [3]=1.50}, uses=99, maxlevel=99},
			choppy={times={[1]=0.50, [2]=1.00, [3]=1.50}, uses=99, maxlevel=99},
		},
		damage_groups = {fleshy=30}
	},
})

minetest.register_craft({
	output = "bac:bac_final",
	recipe = {
		{"", "default:mese_crystal", ""},
		{"", "bac:bac_pick_upgraded", ""},
		{"", "", ""},
	}
})


minetest.register_craftitem("bac:edible", {
	description = "Bac Edible",
	inventory_image = "bac_edible.png",
	on_use = minetest.item_eat(90),
})

minetest.register_craft({
	type = "cooking",
	output = "bac:edible",
	recipe = "bac:bac_final",
})

minetest.register_tool("bac:bac_laser", {
	description = "Bac laser",
	after_use = function()
		minetest.sound_play("laser")
	end,
	inventory_image = "bac_laser.png",
	tool_capabilities = {
		max_drop_level=99,
		groupcaps={
			cracky={times={[1]=0.50, [2]=0.50, [3]=0.50}, uses=99, maxlevel=99},
			crumbly={times={[1]=0.50, [2]=0.50, [3]=0.50}, uses=99, maxlevel=99},
			snappy={times={[1]=0.50, [2]=0.50, [3]=0.50}, uses=99, maxlevel=99},
			choppy={times={[1]=0.50, [2]=0.50, [3]=0.50}, uses=99, maxlevel=99},
		},
		damage_groups = {fleshy=99}
	},
})

minetest.register_craft({
	output = "bac:bac_laser",
	recipe = {
		{"", "default:mese_crystal", ""},
		{"", "bac:edible", ""},
		{"", "default:diamond", ""},
	}
})

minetest.register_abm({
	nodenames = {"bac:bac_box"},
	neighbors = {"default:water_source", "default:water_flowing"},
	interval = 2.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z}, {name = "default:mese"})
	end
})

minetest.register_abm({
	nodenames = {"bac:bac_box"},
	neighbors = {"default:lava_source", "default:lava_flowing"},
	interval = 1.3,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z}, {name = "default:diamond"})
	end
})

minetest.register_abm({
	nodenames = {"bac:bac_box"},
	neighbors = {"default:dirt_with_grass"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z}, {name = "default:tree"})
	end
})

minetest.register_abm({
	nodenames = {"bac:bac_box"},
	neighbors = {"default:gold_ore"},
	interval = 1.1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z}, {name = "default:gold"})
	end
})
