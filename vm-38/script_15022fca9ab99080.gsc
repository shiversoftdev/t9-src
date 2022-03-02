#using script_1d1a97b78f64bfd;
#using script_2c74a7b5eea1ec89;
#using script_2dc48f46bfeac894;
#using script_3395cf41e5900492;
#using script_383a3b1bb18ba876;
#using script_4721de209091b1a6;
#using script_47fb62300ac0bd60;
#using script_4a03c204316cf33;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using script_79a7e1c31a3e8cc;
#using scripts\core_common\audio_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;

#namespace namespace_231aa29a;

/*
	Name: function_2ae60b5f
	Namespace: namespace_231aa29a
	Checksum: 0x65F50736
	Offset: 0x250
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2ae60b5f()
{
	level notify(1285085880);
}

/*
	Name: function_155de655
	Namespace: namespace_231aa29a
	Checksum: 0xBC404562
	Offset: 0x270
	Size: 0x194
	Parameters: 1
	Flags: None
*/
function function_155de655(bundle)
{
	killstreaks::register_bundle(bundle, &function_79942f1f);
	remote_weapons::registerremoteweapon(bundle.var_1ab696c6.name, #"", &function_c9aa9ee5, &function_8cb72281, 0);
	remote_weapons::registerremoteweapon(bundle.var_fc0c8eae.name, #"", &function_c9aa9ee5, &function_8cb72281, 0);
	vehicle::add_main_callback(bundle.ksvehicle, &init_vehicle);
	deployable::function_2e088f73(bundle.var_1ab696c6, undefined, undefined);
	deployable::function_2e088f73(bundle.var_fc0c8eae, undefined, undefined);
	level.killstreaks[bundle.var_d3413870].var_b6c17aab = 1;
	if(isdefined(bundle.var_486124e6))
	{
		visionset_mgr::register_info("overlay", bundle.var_486124e6, 1, 1, 1, 1);
	}
}

/*
	Name: init_vehicle
	Namespace: namespace_231aa29a
	Checksum: 0x18E48469
	Offset: 0x410
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function init_vehicle(var_19e1140)
{
	vehicle = self;
	vehicle clientfield::set("enemyvehicle", 1);
	vehicle clientfield::set("scorestreakActive", 1);
	vehicle.allowfriendlyfiredamageoverride = &function_e9da8b7d;
	vehicle enableaimassist();
	vehicle setdrawinfrared(1);
	vehicle.delete_on_death = 1;
	vehicle.death_enter_cb = &function_3c6cec8b;
	vehicle.disableremoteweaponswitch = 1;
	vehicle.overridevehicledamage = &on_damage;
	vehicle.overridevehiclekilled = &on_death;
	vehicle.watch_remote_weapon_death = 1;
	vehicle.watch_remote_weapon_death_duration = 0.3;
	vehicle.var_19e1140 = var_19e1140;
	vehicle util::function_c596f193();
}

/*
	Name: function_3c6cec8b
	Namespace: namespace_231aa29a
	Checksum: 0xC460546C
	Offset: 0x550
	Size: 0xDA
	Parameters: 0
	Flags: Linked
*/
function function_3c6cec8b()
{
	remote_controlled = is_true(self.control_initiated) || is_true(self.controlled);
	if(remote_controlled)
	{
		notifystring = undefined;
		notifystring = self waittill(#"remote_weapon_end", #"shutdown");
		if(notifystring._notify == "remote_weapon_end")
		{
			self waittill(#"shutdown");
		}
		else
		{
			self waittill(#"remote_weapon_end");
		}
	}
	else
	{
		self waittill(#"shutdown");
	}
}

/*
	Name: function_aba709c3
	Namespace: namespace_231aa29a
	Checksum: 0x94FC9819
	Offset: 0x638
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_aba709c3(hacker)
{
	vehicle = self;
	vehicle clientfield::set("toggle_lights", 1);
	vehicle.owner unlink();
	vehicle clientfield::set("vehicletransition", 0);
	vehicle.owner killstreaks::clear_using_remote();
	vehicle makevehicleunusable();
}

/*
	Name: function_2df6e3bf
	Namespace: namespace_231aa29a
	Checksum: 0xB9B81BE2
	Offset: 0x6E8
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function function_2df6e3bf(hacker)
{
	killstreak_type = level.var_8997324c[self];
	bundle = level.killstreaks[killstreak_type].script_bundle;
	weapon = level.killstreaks[killstreak_type].weapon;
	vehicle = self;
	hacker remote_weapons::useremoteweapon(vehicle, weapon, 1, 0);
	vehicle makevehicleunusable();
	vehicle killstreaks::set_killstreak_delay_killcam(killstreak_type);
	vehicle killstreak_hacking::set_vehicle_drivable_time_starting_now(vehicle);
}

/*
	Name: function_fff56140
	Namespace: namespace_231aa29a
	Checksum: 0x899A9480
	Offset: 0x7D0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_fff56140(owner)
{
	self endon(#"shutdown");
	self killstreaks::function_fff56140(owner, &function_822e1f64);
}

/*
	Name: function_5e2ea3ef
	Namespace: namespace_231aa29a
	Checksum: 0xB7F7364F
	Offset: 0x828
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function function_5e2ea3ef(owner, ishacked)
{
	self thread function_fff56140(ishacked);
}

/*
	Name: function_c9ef365d
	Namespace: namespace_231aa29a
	Checksum: 0x397CB147
	Offset: 0x860
	Size: 0x7E
	Parameters: 1
	Flags: None
*/
function function_c9ef365d(placement)
{
	if(!isdefined(placement))
	{
		return false;
	}
	if(!self isonground())
	{
		return false;
	}
	if(self util::isusingremote())
	{
		return false;
	}
	if(killstreaks::is_interacting_with_object())
	{
		return false;
	}
	if(self oob::istouchinganyoobtrigger())
	{
		return false;
	}
	return true;
}

/*
	Name: function_79942f1f
	Namespace: namespace_231aa29a
	Checksum: 0x50F6ECAF
	Offset: 0x8E8
	Size: 0x4D0
	Parameters: 1
	Flags: Linked
*/
function function_79942f1f(type)
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	if(!player killstreakrules::iskillstreakallowed(type, player.team))
	{
		return false;
	}
	if(player usebuttonpressed())
	{
		return false;
	}
	bundle = level.killstreaks[type].script_bundle;
	weapon = level.killstreaks[type].weapon;
	if(isdefined(weapon) && is_true(weapon.deployable) && !deployable::function_b3d993e9(weapon, 1))
	{
		return false;
	}
	killstreak_id = player killstreakrules::killstreakstart(type, player.team, 0, 1);
	if(killstreak_id == -1)
	{
		return false;
	}
	vehicle = spawnvehicle(bundle.ksvehicle, player.var_b8878ba9, player.var_ddc03e10, type, 0, player);
	vehicle setowner(player);
	vehicle deployable::function_dd266e08(player);
	vehicle killstreaks::configure_team(type, killstreak_id, player, "small_vehicle", undefined, &function_5e2ea3ef);
	vehicle killstreak_hacking::enable_hacking(type, &function_aba709c3, &function_2df6e3bf);
	vehicle.damagetaken = 0;
	vehicle.abandoned = 0;
	vehicle.killstreak_id = killstreak_id;
	vehicle.activatingkillstreak = 1;
	vehicle ghost();
	vehicle thread watch_shutdown(player, type);
	vehicle.health = bundle.kshealth;
	vehicle.maxhealth = bundle.kshealth;
	vehicle.hackedhealth = bundle.kshackedhealth;
	vehicle.hackedhealthupdatecallback = &function_f07460c5;
	vehicle.ignore_vehicle_underneath_splash_scalar = 1;
	if(isdefined(weapon))
	{
		vehicle setweapon(weapon);
		vehicle.weapon = weapon;
	}
	vehicle killstreak_bundles::spawned(bundle);
	self thread namespace_f9b02f80::play_killstreak_start_dialog(type, self.team, killstreak_id);
	self stats::function_e24eec31(weapon, #"used", 1);
	if(isdefined(vehicle.var_19e1140))
	{
		vehicle [[vehicle.var_19e1140]]();
	}
	remote_weapons::useremoteweapon(vehicle, weapon.name, 1, 0);
	if(!isdefined(player) || !isalive(player) || is_true(player.laststand))
	{
		if(isdefined(vehicle))
		{
			vehicle notify(#"remote_weapon_shutdown");
			vehicle function_1f46c433();
		}
		return false;
	}
	if(!isdefined(vehicle))
	{
		return false;
	}
	vehicle show();
	vehicle.activatingkillstreak = 0;
	target_set(vehicle);
	ability_player::function_c22f319e(weapon);
	vehicle thread watch_game_ended();
	vehicle waittill(#"death");
	vehicle function_11fa7e00(type, vehicle.originalteam, killstreak_id);
	return true;
}

/*
	Name: function_11fa7e00
	Namespace: namespace_231aa29a
	Checksum: 0xC11B113F
	Offset: 0xDC0
	Size: 0x62
	Parameters: 4
	Flags: Linked
*/
function function_11fa7e00(killstreak_type, original_team, killstreak_id, start_cooldown)
{
	if(self.var_b8f3aeed !== 1)
	{
		self killstreakrules::killstreakstop(killstreak_type, original_team, killstreak_id, start_cooldown);
		self.var_b8f3aeed = 1;
	}
}

/*
	Name: function_f07460c5
	Namespace: namespace_231aa29a
	Checksum: 0xFDA99C80
	Offset: 0xE30
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function function_f07460c5(hacker)
{
	vehicle = self;
	if(vehicle.health > vehicle.hackedhealth)
	{
		vehicle.health = vehicle.hackedhealth;
	}
}

/*
	Name: function_c9aa9ee5
	Namespace: namespace_231aa29a
	Checksum: 0xCF3CCDE0
	Offset: 0xE78
	Size: 0x1CC
	Parameters: 1
	Flags: Linked
*/
function function_c9aa9ee5(vehicle)
{
	player = self;
	vehicle usevehicle(player, 0);
	vehicle clientfield::set("vehicletransition", 1);
	vehicle thread audio::sndupdatevehiclecontext(1);
	vehicle thread watch_timeout();
	vehicle thread function_2cee4434();
	vehicle thread function_22528515();
	vehicle thread function_73cb1549();
	player vehicle::set_vehicle_drivable_time_starting_now(int(vehicle.var_22a05c26.ksduration));
	if(isdefined(vehicle.var_22a05c26.var_486124e6))
	{
		visionset_mgr::activate("overlay", vehicle.var_22a05c26.var_486124e6, player, 1, 90000, 1);
	}
	if(isbot(self))
	{
		if(isdefined(vehicle.killstreaktype) && (vehicle.killstreaktype == "recon_car" || vehicle.killstreaktype == "inventory_recon_car"))
		{
			self thread function_88d23aaa(vehicle);
		}
	}
}

/*
	Name: function_88d23aaa
	Namespace: namespace_231aa29a
	Checksum: 0x2F4721F9
	Offset: 0x1050
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function function_88d23aaa(vehicle)
{
	var_8eaf8b3c = vehicle.overridevehiclekilled;
	vehicle thread rcxd::function_91ea9492();
	vehicle vehicle_ai::get_state_callbacks("death").update_func = undefined;
	vehicle.overridevehiclekilled = var_8eaf8b3c;
}

/*
	Name: function_8cb72281
	Namespace: namespace_231aa29a
	Checksum: 0xC4A5F136
	Offset: 0x10C0
	Size: 0xE4
	Parameters: 2
	Flags: Linked
*/
function function_8cb72281(vehicle, exitrequestedbyowner)
{
	if(exitrequestedbyowner == 0)
	{
		vehicle thread audio::sndupdatevehiclecontext(0);
	}
	if(isdefined(vehicle.var_22a05c26.var_486124e6))
	{
		visionset_mgr::deactivate("overlay", vehicle.var_22a05c26.var_486124e6, vehicle.owner);
	}
	vehicle clientfield::set("vehicletransition", 0);
	function_68a07849(vehicle.weapon, self.remoteowner);
	if(exitrequestedbyowner == 0)
	{
		vehicle function_1f46c433();
	}
}

/*
	Name: function_2cee4434
	Namespace: namespace_231aa29a
	Checksum: 0x7559470E
	Offset: 0x11B0
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_2cee4434()
{
	vehicle = self;
	vehicle endon(#"shutdown", #"death");
	while(is_true(level.var_46f4865d))
	{
		waitframe(1);
	}
	while(vehicle.activatingkillstreak)
	{
		waitframe(1);
	}
	while(!(isdefined(vehicle.owner) && (vehicle.owner attackbuttonpressed() || vehicle.owner vehicleattackbuttonpressed()) && vehicle.owner killstreaks::function_59e2c378()))
	{
		waitframe(1);
	}
	if(isdefined(vehicle.var_62b033f0))
	{
		vehicle thread [[vehicle.var_62b033f0]]();
	}
	vehicle function_1f46c433();
}

/*
	Name: function_2ff466f
	Namespace: namespace_231aa29a
	Checksum: 0xF63C2DE5
	Offset: 0x12E8
	Size: 0xDA
	Parameters: 0
	Flags: None
*/
function function_2ff466f()
{
	vehicle = self;
	vehicle endon(#"shutdown", #"death");
	while(true)
	{
		timeused = 0;
		while(vehicle.owner usebuttonpressed() && vehicle.owner killstreaks::function_59e2c378())
		{
			timeused = timeused + level.var_9fee970c;
			if(timeused >= 250)
			{
				vehicle function_1f46c433();
				return;
			}
			waitframe(1);
		}
		waitframe(1);
	}
}

/*
	Name: function_e99d09a3
	Namespace: namespace_231aa29a
	Checksum: 0x2BA4FE90
	Offset: 0x13D0
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_e99d09a3()
{
	self endon(#"shutdown");
	inwater = 0;
	while(!inwater)
	{
		wait(0.5);
		trace = physicstrace(self.origin + vectorscale((0, 0, 1), 10), self.origin + vectorscale((0, 0, 1), 6), vectorscale((-1, -1, -1), 2), vectorscale((1, 1, 1), 2), self, 4);
		inwater = trace[#"fraction"] < 1;
	}
	self function_822e1f64();
}

/*
	Name: function_73cb1549
	Namespace: namespace_231aa29a
	Checksum: 0x64B4C4F9
	Offset: 0x14B0
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function function_73cb1549()
{
	self endon(#"shutdown");
	var_8a7edebd = 10;
	inwater = 0;
	while(!inwater)
	{
		wait(0.5);
		depth = getwaterheight(self.origin) - self.origin[2];
		inwater = depth > var_8a7edebd;
	}
	if(isdefined(self.owner) && isdefined(self.var_22a05c26.var_d3413870))
	{
		self.owner killstreaks::function_e9873ef7(self.var_22a05c26.var_d3413870, self.killstreak_id, #"hash_614e3e677f840d98");
	}
	self function_822e1f64();
}

/*
	Name: watch_timeout
	Namespace: namespace_231aa29a
	Checksum: 0x8CD764C6
	Offset: 0x15C0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function watch_timeout()
{
	vehicle = self;
	bundle = vehicle.var_22a05c26;
	vehicle thread killstreaks::waitfortimeout(bundle.var_d3413870, bundle.ksduration, &function_1f46c433, "shutdown");
}

/*
	Name: function_822e1f64
	Namespace: namespace_231aa29a
	Checksum: 0xA3213106
	Offset: 0x1628
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_822e1f64()
{
	vehicle = self;
	vehicle.abandoned = 1;
	vehicle function_1f46c433();
}

/*
	Name: function_1f46c433
	Namespace: namespace_231aa29a
	Checksum: 0x7C3000A7
	Offset: 0x1668
	Size: 0x28
	Parameters: 0
	Flags: Linked
*/
function function_1f46c433()
{
	vehicle = self;
	vehicle notify(#"shutdown");
}

/*
	Name: function_68a07849
	Namespace: namespace_231aa29a
	Checksum: 0x27F4DB24
	Offset: 0x1698
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_68a07849(weapon, driver)
{
	if(isdefined(driver))
	{
		var_4dd90b81 = 0;
		driver ability_player::function_f2250880(weapon, var_4dd90b81);
	}
}

/*
	Name: watch_shutdown
	Namespace: namespace_231aa29a
	Checksum: 0xC1E9C4CA
	Offset: 0x16E8
	Size: 0x1B4
	Parameters: 2
	Flags: Linked
*/
function watch_shutdown(driver, killstreaktype)
{
	vehicle = self;
	vehicle endon(#"death");
	vehicle waittill(#"shutdown");
	bundle = vehicle.var_22a05c26;
	if(isdefined(vehicle.activatingkillstreak) && vehicle.activatingkillstreak)
	{
		vehicle notify(#"remote_weapon_shutdown");
		vehicle function_11fa7e00(bundle.var_d3413870, vehicle.originalteam, vehicle.killstreak_id, 0);
		vehicle function_1f46c433();
		vehicle deletedelay();
	}
	else
	{
		if(level.gameended === 1)
		{
			vehicle function_11fa7e00(bundle.var_d3413870, vehicle.originalteam, vehicle.killstreak_id);
			if(isdefined(vehicle))
			{
				vehicle deletedelay();
			}
		}
		else
		{
			vehicle thread function_584fb7a3();
			vehicle notify(#"remote_weapon_shutdown");
		}
	}
	function_68a07849(vehicle.weapon, killstreaktype);
}

/*
	Name: function_584fb7a3
	Namespace: namespace_231aa29a
	Checksum: 0x97F755FE
	Offset: 0x18A8
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function function_584fb7a3()
{
	vehicle = self;
	vehicle endon(#"death");
	if(!is_true(vehicle.remote_weapon_end))
	{
		vehicle waittill(#"remote_weapon_end", #"hash_59b25025ce93a142");
	}
	attacker = (isdefined(vehicle.owner) ? vehicle.owner : undefined);
	vehicle dodamage(vehicle.health + 1, vehicle.origin + vectorscale((0, 0, 1), 10), attacker, attacker, "none", "MOD_EXPLOSIVE", 0);
}

/*
	Name: function_22528515
	Namespace: namespace_231aa29a
	Checksum: 0x1F69C757
	Offset: 0x19A0
	Size: 0xD8
	Parameters: 0
	Flags: Linked
*/
function function_22528515()
{
	vehicle = self;
	vehicle endon(#"shutdown");
	while(true)
	{
		waitresult = undefined;
		waitresult = vehicle waittill(#"touch");
		ent = waitresult.entity;
		if(isdefined(ent.classname) && (ent.classname == "trigger_hurt" || (ent.classname == "trigger_out_of_bounds" && vehicle.var_a6ab9a09 !== 1)))
		{
			vehicle function_1f46c433();
		}
	}
}

/*
	Name: on_damage
	Namespace: namespace_231aa29a
	Checksum: 0x2BDD59F1
	Offset: 0x1A80
	Size: 0x1AC
	Parameters: 15
	Flags: Linked
*/
function on_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	if(is_true(self.activatingkillstreak))
	{
		return 0;
	}
	if(!isdefined(psoffsettime) || !isdefined(self.owner) || psoffsettime != self.owner)
	{
		bundle = self.var_22a05c26;
		damagefromunderneath = killstreaks::ondamageperweapon(bundle.var_d3413870, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal, self.maxhealth, undefined, self.maxhealth * 0.4, undefined, 0, undefined, 1, 1);
	}
	if(isdefined(psoffsettime) && isdefined(psoffsettime.team) && util::function_fbce7263(psoffsettime.team, self.team))
	{
		if(vsurfacenormal.isemp)
		{
			self.damage_on_death = 0;
			self.died_by_emp = 1;
			damagefromunderneath = self.health + 1;
		}
	}
	return damagefromunderneath;
}

/*
	Name: on_death
	Namespace: namespace_231aa29a
	Checksum: 0xCCA71810
	Offset: 0x1C38
	Size: 0x294
	Parameters: 8
	Flags: Linked
*/
function on_death(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime)
{
	vehicle = self;
	player = vehicle.owner;
	player endon(#"disconnect", #"joined_team", #"joined_spectators");
	bundle = self.var_22a05c26;
	var_7d4f75e = (isdefined(vehicle.var_7d4f75e) ? vehicle.var_7d4f75e : 0);
	var_a9911aeb = bundle.var_d3413870;
	var_a8527b41 = vehicle.originalteam;
	var_ebe66d84 = vehicle.killstreak_id;
	vehicle killstreaks::function_67bc25ec();
	vehicle clientfield::set("enemyvehicle", 0);
	if(isdefined(vehicle.var_a0f50ca8))
	{
		vehicle thread [[vehicle.var_a0f50ca8]]();
	}
	vehicle explode(shitloc, psoffsettime);
	var_2105be53 = (vehicle.died_by_emp === 1 ? 0.2 : (isdefined(vehicle.var_20c65a3e) ? vehicle.var_20c65a3e : 0.2));
	if(isdefined(player))
	{
		player val::set(#"hash_7412aa1ce117e2a5", "freezecontrols");
		vehicle thread function_de865657(var_2105be53);
		wait(0.2);
		player val::reset(#"hash_7412aa1ce117e2a5", "freezecontrols");
	}
	else
	{
		vehicle thread function_de865657(var_2105be53);
	}
	if(isdefined(vehicle))
	{
		vehicle function_1f46c433();
	}
}

/*
	Name: watch_game_ended
	Namespace: namespace_231aa29a
	Checksum: 0x93D7448
	Offset: 0x1ED8
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function watch_game_ended()
{
	vehicle = self;
	vehicle endon(#"death");
	level waittill(#"game_ended");
	vehicle.selfdestruct = 1;
	vehicle function_822e1f64();
}

/*
	Name: function_de865657
	Namespace: namespace_231aa29a
	Checksum: 0x76C9911F
	Offset: 0x1F48
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function function_de865657(waittime)
{
	self endon(#"death");
	wait(waittime);
	self ghost();
	self.var_4217cfcb = 1;
}

/*
	Name: vehicle_death
	Namespace: namespace_231aa29a
	Checksum: 0xCE7A6044
	Offset: 0x1FA0
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function vehicle_death()
{
	self vehicle_death::death_fx();
	self thread vehicle_death::death_radius_damage();
	self thread vehicle_death::set_death_model(self.deathmodel, self.modelswapdelay);
	self vehicle::toggle_tread_fx(0);
	self vehicle::toggle_exhaust_fx(0);
	self vehicle::toggle_sounds(0);
	self vehicle::lights_off();
}

/*
	Name: explode
	Namespace: namespace_231aa29a
	Checksum: 0x79A0DC7C
	Offset: 0x2068
	Size: 0x3B0
	Parameters: 2
	Flags: Linked
*/
function explode(attacker, weapon)
{
	self endon(#"death");
	owner = self.owner;
	if(!isdefined(attacker) && isdefined(owner))
	{
		attacker = owner;
	}
	attacker = self [[level.figure_out_attacker]](attacker);
	self vehicle_death();
	var_d3213f00 = 0;
	var_3906173b = isdefined(weapon) && weapon.name === "gadget_icepick";
	if(!is_true(self.abandoned) && isplayer(attacker))
	{
		bundle = self.var_22a05c26;
		if(util::function_fbce7263(self.team, attacker.team))
		{
			var_d3213f00 = 1;
			if(isdefined(bundle))
			{
				attacker challenges::function_1d2c16bb(weapon, self, bundle.var_ebc402ca);
				self killstreaks::function_73566ec7(attacker, weapon, owner);
				luinotifyevent(#"player_callout", 2, bundle.var_cbe3d7de, attacker.entnum);
				if(isdefined(weapon) && weapon.isvalid)
				{
					level.globalkillstreaksdestroyed++;
					attacker stats::function_e24eec31(self.weapon, #"destroyed", 1);
					attacker stats::function_e24eec31(self.weapon, #"destroyed_controlled_killstreak", 1);
					self.owner killstreaks::function_4aad9803(bundle.var_d3413870, self.killstreak_id, weapon);
				}
				if(!var_3906173b)
				{
					self namespace_f9b02f80::play_destroyed_dialog_on_owner(bundle.var_d3413870, self.killstreak_id);
					attacker battlechatter::function_eebf94f6(bundle.var_d3413870, weapon);
				}
				self.owner killstreaks::function_e9873ef7(bundle.var_d3413870, self.killstreak_id, #"hash_47e685e10dcee57");
			}
		}
	}
	if(oob::istouchinganyoobtrigger() && !var_d3213f00 && !var_3906173b)
	{
		self.owner killstreaks::function_e9873ef7(bundle.var_d3413870, self.killstreak_id, #"hash_7e23b3e299f4835b");
	}
	if(isdefined(bundle) && isdefined(bundle.var_bb6c29b4) && isdefined(weapon) && weapon == getweapon(#"shock_rifle"))
	{
		playfx(bundle.var_bb6c29b4, self.origin);
	}
	return var_d3213f00;
}

/*
	Name: function_e9da8b7d
	Namespace: namespace_231aa29a
	Checksum: 0xABFB9B7C
	Offset: 0x2420
	Size: 0x70
	Parameters: 4
	Flags: Linked
*/
function function_e9da8b7d(einflictor, eattacker, smeansofdeath, weapon)
{
	if(isdefined(weapon) && weapon == self.owner)
	{
		return true;
	}
	if(isdefined(smeansofdeath) && smeansofdeath islinkedto(self))
	{
		return true;
	}
	return false;
}

/*
	Name: function_e94c2667
	Namespace: namespace_231aa29a
	Checksum: 0x6155B9DE
	Offset: 0x2498
	Size: 0x76
	Parameters: 0
	Flags: Linked
*/
function function_e94c2667()
{
	startheight = 50;
	switch(self getstance())
	{
		case "crouch":
		{
			startheight = 30;
			break;
		}
		case "prone":
		{
			startheight = 15;
			break;
		}
	}
	return startheight;
}

/*
	Name: function_d75fbe15
	Namespace: namespace_231aa29a
	Checksum: 0xE93368D5
	Offset: 0x2518
	Size: 0x40E
	Parameters: 2
	Flags: None
*/
function function_d75fbe15(origin, angles)
{
	startheight = function_e94c2667();
	mins = vectorscale((-1, -1, 0), 5);
	maxs = (5, 5, 10);
	startpoints = [];
	startangles = [];
	wheelcounts = [];
	testcheck = [];
	largestcount = 0;
	largestcountindex = 0;
	testangles = [];
	testangles[0] = (0, 0, 0);
	testangles[1] = vectorscale((0, 1, 0), 20);
	testangles[2] = vectorscale((0, -1, 0), 20);
	testangles[3] = vectorscale((0, 1, 0), 45);
	testangles[4] = vectorscale((0, -1, 0), 45);
	heightoffset = 5;
	for(i = 0; i < testangles.size; i++)
	{
		testcheck[i] = 0;
		startangles[i] = (0, angles[1], 0);
		startpoint = origin + (vectorscale(anglestoforward(startangles[i] + testangles[i]), 70));
		endpoint = startpoint - vectorscale((0, 0, 1), 100);
		startpoint = startpoint + (0, 0, startheight);
		mask = 1 | 2;
		trace = physicstrace(startpoint, endpoint, mins, maxs, self, mask);
		if(isdefined(trace[#"entity"]) && isplayer(trace[#"entity"]))
		{
			wheelcounts[i] = 0;
			continue;
		}
		startpoints[i] = trace[#"position"] + (0, 0, heightoffset);
		wheelcounts[i] = function_c82e14d2(startpoints[i], startangles[i], heightoffset);
		if(positionwouldtelefrag(startpoints[i]))
		{
			continue;
		}
		if(largestcount < wheelcounts[i])
		{
			largestcount = wheelcounts[i];
			largestcountindex = i;
		}
		if(wheelcounts[i] >= 3)
		{
			testcheck[i] = 1;
			if(function_b4682bd6(startpoints[i], startangles[i]))
			{
				placement = spawnstruct();
				placement.origin = startpoints[i];
				placement.angles = startangles[i];
				return placement;
			}
		}
	}
	for(i = 0; i < testangles.size; i++)
	{
		if(!testcheck[i])
		{
			if(wheelcounts[i] >= 2)
			{
				if(function_b4682bd6(startpoints[i], startangles[i]))
				{
					placement = spawnstruct();
					placement.origin = startpoints[i];
					placement.angles = startangles[i];
					return placement;
				}
			}
		}
	}
	return undefined;
}

/*
	Name: function_c82e14d2
	Namespace: namespace_231aa29a
	Checksum: 0x84B77FE3
	Offset: 0x2930
	Size: 0x1CE
	Parameters: 3
	Flags: Linked
*/
function function_c82e14d2(origin, angles, heightoffset)
{
	forward = 13;
	side = 10;
	wheels = [];
	wheels[0] = (forward, side, 0);
	wheels[1] = (forward, -1 * side, 0);
	wheels[2] = (-1 * forward, -1 * side, 0);
	wheels[3] = (-1 * forward, side, 0);
	height = 5;
	touchcount = 0;
	yawangles = (0, angles[1], 0);
	for(i = 0; i < 4; i++)
	{
		wheel = rotatepoint(wheels[i], yawangles);
		startpoint = origin + wheel;
		endpoint = startpoint + (0, 0, -1 * height - heightoffset);
		startpoint = startpoint + (0, 0, height - heightoffset);
		trace = bullettrace(startpoint, endpoint, 0, self);
		if(trace[#"fraction"] < 1)
		{
			touchcount++;
		}
	}
	return touchcount;
}

/*
	Name: function_b4682bd6
	Namespace: namespace_231aa29a
	Checksum: 0x3AAF073
	Offset: 0x2B08
	Size: 0x1F6
	Parameters: 2
	Flags: Linked
*/
function function_b4682bd6(origin, angles)
{
	liftedorigin = angles + vectorscale((0, 0, 1), 5);
	size = 12;
	height = 15;
	mins = (-1 * size, -1 * size, 0);
	maxs = (size, size, height);
	absmins = liftedorigin + mins;
	absmaxs = liftedorigin + maxs;
	if(boundswouldtelefrag(absmins, absmaxs))
	{
		return false;
	}
	startheight = function_e94c2667();
	mask = (1 | 2) | 4;
	trace = physicstrace(liftedorigin, angles + (0, 0, 1), mins, maxs, self, mask);
	if(trace[#"fraction"] < 1)
	{
		return false;
	}
	size = 2.5;
	height = size * 2;
	mins = (-1 * size, -1 * size, 0);
	maxs = (size, size, height);
	sweeptrace = physicstrace(self.origin + (0, 0, startheight), liftedorigin, mins, maxs, self, mask);
	if(sweeptrace[#"fraction"] < 1)
	{
		return false;
	}
	return true;
}

/*
	Name: function_d4896942
	Namespace: namespace_231aa29a
	Checksum: 0x9077A2B5
	Offset: 0x2D08
	Size: 0xFA
	Parameters: 3
	Flags: Linked
*/
function function_d4896942(bundle, killstreakname, var_9be50a25)
{
	self endon(#"death", var_9be50a25);
	self.var_7132bbb7 = undefined;
	while(true)
	{
		self waittill(#"hash_63404ad70a51f8ca");
		self playsound(#"hash_713a3ce01967434e");
		self.var_7132bbb7 = 1;
		self namespace_f9b02f80::play_pilot_dialog_on_owner("damageEvaded", killstreakname, self.killstreak_id);
		self.var_b6286a42 = gettime() + 5000;
		wait((isdefined(bundle.var_2eeb71d2) ? bundle.var_2eeb71d2 : 5));
		self.var_7132bbb7 = undefined;
	}
}

/*
	Name: function_31f9c728
	Namespace: namespace_231aa29a
	Checksum: 0x74D3EBFF
	Offset: 0x2E10
	Size: 0xD0
	Parameters: 5
	Flags: Linked
*/
function function_31f9c728(bundle, killstreakname, var_61bbac7a, var_2f984f68, var_9be50a25)
{
	self endon(#"death", var_9be50a25);
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"stinger_fired_at_me");
		if(isdefined(waitresult.projectile))
		{
			self thread function_849819e9(waitresult.projectile, bundle, killstreakname, var_61bbac7a);
			self thread function_6650cc9c(waitresult.projectile, bundle, killstreakname, var_2f984f68);
		}
	}
}

/*
	Name: function_849819e9
	Namespace: namespace_231aa29a
	Checksum: 0x40DDD9CD
	Offset: 0x2EE8
	Size: 0x1DC
	Parameters: 4
	Flags: Linked
*/
function function_849819e9(missile, bundle, killstreakname, var_61bbac7a)
{
	/#
		assert(isentity(missile));
	#/
	/#
		assert(isstruct(bundle));
	#/
	/#
		assert(isdefined(var_61bbac7a));
	#/
	if(!isdefined(self))
	{
		return;
	}
	missile endon(#"death");
	var_d1fb4ef3 = (isdefined(bundle.var_7d5e1fc0) ? bundle.var_7d5e1fc0 : 0.75);
	while(isdefined(self.owner) && self.owner util::function_63d27d4e(killstreakname))
	{
		dist = distance(missile.origin, self.origin);
		velocity = missile getvelocity();
		missile_dir = vectornormalize(velocity);
		missile_speed = vectordot(missile_dir, velocity);
		if(missile_speed > 0)
		{
			if(dist < missile_speed * var_d1fb4ef3)
			{
				self playsoundtoplayer(var_61bbac7a, self.owner);
				return;
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_6650cc9c
	Namespace: namespace_231aa29a
	Checksum: 0xD1820B74
	Offset: 0x30D0
	Size: 0x2E0
	Parameters: 4
	Flags: Linked
*/
function function_6650cc9c(missile, bundle, killstreakname, var_2f984f68)
{
	/#
		assert(isentity(missile));
	#/
	/#
		assert(isstruct(bundle));
	#/
	/#
		assert(isdefined(var_2f984f68));
	#/
	if(!isdefined(self))
	{
		return;
	}
	missile endon(#"death");
	wait(0.2);
	if(isdefined(self.var_b6286a42) && self.var_b6286a42 < gettime())
	{
		self namespace_f9b02f80::play_pilot_dialog_on_owner("incomingMissile", killstreakname, self.killstreak_id);
		self.var_b6286a42 = gettime() + 5000;
	}
	neardist = (isdefined(bundle.var_4004fbc) ? bundle.var_4004fbc : 10);
	fardist = (isdefined(bundle.var_364ccfdc) ? bundle.var_364ccfdc : 100);
	range = fardist - neardist;
	if(range < 0)
	{
		return;
	}
	var_6f2344f0 = (isdefined(bundle.var_9fb2ddca) ? bundle.var_9fb2ddca : 0.05);
	var_cd12ce4c = (isdefined(bundle.var_6e3967de) ? bundle.var_6e3967de : 0.05);
	dist = undefined;
	while(isdefined(self.owner) && self.owner util::function_63d27d4e(killstreakname))
	{
		old_dist = dist;
		dist = distance(missile.origin, self.origin);
		var_38fa5914 = isdefined(old_dist) && dist < old_dist;
		if(var_38fa5914)
		{
			self playsoundtoplayer(var_2f984f68, self.owner);
		}
		var_6ce65309 = (dist - neardist) / range;
		beep_interval = lerpfloat(var_6f2344f0, var_cd12ce4c, var_6ce65309);
		wait(beep_interval);
	}
}

