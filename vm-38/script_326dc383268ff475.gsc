#using script_14f4a3c583c77d4b;
#using script_1c65dbfc2f1c8d8f;
#using script_471b31bd963b388e;
#using script_4ccfb58a9443a60b;
#using script_5bb072c3abf4652c;
#using script_5f261a5d57de5f7c;
#using script_6167e26342be354b;
#using script_7a5293d92c61c788;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_f764fcd6;

/*
	Name: function_15f7199e
	Namespace: namespace_f764fcd6
	Checksum: 0x4AF1E6BC
	Offset: 0x2F8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_15f7199e()
{
	level notify(527803866);
}

/*
	Name: function_89f2df9
	Namespace: namespace_f764fcd6
	Checksum: 0x4FFDE0D
	Offset: 0x318
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_771c063a47d45c56", &function_70a657d8, undefined, undefined, #"hash_2d064899850813e2");
}

/*
	Name: function_70a657d8
	Namespace: namespace_f764fcd6
	Checksum: 0xC486CBD2
	Offset: 0x368
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(getgametypesetting(#"hash_616a22c5c1ebe5b8")))
	{
		return;
	}
	function_27473e44();
	level.var_bec232ae = &function_9ae34cb7;
}

/*
	Name: function_27473e44
	Namespace: namespace_f764fcd6
	Checksum: 0x17D8056A
	Offset: 0x3D8
	Size: 0x17C
	Parameters: 0
	Flags: Linked
*/
function function_27473e44()
{
	zm_perks::register_perk_basic_info(#"hash_17e4ae593eaf4a47", #"perk_tombstone", 2000, #"hash_4a88c89fbf0061f6", getweapon("zombie_perk_bottle_mulekick"), undefined, #"hash_5347ff402123307a");
	zm_perks::register_perk_precache_func(#"hash_17e4ae593eaf4a47", &precache);
	zm_perks::register_perk_clientfields(#"hash_17e4ae593eaf4a47", &register_clientfield, &function_b0c4e363);
	zm_perks::register_perk_machine(#"hash_17e4ae593eaf4a47", &function_1fe63170);
	zm_perks::register_perk_threads(#"hash_17e4ae593eaf4a47", &function_190ff809, &function_6df7ba74);
	zm_perks::register_perk_host_migration_params(#"hash_17e4ae593eaf4a47", "vending_mulekick", "mulekick_light");
}

/*
	Name: precache
	Namespace: namespace_f764fcd6
	Checksum: 0x619E21D1
	Offset: 0x560
	Size: 0x106
	Parameters: 0
	Flags: Linked
*/
function precache()
{
	level._effect[#"hash_2ef0300a8fcf8b09"] = "zombie/fx9_perk_mulekick";
	level.machine_assets[#"hash_17e4ae593eaf4a47"] = spawnstruct();
	level.machine_assets[#"hash_17e4ae593eaf4a47"].weapon = getweapon("zombie_perk_bottle_mulekick");
	level.machine_assets[#"hash_17e4ae593eaf4a47"].off_model = "p9_fxanim_zm_gp_mule_kick_mod";
	level.machine_assets[#"hash_17e4ae593eaf4a47"].on_model = "p9_fxanim_zm_gp_mule_kick_mod";
	level.machine_assets[#"hash_17e4ae593eaf4a47"].power_on_callback = &function_c60d9d72;
}

/*
	Name: register_clientfield
	Namespace: namespace_f764fcd6
	Checksum: 0x47B60C98
	Offset: 0x670
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function register_clientfield()
{
	if(zm_utility::is_classic())
	{
		clientfield::register("scriptmover", "mule_kick_machine_rob", 13000, 1, "int");
		clientfield::register("scriptmover", "mule_kick_machine_rob_buy", 13000, 1, "counter");
	}
}

/*
	Name: function_b0c4e363
	Namespace: namespace_f764fcd6
	Checksum: 0x6708C267
	Offset: 0x6F0
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_b0c4e363(state)
{
}

/*
	Name: function_5fd3f2ba
	Namespace: namespace_f764fcd6
	Checksum: 0xE39E6B05
	Offset: 0x708
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_5fd3f2ba(player)
{
	self endon(#"death");
	self clientfield::increment("mule_kick_machine_rob_buy");
	self thread function_aee99628(player);
	self scene::play("p9_fxanim_zm_gp_mule_kick_bundle", "shot 1", self);
}

/*
	Name: function_aee99628
	Namespace: namespace_f764fcd6
	Checksum: 0x6626A55F
	Offset: 0x790
	Size: 0x312
	Parameters: 1
	Flags: Linked
*/
function function_aee99628(player)
{
	self endon(#"death");
	if(!isplayer(player))
	{
		return;
	}
	for(shots = 0; shots < 15; shots++)
	{
		a_potential_targets = getentitiesinradius(self.origin, 256, 15);
		right = anglestoright(self.angles);
		right = vectornormalize(right);
		left = right * -1;
		foreach(zombie in a_potential_targets)
		{
			if(isalive(zombie) && zombie.team === level.zombie_team)
			{
				var_6e084471 = vectornormalize(zombie.origin - self.origin);
				var_1006dafa = vectordot(right, var_6e084471);
				var_fe29bd3f = vectordot(left, var_6e084471);
				if(var_1006dafa <= 0.8660254 && var_1006dafa > 0 || (var_fe29bd3f <= 0.8660254 && var_fe29bd3f > 0))
				{
					damage = zm_equipment::function_379f6b5d(150, undefined, zombie.var_6f84b820, zombie.maxhealth);
					zombie dodamage(damage, zombie.origin, player, player, "torso_upper", "MOD_RIFLE_BULLET");
					if(damage >= zombie.health)
					{
						level scoreevents::doscoreeventcallback("scoreEventZM", {#enemy:zombie, #scoreevent:#"hash_748d4479ffd0521e", #attacker:player});
					}
				}
			}
			waitframe(1);
		}
		self waittill(#"hash_7941e2c58e095ad8");
	}
}

/*
	Name: function_c60d9d72
	Namespace: namespace_f764fcd6
	Checksum: 0x53302391
	Offset: 0xAB0
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_c60d9d72()
{
	self.use_func = &function_5fd3f2ba;
	self clientfield::set("mule_kick_machine_rob", 1);
}

/*
	Name: function_1fe63170
	Namespace: namespace_f764fcd6
	Checksum: 0x6170DC4A
	Offset: 0xAF8
	Size: 0x9A
	Parameters: 4
	Flags: Linked
*/
function function_1fe63170(use_trigger, perk_machine, bump_trigger, collision)
{
	perk_machine.script_sound = "mus_perks_mulekick_jingle";
	perk_machine.script_string = "mule_kick_perk";
	perk_machine.script_label = "mus_perks_mulekick_sting";
	perk_machine.target = "vending_mulekick";
	bump_trigger.script_string = "mule_kick_vending";
	bump_trigger.targetname = "vending_mulekick";
	if(isdefined(collision))
	{
		collision.script_string = "mule_kick_perk";
	}
}

/*
	Name: function_190ff809
	Namespace: namespace_f764fcd6
	Checksum: 0xD8CAEFB6
	Offset: 0xBA0
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_190ff809()
{
	var_2c2030 = namespace_e86ffa8::function_30a8ed81(5);
	if(namespace_e86ffa8::function_30a8ed81(3))
	{
		self thread function_9335851();
	}
	self thread function_6a6169b2(var_2c2030);
}

/*
	Name: function_6a6169b2
	Namespace: namespace_f764fcd6
	Checksum: 0xBA765F55
	Offset: 0xC18
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function function_6a6169b2(var_2c2030)
{
	self endon(#"death");
	while(is_true(self.var_6696e200) || self function_104d7b4d() || self laststand::player_is_in_laststand() || self isswitchingweapons())
	{
		waitframe(1);
	}
	var_a6e16638 = gettime();
	while(isdefined(self.laststandpistol) || is_true(self.var_b895a3ff))
	{
		if((float(gettime() - var_a6e16638)) / 1000 > 2)
		{
			break;
		}
		waitframe(1);
	}
	if(self namespace_e86ffa8::function_30a8ed81(0))
	{
		self namespace_b376ff3f::function_61b8a91f(1, var_2c2030);
	}
}

/*
	Name: function_6df7ba74
	Namespace: namespace_f764fcd6
	Checksum: 0xE56BFCBB
	Offset: 0xD60
	Size: 0xDC
	Parameters: 4
	Flags: Linked
*/
function function_6df7ba74(b_pause, str_perk, str_result, n_slot)
{
	self endon(#"death");
	self notify(#"hash_73b1e35c66a4e898");
	var_a6e16638 = gettime();
	while(isdefined(self.laststandpistol) || is_true(self.var_b895a3ff))
	{
		if((float(gettime() - var_a6e16638)) / 1000 > 2)
		{
			break;
		}
		waitframe(1);
	}
	self namespace_b376ff3f::function_61b8a91f(0, 1);
}

/*
	Name: function_9335851
	Namespace: namespace_f764fcd6
	Checksum: 0xAA1F49E7
	Offset: 0xE48
	Size: 0x2AC
	Parameters: 0
	Flags: Linked
*/
function function_9335851()
{
	self endon(#"disconnect", #"hash_73b1e35c66a4e898");
	while(true)
	{
		wait(1);
		a_weapons = self getweaponslistprimaries();
		foreach(weapon in a_weapons)
		{
			w_current = self getcurrentweapon();
			if(w_current == weapon)
			{
				continue;
				continue;
			}
			n_clip = self getweaponammoclip(weapon);
			n_clip_size = weapon.clipsize;
			n_stock_size = self getweaponammostock(weapon);
			if(isdefined(n_clip) && isdefined(n_clip_size) && n_clip < n_clip_size)
			{
				var_8e477029 = int(ceil(n_clip_size * 0.05));
				if(weapon.iscliponly)
				{
					continue;
					continue;
				}
				if(n_stock_size >= var_8e477029)
				{
					self setweaponammoclip(weapon, n_clip + var_8e477029);
					self setweaponammostock(weapon, n_stock_size - var_8e477029);
					if((n_clip + var_8e477029) >= n_clip_size)
					{
						self playsoundtoplayer(#"hash_1306cd3cf0ce7b64", self);
					}
					continue;
				}
				if(n_stock_size > 0)
				{
					self setweaponammoclip(weapon, n_clip + 1);
					self setweaponammostock(weapon, n_stock_size - 1);
					self playsoundtoplayer(#"hash_1306cd3cf0ce7b64", self);
				}
			}
		}
	}
}

/*
	Name: function_9ae34cb7
	Namespace: namespace_f764fcd6
	Checksum: 0x6AEACB42
	Offset: 0x1100
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function function_9ae34cb7()
{
	if(namespace_e86ffa8::function_30a8ed81(4))
	{
		if(math::cointoss(25))
		{
			return true;
		}
	}
	return false;
}

