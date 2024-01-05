#using script_1cc417743d7c262d;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\abilities\gadgets\gadget_health_regen.gsc;
#using script_305d57cf0618009d;
#using script_6e9b46ba8331f1f;
#using scripts\core_common\player\player_insertion.gsc;
#using scripts\core_common\player\player_free_fall.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\match_record.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot_insertion.gsc;
#using scripts\core_common\animation_shared.gsc;

#namespace player_insertion;

/*
	Name: function_daa6ee48
	Namespace: player_insertion
	Checksum: 0x12C1B7D3
	Offset: 0x838
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_daa6ee48()
{
	level notify(-386586457);
}

/*
	Name: __init__system__
	Namespace: player_insertion
	Checksum: 0x8BA6F198
	Offset: 0x858
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"player_insertion", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: player_insertion
	Checksum: 0x7E2829B2
	Offset: 0x8A0
	Size: 0x4CC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(level.var_f2814a96 !== 0 && level.var_f2814a96 !== 2)
	{
		return;
	}
	var_1194a9a5 = struct::get_array("infil_spawn", "targetname");
	/#
		if(var_1194a9a5.size == 0)
		{
			var_1194a9a5 = struct::get_array("", "");
		}
	#/
	level.insertions = [];
	var_3bc28449 = max((isdefined(getgametypesetting(#"hash_731988b03dc6ee17")) ? getgametypesetting(#"hash_731988b03dc6ee17") : 1), 1);
	/#
		assert(var_3bc28449 > 0 && var_3bc28449 <= 2);
	#/
	for(index = 0; index < var_3bc28449; index++)
	{
		insertion = {#players:[], #spawnpoints:var_1194a9a5, #allowed:1, #index:index};
		level.insertions[level.insertions.size] = insertion;
		callback::on_finalize_initialization(&on_finalize_initialization, insertion);
	}
	level.insertion = level.insertions[0];
	clientfield::register("vehicle", "infiltration_transport", 1, 1, "int");
	clientfield::register("vehicle", "infiltration_landing_gear", 1, 1, "int");
	clientfield::register("toplayer", "infiltration_jump_warning", 1, 1, "int");
	clientfield::register("toplayer", "infiltration_final_warning", 1, 1, "int");
	clientfield::register("toplayer", "inside_infiltration_vehicle", 1, 1, "int");
	clientfield::register("world", "infiltration_compass", 1, 2, "int");
	clientfield::register("scriptmover", "infiltration_ent", 1, 2, "int");
	clientfield::register("scriptmover", "infiltration_plane", 1, 2, "int");
	clientfield::register("scriptmover", "infiltration_camera", 1, 3, "int");
	clientfield::register("scriptmover", "infiltration_jump_point", 1, 2, "int");
	clientfield::register("scriptmover", "infiltration_force_drop_point", 1, 2, "int");
	clientfield::register("toplayer", "heatblurpostfx", 1, 1, "int");
	namespace_b9471dc1::register_clientfields();
	/#
		level thread function_943c98fb(level.insertion);
	#/
	if(!isdefined(level.var_8367fa0f))
	{
		level.var_8367fa0f = 2;
	}
	if(!isdefined(level.var_ab0cc070))
	{
		level.var_ab0cc070 = 2;
	}
	if(!isdefined(level.var_b28c6a29))
	{
		level.var_b28c6a29 = 5;
	}
}

/*
	Name: on_finalize_initialization
	Namespace: player_insertion
	Checksum: 0xEA46A82B
	Offset: 0xD78
	Size: 0x2FC
	Parameters: 0
	Flags: Linked, Private
*/
function private on_finalize_initialization()
{
	if(level.deathcircle.enabled)
	{
		level flag::wait_till(#"hash_43bac6444a9b65f3");
	}
	level.var_c7f8ccf6 = (isdefined(level.var_427d6976.("insertionSpeed")) ? level.var_427d6976.("insertionSpeed") : 100);
	/#
		level.var_c7f8ccf6 = getdvarfloat(#"hash_51db9b26f6097296", level.var_c7f8ccf6);
	#/
	insertion = self;
	/#
		assert(isstruct(insertion));
	#/
	waitframe(1);
	/#
		if(getdvarint(#"scr_disable_infiltration", 0))
		{
			return;
		}
		var_6024133d = getentarray("", "");
		if(var_6024133d.size == 0)
		{
			return;
		}
	#/
	var_3bc28449 = (isdefined(getgametypesetting(#"hash_731988b03dc6ee17")) ? getgametypesetting(#"hash_731988b03dc6ee17") : 1);
	offsetdistance = (isdefined(getgametypesetting(#"hash_75a36f7e4a81c93")) ? getgametypesetting(#"hash_75a36f7e4a81c93") : 0);
	if(var_3bc28449 > 0 && insertion.index > 0)
	{
		var_df4f7099 = level.insertions[0];
		var_df4f7099 flag::wait_till(#"hash_4e5fc66b9144a5c8");
		function_d53a8c5b(insertion, var_df4f7099.fly_over_point, var_df4f7099.var_59526dd5 - 180, offsetdistance);
	}
	else
	{
		var_7ed8b321 = function_9ed051a4();
		var_684dfce3 = function_da0c552e();
		function_d53a8c5b(insertion, var_7ed8b321, var_684dfce3, offsetdistance);
	}
}

/*
	Name: function_abd3bc1a
	Namespace: player_insertion
	Checksum: 0x7726EE9
	Offset: 0x1080
	Size: 0x214
	Parameters: 2
	Flags: Linked
*/
function function_abd3bc1a(insertion, freezecontrols)
{
	if(!isdefined(freezecontrols))
	{
		freezecontrols = 1;
	}
	if(!isalive(self))
	{
		return;
	}
	self flag::clear(#"hash_224cb97b8f682317");
	self flag::clear(#"hash_287397edba8966f9");
	if(freezecontrols)
	{
		self val::set(#"player_insertion", "freezecontrols", 1);
	}
	self val::set(#"player_insertion", "disablegadgets", 1);
	self val::set(#"player_insertion", "show_hud", 0);
	self val::set(#"player_insertion", "show_weapon_hud", 0);
	self clientfield::set_world_uimodel("hudItems.skydiveAltimeterHeight", int(insertion.start_point[2]));
	self clientfield::set_world_uimodel("hudItems.skydiveAltimeterSeaHeight", (isdefined(level.var_427d6976.("altimeterSeaHeight")) ? level.var_427d6976.("altimeterSeaHeight") : 0));
	self death_circle::function_b57e3cde(1);
	if(isbot(self))
	{
		self bot_insertion::function_9699dc95();
	}
}

/*
	Name: function_7a4c1517
	Namespace: player_insertion
	Checksum: 0x18577D31
	Offset: 0x12A0
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_7a4c1517()
{
	self val::reset(#"player_insertion", "freezecontrols");
	self val::reset(#"player_insertion", "disablegadgets");
	self val::reset(#"player_insertion", "show_hud");
}

/*
	Name: function_b9a53f50
	Namespace: player_insertion
	Checksum: 0xF837E583
	Offset: 0x1328
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_b9a53f50()
{
	if(!self function_8b1a219a())
	{
		self val::set(#"player_insertion", "freezecontrols_allowlook", 1);
	}
	self disableweapons();
}

/*
	Name: function_3354a054
	Namespace: player_insertion
	Checksum: 0xF2BA6533
	Offset: 0x1398
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_3354a054()
{
	if(!self function_8b1a219a())
	{
		self val::reset(#"player_insertion", "freezecontrols_allowlook");
	}
	self enableweapons();
}

/*
	Name: function_bc824660
	Namespace: player_insertion
	Checksum: 0x506E7AB1
	Offset: 0x1400
	Size: 0x170
	Parameters: 1
	Flags: Private
*/
function private function_bc824660(insertion)
{
	/#
		assert(isstruct(insertion));
	#/
	foreach(heli in insertion.var_41091905)
	{
		if(isdefined(heli))
		{
			heli setspeedimmediate(level.var_c7f8ccf6 + 20);
		}
	}
	foreach(heli in insertion.var_dfaba736)
	{
		if(isdefined(heli))
		{
			heli setspeedimmediate(level.var_c7f8ccf6 + 20);
		}
	}
}

/*
	Name: function_948ac812
	Namespace: player_insertion
	Checksum: 0x72FB9D53
	Offset: 0x1578
	Size: 0xE0
	Parameters: 2
	Flags: Linked
*/
function function_948ac812(insertion, freezecontrols)
{
	/#
		assert(isstruct(insertion));
	#/
	function_a5fd9aa8(insertion);
	foreach(player in insertion.players)
	{
		player function_abd3bc1a(insertion, freezecontrols);
	}
}

/*
	Name: function_8dcd8623
	Namespace: player_insertion
	Checksum: 0x60281BD8
	Offset: 0x1660
	Size: 0x31C
	Parameters: 0
	Flags: None
*/
function function_8dcd8623()
{
	/#
		assert(isarray(level.insertions));
	#/
	/#
		if(getdvarint(#"scr_disable_infiltration", 0))
		{
			level.var_bde3d03 = undefined;
			level flag::set(#"hash_60fcdd11812a0134");
			level flag::set(#"insertion_teleport_completed");
			level flag::set(#"insertion_begin_completed");
			return;
		}
		while(getplayers().size == 0)
		{
			wait(0.5);
		}
	#/
	level flag::set(#"spawning_allowed");
	level flag::clear(#"hash_60fcdd11812a0134");
	level flag::clear(#"insertion_teleport_completed");
	level flag::clear(#"insertion_begin_completed");
	for(index = 0; index < level.insertions.size; index++)
	{
		insertion = level.insertions[index];
		if(!is_true(insertion.allowed))
		{
			return;
		}
		var_7eb8f61a = (isdefined(getgametypesetting(#"wzplayerinsertiontypeindex")) ? getgametypesetting(#"wzplayerinsertiontypeindex") : 0);
		switch(var_7eb8f61a)
		{
			case 0:
			{
				level thread function_82c73974(insertion);
				break;
			}
			case 1:
			{
				namespace_b9471dc1::function_51c5f95f(insertion);
				break;
			}
			case 2:
			{
				function_35742117(insertion);
				break;
			}
			case 3:
			{
				level thread function_51b480e0(insertion);
				break;
			}
		}
	}
	level flag::wait_till(#"insertion_begin_completed");
}

/*
	Name: function_daaba5b0
	Namespace: player_insertion
	Checksum: 0x2645970C
	Offset: 0x1988
	Size: 0x254
	Parameters: 3
	Flags: Linked
*/
function function_daaba5b0(insertion, var_3e6673cb, var_cf46aa72)
{
	function_a21d9dc(insertion);
	foreach(player in insertion.players)
	{
		player function_8b8a321a(0);
	}
	fadeouttime = level.var_8367fa0f;
	blacktime = level.var_ab0cc070;
	fadeintime = level.var_b28c6a29;
	insertion thread function_1b105d5b(insertion, fadeouttime, blacktime, fadeintime, 1);
	wait(fadeouttime + 0.1);
	level callback::add_callback(#"hash_774be40ec06d5212", &function_bcde1e07, insertion);
	insertion thread globallogic_audio::function_85818e24("matchstart");
	insertion thread function_a4deb676();
	insertion flag::set(#"hash_122f326d72f4c884");
	level [[var_3e6673cb]](insertion, var_cf46aa72);
	function_dd34168c(insertion, #"insertion_teleport_completed");
	var_1cd8bd13 = (blacktime + fadeintime) + 0.5;
	insertion flag::wait_till_timeout(var_1cd8bd13, #"insertion_presentation_completed");
	function_dd34168c(insertion, #"insertion_begin_completed");
}

/*
	Name: function_82c73974
	Namespace: player_insertion
	Checksum: 0x8E264643
	Offset: 0x1BE8
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_82c73974(insertion)
{
	/#
		assert(isstruct(insertion));
	#/
	function_daaba5b0(insertion, &function_e59d879f, 1);
}

/*
	Name: function_51b480e0
	Namespace: player_insertion
	Checksum: 0xA3E2501F
	Offset: 0x1C50
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_51b480e0(insertion)
{
	/#
		assert(isstruct(insertion));
	#/
	function_daaba5b0(insertion, &function_7341cc88, 0);
}

/*
	Name: function_35742117
	Namespace: player_insertion
	Checksum: 0x89B0578
	Offset: 0x1CB0
	Size: 0x470
	Parameters: 1
	Flags: Linked
*/
function function_35742117(insertion)
{
	/#
		assert(isstruct(insertion));
	#/
	function_a21d9dc(insertion);
	fadeouttime = level.var_8367fa0f;
	foreach(player in insertion.players)
	{
		player val::set(#"player_insertion", "freezecontrols", 1);
		player val::set(#"player_insertion", "disablegadgets", 1);
	}
	insertion thread function_1b105d5b(insertion, fadeouttime, 5, 5, 0);
	wait(fadeouttime + 0.1);
	level thread function_a4deb676();
	insertion flag::set(#"hash_122f326d72f4c884");
	function_dd34168c(insertion, #"hash_60fcdd11812a0134");
	function_dd34168c(insertion, #"insertion_teleport_completed");
	level callback::callback(#"hash_774be40ec06d5212");
	function_a5fd9aa8(insertion);
	foreach(player in insertion.players)
	{
		if(!isalive(player))
		{
			continue;
		}
		player setorigin(player.resurrect_origin);
		player setplayerangles(player.resurrect_angles);
		level callback::callback(#"hash_74b19f5972b0ee52", {#player:player});
	}
	function_dd34168c(insertion, #"insertion_begin_completed");
	wait(5 + (fadeouttime / 3));
	function_a5fd9aa8(insertion);
	foreach(player in insertion.players)
	{
		if(!isalive(player))
		{
			continue;
		}
		player val::reset(#"player_insertion", "freezecontrols");
		player val::reset(#"player_insertion", "disablegadgets");
		player clientfield::set_to_player("realtime_multiplay", 1);
	}
}

/*
	Name: function_bcde1e07
	Namespace: player_insertion
	Checksum: 0x6E859DBF
	Offset: 0x2128
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_bcde1e07()
{
	insertion = self;
	callback::remove_on_spawned(&function_80c60f66, insertion);
}

/*
	Name: function_c62b5591
	Namespace: player_insertion
	Checksum: 0x99FB725B
	Offset: 0x2168
	Size: 0x194
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c62b5591(insertion)
{
	/#
		assert(isstruct(insertion));
	#/
	if(!isdefined(insertion.cameraent))
	{
		insertion.cameraent = [];
	}
	var_163b0077 = 0;
	foreach(plane in insertion.var_41091905)
	{
		if(self islinkedto(plane))
		{
			if(isdefined(insertion.cameraent[i]))
			{
				insertion.cameraent[i] setvisibletoplayer(self);
			}
			var_163b0077 = 1;
			break;
		}
	}
	if(!var_163b0077 && insertion.var_41091905.size > 0)
	{
		if(isdefined(insertion.cameraent[insertion.var_41091905.size]))
		{
			insertion.cameraent[insertion.var_41091905.size] setvisibletoplayer(self);
		}
	}
}

/*
	Name: function_57fe9b21
	Namespace: player_insertion
	Checksum: 0xDFCA3502
	Offset: 0x2308
	Size: 0x60
	Parameters: 2
	Flags: Linked
*/
function function_57fe9b21(insertion, origin)
{
	camera = spawn("script_model", origin);
	camera.targetname = "insertion_camera";
	camera setinvisibletoall();
	return camera;
}

/*
	Name: function_ca5b6591
	Namespace: player_insertion
	Checksum: 0x42F930AE
	Offset: 0x2370
	Size: 0xA04
	Parameters: 4
	Flags: Linked
*/
function function_ca5b6591(insertion, startorigin, endorigin, var_872f085f)
{
	/#
		assert(isstruct(startorigin));
	#/
	self notify("3cffd628f47ceca1");
	self endon("3cffd628f47ceca1");
	startorigin.cameraent = [];
	var_21e6b5ae = anglestoforward(var_872f085f);
	var_1978c281 = (isdefined(level.var_427d6976.("insertionCameraFollowPitch")) ? level.var_427d6976.("insertionCameraFollowPitch") : 35);
	var_8b5e86f4 = (var_1978c281, var_872f085f[1], var_872f085f[2]);
	var_65537f6d = anglestoforward(var_8b5e86f4);
	var_9cade497 = (isdefined(level.var_427d6976.("insertionCameraFollowDistance")) ? level.var_427d6976.("insertionCameraFollowDistance") : 1600);
	var_2e670241 = ((var_9cade497 * -1) * var_65537f6d) + (var_21e6b5ae * ((level.var_c7f8ccf6 * 17.6) * 3));
	for(index = 0; index <= startorigin.var_41091905.size; index++)
	{
		plane = startorigin.var_41091905[index];
		if(!isdefined(plane))
		{
			plane = startorigin.var_41091905[0];
		}
		if(isdefined(startorigin.cameraent[index]))
		{
			startorigin.cameraent[index] delete();
		}
		var_c5f933e4 = (plane.origin + (vectorscale(var_21e6b5ae, -400))) + vectorscale((0, 0, 1), 225);
		startorigin.cameraent[index] = function_57fe9b21(startorigin, var_c5f933e4);
		startorigin.cameraent[index].angles = var_8b5e86f4;
		startorigin.cameraent[index] clientfield::set("infiltration_camera", function_1e4302d0(2, startorigin.index));
	}
	function_a5fd9aa8(startorigin);
	foreach(player in startorigin.players)
	{
		player function_c62b5591(startorigin);
		player show_postfx();
	}
	foreach(player in startorigin.otherplayers)
	{
		player function_c62b5591(startorigin);
	}
	var_1b6a3e44 = [];
	for(index = 0; index <= startorigin.var_41091905.size; index++)
	{
		plane = startorigin.var_41091905[index];
		if(!isdefined(plane))
		{
			plane = startorigin.var_41091905[0];
		}
		var_f3d7d863 = (endorigin + (vectorscale(var_21e6b5ae, -400))) + vectorscale((0, 0, 1), 225);
		timetotarget = distance(var_f3d7d863, var_c5f933e4) / (level.var_c7f8ccf6 * 17.6);
		if(isdefined(startorigin.cameraent[index]))
		{
			startorigin.cameraent[index] moveto(var_f3d7d863, timetotarget);
		}
	}
	function_a5fd9aa8(startorigin);
	if(getgametypesetting(#"wzplayerinsertiontypeindex") != 3)
	{
		wait(3.75);
		foreach(player in startorigin.players)
		{
			player function_bc82f900(#"infiltration_rumble");
		}
		wait(1);
		function_a5fd9aa8(startorigin);
		foreach(player in startorigin.players)
		{
			player function_bc82f900(#"hash_233b436a07cd091a");
		}
		wait(0.2);
		function_a5fd9aa8(startorigin);
		foreach(player in startorigin.players)
		{
			player function_bc82f900(#"infiltration_rumble");
		}
		wait(2);
		function_a5fd9aa8(startorigin);
		foreach(player in startorigin.players)
		{
			if(!isdefined(player))
			{
				continue;
			}
			player function_bc82f900(#"hash_62ba49f452a20378");
		}
		wait(2);
	}
	function_a5fd9aa8(startorigin);
	foreach(player in startorigin.players)
	{
		if(!isdefined(player))
		{
			continue;
		}
		player setplayerangles((var_872f085f[0] + var_1978c281, var_872f085f[1], var_872f085f[2]));
	}
	waitframe(2);
	for(index = 0; index <= startorigin.var_41091905.size; index++)
	{
		if(isdefined(startorigin.cameraent[index]))
		{
			startorigin.cameraent[index] clientfield::set("infiltration_plane", function_1e4302d0(1, startorigin.index));
		}
	}
	function_a5fd9aa8(startorigin);
	foreach(player in startorigin.players)
	{
		if(!isalive(player))
		{
			continue;
		}
		player function_7a4c1517();
	}
	startorigin callback::callback(#"hash_1634199a59f10727");
}

/*
	Name: function_77132caf
	Namespace: player_insertion
	Checksum: 0x4C9A57F8
	Offset: 0x2D80
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_77132caf()
{
	self unlink();
	self setstance("stand");
	self function_4feecc32();
	center = death_circle::function_b980b4ca();
	radius = death_circle::function_f8dae197() * 0.85;
	if(radius == 0)
	{
		radius = 500;
	}
	spawn_point = rotatepoint((radius, 0, 0), (0, randomint(360), 0));
	self setorigin((center + spawn_point) + vectorscale((0, 0, 1), 30000));
	self start_freefall((0, 0, 0), 0);
}

/*
	Name: function_c4f5c468
	Namespace: player_insertion
	Checksum: 0xFFDC7A98
	Offset: 0x2EC0
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function function_c4f5c468(insertion)
{
	/#
		assert(isstruct(insertion));
	#/
	teammask = getteammask(self.team);
	teamindex = 0;
	while(teammask > 1)
	{
		teammask = teammask >> 1;
		teamindex++;
	}
	planeindex = teamindex % insertion.var_41091905.size;
	return insertion.var_41091905[planeindex];
}

/*
	Name: function_f795bf83
	Namespace: player_insertion
	Checksum: 0xCFCD46F2
	Offset: 0x2F78
	Size: 0x3E4
	Parameters: 3
	Flags: Linked
*/
function function_f795bf83(insertion, vehicle, yaw)
{
	/#
		assert(isstruct(insertion));
	#/
	if(!isdefined(self) || !isentity(self))
	{
		return;
	}
	self endon(#"disconnect");
	if(!isdefined(vehicle))
	{
		self function_77132caf();
		return;
	}
	/#
		println("" + self.name);
	#/
	self notify(#"insertion_starting");
	if(!isdefined(insertion.passengercount))
	{
		insertion.passengercount = 0;
	}
	insertion.passengercount++;
	self function_8cf53a19();
	self stopanimscripted();
	self unlink();
	self setstance("stand");
	self function_648c1f6(vehicle, undefined, 0, 180, 180, 85, 85);
	self cameraactivate(1);
	self setclientthirdperson(1);
	self setplayerangles((0, yaw, 0));
	self dontinterpolate();
	self ghost();
	self notsolid();
	self gadget_health_regen::function_7993d50e();
	self.health = self.spawnhealth;
	self.var_7689a9b2 = 1;
	self.var_df1a9210 = util::spawn_player_clone(self);
	self.var_df1a9210 ghost();
	self.var_df1a9210 setinvisibletoall();
	self.var_df1a9210 showtoplayer(self);
	self.var_df1a9210 notsolid();
	self.var_df1a9210 thread function_247d349b(self);
	self.var_df1a9210 thread animation::play(#"hash_44cba2d3b8774422", vehicle, "tag_player_spawn");
	self thread status_effect::function_6519f95f();
	self val::set(#"player_insertion", "disable_oob", 1);
	self clientfield::set_to_player("inside_infiltration_vehicle", 1);
	self clientfield::set_player_uimodel("hudItems.showReinsertionPassengerCount", 0);
	level thread function_2e54d73e(insertion, self, vehicle);
	self thread function_5b3ac9f2(vehicle);
}

/*
	Name: function_247d349b
	Namespace: player_insertion
	Checksum: 0xF7101A21
	Offset: 0x3368
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_247d349b(player)
{
	self endon(#"death");
	player waittill(#"death");
	self delete();
}

/*
	Name: function_7d880672
	Namespace: player_insertion
	Checksum: 0x16BEB537
	Offset: 0x33C0
	Size: 0x2CA
	Parameters: 3
	Flags: Private
*/
function private function_7d880672(original_origin, var_9f8395cb, refly)
{
	/#
		self notify("");
		self endon("");
		self endon(#"disconnect");
		origin = self.origin;
		origin = (original_origin[0], original_origin[1], function_70dd0500());
		self setorigin(origin);
		self dontinterpolate();
		var_cc56f8da = 0;
		var_cc56f8da = getdvarint(#"hash_380d8ae5bfc8f45b", 1);
		switch(var_cc56f8da)
		{
			case 0:
			default:
			{
				var_59526dd5 = 0;
				break;
			}
			case 1:
			{
				var_59526dd5 = var_9f8395cb;
				break;
			}
			case 2:
			{
				var_59526dd5 = randomint(360);
				break;
			}
		}
		var_872f085f = (0, var_59526dd5, 0);
		self setplayerangles(var_872f085f);
		direction = anglestoforward(var_872f085f);
		vectornormalize(direction);
		if(refly > 2)
		{
			speed = 1000;
			velocity = direction * speed;
			self player_free_fall::function_7705a7fc(2, velocity);
		}
		if((refly % 2) == 0)
		{
			else
			{
			}
			while(true)
			{
				waitframe(1);
				if(self isonground() || self.origin[2] < -5000)
				{
					while(self isonground() && self.origin[2] > -5000)
					{
						waitframe(1);
					}
					self thread function_7d880672(original_origin, var_9f8395cb, refly);
					return;
				}
			}
		}
	#/
}

/*
	Name: function_80c60f66
	Namespace: player_insertion
	Checksum: 0x79E2360D
	Offset: 0x3698
	Size: 0x294
	Parameters: 1
	Flags: Linked
*/
function function_80c60f66(player)
{
	if(is_true(player.var_7689a9b2))
	{
		return;
	}
	insertion = self;
	/#
		assert(isstruct(insertion));
	#/
	for(index = 0; index < level.insertions.size; index++)
	{
		var_18310f7e = level.insertions[index];
		if(insertion == var_18310f7e)
		{
			var_18310f7e.players[var_18310f7e.players.size] = player;
			continue;
		}
		var_18310f7e.otherplayers[var_18310f7e.otherplayers.size] = player;
		player function_c62b5591(var_18310f7e);
	}
	player function_abd3bc1a(insertion, 0);
	plane = player function_c4f5c468(insertion);
	player function_f795bf83(insertion, plane, insertion.leadplane.angles[1]);
	player function_c62b5591(insertion);
	player function_7a4c1517();
	player show_postfx();
	var_1978c281 = (isdefined(level.var_427d6976.("insertionCameraFollowPitch")) ? level.var_427d6976.("insertionCameraFollowPitch") : 35);
	player setplayerangles((var_1978c281, insertion.leadplane.angles[1], 0));
	player endon(#"disconnect");
	util::wait_network_frame();
	player flag::set(#"hash_287397edba8966f9");
	player cameraactivate(1);
}

/*
	Name: function_88c53de8
	Namespace: player_insertion
	Checksum: 0x6EE9F5E0
	Offset: 0x3938
	Size: 0x100
	Parameters: 0
	Flags: None
*/
function function_88c53de8()
{
	/#
		refly = getdvarint(#"hash_1632f4021ab7a921", 0);
		if(refly)
		{
			players = getplayers();
			foreach(player in players)
			{
				player thread function_7d880672(player.origin, player.angles[1], refly);
			}
			return true;
		}
		return false;
	#/
}

/*
	Name: function_e59d879f
	Namespace: player_insertion
	Checksum: 0xF4DFC662
	Offset: 0x3A48
	Size: 0x900
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e59d879f(insertion, var_cf46aa72)
{
	/#
		assert(isstruct(insertion));
	#/
	/#
		if(function_88c53de8())
		{
			return;
		}
	#/
	function_948ac812(insertion, 0);
	bot_insertion::function_24ca8ecf(insertion);
	vehiclespawns = [#"vehicle_t8_mil_helicopter_light_transport_wz_infil":"vehicle_t8_mil_helicopter_light_transport_wz_infil", #"vehicle_t8_mil_helicopter_gunship_wz_infiltration":"vehicle_t8_mil_helicopter_gunship_wz_infiltration", #"vehicle_t9_mil_helicopter_care_package":"vehicle_t9_mil_helicopter_care_package", #"vehicle_t9_mil_air_transport_hpc_intro":"vehicle_t9_mil_air_transport_hpc_intro"];
	if(vehiclespawns.size == 0)
	{
		return false;
	}
	spawner::global_spawn_throttle(1);
	if(1)
	{
		var_69f4f44c = "vehicle_t9_mil_helicopter_care_package";
	}
	else
	{
		var_69f4f44c = "vehicle_t9_mil_air_transport_hpc_intro";
	}
	startpoint = insertion.start_point;
	endpoint = insertion.end_point;
	var_872f085f = insertion.var_f253731f;
	var_37362e08 = insertion.var_37362e08;
	var_7743b329 = insertion.var_7743b329;
	insertion.leadplane = spawnvehicle(var_69f4f44c, startpoint, var_872f085f, "insertion_plane");
	insertion.leadplane.takedamage = 0;
	insertion.passengercount = 0;
	insertion.var_ef5094f9 = undefined;
	insertion.var_dfaba736 = [];
	insertion.var_27d17f06 = [];
	insertion.var_41091905 = [];
	if(!isdefined(insertion.var_41091905))
	{
		insertion.var_41091905 = [];
	}
	else if(!isarray(insertion.var_41091905))
	{
		insertion.var_41091905 = array(insertion.var_41091905);
	}
	insertion.var_41091905[insertion.var_41091905.size] = insertion.leadplane;
	if(1)
	{
		insertion.var_dfaba736 = [];
		insertion thread function_45b56b0a(insertion, startpoint, endpoint, var_872f085f, vehiclespawns);
		if(var_cf46aa72)
		{
			insertion thread function_f87ddcf0(insertion, startpoint, endpoint, var_872f085f, vehiclespawns);
		}
		s_formation = function_d9dfa25();
		for(i = 0; i < s_formation.var_c85ebc15; i++)
		{
			spawner::global_spawn_throttle(1);
			var_61b1034d = startpoint + rotatepoint(s_formation.var_86cb4eb8[i], var_872f085f);
			var_4875d958 = vehiclespawns[s_formation.var_f5cff63[i]];
			vehicle = spawnvehicle(var_4875d958, var_61b1034d, var_872f085f, "insertion_secondary");
			if(isdefined(vehicle))
			{
				vehicle notsolid();
				vehicle.takedamage = 0;
				vehicle.startorigin = var_61b1034d;
				if(!isdefined(insertion.var_dfaba736))
				{
					insertion.var_dfaba736 = [];
				}
				else if(!isarray(insertion.var_dfaba736))
				{
					insertion.var_dfaba736 = array(insertion.var_dfaba736);
				}
				insertion.var_dfaba736[insertion.var_dfaba736.size] = vehicle;
				if(s_formation.var_f5cff63[i] == "vehicle_t9_mil_helicopter_care_package")
				{
					if(!isdefined(insertion.var_41091905))
					{
						insertion.var_41091905 = [];
					}
					else if(!isarray(insertion.var_41091905))
					{
						insertion.var_41091905 = array(insertion.var_41091905);
					}
					insertion.var_41091905[insertion.var_41091905.size] = vehicle;
				}
				if(i == s_formation.var_84f704f)
				{
					insertion.var_ef5094f9 = vehicle;
					vehicle.forwardoffset = s_formation.var_86cb4eb8[i][0];
				}
			}
		}
		if(!isdefined(insertion.var_ef5094f9))
		{
			insertion.var_ef5094f9 = insertion.leadplane;
			insertion.var_ef5094f9.startorigin = startpoint;
			insertion.var_ef5094f9.endorigin = endpoint;
			insertion.var_ef5094f9.forwardoffset = 0;
		}
		for(i = 0; i < s_formation.var_c85ebc15; i++)
		{
			if(!isdefined(insertion.var_dfaba736[i]))
			{
				continue;
			}
			var_45a4b34b = endpoint + rotatepoint(s_formation.var_86cb4eb8[i], var_872f085f);
			insertion.var_dfaba736[i].endorigin = var_45a4b34b;
			insertion.var_dfaba736[i] setneargoalnotifydist(512);
			insertion.var_dfaba736[i] thread function_ea6a4f96(insertion.var_dfaba736[i].startorigin, var_45a4b34b, var_872f085f, s_formation.hoverparams[i], s_formation.var_86255b48[i]);
		}
	}
	else
	{
		insertion.var_ef5094f9 = insertion.leadplane;
		insertion.var_ef5094f9.startorigin = startpoint;
		insertion.var_ef5094f9.endorigin = endpoint;
		insertion.var_ef5094f9.forwardoffset = 0;
	}
	insertion.leadplane setneargoalnotifydist(512);
	var_913594d7 = (0, 16, 16);
	insertion.leadplane thread function_ea6a4f96(startpoint, endpoint, var_872f085f, var_913594d7, 2);
	callback::on_spawned(&function_80c60f66, insertion);
	function_a5fd9aa8(insertion);
	foreach(player in insertion.players)
	{
		if(isalive(player))
		{
			plane = player function_c4f5c468(insertion);
			player function_f795bf83(insertion, plane, var_872f085f[1]);
		}
	}
	insertion thread function_afdad0c8(insertion, insertion.leadplane, startpoint, endpoint, var_7743b329);
	insertion thread function_6da3daa0(insertion, insertion.var_ef5094f9, insertion.var_ef5094f9.startorigin, insertion.var_ef5094f9.endorigin, var_37362e08 + insertion.var_ef5094f9.forwardoffset);
	insertion thread function_ca5b6591(insertion, startpoint, endpoint, var_872f085f);
	return true;
}

/*
	Name: function_7341cc88
	Namespace: player_insertion
	Checksum: 0xD04851F
	Offset: 0x4350
	Size: 0x4C0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_7341cc88(insertion, var_cf46aa72)
{
	/#
		assert(isstruct(var_cf46aa72));
	#/
	/#
		if(function_88c53de8())
		{
			return;
		}
	#/
	function_bb93a8cd(var_cf46aa72);
	callback::on_spawned(&function_80c60f66, var_cf46aa72);
	function_948ac812(var_cf46aa72, 0);
	bot_insertion::function_24ca8ecf(var_cf46aa72);
	vehiclespawns = [0:"vehicle_t9_mil_air_transport_hpc_intro"];
	if(vehiclespawns.size == 0)
	{
		return false;
	}
	spawner::global_spawn_throttle(1);
	var_69f4f44c = "vehicle_t9_mil_air_transport_hpc_intro";
	startpoint = var_cf46aa72.start_point;
	endpoint = var_cf46aa72.end_point;
	var_872f085f = var_cf46aa72.var_f253731f;
	var_37362e08 = var_cf46aa72.var_37362e08;
	var_7743b329 = var_cf46aa72.var_7743b329;
	var_cf46aa72.leadplane = spawnvehicle(var_69f4f44c, startpoint, var_872f085f, "insertion_plane");
	var_cf46aa72.leadplane.takedamage = 0;
	var_cf46aa72.passengercount = 0;
	var_cf46aa72.var_ef5094f9 = undefined;
	var_cf46aa72.var_dfaba736 = [];
	var_cf46aa72.var_27d17f06 = [];
	var_cf46aa72.var_41091905 = [];
	if(!isdefined(var_cf46aa72.var_41091905))
	{
		var_cf46aa72.var_41091905 = [];
	}
	else if(!isarray(var_cf46aa72.var_41091905))
	{
		var_cf46aa72.var_41091905 = array(var_cf46aa72.var_41091905);
	}
	var_cf46aa72.var_41091905[var_cf46aa72.var_41091905.size] = var_cf46aa72.leadplane;
	level thread function_663e35b8();
	var_cf46aa72.var_ef5094f9 = var_cf46aa72.leadplane;
	var_cf46aa72.var_ef5094f9.startorigin = startpoint;
	var_cf46aa72.var_ef5094f9.endorigin = endpoint;
	var_cf46aa72.var_ef5094f9.forwardoffset = 0;
	var_cf46aa72.leadplane setneargoalnotifydist(512);
	var_913594d7 = (0, 16, 16);
	var_cf46aa72.leadplane thread function_ea6a4f96(startpoint, endpoint, var_872f085f, var_913594d7, 2);
	function_a5fd9aa8(var_cf46aa72);
	foreach(player in var_cf46aa72.players)
	{
		if(isalive(player))
		{
			plane = player function_c4f5c468(var_cf46aa72);
			player function_f795bf83(var_cf46aa72, plane, var_872f085f[1]);
		}
	}
	var_cf46aa72 thread function_afdad0c8(var_cf46aa72, var_cf46aa72.leadplane, startpoint, endpoint, var_7743b329);
	var_cf46aa72 thread function_6da3daa0(var_cf46aa72, var_cf46aa72.var_ef5094f9, var_cf46aa72.var_ef5094f9.startorigin, var_cf46aa72.var_ef5094f9.endorigin, var_37362e08 + var_cf46aa72.var_ef5094f9.forwardoffset);
	var_cf46aa72 thread function_ca5b6591(var_cf46aa72, startpoint, endpoint, var_872f085f);
	return true;
}

/*
	Name: function_663e35b8
	Namespace: player_insertion
	Checksum: 0x1C49C454
	Offset: 0x4818
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function function_663e35b8()
{
	wait(4);
	level notify(#"formation_start");
}

/*
	Name: function_43cc81fc
	Namespace: player_insertion
	Checksum: 0x990D12F
	Offset: 0x4840
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_43cc81fc()
{
	s_formation = {#alignment:"center", #hash_84f704f:0, #hash_86255b48:[], #hoverparams:[], #hash_86cb4eb8:[], #hash_f5cff63:[], #hash_c85ebc15:0};
	return s_formation;
}

/*
	Name: function_d9dfa25
	Namespace: player_insertion
	Checksum: 0x12502650
	Offset: 0x48D8
	Size: 0xA76
	Parameters: 0
	Flags: Linked
*/
function function_d9dfa25()
{
	a_formations = [];
	s_formation = {#alignment:"left", #hash_84f704f:4, #hash_86255b48:array(2, 2, 2, 2, 2), #hoverparams:array(vectorscale((1, 1, 1), 192), vectorscale((1, 1, 1), 192), vectorscale((1, 1, 1), 192), vectorscale((1, 1, 1), 192), (0, 24, 128)), #hash_86cb4eb8:array((2750, -550, 0), (2000, -1200, 0), (1500, 750, 0), (500, 1500, 0), (-900, -700, 0)), #hash_f5cff63:array("vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t9_mil_helicopter_care_package"), #hash_c85ebc15:5};
	if(!isdefined(a_formations))
	{
		a_formations = [];
	}
	else if(!isarray(a_formations))
	{
		a_formations = array(a_formations);
	}
	a_formations[a_formations.size] = s_formation;
	s_formation = {#alignment:"right", #hash_84f704f:4, #hash_86255b48:array(2, 2, 2, 2, 2), #hoverparams:array(vectorscale((1, 1, 1), 192), vectorscale((1, 1, 1), 192), vectorscale((1, 1, 1), 192), vectorscale((1, 1, 1), 192), (0, 24, 128)), #hash_86cb4eb8:array((2750, 550, 0), (2000, 1200, 0), (1500, -750, 0), (500, -1500, 0), (-900, 700, 0)), #hash_f5cff63:array("vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t9_mil_helicopter_care_package"), #hash_c85ebc15:5};
	if(!isdefined(a_formations))
	{
		a_formations = [];
	}
	else if(!isarray(a_formations))
	{
		a_formations = array(a_formations);
	}
	a_formations[a_formations.size] = s_formation;
	s_formation = {#alignment:"left", #hash_84f704f:4, #hash_86255b48:array(2, 2, 2, 2, 2), #hoverparams:array(vectorscale((1, 1, 1), 192), vectorscale((1, 1, 1), 192), vectorscale((1, 1, 1), 192), vectorscale((1, 1, 1), 192), (0, 24, 128)), #hash_86cb4eb8:array((2750, -900, 0), (2000, 100, 0), (1250, 1100, 0), (500, 2100, 0), (-900, -700, 0)), #hash_f5cff63:array("vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t9_mil_helicopter_care_package"), #hash_c85ebc15:5};
	if(!isdefined(a_formations))
	{
		a_formations = [];
	}
	else if(!isarray(a_formations))
	{
		a_formations = array(a_formations);
	}
	a_formations[a_formations.size] = s_formation;
	s_formation = {#alignment:"right", #hash_84f704f:4, #hash_86255b48:array(2, 2, 2, 2, 2), #hoverparams:array(vectorscale((1, 1, 1), 192), vectorscale((1, 1, 1), 192), vectorscale((1, 1, 1), 192), vectorscale((1, 1, 1), 192), (0, 24, 128)), #hash_86cb4eb8:array((2750, 900, 0), (2000, -100, 0), (1500, -1100, 0), (500, -2100, 0), (-900, 700, 0)), #hash_f5cff63:array("vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t9_mil_helicopter_care_package"), #hash_c85ebc15:5};
	if(!isdefined(a_formations))
	{
		a_formations = [];
	}
	else if(!isarray(a_formations))
	{
		a_formations = array(a_formations);
	}
	a_formations[a_formations.size] = s_formation;
	/#
		index = getdvarint(#"hash_5293cadde39a7ceb", -1);
		if(index > -1)
		{
			if(isdefined(a_formations[index]))
			{
				return a_formations[index];
			}
		}
	#/
	var_86cb4eb8[#"left"] = array((1200, -2300, 0), (-200, -2300, 0), (-1600, -2300, 0), (-3000, -2300, 0));
	var_86cb4eb8[#"right"] = array((1200, 2300, 0), (-200, 2300, 0), (-1600, 2300, 0), (-3000, 2300, 0));
	var_5637e595 = {#hash_86255b48:array(2, 2, 2, 2), #hoverparams:array(vectorscale((1, 1, 1), 192), vectorscale((1, 1, 1), 192), vectorscale((1, 1, 1), 192), vectorscale((1, 1, 1), 192)), #hash_f5cff63:array("vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t8_mil_helicopter_gunship_wz_infiltration", "vehicle_t8_mil_helicopter_gunship_wz_infiltration"), #hash_c85ebc15:4};
	s_formation = array::random(a_formations);
	s_formation.var_c85ebc15 = s_formation.var_c85ebc15 + var_5637e595.var_c85ebc15;
	s_formation.var_f5cff63 = arraycombine(s_formation.var_f5cff63, var_5637e595.var_f5cff63, 1, 0);
	s_formation.var_86cb4eb8 = arraycombine(s_formation.var_86cb4eb8, var_86cb4eb8[s_formation.alignment], 1, 0);
	s_formation.hoverparams = arraycombine(s_formation.hoverparams, var_5637e595.hoverparams, 1, 0);
	s_formation.var_86255b48 = arraycombine(s_formation.var_86255b48, var_5637e595.var_86255b48, 1, 0);
	return s_formation;
}

/*
	Name: function_45b56b0a
	Namespace: player_insertion
	Checksum: 0x89BD58D1
	Offset: 0x5358
	Size: 0x206
	Parameters: 5
	Flags: Linked
*/
function function_45b56b0a(insertion, startpoint, endpoint, var_872f085f, vehiclespawns)
{
	offset = (500, -50, 600);
	goaloffset = vectorscale((0, 0, -1), 400);
	var_61b1034d = startpoint + rotatepoint(offset, var_872f085f);
	var_31e5487a = vehiclespawns[#"vehicle_t8_mil_helicopter_light_transport_wz_infil"];
	insertion.var_933bdcf2 = spawnvehicle(var_31e5487a, var_61b1034d, var_872f085f, "insertion_presentation");
	if(!isdefined(insertion.var_933bdcf2))
	{
		/#
			assert(0);
		#/
		return;
	}
	insertion.var_933bdcf2.startorigin = var_61b1034d;
	var_45a4b34b = endpoint + rotatepoint(goaloffset, var_872f085f);
	insertion.var_933bdcf2.endorigin = var_45a4b34b;
	wait(0.5);
	insertion.var_933bdcf2 setrotorspeed(1);
	insertion.var_933bdcf2 setspeedimmediate(level.var_c7f8ccf6 + 20);
	insertion.var_933bdcf2 setneargoalnotifydist(512);
	insertion.var_933bdcf2 vehlookat(var_45a4b34b);
	insertion.var_933bdcf2 function_a57c34b7(var_45a4b34b, 0, 0);
	insertion.var_933bdcf2.takedamage = 0;
}

/*
	Name: function_f87ddcf0
	Namespace: player_insertion
	Checksum: 0xA314C338
	Offset: 0x5568
	Size: 0x33C
	Parameters: 5
	Flags: Linked
*/
function function_f87ddcf0(insertion, startpoint, endpoint, var_872f085f, vehiclespawns)
{
	offset = array((500, -100, 800), (500, 100, 800));
	goaloffset = array((0, 60000, -10000), (0, -60000, -10000));
	var_5b967418 = array("vehicle_t8_mil_helicopter_light_transport_wz_infil", "vehicle_t8_mil_helicopter_light_transport_wz_infil");
	insertion.var_27d17f06 = [];
	for(i = 0; i < 2; i++)
	{
		waitframe(1);
		var_61b1034d = startpoint + rotatepoint(offset[i], var_872f085f);
		var_31e5487a = vehiclespawns[var_5b967418[i]];
		vehicle = spawnvehicle(var_31e5487a, var_61b1034d, var_872f085f, "insertion_presentation");
		vehicle.origin = var_61b1034d;
		vehicle.angles = var_872f085f;
		vehicle.startorigin = var_61b1034d;
		if(!isdefined(insertion.var_27d17f06))
		{
			insertion.var_27d17f06 = [];
		}
		else if(!isarray(insertion.var_27d17f06))
		{
			insertion.var_27d17f06 = array(insertion.var_27d17f06);
		}
		insertion.var_27d17f06[insertion.var_27d17f06.size] = vehicle;
		waitframe(1);
	}
	for(i = 0; i < 2; i++)
	{
		var_45a4b34b = endpoint + rotatepoint(goaloffset[i], var_872f085f);
		insertion.var_27d17f06[i].endorigin = var_45a4b34b;
		insertion.var_27d17f06[i] setrotorspeed(1);
		insertion.var_27d17f06[i] setspeedimmediate(2);
		insertion.var_27d17f06[i] setneargoalnotifydist(512);
		insertion.var_27d17f06[i].takedamage = 0;
		insertion.var_27d17f06[i] thread function_700e474f(insertion.var_27d17f06[i].startorigin, var_45a4b34b, var_872f085f, goaloffset[i][1], i);
	}
}

/*
	Name: function_700e474f
	Namespace: player_insertion
	Checksum: 0x72F0A619
	Offset: 0x58B0
	Size: 0x34C
	Parameters: 5
	Flags: Linked
*/
function function_700e474f(startorigin, endorigin, var_872f085f, goal, index)
{
	self endon(#"death");
	dist = distance2d(endorigin, startorigin) / 3;
	offset = (dist / 2, math::sign(goal) * 1000, -1000);
	var_e8ab2c6b = startorigin + rotatepoint(offset, var_872f085f);
	offset = (dist / 2, math::sign(goal) * 1000, -1000);
	var_9fa20618 = var_e8ab2c6b + rotatepoint(offset, var_872f085f);
	/#
		if(getdvarint(#"hash_5bbd3d044e1ec1b8", 0))
		{
			self thread function_84898b3f(var_e8ab2c6b, var_9fa20618, endorigin, index);
		}
	#/
	wait(0.25);
	self setrotorspeed(1);
	self setspeedimmediate(2);
	self vehlookat(var_e8ab2c6b);
	self function_a57c34b7(var_e8ab2c6b, 0, 0);
	if(index > 0)
	{
		wait(0.75);
	}
	self setspeedimmediate(level.var_c7f8ccf6 - 30);
	self thread function_71da60d1();
	self waittill(#"goal", #"near_goal");
	self vehlookat(var_9fa20618);
	self function_a57c34b7(var_9fa20618, 0, 0);
	self waittill(#"goal", #"near_goal");
	self vehlookat(endorigin);
	self function_a57c34b7(endorigin, 0, 0);
	self setspeed(level.var_c7f8ccf6 + (level.var_c7f8ccf6 * 0.66667));
	self waittill(#"goal", #"near_goal");
	self deletedelay();
}

/*
	Name: function_71da60d1
	Namespace: player_insertion
	Checksum: 0x3F549194
	Offset: 0x5C08
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_71da60d1()
{
	wait(4);
	level notify(#"formation_start");
	self setspeed(level.var_c7f8ccf6);
}

/*
	Name: function_84898b3f
	Namespace: player_insertion
	Checksum: 0x248EB3A8
	Offset: 0x5C50
	Size: 0x116
	Parameters: 4
	Flags: None
*/
function function_84898b3f(var_e8ab2c6b, var_9fa20618, endorigin, index)
{
	/#
		self endon(#"death");
		while(getdvarint(#"hash_5bbd3d044e1ec1b8", 0))
		{
			color = (index > 0 ? (1, 0, 0) : (0, 0, 1));
			sphere(var_e8ab2c6b, 700, color);
			sphere(var_9fa20618, 700, color);
			sphere(endorigin, 700, color);
			line(var_e8ab2c6b, var_9fa20618, color);
			line(var_9fa20618, endorigin, color);
			waitframe(1);
		}
	#/
}

/*
	Name: function_ea6a4f96
	Namespace: player_insertion
	Checksum: 0x79D1C1F3
	Offset: 0x5D70
	Size: 0x214
	Parameters: 5
	Flags: Linked
*/
function function_ea6a4f96(startorigin, endorigin, var_872f085f, offsetvec, var_35c96bb3)
{
	self endon(#"death");
	self setspeedimmediate(level.var_c7f8ccf6);
	self setrotorspeed(1);
	self function_a57c34b7(endorigin, 0, 0);
	level waittill(#"formation_start");
	if(1)
	{
		direction = anglestoforward(var_872f085f);
		distance = distance(endorigin, startorigin);
		var_27dfb385 = int(distance) / 5000;
		remainingdist = int(distance) % 5000;
		for(i = 1; i <= var_27dfb385; i++)
		{
			self pathvariableoffset(offsetvec * ((var_27dfb385 - i) + 1), var_35c96bb3);
			self function_85635daf(startorigin, distance, (i * 5000) / distance);
		}
		if(remainingdist > 0)
		{
			self pathvariableoffset(offsetvec, var_35c96bb3);
		}
	}
	self waittill(#"goal", #"near_goal");
	self deletedelay();
}

/*
	Name: function_63793dbe
	Namespace: player_insertion
	Checksum: 0x935AA3D5
	Offset: 0x5F90
	Size: 0xD8
	Parameters: 0
	Flags: Private
*/
function private function_63793dbe()
{
	/#
		time = getdvarfloat(#"hash_102dc944a54c88d9", 0);
		if(time)
		{
			wait(time);
			foreach(player in function_a1ef346b())
			{
				player flag::set(#"hash_224cb97b8f682317");
			}
		}
	#/
}

/*
	Name: function_afdad0c8
	Namespace: player_insertion
	Checksum: 0x2087BC0D
	Offset: 0x6070
	Size: 0x5E4
	Parameters: 5
	Flags: Linked, Private
*/
function private function_afdad0c8(insertion, plane, startpoint, endpoint, var_671fc488)
{
	/#
		assert(isstruct(insertion));
	#/
	self notify("265ad7a7475e7adb");
	self endon("265ad7a7475e7adb");
	plane endon(#"death");
	foreach(vehicle in insertion.var_41091905)
	{
		vehicle clientfield::set("infiltration_landing_gear", 1);
		vehicle setrotorspeed(1);
	}
	var_5d59bc67 = 17.6 * level.var_c7f8ccf6;
	var_5e24c814 = 5 * var_5d59bc67;
	total_distance = distance(startpoint, endpoint);
	/#
		assert(total_distance > var_671fc488);
	#/
	/#
		assert((var_671fc488 - var_5e24c814) > 0);
	#/
	/#
		assert(total_distance > (var_671fc488 - var_5e24c814));
	#/
	var_f26cf241 = (var_671fc488 - var_5e24c814) / total_distance;
	end_t = var_671fc488 / total_distance;
	/#
		level thread function_63793dbe();
	#/
	plane function_85635daf(startpoint, total_distance, var_f26cf241);
	/#
		debug_sphere(plane.origin, 75, (0, 1, 1));
	#/
	function_a5fd9aa8(insertion);
	foreach(player in insertion.players)
	{
		if(is_true(player.var_97b0977))
		{
			continue;
		}
		player clientfield::set_to_player("infiltration_final_warning", 1);
	}
	plane function_85635daf(startpoint, total_distance, end_t);
	/#
		debug_sphere(plane.origin, 75, (0, 1, 1));
	#/
	level callback::callback(#"hash_774be40ec06d5212");
	function_a5fd9aa8(insertion);
	foreach(player in insertion.players)
	{
		if(!isdefined(player) || !player function_51350a25())
		{
			continue;
		}
		player flag::set(#"hash_224cb97b8f682317");
		wait(0.11);
	}
	function_dd34168c(insertion, #"hash_60fcdd11812a0134");
	wait(1);
	for(index = 0; index <= insertion.var_41091905.size; index++)
	{
		if(isdefined(insertion.cameraent[index]))
		{
			insertion.cameraent[index] delete();
		}
	}
	if(isdefined(insertion.var_b686c9d))
	{
		insertion.var_b686c9d delete();
	}
	if(isdefined(insertion.var_d908905e))
	{
		insertion.var_d908905e delete();
	}
	if(isdefined(insertion.infilteament))
	{
		insertion.infilteament delete();
	}
	wait(5);
	currentvalue = level clientfield::get("infiltration_compass");
	newvalue = (~(1 << insertion.index)) & currentvalue;
	level clientfield::set("infiltration_compass", newvalue);
}

/*
	Name: function_6da3daa0
	Namespace: player_insertion
	Checksum: 0xB80992A8
	Offset: 0x6660
	Size: 0x2EC
	Parameters: 5
	Flags: Linked, Private
*/
function private function_6da3daa0(insertion, plane, startpoint, endpoint, var_6a694ed8)
{
	/#
		assert(isstruct(insertion));
	#/
	self notify("185f380e88d87355");
	self endon("185f380e88d87355");
	plane endon(#"death");
	var_5d59bc67 = 17.6 * level.var_c7f8ccf6;
	var_7cd0d619 = 0.6 * var_5d59bc67;
	total_distance = distance(startpoint, endpoint);
	/#
		assert(total_distance > var_6a694ed8);
	#/
	/#
		assert((var_6a694ed8 - var_7cd0d619) > 0);
	#/
	/#
		assert(total_distance > (var_6a694ed8 - var_7cd0d619));
	#/
	cargo_t = (var_6a694ed8 - var_7cd0d619) / total_distance;
	start_t = var_6a694ed8 / total_distance;
	plane function_85635daf(startpoint, total_distance, cargo_t);
	/#
		debug_sphere(plane.origin, 75, (0, 1, 1));
	#/
	insertion thread function_d11a5f0c(insertion);
	plane function_85635daf(startpoint, total_distance, start_t);
	/#
		debug_sphere(plane.origin, 75, (0, 1, 1));
	#/
	function_a5fd9aa8(insertion);
	foreach(player in insertion.players)
	{
		player flag::set(#"hash_287397edba8966f9");
	}
	wait(2);
	insertion callback::callback(#"hash_20fcd06900f62558");
}

/*
	Name: function_bc16f3b4
	Namespace: player_insertion
	Checksum: 0x38576F83
	Offset: 0x6958
	Size: 0x118
	Parameters: 1
	Flags: Linked
*/
function function_bc16f3b4(insertion)
{
	/#
		assert(isstruct(insertion));
	#/
	self clientfield::set("infiltration_transport", 1);
	function_a5fd9aa8(insertion);
	foreach(player in insertion.players)
	{
		if(player islinkedto(self))
		{
			player clientfield::set_to_player("infiltration_jump_warning", 1);
		}
	}
}

/*
	Name: function_d11a5f0c
	Namespace: player_insertion
	Checksum: 0xB152F24A
	Offset: 0x6A78
	Size: 0x218
	Parameters: 1
	Flags: Linked
*/
function function_d11a5f0c(insertion)
{
	/#
		assert(isstruct(insertion));
	#/
	function_a5fd9aa8(insertion);
	foreach(player in insertion.players)
	{
		player.var_97b0977 = 0;
	}
	foreach(vehicle in insertion.var_41091905)
	{
		vehicle function_bc16f3b4(insertion);
		wait(randomfloatrange(0.5, 1));
	}
	function_a5fd9aa8(insertion);
	foreach(player in insertion.players)
	{
		if(isdefined(player))
		{
			player clientfield::set_to_player("realtime_multiplay", 1);
		}
	}
}

/*
	Name: function_b80277f7
	Namespace: player_insertion
	Checksum: 0x5578BE90
	Offset: 0x6C98
	Size: 0x170
	Parameters: 0
	Flags: Linked
*/
function function_b80277f7()
{
	if(isbot(self))
	{
		self bot_insertion::function_a4f516ef();
		return;
	}
	while(true)
	{
		waitframe(1);
		if(self flag::get(#"hash_287397edba8966f9") && isdefined(level.insertionpassenger) && isdefined(level.var_f3320ad2) && isdefined(level.var_a3c0d635) && isdefined(level.var_ce84dde9) && !level.insertionpassenger [[level.var_a3c0d635]](self))
		{
			level.insertionpassenger [[level.var_f3320ad2]](self);
			level.insertionpassenger [[level.var_ce84dde9]](self, level.insertion.passengercount);
		}
		if(self flag::get(#"hash_224cb97b8f682317") || (self flag::get(#"hash_287397edba8966f9") && self jumpbuttonpressed()))
		{
			return;
		}
	}
}

/*
	Name: function_1c06c249
	Namespace: player_insertion
	Checksum: 0x20D84D49
	Offset: 0x6E10
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_1c06c249(plane)
{
	if(isplayer(self) && isdefined(plane))
	{
		self match_record::function_ded5f5b6(#"hash_1657e02fb5073e4a", plane.origin);
		self match_record::set_player_stat(#"hash_16618233fdac5c29", gettime());
		self match_record::set_player_stat(#"hash_63b95d780b2bd355", self flag::get(#"hash_224cb97b8f682317"));
	}
}

/*
	Name: function_25facefd
	Namespace: player_insertion
	Checksum: 0xE7C87AED
	Offset: 0x6ED8
	Size: 0xFC
	Parameters: 2
	Flags: Linked
*/
function function_25facefd(count, ignore_player)
{
	if(isdefined(level.insertionpassenger) && isdefined(level.var_a3c0d635) && isdefined(level.var_ce84dde9))
	{
		foreach(player in getplayers())
		{
			if(level.insertionpassenger [[level.var_a3c0d635]](player))
			{
				level.insertionpassenger [[level.var_ce84dde9]](player, ignore_player);
			}
		}
	}
}

/*
	Name: function_2e54d73e
	Namespace: player_insertion
	Checksum: 0x550E4E04
	Offset: 0x6FE0
	Size: 0xCC
	Parameters: 3
	Flags: Linked
*/
function function_2e54d73e(insertion, passenger, vehicle)
{
	/#
		assert(isstruct(insertion));
	#/
	if(isdefined(vehicle))
	{
		vehicle endon(#"death");
	}
	waitresult = undefined;
	waitresult = passenger waittill(#"disconnect", #"player_jumped");
	if(isdefined(insertion.passengercount))
	{
		insertion.passengercount--;
		function_25facefd(insertion.passengercount);
	}
}

/*
	Name: function_ced05c63
	Namespace: player_insertion
	Checksum: 0x29247069
	Offset: 0x70B8
	Size: 0xBC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ced05c63(note, payload)
{
	teammates = getplayers(self.team);
	foreach(player in teammates)
	{
		if(player == self)
		{
			continue;
		}
		player notify(note, payload);
	}
}

/*
	Name: function_8ab37f3b
	Namespace: player_insertion
	Checksum: 0x44727ECC
	Offset: 0x7180
	Size: 0x12C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8ab37f3b(aircraft)
{
	friendlies = getplayers(self.team);
	var_d603dbcf = 1;
	foreach(friendly in friendlies)
	{
		if(friendly == self)
		{
			continue;
		}
		if(friendly islinkedto(aircraft))
		{
			aircraft playsoundtoplayer(#"hash_30b8de3aeaf8d338", friendly);
			var_d603dbcf = 0;
		}
	}
	if(var_d603dbcf)
	{
		self playsoundtoplayer(#"hash_2181506039f121cb", self);
	}
}

/*
	Name: function_5b3ac9f2
	Namespace: player_insertion
	Checksum: 0x2E8E16BC
	Offset: 0x72B8
	Size: 0x264
	Parameters: 1
	Flags: Linked
*/
function function_5b3ac9f2(aircraft)
{
	self notify("5e0dabf700a8b06e");
	self endon("5e0dabf700a8b06e");
	self endon(#"death");
	self function_b9a53f50();
	self function_b80277f7();
	self function_ced05c63(#"hash_3a41cbe85bdb81e1", {#player:self});
	self function_8ab37f3b(aircraft);
	self function_1c06c249(aircraft);
	self startcameratween(1);
	self thread function_eac07dca(aircraft);
	util::wait_network_frame();
	self cameraactivate(0);
	self setclientthirdperson(0);
	self jump_anim(aircraft);
	self death_circle::function_b57e3cde(0);
	self clientfield::set_to_player("inside_infiltration_vehicle", 0);
	if(isdefined(level.insertionpassenger) && isdefined(level.var_81b39a59))
	{
		level.insertionpassenger [[level.var_81b39a59]](self);
	}
	self hide_postfx();
	self stoprumble(#"hash_233b436a07cd091a");
	self val::reset(#"player_insertion", "show_weapon_hud");
	level callback::callback(#"hash_74b19f5972b0ee52", {#player:self});
}

/*
	Name: jump_anim
	Namespace: player_insertion
	Checksum: 0x245FC652
	Offset: 0x7528
	Size: 0x2D4
	Parameters: 1
	Flags: Linked
*/
function jump_anim(aircraft)
{
	self endon(#"death");
	self unlink();
	self setorigin(self.var_df1a9210.origin);
	self playerlinkto(self.var_df1a9210);
	var_989bbf05 = anglestoforward(aircraft.angles);
	planeright = anglestoright(aircraft.angles);
	playerforward = anglestoforward(self getplayerangles());
	forwarddot = vectordot(var_989bbf05, playerforward);
	if(forwarddot > 0.7071068)
	{
		if(math::cointoss())
		{
			anim = #"hash_49be5b5409a97147";
		}
		else
		{
			anim = #"hash_49be415409a94519";
		}
	}
	else
	{
		if(forwarddot < -0.7071068)
		{
			anim = #"hash_d6c9fa8235b69f8";
		}
		else
		{
			var_1006dafa = vectordot(planeright, playerforward);
			if(var_1006dafa > 0)
			{
				anim = #"hash_46c65ea54508f35f";
			}
			else
			{
				anim = #"hash_46c674a5450918c1";
			}
		}
	}
	self playsoundtoplayer(#"hash_214da797e3f63ec5", self);
	self.var_df1a9210 animation::play(anim, aircraft, "tag_player_spawn");
	self unlink();
	self setorigin(self.var_df1a9210.origin - vectorscale((0, 0, 1), 215));
	self show();
	self solid();
	self.var_df1a9210 delete();
}

/*
	Name: function_eac07dca
	Namespace: player_insertion
	Checksum: 0x11C87205
	Offset: 0x7808
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function function_eac07dca(aircraft)
{
	self notify("615f47fd3807b340");
	self endon("615f47fd3807b340");
	self endon(#"disconnect");
	self notify(#"player_jumped");
	self function_3354a054();
	self hud_message::clearlowermessage();
	self val::set(#"player_insertion", "disable_oob", 0);
	velocity = function_2b41b403(aircraft getvelocity());
	level callback::callback(#"hash_259e3bcba73a2f14", {#player:self});
	var_a91303da = 2;
	self function_ed4c9a32(var_a91303da, 0, undefined, velocity, 0);
}

/*
	Name: start_freefall
	Namespace: player_insertion
	Checksum: 0x437CDBF7
	Offset: 0x7958
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function start_freefall(velocity, height)
{
	self function_8a945c0e(0);
	self callback::function_d8abfc3d(#"freefall", &function_3b9bcf85);
	self player_free_fall::function_7705a7fc(0, height);
	self playsoundtoplayer(#"hash_214da797e3f63ec5", self);
	self.var_97b0977 = 1;
	self hud_message::clearlowermessage();
	self val::set(#"player_insertion", "disable_oob", 0);
	self function_3354a054();
	self thread function_712f9f52();
}

/*
	Name: function_4630bf0a
	Namespace: player_insertion
	Checksum: 0x8299013C
	Offset: 0x7A70
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function function_4630bf0a()
{
	if(isplayer(self))
	{
		self match_record::function_ded5f5b6(#"hash_7d9d379ecba10793", self.origin);
		self match_record::set_player_stat(#"hash_1469faf3180d8b7a", gettime());
		self.var_37ef8626 = gettime();
	}
}

/*
	Name: function_4eb0c560
	Namespace: player_insertion
	Checksum: 0x1BBA81E1
	Offset: 0x7AE8
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function function_4eb0c560()
{
	self clientfield::set_player_uimodel("hudItems.skydiveAltimeterVisible", 0);
	self val::reset(#"player_insertion", "disablegadgets");
	self val::reset(#"player_insertion", "show_hud");
	self val::reset(#"player_insertion", "show_weapon_hud");
	if(is_true(level.spawnsystem.deathcirclerespawn) || (isdefined(level.waverespawndelay) && level.waverespawndelay > 0))
	{
		self clientfield::set_player_uimodel("hudItems.showReinsertionPassengerCount", 1);
	}
}

/*
	Name: function_3b9bcf85
	Namespace: player_insertion
	Checksum: 0x13491B4C
	Offset: 0x7BF8
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_3b9bcf85(args)
{
	if(!is_true(args.freefall) && !is_true(args.var_695a7111))
	{
		function_4eb0c560();
	}
}

/*
	Name: function_916470ec
	Namespace: player_insertion
	Checksum: 0x56A6628
	Offset: 0x7C60
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_916470ec(args)
{
	function_4eb0c560();
}

/*
	Name: function_4feecc32
	Namespace: player_insertion
	Checksum: 0xA7D74B93
	Offset: 0x7C88
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_4feecc32()
{
	self setclientthirdperson(0);
	self show();
	self solid();
	self val::reset(#"player_insertion", "takedamage");
	self val::reset(#"warzonestaging", "takedamage");
	self death_circle::function_b57e3cde(0);
	self val::set(#"player_insertion", "disable_oob", 0);
	self clientfield::set_to_player("realtime_multiplay", 1);
}

/*
	Name: function_712f9f52
	Namespace: player_insertion
	Checksum: 0xE0F84020
	Offset: 0x7D90
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_712f9f52()
{
	self endon(#"death");
	if(is_true(level.var_7abaaef1))
	{
		callback::function_d8abfc3d(#"parachute", &function_66c91693);
	}
	else
	{
		callback::function_d8abfc3d(#"hash_171443902e2a22ee", &function_f99c2453);
	}
	callback::on_death(&function_916470ec);
}

/*
	Name: function_f99c2453
	Namespace: player_insertion
	Checksum: 0xBBFC4980
	Offset: 0x7E58
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f99c2453(params)
{
	self clientfield::set_player_uimodel("hudItems.skydiveAltimeterVisible", 0);
	if(is_true(level.spawnsystem.deathcirclerespawn) || (isdefined(level.waverespawndelay) && level.waverespawndelay > 0))
	{
		self clientfield::set_player_uimodel("hudItems.showReinsertionPassengerCount", 1);
	}
	self callback::function_52ac9652(#"hash_171443902e2a22ee", &function_f99c2453);
}

/*
	Name: function_66c91693
	Namespace: player_insertion
	Checksum: 0xB7556CB1
	Offset: 0x7F28
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_66c91693(eventstruct)
{
	if(!eventstruct.parachute)
	{
		self function_4630bf0a();
		function_916470ec(self);
		self callback::function_52ac9652(#"parachute", &function_66c91693);
		self callback::remove_on_death(&function_916470ec);
	}
}

/*
	Name: function_d7f18e8f
	Namespace: player_insertion
	Checksum: 0x73F80A37
	Offset: 0x7FC8
	Size: 0x98
	Parameters: 1
	Flags: Private
*/
function private function_d7f18e8f(players)
{
	foreach(player in players)
	{
		if(!isbot(player))
		{
			return player;
		}
	}
}

/*
	Name: function_6660c1f
	Namespace: player_insertion
	Checksum: 0x326F92DA
	Offset: 0x8068
	Size: 0xB6
	Parameters: 0
	Flags: Linked
*/
function function_6660c1f()
{
	/#
		if(getdvarint(#"scr_disable_infiltration", 0))
		{
			return false;
		}
	#/
	if(!isdefined(level.insertions))
	{
		return false;
	}
	for(index = 0; index < level.insertions.size; index++)
	{
		insertion = level.insertions[index];
		if(insertion flag::get(#"hash_60fcdd11812a0134"))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_e5d4df1c
	Namespace: player_insertion
	Checksum: 0x93D2E158
	Offset: 0x8128
	Size: 0x76
	Parameters: 0
	Flags: None
*/
function function_e5d4df1c()
{
	for(index = 0; index < level.insertions.size; index++)
	{
		insertion = level.insertions[index];
		if(insertion flag::get(#"hash_122f326d72f4c884"))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_a4deb676
	Namespace: player_insertion
	Checksum: 0xD4C17331
	Offset: 0x81A8
	Size: 0xEA
	Parameters: 0
	Flags: Linked
*/
function function_a4deb676()
{
	a_start_buttons = getentarray("game_start_button", "script_noteworthy");
	array::delete_all(a_start_buttons);
	if(isdefined(level.var_63460f40))
	{
		foreach(object in level.var_63460f40)
		{
			object gameobjects::destroy_object(1);
		}
		level.var_63460f40 = undefined;
	}
}

/*
	Name: show_postfx
	Namespace: player_insertion
	Checksum: 0x72CB08A8
	Offset: 0x82A0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function show_postfx()
{
	self clientfield::set_to_player("heatblurpostfx", 1);
}

/*
	Name: hide_postfx
	Namespace: player_insertion
	Checksum: 0x1E7469B3
	Offset: 0x82D0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function hide_postfx()
{
	self clientfield::set_to_player("heatblurpostfx", 0);
}

/*
	Name: function_943c98fb
	Namespace: player_insertion
	Checksum: 0x7E40A652
	Offset: 0x8300
	Size: 0x2A0
	Parameters: 1
	Flags: Private
*/
function private function_943c98fb(insertion)
{
	/#
		/#
			assert(isstruct(insertion));
		#/
		mapname = util::get_map_name();
		adddebugcommand(("" + mapname) + "");
		waitframe(1);
		adddebugcommand(("" + mapname) + "");
		waitframe(1);
		adddebugcommand(("" + mapname) + "");
		waitframe(1);
		adddebugcommand(("" + mapname) + "");
		waitframe(1);
		adddebugcommand(("" + mapname) + "");
		while(true)
		{
			waitframe(1);
			string = getdvarstring(#"hash_683dafe2da41b42e", "");
			start_insertion = 0;
			switch(string)
			{
				case "start_insertion":
				{
					start_insertion = 1;
					break;
				}
				case "repath_flight":
				{
					insertion on_finalize_initialization();
				}
				default:
				{
					break;
				}
			}
			if(start_insertion)
			{
				level function_8dcd8623();
			}
			setdvar(#"hash_683dafe2da41b42e", "");
			if(getdvarint(#"hash_5566ccc7de522a4a", 0))
			{
				setdvar(#"hash_5566ccc7de522a4a", 0);
				level thread namespace_b9471dc1::function_4910c182(insertion);
			}
		}
	#/
}

/*
	Name: function_bc144896
	Namespace: player_insertion
	Checksum: 0xC309DDC2
	Offset: 0x85A8
	Size: 0x3F4
	Parameters: 0
	Flags: Linked
*/
function function_bc144896()
{
	var_f91e1d86 = 256;
	var_15e03744 = 0;
	var_eb0cb2e8 = 1;
	var_ceb87008 = 0.5;
	var_ec878a03 = 0;
	var_345d6bc2 = 0;
	var_56e391f5 = 5000;
	var_387d8ced = 10;
	var_84d65252 = 2;
	var_82a96275 = 10000;
	var_9fc10c55 = 7500;
	var_708b2fe0 = -2;
	function_5ac4dc99("scr_parachute_redeploy_min_height", var_f91e1d86);
	function_5ac4dc99("scr_parachute_redeploy_input_type", var_15e03744);
	function_5ac4dc99("scr_parachute_auto_kick_map_center", (0, 0, 0));
	function_5ac4dc99("scr_parachute_camera_transition_mode", 2);
	function_5ac4dc99("scr_parachute_FFSM_enabled", 1);
	function_5ac4dc99("scr_parachute_hint_enabled", var_eb0cb2e8);
	function_5ac4dc99("scr_parachute_hint_zdrop", var_ceb87008);
	function_5ac4dc99("scr_parachute_hint_zoffset", var_ec878a03);
	function_5ac4dc99("scr_parachute_hint_zvelscale", var_345d6bc2);
	function_5ac4dc99("scr_parachute_hint_zlimit", var_56e391f5);
	function_5ac4dc99("scr_parachute_hint_xyvelscale_high", var_387d8ced);
	function_5ac4dc99("scr_parachute_hint_xyvelscale_low", var_84d65252);
	function_5ac4dc99("scr_parachute_hint_xyvelscale_maxheight", var_82a96275);
	function_5ac4dc99("scr_parachute_hint_xylimit", var_9fc10c55);
	function_5ac4dc99("scr_parachute_hint_falling_xyratio", var_708b2fe0);
	level.parachutecancutautodeploy = getdvarint(#"hash_66102f189c07f6f", 1);
	level.parachutecancutparachute = getdvarint(#"hash_432959289606da80", 1);
	level.parachuteinitfinished = 1;
	level.activeparachuters = [];
	if(!isdefined(level.dontshootwhileparachuting))
	{
		level.dontshootwhileparachuting = 1;
	}
	if(!isdefined(level.freefallstartcb))
	{
		level.freefallstartcb = &function_435d1356;
	}
	if(!isdefined(level.parachuteopencb))
	{
		level.parachuteopencb = &function_2f112556;
	}
	if(!isdefined(level.parachutecompletecb))
	{
		level.parachutecompletecb = &function_a4f5dbf9;
	}
	if(!isdefined(level.parachutetakeweaponscb))
	{
		level.parachutetakeweaponscb = &function_e5b1d4c7;
	}
	if(!isdefined(level.parachuterestoreweaponscb))
	{
		level.parachuterestoreweaponscb = &function_750cef68;
	}
	if(!isdefined(level.parachuteprelaststandfunc))
	{
		level.parachuteprelaststandfunc = &function_9e7ff546;
	}
}

/*
	Name: function_ed4c9a32
	Namespace: player_insertion
	Checksum: 0x76564540
	Offset: 0x89A8
	Size: 0x422
	Parameters: 5
	Flags: Linked
*/
function function_ed4c9a32(falltime, var_1e13fbc6, var_921a1f7e, var_dc39d0fc, takeweapons)
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	self notify(#"freefallfromplanestatemachine");
	self endon(#"freefallfromplanestatemachine");
	player = self;
	player.var_97b0977 = 1;
	player.ffsm_state = 1;
	player.ffsm_nextstreamhinttime = 0;
	player ffsm_introsetup(falltime, var_1e13fbc6, var_921a1f7e, var_dc39d0fc, takeweapons);
	player ffsm_skydive_stateenter();
	var_d5dd0ca5 = 2000;
	starttime = gettime();
	while(true)
	{
		if(player isskydiving() || (starttime + var_d5dd0ca5) < gettime() || player function_b9370594())
		{
			break;
		}
		waitframe(1);
	}
	self setisinfilskydive(0);
	while(true)
	{
		if(player isinfreefall() && player.ffsm_state != 1)
		{
			player ffsm_skydive_stateenter();
			player.ffsm_state = 1;
		}
		if(player isparachuting() && player.ffsm_state != 2)
		{
			player ffsm_parachuteopen_stateenter();
			player.ffsm_state = 2;
		}
		if(!player isskydiving() && player.ffsm_state != 3 && player.ffsm_state != 4 && player.ffsm_state != 6 || player.ffsm_state == 5)
		{
			player ffsm_landed_stateenter();
			if(player.ffsm_state != 5)
			{
				player.ffsm_state = 3;
			}
			else
			{
				/#
					assert(player.ffsm_state == 5);
				#/
				player.ffsm_state = 6;
			}
		}
		var_a58af056 = is_true(player.inlaststand);
		var_de16a625 = player isonground() && (player.ffsm_state == 3 || player function_b9370594());
		var_b1f6ff7a = player isplayerswimming() && (player.ffsm_state == 3 || player function_b9370594());
		var_91d1c5fd = !isalive(player);
		if(var_a58af056 || var_de16a625 || var_b1f6ff7a || var_91d1c5fd)
		{
			player ffsm_onground_stateenter();
			player.ffsm_state = undefined;
			player.ffsm_isgulagrespawn = undefined;
			player.ffsm_nextstreamhinttime = undefined;
			return;
		}
		waitframe(1);
	}
}

/*
	Name: function_b9370594
	Namespace: player_insertion
	Checksum: 0xE91A07AC
	Offset: 0x8DD8
	Size: 0x30
	Parameters: 0
	Flags: Linked
*/
function function_b9370594()
{
	return isdefined(self.ffsm_state) && (self.ffsm_state == 5 || self.ffsm_state == 6);
}

/*
	Name: ffsm_introsetup
	Namespace: player_insertion
	Checksum: 0x5F9DAF05
	Offset: 0x8E10
	Size: 0x1F0
	Parameters: 5
	Flags: Linked
*/
function ffsm_introsetup(falltime, var_1e13fbc6, var_921a1f7e, var_dc39d0fc, takeweapons)
{
	/#
		if(getdvarint(#"hash_517fa3f3ae2f8e77", 0) == 1)
		{
			self thread function_c3c0b24b();
		}
	#/
	self function_8cf53a19();
	if(!is_true(level.parachuteinitfinished))
	{
		function_bc144896();
	}
	var_e5fc45d3 = 4;
	if(!isdefined(var_1e13fbc6))
	{
		var_1e13fbc6 = var_e5fc45d3;
	}
	if(!isdefined(takeweapons))
	{
		takeweapons = 1;
	}
	self [[level.freefallstartcb]]();
	if(isdefined(var_dc39d0fc))
	{
		self setvelocity(var_dc39d0fc);
	}
	self function_b02c52b();
	self setisinfilskydive(1);
	if(getdvarint(#"scr_parachute_camera_transition_mode", 1) != 2)
	{
		self function_41170420(1);
	}
	if(is_true(var_921a1f7e))
	{
		self thread player_free_fall::function_2979b1be(0);
	}
	else
	{
		self thread player_free_fall::function_2979b1be(var_1e13fbc6);
	}
	self [[level.parachuterestoreweaponscb]]();
}

/*
	Name: ffsm_skydive_stateenter
	Namespace: player_insertion
	Checksum: 0x58701D5B
	Offset: 0x9008
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function ffsm_skydive_stateenter()
{
	self clientfield::set_player_uimodel("hudItems.skydiveAltimeterVisible", 1);
}

/*
	Name: ffsm_parachuteopen_stateenter
	Namespace: player_insertion
	Checksum: 0x53FEB932
	Offset: 0x9038
	Size: 0x48
	Parameters: 0
	Flags: Linked
*/
function ffsm_parachuteopen_stateenter()
{
	self notify(#"hash_6296a62cf6a8a8c4");
	if(!is_true(level.dontshootwhileparachuting))
	{
		self [[level.parachuteopencb]]();
	}
}

/*
	Name: ffsm_landed_stateenter
	Namespace: player_insertion
	Checksum: 0xE3EEA312
	Offset: 0x9088
	Size: 0xDE
	Parameters: 1
	Flags: Linked
*/
function ffsm_landed_stateenter(var_991bab43)
{
	self.ignorefalldamagetime = gettime() + 5000;
	if(is_true(self.delayswaploadout))
	{
		self.delayswaploadout = 0;
	}
	if(is_true(level.dontshootwhileparachuting))
	{
		self [[level.parachutecompletecb]]();
	}
	self notify(#"hash_56c07a749ce0f359");
	self function_41170420(0);
	if(!self function_b9370594())
	{
		self function_8b8a321a(1);
	}
	self notify(#"parachute_complete");
}

/*
	Name: ffsm_onground_stateenter
	Namespace: player_insertion
	Checksum: 0x2B54C272
	Offset: 0x9170
	Size: 0x50
	Parameters: 0
	Flags: Linked
*/
function ffsm_onground_stateenter()
{
	function_4eb0c560();
	self thread function_71205442();
	if(isdefined(level.onfirstlandcallback))
	{
		self [[level.onfirstlandcallback]](self);
	}
}

/*
	Name: function_71205442
	Namespace: player_insertion
	Checksum: 0x80F724D1
	Offset: 0x91C8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_71205442()
{
}

/*
	Name: function_435d1356
	Namespace: player_insertion
	Checksum: 0xEF74E56D
	Offset: 0x91D8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_435d1356()
{
	self disableusability();
}

/*
	Name: function_2f112556
	Namespace: player_insertion
	Checksum: 0x80F724D1
	Offset: 0x9200
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_2f112556()
{
}

/*
	Name: function_a4f5dbf9
	Namespace: player_insertion
	Checksum: 0x48321731
	Offset: 0x9210
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_a4f5dbf9()
{
	self enableusability();
	if(isdefined(level.modespecificparachutecompletecb))
	{
		self [[level.modespecificparachutecompletecb]]();
	}
	self.jumptype = undefined;
}

/*
	Name: function_e5b1d4c7
	Namespace: player_insertion
	Checksum: 0x80F724D1
	Offset: 0x9268
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_e5b1d4c7()
{
}

/*
	Name: function_750cef68
	Namespace: player_insertion
	Checksum: 0x80F724D1
	Offset: 0x9278
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_750cef68()
{
}

/*
	Name: function_7c164b8f
	Namespace: player_insertion
	Checksum: 0x80F724D1
	Offset: 0x9288
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_7c164b8f()
{
}

/*
	Name: function_7e55f28b
	Namespace: player_insertion
	Checksum: 0x80F724D1
	Offset: 0x9298
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_7e55f28b()
{
}

/*
	Name: function_9e7ff546
	Namespace: player_insertion
	Checksum: 0x653D2273
	Offset: 0x92A8
	Size: 0x72
	Parameters: 0
	Flags: Linked
*/
function function_9e7ff546()
{
	player = self;
	if(isdefined(player.ffsm_state) && (player.ffsm_state == 1 || player.ffsm_state == 2))
	{
		player ffsm_landed_stateenter();
		player.ffsm_state = 3;
	}
}

/*
	Name: draw_line
	Namespace: player_insertion
	Checksum: 0x769D0F61
	Offset: 0x9328
	Size: 0xB2
	Parameters: 4
	Flags: None
*/
function draw_line(start, end, var_7c97a37e, color)
{
	/#
		var_7c927bcc = int(var_7c97a37e / (float(function_60d95f53()) / 1000));
		for(frame = 0; frame < var_7c927bcc; frame++)
		{
			line(start, end, color);
			waitframe(1);
		}
	#/
}

/*
	Name: draw_angles
	Namespace: player_insertion
	Checksum: 0x2BD84133
	Offset: 0x93E8
	Size: 0x19A
	Parameters: 4
	Flags: None
*/
function draw_angles(origin, angles, var_753aae30, scalar)
{
	/#
		if(!isdefined(scalar))
		{
			scalar = 1;
		}
		var_7c927bcc = int(var_753aae30 / (float(function_60d95f53()) / 1000));
		for(frame = 0; frame < var_7c927bcc; frame++)
		{
			fwd = anglestoforward(angles);
			right = anglestoright(angles);
			up = anglestoup(angles);
			line(origin, origin + ((fwd * 12) * scalar), (1, 0, 0));
			line(origin, origin + ((right * 12) * scalar), (0, 1, 0));
			line(origin, origin + ((up * 12) * scalar), (0, 0, 1));
			waitframe(1);
		}
	#/
}

/*
	Name: function_c3c0b24b
	Namespace: player_insertion
	Checksum: 0x4EF5FA2D
	Offset: 0x9590
	Size: 0xFE
	Parameters: 0
	Flags: None
*/
function function_c3c0b24b()
{
	/#
		self endon(#"death", #"disconnect");
		self endon(#"parachute_complete");
		while(true)
		{
			thread draw_angles(self.origin, self.angles, 0.05, 5);
			velocity = self getvelocity();
			mag = length(velocity);
			thread draw_line(self.origin, self.origin + (vectornormalize(velocity) * mag), 0.05, (1, 0, 1));
			waitframe(1);
		}
	#/
}

