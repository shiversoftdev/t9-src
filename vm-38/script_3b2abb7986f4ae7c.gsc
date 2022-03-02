#using script_176597095ddfaa17;
#using script_1c65dbfc2f1c8d8f;
#using script_34ab99a4ca1a43d;
#using script_3a88f428c6d8ef90;
#using script_3fda550bc6e1089a;
#using script_437ce686d29bb81b;
#using script_5bb072c3abf4652c;
#using script_68d2ee1489345a1d;
#using script_7fc996fe8678852;
#using script_bf0c2c69ce5745e;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\zm_common\gametypes\hostmigration.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_2291eec4;

/*
	Name: function_3670eb05
	Namespace: namespace_2291eec4
	Checksum: 0xE40751FE
	Offset: 0x3A0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3670eb05()
{
	level notify(1193092382);
}

#namespace namespace_dedc3cb9;

/*
	Name: function_89f2df9
	Namespace: namespace_dedc3cb9
	Checksum: 0x17FEACC6
	Offset: 0x3C0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_146fecdc090c227e", &function_70a657d8, undefined, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_dedc3cb9
	Checksum: 0xD3BE7ABD
	Offset: 0x410
	Size: 0x1DC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_7732e7b9e5c4e0e")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	clientfield::register("scriptmover", "supply_drop_parachute_rob", 1, 1, "int");
	zm::register_vehicle_damage_callback(&function_be51796c);
	scene::add_scene_func(#"hash_23fe21c363168ac5", &function_4bf116ab, "init");
	scene::add_scene_func(#"hash_23fe21c363168ac5", &function_2842c984, "done");
	scene::add_scene_func(#"hash_23fe21c363168ac5", &function_2842c984, "stop");
	scene::add_scene_func(#"hash_211993854fb33604", &function_76b49bd8, "open");
	namespace_8b6a9d79::function_b3464a7c(#"hash_146fecdc090c227e", &function_685a8288);
}

/*
	Name: function_95c09591
	Namespace: namespace_dedc3cb9
	Checksum: 0x401FF8E3
	Offset: 0x5F8
	Size: 0x4CC
	Parameters: 1
	Flags: None
*/
function function_95c09591(destination)
{
	if(!is_true(getgametypesetting(#"hash_7732e7b9e5c4e0e")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	if(namespace_cf6efd05::function_85b812c9())
	{
		level.var_e1011305 = namespace_cf6efd05::function_21d402f4(#"hash_3d1c462f6d4757c2");
	}
	level flag::wait_till(#"start_zombie_round_logic");
	if(!getdvarint(#"hash_730311c63805303a", 0))
	{
		if(!math::cointoss(30))
		{
			return;
		}
		if(isdefined(level.var_e1011305) && isdefined(level.var_b48509f9) && level.var_e1011305 > 0 && (level.var_b48509f9 - level.var_e1011305) <= 2)
		{
			return;
		}
	}
	var_4a91da6d = [];
	foreach(location in destination.locations)
	{
		instance = location.instances[#"hash_146fecdc090c227e"];
		if(isdefined(instance))
		{
			if(!isdefined(level.var_fcb2823))
			{
				level.var_fcb2823 = [];
			}
			else if(!isarray(level.var_fcb2823))
			{
				level.var_fcb2823 = array(level.var_fcb2823);
			}
			if(!isinarray(level.var_fcb2823, instance))
			{
				level.var_fcb2823[level.var_fcb2823.size] = instance;
			}
			var_e7f5b3e0 = 1;
			if(isdefined(instance.var_501bc8c9))
			{
				var_2685dd6d = strtok(instance.var_501bc8c9, ", ");
				foreach(var_a2593226 in var_2685dd6d)
				{
					if(level.var_7d45d0d4.var_1fcbdf50 === var_a2593226)
					{
						var_e7f5b3e0 = 0;
						break;
					}
				}
			}
			if(var_e7f5b3e0)
			{
				if(!isdefined(var_4a91da6d))
				{
					var_4a91da6d = [];
				}
				else if(!isarray(var_4a91da6d))
				{
					var_4a91da6d = array(var_4a91da6d);
				}
				var_4a91da6d[var_4a91da6d.size] = instance;
			}
		}
	}
	if(getdvarint(#"hash_730311c63805303a", 0))
	{
		if(isdefined(level.var_fcb2823))
		{
			foreach(instance in level.var_fcb2823)
			{
				if(isdefined(instance))
				{
					namespace_8b6a9d79::function_20d7e9c7(instance);
				}
			}
		}
	}
	else
	{
		instance = array::random(var_4a91da6d);
		if(isdefined(instance))
		{
			namespace_8b6a9d79::function_20d7e9c7(instance);
		}
	}
}

/*
	Name: function_685a8288
	Namespace: namespace_dedc3cb9
	Checksum: 0x2437E525
	Offset: 0xAD0
	Size: 0x6DC
	Parameters: 1
	Flags: Linked
*/
function function_685a8288(instance)
{
	level endon(#"end_game");
	instance.var_422ae63e = #"hash_d3de086d9682a24";
	var_28bf3706 = instance.var_fe2612fe[#"heli_spawn"][0];
	/#
		assert(isdefined(var_28bf3706.target), "");
	#/
	nd_start = getvehiclenode(var_28bf3706.target, "targetname");
	do
	{
		vh_heli = vehicle::spawn(undefined, "helicopter_escape_heli", #"hash_669d01ea5db4e10c", nd_start.origin, nd_start.angles);
		waitframe(1);
	}
	while(!isdefined(vh_heli));
	vh_heli setteam(level.zombie_team);
	vh_heli.health = function_a0861762(2500, 150000);
	vh_heli.maxhealth = vh_heli.health;
	vh_heli setmaxhealth(vh_heli.maxhealth);
	vh_heli callback::function_d8abfc3d(#"on_vehicle_killed", &function_36564c7c);
	vh_heli callback::function_d8abfc3d(#"on_vehicle_damage", &function_2a05a8c6);
	vh_heli thread function_90bceefd();
	vh_heli makevehicleunusable();
	vh_heli setrotorspeed(1);
	vh_heli setdrawinfrared(1);
	vh_heli setseatoccupied(0, 1);
	target_set(vh_heli);
	vh_heli setforcenocull();
	vh_heli vehicle::toggle_tread_fx(1);
	vh_heli vehicle::toggle_sounds(1);
	vh_heli.var_99582f14 = 1;
	vh_heli.var_1b9f096d = 1;
	vh_heli.var_ac1388df = 1;
	if(util::function_53bbf9d2() === #"hash_2ef022fa4966a6ae")
	{
		vh_heli vehicle::toggle_lights_group(3, 1);
		vh_heli turretsettargetangles(0, (0, 0, 0));
	}
	level.var_e1011305 = level.var_b48509f9;
	namespace_cf6efd05::function_c484a9be(#"hash_3d1c462f6d4757c2", level.var_e1011305);
	level thread helicopter::function_eca18f00(vh_heli, #"hash_5793213ec26a2aa5");
	vh_heli.instance = instance;
	if(instance.targetname === "helicopter_escape_dune_instance_3")
	{
		var_28bf3706.radius = 2500;
	}
	if(isdefined(var_28bf3706.radius) && var_28bf3706.radius > 0)
	{
		var_deaf3fc0 = var_28bf3706.origin;
		var_6fb21416 = var_28bf3706.radius;
	}
	else
	{
		var_deaf3fc0 = vh_heli getcentroid();
		var_6fb21416 = 4000;
	}
	while(true)
	{
		var_be19a72a = 0;
		foreach(player in function_a1ef346b())
		{
			if(isdefined(vh_heli) && (isdefined(player) && isdefined(var_deaf3fc0)) && (vh_heli.health < vh_heli.maxhealth || distance(player.origin, var_deaf3fc0) <= var_6fb21416))
			{
				var_be19a72a = 1;
				break;
			}
		}
		if(level.var_7d45d0d4.var_3385b421.content_script_name === "holdout")
		{
			wait(0.5);
			continue;
		}
		if(var_be19a72a)
		{
			break;
		}
		wait(0.5);
	}
	if(!isdefined(vh_heli))
	{
		return;
	}
	if(!isdefined(vh_heli.e_crate))
	{
		vh_heli.e_crate = spawn_crate(vh_heli.origin, vh_heli.angles, instance);
	}
	if(vh_heli.e_crate clientfield::is_registered("perk_death_perception_item_marked_for_rob"))
	{
		vh_heli.e_crate clientfield::set("perk_death_perception_item_marked_for_rob", 1);
	}
	if(!isalive(vh_heli))
	{
		return;
	}
	level thread zm_vo::function_7622cb70(#"hash_37d8017a04a1565d", 2);
	vh_heli thread scene::play(#"hash_23fe21c363168ac5", "fly_in");
	vh_heli vehicle::get_on_and_go_path(nd_start);
	waitframe(1);
	if(isalive(vh_heli))
	{
		vh_heli function_71b5509(1);
	}
}

/*
	Name: function_90bceefd
	Namespace: namespace_dedc3cb9
	Checksum: 0x2866E59B
	Offset: 0x11B8
	Size: 0xF8
	Parameters: 0
	Flags: Linked
*/
function function_90bceefd()
{
	if(!is_true(level.var_53bc31ad))
	{
		return;
	}
	self endon(#"death");
	while(true)
	{
		level waittill(#"hash_6a805bca389d1daf");
		var_b212a8a9 = self.health / self.maxhealth;
		var_c835c552 = function_a0861762(2500, 150000);
		if(isdefined(var_c835c552) && var_c835c552 > self.maxhealth)
		{
			self.maxhealth = int(var_c835c552);
			self setmaxhealth(self.maxhealth);
			self setnormalhealth(var_b212a8a9);
		}
	}
}

/*
	Name: function_a0861762
	Namespace: namespace_dedc3cb9
	Checksum: 0x2EA412B3
	Offset: 0x12B8
	Size: 0x17A
	Parameters: 2
	Flags: Linked
*/
function function_a0861762(n_health_min, n_health_max)
{
	var_6499d1fb = zm_utility::function_e3025ca5();
	if(var_6499d1fb < 1)
	{
		var_6499d1fb = 1;
	}
	else if(var_6499d1fb > 10)
	{
		var_6499d1fb = 10;
	}
	n_percent = 1 - ((10 - var_6499d1fb) / 9);
	if(n_percent < 0)
	{
		n_percent = 0;
	}
	else if(n_percent > 1)
	{
		n_percent = 1;
	}
	n_players = getplayers().size;
	if(n_players < 1)
	{
		n_players = 1;
	}
	else if(n_players > 4)
	{
		n_players = 4;
	}
	var_1bb081d7 = 1 + ((n_players - 1) * 0.5);
	if(n_health_min < n_health_max)
	{
		var_c835c552 = int(lerpfloat(n_health_min, n_health_max, n_percent) * var_1bb081d7);
	}
	else
	{
		var_c835c552 = int(n_health_min * var_1bb081d7);
	}
	return var_c835c552;
}

/*
	Name: function_36564c7c
	Namespace: namespace_dedc3cb9
	Checksum: 0x3AB43353
	Offset: 0x1440
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function function_36564c7c(params)
{
	self function_71b5509(0);
	if(namespace_d0ab5955::function_3824d2dc(self.origin))
	{
		foreach(player in getplayers())
		{
			player zm_stats::increment_challenge_stat(#"hash_46e6329f4b3c275d");
		}
		level thread zm_vo::function_7622cb70(#"hash_447deedfb079840a", 2);
		self drop_crate(self.instance);
	}
	else if(isdefined(self.e_crate))
	{
		self.e_crate delete();
	}
}

/*
	Name: function_be51796c
	Namespace: namespace_dedc3cb9
	Checksum: 0x8BF42102
	Offset: 0x1590
	Size: 0x372
	Parameters: 16
	Flags: Linked
*/
function function_be51796c(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	damage = vdir;
	if(is_true(self.var_ac1388df))
	{
		if(isdefined(psoffsettime) && isplayer(vpoint) && vdamageorigin !== "MOD_AAT")
		{
			if(psoffsettime.offhandslot === "Tactical grenade" || psoffsettime.offhandslot === "Lethal grenade" || psoffsettime.offhandslot === "Special" || killstreaks::is_killstreak_weapon(psoffsettime))
			{
				if(!zm_equipment::function_4f51b6ea(psoffsettime, vdamageorigin) && !is_true(self.var_88bc9ca8) && vdamageorigin !== "MOD_MELEE")
				{
					damage = zm_equipment::function_739fbb72(damage, psoffsettime, #"elite", self.maxhealth);
				}
				if(killstreaks::is_killstreak_weapon(psoffsettime))
				{
					damage = damage * 0.5;
					if(psoffsettime.firetype === "Minigun")
					{
						damage = damage * 0.75;
					}
				}
				else
				{
					damage = damage * 0.1;
				}
			}
			item = vpoint namespace_b376ff3f::function_230ceec4(psoffsettime);
			if(isdefined(item))
			{
				var_528363fd = self namespace_b61a349a::function_b3496fde(var_fd90b0bb, vpoint, damage, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
				damage = damage + var_528363fd;
				if(vdamageorigin != "MOD_MELEE")
				{
					var_4d1602de = zm_weapons::function_d85e6c3a(item.var_a6762160);
					damage = damage * var_4d1602de;
					if(isdefined(item.var_a8bccf69))
					{
						var_645b8bb = zm_weapons::function_896671d5(item.var_a6762160.weapon, item.var_a8bccf69);
						damage = damage * var_645b8bb;
					}
				}
			}
			else
			{
				var_fd72ea28 = self namespace_b61a349a::function_b3496fde(var_fd90b0bb, vpoint, damage, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
				damage = damage + var_fd72ea28;
			}
		}
	}
	return int(damage);
}

/*
	Name: function_71b5509
	Namespace: namespace_dedc3cb9
	Checksum: 0x6524C42C
	Offset: 0x1910
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function function_71b5509(b_delete)
{
	if(!isdefined(b_delete))
	{
		b_delete = 0;
	}
	self setrotorspeed(0);
	self scene::stop(1);
	if(isdefined(self.n_obj_id))
	{
		self.n_obj_id = zm_utility::function_bc5a54a8(self.n_obj_id);
		self.n_obj_id = undefined;
	}
	self vehicle::get_off_path();
	self helicopter::function_711c140b();
	if(b_delete)
	{
		if(isdefined(self.e_crate))
		{
			self.e_crate delete();
		}
		self thread zm_utility::function_78e620d();
	}
	else
	{
		self thread util::delay(2.7, "death", &delete);
	}
}

/*
	Name: function_2a05a8c6
	Namespace: namespace_dedc3cb9
	Checksum: 0xB042681B
	Offset: 0x1A48
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_2a05a8c6(params)
{
	if(isplayer(params.eattacker) && (isdefined(params.vpoint) && isdefined(params.idamage)))
	{
		if(params.idamage > 0)
		{
			hud::function_c9800094(params.eattacker, params.vpoint, params.idamage, 1);
		}
		else
		{
			hud::function_c9800094(params.eattacker, params.vpoint, 0, 4);
		}
	}
}

/*
	Name: spawn_crate
	Namespace: namespace_dedc3cb9
	Checksum: 0x7F6F5B42
	Offset: 0x1B08
	Size: 0xF0
	Parameters: 3
	Flags: Linked
*/
function spawn_crate(v_origin, v_angles, instance)
{
	crate = namespace_8b6a9d79::spawn_script_model(instance, #"wpn_t9_streak_care_package_friendly_world", 1, 1);
	crate dontinterpolate();
	crate.origin = v_origin;
	crate.angles = v_angles;
	instance.scriptmodel = crate;
	crate.weapon = getweapon(#"hash_4b481c684ce22455");
	crate setweapon(crate.weapon);
	crate function_619a5c20();
	return crate;
}

/*
	Name: drop_crate
	Namespace: namespace_dedc3cb9
	Checksum: 0x9DE3B576
	Offset: 0x1C00
	Size: 0x254
	Parameters: 3
	Flags: Linked
*/
function drop_crate(instance, var_f9972216, var_f16f4b37)
{
	v_drop_origin = (isdefined(var_f9972216) ? var_f9972216 : self.origin);
	var_55ab02db = (isdefined(var_f16f4b37) ? var_f16f4b37 : self.angles);
	if(!isdefined(self.e_crate))
	{
		self.e_crate = spawn_crate(v_drop_origin, var_55ab02db, instance);
	}
	self playsound(#"veh_supply_drop");
	mask = 1 | 4;
	radius = 30;
	trace = physicstrace(self.e_crate.origin + (vectorscale((0, 0, -1), 100)), self.e_crate.origin + (vectorscale((0, 0, -1), 10000)), (radius * -1, radius * -1, 0), (radius, radius, 2 * radius), undefined, mask);
	v_target_location = trace[#"position"];
	n_distance_to_target = distance(self.e_crate.origin, v_target_location);
	n_drop_time = mapfloat(0, 1000, 1, 10, n_distance_to_target);
	if(getdvarint(#"hash_6f70975791322a26", 0))
	{
		self.e_crate.n_obj_id = zm_utility::function_f5a222a8(#"hash_550113857d521cf0", self.e_crate);
	}
	self.e_crate thread cratecontrolleddrop(instance, v_target_location, n_drop_time);
}

/*
	Name: cratecontrolleddrop
	Namespace: namespace_dedc3cb9
	Checksum: 0xF8D5FF6F
	Offset: 0x1E60
	Size: 0x474
	Parameters: 4
	Flags: Linked
*/
function cratecontrolleddrop(instance, v_target_location, n_drop_time, var_72886e11)
{
	if(!isdefined(n_drop_time))
	{
		n_drop_time = 10;
	}
	crate = self;
	crate endon(#"death");
	params = spawnstruct();
	if(!isdefined(params.ksthrustersoffheight))
	{
		params.ksthrustersoffheight = 100;
	}
	params.kstotaldroptime = (isdefined(n_drop_time) ? n_drop_time : 10);
	if(!isdefined(params.ksacceltimepercentage))
	{
		params.ksacceltimepercentage = 0.65;
	}
	if(!isdefined(params.var_827e3209))
	{
		params.var_827e3209 = #"hash_3aa3ac8dc366dcf1";
	}
	crate thread watchforcratekill(v_target_location[2] + 200);
	crate thread update_crate_velocity();
	var_ae4c0bf9 = (isdefined(level.var_947cc86b) ? level.var_947cc86b : params.ksthrustersoffheight);
	target = (v_target_location[0], v_target_location[1], v_target_location[2] + var_ae4c0bf9);
	var_c65d6e50 = 1;
	if(isdefined(var_72886e11) && var_72886e11 >= target[2])
	{
		var_c65d6e50 = 0;
	}
	if(!is_true(level.var_2e93cff2) && var_c65d6e50)
	{
		var_cc6645da = params.ksacceltimepercentage;
		acceltime = params.kstotaldroptime * var_cc6645da;
		deceltime = (is_true(params.var_f03a1094) ? params.kstotaldroptime - acceltime : 0);
		hostmigration::waittillhostmigrationdone();
		crate moveto(target, params.kstotaldroptime, acceltime, deceltime);
		crate thread function_2defd397();
		wait(acceltime);
		if(!is_true(crate.var_7bea4af0))
		{
			crate waittill(#"movedone", #"hash_6ade3db3c3188274");
		}
		hostmigration::waittillhostmigrationdone();
	}
	crate thread cratephysics(instance);
	var_53d0638b = gettime() + 3000;
	while(distancesquared(crate.origin, v_target_location) > 100)
	{
		waitframe(1);
		if(gettime() >= var_53d0638b)
		{
			break;
		}
	}
	if(isdefined(params.var_827e3209))
	{
		trace = groundtrace(crate.origin + vectorscale((0, 0, 1), 70), crate.origin + (vectorscale((0, 0, -1), 100)), 0, crate);
		var_2122d2eb = crate getfxfromsurfacetable(params.var_827e3209, trace[#"surfacetype"]);
		if(isdefined(var_2122d2eb))
		{
			var_bc514cf = trace[#"normal"];
			if(var_bc514cf == (0, 0, 0))
			{
				var_bc514cf = (0, 0, 1);
			}
			playfx(var_2122d2eb, trace[#"position"], var_bc514cf);
			self playsound(#"phy_impact_supply");
		}
	}
}

/*
	Name: update_crate_velocity
	Namespace: namespace_dedc3cb9
	Checksum: 0xDA2DCA77
	Offset: 0x22E0
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function update_crate_velocity()
{
	self endon(#"death", #"stationary");
	self.velocity = (0, 0, 0);
	self.old_origin = self.origin;
	while(isdefined(self))
	{
		self.velocity = self.origin - self.old_origin;
		self.old_origin = self.origin;
		waitframe(1);
	}
}

/*
	Name: cratephysics
	Namespace: namespace_dedc3cb9
	Checksum: 0x71D9FC8A
	Offset: 0x2370
	Size: 0x124
	Parameters: 1
	Flags: Linked
*/
function cratephysics(instance)
{
	self endon(#"death");
	self physicslaunch(self.origin, (0, 0, -1));
	self thread timeoutcratewaiter();
	self waittill(#"stationary");
	self.trigger = namespace_8b6a9d79::function_214737c7(instance, &function_f7155f4f, #"hash_b1847d899d481cd", undefined, 96);
	self.trigger.origin = self.origin;
	self.trigger.angles = self.angles;
	self.trigger.struct = instance;
	self.trigger.var_cc1fb2d0 = #"hash_25939761cf3b8050";
	self function_d2d0a813();
}

/*
	Name: function_f7155f4f
	Namespace: namespace_dedc3cb9
	Checksum: 0xFEA723B7
	Offset: 0x24A0
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_f7155f4f(params)
{
	e_crate = self.struct.scriptmodel;
	e_crate.var_11428995 = vectorscale((0, 1, 0), 90);
	self namespace_58949729::function_8665f666(params);
	e_crate thread function_960ea519(params.activator);
}

/*
	Name: function_960ea519
	Namespace: namespace_dedc3cb9
	Checksum: 0xAEF5E644
	Offset: 0x2520
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function function_960ea519(owner)
{
	if(isdefined(self.var_46e0d8c8))
	{
		playsoundatposition(self.var_46e0d8c8, self.origin);
	}
	bundle = getscriptbundle(#"hash_103efa2815dd540f");
	detonationdelay = bundle.var_18d14afd;
	self thread function_71c8970c(0.84);
	wait(detonationdelay);
	if(isdefined(self))
	{
		self function_345ada65(owner);
	}
	if(isdefined(self.n_obj_id))
	{
		self.n_obj_id = zm_utility::function_bc5a54a8(self.n_obj_id);
		self.n_obj_id = undefined;
	}
	if(isdefined(self))
	{
		self cratedelete(1);
	}
}

/*
	Name: function_345ada65
	Namespace: namespace_dedc3cb9
	Checksum: 0x9E4E1D79
	Offset: 0x2640
	Size: 0x328
	Parameters: 1
	Flags: Linked
*/
function function_345ada65(attacker)
{
	bundle = getscriptbundle(#"hash_103efa2815dd540f");
	if(isdefined(bundle.var_b768b86b))
	{
		trace = groundtrace(self.origin + vectorscale((0, 0, 1), 10), self.origin + (vectorscale((0, 0, -1), 10)), 0, self);
		explosionfx = self getfxfromsurfacetable(bundle.var_b768b86b, trace[#"surfacetype"]);
		if(isdefined(explosionfx))
		{
			playfx(explosionfx, self.origin, anglestoup(self.angles), anglestoright(self.angles));
		}
	}
	if(isdefined(self.var_f2f6db96))
	{
		playfx(self.var_f2f6db96, self.origin, anglestoup(self.angles), anglestoright(self.angles));
	}
	if(isdefined(self.var_30dd81f6))
	{
		playsoundatposition(self.var_30dd81f6, self.origin);
	}
	if(isdefined(bundle.var_3f41a92c))
	{
		playrumbleonposition(bundle.var_3f41a92c, self.origin);
	}
	playsoundatposition(#"hash_2f1ae087d02ed33f", self.origin);
	if(isplayer(attacker))
	{
		a_enemies = attacker function_bdda420f(self.origin, 256);
		foreach(ai in a_enemies)
		{
			if(isalive(ai))
			{
				ai dodamage(200, self.origin, attacker, undefined, "none", "MOD_EXPLOSIVE", 0, getweapon(#"supplydrop"));
			}
		}
	}
}

/*
	Name: function_71c8970c
	Namespace: namespace_dedc3cb9
	Checksum: 0xAD96AB79
	Offset: 0x2970
	Size: 0x17A
	Parameters: 1
	Flags: Linked
*/
function function_71c8970c(interval)
{
	self endon(#"death");
	if(isdefined(self.var_d3256432))
	{
		playsoundatposition(self.var_d3256432, self.origin);
	}
	while(true)
	{
		if(!isdefined(self.var_d3256432))
		{
			playsoundatposition("wpn_semtex_alert", self.origin);
		}
		playfxontag(#"hash_73dda66347b73ddd", self, "tag_fx_01");
		playfxontag(#"hash_73dda66347b73ddd", self, "tag_fx_02");
		playfxontag(#"hash_73dda66347b73ddd", self, "tag_fx_03");
		playfxontag(#"hash_73dda66347b73ddd", self, "tag_fx_04");
		playfxontag(#"hash_3e6e2a2df9fd889", self, "tag_body");
		wait(interval);
		interval = interval / 1.2;
		if(interval < 0.08)
		{
			break;
		}
	}
}

/*
	Name: timeoutcratewaiter
	Namespace: namespace_dedc3cb9
	Checksum: 0xFB208EDE
	Offset: 0x2AF8
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function timeoutcratewaiter()
{
	self endon(#"death", #"stationary");
	wait(20);
	self cratedelete(1);
}

/*
	Name: cratedelete
	Namespace: namespace_dedc3cb9
	Checksum: 0xE2845494
	Offset: 0x2B48
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function cratedelete(drop_all_to_ground)
{
	if(!isdefined(drop_all_to_ground))
	{
		drop_all_to_ground = 1;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.parachute))
	{
		self.parachute delete();
	}
	self function_9813d292();
	self deletedelay();
}

/*
	Name: function_d2d0a813
	Namespace: namespace_dedc3cb9
	Checksum: 0xB64BF50E
	Offset: 0x2BD8
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_d2d0a813()
{
	var_3b0688ef = "supply_drop_badplace" + self getentitynumber();
	origin = self.origin + self getboundsmidpoint();
	halfsize = self getboundshalfsize();
	var_921c5821 = max(halfsize[0], halfsize[1]) + 4;
	halfsize = (var_921c5821, var_921c5821, halfsize[2] + 4);
	badplace_box(var_3b0688ef, 0, origin, halfsize, "all");
}

/*
	Name: function_9813d292
	Namespace: namespace_dedc3cb9
	Checksum: 0xCD8AC6BC
	Offset: 0x2CC0
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9813d292()
{
	if(isdefined(self))
	{
		badplace_delete("supply_drop_badplace" + self getentitynumber());
	}
}

/*
	Name: function_4bf116ab
	Namespace: namespace_dedc3cb9
	Checksum: 0x7B074269
	Offset: 0x2D08
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_4bf116ab(ents)
{
	if(isdefined(self.e_crate))
	{
		self.e_crate linkto(ents[#"harness"], "tag_care_package", (0, 0, 0), (0, 0, 0));
	}
}

/*
	Name: function_2842c984
	Namespace: namespace_dedc3cb9
	Checksum: 0x738D19E9
	Offset: 0x2D68
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_2842c984(ents)
{
	if(isdefined(self.crate))
	{
		self.crate delete();
	}
}

/*
	Name: function_76b49bd8
	Namespace: namespace_dedc3cb9
	Checksum: 0xD342E753
	Offset: 0x2DA8
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function function_76b49bd8(ents)
{
	ents[#"parachute"] clientfield::set("supply_drop_parachute_rob", 1);
	self.parachute = ents[#"parachute"];
}

/*
	Name: function_2defd397
	Namespace: namespace_dedc3cb9
	Checksum: 0xC79ECC82
	Offset: 0x2E08
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function function_2defd397()
{
	self endon(#"death");
	self scene::play(#"hash_211993854fb33604", "open");
	self thread scene::play(#"hash_211993854fb33604", "idle");
	self waittill(#"movedone");
	self scene::stop(#"hash_211993854fb33604");
	self.parachute thread scene::play(#"hash_211993854fb33604", "detach", self.parachute);
	wait(1);
	if(isdefined(self.parachute))
	{
		self.parachute clientfield::set("supply_drop_parachute_rob", 0);
	}
}

/*
	Name: watchforcratekill
	Namespace: namespace_dedc3cb9
	Checksum: 0x9B10AEC6
	Offset: 0x2F28
	Size: 0x152
	Parameters: 1
	Flags: Linked
*/
function watchforcratekill(start_kill_watch_z_threshold)
{
	crate = self;
	crate endon(#"death", #"stationary");
	while(crate.origin[2] > start_kill_watch_z_threshold)
	{
		waitframe(1);
	}
	stationarythreshold = 1;
	killthreshold = 0.2;
	maxframestillstationary = 10;
	numframesstationary = 0;
	while(true)
	{
		vel = 0;
		if(isdefined(self.velocity))
		{
			vel = abs(self.velocity[2]);
		}
		if(vel > killthreshold)
		{
			crate is_touching_crate();
			crate is_clone_touching_crate();
		}
		if(vel < stationarythreshold)
		{
			numframesstationary++;
		}
		else
		{
			numframesstationary = 0;
		}
		if(numframesstationary >= maxframestillstationary)
		{
			break;
		}
		waitframe(1);
	}
}

/*
	Name: is_touching_crate
	Namespace: namespace_dedc3cb9
	Checksum: 0xD540DF24
	Offset: 0x3088
	Size: 0x3C4
	Parameters: 0
	Flags: Linked
*/
function is_touching_crate()
{
	if(!isdefined(self))
	{
		return;
	}
	crate = self;
	players = getplayers();
	crate_bottom_point = self.origin;
	foreach(player in level.players)
	{
		if(!isentity(player))
		{
			continue;
		}
		if(isdefined(player) && isalive(player))
		{
			stance = player getstance();
			stance_z_offset = (stance == "stand" ? 75 : (stance == "crouch" ? 55 : 15));
			player_test_point = player.origin + (0, 0, stance_z_offset);
			var_f6f95bb5 = distance2dsquared(player_test_point, self.origin);
			var_dee7aebd = self.velocity[2];
			if(var_f6f95bb5 < 2500 && player_test_point[2] > crate_bottom_point[2])
			{
				attacker = (isdefined(self.owner) ? self.owner : self);
				player dodamage(player.health + 1, player.origin, attacker, self, "none", "MOD_HIT_BY_OBJECT", 0, getweapon(#"supplydrop"));
				player playsound(#"mpl_supply_crush");
				player playsound(#"phy_impact_supply");
			}
		}
	}
	self is_equipment_touching_crate();
	vehicles = getentarray("script_vehicle", "classname");
	foreach(vehicle in vehicles)
	{
		if(isvehicle(vehicle))
		{
			if(isdefined(vehicle.archetype) && vehicle.archetype == "wasp")
			{
				if(crate istouching(vehicle, vectorscale((1, 1, 1), 2)))
				{
					vehicle notify(#"sentinel_shutdown");
				}
			}
		}
	}
}

/*
	Name: is_clone_touching_crate
	Namespace: namespace_dedc3cb9
	Checksum: 0xE0677801
	Offset: 0x3458
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function is_clone_touching_crate()
{
	if(!isdefined(self))
	{
		return;
	}
	extraboundary = vectorscale((1, 1, 1), 10);
	actors = getactorarray();
	for(i = 0; i < actors.size; i++)
	{
		if(isdefined(actors[i]) && isdefined(actors[i].isaiclone) && isalive(actors[i]) && actors[i].origin[2] < self.origin[2] && self istouching(actors[i], extraboundary))
		{
			attacker = (isdefined(self.owner) ? self.owner : self);
			actors[i] dodamage(actors[i].health + 1, actors[i].origin, attacker, self, "none", "MOD_HIT_BY_OBJECT", 0, getweapon(#"supplydrop"));
			actors[i] playsound(#"mpl_supply_crush");
			actors[i] playsound(#"phy_impact_supply");
		}
	}
}

/*
	Name: is_equipment_touching_crate
	Namespace: namespace_dedc3cb9
	Checksum: 0x4ADB373E
	Offset: 0x3628
	Size: 0x198
	Parameters: 0
	Flags: Linked
*/
function is_equipment_touching_crate()
{
	entities = getdamageableentarray(self.origin, 100);
	foreach(entity in entities)
	{
		if(!isentity(entity))
		{
			continue;
		}
		if(isplayer(entity))
		{
			continue;
		}
		if(!isalive(entity))
		{
			continue;
		}
		if(!entity istouching(self, vectorscale((1, 1, 1), 10)))
		{
			continue;
		}
		if(isdefined(entity.detonated))
		{
			damage = 100;
		}
		else
		{
			damage = entity.health * 2;
		}
		entity dodamage(damage, self.origin, self.owner, self, 0, "MOD_UNKNOWN", 0, getweapon(#"supplydrop"));
	}
}

