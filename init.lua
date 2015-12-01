--
-- Ores
--

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "bacon:ore",
	wherein        = "default:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 4,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -300,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "bacon:rawblock",
	wherein        = "default:stone",
	clust_scarcity = 36*36*36,
	clust_num_ores = 3,
	clust_size     = 2,
	height_min     = -31000,
	height_max     = -1000,
})

--
-- Nodes
--

minetest.register_node("bacon:ore", {
	description = "Bacon Ore",
	tiles = {"default_stone.png^bacon_ore.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = 'bacon:raw',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("bacon:rawblock", {
	description = "Raw Bacon Block",
	tiles = {"bacon_rawblock.png"},
	groups = {cracky=1,level=2},
	sounds = { footstep = { name = "bacon_step", gain = 0.4 },
		   dug = { name = "bacon_dug", gain = 0.9 },
		   dig = { name = "bacon_dig", gain = 0.7 },
		   place = { name = "bacon_place", gain = 0.2 },
	},
})

minetest.register_node("bacon:cookedblock", {
	description = "Cooked Bacon Block",
	tiles = {"bacon_cookedblock.png"},
	groups = {cracky=1,level=2},
	sounds = { footstep = { name = "bacon_step", gain = 0.35 },
		   dug = { name = "bacon_dug", gain = 0.8 },
		   dig = { name = "bacon_dig", gain = 0.6 },
		   place = { name = "bacon_place", gain = 0.15 },
	},
})

--
-- Craftitems
--

minetest.register_craftitem("bacon:raw", {
	description = "Raw Bacon",
	inventory_image = "bacon_raw.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craftitem("bacon:cooked", {
	description = "Cooked Bacon",
	inventory_image = "bacon_cooked.png",
	on_use = minetest.item_eat(20),
})

--
-- Crafts
--

minetest.register_craft({
	output = 'bacon:rawblock',
	recipe = {
		{'bacon:raw', 'bacon:raw', 'bacon:raw'},
		{'bacon:raw', 'bacon:raw', 'bacon:raw'},
		{'bacon:raw', 'bacon:raw', 'bacon:raw'},
	}
})

minetest.register_craft({
	output = 'bacon:cookedblock',
	recipe = {
		{'bacon:cooked', 'bacon:cooked', 'bacon:cooked'},
		{'bacon:cooked', 'bacon:cooked', 'bacon:cooked'},
		{'bacon:cooked', 'bacon:cooked', 'bacon:cooked'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "bacon:cooked",
	recipe = "bacon:raw",
})

minetest.register_craft({
	type = "cooking",
	output = "bacon:cookedblock",
	recipe = "bacon:rawblock",
})

minetest.register_craft({
	output = 'bacon:pick',
	recipe = {
		{'bacon:cooked', 'bacon:cooked', 'bacon:cooked'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'bacon:shovel',
	recipe = {
		{'', 'bacon:cooked', ''},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'bacon:axe',
	recipe = {
		{'bacon:cooked', 'bacon:cooked', ''},
		{'bacon:cooked', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'bacon:sword',
	recipe = {
		{'', 'bacon:cooked', ''},
		{'', 'bacon:cooked', ''},
		{'', 'group:stick', ''},
	}
})

--
-- Tools
--

minetest.register_tool("bacon:pick", {
	description = "Bacon Pickaxe",
	inventory_image = "bacon_pick.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=200, maxlevel=3},
		},
	},
})

minetest.register_tool("bacon:shovel", {
	description = "Bacon Shovel",
	inventory_image = "bacon_shovel.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=200, maxlevel=3},
		},
	},
})

minetest.register_tool("bacon:axe", {
	description = "Bacon Axe",
	inventory_image = "bacon_axe.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=200, maxlevel=3},
		},
	},
})

minetest.register_tool("bacon:sword", {
	description = "Bacon Sword",
	inventory_image = "bacon_sword.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
				snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=200, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
})
