#using scripts\zm_common\zm_perks.gsc;
#using script_18077945bb84ede7;
#using script_5f261a5d57de5f7c;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_perk_death_perception;

/*
	Name: function_4293a6f6
	Namespace: zm_perk_death_perception
	Checksum: 0xFEF80167
	Offset: 0x290
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4293a6f6()
{
	level notify(-1204220403);
}

/*
	Name: __init__system__
	Namespace: zm_perk_death_perception
	Checksum: 0x7CDC1A71
	Offset: 0x2B0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_perk_death_perception", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_death_perception
	Checksum: 0x52F7932E
	Offset: 0x308
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(getgametypesetting(#"hash_45fa8995b51490e8")))
	{
		return;
	}
	enable_death_perception_perk_for_level();
}

/*
	Name: function_8ac3bea9
	Namespace: zm_perk_death_perception
	Checksum: 0x80F724D1
	Offset: 0x360
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: enable_death_perception_perk_for_level
	Namespace: zm_perk_death_perception
	Checksum: 0x14430300
	Offset: 0x370
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function enable_death_perception_perk_for_level()
{
	callback::on_item_pickup(&on_item_pickup);
	zm_perks::register_perk_basic_info(#"hash_1ea1a9cfee998e89", #"perk_death_perception", 2000, #"hash_a81bac8ed8357c6", getweapon("zombie_perk_bottle_death_perception"), undefined, #"zmperksdeathperception");
	zm_perks::register_perk_precache_func(#"hash_1ea1a9cfee998e89", &function_f9d745da);
	zm_perks::register_perk_clientfields(#"hash_1ea1a9cfee998e89", &function_14ab8b5c, &function_a19424cd);
	zm_perks::register_perk_machine(#"hash_1ea1a9cfee998e89", &function_6bdb193c, &function_9b484511);
	zm_perks::register_perk_host_migration_params(#"hash_1ea1a9cfee998e89", "vending_deathperception", "deathperception_light");
	zm_perks::register_perk_threads(#"hash_1ea1a9cfee998e89", &function_79d54e51, &function_86a6368e);
}

/*
	Name: on_item_pickup
	Namespace: zm_perk_death_perception
	Checksum: 0x4CE4AFE9
	Offset: 0x528
	Size: 0x274
	Parameters: 1
	Flags: Linked
*/
function on_item_pickup(s_params)
{
	var_a6762160 = s_params.item.var_a6762160;
	if(var_a6762160.itemtype === #"hash_3a094c949a87214d")
	{
		if(isplayer(self))
		{
			e_player = self;
		}
		else
		{
			e_player = s_params.player;
		}
		if(isplayer(e_player))
		{
			if(namespace_e86ffa8::function_cb561923(3))
			{
				rarity = var_a6762160.rarity;
				if(var_a6762160.name === #"hash_595bb7a30746b8f2")
				{
					var_595a11bc = (25 * var_a6762160.amount) * 0.2;
					e_player sr_scrap::function_a6d4221f(var_595a11bc);
				}
				else
				{
					if(var_a6762160.name === #"hash_1824627ee79fed84")
					{
						var_595a11bc = (300 * var_a6762160.amount) * 0.2;
						e_player sr_scrap::function_afab250a(var_595a11bc);
					}
					else
					{
						if(var_a6762160.name === #"hash_4a604970e6ceeee")
						{
							var_595a11bc = 200 * 0.2;
							e_player sr_scrap::function_afab250a(var_595a11bc);
						}
						else
						{
							if(rarity === #"rare")
							{
								var_595a11bc = (10 * var_a6762160.amount) * 0.2;
								e_player sr_scrap::function_a6d4221f(int(var_595a11bc));
							}
							else
							{
								var_595a11bc = (50 * var_a6762160.amount) * 0.2;
								e_player sr_scrap::function_afab250a(int(var_595a11bc));
							}
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_9b484511
	Namespace: zm_perk_death_perception
	Checksum: 0x80F724D1
	Offset: 0x7A8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_9b484511()
{
}

/*
	Name: function_f9d745da
	Namespace: zm_perk_death_perception
	Checksum: 0x3D592B97
	Offset: 0x7B8
	Size: 0xD6
	Parameters: 0
	Flags: Linked
*/
function function_f9d745da()
{
	level._effect[#"deathperception_light"] = "zombie/fx9_perk_death_perception";
	level.machine_assets[#"hash_1ea1a9cfee998e89"] = spawnstruct();
	level.machine_assets[#"hash_1ea1a9cfee998e89"].weapon = getweapon("zombie_perk_bottle_death_perception");
	level.machine_assets[#"hash_1ea1a9cfee998e89"].off_model = "p9_sur_machine_death_perception";
	level.machine_assets[#"hash_1ea1a9cfee998e89"].on_model = "p9_sur_machine_death_perception";
}

/*
	Name: function_14ab8b5c
	Namespace: zm_perk_death_perception
	Checksum: 0x2DA397E5
	Offset: 0x898
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function function_14ab8b5c()
{
	clientfield::register("scriptmover", "perk_death_perception_item_marked_for_rob", 15000, 1, "int");
	clientfield::register("toplayer", "perk_death_perception_visuals", 15000, 1, "int");
	clientfield::register("toplayer", "perk_death_perception_hud_warning", 15000, 1, "int");
	clientfield::register("toplayer", "perk_death_perception_visuals_items", 15000, 1, "int");
	clientfield::register("world", "dark_aether_crystal_check_dynentstate", 15000, 1, "counter");
}

/*
	Name: function_a19424cd
	Namespace: zm_perk_death_perception
	Checksum: 0xD95046C3
	Offset: 0x998
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_a19424cd(state)
{
}

/*
	Name: function_6bdb193c
	Namespace: zm_perk_death_perception
	Checksum: 0xF097A862
	Offset: 0x9B0
	Size: 0x9A
	Parameters: 4
	Flags: Linked
*/
function function_6bdb193c(use_trigger, perk_machine, bump_trigger, collision)
{
	perk_machine.script_sound = "mus_perks_deathperception_jingle";
	perk_machine.script_string = "death_perception_perk";
	perk_machine.script_label = "mus_perks_deathperception_sting";
	perk_machine.target = "vending_deathperception";
	bump_trigger.script_string = "death_perception_perk";
	bump_trigger.targetname = "vending_deathperception";
	if(isdefined(collision))
	{
		collision.script_string = "death_perception_perk";
	}
}

/*
	Name: function_79d54e51
	Namespace: zm_perk_death_perception
	Checksum: 0xDB0B6F13
	Offset: 0xA58
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_79d54e51()
{
	self clientfield::set_to_player("perk_death_perception_visuals", 1);
	if(namespace_e86ffa8::function_cb561923(2))
	{
		self clientfield::set_to_player("perk_death_perception_hud_warning", 1);
	}
	if(namespace_e86ffa8::function_cb561923(5))
	{
		self clientfield::set_to_player("perk_death_perception_visuals_items", 1);
	}
}

/*
	Name: function_86a6368e
	Namespace: zm_perk_death_perception
	Checksum: 0x37308137
	Offset: 0xAF8
	Size: 0x84
	Parameters: 4
	Flags: Linked
*/
function function_86a6368e(b_pause, str_perk, str_result, n_slot)
{
	self clientfield::set_to_player("perk_death_perception_visuals", 0);
	self clientfield::set_to_player("perk_death_perception_hud_warning", 0);
	self clientfield::set_to_player("perk_death_perception_visuals_items", 0);
}

