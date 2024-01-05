#using scripts\zm_common\scoreevents.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\util.gsc;
#using script_5f261a5d57de5f7c;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using script_2c5daa95f8fec03c;
#using script_3751b21462a54a7d;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_perk_deadshot;

/*
	Name: __init__system__
	Namespace: zm_perk_deadshot
	Checksum: 0xB786C6CC
	Offset: 0x1E0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_perk_deadshot", &function_70a657d8, undefined, undefined, #"hash_2d064899850813e2");
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_deadshot
	Checksum: 0xEE85CC94
	Offset: 0x230
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	enable_deadshot_perk_for_level();
	zm_perks::register_actor_damage_override(#"hash_210097a75bb6c49a", &function_4d088c19);
}

/*
	Name: enable_deadshot_perk_for_level
	Namespace: zm_perk_deadshot
	Checksum: 0x63128DB9
	Offset: 0x280
	Size: 0x17C
	Parameters: 0
	Flags: Linked
*/
function enable_deadshot_perk_for_level()
{
	zm_perks::register_perk_basic_info(#"hash_210097a75bb6c49a", #"perk_dead_shot", 2000, #"zombie/perk_deadshot", getweapon("zombie_perk_bottle_deadshot"), undefined, #"zmperksdeadshot");
	zm_perks::register_perk_precache_func(#"hash_210097a75bb6c49a", &deadshot_precache);
	zm_perks::register_perk_clientfields(#"hash_210097a75bb6c49a", &deadshot_register_clientfield, &deadshot_set_clientfield);
	zm_perks::register_perk_machine(#"hash_210097a75bb6c49a", &deadshot_perk_machine_setup);
	zm_perks::register_perk_threads(#"hash_210097a75bb6c49a", &give_deadshot_perk, &take_deadshot_perk);
	zm_perks::register_perk_host_migration_params(#"hash_210097a75bb6c49a", "vending_deadshot", "deadshot_light");
}

/*
	Name: deadshot_precache
	Namespace: zm_perk_deadshot
	Checksum: 0x97C1A072
	Offset: 0x408
	Size: 0xF6
	Parameters: 0
	Flags: Linked
*/
function deadshot_precache()
{
	if(isdefined(level.deadshot_precache_override_func))
	{
		[[level.deadshot_precache_override_func]]();
		return;
	}
	level._effect[#"deadshot_light"] = "zombie/fx_perk_deadshot_ndu";
	level.machine_assets[#"hash_210097a75bb6c49a"] = spawnstruct();
	level.machine_assets[#"hash_210097a75bb6c49a"].weapon = getweapon("zombie_perk_bottle_deadshot");
	level.machine_assets[#"hash_210097a75bb6c49a"].off_model = "p9_sur_vending_ads_off";
	level.machine_assets[#"hash_210097a75bb6c49a"].on_model = "p9_sur_vending_ads";
}

/*
	Name: deadshot_register_clientfield
	Namespace: zm_perk_deadshot
	Checksum: 0xB83859CD
	Offset: 0x508
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function deadshot_register_clientfield()
{
	clientfield::register("toplayer", "deadshot_perk", 1, 1, "int");
}

/*
	Name: deadshot_set_clientfield
	Namespace: zm_perk_deadshot
	Checksum: 0x209EC7AA
	Offset: 0x548
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function deadshot_set_clientfield(state)
{
}

/*
	Name: deadshot_perk_machine_setup
	Namespace: zm_perk_deadshot
	Checksum: 0x8FC640EC
	Offset: 0x560
	Size: 0x9A
	Parameters: 4
	Flags: Linked
*/
function deadshot_perk_machine_setup(use_trigger, perk_machine, bump_trigger, collision)
{
	perk_machine.script_sound = "mus_perks_deadshot_jingle";
	perk_machine.script_string = "deadshot_perk";
	perk_machine.script_label = "mus_perks_deadshot_sting";
	perk_machine.target = "vending_deadshot";
	bump_trigger.script_string = "deadshot_vending";
	bump_trigger.targetname = "vending_deadshot";
	if(isdefined(collision))
	{
		collision.script_string = "deadshot_vending";
	}
}

/*
	Name: give_deadshot_perk
	Namespace: zm_perk_deadshot
	Checksum: 0x6F66DA7
	Offset: 0x608
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function give_deadshot_perk()
{
	self clientfield::set_to_player("deadshot_perk", 1);
}

/*
	Name: take_deadshot_perk
	Namespace: zm_perk_deadshot
	Checksum: 0x112A0D81
	Offset: 0x638
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function take_deadshot_perk(b_pause, str_perk, str_result, n_slot)
{
	self clientfield::set_to_player("deadshot_perk", 0);
}

/*
	Name: function_4d088c19
	Namespace: zm_perk_deadshot
	Checksum: 0xB3C3B18F
	Offset: 0x688
	Size: 0x26E
	Parameters: 13
	Flags: Linked
*/
function function_4d088c19(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(isplayer(vdir))
	{
		var_84ed9a13 = self zm_ai_utility::function_de3dda83(surfacetype, boneindex, psoffsettime);
		if(self.health >= self.maxhealth)
		{
			if(isdefined(var_84ed9a13) && namespace_81245006::function_f29756fe(var_84ed9a13) == 1 && var_84ed9a13.type !== #"armor")
			{
				shitloc = shitloc + (shitloc * 1);
			}
		}
		if(vdir namespace_e86ffa8::function_7bf30775(4))
		{
			if(isdefined(var_84ed9a13) && namespace_81245006::function_f29756fe(var_84ed9a13) == 1 && var_84ed9a13.type !== #"armor")
			{
				shitloc = shitloc + (shitloc * 0.1);
			}
		}
		if(vdir namespace_791d0451::function_56cedda7(#"hash_1f95b08e4a49d87e"))
		{
			if(!isdefined(vdir.var_39f18bc3))
			{
				vdir.var_39f18bc3 = 0;
			}
			if(self === vdir.var_9c098a96)
			{
				vdir.var_39f18bc3++;
				if(vdir.var_39f18bc3 < vdir.var_39f18bc3)
				{
					vdir.var_39f18bc3 = vdir.var_39f18bc3;
				}
				else if(vdir.var_39f18bc3 > 10)
				{
					vdir.var_39f18bc3 = 10;
				}
				shitloc = shitloc + (shitloc * (0.02 * vdir.var_39f18bc3));
			}
			else
			{
				vdir.var_39f18bc3 = 0;
			}
			vdir.var_9c098a96 = self;
		}
	}
	return shitloc;
}

