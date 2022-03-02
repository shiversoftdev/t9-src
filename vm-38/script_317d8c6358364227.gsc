#using script_2c5daa95f8fec03c;
#using script_3751b21462a54a7d;
#using script_5f261a5d57de5f7c;
#using script_7e59d7bba853fe4b;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\zm_common\scoreevents.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_perk_deadshot;

/*
	Name: function_965fda41
	Namespace: zm_perk_deadshot
	Checksum: 0xC3FFE95A
	Offset: 0x1F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_965fda41()
{
	level notify(1145726516);
}

/*
	Name: function_89f2df9
	Namespace: zm_perk_deadshot
	Checksum: 0x3A3146F
	Offset: 0x210
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_perk_deadshot", &function_70a657d8, undefined, undefined, #"hash_2d064899850813e2");
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_deadshot
	Checksum: 0x5601E3C1
	Offset: 0x260
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
	Checksum: 0x371030F9
	Offset: 0x2B0
	Size: 0x17C
	Parameters: 0
	Flags: Linked
*/
function enable_deadshot_perk_for_level()
{
	zm_perks::register_perk_basic_info(#"hash_210097a75bb6c49a", #"perk_dead_shot", 2000, #"hash_3ac784b3888e0dab", getweapon("zombie_perk_bottle_deadshot"), undefined, #"hash_26407356b81a1957");
	zm_perks::register_perk_precache_func(#"hash_210097a75bb6c49a", &deadshot_precache);
	zm_perks::register_perk_clientfields(#"hash_210097a75bb6c49a", &deadshot_register_clientfield, &deadshot_set_clientfield);
	zm_perks::register_perk_machine(#"hash_210097a75bb6c49a", &deadshot_perk_machine_setup);
	zm_perks::register_perk_threads(#"hash_210097a75bb6c49a", &give_deadshot_perk, &take_deadshot_perk);
	zm_perks::register_perk_host_migration_params(#"hash_210097a75bb6c49a", "vending_deadshot", "deadshot_light");
}

/*
	Name: deadshot_precache
	Namespace: zm_perk_deadshot
	Checksum: 0x6CEA674E
	Offset: 0x438
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
	Checksum: 0x23A3BCF8
	Offset: 0x538
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
	Checksum: 0x3E07D264
	Offset: 0x578
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
	Checksum: 0xF8FBF0B
	Offset: 0x590
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
	Checksum: 0xF5E41239
	Offset: 0x638
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
	Checksum: 0x792422C1
	Offset: 0x668
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
	Checksum: 0xC744E96D
	Offset: 0x6B8
	Size: 0x2A6
	Parameters: 13
	Flags: Linked
*/
function function_4d088c19(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(isplayer(vpoint))
	{
		if(shitloc === "MOD_MELEE")
		{
			return vdir;
		}
		var_84ed9a13 = self namespace_e0710ee6::function_de3dda83(surfacetype, boneindex, psoffsettime);
		if(vpoint namespace_e86ffa8::function_7bf30775(1))
		{
			if(self.health >= self.maxhealth)
			{
				if(isdefined(var_84ed9a13) && namespace_81245006::function_f29756fe(var_84ed9a13) == 1 && var_84ed9a13.type !== #"armor")
				{
					vdir = vdir + (vdir * 1);
				}
			}
		}
		if(vpoint namespace_e86ffa8::function_7bf30775(4))
		{
			if(isdefined(var_84ed9a13) && namespace_81245006::function_f29756fe(var_84ed9a13) == 1 && var_84ed9a13.type !== #"armor")
			{
				vdir = vdir + (vdir * 0.1);
			}
		}
		if(vpoint namespace_791d0451::function_56cedda7(#"hash_1f95b08e4a49d87e"))
		{
			if(!isdefined(vpoint.var_39f18bc3))
			{
				vpoint.var_39f18bc3 = 0;
			}
			if(self === vpoint.var_9c098a96)
			{
				vpoint.var_39f18bc3++;
				if(vpoint.var_39f18bc3 < vpoint.var_39f18bc3)
				{
					vpoint.var_39f18bc3 = vpoint.var_39f18bc3;
				}
				else if(vpoint.var_39f18bc3 > 10)
				{
					vpoint.var_39f18bc3 = 10;
				}
				vdir = vdir + (vdir * (0.02 * vpoint.var_39f18bc3));
			}
			else
			{
				vpoint.var_39f18bc3 = 0;
			}
			vpoint.var_9c098a96 = self;
		}
	}
	return vdir;
}

