#using script_2c49ae69cd8ce30c;
#using script_335d0650ed05d36d;
#using script_b9a55edd207e4ca;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\round.gsc;

#namespace namespace_3f3933bc;

/*
	Name: main
	Namespace: namespace_3f3933bc
	Checksum: 0xAF33DA26
	Offset: 0x300
	Size: 0x1FC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_2938acdc::init();
	function_2c1beb43();
	spawning::addsupportedspawnpointtype("ctf");
	level.var_d98635d9 = [];
	level.planttime = getgametypesetting(#"planttime");
	level.defusetime = getgametypesetting(#"defusetime");
	level.bombtimer = getgametypesetting(#"bombtimer");
	level.var_43c634a2 = (-175, 0, 40);
	setdvar(#"hash_681d6d4c82e4d32b", -175);
	setdvar(#"hash_681d6c4c82e4d178", 0);
	setdvar(#"hash_681d6f4c82e4d691", 40);
	setdvar(#"hash_7079ae3ce3222c01", 78);
	setdvar(#"hash_7079ad3ce3222a4e", 0);
	setdvar(#"hash_7079ac3ce322289b", 0);
	setdvar(#"hash_75bbabbef2106dda", 0.19);
	/#
		thread function_13bb0660();
	#/
}

/*
	Name: function_59ce3baf
	Namespace: namespace_3f3933bc
	Checksum: 0x5AEDFB88
	Offset: 0x508
	Size: 0x174
	Parameters: 1
	Flags: None
*/
function function_59ce3baf(points)
{
	/#
		println("");
		foreach(point in points)
		{
			println(((((((((((("" + point.origin[0]) + "") + point.origin[1]) + "") + point.origin[2]) + "") + point.angles[0]) + "") + point.angles[1]) + "") + point.angles[2]) + "");
		}
		println("");
	#/
}

/*
	Name: function_13bb0660
	Namespace: namespace_3f3933bc
	Checksum: 0xF8FDFFE9
	Offset: 0x688
	Size: 0x132
	Parameters: 0
	Flags: None
*/
function function_13bb0660()
{
	/#
		var_45724e62 = [];
		var_5305039c = 0;
		while(!isdefined(level.players) || level.players.size == 0)
		{
			waitframe(1);
		}
		me = level.players[0];
		while(true)
		{
			if(me jumpbuttonpressed() && !var_5305039c)
			{
				var_5305039c = 1;
				point = spawnstruct();
				point.origin = me.origin;
				point.angles = me.angles;
				var_45724e62[var_45724e62.size] = point;
				function_59ce3baf(var_45724e62);
			}
			else if(!me jumpbuttonpressed() && var_5305039c)
			{
				var_5305039c = 0;
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_4427fb0e
	Namespace: namespace_3f3933bc
	Checksum: 0x26B61BE8
	Offset: 0x7C8
	Size: 0x1CA
	Parameters: 0
	Flags: None
*/
function function_4427fb0e()
{
	while(true)
	{
		var_38ae3e91 = (getdvarfloat(#"hash_681d6d4c82e4d32b", 0), getdvarfloat(#"hash_681d6c4c82e4d178", 0), getdvarfloat(#"hash_681d6f4c82e4d691", 0));
		currentangles = (getdvarfloat(#"hash_7079ae3ce3222c01", 0), getdvarfloat(#"hash_7079ad3ce3222a4e", 0), getdvarfloat(#"hash_7079ac3ce322289b", 0));
		foreach(var_8a15325a in level.var_d98635d9)
		{
			missile = var_8a15325a.var_974e7341;
			missile setscale(getdvarfloat(#"hash_75bbabbef2106dda", 0.12));
			missile linktoupdateoffset(var_38ae3e91, currentangles);
		}
		waitframe(1);
	}
}

/*
	Name: function_c89d0204
	Namespace: namespace_3f3933bc
	Checksum: 0xFAA41848
	Offset: 0x9A0
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event function_c89d0204(eventstruct)
{
	function_ba34436e();
	function_38411346();
	function_e23fea8c();
}

/*
	Name: level_finalizeinit
	Namespace: namespace_3f3933bc
	Checksum: 0x8C644D1A
	Offset: 0x9E8
	Size: 0x1C
	Parameters: 1
	Flags: Event
*/
event level_finalizeinit(eventstruct)
{
	level.alwaysusestartspawns = 1;
}

/*
	Name: function_ba34436e
	Namespace: namespace_3f3933bc
	Checksum: 0xAEAFE88C
	Offset: 0xA10
	Size: 0xA0
	Parameters: 0
	Flags: None
*/
function function_ba34436e()
{
	var_5f5158cd = struct::get_array("icbm_truck_spawn", "targetname");
	if(isdefined(var_5f5158cd) || var_5f5158cd.size == 0)
	{
		var_5f5158cd = level.var_9fa97bd9;
	}
	if(isdefined(var_5f5158cd))
	{
		for(index = 0; index < var_5f5158cd.size; index++)
		{
			level.var_d98635d9[index] = function_d33f46a4(var_5f5158cd[index], index);
		}
	}
}

/*
	Name: function_def22e6
	Namespace: namespace_3f3933bc
	Checksum: 0x4955B7B2
	Offset: 0xAB8
	Size: 0x94
	Parameters: 3
	Flags: None
*/
function function_def22e6(vehiclename, var_ef96b237, var_b48a7d49)
{
	if(!isdefined(level.var_ed091a74))
	{
		level.var_ed091a74 = [];
	}
	var_f673e666 = spawnstruct();
	var_f673e666.def = vehiclename;
	var_f673e666.origin = var_ef96b237;
	var_f673e666.angles = var_b48a7d49;
	level.var_ed091a74[level.var_ed091a74.size] = var_f673e666;
}

/*
	Name: function_38411346
	Namespace: namespace_3f3933bc
	Checksum: 0x5A473E08
	Offset: 0xB58
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function function_38411346()
{
	foreach(spawnpoint in level.var_ed091a74)
	{
		vehicle = spawnvehicle(spawnpoint.def, spawnpoint.origin, spawnpoint.angles);
		vehicle makeusable();
	}
}

/*
	Name: function_9e4ca5a0
	Namespace: namespace_3f3933bc
	Checksum: 0x95769F82
	Offset: 0xC20
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_9e4ca5a0(vehicle)
{
	vehicle vehicle::toggle_tread_fx(0);
	vehicle vehicle::toggle_exhaust_fx(0);
	vehicle vehicle::toggle_sounds(0);
	vehicle vehicle::lights_off();
}

/*
	Name: function_e63cb1e4
	Namespace: namespace_3f3933bc
	Checksum: 0xDD5B499E
	Offset: 0xC98
	Size: 0x23C
	Parameters: 8
	Flags: None
*/
function function_e63cb1e4(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime)
{
	level endon(#"game_ended");
	function_9e4ca5a0(self);
	objective_delete(self.var_b09e50c3);
	gameobjects::release_obj_id(self.var_b09e50c3);
	self.var_b09e50c3 = undefined;
	if(isdefined(self.var_31cac59e))
	{
		self.var_31cac59e gameobjects::disable_object(1, 1, 0, 1);
		self.var_31cac59e = undefined;
	}
	else if(isdefined(self.var_643933de))
	{
		self.var_643933de gameobjects::disable_object(1, 1, 0, 1);
		self.var_643933de = undefined;
	}
	arrayremovevalue(level.var_d98635d9, self);
	arrayremovevalue(level.var_d98635d9, undefined, 0);
	var_930c4da9 = 1;
	if(level.var_d98635d9.size != 0)
	{
		foreach(truck in level.var_d98635d9)
		{
			if(isdefined(truck.var_31cac59e))
			{
				var_930c4da9 = 0;
				break;
			}
		}
	}
	if(var_930c4da9 == 1)
	{
		globallogic::function_a3e3bd39(game.defenders, 1);
	}
}

/*
	Name: function_67d3750a
	Namespace: namespace_3f3933bc
	Checksum: 0xA138931B
	Offset: 0xEE0
	Size: 0x82
	Parameters: 13
	Flags: None
*/
function function_67d3750a(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, iboneindex, imodelindex)
{
	return int(imodelindex);
}

/*
	Name: missiledeath
	Namespace: namespace_3f3933bc
	Checksum: 0x63E65FB9
	Offset: 0xF70
	Size: 0x198
	Parameters: 0
	Flags: None
*/
function missiledeath()
{
	level endon(#"game_ended");
	waitresult = undefined;
	waitresult = self waittill(#"death");
	if(!isdefined(self))
	{
		return;
	}
	playfx("killstreaks/fx9_napalm_bomb_exp", self.origin);
	radiusdamage(self.origin, 1000, 1000, 1000);
	if(isdefined(self.truck))
	{
		self.truck dodamage(10000, self.origin);
	}
	self delete();
	foreach(player in level.players)
	{
		if(player.team == game.attackers)
		{
			player iprintlnbold("Missile Destroyed! Protect them!");
			continue;
		}
		player iprintlnbold("Missile Destroyed! Keep fighting!");
	}
}

/*
	Name: function_d33f46a4
	Namespace: namespace_3f3933bc
	Checksum: 0xD1B8BA3A
	Offset: 0x1110
	Size: 0x218
	Parameters: 2
	Flags: None
*/
function function_d33f46a4(spawnpoint, index)
{
	vehicle = spawnvehicle("veh_t9_mil_truck_hemtt_cargo_wz", spawnpoint.origin, spawnpoint.angles);
	vehicle makeusable();
	vehicle.var_b09e50c3 = gameobjects::get_next_obj_id();
	objective_add(vehicle.var_b09e50c3, "active", vehicle, #"hash_3f89a8c368d3848a");
	function_c939fac4(vehicle.var_b09e50c3, game.defenders);
	vehicle.overridevehiclekilled = &function_e63cb1e4;
	missile = spawn("script_model", spawnpoint.origin);
	missile setmodel("p8_nt4_missile_soviet_full");
	missile setscale(getdvarfloat(#"hash_75bbabbef2106dda", 0.19));
	vehicle.var_974e7341 = missile;
	missile.takedamage = 1;
	missile.health = 100;
	missile.var_86a21346 = &function_67d3750a;
	missile linkto(vehicle, "tag_interior_d0", level.var_43c634a2, vectorscale((1, 0, 0), 78));
	missile.var_f990f05b = 78;
	missile.truck = vehicle;
	missile thread missiledeath();
	thread function_f4ad14e2(vehicle, index);
	return vehicle;
}

/*
	Name: function_f4ad14e2
	Namespace: namespace_3f3933bc
	Checksum: 0x7D3473EE
	Offset: 0x1330
	Size: 0x2A2
	Parameters: 2
	Flags: None
*/
function function_f4ad14e2(vehicle, index)
{
	level endon(#"game_ended");
	vehicle endon(#"death");
	wait(10);
	upangle = vectorscale(vectornormalize(anglestoup(vehicle.angles)), 5);
	var_a5435776 = spawn("trigger_radius_use", vehicle.origin + upangle, 0, 128, 200);
	var_a5435776 setcursorhint("HINT_INTERACTIVE_PROMPT");
	var_31b5f1bc = gameobjects::create_use_object(game.attackers, var_a5435776, [], undefined, #"hash_7c8dfdab6fd04459" + index, 1, 1, 1);
	var_31b5f1bc gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	var_31b5f1bc gameobjects::allow_use(#"hash_150a20fa4efc5c7a");
	var_31b5f1bc gameobjects::set_use_time(level.planttime);
	var_31b5f1bc gameobjects::set_use_text(#"hash_f8bea24436ad636");
	var_31b5f1bc gameobjects::set_use_hint_text(#"hash_6b32950ab833923e");
	var_31b5f1bc.useweapon = getweapon(#"briefcase_bomb");
	var_31b5f1bc.vehicle = vehicle;
	var_31b5f1bc.onbeginuse = &function_52c4c9b7;
	var_31b5f1bc.onuseclear = &onuseclear;
	var_31b5f1bc.onuseupdate = &onuseupdate;
	var_31b5f1bc.onenduse = &function_8b7fb0f0;
	var_31b5f1bc.onuse = &function_9aad61da;
	var_31b5f1bc thread function_4be0e7c4(vehicle, var_31b5f1bc);
	vehicle.var_31cac59e = var_31b5f1bc;
}

/*
	Name: function_4be0e7c4
	Namespace: namespace_3f3933bc
	Checksum: 0xBCA8FFD1
	Offset: 0x15E0
	Size: 0x12C
	Parameters: 2
	Flags: None
*/
function function_4be0e7c4(vehicle, var_d282b6f0)
{
	level endon(#"game_ended", #"hash_49c22a5bcf6de27d");
	vehicle endon(#"death");
	while(isdefined(var_d282b6f0))
	{
		vehicle waittill(#"enter_vehicle");
		var_d282b6f0 gameobjects::set_visible(#"hash_161f03feaadc9b8f");
		var_d282b6f0.interrupted = 1;
		var_d282b6f0.trigger triggerenable(0);
		while(isdefined(var_d282b6f0) && isdefined(var_d282b6f0.interrupted))
		{
			vehicle waittill(#"exit_vehicle");
			if(vehicle getvehoccupants().size == 0)
			{
				thread function_706c8105(vehicle, var_d282b6f0);
			}
		}
	}
}

/*
	Name: function_bc2f89f7
	Namespace: namespace_3f3933bc
	Checksum: 0x49D15C7E
	Offset: 0x1718
	Size: 0x132
	Parameters: 4
	Flags: None
*/
function function_bc2f89f7(truck, endtime, var_3ff0d499, var_172fbf6f)
{
	truck endon(#"death");
	totaltime = endtime - gettime();
	missile = truck.var_974e7341;
	var_d223b230 = (var_3ff0d499 - missile.var_f990f05b) / totaltime;
	lasttime = gettime();
	truck.var_9a2087f6 = 0;
	while(gettime() < endtime)
	{
		var_cbc2cea3 = gettime() - lasttime;
		missile.var_f990f05b = (var_cbc2cea3 * var_d223b230) + missile.var_f990f05b;
		angles = (missile.var_f990f05b, 0, 0);
		missile linktoupdateoffset(level.var_43c634a2, angles);
		lasttime = gettime();
		waitframe(1);
	}
	if(isdefined(var_172fbf6f))
	{
		[[var_172fbf6f]](truck);
	}
}

/*
	Name: function_706c8105
	Namespace: namespace_3f3933bc
	Checksum: 0x3A818E7
	Offset: 0x1858
	Size: 0x136
	Parameters: 2
	Flags: None
*/
function function_706c8105(vehicle, var_d282b6f0)
{
	level endon(#"game_ended");
	vehicle endon(#"death", #"enter_vehicle");
	while(vehicle.vehspeed != 0)
	{
		waitframe(1);
	}
	var_e07c7e8 = physicstrace(vehicle.origin, vehicle.origin + vectorscale((0, 0, 1), 10000), (0, 0, 0), (0, 0, 0), vehicle, 1);
	if(var_e07c7e8[#"fraction"] < 1)
	{
		return;
	}
	var_d282b6f0 gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	var_d282b6f0.interrupted = undefined;
	var_d282b6f0.trigger triggerenable(1);
	var_d282b6f0.trigger.origin = vehicle.origin;
}

/*
	Name: function_52c4c9b7
	Namespace: namespace_3f3933bc
	Checksum: 0x74BD4EA6
	Offset: 0x1998
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_52c4c9b7(player)
{
	player.isplanting = 1;
	player thread setbomboverheatingafterweaponchange(self, 0, 0);
	objective_setplayerusing(self.objectiveid, player);
}

/*
	Name: function_8b7fb0f0
	Namespace: namespace_3f3933bc
	Checksum: 0x29C760B9
	Offset: 0x19F0
	Size: 0x2E
	Parameters: 3
	Flags: None
*/
function function_8b7fb0f0(team, player, result)
{
	player.isplanting = 0;
}

/*
	Name: function_9aad61da
	Namespace: namespace_3f3933bc
	Checksum: 0xE7E69FBB
	Offset: 0x1A28
	Size: 0xDA
	Parameters: 1
	Flags: None
*/
function function_9aad61da(player)
{
	thread function_bc2f89f7(self.vehicle, gettime() + (int(20 * 1000)), 0, &function_bad0ccc5);
	self.vehicle makeunusable();
	objective_setstate(self.vehicle.var_b09e50c3, "invisible");
	self gameobjects::set_flags(1);
	self gameobjects::clear_progress();
	self.onuse = &function_a0595047;
}

/*
	Name: function_a0595047
	Namespace: namespace_3f3933bc
	Checksum: 0xDEF21BF4
	Offset: 0x1B10
	Size: 0x234
	Parameters: 1
	Flags: None
*/
function function_a0595047(player)
{
	if(isdefined(self) && isdefined(self.vehicle))
	{
		if(self.vehicle.var_9a2087f6 === 1)
		{
			firemissile(self.vehicle);
			function_71db2f7c(self.vehicle, self);
			player setweaponoverheating(1, 100, self.useweapon);
			level.var_3653c98 = (int(level.timelimit) * (int(60 * 1000))) - gettime();
			level.timelimitoverride = 1;
			setgameendtime(gettime() + (int(level.bombtimer * 1000)));
			thread bombtimerwait();
			self gameobjects::clear_progress();
			self gameobjects::allow_use(#"hash_33c49a99551acae7");
			self.onbeginuse = &function_a8c87bae;
			self.onenduse = &function_46031620;
			self.onuse = &onusedefuseobject;
		}
		else
		{
			self.vehicle.var_9a2087f6 = 0;
			self gameobjects::allow_use(#"hash_161f03feaadc9b8f");
			function_bc2f89f7(self.vehicle, gettime() + (int(10 * 1000)), 78, &function_7b550339);
		}
	}
}

/*
	Name: function_bad0ccc5
	Namespace: namespace_3f3933bc
	Checksum: 0x175693B0
	Offset: 0x1D50
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_bad0ccc5(truck)
{
	truck.var_9a2087f6 = 1;
	truck.var_31cac59e gameobjects::set_flags(2);
}

/*
	Name: function_7b550339
	Namespace: namespace_3f3933bc
	Checksum: 0x15855752
	Offset: 0x1D98
	Size: 0xD2
	Parameters: 1
	Flags: None
*/
function function_7b550339(truck)
{
	truck.var_31cac59e gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	truck.var_31cac59e gameobjects::allow_use(#"hash_150a20fa4efc5c7a");
	truck.var_31cac59e gameobjects::set_flags(0);
	truck makeusable();
	objective_setstate(truck.var_b09e50c3, "active");
	truck.var_31cac59e.onuse = &function_9aad61da;
}

/*
	Name: onuseupdate
	Namespace: namespace_3f3933bc
	Checksum: 0xAFB6C0E2
	Offset: 0x1E78
	Size: 0x54
	Parameters: 3
	Flags: None
*/
function onuseupdate(team, progress, change)
{
	objective_setprogress(self.objectiveid, math::clamp(change, 0, 1));
}

/*
	Name: onuseclear
	Namespace: namespace_3f3933bc
	Checksum: 0xB0B85678
	Offset: 0x1ED8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function onuseclear()
{
	objective_setprogress(self.objectiveid, 0);
}

/*
	Name: function_87e3d154
	Namespace: namespace_3f3933bc
	Checksum: 0xCE8BE356
	Offset: 0x1F00
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_87e3d154(vehicle)
{
	thread function_bc2f89f7(self.vehicle, gettime() + (int(10 * 1000)), 0, &firemissile);
}

/*
	Name: firemissile
	Namespace: namespace_3f3933bc
	Checksum: 0xD80E3864
	Offset: 0x1F60
	Size: 0x1D0
	Parameters: 1
	Flags: None
*/
function firemissile(vehicle)
{
	missile = vehicle.var_974e7341;
	missile unlink();
	lasttime = gettime();
	fxorg = spawn("script_model", (0, 0, 0));
	fxorg setmodel(#"tag_origin");
	fxorg linkto(missile, undefined, (0, 0, 0), vectorscale((1, 0, 0), 90));
	playfxontag("_t7/dlc1/castle/fx_rocket_exhaust_takeoff", fxorg, "tag_origin");
	missile moveto(missile.origin + vectorscale((0, 0, 1), 60000), 60, 10);
	foreach(player in level.players)
	{
		if(player.team == game.attackers)
		{
			player iprintlnbold("Nuclear Launch Detected! Defend the launch truck!");
			continue;
		}
		player iprintlnbold("Nuclear Launch Detected! Destroy the launch truck!");
	}
}

/*
	Name: setbomboverheatingafterweaponchange
	Namespace: namespace_3f3933bc
	Checksum: 0x146DA41D
	Offset: 0x2138
	Size: 0xBC
	Parameters: 3
	Flags: None
*/
function setbomboverheatingafterweaponchange(useobject, overheated, heat)
{
	self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators");
	waitresult = undefined;
	waitresult = self waittill(#"weapon_change");
	if(waitresult.weapon == useobject.useweapon)
	{
		self setweaponoverheating(overheated, heat, waitresult.weapon);
	}
}

/*
	Name: function_ca9b286c
	Namespace: namespace_3f3933bc
	Checksum: 0x794BDC0
	Offset: 0x2200
	Size: 0x94
	Parameters: 1
	Flags: Event
*/
event function_ca9b286c(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	vehicle = eventstruct.vehicle;
	if(!isdefined(vehicle.scriptvehicletype) || vehicle.scriptvehicletype != "player_hemtt")
	{
		return;
	}
	if(vehicle.var_b09e50c3)
	{
		objective_setstate(vehicle.var_b09e50c3, "invisible");
	}
}

/*
	Name: function_e011eea6
	Namespace: namespace_3f3933bc
	Checksum: 0xD2CA22E3
	Offset: 0x22A0
	Size: 0x94
	Parameters: 1
	Flags: Event
*/
event function_e011eea6(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	vehicle = eventstruct.vehicle;
	if(!isdefined(vehicle.scriptvehicletype) || vehicle.scriptvehicletype != "player_hemtt")
	{
		return;
	}
	if(vehicle.var_b09e50c3)
	{
		objective_setstate(vehicle.var_b09e50c3, "active");
	}
}

/*
	Name: bombtimerwait
	Namespace: namespace_3f3933bc
	Checksum: 0xE12E7C30
	Offset: 0x2340
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function bombtimerwait()
{
	level endon(#"game_ended", #"bomb_defused");
	wait(level.bombtimer);
	globallogic::function_a3e3bd39(game.attackers, 1);
}

/*
	Name: function_71db2f7c
	Namespace: namespace_3f3933bc
	Checksum: 0x80CABBAF
	Offset: 0x23A0
	Size: 0x38E
	Parameters: 2
	Flags: None
*/
function function_71db2f7c(vehicle, var_31cac59e)
{
	function_9e4ca5a0(var_31cac59e);
	objective_delete(var_31cac59e.var_b09e50c3);
	gameobjects::release_obj_id(var_31cac59e.var_b09e50c3);
	var_31cac59e.var_b09e50c3 = undefined;
	var_31cac59e.var_31cac59e = undefined;
	level notify(#"hash_49c22a5bcf6de27d");
	foreach(truck in level.var_d98635d9)
	{
		if(isdefined(truck.var_31cac59e))
		{
			truck.var_31cac59e gameobjects::set_visible(#"hash_161f03feaadc9b8f");
			truck.var_31cac59e gameobjects::allow_use(#"hash_161f03feaadc9b8f");
		}
	}
	upangle = vectorscale(vectornormalize(anglestoup(var_31cac59e.angles)), 5);
	var_83b8a489 = spawn("trigger_radius_use", var_31cac59e.origin + upangle, 0, 128, 200);
	var_83b8a489 setcursorhint("HINT_INTERACTIVE_PROMPT");
	defuseobject = gameobjects::create_use_object(game.attackers, var_83b8a489, [], undefined, #"hash_12ac522cdf799e82", 1, 1, 1);
	defuseobject gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	defuseobject gameobjects::allow_use(#"hash_33c49a99551acae7");
	defuseobject gameobjects::set_use_time(level.defusetime);
	defuseobject gameobjects::set_use_text(#"hash_c01b634e9ce264c");
	defuseobject gameobjects::set_use_hint_text(#"hash_754b795109a2bbba");
	defuseobject.useweapon = getweapon(#"briefcase_bomb_defuse");
	defuseobject.vehicle = var_31cac59e;
	defuseobject.onbeginuse = &function_a8c87bae;
	defuseobject.onuseclear = &onuseclear;
	defuseobject.onuseupdate = &onuseupdate;
	defuseobject.onenduse = &function_46031620;
	defuseobject.onuse = &onusedefuseobject;
	var_31cac59e.var_643933de = defuseobject;
}

/*
	Name: function_a8c87bae
	Namespace: namespace_3f3933bc
	Checksum: 0x34C0D5A3
	Offset: 0x2738
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_a8c87bae(player)
{
	player.isdefusing = 1;
	player thread setbomboverheatingafterweaponchange(self, 0, 0);
	objective_setplayerusing(self.objectiveid, player);
}

/*
	Name: function_46031620
	Namespace: namespace_3f3933bc
	Checksum: 0xAFB9444C
	Offset: 0x2790
	Size: 0x2E
	Parameters: 3
	Flags: None
*/
function function_46031620(team, player, result)
{
	player.isdefusing = 0;
}

/*
	Name: onusedefuseobject
	Namespace: namespace_3f3933bc
	Checksum: 0xED89F6F4
	Offset: 0x27C8
	Size: 0x1CC
	Parameters: 1
	Flags: None
*/
function onusedefuseobject(player)
{
	level notify(#"bomb_defused");
	var_611dc78e = 1;
	foreach(truck in level.var_d98635d9)
	{
		if(isdefined(truck.var_31cac59e))
		{
			truck.var_31cac59e gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
			truck.var_31cac59e gameobjects::allow_use(#"hash_150a20fa4efc5c7a");
			thread function_4be0e7c4(truck, truck.var_31cac59e);
			var_611dc78e = 0;
		}
	}
	player setweaponoverheating(1, 100, self.useweapon);
	level.timelimitoverride = 1;
	setgameendtime(gettime() + level.var_3653c98);
	self gameobjects::disable_object(1, 1, 0, 1);
	if(var_611dc78e == 1)
	{
		globallogic::function_a3e3bd39(game.defenders, 1);
	}
}

/*
	Name: function_9e90b881
	Namespace: namespace_3f3933bc
	Checksum: 0x910FE611
	Offset: 0x29A0
	Size: 0x60
	Parameters: 2
	Flags: None
*/
function function_9e90b881(origin, angles)
{
	var_8a15325a = spawnstruct();
	var_8a15325a.origin = origin;
	var_8a15325a.angles = angles;
	level.var_9fa97bd9[level.var_9fa97bd9.size] = var_8a15325a;
}

/*
	Name: function_2c1beb43
	Namespace: namespace_3f3933bc
	Checksum: 0x5F16887D
	Offset: 0x2A08
	Size: 0x17C
	Parameters: 0
	Flags: None
*/
function function_2c1beb43()
{
	level.var_9fa97bd9 = [];
	function_9e90b881((-19900, -49089, 2997), vectorscale((0, -1, 0), 90));
	function_9e90b881((-20400, -49089, 2997), vectorscale((0, -1, 0), 90));
	function_9e90b881((-20900, -49089, 2997), vectorscale((0, -1, 0), 90));
	function_def22e6("vehicle_t9_mil_ru_heli_gunship_hind_wz", (50465.9, 19295.1, 1800), vectorscale((0, -1, 0), 176.501));
	function_def22e6("vehicle_t9_mil_ru_heli_gunship_hind_wz", (47928, 19284.9, 1800), vectorscale((0, -1, 0), 169.711));
	function_def22e6("vehicle_t9_mil_ru_heli_gunship_hind_wz", (49064.3, 19295.3, 1800), vectorscale((0, -1, 0), 174.644));
	function_def22e6("vehicle_t9_mil_ru_heli_gunship_hind_wz", (46682.5, 20315.4, 1820), vectorscale((0, -1, 0), 88.9069));
}

/*
	Name: function_329ef588
	Namespace: namespace_3f3933bc
	Checksum: 0xA26560B
	Offset: 0x2B90
	Size: 0x98
	Parameters: 2
	Flags: None
*/
function function_329ef588(origin, angles)
{
	if(!isdefined(level.var_c25f98d5))
	{
		level.var_c25f98d5 = [];
	}
	spawnpoint = spawnstruct();
	spawnpoint.origin = origin;
	spawnpoint.angles = angles;
	spawnpoint._human_were = 1;
	spawnpoint.ctf = 1;
	level.var_c25f98d5[level.var_c25f98d5.size] = spawnpoint;
}

/*
	Name: function_307d5f67
	Namespace: namespace_3f3933bc
	Checksum: 0x6B6770AB
	Offset: 0x2C30
	Size: 0x98
	Parameters: 2
	Flags: None
*/
function function_307d5f67(origin, angles)
{
	if(!isdefined(level.var_75ef9e74))
	{
		level.var_75ef9e74 = [];
	}
	spawnpoint = spawnstruct();
	spawnpoint.origin = origin;
	spawnpoint.angles = angles;
	spawnpoint.ctf = 1;
	spawnpoint._human_were = 1;
	level.var_75ef9e74[level.var_75ef9e74.size] = spawnpoint;
}

/*
	Name: function_e23fea8c
	Namespace: namespace_3f3933bc
	Checksum: 0xD6886189
	Offset: 0x2CD0
	Size: 0x66C
	Parameters: 0
	Flags: None
*/
function function_e23fea8c()
{
	clearspawnpoints("start_spawn");
	clearspawnpoints("auto_normal");
	function_329ef588((-20369, -49973.1, 3005.61), vectorscale((0, 1, 0), 90));
	function_329ef588((-20184.4, -49973, 3000.3), vectorscale((0, 1, 0), 90));
	function_329ef588((-20005.4, -49972.8, 3005.38), vectorscale((0, 1, 0), 90));
	function_329ef588((-20007.5, -50163, 3004.4), vectorscale((0, 1, 0), 90));
	function_329ef588((-20194.4, -50159.2, 2999.52), vectorscale((0, 1, 0), 90));
	function_329ef588((-20377.2, -50153, 3005.02), vectorscale((0, 1, 0), 90));
	function_329ef588((-20600, -50133.3, 3005.27), vectorscale((0, 1, 0), 90));
	function_329ef588((-20795.5, -50078.6, 3005.02), vectorscale((0, 1, 0), 90));
	function_329ef588((-21011.3, -50065.3, 3009.65), vectorscale((0, 1, 0), 90));
	function_329ef588((-21126.7, -50065.4, 3004.52), vectorscale((0, 1, 0), 90));
	function_329ef588((-21126.9, -49944, 3000.57), vectorscale((0, 1, 0), 90));
	function_307d5f67((48922.5, 20576.5, 1431.09), vectorscale((0, -1, 0), 91.225));
	function_307d5f67((48802.2, 20554.8, 1430.85), vectorscale((0, -1, 0), 81.1176));
	function_307d5f67((48778, 20661.9, 1421.31), vectorscale((0, -1, 0), 81.1176));
	function_307d5f67((48938.2, 20664.9, 1425.74), vectorscale((0, -1, 0), 81.1176));
	function_307d5f67((48942.4, 20806.1, 1425.23), vectorscale((0, -1, 0), 87.616));
	function_307d5f67((48799, 20796.7, 1425.73), vectorscale((0, -1, 0), 85.8691));
	function_307d5f67((48790.9, 20942.2, 1425.73), vectorscale((0, -1, 0), 85.8691));
	function_307d5f67((48931.2, 20949.9, 1420.77), vectorscale((0, -1, 0), 85.8691));
	function_307d5f67((48928.4, 21055.9, 1420.77), vectorscale((0, -1, 0), 85.8691));
	function_307d5f67((48795.6, 21024.7, 1430.16), vectorscale((0, -1, 0), 85.8691));
	function_307d5f67((48791.5, 21129.8, 1421.04), vectorscale((0, -1, 0), 85.8691));
	function_307d5f67((48925.6, 21132.2, 1425.48), vectorscale((0, -1, 0), 85.8691));
	function_307d5f67((48928.9, 21259.5, 1425.23), vectorscale((0, -1, 0), 87.8577));
	function_307d5f67((48806.6, 21263.3, 1421.31), vectorscale((0, -1, 0), 87.8577));
	addspawnpoints(#"allies", level.var_c25f98d5, "start_spawn");
	addspawnpoints(#"axis", level.var_75ef9e74, "start_spawn");
	addspawnpoints(#"allies", level.var_c25f98d5, "auto_normal");
	addspawnpoints(#"axis", level.var_75ef9e74, "auto_normal");
}

