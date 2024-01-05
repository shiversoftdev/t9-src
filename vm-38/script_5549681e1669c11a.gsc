#using script_2440f86f9cd325ac;
#using script_683a55734f15d50e;
#using script_2c9915120c137848;
#using script_2474a362752098d2;
#using script_77357b2d180aa2b8;
#using script_50fca1a24ae351;
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_3bbf85ab4cb9f3c2;
#using script_40f967ad5d18ea74;
#using script_3faf478d5b0850fe;
#using script_47851dbeea22fe66;
#using script_1ce46999727f2f2b;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_774302f762d76254;
#using script_6b6510e124bad778;
#using script_1b0b07ff57d1dde3;
#using script_634ae70c663d1cc9;
#using script_1ee011cd0961afd7;
#using script_350cffecd05ef6cf;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using script_f38dc50f0e82277;
#using script_68cdf0ca5df5e;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_5a917022;

/*
	Name: function_f2640b20
	Namespace: namespace_5a917022
	Checksum: 0xD6FC24AA
	Offset: 0x950
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f2640b20()
{
	level notify(1064955217);
}

/*
	Name: init
	Namespace: namespace_5a917022
	Checksum: 0xA976A3B0
	Offset: 0x970
	Size: 0x640
	Parameters: 0
	Flags: Linked
*/
function init()
{
	objective_add(11, "invisible", (0, 0, 0), #"hash_3c82fb0aa0fa4fed");
	clientfield::register("world", "set_bonus_room", 1, 4, "int");
	level.doa.var_8f6ccf63 = [];
	rooms = struct::get_array("zombietron_bonus_room", "targetname");
	foreach(room in rooms)
	{
		room.name = room.script_noteworthy;
		room.id = function_b3411080(room.name);
		room.var_d52d06ee = function_d52d06ee(room.id);
		room.minlevel = 0;
		room.var_3914cffe = 999;
		room.var_74606c86 = 1;
		room.var_7d320f40 = 1;
		room.flipcamera = 0;
		room.timeout = 60;
		room.var_9045aedc = 0;
		room.var_5bbf26b8 = 0;
		room.cooldown = function_f9f3607b(room.name);
		if(isdefined(room.script_int))
		{
			room.minlevel = int(room.script_int);
		}
		if(isdefined(room.script_parameters))
		{
			args = strtok(room.script_parameters, ";");
			room.freecam = int(args[0]);
			if(args.size > 1)
			{
				room.flipcamera = int(args[1]);
			}
			if(args.size > 2)
			{
				room.var_74606c86 = int(args[2]);
			}
			if(args.size > 3)
			{
				room.var_7d320f40 = int(args[3]);
			}
			if(args.size > 4)
			{
				room.timeout = int(args[4]);
			}
			if(args.size > 5)
			{
				room.var_9045aedc = int(args[5]);
			}
			if(args.size > 6)
			{
				room.var_3914cffe = int(args[6]);
			}
		}
		/#
			assert(room.flipcamera == 0 || room.flipcamera == 1, "");
		#/
		level.doa.var_8f6ccf63[room.script_noteworthy] = room;
		room.player_starts = struct::get_array("zombietron_bonus_room_player_starts_" + room.name);
		room.items = struct::get_array("zombietron_bonus_room_item_" + room.name);
		room.npcs = struct::get_array("zombietron_bonus_room_npc_" + room.name);
		room.hazards = struct::get_array("zombietron_bonus_room_hazard_" + room.name);
		room.platforms = getentarray("zombietron_bonus_room_platform_" + room.name, "targetname");
		room.generators = struct::get_array("zombietron_bonus_room_generator_" + room.name);
		room.doors = struct::get_array("zombietron_bonus_room_door_" + room.name);
		room.var_1c59693d = struct::get("zombietron_bonus_room_dungeon_" + room.name, "script_noteworthy");
		room.var_2f0b512f = function_19e7d0fc(room.name);
		room.var_a043a6d4 = [];
		room.exit_trigger = getent("zombietron_bonus_room_exit_trigger_" + room.name, "targetname");
		room.var_6eb6f696 = getent("zombietron_bonus_room_abort_trigger_" + room.name, "targetname");
		/#
			assert(room.player_starts.size == 4);
		#/
		var_663588d = "Zombietron/Debug/AutoTesting/BonusRoomSoak/";
		var_59ea00e = ("scr_bonus_room_activate " + room.name) + "; zombie_devgui bonusroomsoak";
		util::add_devgui(var_663588d + room.name, var_59ea00e);
	}
}

/*
	Name: function_f9f3607b
	Namespace: namespace_5a917022
	Checksum: 0x30991EE1
	Offset: 0xFB8
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_f9f3607b(name)
{
	switch(name)
	{
		case "slideways":
		case "slideways2":
		case "slideways3":
		case "slideways4":
		{
			return 60 * 60000;
		}
	}
	return 15 * 60000;
}

/*
	Name: function_85615bbb
	Namespace: namespace_5a917022
	Checksum: 0x21502E36
	Offset: 0x1038
	Size: 0x250
	Parameters: 0
	Flags: Linked
*/
function function_85615bbb()
{
	rooms = struct::get_array("zombietron_bonus_room", "targetname");
	var_663588d = "Zombietron/Bonus Rooms/";
	label = "Disable Room Timeouts (TRUE):0";
	util::function_85c62761(var_663588d + label);
	label = "Disable Room Timeouts (FALSE):0";
	util::function_85c62761(var_663588d + label);
	foreach(room in rooms)
	{
		util::function_85c62761(var_663588d + room.name);
	}
	util::function_85c62761(var_663588d);
	util::wait_network_frame();
	label = (is_true(level.doa.var_206393b4) ? "Disable Room Timeouts (TRUE):0" : "Disable Room Timeouts (FALSE):0");
	util::add_devgui(var_663588d + label, "zombie_devgui bonusTimeoutDisableToggle");
	foreach(room in rooms)
	{
		var_59ea00e = ("scr_bonus_room_activate " + room.name) + "; zombie_devgui bonusroom";
		util::add_devgui(var_663588d + room.name, var_59ea00e);
	}
}

/*
	Name: main
	Namespace: namespace_5a917022
	Checksum: 0x3E3684D5
	Offset: 0x1290
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function main()
{
	objective_setstate(11, "invisible");
	level.doa.var_6f3d327 = undefined;
	level.doa.var_206393b4 = 0;
	level.doa.var_f8e35dd0 = 1;
	level.doa.var_79574675 = undefined;
	function_85615bbb();
}

/*
	Name: function_9da359eb
	Namespace: namespace_5a917022
	Checksum: 0xD337AA6C
	Offset: 0x1320
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_9da359eb()
{
	level.doa.var_206393b4 = !level.doa.var_206393b4;
	function_85615bbb();
}

/*
	Name: function_19e7d0fc
	Namespace: namespace_5a917022
	Checksum: 0x4C201181
	Offset: 0x1368
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_19e7d0fc(name)
{
	switch(name)
	{
		case "slideways":
		case "slideways2":
		case "slideways3":
		case "slideways4":
		{
			return &function_4d16b7a9;
		}
		case "snaketemple":
		{
			return &function_ab6edfa3;
		}
		case "warstore":
		{
			return &function_7cbb4f99;
		}
		case "roj":
		{
			return &function_b2706226;
		}
	}
	return undefined;
}

/*
	Name: function_d52d06ee
	Namespace: namespace_5a917022
	Checksum: 0x2577271F
	Offset: 0x1440
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function function_d52d06ee(id)
{
	if(id == 6)
	{
		return true;
	}
	if(id == 7)
	{
		return true;
	}
	if(id == 5)
	{
		return true;
	}
	if(id == 9)
	{
		return true;
	}
	if(id == 10)
	{
		return true;
	}
	if(id == 11)
	{
		return true;
	}
	if(id == 12)
	{
		return true;
	}
	return false;
}

/*
	Name: function_b3411080
	Namespace: namespace_5a917022
	Checksum: 0xB09D7FDD
	Offset: 0x14E8
	Size: 0x182
	Parameters: 1
	Flags: Linked
*/
function function_b3411080(name)
{
	switch(name)
	{
		case "armory":
		{
			return 1;
		}
		case "coop":
		{
			return 2;
		}
		case "treasure":
		{
			return 3;
		}
		case "tradingpost":
		{
			return 4;
		}
		case "nukebunker":
		{
			return 5;
		}
		case "snaketemple":
		{
			return 6;
		}
		case "crypt":
		{
			return 7;
		}
		case "cellar":
		{
			return 8;
		}
		case "slideways":
		{
			return 9;
		}
		case "slideways2":
		{
			return 10;
		}
		case "slideways3":
		{
			return 11;
		}
		case "slideways4":
		{
			return 11;
		}
		case "warstore":
		{
			return 13;
		}
		case "roj":
		{
			return 14;
		}
		default:
		{
			/#
				assert(0, "");
			#/
		}
	}
}

/*
	Name: function_d496f180
	Namespace: namespace_5a917022
	Checksum: 0xED79EA13
	Offset: 0x1678
	Size: 0x172
	Parameters: 1
	Flags: Linked
*/
function function_d496f180(name)
{
	switch(name)
	{
		case "armory":
		{
			return 26;
		}
		case "coop":
		{
			return 27;
		}
		case "treasure":
		{
			return 17;
		}
		case "tradingpost":
		{
			return 18;
		}
		case "nukebunker":
		{
			return 19;
		}
		case "snaketemple":
		{
			return 20;
		}
		case "crypt":
		{
			return 21;
		}
		case "cellar":
		{
			return 22;
		}
		case "slideways":
		case "slideways2":
		case "slideways3":
		case "slideways4":
		{
			return 23;
		}
		case "warstore":
		{
			return 24;
		}
		case "roj":
		{
			return 50;
		}
		default:
		{
			/#
				assert(0, "");
			#/
		}
	}
}

/*
	Name: function_c8892b0f
	Namespace: namespace_5a917022
	Checksum: 0xBEBBB696
	Offset: 0x17F8
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function function_c8892b0f(name)
{
	if(name === "slideways4")
	{
		name = "slideways3";
	}
	foreach(room in level.doa.var_8f6ccf63)
	{
		if(room.name === name)
		{
			return room;
		}
	}
}

/*
	Name: function_3db4a0b1
	Namespace: namespace_5a917022
	Checksum: 0x67869880
	Offset: 0x18B8
	Size: 0x1E0
	Parameters: 1
	Flags: Linked
*/
function function_3db4a0b1(roundnumber)
{
	if(!isdefined(roundnumber))
	{
		roundnumber = level.doa.roundnumber;
	}
	possibles = [];
	foreach(room in level.doa.var_8f6ccf63)
	{
		if(is_true(room.var_d52d06ee) && !isdefined(room.var_5250d109))
		{
			continue;
		}
		if(room.var_3914cffe != 999 && room.var_3914cffe <= 0)
		{
			continue;
		}
		if(room.var_5bbf26b8 + room.cooldown > gettime())
		{
			continue;
		}
		if(room.name === #"cellar" && isdefined(level.doa.var_98764e02))
		{
			delta = gettime() - level.doa.var_98764e02;
			if(delta < 15 * 60000)
			{
				continue;
			}
		}
		if(roundnumber >= room.minlevel)
		{
			possibles[possibles.size] = room;
		}
	}
	if(possibles.size > 0)
	{
		return possibles[randomint(possibles.size)];
	}
}

/*
	Name: function_7230f033
	Namespace: namespace_5a917022
	Checksum: 0xDF58CA99
	Offset: 0x1AA0
	Size: 0x138
	Parameters: 0
	Flags: Linked
*/
function function_7230f033()
{
	if(isdefined(level.doa.var_848746c8))
	{
		room = function_c8892b0f(level.doa.var_848746c8);
		level thread function_898ca25f(room);
		level.doa.var_848746c8 = undefined;
		return true;
	}
	var_758057d3 = 100 - ((level.doa.roundnumber - level.doa.var_f8e35dd0) * 5);
	if(var_758057d3 < 15)
	{
		var_758057d3 = 15;
	}
	roll = randomint(var_758057d3);
	if(roll > 15)
	{
		return false;
	}
	room = function_3db4a0b1();
	if(!isdefined(room))
	{
		return false;
	}
	level thread function_898ca25f(room);
	return true;
}

/*
	Name: function_8dd06da3
	Namespace: namespace_5a917022
	Checksum: 0xBA87A2D5
	Offset: 0x1BE0
	Size: 0x200
	Parameters: 0
	Flags: Linked
*/
function function_8dd06da3()
{
	if(level.doa.var_c2648383.size > 0)
	{
		level.doa.var_c2648383 = arraysortclosest(level.doa.var_c2648383, level.doa.var_187ed224.origin);
		furthest = level.doa.var_c2648383[level.doa.var_c2648383.size - 1];
		level.doa.var_c2648383 = [];
		level.doa.var_9f48249a = doa_pickups::itemspawn(doa_pickups::function_2c9923d7(39), furthest.origin, undefined, undefined, 1);
		if(isdefined(level.doa.var_9f48249a))
		{
			level.doa.var_9f48249a clientfield::set("set_icon", 9);
			level.doa.var_9f48249a notify(#"hash_2a866f50cc161ca8");
			objective_onentity(13, level.doa.var_9f48249a);
			objective_setstate(13, "active");
			objective_setstate(12, "invisible");
			level thread function_160237df(level.doa.var_9f48249a);
		}
	}
	level notify(#"hash_40456743c6415fcd");
}

/*
	Name: function_160237df
	Namespace: namespace_5a917022
	Checksum: 0xC2AC4192
	Offset: 0x1DE8
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_160237df(var_82be662a)
{
	level endon(#"hash_593a6814c28d14e7", #"game_over");
	if(isdefined(var_82be662a))
	{
		var_82be662a endon(#"death");
		level waittill(#"ladder_up");
		if(isdefined(level.doa.var_6f3d327))
		{
			level.doa.var_6f3d327.exit_trigger notify(#"trigger");
		}
	}
}

/*
	Name: function_898ca25f
	Namespace: namespace_5a917022
	Checksum: 0x871F386B
	Offset: 0x1EA0
	Size: 0x14CA
	Parameters: 1
	Flags: Linked
*/
function function_898ca25f(room)
{
	level endon(#"game_over");
	level notify(#"hash_7270a59e1f502d96", {#room:room});
	level.doa.var_6f3d327 = room;
	level.doa.var_60e0f7a0 = gettime();
	level.doa.var_f8e35dd0 = level.doa.roundnumber;
	if(isdefined(level.doa.var_a77e6349))
	{
		[[ level.doa.var_a77e6349 ]]->function_1137c8bb();
	}
	foreach(generator in level.doa.var_8acd67ef)
	{
		[[ generator ]]->getmodel() namespace_c85a46fe::function_47c860ff(0);
	}
	foreach(player in getplayers())
	{
		if(isdefined(player.doa))
		{
			player.doa.var_2fb8ffeb = undefined;
		}
	}
	level thread namespace_ec06fe4a::function_de70888a();
	namespace_ec06fe4a::function_b6b79fd1();
	level namespace_7f5aeb59::function_d0251f76();
	var_fbefebc = level.doa.var_ecff3871;
	oldstate = level.lighting_state;
	namespace_ec06fe4a::function_87612422(room.player_starts[0].origin, room.player_starts[0].angles, 1, 8, room.var_9045aedc);
	timeout = room.timeout;
	if(isdefined(room.var_2f0b512f))
	{
		level thread [[room.var_2f0b512f]](room);
	}
	if(isdefined(room.var_1c59693d))
	{
		idx = namespace_981c1f3c::function_61e1a1cb((isdefined(room.var_1c59693d.targetname) ? room.var_1c59693d.targetname : room.name));
		if(isdefined(idx))
		{
			level.doa.var_4bd98f7c[idx].var_9105f204 = array(level.doa.var_65a70dc);
			level.doa.var_4bd98f7c[idx].var_40ca2d09 = array(doa_enemy::function_d7c5adee("spider"));
			level.doa.var_a7ccb320 = &function_8dd06da3;
			level namespace_981c1f3c::function_c88b8726(idx);
			var_5b55ba1f = namespace_4dae815d::function_21cd3890(5);
			foreach(player in getplayers())
			{
				player thread namespace_981c1f3c::function_fe17d41e();
			}
		}
	}
	players = namespace_7f5aeb59::function_23e1f90f();
	foreach(player in players)
	{
		player notify(#"hash_279998c5df86c04d");
		player notify(#"hash_7893364bd228d63e");
		player.doa.var_3cf36932 = 0;
		player.doa.var_4f3aee7b = 1;
		vehicle = player getvehicleoccupied();
		if(isdefined(vehicle))
		{
			vehicle.var_3e742dc1 = 1;
			vehicle usevehicle(player, 0);
		}
	}
	wait(1);
	players = namespace_7f5aeb59::function_23e1f90f();
	idx = 0;
	room.var_5250d109 = gettime();
	lastposition = players[0].origin;
	var_566fb668 = players[0].angles;
	foreach(player in players)
	{
		player notify(#"hash_279998c5df86c04d");
		player notify(#"hash_7893364bd228d63e");
		player.doa.var_3cf36932 = 0;
		player.doa.var_4f3aee7b = 1;
		vehicle = player getvehicleoccupied();
		if(isdefined(vehicle))
		{
			vehicle.var_3e742dc1 = 1;
			vehicle usevehicle(player, 0);
		}
		player setorigin(room.player_starts[idx].origin);
		player setplayerangles(room.player_starts[idx].angles);
		player.doa.var_2fb8ffeb = undefined;
		player namespace_7f5aeb59::function_61d74d57();
		idx++;
	}
	foreach(item in room.items)
	{
		if(isdefined(item.script_int))
		{
			roll = int(item.script_int);
			if(randomint(100) > roll)
			{
				continue;
			}
		}
		room.var_a043a6d4[room.var_a043a6d4.size] = function_edc2fabf(item, room.var_74606c86, room.var_7d320f40);
	}
	foreach(door in room.doors)
	{
		door.model = namespace_f63bdb08::function_2a1e5c1f(door.origin, door.angles, door.script_string, undefined, 1, 3, door.script_parameters);
	}
	foreach(npc in room.npcs)
	{
		toks = strtok(npc.script_noteworthy, ";");
		if(toks.size > 1)
		{
			mask = int(toks[1]);
			if(isdefined(level.doa.var_182fb75a))
			{
				if(mask & 4)
				{
					continue;
				}
			}
			else
			{
				if(isdefined(level.doa.var_a77e6349))
				{
					if(mask & 2)
					{
						continue;
					}
				}
				else if(mask & 1 && isdefined(level.doa.var_39e3fa99))
				{
					continue;
				}
			}
		}
		def = doa_enemy::function_d7c5adee(toks[0]);
		count = 1;
		if(isdefined(npc.script_int))
		{
			count = int(npc.script_int);
		}
		if(isdefined(def))
		{
			ai = doa_enemy::function_db55a448(def, npc.origin);
			if(isdefined(ai))
			{
				ai.var_227e7c79 = 1;
				if(is_true(ai.boss) && timeout < 300)
				{
					timeout = timeout + 300;
				}
			}
		}
	}
	foreach(generator in room.generators)
	{
		a_toks = strtok(generator.script_string, ",");
		var_44eec847 = a_toks[0];
		if(a_toks.size >= 2)
		{
			radius = int(a_toks[1]);
		}
		else
		{
			radius = 800;
		}
		if(a_toks.size >= 3)
		{
			height = int(a_toks[2]);
		}
		if(a_toks.size >= 4)
		{
			var_8a14a619 = int(a_toks[3]);
		}
		var_ab7b96bc = namespace_c85a46fe::function_4c16ce2c(var_44eec847, generator.origin, generator.angles, radius, height, var_8a14a619, 3);
		generator.var_64a23077 = [[ var_ab7b96bc ]]->getmodel();
	}
	namespace_268747c0::function_96e2f261(room.hazards, 0);
	namespace_268747c0::function_b04a33c5(room.platforms);
	util::wait_network_frame();
	players = namespace_7f5aeb59::function_23e1f90f();
	foreach(player in players)
	{
		player clientfield::increment_to_player("hardResetCamera");
	}
	util::wait_network_frame();
	level clientfield::set("set_bonus_room", room.id);
	util::wait_network_frame();
	namespace_8c04284b::function_a70ff03e(room.flipcamera);
	players = namespace_7f5aeb59::function_23e1f90f();
	freecam = room.freecam;
	if(is_true(level.doa.var_318aa67a))
	{
		freecam = 1;
	}
	foreach(player in players)
	{
		if(is_true(freecam))
		{
			player clientfield::increment_to_player("hardResetCamera");
		}
		player clientfield::increment_to_player("setCompassVis");
	}
	level util::set_lighting_state(room.var_9045aedc, 0);
	level thread function_3c47fbe0(room);
	if(room.var_3914cffe != 999)
	{
		room.var_3914cffe--;
	}
	level notify(#"hash_52ca1213084f29fa");
	level thread namespace_7f5aeb59::function_836aeb74();
	namespace_9fc66ac::function_a77649db(room.name, 1);
	level namespace_a6ddb172::function_7a0e5387(function_d496f180(room.name));
	if(isdefined(room.exit_trigger))
	{
		objective_setposition(11, room.exit_trigger.origin);
		objective_setstate(11, "active");
	}
	if(isdefined(room.var_6eb6f696))
	{
		room.var_6eb6f696 thread function_56e9011(room);
	}
	if(isdefined(room.exit_trigger))
	{
		if(room.timeout === 999 || is_true(level.doa.var_206393b4))
		{
			result = undefined;
			result = room.exit_trigger waittill(#"trigger", #"abort");
		}
		else
		{
			level thread namespace_6e90e490::function_c937e51f(timeout);
			level thread function_707a2001(timeout - 10);
			while(timeout > 0)
			{
				result = undefined;
				result = room.exit_trigger waittilltimeout(1, #"trigger", #"abort");
				if(result._notify == #"timeout")
				{
					timeout--;
				}
				else
				{
					break;
				}
			}
			namespace_6e90e490::function_fa6f7ba7();
		}
		var_62ad07bf = (result._notify == #"abort" ? "evt_doa_travel_doors_chosen" : "evt_doa_travel_doors_chosen");
	}
	else
	{
		room waittill(#"hash_4a4d7dd9266e6e8b");
		var_62ad07bf = "evt_doa_travel_doors_chosen";
	}
	foreach(player in getplayers())
	{
		player namespace_e32bb68::function_3a59ec34(var_62ad07bf);
	}
	objective_setstate(11, "invisible");
	namespace_ec06fe4a::function_87612422(lastposition, var_566fb668, 1, 8, oldstate);
	level notify(#"hash_11a3b1e82b21ec58");
	level thread namespace_7f5aeb59::function_67f054d7();
	level waittill(#"hash_1b322de3d2e3e781");
	level notify(#"hash_593a6814c28d14e7");
	if(isdefined(var_5b55ba1f))
	{
		namespace_4dae815d::function_21cd3890(var_5b55ba1f);
	}
	level util::set_lighting_state(oldstate, 0);
	level clientfield::set("setTOD", oldstate);
	if(isdefined(var_fbefebc))
	{
		namespace_8c04284b::function_a70ff03e(var_fbefebc);
	}
	players = namespace_7f5aeb59::function_23e1f90f();
	foreach(player in players)
	{
		player clientfield::increment_to_player("resetCamera");
	}
	room.var_5bbf26b8 = gettime();
}

/*
	Name: function_707a2001
	Namespace: namespace_5a917022
	Checksum: 0x5D13D32E
	Offset: 0x3378
	Size: 0xE0
	Parameters: 1
	Flags: Linked
*/
function function_707a2001(sec)
{
	level endon(#"hash_593a6814c28d14e7", #"game_reset", #"game_over");
	wait(sec);
	foreach(player in getplayers())
	{
		player namespace_e32bb68::function_3a59ec34("evt_doa_travel_warning");
	}
}

/*
	Name: function_3c47fbe0
	Namespace: namespace_5a917022
	Checksum: 0xC1377FAA
	Offset: 0x3460
	Size: 0x744
	Parameters: 1
	Flags: Linked
*/
function function_3c47fbe0(room)
{
	level waittill(#"hash_593a6814c28d14e7", #"game_reset");
	level clientfield::set("set_bonus_room", 0);
	namespace_9fc66ac::function_a77649db(room.name, 0);
	foreach(generator in room.generators)
	{
		if(isdefined(generator.var_64a23077))
		{
			[[ generator.var_64a23077.generator ]]->destroy();
			generator.var_64a23077 = undefined;
		}
	}
	level thread namespace_ec06fe4a::function_de70888a();
	foreach(trap in room.hazards)
	{
		trap notify(#"hash_3e251384a5400dce", {#hash_760a0807:1});
	}
	foreach(platform in room.platforms)
	{
		platform notify(#"hash_3e251384a5400dce", {#hash_760a0807:1});
	}
	foreach(door in room.doors)
	{
		if(isdefined(door.model))
		{
			door.model delete();
		}
	}
	foreach(item in room.var_a043a6d4)
	{
		if(!isdefined(item))
		{
			continue;
		}
		item delete();
	}
	room.var_a043a6d4 = [];
	namespace_491fa2b2::function_df55eb9d(3);
	namespace_a6056a45::function_e2f97f03(3);
	if(isdefined(room.var_1c59693d) && isdefined(level.doa.var_182fb75a))
	{
		level thread namespace_981c1f3c::function_8790b64a();
		objective_setstate(13, "invisible");
		level.doa.var_a7ccb320 = undefined;
	}
	if(isdefined(level.doa.var_182fb75a))
	{
		foreach(generator in level.doa.var_8acd67ef)
		{
			[[ generator ]]->getmodel() namespace_c85a46fe::function_47c860ff([[ generator ]]->function_30a0163e());
		}
	}
	else
	{
		if(isdefined(level.doa.var_a77e6349))
		{
			[[ level.doa.var_a77e6349 ]]->function_ce6bb21b();
		}
		foreach(generator in level.doa.var_8acd67ef)
		{
			[[ generator ]]->getmodel() namespace_c85a46fe::function_47c860ff(1);
		}
	}
	util::wait_network_frame();
	foreach(player in getplayers())
	{
		if(isbot(player))
		{
			continue;
		}
		player namespace_d2efac9a::function_d7ee01df();
		player.doa.var_4f3aee7b = undefined;
		player clientfield::increment_to_player("setCompassVis");
	}
	waitframe(1);
	level thread namespace_ec06fe4a::function_de70888a();
	while(is_true(level.doa.var_1b8c7044))
	{
		waitframe(1);
	}
	level notify(#"hash_7dd47c99b7707b1c");
	level.doa.var_6f3d327 = undefined;
	level namespace_a6ddb172::function_7a0e5387();
}

/*
	Name: function_56e9011
	Namespace: namespace_5a917022
	Checksum: 0x53A53451
	Offset: 0x3BB0
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_56e9011(room)
{
	level endon(#"hash_7dd47c99b7707b1c", #"game_over");
	self notify("3c369772e1847213");
	self endon("3c369772e1847213");
	self waittill(#"trigger");
	room.exit_trigger notify(#"abort");
}

/*
	Name: function_edc2fabf
	Namespace: namespace_5a917022
	Checksum: 0x2A5A313
	Offset: 0x3C38
	Size: 0x558
	Parameters: 3
	Flags: Linked
*/
function function_edc2fabf(item, var_74606c86, var_7d320f40)
{
	toks = strtok(item.script_noteworthy, ";");
	if(toks.size > 1)
	{
		mask = int(toks[1]);
		if(isdefined(level.doa.var_182fb75a))
		{
			if(mask & 4)
			{
				return undefined;
			}
		}
		else
		{
			if(isdefined(level.doa.var_a77e6349))
			{
				if(mask & 2)
				{
					return undefined;
				}
			}
			else if(mask & 1 && isdefined(level.doa.var_39e3fa99))
			{
				return undefined;
			}
		}
	}
	type = toks[0];
	if(type === "lootitem")
	{
		/#
			assert(isdefined(item.script_parameters), "");
		#/
		object = namespace_41f5b853::spawnlootitem(item.origin, item.angles, item.script_parameters, 50, 3);
		if(isdefined(object))
		{
			object.target = item.target;
		}
		return object;
	}
	if(type === "pick one")
	{
		choices = strtok(item.script_parameters, ";");
		/#
			assert(choices.size > 1, "");
		#/
		choice = choices[randomint(choices.size)];
		def = doa_pickups::function_6265bde4(choice);
		if(isdefined(def))
		{
			pickup = doa_pickups::itemspawn(def, item.origin, item.angles, undefined, 1, "none", undefined, undefined, undefined, undefined, 0);
		}
		else
		{
			object = namespace_41f5b853::spawnlootitem(item.origin, item.angles, choice, 50, 3);
			if(isdefined(object))
			{
				object.target = item.target;
			}
			return object;
		}
	}
	else
	{
		if(type === "treasure_pile")
		{
			radius = (isdefined(item.radius) ? item.radius : 128);
			level doa_pickups::function_68442ee7(item.origin, 20, radius, 1);
			level doa_pickups::function_d06cbfe8(item.origin, 10, radius, 0, undefined, undefined, 0.75);
			return undefined;
		}
		def = doa_pickups::function_6265bde4(type);
		/#
			assert(isdefined(def), "");
		#/
		if(([[ def ]]->function_5ce4fb28()) == 13)
		{
			scale = 1;
			if(isdefined(item.scale))
			{
				scale = item.scale;
			}
			pickup = doa_pickups::function_b8f6a8cd(def, item.origin, 0, 1, scale, item.angles);
		}
		else
		{
			pickup = doa_pickups::itemspawn(def, item.origin, item.angles, undefined, 1, "none", undefined, undefined, undefined, undefined, 0);
		}
	}
	if(isdefined(pickup))
	{
		if(([[ def ]]->function_5ce4fb28()) != 32)
		{
			if(is_true(var_74606c86))
			{
				pickup notify(#"stopidle");
			}
			if(is_true(var_7d320f40))
			{
				pickup notify(#"hash_2a866f50cc161ca8");
			}
			waitframe(1);
		}
		if(isdefined(pickup))
		{
			pickup.angles = item.angles;
			pickup.origin = item.origin;
			pickup.radius = 18;
			level thread function_92f612b2(def, pickup);
		}
	}
	return pickup;
}

/*
	Name: function_92f612b2
	Namespace: namespace_5a917022
	Checksum: 0x1C30A698
	Offset: 0x4198
	Size: 0x8A
	Parameters: 2
	Flags: Linked
*/
function function_92f612b2(def, pickup)
{
	switch([[ def ]]->function_5ce4fb28())
	{
		case 32:
		{
			pickup namespace_3a8e4a3::function_22c4e231(1);
			break;
		}
		case 6:
		{
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_a9f78bf
	Namespace: namespace_5a917022
	Checksum: 0xB458092C
	Offset: 0x4230
	Size: 0x1DC
	Parameters: 2
	Flags: Linked
*/
function function_a9f78bf(&var_4200bfbf, room)
{
	/#
		assert(isdefined(var_4200bfbf) && var_4200bfbf.size >= 4, "");
	#/
	level thread namespace_7f5aeb59::function_67f054d7();
	level waittill(#"hash_1b322de3d2e3e781");
	level thread function_898ca25f(room);
	level waittill(#"hash_7dd47c99b7707b1c");
	players = namespace_7f5aeb59::function_23e1f90f();
	idx = 0;
	foreach(player in players)
	{
		player setorigin(var_4200bfbf[idx].origin);
		player setplayerangles(var_4200bfbf[idx].angles);
		player clientfield::increment_to_player("resetCamera");
		player namespace_7f5aeb59::function_61d74d57();
		idx++;
	}
	wait(1);
	level thread namespace_7f5aeb59::function_836aeb74();
}

/*
	Name: function_23ea6695
	Namespace: namespace_5a917022
	Checksum: 0x8B5612
	Offset: 0x4418
	Size: 0x2BC
	Parameters: 2
	Flags: Linked
*/
function function_23ea6695(trigger, room)
{
	self notify("26e68194ce752ad0");
	self endon("26e68194ce752ad0");
	/#
		assert(isdefined(room));
	#/
	/#
		assert(isdefined(trigger));
	#/
	trigger endon(#"death");
	result = undefined;
	result = trigger waittill(#"trigger");
	trigger triggerenable(0);
	trigger.visited = 1;
	var_4200bfbf = trigger.var_4200bfbf;
	if(!isdefined(var_4200bfbf))
	{
		var_4200bfbf = [];
		var_4200bfbf[0] = {#angles:result.activator.angles + vectorscale((0, 1, 0), 180), #origin:result.activator.origin};
		var_4200bfbf[1] = {#angles:var_4200bfbf[0].angles, #origin:var_4200bfbf[0].origin + vectorscale((1, 0, 0), 30)};
		var_4200bfbf[2] = {#angles:var_4200bfbf[0].angles, #origin:var_4200bfbf[0].origin + (vectorscale((-1, 0, 0), 30))};
		var_4200bfbf[3] = {#angles:var_4200bfbf[0].angles, #origin:var_4200bfbf[0].origin + vectorscale((0, 1, 0), 30)};
	}
	level thread function_a9f78bf(var_4200bfbf, room);
	level waittill(#"hash_1b322de3d2e3e781");
	if(isdefined(trigger.var_ee2cd39c))
	{
		trigger.var_ee2cd39c solid();
		trigger.var_ee2cd39c show();
	}
}

/*
	Name: function_e5c7bce7
	Namespace: namespace_5a917022
	Checksum: 0xF2531425
	Offset: 0x46E0
	Size: 0x3B8
	Parameters: 0
	Flags: Linked
*/
function function_e5c7bce7()
{
	level endon(#"game_over");
	room = level.doa.var_848746c8;
	var_dffc76c2 = 0;
	level.doa.var_1f2c7d5f = 1;
	while(true)
	{
		level.doa.var_848746c8 = room;
		wait(3);
		level notify(#"round_over");
		level flag::clear("doa_round_spawning");
		level thread namespace_ec06fe4a::function_de70888a();
		level namespace_ec06fe4a::function_b6b79fd1();
		namespace_ec06fe4a::clearallcorpses();
		wait(2);
		while(true)
		{
			wait(1);
			guys = namespace_7f5aeb59::function_23e1f90f();
			var_271662e8 = [[ level.doa.var_39e3fa99 ]]->function_dfb49846();
			if(var_271662e8.size)
			{
				exit = var_271662e8[randomint(var_271662e8.size)];
				exit notify(#"trigger", {#activator:guys[randomint(guys.size)]});
				break;
			}
			if(isdefined(level.doa.teleporter) && randomint(5) == 0)
			{
				guys[0] setorigin(level.doa.teleporter.origin + vectorscale((0, 0, 1), 32));
				break;
			}
		}
		result = undefined;
		result = level waittilltimeout(10, #"hash_52ca1213084f29fa");
		if(result._notify == "timeout")
		{
			continue;
		}
		if(isdefined(level.doa.var_a7ccb320) && flag::get("dungeon_building"))
		{
			level waittill(#"hash_40456743c6415fcd");
		}
		while(true)
		{
			wait(1);
			if(isdefined(level.doa.var_6f3d327))
			{
				level.doa.var_6f3d327.exit_trigger notify(#"trigger");
				break;
			}
		}
		level waittill(#"hash_7dd47c99b7707b1c");
		var_dffc76c2++;
		namespace_1e25ad94::function_4e3cfad("Bonus Room Evolution: " + var_dffc76c2, undefined, undefined, undefined, 10);
		level waittill(#"hash_58caf0ade03043bb");
		if(is_true(level.doa.var_d31bcf30))
		{
			level waittill(#"dungeon_destroyed");
		}
	}
}

/*
	Name: function_170eefc7
	Namespace: namespace_5a917022
	Checksum: 0x79BCEDBF
	Offset: 0x4AA0
	Size: 0x294
	Parameters: 2
	Flags: Linked
*/
function function_170eefc7(room, aicount)
{
	if(!isdefined(aicount))
	{
		aicount = 28;
	}
	level waittill(#"hash_11a3b1e82b21ec58", #"game_over");
	level thread namespace_ec06fe4a::function_de70888a();
	level waittill(#"hash_7dd47c99b7707b1c");
	level.var_9fa19717 = 0;
	level.var_52f56101 = undefined;
	level.doa.var_af74d0b = 0;
	level.var_40d076a7 = 0;
	level.doa.var_4425d066 = undefined;
	setsaveddvar(#"hash_63212188205e8c27", 0);
	if(room.name == "slideways3")
	{
		foreach(player in getplayers())
		{
			player notify(#"lantern_terminated");
		}
	}
	if(namespace_4dae815d::function_59a9cf1d() == 0 && isdefined(level.doa.var_39e3fa99))
	{
		[[ level.doa.var_39e3fa99 ]]->function_6d5262dc(aicount);
	}
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("setCameraSide", 0);
		player namespace_7f5aeb59::function_fae39d88();
	}
	setjumpheight(0);
}

/*
	Name: function_f11b0e51
	Namespace: namespace_5a917022
	Checksum: 0x84B35D3E
	Offset: 0x4D40
	Size: 0x66
	Parameters: 0
	Flags: Linked
*/
function function_f11b0e51()
{
	self.shouldspawn = self.shouldspawn || is_true(self.var_d55f22cb);
	self.var_227e7c79 = 1;
	self.maxhealth = 1000;
	self.health = self.maxhealth;
	self.zombie_move_speed = "walk";
}

/*
	Name: function_82273c90
	Namespace: namespace_5a917022
	Checksum: 0xF341E2E9
	Offset: 0x4DB0
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function function_82273c90(room)
{
	level endon(#"hash_11a3b1e82b21ec58", #"game_over");
	while(level.doa.var_6f3d327 === room)
	{
		result = undefined;
		result = level waittill(#"player_died");
		if(isdefined(result.player))
		{
			result.player thread function_4747bdd0();
		}
	}
}

/*
	Name: function_ea68ae7c
	Namespace: namespace_5a917022
	Checksum: 0x1ECA9713
	Offset: 0x4E58
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_ea68ae7c()
{
	self notify("4c76869627b3ce20");
	self endon("4c76869627b3ce20");
	self endon(#"disconnect");
	level endon(#"hash_11a3b1e82b21ec58", #"game_over");
	self waittill(#"player_respawned");
	self doa_pickups::function_32370b0d(999);
	self thread function_ea68ae7c();
}

/*
	Name: function_4747bdd0
	Namespace: namespace_5a917022
	Checksum: 0x52D3AFBA
	Offset: 0x4F00
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function function_4747bdd0(time)
{
	if(!isdefined(time))
	{
		time = 2;
	}
	self notify("518e556fd9f6144c");
	self endon("518e556fd9f6144c");
	self endon(#"disconnect", #"player_respawned");
	self.var_4a81243b = 1;
	self namespace_e32bb68::function_3a59ec34("evt_doa_slideways_dead");
	wait(time);
	self.doa.score.lives++;
	self.deaths = math::clamp(self.deaths - 1, 0, self.deaths);
	self thread namespace_7f5aeb59::function_513831e1();
}

/*
	Name: function_4d16b7a9
	Namespace: namespace_5a917022
	Checksum: 0xDD105D0C
	Offset: 0x4FF0
	Size: 0x390
	Parameters: 1
	Flags: Linked
*/
function function_4d16b7a9(room)
{
	level.var_9fa19717 = 1;
	level.var_40d076a7 = 1;
	level.doa.var_af74d0b = 1;
	level.doa.var_4425d066 = &function_f11b0e51;
	level.var_52f56101 = &function_79b68863;
	setsaveddvar(#"hash_63212188205e8c27", 1);
	level thread function_82273c90(room);
	if(room.name == "slideways3")
	{
		foreach(player in getplayers())
		{
			player thread doa_pickups::function_32370b0d(999);
			player thread function_ea68ae7c();
		}
	}
	aicount = 28;
	if(namespace_4dae815d::function_59a9cf1d() == 0)
	{
		aicount = [[ level.doa.var_39e3fa99 ]]->function_c892290a();
		[[ level.doa.var_39e3fa99 ]]->function_6d5262dc(40);
	}
	level thread function_170eefc7(room, aicount);
	level waittill(#"hash_52ca1213084f29fa");
	setjumpheight(128);
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("setCameraSide", 1);
		player allowjump(1);
		player allowcrouch(1);
		player allowslide(1);
		player allowdoublejump(1);
		player allowsprint(1);
		player setstance("stand");
		player allowmantle(0);
		player thread function_8d3502d3();
	}
}

/*
	Name: function_8d3502d3
	Namespace: namespace_5a917022
	Checksum: 0xF027926A
	Offset: 0x5388
	Size: 0xA6
	Parameters: 0
	Flags: Linked
*/
function function_8d3502d3()
{
	self notify("6575fc5bcd65ae6b");
	self endon("6575fc5bcd65ae6b");
	self endon(#"disconnect");
	level endon(#"hash_11a3b1e82b21ec58", #"game_over");
	while(true)
	{
		self waittill(#"jump_begin");
		self namespace_e32bb68::function_3a59ec34("fly_doa_jump_plr");
		self waittill(#"jump_end");
	}
}

/*
	Name: function_79b68863
	Namespace: namespace_5a917022
	Checksum: 0xEE458D00
	Offset: 0x5438
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_79b68863(var_c4b5b87c)
{
	self allowjump(1);
	self allowcrouch(1);
	self allowslide(1);
	self allowdoublejump(1);
	self allowsprint(1);
	self setorigin(level.doa.var_6f3d327.player_starts[self.entnum].origin);
	self setplayerangles(level.doa.var_6f3d327.player_starts[self.entnum].angles);
	wait(0.5);
	if(isdefined(self))
	{
		self setstance("stand");
	}
}

/*
	Name: function_e1911940
	Namespace: namespace_5a917022
	Checksum: 0xF3E377BA
	Offset: 0x5578
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function function_e1911940(room)
{
	level waittill(#"hash_7dd47c99b7707b1c");
	level.doa.var_67d8328d = 1;
}

/*
	Name: function_7cbb4f99
	Namespace: namespace_5a917022
	Checksum: 0xF5CB70A
	Offset: 0x55C0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_7cbb4f99(room)
{
	level thread function_e1911940(room);
}

/*
	Name: function_885d02fd
	Namespace: namespace_5a917022
	Checksum: 0xD2E71DD5
	Offset: 0x55F0
	Size: 0x190
	Parameters: 1
	Flags: Linked
*/
function function_885d02fd(room)
{
	self notify("6644e0602544e7fd");
	self endon("6644e0602544e7fd");
	level waittill(#"hash_7dd47c99b7707b1c");
	foreach(door in room.var_b470c0a1)
	{
		door namespace_e32bb68::function_ae271c0b("evt_doa_stonedoor_open");
		door namespace_e32bb68::function_ae271c0b("evt_doa_stonedoor_close");
		door namespace_e32bb68::function_ae271c0b("evt_doa_stonedoor_close_fast");
	}
	foreach(trig in room.var_aaea3479)
	{
		trig triggerenable(0);
	}
}

/*
	Name: function_1dfe9126
	Namespace: namespace_5a917022
	Checksum: 0x4DE25A76
	Offset: 0x5788
	Size: 0x2A8
	Parameters: 1
	Flags: Linked
*/
function function_1dfe9126(room)
{
	level endon(#"hash_7dd47c99b7707b1c");
	self notify("39d2bbaed572f50c");
	self endon("39d2bbaed572f50c");
	originalpos = self.origin;
	desiredpos = self.origin + (vectorscale((0, 0, -1), 158));
	while(true)
	{
		self namespace_e32bb68::function_ae271c0b("evt_doa_stonedoor_close");
		self waittill(#"plate_activated");
		level notify(#"hash_62d02129547fa94a");
		deltaz = abs(self.origin[2] - desiredpos[2]);
		timedelta = math::clamp((deltaz / 158) * 5, 0.05, 5);
		self namespace_e32bb68::function_3a59ec34("evt_doa_stonedoor_open");
		self moveto(desiredpos, timedelta);
		result = undefined;
		result = self waittill(#"plate_deactivated", #"hash_7e6e589015c9e33d");
		self namespace_e32bb68::function_ae271c0b("stoneDoorOpening");
		if(result._notify == #"hash_7e6e589015c9e33d")
		{
			self namespace_e32bb68::function_3a59ec34("evt_doa_stonedoor_close_fast");
			self moveto(originalpos, 1);
			return;
		}
		deltaz = abs(self.origin[2] - originalpos[2]);
		timedelta = math::clamp((deltaz / 158) * 5, 0.05, 5);
		self namespace_e32bb68::function_3a59ec34("evt_doa_stonedoor_close");
		self moveto(originalpos, timedelta);
	}
}

/*
	Name: function_c0dff79
	Namespace: namespace_5a917022
	Checksum: 0x703E35D9
	Offset: 0x5A38
	Size: 0x354
	Parameters: 1
	Flags: Linked
*/
function function_c0dff79(room)
{
	level endon(#"hash_7dd47c99b7707b1c");
	self notify("f0f8385110bb211");
	self endon("f0f8385110bb211");
	self triggerenable(1);
	done = 0;
	while(true)
	{
		result = undefined;
		result = self waittill(#"trigger");
		if(isdefined(result.activator))
		{
			if(!is_true(level.doa.var_e5217306))
			{
				result.activator thread function_af1f8cd5(self.script_noteworthy);
				level.doa.var_e5217306 = 1;
				foreach(door in room.var_b470c0a1)
				{
					door notify(#"hash_7e6e589015c9e33d");
				}
			}
			target = struct::get(self.target, "targetname");
			org = namespace_ec06fe4a::function_e22ae9b3(target.origin + vectorscale((0, 0, 1), 1000), undefined, target.angles, "doom door org");
			if(isdefined(org))
			{
				org thread namespace_ec06fe4a::function_52afe5df(1.2);
				org enablelinkto();
				result.activator linkto(org);
				org moveto(target.origin, 1);
				wait(1);
				result.activator unlink();
				result.activator namespace_83eb6304::function_3ecfde67("turret_impact");
				result.activator namespace_e32bb68::function_3a59ec34("evt_doa_pickup_sentry_land");
				result.activator notify(#"hash_25e83871b7d15b33");
				org delete();
			}
			else
			{
				result.activator setorigin(target.origin);
				result.activator setplayerangles(target.angles);
			}
		}
	}
	self triggerenable(0);
}

/*
	Name: function_ab6edfa3
	Namespace: namespace_5a917022
	Checksum: 0x4FB052FB
	Offset: 0x5D98
	Size: 0x22C
	Parameters: 1
	Flags: Linked
*/
function function_ab6edfa3(room)
{
	level.doa.var_e5217306 = undefined;
	level.doa.var_1da3c49e = #"orange";
	if(randomint(100) < 50)
	{
		level.doa.var_1da3c49e = #"yellow";
	}
	level thread function_27cb8f5b(room);
	if(!isdefined(room.var_b470c0a1))
	{
		room.var_b470c0a1 = getentarray("doom_door", "targetname");
	}
	foreach(door in room.var_b470c0a1)
	{
		door thread function_1dfe9126(room);
	}
	if(!isdefined(room.var_aaea3479))
	{
		room.var_aaea3479 = getentarray("doom_trig", "targetname");
	}
	foreach(trig in room.var_aaea3479)
	{
		trig thread function_c0dff79(room);
	}
	level thread function_885d02fd(room);
}

/*
	Name: function_27cb8f5b
	Namespace: namespace_5a917022
	Checksum: 0x8229B7C0
	Offset: 0x5FD0
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_27cb8f5b(room)
{
	level endon(#"hash_7dd47c99b7707b1c");
	self notify("622f4c78afa093a5");
	self endon("622f4c78afa093a5");
	level waittill(#"hash_62d02129547fa94a");
	level namespace_a6ddb172::function_7a0e5387(25);
}

/*
	Name: function_af1f8cd5
	Namespace: namespace_5a917022
	Checksum: 0xFFFBA35E
	Offset: 0x6048
	Size: 0xBD4
	Parameters: 1
	Flags: Linked
*/
function function_af1f8cd5(color)
{
	if(!isplayer(self))
	{
		return;
	}
	self endon(#"disconnect");
	level endon(#"game_over");
	self waittill(#"hash_25e83871b7d15b33");
	if(color == level.doa.var_1da3c49e)
	{
		self namespace_e32bb68::function_3a59ec34("zmb_doom_door_good");
		self namespace_83eb6304::function_3ecfde67("lightningStrike");
		self namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
		var_6b186658 = 8 + (self.entnum << 4);
		level clientfield::set("banner_eventplayer", var_6b186658);
		if(self.doa.score.lives < 4)
		{
			reward = "lives";
		}
		else
		{
			if(self.doa.score.bombs < 4)
			{
				reward = "bombs";
			}
			else
			{
				if(self.doa.score.boosts < 4)
				{
					reward = "boosts";
				}
				else
				{
					reward = "weapon";
				}
			}
		}
		switch(reward)
		{
			case "lives":
			{
				level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_extra_life"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_extra_life"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_extra_life"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				break;
			}
			case "bombs":
			{
				level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_nuke"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_nuke"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_nuke"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_nuke"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_nuke"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				break;
			}
			case "boosts":
			{
				level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_boost"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_boost"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_boost"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_boost"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_boost"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_boost"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				break;
			}
			case "weapon":
			{
				def = doa_pickups::function_57160cba(6);
				level thread doa_pickups::itemspawn(def, self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				level thread doa_pickups::itemspawn(def, self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				level thread doa_pickups::itemspawn(def, self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				wait(0.5);
				self.doa.var_909a4dd5 = gettime() + 420000;
				break;
			}
		}
		level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_chicken"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
		wait(0.5);
		level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_chicken"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
		wait(0.5);
		level thread doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_chicken"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
	}
	else
	{
		self namespace_e32bb68::function_3a59ec34("zmb_doom_door_bad");
		self namespace_83eb6304::function_3ecfde67("lightningStrike");
		self namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
		var_6b186658 = 9 + (self.entnum << 4);
		level clientfield::set("banner_eventplayer", var_6b186658);
		if(self.doa.score.bombs > 0)
		{
			for(take = 2; self.doa.score.bombs > 0 && take > 0; take--)
			{
				model = namespace_ec06fe4a::function_e22ae9b3(self.origin + vectorscale((0, 0, 1), 70), "zombietron_nuke", undefined, "doom door bomb");
				if(isdefined(model))
				{
					self.doa.score.bombs--;
					model moveto(model.origin + vectorscale((0, 0, 1), 2000), 3);
					model thread namespace_ec06fe4a::function_52afe5df(3);
					wait(0.25);
				}
			}
		}
		if(self.doa.score.boosts > 0)
		{
			for(take = 4; self.doa.score.boosts > 0 && take > 0; take--)
			{
				model = namespace_ec06fe4a::function_e22ae9b3(self.origin + vectorscale((0, 0, 1), 70), "zombietron_boost", undefined, "doom door boost");
				if(isdefined(model))
				{
					model setscale(1.5);
					self.doa.score.boosts--;
					model moveto(model.origin + vectorscale((0, 0, 1), 2000), 3);
					model thread namespace_ec06fe4a::function_52afe5df(3);
					wait(0.25);
				}
			}
		}
		if(self.doa.score.keys > 0)
		{
			model = namespace_ec06fe4a::function_e22ae9b3(self.origin + vectorscale((0, 0, 1), 70), "zombietron_skeleton_key", undefined, "doom door key");
			if(isdefined(model))
			{
				model setscale(3);
				self.doa.score.keys--;
				model moveto(model.origin + vectorscale((0, 0, 1), 2000), 3);
				model thread namespace_ec06fe4a::function_52afe5df(3);
				wait(0.25);
			}
		}
		self namespace_41cb996::function_8b7acf56();
		self thread namespace_eccff4fb::function_1dd66aa1();
		self thread namespace_7f5aeb59::function_ec9a307f(60, undefined, 20);
	}
}

/*
	Name: function_e0548009
	Namespace: namespace_5a917022
	Checksum: 0x184F69E4
	Offset: 0x6C28
	Size: 0x25A
	Parameters: 0
	Flags: Linked
*/
function function_e0548009()
{
	level endon(#"game_over");
	level endon(#"hash_2c640197a1e595fa");
	var_a3c55f87 = struct::get("roj_floor", "targetname");
	if(!isdefined(var_a3c55f87))
	{
		var_a3c55f87 = spawnstruct();
		var_a3c55f87.origin = (12423, 11721, -837);
	}
	while(isdefined(level.doa.var_6f3d327))
	{
		wait(1);
		enemies = namespace_ec06fe4a::function_8ff7f92c();
		foreach(badguy in enemies)
		{
			if(badguy.origin[2] < var_a3c55f87.origin[2] && !is_true(badguy.marked_for_death))
			{
				badguy thread namespace_ec06fe4a::function_52afe5df(0.3);
				badguy.marked_for_death = 1;
			}
			if(isvehicle(badguy))
			{
				distsq = distancesquared(var_a3c55f87.origin, badguy.origin);
				if(distsq > sqr(2100) && !is_true(badguy.marked_for_death))
				{
					badguy thread namespace_ec06fe4a::function_52afe5df(0.3);
					badguy.marked_for_death = 1;
				}
			}
		}
	}
}

/*
	Name: function_b2706226
	Namespace: namespace_5a917022
	Checksum: 0x7681A0B3
	Offset: 0x6E90
	Size: 0x7F8
	Parameters: 1
	Flags: Linked
*/
function function_b2706226(room)
{
	level endon(#"game_over");
	level flag::set("doa_roj_visited");
	level.doa.var_79574675 = 1;
	level.doa.var_d54b7f72 = 1;
	level waittill(#"hash_52ca1213084f29fa");
	wait(4);
	level thread function_e0548009();
	var_30073b02 = 1;
	wavetime = 30;
	level thread namespace_6e90e490::function_c937e51f(wavetime);
	done = 0;
	while(wavetime > 0)
	{
		done = 1;
		foreach(generator in room.generators)
		{
			if(isdefined(generator.var_64a23077) && generator.var_64a23077.health > 0)
			{
				done = 0;
				break;
			}
		}
		if(done)
		{
			break;
		}
		wavetime--;
		wait(1);
	}
	namespace_6e90e490::function_fa6f7ba7();
	if(!done)
	{
		var_30073b02 = 0;
	}
	if(var_30073b02)
	{
		level namespace_a6ddb172::function_7a0e5387(51);
		wait(3);
		level.doa.var_a598a835 = &function_dff4eac9;
		room.var_dd856bff = struct::get_array("rof_safespot", "targetname");
		var_94f3b914 = doa_enemy::function_d7c5adee("meatball_large");
		count = 6 + (getplayers().size * 2);
		spot = function_dff4eac9();
		doa_enemy::function_a6b807ea(var_94f3b914, count, spot.origin, 0);
		wait(2);
		level.doa.var_a598a835 = undefined;
		wavetime = 60;
		level thread namespace_6e90e490::function_c937e51f(wavetime);
		done = 0;
		while(wavetime > 0)
		{
			done = 1;
			if(namespace_ec06fe4a::function_9788bacc())
			{
				done = 0;
			}
			if(done)
			{
				break;
			}
			wavetime--;
			wait(1);
		}
		namespace_6e90e490::function_fa6f7ba7();
		if(!done)
		{
			var_30073b02 = 0;
		}
	}
	if(var_30073b02)
	{
		level namespace_a6ddb172::function_7a0e5387(52);
		wait(3);
		room.var_dd856bff = struct::get_array("rof_bossspot", "targetname");
		bosses = 1;
		if(getplayers().size >= 3)
		{
			bosses++;
		}
		while(bosses)
		{
			if(is_true(level.hostmigrationtimer))
			{
				waitframe(1);
				continue;
			}
			roll = randomint(100);
			if(roll > 85)
			{
				boss = "werewolf";
			}
			else
			{
				if(roll > 50)
				{
					boss = "gegenees";
				}
				else
				{
					boss = "margwa";
				}
			}
			var_94f3b914 = doa_enemy::function_d7c5adee(boss);
			ai = doa_enemy::function_4e8ae191(var_94f3b914, 1, room.origin, 0);
			if(isdefined(ai))
			{
				ai thread namespace_ec06fe4a::function_570729f0(90);
			}
			bosses--;
		}
		wait(2);
		numplayers = getplayers().size;
		wavetime = (80 - (numplayers * 10)) + (20 - (numplayers * 5));
		level thread namespace_6e90e490::function_c937e51f(wavetime);
		done = 0;
		while(wavetime > 0)
		{
			if(is_true(level.hostmigrationtimer))
			{
				waitframe(1);
				continue;
			}
			if((wavetime % 20) == 0)
			{
				for(count = 4 * getplayers().size; count; count--)
				{
					spot = function_d1e1819d();
					var_94f3b914 = doa_enemy::function_d7c5adee((randomint(100) > 50 ? "gladiator_destroyer" : "gladiator_marauder"));
					ai = doa_enemy::function_4e8ae191(var_94f3b914, 1, spot.origin, 0);
					if(isdefined(ai))
					{
						ai thread namespace_ec06fe4a::function_570729f0(90);
					}
				}
			}
			done = 1;
			if(namespace_ec06fe4a::function_9788bacc())
			{
				done = 0;
			}
			if(done)
			{
				break;
			}
			wavetime--;
			wait(1);
		}
		namespace_6e90e490::function_fa6f7ba7();
		if(!done)
		{
			var_30073b02 = 0;
		}
	}
	level notify(#"hash_2c640197a1e595fa");
	level.doa.var_79574675 = undefined;
	foreach(generator in room.generators)
	{
		if(isdefined(generator.var_64a23077))
		{
			[[ generator.var_64a23077.generator ]]->destroy();
			generator.var_64a23077 = undefined;
		}
	}
	level.doa.var_d54b7f72 = undefined;
	room.generators = [];
	namespace_ec06fe4a::function_de70888a(1);
	doa_fate::function_41d66855(var_30073b02);
	room notify(#"hash_4a4d7dd9266e6e8b");
}

/*
	Name: function_dff4eac9
	Namespace: namespace_5a917022
	Checksum: 0xD6973B33
	Offset: 0x7690
	Size: 0x13E
	Parameters: 0
	Flags: Linked
*/
function function_dff4eac9()
{
	spawnloc = spawnstruct();
	if(randomint(100) < 90)
	{
		spot = level.doa.var_6f3d327.var_dd856bff[randomint(level.doa.var_6f3d327.var_dd856bff.size)];
		spawnloc.origin = spot.origin + vectorscale((0, 0, 1), 1500);
		spawnloc.angles = spot.angles;
	}
	else
	{
		player = getplayers()[randomint(getplayers().size)];
		spawnloc.origin = player.origin + vectorscale((0, 0, 1), 1500);
		spawnloc.angles = player.angles;
	}
	return spawnloc;
}

/*
	Name: function_d1e1819d
	Namespace: namespace_5a917022
	Checksum: 0x9DBF79C1
	Offset: 0x77D8
	Size: 0xF6
	Parameters: 0
	Flags: Linked
*/
function function_d1e1819d()
{
	if(isdefined(level.doa.var_6f3d327.var_dd856bff))
	{
		return level.doa.var_6f3d327.var_dd856bff[randomint(level.doa.var_6f3d327.var_dd856bff.size)];
	}
	spawnloc = spawnstruct();
	player = getplayers()[randomint(getplayers().size)];
	spawnloc.origin = player.origin;
	spawnloc.angles = player.angles;
	return spawnloc;
}

