#using script_15022fca9ab99080;
#using script_2c74a7b5eea1ec89;
#using script_3728b3b9606c4299;
#using script_383a3b1bb18ba876;
#using script_3fda550bc6e1089a;
#using script_4721de209091b1a6;
#using script_47fb62300ac0bd60;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\audio_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace namespace_e8c18978;

/*
	Name: function_3a10ba5
	Namespace: namespace_e8c18978
	Checksum: 0x97A5736
	Offset: 0x360
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3a10ba5()
{
	level notify(1968229204);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e8c18978
	Checksum: 0xCFD3078
	Offset: 0x380
	Size: 0x14E
	Parameters: 1
	Flags: Linked
*/
function function_70a657d8(bundlename)
{
	level.var_b3e433ae = [];
	clientfield::register("toplayer", "" + #"hash_7c907650b14abbbe", 1, 1, "int");
	clientfield::register("vehicle", "" + #"hash_4ddf67f7aa0f6884", 1, 1, "int");
	clientfield::register("vehicle", "" + #"hash_46646871455cab15", 1, 2, "int");
	clientfield::register("vehicle", "" + #"hash_6cf1a3b26118d892", 1, 1, "int");
	init_shared();
	killstreaks::function_e4ef8390(bundlename, &activatemaingunner);
}

/*
	Name: function_3675de8b
	Namespace: namespace_e8c18978
	Checksum: 0xCA8761A8
	Offset: 0x4D8
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_3675de8b()
{
	scene::add_scene_func(#"chopper_gunner_door_open", &function_294e90d4, "play");
	scene::add_scene_func(#"chopper_gunner_door_open", &function_4e4267e0, "done");
	bundle = killstreaks::get_script_bundle("chopper_gunner");
	/#
		assert(isdefined(bundle));
	#/
}

/*
	Name: function_d887d24d
	Namespace: namespace_e8c18978
	Checksum: 0x2DCAC600
	Offset: 0x598
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function function_d887d24d(var_e7230502)
{
	if(!isdefined(level.var_b3e433ae))
	{
		level.var_b3e433ae = [];
	}
	else if(!isarray(level.var_b3e433ae))
	{
		level.var_b3e433ae = array(level.var_b3e433ae);
	}
	if(!isinarray(level.var_b3e433ae, var_e7230502))
	{
		level.var_b3e433ae[level.var_b3e433ae.size] = var_e7230502;
	}
}

/*
	Name: function_5160bb1e
	Namespace: namespace_e8c18978
	Checksum: 0xCC11049E
	Offset: 0x648
	Size: 0x1072
	Parameters: 1
	Flags: Linked
*/
function function_5160bb1e(killstreaktype)
{
	/#
		assert(!isdefined(level.chopper_gunner));
	#/
	if(is_true(self.isplanting) || is_true(self.isdefusing) || self util::isusingremote() || self iswallrunning() || self oob::isoutofbounds())
	{
		return 0;
	}
	killstreak_id = self killstreakrules::killstreakstart("chopper_gunner", self.team, undefined, 1);
	if(killstreak_id == -1)
	{
		return 0;
	}
	bundle = killstreaks::get_script_bundle("chopper_gunner");
	/#
		assert(isdefined(bundle));
	#/
	spawnpos = level.mapcenter + (0, bundle.var_42d6fcc1, bundle.var_4325e427);
	level.chopper_gunner = spawnvehicle(bundle.ksvehicle, spawnpos, (0, 0, 0), "chopper_gunner");
	level.chopper_gunner.identifier_weapon = getweapon("chopper_gunner");
	level.chopper_gunner killstreaks::configure_team(killstreaktype, killstreak_id, self, "helicopter");
	level.chopper_gunner.killstreak_id = killstreak_id;
	level.chopper_gunner.destroyfunc = &function_f1d43cb2;
	level.chopper_gunner.hardpointtype = "chopper_gunner";
	level.chopper_gunner clientfield::set("enemyvehicle", 1);
	level.chopper_gunner vehicle::init_target_group();
	level.chopper_gunner.killstreak_timer_started = 0;
	level.chopper_gunner.allowdeath = 0;
	level.chopper_gunner.var_c31213a5 = 1;
	level.chopper_gunner.playermovedrecently = 0;
	level.chopper_gunner.soundmod = "default_loud";
	if(isdefined(level.registerwithhackertool))
	{
		level.chopper_gunner [[level.registerwithhackertool]](50, 10000);
	}
	level.chopper_gunner.usage = [];
	level.destructible_callbacks[#"turret_destroyed"] = &function_aecfdb77;
	level.chopper_gunner.shuttingdown = 0;
	level.chopper_gunner.completely_shutdown = 0;
	level.chopper_gunner thread heatseekingmissile::playlockonsoundsthread(self, #"hash_fa62d8cec85b1a0", #"hash_1683ed70beb3f2");
	level.chopper_gunner.maxhealth = (isdefined(killstreak_bundles::get_max_health("chopper_gunner")) ? killstreak_bundles::get_max_health("chopper_gunner") : 5000);
	level.chopper_gunner.original_health = level.chopper_gunner.maxhealth;
	level.chopper_gunner.health = level.chopper_gunner.maxhealth;
	level.chopper_gunner.damagestate = 0;
	level.chopper_gunner helicopter::function_76f530c7(bundle);
	level.chopper_gunner setcandamage(1);
	target_set(level.chopper_gunner, vectorscale((0, 0, -1), 100));
	target_setallowhighsteering(level.chopper_gunner, 1);
	level.chopper_gunner.numflares = 1;
	level.chopper_gunner.fx_flare = bundle.var_22ab738b;
	level.chopper_gunner helicopter::create_flare_ent(vectorscale((0, 0, -1), 150));
	level.chopper_gunner thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile(bundle, "death");
	level.chopper_gunner.is_still_valid_target_for_stinger_override = &function_c2bfa7e1;
	level.chopper_gunner thread namespace_231aa29a::function_d4896942(bundle, "chopper_gunner");
	level.chopper_gunner thread namespace_231aa29a::function_31f9c728(bundle, "chopper_gunner", "exp_incoming_missile", "uin_ac130_alarm_missile_incoming");
	level.chopper_gunner setrotorspeed(1);
	level thread helicopter::function_eca18f00(level.chopper_gunner, bundle.var_f90029e2);
	level.chopper_gunner util::function_c596f193();
	level.chopper_gunner.maxvisibledist = 16384;
	level.chopper_gunner function_53d3b37a(bundle);
	level.chopper_gunner.totalrockethits = 0;
	level.chopper_gunner.turretrockethits = 0;
	level.chopper_gunner.overridevehicledamage = &function_77784598;
	self thread namespace_f9b02f80::play_killstreak_start_dialog("chopper_gunner", self.team, killstreak_id);
	level.chopper_gunner namespace_f9b02f80::play_pilot_dialog_on_owner("arrive", "chopper_gunner", killstreak_id);
	level.chopper_gunner thread killstreaks::player_killstreak_threat_tracking("chopper_gunner", 0.8660254);
	self stats::function_e24eec31(bundle.var_1ab696c6, #"used", 1);
	self clientfield::set_to_player("" + #"hash_7c907650b14abbbe", 1);
	if(sessionmodeiszombiesgame() && is_true(level.var_68e3cf24) && !is_true(level.var_d5ad2e35))
	{
		/#
			assert(isdefined(self.var_7cadce77), "");
		#/
		var_6b3ce0fa = getvehiclenodearray("chopper_gunner_path_start_multi", "targetname");
		foreach(node in var_6b3ce0fa)
		{
			if(node.script_noteworthy === self.var_7cadce77)
			{
				startnode = node;
				break;
			}
		}
	}
	else
	{
		if(sessionmodeiszombiesgame() && !isdefined(level.var_97e461d4) && util::function_5df4294() === #"zsurvival")
		{
			var_6b3ce0fa = getvehiclenodearray("chopper_gunner_path_start_multi", "targetname");
			foreach(node in var_6b3ce0fa)
			{
				if(issubstr(node.script_noteworthy, "defend"))
				{
					startnode = node;
					break;
				}
			}
		}
		else
		{
			startnode = getvehiclenode("chopper_gunner_path_start", "targetname");
		}
	}
	/#
		assert(isdefined(startnode), "");
	#/
	if(function_f99d2668() && !is_true(level.var_29cfe9dd) || is_true(level.var_d5ad2e35))
	{
		if(sessionmodeiszombiesgame())
		{
			height = (isdefined(level.var_1beaaeca) ? level.var_1beaaeca : 3500);
			height = height + (isdefined(level.var_fba637a5) ? level.var_fba637a5 : 0);
			angle_offset = (isdefined(level.var_32e48553) ? level.var_32e48553 : vectorscale((0, 1, 0), 45));
			var_77e38a57 = level.var_981cf9cf;
			position = self.origin;
			if(self.origin[2] < 1000)
			{
				position = (self.origin[0], self.origin[1], 1000);
			}
			yaw = function_26e7fb55(position, height, angle_offset);
			angle_offset = (angle_offset[0], yaw, angle_offset[2]);
			level.chopper_gunner vehicle::function_3f76e204(startnode, position, self.angles, height, angle_offset, var_77e38a57);
			var_e31d6cb1 = position;
		}
		else
		{
			position = self.origin;
			var_6ec39c6f = (isdefined(level.var_e8fd1435) ? level.var_e8fd1435 : 0);
			/#
				var_9972a46c = getdvarint(#"hash_3214d6c00531a24f", 0);
				if(var_9972a46c)
				{
					var_6ec39c6f = var_9972a46c;
				}
			#/
			if(var_6ec39c6f)
			{
				var_ceaada96 = distance2d(position, level.mapcenter);
				if(var_ceaada96 > var_6ec39c6f)
				{
					var_1ce870a0 = vectornormalize(level.mapcenter - position);
					var_1ce870a0 = (var_1ce870a0[0], var_1ce870a0[1], 0);
					var_a338f16a = (isdefined(level.var_782b91f2) ? level.var_782b91f2 : 1);
					/#
						var_bd2c37fd = getdvarint(#"hash_11189a015da61a14", 0);
						if(var_bd2c37fd)
						{
							var_a338f16a = var_bd2c37fd;
						}
					#/
					position = position + (vectorscale(var_1ce870a0, var_ceaada96 * var_a338f16a));
				}
			}
			trace = bullettrace(position + vectorscale((0, 0, 1), 10000), position - vectorscale((0, 0, 1), 10000), 0, undefined);
			targetpoint = (trace[#"fraction"] < 1 ? trace[#"position"] : (position[0], position[1], 0));
			var_b0490eb9 = getheliheightlockheight(position);
			groundheight = targetpoint[2];
			height = groundheight + ((var_b0490eb9 - groundheight) * bundle.var_ff73e08c);
			pivot = struct::get("chopper_gunner_pivot", "targetname");
			yaw = function_26e7fb55(position, var_b0490eb9, self.angles);
			location = {#yaw:yaw, #origin:position};
			level.chopper_gunner vehicle::function_bb9b43a9(startnode, pivot.origin, pivot.angles, location, height);
			var_e31d6cb1 = position;
		}
	}
	else
	{
		var_e31d6cb1 = level.mapcenter;
	}
	/#
		var_8cdd01c7 = getdvarint(#"hash_4536100039d07f70", 0);
		if(var_8cdd01c7 > 0)
		{
			level.chopper_gunner pathmove(startnode, (startnode.origin[0], startnode.origin[1], var_8cdd01c7), startnode.angles);
		}
	#/
	level.chopper_gunner thread vehicle::get_on_and_go_path(startnode);
	level.chopper_gunner thread function_696b3380();
	level.chopper_gunner killstreakrules::function_2e6ff61a("chopper_gunner", killstreak_id, {#team:level.chopper_gunner.team, #origin:var_e31d6cb1});
	if(level.gameended === 1)
	{
		return 0;
	}
	result = self function_dede0607(1, killstreaktype);
	return result;
}

/*
	Name: function_26e7fb55
	Namespace: namespace_e8c18978
	Checksum: 0x36DBD046
	Offset: 0x16C8
	Size: 0x1B8
	Parameters: 3
	Flags: Linked, Private
*/
function private function_26e7fb55(var_d44b8c3e, var_1838351, startangles)
{
	startforward = anglestoforward(startangles);
	startforward = (startforward[0], startforward[1], 0);
	var_51cabd75 = 180 / 30;
	var_c8e01926 = undefined;
	var_37db735d = [];
	var_51c6fb78 = 0;
	forward = startforward;
	angles = startangles;
	var_f4f791a2 = startangles[1];
	while(var_51c6fb78 < var_51cabd75)
	{
		var_59a518e1 = [];
		var_90aa61b = var_d44b8c3e + (vectorscale(forward, -24000));
		var_b0490eb9 = getheliheightlockheight(var_90aa61b);
		var_35637e22 = var_b0490eb9 - var_1838351;
		if(var_35637e22 < 2000)
		{
			return angles[1];
		}
		if(!isdefined(var_c8e01926) || var_35637e22 < var_c8e01926)
		{
			var_c8e01926 = var_35637e22;
			var_f4f791a2 = angles[1];
		}
		angles = angles + (0, 30, 0);
		forward = anglestoforward(angles);
		var_51c6fb78++;
		waitframe(1);
	}
	return var_f4f791a2;
}

/*
	Name: function_696b3380
	Namespace: namespace_e8c18978
	Checksum: 0x6A92C761
	Offset: 0x1888
	Size: 0x142
	Parameters: 0
	Flags: Linked
*/
function function_696b3380()
{
	self endon(#"death");
	var_c6ac5940 = 1;
	while(true)
	{
		if(!var_c6ac5940 && randomint(100) < 10)
		{
			offsettime = 0.5;
			self pathvariableoffset(vectorscale((0, 0, 1), 90), offsettime);
			wait(offsettime - 0.1);
			var_c6ac5940 = 1;
		}
		else
		{
			offsettime = randomfloatrange(1, 3);
			var_fbe7ba4a = randomintrange(0, 30);
			var_24962759 = randomintrange(0, 50);
			self pathvariableoffset((0, var_fbe7ba4a, var_24962759), offsettime);
			var_c6ac5940 = 0;
			wait(offsettime * 2);
		}
	}
}

/*
	Name: function_dede0607
	Namespace: namespace_e8c18978
	Checksum: 0x9DBB998
	Offset: 0x19D8
	Size: 0x5B8
	Parameters: 2
	Flags: Linked
*/
function function_dede0607(isowner, killstreaktype)
{
	/#
		assert(isplayer(self));
	#/
	var_961b6686 = level.chopper_gunner;
	self forcestreambundle(#"chopper_gunner_door_open");
	streamermodelhint(var_961b6686.model, 7);
	self util::setusingremote("chopper_gunner");
	result = self killstreaks::init_ride_killstreak("chopper_gunner");
	if(result != "success")
	{
		if(result != "disconnect")
		{
			self killstreaks::clear_using_remote();
			killstreakslot = self killstreaks::function_a2c375bb(killstreaktype);
			self killstreaks::function_a831f92c(killstreakslot, 0, 0);
		}
		var_961b6686.failed2enter = 1;
		var_961b6686 function_71c46904(0);
		var_961b6686 function_f1d43cb2();
		return false;
	}
	if(isdefined(level.var_80f71aee))
	{
		self [[level.var_80f71aee]]();
	}
	self.var_5c5fca5 = 1;
	bundle = killstreaks::get_script_bundle("chopper_gunner");
	/#
		assert(isdefined(bundle));
	#/
	var_961b6686 clientfield::set("" + #"hash_4ddf67f7aa0f6884", 1);
	var_961b6686 thread scene::play(#"chopper_gunner_door_open");
	var_961b6686 setanim(#"hash_7483c325182bab52");
	var_df4a5052 = undefined;
	var_df4a5052 = var_961b6686 waittilltimeout(getanimlength(#"hash_7483c325182bab52") - (float(function_60d95f53()) / 1000), #"hash_623a20b6b2608171");
	var_961b6686 clearanim(#"hash_7483c325182bab52", 0.2);
	var_961b6686 clientfield::set("" + #"hash_4ddf67f7aa0f6884", 0);
	if(var_df4a5052._notify == #"hash_623a20b6b2608171")
	{
		var_961b6686 thread scene::stop(#"chopper_gunner_door_open");
		if(sessionmodeiszombiesgame())
		{
			var_961b6686 clientfield::set("" + #"hash_164696e86d29988d", 1);
		}
	}
	if(!isdefined(self) || var_df4a5052._notify != #"timeout")
	{
		function_cf58dcdd();
		return false;
	}
	var_961b6686 usevehicle(self, 2);
	var_961b6686.usage[self.entnum] = 1;
	var_961b6686 thread audio::sndupdatevehiclecontext(1);
	var_961b6686 thread vehicle::monitor_missiles_locked_on_to_me(self);
	if(var_961b6686.killstreak_timer_started)
	{
		self vehicle::set_vehicle_drivable_time(var_961b6686.killstreak_duration, var_961b6686.killstreak_end_time);
	}
	else
	{
		duration = (isdefined(bundle.ksduration) ? bundle.ksduration : 60000);
		self vehicle::set_vehicle_drivable_time(duration, gettime() + duration);
	}
	if(!is_true(level.var_f717967))
	{
		var_961b6686 thread watchplayerexitrequestthread(self);
	}
	self thread watchplayerteamchangethread(var_961b6686);
	self setmodellodbias((isdefined(level.mothership_lod_bias) ? level.mothership_lod_bias : 8));
	self givededicatedshadow(var_961b6686);
	self thread function_9bdafd36();
	return true;
}

/*
	Name: function_9bdafd36
	Namespace: namespace_e8c18978
	Checksum: 0x3AE32B3C
	Offset: 0x1F98
	Size: 0x82
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9bdafd36(var_8d7be67c)
{
	if(!isdefined(var_8d7be67c))
	{
		var_8d7be67c = 1.5;
	}
	self endon(#"disconnect", #"gunner_left");
	wait(var_8d7be67c);
	self.var_49f5e483 = self util::create_streamer_hint(self.origin, self.angles, 0.5, undefined, 0, 0);
}

/*
	Name: function_294e90d4
	Namespace: namespace_e8c18978
	Checksum: 0x6653ED66
	Offset: 0x2028
	Size: 0xAE
	Parameters: 1
	Flags: Linked
*/
function function_294e90d4(ents)
{
	ents[#"gunner"] hidefromplayer(level.chopper_gunner.owner);
	ents[#"fakearms"] hide();
	ents[#"fakearms"] showtoplayer(level.chopper_gunner.owner);
	level.chopper_gunner.gunner = ents[#"gunner"];
}

/*
	Name: function_4e4267e0
	Namespace: namespace_e8c18978
	Checksum: 0x8B187581
	Offset: 0x20E0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_4e4267e0(ents)
{
	ents[#"gunner"] linkto(level.chopper_gunner);
}

/*
	Name: init_shared
	Namespace: namespace_e8c18978
	Checksum: 0x2C2E13BC
	Offset: 0x2120
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	callback::on_connect(&onplayerconnect);
	level.chopper_gunner = undefined;
	if(!isdefined(level.var_e8fd1435))
	{
		level.var_e8fd1435 = 5000;
	}
}

/*
	Name: onplayerconnect
	Namespace: namespace_e8c18978
	Checksum: 0x18EF0ED4
	Offset: 0x2178
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function onplayerconnect()
{
	if(!isdefined(self.entnum))
	{
		self.entnum = self getentitynumber();
	}
}

/*
	Name: activatemaingunner
	Namespace: namespace_e8c18978
	Checksum: 0xD03665E8
	Offset: 0x21B0
	Size: 0x150
	Parameters: 1
	Flags: Linked
*/
function activatemaingunner(killstreaktype)
{
	attempts = 0;
	while(isdefined(level.chopper_gunner))
	{
		if(!self killstreakrules::iskillstreakallowed("chopper_gunner", self.team))
		{
			return 0;
		}
		if(isdefined(level.var_4cc7833a[#"chopper_gunner"]))
		{
			if(!self [[level.var_4cc7833a[#"chopper_gunner"]]]())
			{
				return 0;
			}
		}
		attempts++;
		if(attempts > 50)
		{
			return 0;
		}
		wait(0.1);
	}
	self val::set(#"hash_183e74582795a108", "freezecontrols");
	result = self [[level.var_2d4792e7]](killstreaktype);
	self val::reset(#"hash_183e74582795a108", "freezecontrols");
	if(level.gameended)
	{
		return 1;
	}
	if(!isdefined(result))
	{
		return 0;
	}
	return result;
}

/*
	Name: function_71c46904
	Namespace: namespace_e8c18978
	Checksum: 0x379E6CB1
	Offset: 0x2308
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function function_71c46904(var_2921b547)
{
	if(!isdefined(self))
	{
		return;
	}
	if(self.var_957d409b === 1)
	{
		return;
	}
	killstreakrules::killstreakstop(self.killstreaktype, self.originalteam, self.killstreak_id, var_2921b547);
	self.var_957d409b = 1;
	level.chopper_gunner = undefined;
}

/*
	Name: function_31d18ab9
	Namespace: namespace_e8c18978
	Checksum: 0x4D9EF5F7
	Offset: 0x2380
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_31d18ab9()
{
	self endon(#"death");
	wait(5);
	self function_71c46904();
}

/*
	Name: function_f1d43cb2
	Namespace: namespace_e8c18978
	Checksum: 0xC6588FDC
	Offset: 0x23C0
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_f1d43cb2(doexplosion)
{
	if(is_true(doexplosion))
	{
		self.var_f91f1564 = 1;
		self function_71c46904();
		function_cf58dcdd(self.owner, 0);
		self helicopter::function_e1058a3e();
		self notify(#"crash_done");
	}
	/#
		assert(self.var_957d409b === 1);
	#/
	self function_bc344300();
}

/*
	Name: function_bc344300
	Namespace: namespace_e8c18978
	Checksum: 0xF2156EE1
	Offset: 0x2490
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_bc344300()
{
	if(isdefined(self.flare_ent))
	{
		self.flare_ent delete();
	}
	if(isdefined(self.gunner))
	{
		self.gunner delete();
	}
	self helicopter::function_711c140b();
	self deletedelay();
}

/*
	Name: ontimeoutcallback
	Namespace: namespace_e8c18978
	Checksum: 0xFCC1C4D6
	Offset: 0x2520
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function ontimeoutcallback()
{
	if(!is_true(level.var_43da6545) && isdefined(level.chopper_gunner) && isdefined(level.chopper_gunner.owner))
	{
		function_cf58dcdd(level.chopper_gunner.owner);
	}
}

/*
	Name: ontimecheck
	Namespace: namespace_e8c18978
	Checksum: 0x11234139
	Offset: 0x2598
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function ontimecheck()
{
	self namespace_f9b02f80::play_pilot_dialog_on_owner("timecheck", "chopper_gunner", self.killstreak_id);
}

/*
	Name: function_c2bfa7e1
	Namespace: namespace_e8c18978
	Checksum: 0xCB28450
	Offset: 0x25D8
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function function_c2bfa7e1(ent, weapon)
{
	if(isdefined(weapon.var_7132bbb7))
	{
		return false;
	}
	if(weapon.leaving === 1)
	{
		return true;
	}
	if(weapon.shuttingdown === 1)
	{
		return false;
	}
	if(weapon.completely_shutdown === 1)
	{
		return false;
	}
	return true;
}

/*
	Name: watchplayerteamchangethread
	Namespace: namespace_e8c18978
	Checksum: 0xC4C15FD4
	Offset: 0x2658
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function watchplayerteamchangethread(var_961b6686)
{
	var_961b6686 notify(#"hash_1c0d4b0d44e3517");
	var_961b6686 endon(#"hash_1c0d4b0d44e3517", #"death");
	/#
		assert(isplayer(self));
	#/
	player = self;
	player endon(#"gunner_left");
	player waittill(#"joined_team", #"disconnect", #"joined_spectators");
	ownerleft = var_961b6686.ownerentnum == player.entnum;
	level thread function_cf58dcdd(player);
}

/*
	Name: watchplayerexitrequestthread
	Namespace: namespace_e8c18978
	Checksum: 0xFC74A847
	Offset: 0x2768
	Size: 0x1F2
	Parameters: 1
	Flags: Linked
*/
function watchplayerexitrequestthread(player)
{
	player notify(#"watchplayerexitrequestthread_singleton");
	player endon(#"watchplayerexitrequestthread_singleton");
	/#
		assert(isplayer(player));
	#/
	level endon(#"game_ended");
	player endon(#"disconnect", #"gunner_left");
	self endon(#"death");
	var_f6263fe2 = getdvarfloat(#"hash_2ed1b7031dae0df7", 0.5);
	while(true)
	{
		timeused = 0;
		player function_7deaa2a4(timeused);
		player function_9d62ff6c();
		while(player usebuttonpressed() && player killstreaks::function_59e2c378())
		{
			timeused = timeused + 0.05;
			player function_7deaa2a4(timeused / var_f6263fe2);
			if(timeused > var_f6263fe2)
			{
				self namespace_f9b02f80::play_pilot_dialog_on_owner("remoteOperatorRemoved", "chopper_gunner", self.killstreak_id);
				player thread function_cf58dcdd(player);
				return;
			}
			waitframe(1);
		}
		waitframe(1);
	}
}

/*
	Name: function_bfb33872
	Namespace: namespace_e8c18978
	Checksum: 0xB09D4D3A
	Offset: 0x2968
	Size: 0x1F4
	Parameters: 3
	Flags: Linked
*/
function function_bfb33872(var_961b6686, eattacker, weapon)
{
	if(target_istarget(var_961b6686))
	{
		target_remove(var_961b6686);
	}
	if(issentient(var_961b6686))
	{
		var_961b6686 function_60d50ea4();
	}
	var_961b6686.shuttingdown = 1;
	eattacker = self [[level.figure_out_attacker]](eattacker);
	if(isdefined(eattacker) && (!isdefined(var_961b6686.owner) || var_961b6686.owner util::isenemyplayer(eattacker)))
	{
		luinotifyevent(#"player_callout", 2, #"hash_5f3bf967cd47a97f", eattacker.entnum);
		challenges::destroyedaircraft(eattacker, weapon, 1, var_961b6686, 1);
		eattacker challenges::addflyswatterstat(weapon, var_961b6686);
		var_961b6686 killstreaks::function_73566ec7(eattacker, weapon, var_961b6686.owner);
		var_961b6686 namespace_f9b02f80::play_destroyed_dialog_on_owner("chopper_gunner", var_961b6686.killstreak_id);
		eattacker battlechatter::function_eebf94f6("chopper_gunner");
		eattacker stats::function_e24eec31(weapon, #"hash_3f3d8a93c372c67d", 1);
	}
	var_961b6686 thread function_80ae938e();
}

/*
	Name: function_aecfdb77
	Namespace: namespace_e8c18978
	Checksum: 0x183A8EBD
	Offset: 0x2B68
	Size: 0x4C
	Parameters: 6
	Flags: Linked
*/
function function_aecfdb77(brokennotify, eattacker, weapon, pieceindex, dir, mod)
{
	function_bfb33872(self, dir, mod);
}

/*
	Name: function_cf58dcdd
	Namespace: namespace_e8c18978
	Checksum: 0x26E49D41
	Offset: 0x2BC0
	Size: 0x350
	Parameters: 2
	Flags: Linked
*/
function function_cf58dcdd(player, var_a6648780)
{
	if(!isdefined(var_a6648780))
	{
		var_a6648780 = 1;
	}
	if(isbot(player))
	{
		player ai::set_behavior_attribute("control", "commander");
	}
	if(isdefined(player))
	{
		player vehicle::stop_monitor_missiles_locked_on_to_me();
		if(is_true(player.usingvehicle))
		{
			player unlink();
		}
		player setmodellodbias(0);
		player givededicatedshadow(player);
		player function_66b6e720(#"chopper_gunner_door_open");
		player notify(#"gunner_left");
		if(isdefined(player.var_49f5e483))
		{
			player.var_49f5e483 thread util::delayed_delete(3);
		}
		player.var_5c5fca5 = undefined;
		player killstreaks::clear_using_remote();
		player clientfield::set_to_player("" + #"hash_7c907650b14abbbe", 0);
		if(isdefined(level.var_399dc69a))
		{
			player [[level.var_399dc69a]]();
		}
	}
	if(!isdefined(level.chopper_gunner) || level.chopper_gunner.completely_shutdown === 1)
	{
		return;
	}
	level.chopper_gunner clientfield::set("vehicletransition", 0);
	level.chopper_gunner.shuttingdown = 1;
	level.chopper_gunner notify(#"gunner_left");
	level.chopper_gunner.hardpointtype = "chopper_gunner";
	level.chopper_gunner thread function_31d18ab9();
	level.chopper_gunner vehicle::get_off_path();
	level.chopper_gunner thread audio::sndupdatevehiclecontext(0);
	if(var_a6648780)
	{
		planedir = anglestoforward(level.chopper_gunner.angles);
		var_15f570c1 = level.chopper_gunner.origin + vectorscale(planedir, 30000);
		level.chopper_gunner thread helicopter::heli_leave(var_15f570c1, 1);
	}
	level.chopper_gunner.completely_shutdown = 1;
	level.chopper_gunner.shuttingdown = 0;
}

/*
	Name: function_ece62582
	Namespace: namespace_e8c18978
	Checksum: 0xCABE0ED5
	Offset: 0x2F18
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_ece62582()
{
	if(isdefined(self) && isdefined(self.owner))
	{
		org = self gettagorigin("tag_barrel");
		magnitude = 0.3;
		duration = 2;
		radius = 500;
		v_pos = self.origin;
		earthquake(magnitude, duration, org, 500);
		self playsound(#"hash_5314ffef2464b607");
	}
}

/*
	Name: function_77784598
	Namespace: namespace_e8c18978
	Checksum: 0xD068DA64
	Offset: 0x2FE8
	Size: 0x6FC
	Parameters: 15
	Flags: Linked
*/
function function_77784598(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	if(vpoint == "MOD_TRIGGER_HURT")
	{
		return 0;
	}
	if(self.shuttingdown)
	{
		return 0;
	}
	smeansofdeath = self killstreaks::ondamageperweapon("chopper_gunner", idflags, smeansofdeath, weapon, vpoint, vdir, self.maxhealth, undefined, self.maxhealth * 0.4, undefined, 0, undefined, 1, 1);
	if(smeansofdeath == 0)
	{
		return 0;
	}
	handleasrocketdamage = vpoint == "MOD_PROJECTILE" || vpoint == "MOD_EXPLOSIVE";
	if(handleasrocketdamage)
	{
		self function_ece62582();
		self playsound(#"hash_ddcd9d25e056016");
	}
	var_902cbab5 = self.health - smeansofdeath;
	if(self.damagestate < 1 && var_902cbab5 <= (self.maxhealth * 0.75))
	{
		var_5aca61fb = "damaged";
		self.damagestate = 1;
		if(isdefined(self.var_5efaff3e))
		{
			self clientfield::set("" + #"hash_46646871455cab15", 1);
		}
	}
	if(self.damagestate < 2 && self.health <= (self.maxhealth * 0.35))
	{
		var_5aca61fb = "damaged1";
		self.damagestate = 2;
		if(isdefined(self.var_ba5009c3))
		{
			self clientfield::set("" + #"hash_46646871455cab15", 2);
		}
	}
	if(isdefined(var_5aca61fb))
	{
		self namespace_f9b02f80::play_pilot_dialog_on_owner(var_5aca61fb, "chopper_gunner", self.killstreak_id);
	}
	if(self.health > 0 && var_902cbab5 <= 0 && !self.shuttingdown)
	{
		self.shuttingdown = 1;
		if(!sessionmodeiszombiesgame() && !isdefined(self.destroyscoreeventgiven) && isdefined(idflags) && (!isdefined(self.owner) || self.owner util::isenemyplayer(idflags)))
		{
			idflags = self [[level.figure_out_attacker]](idflags);
			luinotifyevent(#"player_callout", 2, #"hash_5f3bf967cd47a97f", idflags.entnum);
			self namespace_f9b02f80::play_destroyed_dialog_on_owner("chopper_gunner", self.killstreak_id);
			idflags battlechatter::function_eebf94f6("chopper_gunner");
			challenges::destroyedaircraft(idflags, vdir, 1, self, 1);
			idflags challenges::addflyswatterstat(vdir, self);
			idflags stats::function_e24eec31(vdir, #"hash_3f3d8a93c372c67d", 1);
			self.destroyscoreeventgiven = 1;
		}
		if(isdefined(self.owner))
		{
			if(isdefined(vdir))
			{
				self.owner killstreaks::function_4aad9803("chopper_gunner", self.killstreak_id, vdir);
			}
			self.owner killstreaks::function_e9873ef7("chopper_gunner", self.killstreak_id, #"hash_47e685e10dcee57");
		}
		if(isdefined(idamage) && idamage getentitytype() == 4)
		{
			bundle = killstreaks::get_script_bundle("chopper_gunner");
			if(isdefined(bundle.var_888a5ff7) && isdefined(shitloc))
			{
				var_74d40edb = idamage getvelocity();
				if(lengthsquared(var_74d40edb) > sqr(50))
				{
					var_29edfc10 = vectornormalize(var_74d40edb);
					playfx(bundle.var_888a5ff7, shitloc, var_29edfc10, undefined, undefined, self.team);
				}
			}
		}
		self.var_d02ddb8e = vdir;
		params = {#partname:vsurfacenormal, #modelindex:partname, #damagefromunderneath:modelindex, #psoffsettime:damagefromunderneath, #shitloc:psoffsettime, #vdir:vdamageorigin, #vpoint:shitloc, #weapon:vdir, #smeansofdeath:vpoint, #idflags:weapon, #idamage:smeansofdeath, #eattacker:idflags, #einflictor:idamage};
		self callback::callback(#"on_vehicle_damage", params);
		self thread function_80ae938e(shitloc, vdamageorigin);
		return 0;
	}
	return smeansofdeath;
}

/*
	Name: function_80ae938e
	Namespace: namespace_e8c18978
	Checksum: 0xB23674AD
	Offset: 0x36F0
	Size: 0x114
	Parameters: 2
	Flags: Linked
*/
function function_80ae938e(point, dir)
{
	if(self.leave_by_damage_initiated === 1)
	{
		return;
	}
	self.leave_by_damage_initiated = 1;
	if(target_istarget(self))
	{
		target_remove(self);
	}
	if(issentient(self))
	{
		self function_60d50ea4();
	}
	self thread vehicle_death::helicopter_crash(point, dir, 2.75);
	self clientfield::set("" + #"hash_6cf1a3b26118d892", 1);
	self waittilltimeout(2.25, #"death");
	function_cf58dcdd(self.owner, 0);
}

/*
	Name: function_53d3b37a
	Namespace: namespace_e8c18978
	Checksum: 0x6D99558D
	Offset: 0x3810
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function function_53d3b37a(bundle)
{
	if(isdefined(level.var_fcad39fb))
	{
		self.killstreak_duration = level.var_fcad39fb;
	}
	else
	{
		self.killstreak_duration = (isdefined(bundle.ksduration) ? bundle.ksduration : 60000);
	}
	self.killstreak_end_time = gettime() + self.killstreak_duration;
	self.killstreakendtime = int(self.killstreak_end_time);
	self thread killstreaks::waitfortimeout("chopper_gunner", self.killstreak_duration, &ontimeoutcallback, "delete", "death");
	self thread killstreaks::waitfortimecheck(self.killstreak_duration / 2, &ontimecheck, "delete", "death", "gunner_left");
	self.killstreak_timer_started = 1;
	self updatedrivabletimeforalloccupants(self.killstreak_duration, self.killstreak_end_time);
}

/*
	Name: updatedrivabletimeforalloccupants
	Namespace: namespace_e8c18978
	Checksum: 0xB0103FE
	Offset: 0x3960
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function updatedrivabletimeforalloccupants(duration_ms, end_time_ms)
{
	if(isdefined(self.owner))
	{
		self.owner vehicle::set_vehicle_drivable_time(duration_ms, end_time_ms);
	}
}

/*
	Name: function_631f02c5
	Namespace: namespace_e8c18978
	Checksum: 0x56518C64
	Offset: 0x39A8
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_631f02c5()
{
	self endon(#"killed");
	self.var_a1719a05 = (isdefined(self.var_a1719a05) ? self.var_a1719a05 : 0) + 1;
	wait(2.5);
	if(!isdefined(self))
	{
		return;
	}
	self function_568f6426();
}

/*
	Name: function_568f6426
	Namespace: namespace_e8c18978
	Checksum: 0x182A11AB
	Offset: 0x3A18
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_568f6426()
{
	switch(self.var_a1719a05)
	{
		case 0:
		{
			break;
		}
		case 1:
		{
			dialogkey = "kill1";
			break;
		}
		case 2:
		{
			dialogkey = "kill2";
			break;
		}
		case 3:
		{
			dialogkey = "kill3";
			break;
		}
		default:
		{
			dialogkey = "killMultiple";
		}
	}
	self.var_a1719a05 = 0;
	if(isdefined(dialogkey) && self.owner.killstreakdialogqueue.size === 0)
	{
		self namespace_f9b02f80::play_pilot_dialog_on_owner(dialogkey, "chopper_gunner", self.killstreak_id);
	}
}

