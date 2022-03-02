#using script_22caeaa9257194b8;
#using script_2529b6df09e4d9d1;
#using script_3706d21c449d0d14;
#using script_3919f386abede84;
#using script_3b034476f596d018;
#using script_45a1c6f3704b3b15;
#using script_5a9516c83d1ec8fc;
#using script_68364cfa1098cdd4;
#using script_691641bee32b9cd5;
#using script_6ebe1f317c0117b3;
#using script_7cc5fb39b97494c4;
#using script_7f8766df179db65d;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\audio_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\clientids_shared.gsc;
#using scripts\core_common\containers_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\scriptmodels_shared.gsc;
#using scripts\core_common\serverfaceanim_shared.gsc;
#using scripts\core_common\string_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\traps_deployable.gsc;
#using scripts\core_common\turret_shared.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_drivable_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\cp_common\art.gsc;
#using scripts\cp_common\challenges.gsc;
#using scripts\cp_common\debug.gsc;
#using scripts\cp_common\devgui.gsc;
#using scripts\cp_common\gametypes\globallogic.gsc;
#using scripts\cp_common\oed.gsc;
#using scripts\cp_common\skipto.gsc;
#using scripts\cp_common\spawn_manager.gsc;
#using scripts\cp_common\util.gsc;

#namespace load;

/*
	Name: function_e0a8e4ba
	Namespace: load
	Checksum: 0x6800075A
	Offset: 0x378
	Size: 0x23C
	Parameters: 1
	Flags: Private, Event
*/
event private function_e0a8e4ba(struct)
{
	foreach(k in [1:"script_likelyenemy", 0:"script_objective"])
	{
		if(!isdefined(level.var_41204f29))
		{
			level.var_41204f29 = [];
		}
		else if(!isarray(level.var_41204f29))
		{
			level.var_41204f29 = array(level.var_41204f29);
		}
		if(!isinarray(level.var_41204f29, tolower(k)))
		{
			level.var_41204f29[level.var_41204f29.size] = tolower(k);
		}
	}
	level.var_5e990e96 = arraycopy(level.var_41204f29);
	if(isdefined(level.struct))
	{
		temp = arraycopy(level.struct);
		level.struct = [];
		foreach(struct in temp)
		{
			struct::init(struct);
		}
	}
	function_6c07201b("CreateStruct", &function_e0a8e4ba);
}

/*
	Name: function_aeb1baea
	Namespace: load
	Checksum: 0xA851FD41
	Offset: 0x5C0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_aeb1baea()
{
	/#
		assert(!isdefined(level.var_f18a6bd6));
	#/
	level.var_f18a6bd6 = &function_5e443ed1;
}

/*
	Name: function_5e443ed1
	Namespace: load
	Checksum: 0xA6CE40FA
	Offset: 0x608
	Size: 0x36C
	Parameters: 0
	Flags: None
*/
function function_5e443ed1()
{
	/#
		/#
			assert(isdefined(level.first_frame), "");
		#/
	#/
	if(is_true(level._loadstarted))
	{
		return;
	}
	level._loadstarted = 1;
	function_fbb2b180();
	setdvar(#"playerenenergy_enabled", 0);
	setdvar(#"g_speed", 160);
	setdvar(#"hash_57692563a7cbec8", 120);
	setdvar(#"hash_59288563a952882", 150);
	var_4a3ec1d1 = getgametypesetting(#"hash_72a2919d2ac65850");
	setdvar(#"hash_7188be5be867a9ba", var_4a3ec1d1);
	setdvar(#"hash_862358d532e674c", var_4a3ec1d1);
	level.aitriggerspawnflags = getaitriggerflags();
	level.vehicletriggerspawnflags = getvehicletriggerflags();
	level flag::init("wait_and_revive");
	level flag::init("instant_revive");
	util::registerclientsys("lsm");
	level thread register_clientfields();
	setup_traversals();
	level thread onallplayersready();
	gamedifficulty::setskill(undefined, level.skill_override);
	system::function_c11b0642();
	art_review();
	level.growing_hitmarker = 1;
	level.var_6454ed48 = 0;
	level flag::set(#"load_main_complete");
	level flag::set("draft_complete");
	level.var_f320af85 = &function_e029c994;
	if(isdefined(level.skipto_point) && isdefined(level.default_skipto))
	{
		if(level.skipto_point == level.default_skipto)
		{
			world.var_b86bf11e = undefined;
		}
	}
	level thread function_c9740807();
	level thread function_2dd7fc9e();
}

/*
	Name: function_fbb2b180
	Namespace: load
	Checksum: 0x2A2D3E72
	Offset: 0x980
	Size: 0xE4
	Parameters: 0
	Flags: Private
*/
function private function_fbb2b180()
{
	function_3ca3c6e4();
	resetglass();
	if(isdefined(level.var_82eb1dab))
	{
		foreach(deathmodel in level.var_82eb1dab)
		{
			deathmodel delete();
		}
		level.var_82eb1dab = undefined;
	}
	level flag::set(#"hash_507a4486c4a79f1d");
}

/*
	Name: function_2dd7fc9e
	Namespace: load
	Checksum: 0x1C2938D3
	Offset: 0xA70
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_2dd7fc9e()
{
	level flag::wait_till("all_players_spawned");
	setdvar(#"ui_allowdisplaycontinue", 1);
	if(isloadingcinematicplaying())
	{
		do
		{
			waitframe(1);
		}
		while(isloadingcinematicplaying());
	}
	else
	{
		wait(1);
	}
	level util::streamer_wait(undefined, 2, 45);
	level flag::set(#"loaded");
}

/*
	Name: function_bc5d59fb
	Namespace: load
	Checksum: 0xF8E8A9A3
	Offset: 0xB40
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_bc5d59fb()
{
	setdvar(#"ui_allowdisplaycontinue", 0);
}

/*
	Name: function_ba5622e
	Namespace: load
	Checksum: 0x8432F83D
	Offset: 0xB70
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_ba5622e()
{
	util::set_level_start_flag("level_is_go");
}

/*
	Name: function_eb7b7382
	Namespace: load
	Checksum: 0x955FB73F
	Offset: 0xB98
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_eb7b7382()
{
	level flag::wait_till(#"loaded");
	level flag::wait_till(#"hash_321357f5b78401ef");
	level flag::set("level_is_go");
}

/*
	Name: function_c9740807
	Namespace: load
	Checksum: 0x8D705CEB
	Offset: 0xC08
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_c9740807()
{
	checkpointcreate();
	checkpointcommit();
	flag::wait_till("all_players_spawned");
	wait(0.5);
	checkpointcreate();
	checkpointcommit();
}

/*
	Name: function_e029c994
	Namespace: load
	Checksum: 0x136E8C7F
	Offset: 0xC78
	Size: 0x34
	Parameters: 3
	Flags: None
*/
function function_e029c994(player, target, weapon)
{
	return !weapon oob::isoutofbounds();
}

/*
	Name: player_fake_death
	Namespace: load
	Checksum: 0x19FB595
	Offset: 0xCB8
	Size: 0x114
	Parameters: 0
	Flags: None
*/
function player_fake_death()
{
	level notify(#"fake_death");
	self notify(#"fake_death");
	self takeallweapons();
	self allowstand(0);
	self allowcrouch(0);
	self allowprone(1);
	self val::set(#"fakedeath", "ignoreme", 1);
	self val::set(#"fakedeath", "takedamage", 0);
	wait(1);
	self val::set(#"fakedeath", "freezecontrols", 1);
}

/*
	Name: init_traverse
	Namespace: load
	Checksum: 0x17043996
	Offset: 0xDD8
	Size: 0xAE
	Parameters: 0
	Flags: None
*/
function init_traverse()
{
	point = getent(self.target, "targetname");
	if(isdefined(point))
	{
		self.traverse_height = point.origin[2];
		point delete();
	}
	else
	{
		point = struct::get(self.target, "targetname");
		if(isdefined(point))
		{
			self.traverse_height = point.origin[2];
		}
	}
}

/*
	Name: setup_traversals
	Namespace: load
	Checksum: 0x4B7CBC4B
	Offset: 0xE90
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function setup_traversals()
{
	potential_traverse_nodes = getallnodes();
	for(i = 0; i < potential_traverse_nodes.size; i++)
	{
		node = potential_traverse_nodes[i];
		if(node.type == #"begin")
		{
			node init_traverse();
		}
	}
}

/*
	Name: function_f97a8023
	Namespace: load
	Checksum: 0x7829C88B
	Offset: 0xF20
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function function_f97a8023(mission_name)
{
	if(!isdefined(mission_name))
	{
		return 0;
	}
	return function_dd83f1b6(mission_name);
}

/*
	Name: next_mission
	Namespace: load
	Checksum: 0x4B05FA3B
	Offset: 0xF58
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function next_mission(var_83104433, var_585e39fb)
{
	if(isdefined(var_83104433))
	{
		if(!isdefined(var_585e39fb))
		{
			var_585e39fb = skipto::function_455cb6c5(var_83104433);
		}
		function_cc51116c(var_83104433, var_585e39fb);
	}
	else
	{
		globallogic::function_7b994f00();
	}
}

/*
	Name: function_d44ed07e
	Namespace: load
	Checksum: 0xC3F73708
	Offset: 0xFD0
	Size: 0x12C
	Parameters: 2
	Flags: None
*/
function function_d44ed07e(var_83104433, var_585e39fb)
{
	if(!isdefined(var_83104433))
	{
		var_83104433 = skipto::function_60ca00f5();
	}
	if(is_true(level.var_d89799d7))
	{
		function_ff52baa2();
	}
	if(isdefined(var_585e39fb))
	{
		skipto::set_current_skipto(var_585e39fb, 1);
	}
	var_7c9eb9c6 = getrootmapname(var_83104433);
	level flag::clear("switchmap_preload_finished");
	level.var_d89799d7 = 1;
	level util::delay("switchmap_preload_finished", "cancel_preload", &flag::set, "switchmap_preload_finished");
	switchmap_preload(var_7c9eb9c6, level.gametype);
}

/*
	Name: function_ff52baa2
	Namespace: load
	Checksum: 0x9E80687
	Offset: 0x1108
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_ff52baa2()
{
	level notify(#"cancel_preload");
	function_227b0384();
	level.var_d89799d7 = undefined;
	level flag::clear("switchmap_preload_finished");
}

/*
	Name: function_cc51116c
	Namespace: load
	Checksum: 0xBFC9987A
	Offset: 0x1168
	Size: 0x18C
	Parameters: 2
	Flags: None
*/
function function_cc51116c(var_83104433, var_585e39fb)
{
	if(!isdefined(var_585e39fb))
	{
		var_585e39fb = "";
	}
	skipto::set_current_skipto(var_585e39fb, 1);
	var_31924550 = getuimodel(function_5f72e972(#"hash_31e97ba41cad1834"), "transitionMapIdOverride");
	setuimodelvalue(var_31924550, hash(var_83104433));
	if(is_true(level.var_d89799d7))
	{
		util::wait_network_frame(1);
		level flag::wait_till_timeout(25, "switchmap_preload_finished");
		level.var_d89799d7 = undefined;
		switchmap_switch();
	}
	else
	{
		level.var_d89799d7 = undefined;
		var_7c9eb9c6 = getrootmapname(var_83104433);
		switchmap_load(var_7c9eb9c6, level.gametype);
		util::wait_network_frame(1);
		switchmap_switch();
	}
}

/*
	Name: player_intermission
	Namespace: load
	Checksum: 0x1711574E
	Offset: 0x1300
	Size: 0x4C0
	Parameters: 1
	Flags: None
*/
function player_intermission(var_1ed3b46b)
{
	if(!isdefined(var_1ed3b46b))
	{
		var_1ed3b46b = 1;
	}
	self closeingamemenu();
	level endon(#"hash_1ef9c6a01f34e17d", #"stop_intermission");
	self endon(#"death");
	self notify(#"_zombie_game_over");
	if(is_true(var_1ed3b46b))
	{
		self.sessionstate = "intermission";
	}
	self.spectatorclient = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	self.friendlydamage = undefined;
	points = struct::get_array("intermission", "targetname");
	if(!isdefined(points) || points.size == 0)
	{
		points = getentarray("info_intermission", "classname");
		if(points.size < 1)
		{
			/#
				println("");
			#/
			return;
		}
	}
	org = undefined;
	while(true)
	{
		points = array::randomize(points);
		for(i = 0; i < points.size; i++)
		{
			point = points[i];
			if(!isdefined(org))
			{
				self spawn(point.origin, point.angles);
			}
			if(isdefined(points[i].target))
			{
				if(!isdefined(org))
				{
					org = spawn("script_model", self.origin + (vectorscale((0, 0, -1), 60)));
					org setmodel(#"tag_origin");
				}
				org.origin = points[i].origin;
				org.angles = points[i].angles;
				for(j = 0; j < getplayers().size; j++)
				{
					player = getplayers()[j];
					player camerasetposition(org);
					player camerasetlookat();
					player cameraactivate(1);
				}
				speed = 20;
				if(isdefined(points[i].speed))
				{
					speed = points[i].speed;
				}
				target_point = (isdefined(struct::get(points[i].target, "targetname")) ? struct::get(points[i].target, "targetname") : getent(points[i].target, "targetname"));
				dist = distance(points[i].origin, target_point.origin);
				time = dist / speed;
				q_time = time * 0.25;
				if(q_time > 1)
				{
					q_time = 1;
				}
				org moveto(target_point.origin, time, q_time, q_time);
				org rotateto(target_point.angles, time, q_time, q_time);
				wait(time);
				continue;
			}
			wait(5);
		}
	}
}

/*
	Name: onallplayersready
	Namespace: load
	Checksum: 0xF550E565
	Offset: 0x17C8
	Size: 0x234
	Parameters: 0
	Flags: None
*/
function onallplayersready()
{
	level flag::init("start_coop_logic");
	/#
		println("" + getnumexpectedplayers());
		var_f884532 = 0;
	#/
	do
	{
		waitframe(1);
		var_72e2b734 = getnumconnectedplayers();
		var_73f084c = getnumexpectedplayers(1);
		player_count_actual = 0;
		for(i = 0; i < level.players.size; i++)
		{
			if(level.players[i].sessionstate == "playing" || level.players[i].sessionstate == "spectator")
			{
				player_count_actual++;
			}
		}
		/#
			if((var_f884532 % 10) == 0)
			{
				println((("" + var_72e2b734) + "") + var_73f084c);
				println((("" + player_count_actual) + "") + level.players.size);
			}
			var_f884532++;
		#/
	}
	while(var_72e2b734 < var_73f084c || player_count_actual < var_73f084c);
	setinitialplayersconnected();
	/#
		printtoprightln("", (1, 1, 1));
	#/
	level flag::set("all_players_connected");
	level flag::set("start_coop_logic");
}

/*
	Name: register_clientfields
	Namespace: load
	Checksum: 0x80F724D1
	Offset: 0x1A08
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function register_clientfields()
{
}

