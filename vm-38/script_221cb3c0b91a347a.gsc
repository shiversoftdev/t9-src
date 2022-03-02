#using script_1029986e2bc8ca8e;
#using script_18077945bb84ede7;
#using script_1cf46b33555422b7;
#using script_2cb831533cab2794;
#using script_3411bb48d41bd3b;
#using script_34ab99a4ca1a43d;
#using script_35598499769dbb3d;
#using script_3751b21462a54a7d;
#using script_39794946bfda42fb;
#using script_3cebb48c37fc271;
#using script_3e25b5e703601101;
#using script_3f9e0dc8454d98e1;
#using script_4108035fe400ce67;
#using script_4acbbbcdc7ef16a0;
#using script_5ed2585bb7f6211f;
#using script_5f261a5d57de5f7c;
#using script_6727713c6a2b75e4;
#using script_6c5b51f98cd04fa3;
#using script_6fd04d6a5aedaec9;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\healthoverlay.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_dbaeabbd;

/*
	Name: function_81da2d5a
	Namespace: namespace_dbaeabbd
	Checksum: 0x32DF079A
	Offset: 0xA50
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_81da2d5a()
{
	level notify(1992487386);
}

/*
	Name: init
	Namespace: namespace_dbaeabbd
	Checksum: 0x1CEC7FD5
	Offset: 0xA70
	Size: 0x57C
	Parameters: 0
	Flags: None
*/
function init()
{
	level.var_55fd9380 = luielemtext::register();
	level.var_252ba2b0 = namespace_5ac3cdbb::register();
	level.var_eda01097 = [];
	clientfield::register("world", "" + #"hash_112d67305f861fe", 28000, 3, "int");
	clientfield::register("scriptmover", "" + #"hash_3d5c2390c0768ed2", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_79077a9af52542c8", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_46bf4cc1eea0741a", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_6e68f1a9f11ee7a7", 28000, 1, "int");
	clientfield::register("toplayer", "" + #"hash_1c5f8a62c31e12a5", 28000, 1, "int");
	clientfield::register("world", "" + #"hash_1050257bf996b481", 28000, 4, "int");
	clientfield::register("scriptmover", "" + #"hash_696368486685bb5c", 28000, 1, "int");
	clientfield::register("toplayer", "" + #"hash_1a1bf38ae538a50d", 28000, 1, "int");
	clientfield::register("toplayer", "" + #"hash_2b3bf178344cc787", 28000, 1, "int");
	clientfield::register("actor", "" + #"hash_303ed2c4515453aa", 28000, 1, "counter");
	clientfield::register("vehicle", "" + #"hash_24b93fe5f3d174f8", 28000, 3, "int");
	clientfield::register("toplayer", "" + #"hash_355304ea91d4edc8", 28000, 1, "counter");
	clientfield::register("vehicle", "" + #"hash_6324044c00c5672d", 28000, 4, "int");
	clientfield::register("world", "" + #"hash_6c40bdc03cfa78bb", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_2777a21403131281", 28000, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_4a1dfb77dccf6587", 28000, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_3215084197667777", 28000, 1, "int");
	clientfield::register("world", "" + #"hash_665b17bb90845861", 28000, 2, "int");
	level thread function_c07c7ebc("hide");
	level thread function_619fdf5f();
	if(!zm_utility::function_e51dc2d8())
	{
		return;
	}
	function_b5f47b0c();
	/#
		level thread function_37597f29();
	#/
}

/*
	Name: function_b5f47b0c
	Namespace: namespace_dbaeabbd
	Checksum: 0x301C6783
	Offset: 0xFF8
	Size: 0x31C
	Parameters: 0
	Flags: None
*/
function function_b5f47b0c()
{
	level namespace_ee206246::register(#"hash_592ce418976db238", #"step_1", #"hash_27600aac20c66933", &function_37f28f2b, &function_8abd620);
	level namespace_ee206246::register(#"hash_592ce418976db238", #"step_2", #"hash_27600bac20c66ae6", &function_8f75cb6a, &function_edc7972d);
	level namespace_ee206246::register(#"hash_57230432a83836b9", #"step_1", #"hash_73596b2d2d57ce04", &function_a7e59618, &function_e37354de);
	level namespace_ee206246::register(#"hash_57230432a83836b9", #"step_2", #"hash_73596e2d2d57d31d", &function_882e782f, &function_1fe4ebed);
	level namespace_ee206246::register(#"hash_7591c30825555587", #"step_1", #"hash_1c15011351799adb", &function_9a3e69a6, &function_14f1a95a);
	level namespace_ee206246::register(#"hash_7591c30825555587", #"step_2", #"hash_1c15021351799c8e", &function_e86d6eef, &function_8cf6a181);
	level namespace_ee206246::register(#"hash_7591c30825555587", #"step_3", #"hash_1c15031351799e41", &function_4d5c7397, &function_ce6f66c8);
	level namespace_ee206246::start(#"hash_592ce418976db238");
	level namespace_ee206246::start(#"hash_57230432a83836b9");
	level namespace_ee206246::start(#"hash_7591c30825555587");
	level thread function_bd26a10a();
}

/*
	Name: function_2c55b43
	Namespace: namespace_dbaeabbd
	Checksum: 0x2DCAFA9D
	Offset: 0x1320
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function function_2c55b43()
{
	level endon(#"end_game");
	var_317ae7e0 = struct::get_array("side_quest_gp_zombies", "targetname");
	foreach(var_559521c0 in var_317ae7e0)
	{
		var_559521c0 thread function_1efd8a9b();
	}
}

/*
	Name: function_1efd8a9b
	Namespace: namespace_dbaeabbd
	Checksum: 0xA84FEC5D
	Offset: 0x13F0
	Size: 0x28C
	Parameters: 0
	Flags: None
*/
function function_1efd8a9b()
{
	level endon(#"end_game");
	if(self.script_noteworthy === "mimic")
	{
		self thread scene::play("aib_t9_zm_tungsten_grand_prix_mimic_dance");
	}
	else
	{
		if(self.script_noteworthy === "mechz")
		{
			self thread scene::play("aib_t9_zm_tungsten_grand_prix_mechz_dance");
		}
		else
		{
			if(self.script_noteworthy === "raz")
			{
				var_af0ec1a6 = function_21a3a673(1, 7);
				str_state = "dance_" + var_af0ec1a6;
				self thread scene::play("aib_t9_zm_tungsten_grand_prix_raz_dance", str_state);
			}
			else
			{
				if(self.script_noteworthy === "zombie")
				{
					var_af0ec1a6 = function_21a3a673(1, 7);
					str_state = "dance_" + var_af0ec1a6;
					self thread scene::play("aib_t9_zm_tungsten_grand_prix_zombie_dance", str_state);
				}
				else if(self.script_noteworthy === "zombie_racing_start")
				{
					self thread scene::play("aib_t9_zm_tungsten_grand_prix_zombie_dance", "idle");
					level flag::wait_till(#"hash_31c8302c06f5b552");
					self thread scene::play("aib_t9_zm_tungsten_grand_prix_zombie_dance", "racing_start");
					self waittill(#"scenes_done");
					var_af0ec1a6 = function_21a3a673(1, 7);
					str_state = "dance_" + var_af0ec1a6;
					self thread scene::play("aib_t9_zm_tungsten_grand_prix_zombie_dance", str_state);
				}
			}
		}
	}
	level flag::wait_till(#"hash_4e003b0a25eefe02");
	self scene::delete_scene_spawned_ents();
	self scene::stop();
}

/*
	Name: function_bd26a10a
	Namespace: namespace_dbaeabbd
	Checksum: 0x8C08AA52
	Offset: 0x1688
	Size: 0x72
	Parameters: 0
	Flags: None
*/
function function_bd26a10a()
{
	level.var_181464da = {};
	level.var_181464da.var_5c62b88d = [2:100, 1:30, 0:30];
	level.var_181464da.var_6d6e20de = level function_64969e00();
}

/*
	Name: function_64969e00
	Namespace: namespace_dbaeabbd
	Checksum: 0x4AB5CF15
	Offset: 0x1708
	Size: 0x264
	Parameters: 0
	Flags: None
*/
function function_64969e00()
{
	var_638ed7d7 = {#start:struct::get("grand_prix_racetrack_start"), #nodes:[]};
	s_node = var_638ed7d7.start;
	/#
		var_e542c08f = undefined;
		var_e6336354 = "";
	#/
	while(isdefined(s_node))
	{
		var_638ed7d7 process_node(s_node);
		/#
			var_e542c08f = var_e6336354;
			var_e6336354 = s_node.target;
		#/
		s_node = s_node function_af68d4ba();
		if(s_node.state === 2)
		{
			break;
		}
	}
	/#
		if(!isdefined(s_node))
		{
			loc_00001848:
			str_msg = (("" + (isdefined(var_e6336354) ? var_e6336354 : "")) + "") + (isdefined(var_e542c08f) ? var_e542c08f : "");
			/#
				assertmsg(str_msg);
			#/
		}
	#/
	/#
		assert(s_node === var_638ed7d7.start, "");
	#/
	/#
		assert(var_638ed7d7.checkpoints.size > 1, "");
	#/
	foreach(s_node in var_638ed7d7.nodes)
	{
		s_node function_c2466e15();
		/#
			level thread function_ff9ac35b(s_node);
		#/
	}
	return var_638ed7d7;
}

/*
	Name: process_node
	Namespace: namespace_dbaeabbd
	Checksum: 0x999D5E1
	Offset: 0x1978
	Size: 0x28E
	Parameters: 1
	Flags: None
*/
function process_node(s_node)
{
	/#
		assert(s_node.angles[2] == 0);
	#/
	s_node.axis = {#right:anglestoright(s_node.angles)};
	s_node.width = (isdefined(s_node.width) ? s_node.width : 100);
	s_node.height = (isdefined(s_node.height) ? s_node.height : -1);
	var_bfb91b7c = s_node.axis.right * s_node.width;
	s_node.left = s_node.origin - var_bfb91b7c;
	s_node.right = s_node.origin + var_bfb91b7c;
	/#
		assert(!isdefined(s_node.index));
	#/
	s_node.index = self.nodes.size;
	if(!isdefined(self.nodes))
	{
		self.nodes = [];
	}
	else if(!isarray(self.nodes))
	{
		self.nodes = array(self.nodes);
	}
	if(!isinarray(self.nodes, s_node))
	{
		self.nodes[self.nodes.size] = s_node;
	}
	if(is_true(s_node.checkpoint))
	{
		if(!isdefined(self.checkpoints))
		{
			self.checkpoints = [];
		}
		else if(!isarray(self.checkpoints))
		{
			self.checkpoints = array(self.checkpoints);
		}
		if(!isinarray(self.checkpoints, s_node))
		{
			self.checkpoints[self.checkpoints.size] = s_node;
		}
	}
	s_node.state = 1;
}

/*
	Name: function_af68d4ba
	Namespace: namespace_dbaeabbd
	Checksum: 0xEA5C77DB
	Offset: 0x1C10
	Size: 0x7E
	Parameters: 0
	Flags: None
*/
function function_af68d4ba()
{
	/#
		assert(self.state >= 1);
	#/
	s_next = struct::get(self.target);
	if(isdefined(s_next))
	{
		self.next = s_next;
		s_next.prev = self;
	}
	self.state = 2;
	return s_next;
}

/*
	Name: function_c2466e15
	Namespace: namespace_dbaeabbd
	Checksum: 0x4F8D323C
	Offset: 0x1C98
	Size: 0x1C6
	Parameters: 0
	Flags: None
*/
function function_c2466e15()
{
	/#
		assert(self.state >= 2);
	#/
	v_right = self.axis.right;
	/#
		assert(isdefined(v_right));
	#/
	self.edge = {#right:(0, 0, 0), #left:(0, 0, 0)};
	s_next = self.next;
	if(isdefined(s_next))
	{
		/#
			assert(s_next.state >= 2);
		#/
		var_665441ed = s_next.origin - self.origin;
		self.axis.up = vectornormalize(vectorcross(v_right, var_665441ed));
		self.edge.left = s_next.left - self.left;
		self.edge.right = s_next.right - self.right;
	}
	else
	{
		self.axis.up = (0, 0, 1);
	}
	self.axis.forward = vectorcross(self.axis.up, v_right);
	self.state = 3;
}

/*
	Name: function_ff9ac35b
	Namespace: namespace_dbaeabbd
	Checksum: 0x7576390
	Offset: 0x1E68
	Size: 0x336
	Parameters: 1
	Flags: None
*/
function function_ff9ac35b(s_node)
{
	/#
		level endon(#"end_game");
		while(true)
		{
			if(getdvarint(#"hash_4f9bc320ac30703d", 0))
			{
				v_color = (is_true(s_node.checkpoint) ? (1, 1, 0) : (1, 0, 0));
				line(s_node.origin, s_node.origin + (s_node.axis.forward * 20), v_color, 1, 1, 100);
				line(s_node.origin, s_node.origin + (s_node.axis.up * 20), v_color, 1, 1, 100);
				v_left = s_node.left;
				v_right = s_node.right;
				n_height = (s_node.height > 0 ? s_node.height : 100);
				var_f6da19f0 = s_node.axis.up * n_height;
				var_b11226dc = s_node.axis.up * -50;
				if(isdefined(s_node.next))
				{
					line(v_left, s_node.next.left, (1, 0, 0), 1, 1, 100);
					line(v_right, s_node.next.right, (1, 0, 0), 1, 1, 100);
				}
				line(v_left, v_right, v_color, 1, 1, 100);
				if(s_node.height > 0)
				{
					line(v_left + var_f6da19f0, v_right + var_f6da19f0, v_color, 1, 1, 100);
				}
				line(v_left + var_b11226dc, v_left + var_f6da19f0, v_color, 1, 1, 100);
				line(v_right + var_b11226dc, v_right + var_f6da19f0, v_color, 1, 1, 100);
				line(v_left + var_b11226dc, v_left + var_b11226dc, v_color, 1, 1, 100);
			}
			waitframe(100);
		}
	#/
}

/*
	Name: function_5d97ec11
	Namespace: namespace_dbaeabbd
	Checksum: 0xFB80F7D0
	Offset: 0x21A8
	Size: 0xE8
	Parameters: 1
	Flags: None
*/
function function_5d97ec11(v_point)
{
	var_74de1ad0 = v_point - self.left;
	var_d47effbe = v_point - self.right;
	var_af5e30e8 = vectordot(vectorcross(var_74de1ad0, self.edge.left), self.axis.up);
	var_ddc1df15 = vectordot(vectorcross(var_d47effbe, self.edge.right), self.axis.up);
	return (var_af5e30e8 * var_ddc1df15) >= 0;
}

/*
	Name: function_39ad79f1
	Namespace: namespace_dbaeabbd
	Checksum: 0xFB44E432
	Offset: 0x2298
	Size: 0x210
	Parameters: 1
	Flags: None
*/
function function_39ad79f1(v_point)
{
	var_5cf32b1d = v_point - self.origin;
	var_caf232e4 = vectordot(var_5cf32b1d, self.axis.right);
	if(var_caf232e4 < self.width * -1)
	{
		var_caf232e4 = self.width * -1;
	}
	else if(var_caf232e4 > self.width)
	{
		var_caf232e4 = self.width;
	}
	var_1fe2f091 = self.origin + (self.axis.right * var_caf232e4);
	var_a693b30e = vectordot(var_5cf32b1d, self.axis.up);
	var_33cb36c = v_point - (self.axis.up * var_a693b30e);
	var_d2902d22 = distancesquared(var_33cb36c, var_1fe2f091);
	/#
		if(getdvarint(#"hash_4f9bc320ac30703d", 0))
		{
			n_color = sqrt(var_d2902d22) / 500;
			if(n_color > 1)
			{
				n_color = 1;
			}
			v_color = (n_color, 1 - n_color, 0);
			line(v_point, var_33cb36c, v_color, 1, 1, 1);
			line(var_33cb36c, var_1fe2f091, v_color, 1, 1, 1);
		}
	#/
	return var_d2902d22;
}

/*
	Name: function_e5d9dcfc
	Namespace: namespace_dbaeabbd
	Checksum: 0xA3319819
	Offset: 0x24B0
	Size: 0x310
	Parameters: 2
	Flags: None
*/
function function_e5d9dcfc(var_163bd9fc, var_27e17d47)
{
	var_a8881d11 = (isdefined(var_163bd9fc.var_4290ff97.time) ? var_163bd9fc.var_4290ff97.time : 2147483647);
	var_c8dde57b = (isdefined(var_27e17d47.var_4290ff97.time) ? var_27e17d47.var_4290ff97.time : 2147483647);
	if(var_a8881d11 != var_c8dde57b)
	{
		return var_a8881d11 < var_c8dde57b;
	}
	var_2ac75b4e = (isdefined(var_163bd9fc.var_4290ff97.dist) ? var_163bd9fc.var_4290ff97.dist : -1);
	var_7cc2a3a1 = (isdefined(var_27e17d47.var_4290ff97.dist) ? var_27e17d47.var_4290ff97.dist : -1);
	if(var_2ac75b4e != var_7cc2a3a1)
	{
		return var_2ac75b4e > var_7cc2a3a1;
	}
	if(var_163bd9fc.var_5b345137 != var_27e17d47.var_5b345137)
	{
		return var_163bd9fc.var_5b345137 > var_27e17d47.var_5b345137;
	}
	var_1ba29af7 = level.var_181464da.var_6d6e20de.checkpoints;
	var_4c5b7de6 = level.var_181464da.var_6d6e20de.nodes.size;
	var_fea222c = (isdefined(var_163bd9fc.var_8307a35a.node.index) ? var_163bd9fc.var_8307a35a.node.index : -1);
	var_edc9a69e = (isdefined(var_27e17d47.var_8307a35a.node.index) ? var_27e17d47.var_8307a35a.node.index : -1);
	if(var_fea222c > var_163bd9fc.var_d4821534)
	{
		var_fea222c = var_fea222c - var_4c5b7de6;
	}
	if(var_edc9a69e > var_27e17d47.var_d4821534)
	{
		var_edc9a69e = var_edc9a69e - var_4c5b7de6;
	}
	if(var_fea222c != var_edc9a69e)
	{
		return var_fea222c > var_edc9a69e;
	}
	var_1330233 = (isdefined(var_163bd9fc.var_8307a35a.dist_to_next) ? var_163bd9fc.var_8307a35a.dist_to_next : 2147483647);
	var_b64408e1 = (isdefined(var_27e17d47.var_8307a35a.dist_to_next) ? var_27e17d47.var_8307a35a.dist_to_next : 2147483647);
	return var_1330233 < var_b64408e1;
}

/*
	Name: function_8a2eb37
	Namespace: namespace_dbaeabbd
	Checksum: 0x9321E9CE
	Offset: 0x27C8
	Size: 0x414
	Parameters: 0
	Flags: None
*/
function function_8a2eb37()
{
	level endon(#"end_game", #"hash_55ded3d3485a9adb");
	var_57850891 = 0;
	while(!var_57850891)
	{
		waitframe(1);
		waittillframeend();
		if(!isdefined(level.var_3ab17de8))
		{
			continue;
		}
		arrayremovevalue(level.var_3ab17de8, undefined);
		var_be321485 = array::merge_sort(level.var_3ab17de8, &function_e5d9dcfc);
		n_total = var_be321485.size;
		if(n_total > 0)
		{
			var_57850891 = var_be321485[n_total - 1] flag::get(#"reach_goal");
		}
		else
		{
			var_57850891 = 1;
		}
		for(i = 0; i < n_total; i++)
		{
			e_vehicle = var_be321485[i];
			var_ff4491b2 = e_vehicle.owner;
			if(!level.var_252ba2b0 namespace_5ac3cdbb::is_open(var_ff4491b2))
			{
				level.var_252ba2b0 namespace_5ac3cdbb::open(var_ff4491b2);
			}
			level.var_252ba2b0 namespace_5ac3cdbb::function_2b44c64e(var_ff4491b2, i);
			/#
				var_55935bba = e_vehicle.var_8307a35a;
				if(isdefined(var_55935bba))
				{
					if(e_vehicle flag::get(#"reach_goal"))
					{
						v_color = (0, 1, 0);
					}
					else
					{
						var_dcaeab5 = gettime() - var_55935bba.last_update;
						n_color = math::clamp(var_dcaeab5 / 500, 0, 1);
						v_color = (1, 1 - n_color, 1 - n_color);
					}
					debugstar(var_55935bba.last_pos, 10, v_color);
					n_player = e_vehicle.owner getentnum();
					var_38811eba = (e_vehicle.var_5b345137 + "") + 3;
					var_9ac6b2ac = ((((("" + n_player) + "") + (i + 1) + "") + n_total) + "") + var_38811eba;
					var_f5eb67b0 = sqrt(var_55935bba.dist_to_next);
					var_ba0b397c = (("" + var_55935bba.node.index) + "") + var_f5eb67b0;
					var_a2d88df3 = "" + e_vehicle.var_1f06a135;
					debug2dtext((900, 600 + (i * 30), 0), (var_9ac6b2ac + var_ba0b397c) + var_a2d88df3, v_color);
				}
			#/
		}
	}
	music::setmusicstate("");
	wait(5);
	level flag::set(#"hash_55ded3d3485a9adb");
}

/*
	Name: function_e951ccfe
	Namespace: namespace_dbaeabbd
	Checksum: 0x1158FBDA
	Offset: 0x2BE8
	Size: 0x292
	Parameters: 2
	Flags: None
*/
function function_e951ccfe(s_node, n_time)
{
	/#
		assert(s_node.state == 3);
	#/
	str_node = s_node.targetname;
	if(!isdefined(self.var_2ab8445c[str_node]))
	{
		self.var_2ab8445c[str_node] = {#node:s_node};
	}
	var_2ddc0533 = self.var_2ab8445c[str_node];
	var_5cf32b1d = self.origin - s_node.origin;
	if(vectordot(var_5cf32b1d, s_node.axis.forward) < 0)
	{
		return;
	}
	s_next = s_node.next;
	if(isdefined(s_next))
	{
		var_50a4e36b = self.origin - s_next.origin;
		if(vectordot(var_50a4e36b, s_next.axis.forward) >= 0)
		{
			return;
		}
	}
	var_a693b30e = vectordot(var_5cf32b1d, s_node.axis.up);
	if(var_a693b30e < -50)
	{
		return;
	}
	if(s_node.height > 0 && var_a693b30e > s_node.height)
	{
		return;
	}
	var_cf8ec119 = s_node function_5d97ec11(self.origin);
	if(var_cf8ec119)
	{
		return;
	}
	var_d2902d22 = s_node function_39ad79f1(self.origin);
	if(isdefined(s_node.next))
	{
		var_328fb11b = s_node.next function_39ad79f1(self.origin);
	}
	var_2ddc0533.last_update = n_time;
	var_2ddc0533.last_pos = self.origin;
	var_2ddc0533.var_87324918 = var_a693b30e;
	var_2ddc0533.var_1a4cb070 = var_d2902d22;
	var_2ddc0533.dist_to_next = var_328fb11b;
	return var_2ddc0533;
}

/*
	Name: function_290d0461
	Namespace: namespace_dbaeabbd
	Checksum: 0x847D3886
	Offset: 0x2E88
	Size: 0x2D4
	Parameters: 1
	Flags: None
*/
function function_290d0461(var_ce9da91e)
{
	var_638ed7d7 = level.var_181464da.var_6d6e20de;
	if(var_ce9da91e.node === var_638ed7d7.checkpoints[self.var_1f06a135] && var_ce9da91e.var_1a4cb070 < 1600)
	{
		if(self.var_1f06a135 == 0)
		{
			if(self.var_5b345137 < 3)
			{
				self.var_5b345137++;
				if(isdefined(self.owner))
				{
					self.owner playsoundtoplayer(#"hash_2116f6ce15a45c4a", self.owner);
					level.var_252ba2b0 namespace_5ac3cdbb::function_307daa91(self.owner, self.var_5b345137);
				}
			}
			else
			{
				self flag::set(#"reach_goal");
				self.var_4290ff97 = {#dist:var_ce9da91e.var_1a4cb070, #time:var_ce9da91e.last_update};
				if(isdefined(self.owner))
				{
					self.owner clientfield::set_to_player("" + #"hash_1a1bf38ae538a50d", 0);
					self.owner playsoundtoplayer(#"hash_5a0bc57f6d12bf4c", self.owner);
					music::setmusicstate("", self.owner);
				}
				level notify(#"hash_51adedadaedb6ebd", {#record:self.var_4290ff97, #vehicle:self});
				return;
			}
		}
		level notify(#"hash_4847149e99d2b54", {#lap:self.var_5b345137, #checkpoint:self.var_1f06a135, #vehicle:self});
		/#
			assert(var_638ed7d7.checkpoints.size > 1);
		#/
		self.var_1f06a135 = (self.var_1f06a135 + 1) % var_638ed7d7.checkpoints.size;
		self function_dc6e31a(self.var_1f06a135);
	}
}

/*
	Name: function_dc6e31a
	Namespace: namespace_dbaeabbd
	Checksum: 0xD9132DF3
	Offset: 0x3168
	Size: 0x72
	Parameters: 1
	Flags: Private
*/
function private function_dc6e31a(var_836b8ec4)
{
	var_57ef78ed = level.var_181464da.var_6d6e20de.checkpoints[var_836b8ec4];
	self.var_d4821534 = (isdefined(var_57ef78ed.prev.index) ? var_57ef78ed.prev.index : -1);
}

/*
	Name: function_3dd87730
	Namespace: namespace_dbaeabbd
	Checksum: 0xAB693677
	Offset: 0x31E8
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_3dd87730(var_ff4491b2)
{
	self.owner = var_ff4491b2;
	self setteam(var_ff4491b2.team);
	self.var_2ab8445c = [];
	self.var_8307a35a = undefined;
	self.var_4290ff97 = undefined;
	self.var_5b345137 = 0;
	self.var_1f06a135 = 0;
	self function_dc6e31a(self.var_1f06a135);
	self clientfield::set("" + #"hash_24b93fe5f3d174f8", var_ff4491b2.var_edf90e4e);
}

/*
	Name: function_3594e062
	Namespace: namespace_dbaeabbd
	Checksum: 0x6A8D41BA
	Offset: 0x32B0
	Size: 0x3E6
	Parameters: 1
	Flags: None
*/
function function_3594e062(var_638ed7d7)
{
	self endon(#"death", #"reach_goal");
	while(true)
	{
		v_position = self.origin;
		a_sorted = arraysortclosest(var_638ed7d7.nodes, v_position);
		a_closest = [];
		for(i = 0; i < a_sorted.size && (a_closest.size < 10 || distancesquared(v_position, a_sorted[i].origin) < 1000000); i++)
		{
			if(!isdefined(a_closest))
			{
				a_closest = [];
			}
			else if(!isarray(a_closest))
			{
				a_closest = array(a_closest);
			}
			if(!isinarray(a_closest, a_sorted[i]))
			{
				a_closest[a_closest.size] = a_sorted[i];
			}
			var_a3496a80 = a_sorted[i].prev;
			if(isdefined(var_a3496a80))
			{
				if(!isdefined(a_closest))
				{
					a_closest = [];
				}
				else if(!isarray(a_closest))
				{
					a_closest = array(a_closest);
				}
				if(!isinarray(a_closest, var_a3496a80))
				{
					a_closest[a_closest.size] = var_a3496a80;
				}
			}
		}
		if(isdefined(self.var_8307a35a))
		{
			if(!isdefined(a_closest))
			{
				a_closest = [];
			}
			else if(!isarray(a_closest))
			{
				a_closest = array(a_closest);
			}
			if(!isinarray(a_closest, self.var_8307a35a.node))
			{
				a_closest[a_closest.size] = self.var_8307a35a.node;
			}
		}
		var_2f5b0b52 = 0;
		n_time = gettime();
		foreach(s_node in a_closest)
		{
			var_907882e = self function_e951ccfe(s_node, n_time);
			if(isdefined(var_907882e))
			{
				if(self.var_8307a35a.last_update === n_time)
				{
					if(abs(self.var_8307a35a.var_87324918) > abs(var_907882e.var_87324918))
					{
						self.var_8307a35a = var_907882e;
						var_2f5b0b52 = 1;
					}
					continue;
				}
				self.var_8307a35a = var_907882e;
				var_2f5b0b52 = 1;
			}
		}
		if(var_2f5b0b52)
		{
			self thread function_290d0461(self.var_8307a35a);
		}
		waitframe(1);
	}
}

/*
	Name: function_b3944074
	Namespace: namespace_dbaeabbd
	Checksum: 0x652F6285
	Offset: 0x36A0
	Size: 0x160
	Parameters: 2
	Flags: None
*/
function function_b3944074(e_vehicle, var_393fdcb6)
{
	level endon(#"end_game", #"hash_55ded3d3485a9adb");
	self endon(#"death", #"disconnect");
	e_vehicle endon(#"reach_goal");
	/#
		assert(isdefined(var_393fdcb6) && var_393fdcb6.size >= 0);
	#/
	self.var_ae881231 = var_393fdcb6.size;
	level.var_252ba2b0 namespace_5ac3cdbb::function_2b80b614(self, self.var_ae881231);
	level flag::wait_till(#"hash_3f4a32a9aa24334a");
	while(self.var_ae881231 > 0)
	{
		n_duration = level.var_181464da.var_5c62b88d[self.var_ae881231 - 1];
		wait(n_duration);
		self.var_ae881231--;
		level.var_252ba2b0 namespace_5ac3cdbb::function_2b80b614(self, self.var_ae881231);
	}
}

/*
	Name: function_402055f0
	Namespace: namespace_dbaeabbd
	Checksum: 0x217C6FB3
	Offset: 0x3808
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function function_402055f0(b_show)
{
	if(!isdefined(b_show))
	{
		b_show = 1;
	}
	if(!isdefined(self) || !isdefined(level.zm_hint_text))
	{
		return;
	}
	if(b_show)
	{
		if(!level.zm_hint_text zm_hint_text::is_open(self))
		{
			level.zm_hint_text zm_hint_text::open(self);
		}
		level.zm_hint_text zm_hint_text::function_d5ea17f0(self, #"hash_52d1bd770ba77ae0");
		level.zm_hint_text zm_hint_text::set_visible(self, 1);
	}
	else if(level.zm_hint_text zm_hint_text::is_open(self))
	{
		level.zm_hint_text zm_hint_text::set_visible(self, 0);
		level.zm_hint_text zm_hint_text::close(self);
	}
}

/*
	Name: function_7e0ee279
	Namespace: namespace_dbaeabbd
	Checksum: 0xBDC3CEE0
	Offset: 0x3938
	Size: 0x1F4
	Parameters: 0
	Flags: Private
*/
function private function_7e0ee279()
{
	self endon(#"death");
	var_76f90141 = self.var_8307a35a.node;
	if(isdefined(var_76f90141))
	{
		v_location = var_76f90141.origin;
		s_trace = groundtrace(v_location + vectorscale((0, 0, 1), 50), v_location - vectorscale((0, 0, 1), 50), 0, self);
		if(isdefined(s_trace[#"position"]))
		{
			v_location = s_trace[#"position"];
		}
		self setbrake(1);
		if(isdefined(self.owner))
		{
			self.owner clientfield::set_to_player("" + #"hash_2b3bf178344cc787", 1);
			util::wait_network_frame();
			wait(1);
		}
		self.origin = v_location + vectorscale((0, 0, 1), 8);
		self.angles = var_76f90141.angles;
		if(isdefined(self.owner))
		{
			self.owner dontinterpolate();
			self function_1090ca(self.owner, 0);
			wait(0.1);
			self.owner clientfield::set_to_player("" + #"hash_2b3bf178344cc787", 0);
		}
		self setbrake(0);
	}
}

/*
	Name: function_9afd667d
	Namespace: namespace_dbaeabbd
	Checksum: 0xBA4D73A2
	Offset: 0x3B38
	Size: 0x168
	Parameters: 0
	Flags: None
*/
function function_9afd667d()
{
	level endon(#"endgame");
	self endon(#"death", #"reach_goal");
	var_59af9d7a = 0;
	var_3bac3fd3 = (0, 0, 1);
	while(true)
	{
		var_553d7ca5 = anglestoup(self.angles);
		n_dot = vectordot(var_553d7ca5, var_3bac3fd3);
		if(n_dot < 0.5 && abs(self getspeed()) < 0.2)
		{
			var_59af9d7a++;
			/#
				iprintlnbold((("" + self getentnum()) + "") + var_59af9d7a);
			#/
			if(var_59af9d7a > 5)
			{
				self function_7e0ee279();
				var_59af9d7a = 0;
			}
		}
		else
		{
			var_59af9d7a = 0;
		}
		wait(0.5);
	}
}

/*
	Name: function_c07c7ebc
	Namespace: namespace_dbaeabbd
	Checksum: 0x9D0C94D1
	Offset: 0x3CA8
	Size: 0x80C
	Parameters: 1
	Flags: None
*/
function function_c07c7ebc(state)
{
	level endon(#"end_game");
	level flag::wait_till(#"start_zombie_round_logic");
	if(!isdefined(level.var_ddb70629))
	{
		level.var_ddb70629 = getent("side_quest_gp_col", "targetname");
	}
	if(!isdefined(level.var_d4d980c3))
	{
		level.var_d4d980c3 = getent("side_quest_gp_activating_volume", "targetname");
	}
	if(!isdefined(level.var_7af22cc0))
	{
		level.var_7af22cc0 = getent("side_quest_gp_hide_col", "targetname");
	}
	if(!isdefined(level.var_40c94970))
	{
		level.var_40c94970 = getentarray("side_quest_gp_hide_obj", "targetname");
	}
	if(!isdefined(level.var_78819471))
	{
		level.var_78819471 = getent("side_quest_gp_starting_col", "targetname");
	}
	if(!isdefined(level.var_c56ba975))
	{
		level.var_c56ba975 = getent("vol_side_quest_gp_fire_work_1", "targetname");
	}
	if(!isdefined(level.var_9939508d))
	{
		level.var_9939508d = getent("vol_side_quest_gp_fire_work_2", "targetname");
	}
	if(!isdefined(level.var_8c7eb718))
	{
		level.var_8c7eb718 = getent("vol_side_quest_gp_fire_work_3", "targetname");
	}
	if(state === "hide")
	{
		hidemiscmodels("side_quest_gp_guide_arrow");
		hidemiscmodels("side_quest_gp_zombies");
		hidemiscmodels("side_quest_gp_track");
		hidemiscmodels("side_quest_gp_track_2");
		hidemiscmodels("side_quest_gp_crystal");
		showmiscmodels("side_quest_gp_hide_model");
		exploder::stop_exploder("fxexp_dark_aether_interior_04");
		level.var_ddb70629 hide();
		level.var_ddb70629 notsolid();
		level.var_ddb70629 removeforcenocull();
		level.var_7af22cc0 show();
		level.var_7af22cc0 solid();
		level.var_ddb70629 setforcenocull();
		foreach(obj in level.var_40c94970)
		{
			if(isdefined(obj))
			{
				obj show();
				obj solid();
			}
		}
		level.var_78819471 hide();
		level.var_78819471 notsolid();
		level.var_78819471 removeforcenocull();
		if(isdefined(level.var_a266b15d))
		{
			level.var_a266b15d delete();
		}
		if(isdefined(level.var_ee263952))
		{
			array::delete_all(level.var_ee263952);
		}
	}
	else
	{
		showmiscmodels("side_quest_gp_guide_arrow");
		showmiscmodels("side_quest_gp_zombies");
		showmiscmodels("side_quest_gp_track");
		showmiscmodels("side_quest_gp_crystal");
		hidemiscmodels("side_quest_gp_hide_model");
		exploder::exploder("fxexp_dark_aether_interior_04");
		level.var_ddb70629 show();
		level.var_ddb70629 solid();
		level.var_ddb70629 setforcenocull();
		level.var_7af22cc0 hide();
		level.var_7af22cc0 notsolid();
		level.var_7af22cc0 removeforcenocull();
		foreach(obj in level.var_40c94970)
		{
			if(isdefined(obj))
			{
				obj hide();
				obj notsolid();
			}
		}
		level.var_78819471 show();
		level.var_78819471 solid();
		level.var_78819471 setforcenocull();
		if(!isdefined(level.var_ee263952))
		{
			var_e0a4c144 = struct::get_array("side_quest_gp_start_door", "targetname");
			level.var_ee263952 = [];
			foreach(var_26f7498 in var_e0a4c144)
			{
				mdl_door = util::spawn_model(var_26f7498.model, var_26f7498.origin, var_26f7498.angles);
				mdl_door.script_angles = var_26f7498.script_angles;
				if(!isdefined(level.var_ee263952))
				{
					level.var_ee263952 = [];
				}
				else if(!isarray(level.var_ee263952))
				{
					level.var_ee263952 = array(level.var_ee263952);
				}
				level.var_ee263952[level.var_ee263952.size] = mdl_door;
			}
		}
	}
}

/*
	Name: function_a7e59618
	Namespace: namespace_dbaeabbd
	Checksum: 0x3363D7F7
	Offset: 0x44C0
	Size: 0x1D4
	Parameters: 1
	Flags: None
*/
function function_a7e59618(var_a276c861)
{
	level endon(#"end_game");
	namespace_96b7f11d::function_994637d8(#"hash_1695615ee9fcfe29");
	level flag::wait_till_all([3:#"hash_80e313f33fdd940", 2:#"hash_e37c258d8c338d3", 1:#"hash_46ea67e0190a83ef", 0:#"start_zombie_round_logic"]);
	if(!isdefined(level.var_51d15368))
	{
		var_2551a4be = struct::get("side_quest_gp_machine_screen");
		level.var_51d15368 = util::spawn_model("tag_origin", var_2551a4be.origin, var_2551a4be.angles);
	}
	callback::on_ai_killed(&function_dccb02f);
	level.var_648bb225 = 0;
	level.var_85bdbe16 = struct::get("side_quest_gp_machine");
	level.var_ada9f1c6 = level.var_85bdbe16 zm_unitrigger::create(&function_47bc03e4, 64, &function_4b0c47c1);
	level flag::wait_till(#"hash_1f50a4230ca8934e");
}

/*
	Name: function_dccb02f
	Namespace: namespace_dbaeabbd
	Checksum: 0xE1CD07EF
	Offset: 0x46A0
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function function_dccb02f(params)
{
	if(is_true(self.var_390850ac) && (isdefined(level.var_85bdbe16) && (isdefined(level.var_51d15368) && isdefined(level.var_d4d980c3))) && !level flag::get(#"hash_7fa3d027663c32a9"))
	{
		if(self istouching(level.var_d4d980c3))
		{
			self clientfield::increment("" + #"hash_303ed2c4515453aa");
			level.var_51d15368 thread function_2d3b4eae();
		}
	}
}

/*
	Name: function_2d3b4eae
	Namespace: namespace_dbaeabbd
	Checksum: 0xA0E12F4E
	Offset: 0x4788
	Size: 0x14C
	Parameters: 0
	Flags: None
*/
function function_2d3b4eae()
{
	level endon(#"end_game", #"hash_7fa3d027663c32a9");
	self endon(#"death");
	self notify("7012406e4f68b197");
	self endon("7012406e4f68b197");
	wait(1);
	level.var_85bdbe16.var_4786038c = gettime() + (int(10 * 1000));
	self setmodel(#"hash_38bb346aa2def993");
	self playsound(#"hash_d8b240f851233e4");
	self playloopsound(#"hash_d3e38e2cdff435c");
	wait(10);
	self stoploopsound();
	self playsound(#"hash_165795b0c096d576");
	self setmodel("tag_origin");
}

/*
	Name: function_47bc03e4
	Namespace: namespace_dbaeabbd
	Checksum: 0xBE25DE5D
	Offset: 0x48E0
	Size: 0x1E8
	Parameters: 1
	Flags: None
*/
function function_47bc03e4(e_player)
{
	if(!isplayer(e_player))
	{
		return false;
	}
	namespace_edb23975::function_586afc1e(e_player);
	if(level flag::get(#"hash_7fa3d027663c32a9") && !namespace_96b7f11d::function_1fd1da2b())
	{
		self sethintstring(#"hash_184161b8e644a854");
		return true;
	}
	if(level flag::get(#"hash_7fa3d027663c32a9") && namespace_96b7f11d::function_1fd1da2b())
	{
		self sethintstring(#"hash_4ffd78f80d372e1");
		return true;
	}
	if((isdefined(self.stub.related_parent.var_4786038c) ? self.stub.related_parent.var_4786038c : 0) < gettime())
	{
		self sethintstring("");
		return false;
	}
	if((isdefined(e_player.var_a3210d75) ? e_player.var_a3210d75 : 0) > 0)
	{
		self sethintstring(#"hash_69476c1bf1ba56f");
		return true;
	}
	self sethintstring(#"hash_2ea0a815decd1e6f");
	return true;
}

/*
	Name: function_4b0c47c1
	Namespace: namespace_dbaeabbd
	Checksum: 0xBAE1EFD
	Offset: 0x4AD8
	Size: 0x180
	Parameters: 0
	Flags: None
*/
function function_4b0c47c1()
{
	level endon(#"end_game");
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = self waittill(#"trigger");
		e_player = var_be17187b.activator;
		if(zm_utility::is_player_valid(e_player))
		{
			e_player playsound(#"hash_15f62ef7540518b4");
			if(level flag::get(#"hash_7fa3d027663c32a9"))
			{
				level flag::set(#"hash_1f50a4230ca8934e");
			}
			else if(e_player namespace_edb23975::function_fac9c4ef() > 0)
			{
				e_player namespace_edb23975::function_aff8caac(-1);
				level.var_648bb225++;
				if(level.var_648bb225 >= getplayers().size)
				{
					level.var_51d15368 setmodel(#"hash_5a97ed63dc83d26f");
					level flag::set(#"hash_7fa3d027663c32a9");
				}
			}
		}
	}
}

/*
	Name: function_e37354de
	Namespace: namespace_dbaeabbd
	Checksum: 0xC4126D9E
	Offset: 0x4C60
	Size: 0x9E
	Parameters: 2
	Flags: None
*/
function function_e37354de(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_1f50a4230ca8934e");
	}
	callback::remove_on_ai_killed(&function_dccb02f);
	level.var_648bb225 = undefined;
	if(isdefined(level.var_ada9f1c6))
	{
		zm_unitrigger::unregister_unitrigger(level.var_ada9f1c6);
		level.var_ada9f1c6 = undefined;
	}
}

/*
	Name: function_882e782f
	Namespace: namespace_dbaeabbd
	Checksum: 0xCA236390
	Offset: 0x4D08
	Size: 0x294
	Parameters: 1
	Flags: None
*/
function function_882e782f(var_a276c861)
{
	level endon(#"end_game");
	level thread namespace_c097de49::function_8f85d169();
	music::setmusicstate("gp_prerace");
	level notify(#"kill_round");
	level notify(#"kill_round_wait");
	level zm_utility::function_9ad5aeb1(0, 1, 0, 0);
	level flag::clear("spawn_zombies");
	level flag::set(#"hash_1695615ee9fcfe29");
	wait(0.1);
	level.var_e3a675a4 = 0;
	level function_371733c();
	level thread function_ec243299();
	level thread function_14256a2d();
	for(var_fee08fdb = 0; var_fee08fdb < function_a1ef346b().size; var_fee08fdb++)
	{
		level waittill(#"hash_6c05810d95f9ace1");
	}
	wait(0.5);
	level thread function_c07c7ebc("show");
	level flag::set(#"hash_2f702f46336d6832");
	foreach(player in function_a1ef346b())
	{
		player clientfield::set("remote_killstreak_static", 1);
	}
	level thread function_2c55b43();
	level flag::wait_till(#"hash_55ded3d3485a9adb");
}

/*
	Name: function_ec243299
	Namespace: namespace_dbaeabbd
	Checksum: 0xD1A0583B
	Offset: 0x4FA8
	Size: 0x584
	Parameters: 0
	Flags: None
*/
function function_ec243299()
{
	level endon(#"end_game", #"hash_55ded3d3485a9adb");
	for(var_ed08d6c3 = 0; var_ed08d6c3 < function_a1ef346b().size; var_ed08d6c3++)
	{
		level waittill(#"hash_bcb136bf9afedc2");
	}
	wait(2);
	level flag::set(#"hash_31c8302c06f5b552");
	var_4646ff7c = struct::get_array("side_quest_gp_countdown_sigal_screen");
	level.var_579617db = [];
	foreach(point in var_4646ff7c)
	{
		level.var_579617db[point.script_int] = util::spawn_model("tag_origin", point.origin, point.angles);
	}
	for(var_ca3231c5 = 0; var_ca3231c5 < 3; var_ca3231c5++)
	{
		wait(1);
		level.var_579617db[var_ca3231c5] setmodel(#"hash_210abd506a527d7c");
		level.var_579617db[var_ca3231c5] playsound(#"hash_66deffc681f9570e");
	}
	wait(0.8);
	level.var_579617db[1] playsound(#"hash_7af167822c1d5b89");
	music::setmusicstate("gp_race");
	array::run_all(level.var_579617db, &setmodel, #"hash_3962b0086020f11c");
	arrayremovevalue(level.var_3ab17de8, undefined);
	if(isdefined(level.var_ee263952))
	{
		foreach(var_514900f8 in level.var_ee263952)
		{
			if(isdefined(var_514900f8.script_angles))
			{
				var_514900f8 rotateto(var_514900f8.script_angles, 1, 0, 0);
			}
		}
	}
	if(isdefined(level.var_78819471))
	{
		level.var_78819471 hide();
		level.var_78819471 notsolid();
		level.var_78819471 removeforcenocull();
	}
	array::run_all(level.var_3ab17de8, &setbrake, 0);
	level.var_4b8c551a = 300;
	level.var_7902629 = gettime();
	foreach(e_player in function_a1ef346b())
	{
		e_player thread clientfield::set_to_player("" + #"hash_1a1bf38ae538a50d", 1);
	}
	level flag::set(#"hash_3f4a32a9aa24334a");
	array::run_all(getplayers(), &setvehicledrivableendtime, (int(300 * 1000)) + gettime());
	while(level.var_4b8c551a > 0)
	{
		wait(1);
		level.var_4b8c551a = level.var_4b8c551a - 1;
	}
	level flag::set("grand_prix_time_out");
	wait(1);
	level flag::set("grand_prix_step_2_completed");
}

/*
	Name: function_371733c
	Namespace: namespace_dbaeabbd
	Checksum: 0x9B161AED
	Offset: 0x5538
	Size: 0x134
	Parameters: 0
	Flags: None
*/
function function_371733c()
{
	var_4347cdf6 = struct::get_array("side_quest_gp_spawn", "targetname");
	a_players = getplayers();
	/#
		assert(var_4347cdf6.size >= a_players.size, "");
	#/
	for(i = 0; i < a_players.size; i++)
	{
		e_player = a_players[i];
		if(!isalive(e_player))
		{
			continue;
		}
		if(e_player laststand::player_is_in_laststand())
		{
			e_player thread zm_laststand::auto_revive(e_player);
		}
		e_player thread function_d48d77f2(function_80fdd2aa(var_4347cdf6, i));
	}
	level thread function_8a2eb37();
}

/*
	Name: function_d48d77f2
	Namespace: namespace_dbaeabbd
	Checksum: 0x4EB6AAAB
	Offset: 0x5678
	Size: 0x49C
	Parameters: 1
	Flags: None
*/
function function_d48d77f2(s_point)
{
	level endon(#"end_game", #"hash_55ded3d3485a9adb");
	self endon(#"death");
	level thread namespace_96b7f11d::function_4cc5fca6();
	self clientfield::increment_to_player("" + #"hash_355304ea91d4edc8", 1);
	self thread function_c39f6bea();
	self clientfield::set("" + #"hash_1a529bb0de6717d5", 1);
	wait(7);
	while(self function_e128a831() || self function_b4813488())
	{
		waitframe(1);
	}
	level notify(#"hash_6c05810d95f9ace1");
	s_player_pos = struct::get(s_point.target, "targetname");
	self zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, s_player_pos, undefined, "grand_prix_teleport");
	e_vehicle = spawnvehicle(#"hash_4de90753a704dbad", s_point.origin, s_point.angles);
	e_vehicle setforcenocull();
	e_vehicle val::set("gp", "takedamage", 0);
	e_vehicle.targetname = "gp_car";
	e_vehicle usevehicle(self, 0);
	e_vehicle makevehicleunusable();
	e_vehicle setbrake(1);
	self clientfield::set("" + #"hash_1a529bb0de6717d5", 0);
	if(!isdefined(level.var_3ab17de8))
	{
		level.var_3ab17de8 = [];
	}
	if(!isdefined(level.var_3ab17de8))
	{
		level.var_3ab17de8 = [];
	}
	else if(!isarray(level.var_3ab17de8))
	{
		level.var_3ab17de8 = array(level.var_3ab17de8);
	}
	level.var_3ab17de8[level.var_3ab17de8.size] = e_vehicle;
	level notify(#"hash_bcb136bf9afedc2");
	self setvehicledrivableduration(int(300 * 1000));
	self setvehicledrivableendtime((int(600 * 1000)) + gettime());
	self thread util::delete_on_death(e_vehicle);
	e_vehicle function_3dd87730(self);
	e_vehicle thread function_9afd667d();
	e_vehicle thread function_3594e062(level.var_181464da.var_6d6e20de);
	e_vehicle thread function_8a1c00e5();
	e_vehicle thread function_d427fe0f();
	self thread function_b3944074(e_vehicle, level.var_181464da.var_5c62b88d);
	level.var_252ba2b0 namespace_5ac3cdbb::function_307daa91(self, 1);
	level.var_252ba2b0 namespace_5ac3cdbb::function_1870151b(self, 3);
}

/*
	Name: function_c39f6bea
	Namespace: namespace_dbaeabbd
	Checksum: 0x454B4D7B
	Offset: 0x5B20
	Size: 0xB2
	Parameters: 0
	Flags: None
*/
function function_c39f6bea()
{
	level endon(#"end_game");
	self endon(#"death", #"disconnect");
	self.var_3487fff6 = "" + #"hash_63da9d5355659678";
	self.var_1bfa91a = "_arcade";
	self playsound(#"hash_138be05e01bc166c");
	self waittill(#"hash_66790eb1100e11a2");
	self.var_3487fff6 = undefined;
	self.var_1bfa91a = undefined;
}

/*
	Name: function_39a8cd0f
	Namespace: namespace_dbaeabbd
	Checksum: 0xF2FE843F
	Offset: 0x5BE0
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_39a8cd0f()
{
	self clientfield::increment("" + #"hash_485fe8f642043f78");
	self playrumbleonentity("sr_prototype_generator_explosion");
	wait(0.5);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_1fe4ebed
	Namespace: namespace_dbaeabbd
	Checksum: 0x901CA394
	Offset: 0x5C60
	Size: 0x3F6
	Parameters: 2
	Flags: None
*/
function function_1fe4ebed(var_a276c861, var_19e802fa)
{
	if(var_a276c861 || var_19e802fa)
	{
		level flag::set(#"hash_55ded3d3485a9adb");
	}
	music::setmusicstate("");
	level thread namespace_c097de49::function_8f85d169(0);
	a_players = function_a1ef346b();
	array::run_all(a_players, &clientfield::increment_to_player, "" + #"hash_355304ea91d4edc8", 1);
	array::thread_all(a_players, &function_402055f0, 0);
	array::thread_all(a_players, &function_c39f6bea);
	wait(7);
	foreach(player in a_players)
	{
		if(isdefined(player))
		{
			if(level.var_252ba2b0 namespace_5ac3cdbb::is_open(player))
			{
				level.var_252ba2b0 namespace_5ac3cdbb::close(player);
			}
			player thread zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, {#angles:player.angles, #origin:player.origin}, undefined, "grand_prix_teleport");
		}
	}
	wait(0.5);
	level flag::set("spawn_zombies");
	level thread function_c07c7ebc("hide");
	level flag::clear(#"hash_2f702f46336d6832");
	level flag::clear(#"hash_1695615ee9fcfe29");
	foreach(player in function_a1ef346b())
	{
		player clientfield::set("remote_killstreak_static", 0);
	}
	level flag::set(#"hash_4e003b0a25eefe02");
	level.var_e3a675a4 = undefined;
	level.var_4b8c551a = undefined;
	if(isdefined(level.var_3ab17de8))
	{
		arrayremovevalue(level.var_3ab17de8, undefined);
		array::run_all(level.var_3ab17de8, &function_39a8cd0f);
		level.var_3ab17de8 = undefined;
	}
	if(isdefined(level.var_579617db))
	{
		array::delete_all(level.var_579617db);
		level.var_579617db = undefined;
	}
}

/*
	Name: function_14256a2d
	Namespace: namespace_dbaeabbd
	Checksum: 0xF3C7EDF
	Offset: 0x6060
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_14256a2d()
{
	level endon(#"end_game", #"hash_55ded3d3485a9adb");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_4847149e99d2b54");
		if(waitresult.lap === 3 && waitresult.checkpoint === 3)
		{
			level thread function_42c605b5();
			level flag::set(#"hash_7523f87901e2a190");
			break;
		}
	}
}

/*
	Name: function_42c605b5
	Namespace: namespace_dbaeabbd
	Checksum: 0xDC59ECF8
	Offset: 0x6128
	Size: 0x28C
	Parameters: 0
	Flags: None
*/
function function_42c605b5()
{
	level endon(#"end_game");
	if(!isdefined(level.var_a266b15d))
	{
		var_89e55ea4 = struct::get("side_quest_gp_jump_platform", "targetname");
		level.var_a266b15d = util::spawn_model(#"hash_464f7391e364d950", var_89e55ea4.origin, var_89e55ea4.angles);
	}
	level.var_a266b15d moveto(level.var_a266b15d.origin + vectorscale((0, 0, 1), 200), 4, 0.5, 0.5);
	wait(2);
	level clientfield::set("" + #"hash_6c40bdc03cfa78bb", 1);
	var_437e629 = struct::get("scene_jump_platform_pos", "targetname");
	var_437e629 thread scene::play("p9_fxanim_zm_tungsten_crystal_stairs_bundle", "up");
	var_437e629 waittill(#"scenes_done");
	var_437e629 thread scene::play("p9_fxanim_zm_tungsten_crystal_stairs_bundle", "play");
	level flag::wait_till(#"hash_4e003b0a25eefe02");
	var_437e629 scene::delete_scene_spawned_ents();
	var_437e629 scene::stop();
	level clientfield::set("" + #"hash_6c40bdc03cfa78bb", 0);
	level clientfield::set("" + #"hash_665b17bb90845861", 4);
	if(isdefined(level.var_a266b15d))
	{
		level.var_a266b15d delete();
	}
}

/*
	Name: function_8a1c00e5
	Namespace: namespace_dbaeabbd
	Checksum: 0xDD6CB084
	Offset: 0x63C0
	Size: 0x148
	Parameters: 0
	Flags: None
*/
function function_8a1c00e5()
{
	level endon(#"end_game");
	self endon(#"death");
	self flag::wait_till(#"reach_goal");
	if(isdefined(level.var_8c7eb718))
	{
		if(self istouching(level.var_8c7eb718))
		{
			level clientfield::set("" + #"hash_665b17bb90845861", 3);
		}
	}
	if(isdefined(self.owner))
	{
		self.owner function_402055f0(1);
	}
	self thread function_dc71582(self.owner.var_ae881231);
	if(isdefined(level.var_e3a675a4))
	{
		self thread function_89c363a(level.var_e3a675a4);
		level.var_e3a675a4++;
	}
}

/*
	Name: function_d427fe0f
	Namespace: namespace_dbaeabbd
	Checksum: 0xAC593033
	Offset: 0x6510
	Size: 0x174
	Parameters: 0
	Flags: None
*/
function function_d427fe0f()
{
	level endon(#"end_game");
	self endon(#"death");
	level flag::wait_till(#"hash_7523f87901e2a190");
	while(true)
	{
		if(isdefined(level.var_c56ba975))
		{
			if(self istouching(level.var_c56ba975))
			{
				level clientfield::set("" + #"hash_665b17bb90845861", 1);
				break;
			}
		}
		if(isdefined(level.var_9939508d))
		{
			if(self istouching(level.var_9939508d))
			{
				level clientfield::set("" + #"hash_665b17bb90845861", 2);
				break;
			}
		}
		waitframe(1);
	}
	wait(3);
	level clientfield::set("" + #"hash_665b17bb90845861", 0);
}

/*
	Name: function_dc71582
	Namespace: namespace_dbaeabbd
	Checksum: 0x6F4ED727
	Offset: 0x6690
	Size: 0x1EC
	Parameters: 1
	Flags: None
*/
function function_dc71582(reward_tier)
{
	level endon(#"end_game");
	self endon(#"death");
	switch(reward_tier)
	{
		case 3:
		{
			var_6e938f0b = 50;
			self clientfield::set("" + #"hash_6324044c00c5672d", 1);
			break;
		}
		case 2:
		{
			var_6e938f0b = 30;
			self clientfield::set("" + #"hash_6324044c00c5672d", 2);
			break;
		}
		case 1:
		{
			var_6e938f0b = 20;
			self clientfield::set("" + #"hash_6324044c00c5672d", 3);
			break;
		}
		case 0:
		{
			var_6e938f0b = 10;
			self clientfield::set("" + #"hash_6324044c00c5672d", 4);
			break;
		}
		default:
		{
			var_6e938f0b = 10;
			self clientfield::set("" + #"hash_6324044c00c5672d", 4);
			break;
		}
	}
	wait(0.8);
	self thread function_537808ec(var_6e938f0b, 1, 0.15);
}

/*
	Name: function_89c363a
	Namespace: namespace_dbaeabbd
	Checksum: 0x89A9F920
	Offset: 0x6888
	Size: 0x264
	Parameters: 1
	Flags: None
*/
function function_89c363a(var_e3a675a4)
{
	level endon(#"end_game");
	self endon(#"death");
	switch(var_e3a675a4)
	{
		case 0:
		{
			var_eaa63cf9 = 1;
			var_26c96262 = 1;
			var_1d1fc2ce = 1;
			break;
		}
		case 1:
		{
			var_eaa63cf9 = 1;
			var_1d1fc2ce = 1;
			break;
		}
		case 2:
		{
			var_26c96262 = 1;
			var_1d1fc2ce = 1;
			break;
		}
		case 3:
		{
			var_1d1fc2ce = 1;
			break;
		}
		default:
		{
			break;
		}
	}
	wait(0.8);
	if(is_true(var_1d1fc2ce))
	{
		self thread function_537808ec(10, 1, 0.15);
		self clientfield::set("" + #"hash_6324044c00c5672d", 5);
	}
	if(is_true(var_26c96262))
	{
		self thread function_537808ec(10, 2, 0.2);
		self clientfield::set("" + #"hash_6324044c00c5672d", 6);
	}
	if(is_true(var_eaa63cf9))
	{
		self thread function_537808ec(10, 3, 0.3);
		self clientfield::set("" + #"hash_6324044c00c5672d", 7);
	}
}

/*
	Name: function_537808ec
	Namespace: namespace_dbaeabbd
	Checksum: 0x5C078D18
	Offset: 0x6AF8
	Size: 0x1B8
	Parameters: 3
	Flags: None
*/
function function_537808ec(var_6e938f0b, var_e15e9f2a, var_801f8ece)
{
	level endon(#"end_game");
	self endon(#"death");
	while(var_6e938f0b > 0)
	{
		n_count = 1;
		if(var_6e938f0b > 1)
		{
			n_count = randomintrange(1, int(min(var_6e938f0b, 3)));
		}
		for(i = 0; i < n_count; i++)
		{
			if(isdefined(self.owner))
			{
				switch(var_e15e9f2a)
				{
					case 1:
					{
						level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"essence_pickup_small", #attacker:self.owner});
						break;
					}
					case 2:
					{
						self.owner sr_scrap::function_afab250a(50);
						break;
					}
					case 3:
					{
						self.owner sr_scrap::function_afab250a(10);
						break;
					}
				}
			}
			var_6e938f0b--;
		}
		wait(var_801f8ece);
	}
}

/*
	Name: function_619fdf5f
	Namespace: namespace_dbaeabbd
	Checksum: 0xEFE3D757
	Offset: 0x6CB8
	Size: 0x1AE
	Parameters: 0
	Flags: None
*/
function function_619fdf5f()
{
	level endon(#"end_game");
	level flag::wait_till(#"start_zombie_round_logic");
	level.var_91f71aa[#"hash_6a952597b6a662fb"] = &function_b087107d;
	callback::function_10a4dd0a(&item_pickup);
	var_4db66606 = struct::get_array("s_hamburger", "targetname");
	foreach(s_pos in var_4db66606)
	{
		point = function_4ba8fde(#"hash_6a952597b6a662fb");
		if(isdefined(point))
		{
			var_4f434a9b = item_drop::drop_item(0, undefined, 1, 0, point.id, s_pos.origin, s_pos.angles, 0);
			var_4f434a9b.var_dd21aec2 = 1 | 16;
			var_4f434a9b.var_a6762160.droptimeout = undefined;
		}
	}
}

/*
	Name: function_b087107d
	Namespace: namespace_dbaeabbd
	Checksum: 0x60F3B774
	Offset: 0x6E70
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function function_b087107d(item)
{
	if(self.health < self.var_66cb03ad)
	{
		return true;
	}
	return false;
}

/*
	Name: function_37f28f2b
	Namespace: namespace_dbaeabbd
	Checksum: 0xBEA6BF4
	Offset: 0x6EA8
	Size: 0x290
	Parameters: 1
	Flags: None
*/
function function_37f28f2b(var_a276c861)
{
	level endon(#"end_game");
	var_803625e6 = getentarray("e_bunny", "targetname");
	var_aebc6824 = array::random(var_803625e6);
	var_aebc6824.var_66c5aea4 = 1;
	array::thread_all(var_803625e6, &function_c9658564);
	level.var_eda01097 = arraycombine(level.var_eda01097, var_803625e6);
	level flag::wait_till(#"hash_60a7df7afef780c8");
	var_165e5cbe = struct::get("s_burger_boy_back_trigger", "targetname");
	var_165e5cbe zm_unitrigger::function_fac87205(#"hash_6b91ed772270bbfb", 32);
	var_d0426a23 = getent("burger_boy", "targetname");
	var_d0426a23.var_52babeb3 = getent("e_burger_boy_left_panel", "targetname");
	var_d0426a23.var_d2835a9f = getent("e_burger_boy_right_panel", "targetname");
	if(isdefined(var_d0426a23.var_52babeb3))
	{
		var_d0426a23.var_52babeb3 playsound(#"hash_597557b4448dfe42");
		var_d0426a23.var_52babeb3 rotateto(var_d0426a23.var_52babeb3.angles + (0, -90, -15), 3);
	}
	if(isdefined(var_d0426a23.var_d2835a9f))
	{
		var_d0426a23.var_d2835a9f rotateto(var_d0426a23.var_d2835a9f.angles + (0, 90, 15), 3);
	}
	var_d0426a23.var_d2835a9f waittill(#"rotatedone");
}

/*
	Name: function_c9658564
	Namespace: namespace_dbaeabbd
	Checksum: 0xC175F86F
	Offset: 0x7140
	Size: 0x3BC
	Parameters: 0
	Flags: None
*/
function function_c9658564()
{
	level endon(#"end_game");
	var_ca57b8dd = struct::get(self.target, "targetname");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"hash_81e93f0d0293b61");
		player = waitresult.attacker;
		damage = waitresult.damage;
		if(isplayer(player) && waitresult.mod === "MOD_EXPLOSIVE" && player namespace_e86ffa8::function_582d36be(5) && isdefined(damage) && damage >= 35)
		{
			if(is_true(self.var_66c5aea4) && isdefined(var_ca57b8dd))
			{
				point = function_4ba8fde(#"hash_2aeb24fda8b1b4f2");
				if(isdefined(point))
				{
					var_6c4a7715 = item_drop::drop_item(0, undefined, 1, 0, point.id, var_ca57b8dd.origin, var_ca57b8dd.angles, 2);
					var_6c4a7715.var_dd21aec2 = 1 | 16;
				}
				break;
			}
			else if(isdefined(var_ca57b8dd))
			{
				var_f0de9b92 = array::random([3:"fire_sale", 2:"insta_kill", 1:"nuke", 0:"full_ammo"]);
				var_24a867e4 = function_ed4a5d52(var_f0de9b92);
				var_4d0b3b87 = util::spawn_model(var_24a867e4, var_ca57b8dd.origin, var_ca57b8dd.origin.angles);
				var_2077a964 = getrandomnavpoint(var_ca57b8dd.origin, 36);
				if(isvec(var_2077a964) && isdefined(var_4d0b3b87))
				{
					n_power = length(var_2077a964 - var_ca57b8dd.origin);
					drop_time = var_4d0b3b87 zm_utility::fake_physicslaunch(var_2077a964, n_power);
					playsoundatposition(#"hash_209bab2317ec235e", var_ca57b8dd.origin);
					wait(drop_time);
					if(isdefined(var_4d0b3b87))
					{
						var_4d0b3b87 delete();
					}
					level zm_powerups::specific_powerup_drop(var_f0de9b92, var_2077a964);
					break;
				}
			}
		}
	}
	waitframe(5);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_ed4a5d52
	Namespace: namespace_dbaeabbd
	Checksum: 0x369B599B
	Offset: 0x7508
	Size: 0xDE
	Parameters: 1
	Flags: None
*/
function function_ed4a5d52(var_f0de9b92)
{
	switch(var_f0de9b92)
	{
		case "full_ammo":
		{
			var_9c0bf2db = #"p7_zm_power_up_max_ammo";
			break;
		}
		case "insta_kill":
		{
			var_9c0bf2db = #"p7_zm_power_up_insta_kill";
			break;
		}
		case "fire_sale":
		{
			var_9c0bf2db = #"p7_zm_power_up_firesale";
			break;
		}
		case "nuke":
		{
			var_9c0bf2db = #"p7_zm_power_up_nuke";
			break;
		}
		default:
		{
			break;
		}
	}
	return var_9c0bf2db;
}

/*
	Name: function_8abd620
	Namespace: namespace_dbaeabbd
	Checksum: 0xA02FF3AB
	Offset: 0x75F0
	Size: 0x26
	Parameters: 2
	Flags: None
*/
function function_8abd620(var_a276c861, var_19e802fa)
{
}

/*
	Name: function_8f75cb6a
	Namespace: namespace_dbaeabbd
	Checksum: 0x3795672D
	Offset: 0x7620
	Size: 0x39C
	Parameters: 1
	Flags: None
*/
function function_8f75cb6a(var_a276c861)
{
	level endon(#"end_game");
	var_bb9fd562 = struct::get("s_bunny_on_boy_back", "targetname");
	var_165e5cbe = struct::get("s_burger_boy_back_trigger", "targetname");
	namespace_96b7f11d::function_994637d8(#"hash_6de3a0458517d4ad");
	var_165e5cbe zm_unitrigger::create(&function_602ff019, 32, &function_df46d7ea);
	level flag::wait_till(#"hash_6de3a0458517d4ad");
	var_bb9fd562.var_af44ab5f = util::spawn_model(#"hash_7f311e8d38b7d936", var_bb9fd562.origin, var_bb9fd562.angles);
	var_bb9fd562.var_af44ab5f playsound(#"hash_638a95c1b6bb3c09");
	var_d0426a23 = getent("burger_boy", "targetname");
	if(isdefined(var_d0426a23.var_52babeb3))
	{
		var_d0426a23.var_52babeb3 playsound(#"hash_6f0ad87dc9e28766");
		var_d0426a23.var_52babeb3 rotateto(var_d0426a23.var_52babeb3.angles + (0, 90, 15), 3);
	}
	if(isdefined(var_d0426a23.var_d2835a9f))
	{
		var_d0426a23.var_d2835a9f rotateto(var_d0426a23.var_d2835a9f.angles + (0, -90, -15), 3);
	}
	wait(3);
	var_d0426a23 clientfield::set("" + #"hash_6e68f1a9f11ee7a7", 1);
	var_d0426a23 thread scene::play(#"hash_4c0867f03bae07a1", "play", var_d0426a23);
	level thread function_ef77607f();
	level flag::clear("spawn_zombies");
	level waittill(#"hash_405fb18663eebcb4");
	var_d0426a23 thread scene::stop(#"hash_4c0867f03bae07a1");
	var_d0426a23 clientfield::set("" + #"hash_6e68f1a9f11ee7a7", 0);
	level flag::clear(#"hash_6de3a0458517d4ad");
	level flag::set("spawn_zombies");
	if(isdefined(var_bb9fd562.var_af44ab5f))
	{
		var_bb9fd562.var_af44ab5f delete();
	}
}

/*
	Name: function_602ff019
	Namespace: namespace_dbaeabbd
	Checksum: 0x37BA6E32
	Offset: 0x79C8
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_602ff019(e_player)
{
	if(isplayer(e_player))
	{
		if(namespace_96b7f11d::function_1fd1da2b())
		{
			return false;
		}
		self sethintstring(#"hash_6c152e941383cb30");
		return true;
	}
	return false;
}

/*
	Name: function_df46d7ea
	Namespace: namespace_dbaeabbd
	Checksum: 0x51E089BB
	Offset: 0x7A40
	Size: 0x90
	Parameters: 0
	Flags: None
*/
function function_df46d7ea()
{
	level endon(#"end_game");
	self endon(#"death");
	while(true)
	{
		self waittill(#"trigger");
		level flag::set(#"hash_6de3a0458517d4ad");
		waitframe(1);
		zm_unitrigger::unregister_unitrigger(self.stub);
	}
}

/*
	Name: function_a7236d71
	Namespace: namespace_dbaeabbd
	Checksum: 0x33FA23ED
	Offset: 0x7AD8
	Size: 0x14A
	Parameters: 0
	Flags: None
*/
function function_a7236d71()
{
	level endon(#"end_game", #"hash_405fb18663eebcb4", #"hash_3be82500af95ce1d");
	while(true)
	{
		foreach(player in getplayers())
		{
			dis = distance2dsquared(self.origin, player.origin);
			if(isdefined(dis) && dis <= sqr(870))
			{
				player healthoverlay::end_health_regen();
				continue;
			}
			player healthoverlay::restart_player_health_regen();
		}
		wait(1);
	}
}

/*
	Name: function_ef77607f
	Namespace: namespace_dbaeabbd
	Checksum: 0x6C5101E5
	Offset: 0x7C30
	Size: 0x3CC
	Parameters: 0
	Flags: None
*/
function function_ef77607f()
{
	level endon(#"end_game", #"hash_405fb18663eebcb4");
	var_328baab5 = struct::get_array("s_portal_pos", "targetname");
	var_d0426a23 = getent("burger_boy", "targetname");
	var_d0426a23.var_57e65c03 = 0;
	var_d0426a23.mdl_dome = util::spawn_model(#"hash_5079f3c7d659ff2", var_d0426a23.origin, var_d0426a23.angles);
	var_d0426a23.mdl_dome setscale(1.7);
	var_d0426a23.mdl_dome clientfield::set("" + #"hash_46bf4cc1eea0741a", 1);
	level thread function_68a91082(var_d0426a23);
	var_d0426a23 thread function_a7236d71();
	wait(3);
	var_d0426a23 thread function_aa9da0e();
	wait(7);
	level clientfield::set("" + #"hash_112d67305f861fe", 2);
	wait(7);
	var_d0426a23 function_21e8e6c8();
	var_d0426a23 thread function_b20e6cff();
	s_portal = function_80fdd2aa(var_328baab5, 2);
	s_portal thread function_12f0e19b();
	wait(30);
	level.var_ab34de1f = 1;
	level clientfield::set("" + #"hash_112d67305f861fe", 3);
	s_portal = function_80fdd2aa(var_328baab5, 3);
	s_portal thread function_12f0e19b();
	for(m = 2; m <= 2; m++)
	{
		s_portal = function_80fdd2aa(var_328baab5, m);
		s_portal thread function_12f0e19b(1, 0, 1);
	}
	wait(20);
	for(a = 2; a <= 3; a++)
	{
		s_portal = function_80fdd2aa(var_328baab5, a);
		s_portal thread function_12f0e19b(0, 1, 3);
	}
	wait(30);
	for(n = 2; n <= 3; n++)
	{
		s_portal = function_80fdd2aa(var_328baab5, n);
		s_portal thread function_12f0e19b(1, 0, 1);
		s_portal thread function_12f0e19b(0, 1, 3);
	}
}

/*
	Name: function_68a91082
	Namespace: namespace_dbaeabbd
	Checksum: 0x86B5C475
	Offset: 0x8008
	Size: 0x188
	Parameters: 1
	Flags: None
*/
function function_68a91082(target_entity)
{
	var_a2ff5983 = struct::get_array("s_teleprt_pos", "targetname");
	foreach(player in function_a1ef346b())
	{
		dis = distance2dsquared(target_entity.origin, player.origin);
		if(isdefined(dis) && dis > (sqr(870 + 500)) && !player laststand::player_is_in_laststand())
		{
			n_index = zm_fasttravel::get_player_index(player);
			var_3193e2d9 = var_a2ff5983[n_index];
			player thread zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, var_3193e2d9, undefined, undefined, 1, 0);
		}
	}
}

/*
	Name: function_80fdd2aa
	Namespace: namespace_dbaeabbd
	Checksum: 0x8C75DF8F
	Offset: 0x8198
	Size: 0x9C
	Parameters: 2
	Flags: None
*/
function function_80fdd2aa(array, n_idx)
{
	foreach(element in array)
	{
		if(element.script_int === n_idx)
		{
			return element;
		}
	}
	return undefined;
}

/*
	Name: function_21e8e6c8
	Namespace: namespace_dbaeabbd
	Checksum: 0x463A6FF3
	Offset: 0x8240
	Size: 0x184
	Parameters: 0
	Flags: None
*/
function function_21e8e6c8()
{
	slots = namespace_85745671::function_bdb2b85b(self, self.origin, self.angles, 30, 10, undefined, 1);
	self.is_active = 1;
	self.var_b79a8ac7 = {#slots:slots, #hash_f019ea1a:1500};
	level.attackables[level.attackables.size] = self;
	self.var_6332d14f = spawn("trigger_damage", self.origin + vectorscale((0, 0, 1), 20), 0, 64, 128);
	/#
		box(self.origin + vectorscale((0, 0, 1), 20), (-32, -32, -64), (32, 32, 64), self.angles, (1, 0, 0), 1, 0, 20000);
	#/
	level thread objective_manager::start_timer(120);
	self thread function_9db81f65();
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_9db81f65
	Namespace: namespace_dbaeabbd
	Checksum: 0x7B03EFE5
	Offset: 0x83D0
	Size: 0x288
	Parameters: 0
	Flags: None
*/
function function_9db81f65()
{
	level endon(#"end_game", #"hash_405fb18663eebcb4");
	wait(0.5);
	var_f15d2e26 = 1200;
	namespace_ee206246::sndonoverride_eye_(var_f15d2e26 / 1200);
	namespace_ee206246::function_2398ab16("cleanup_objective_bar");
	while(true)
	{
		result = undefined;
		result = self.var_6332d14f waittill(#"damage");
		if(!isplayer(result.attacker))
		{
			var_f15d2e26 = var_f15d2e26 - result.amount;
			/#
				iprintlnbold(var_f15d2e26);
			#/
			self playsound(#"hash_1ddeb8af5a217a6e");
			namespace_ee206246::sndonoverride_eye_(var_f15d2e26 / 1200);
			if(var_f15d2e26 <= 0)
			{
				level flag::set(#"defend_failed");
				level notify(#"hash_3be82500af95ce1d");
				level thread function_7b92ffd7(self);
				break;
			}
			if(math::cointoss(20) && !is_true(self.var_57e65c03))
			{
				self thread function_aa9da0e();
			}
		}
	}
	playfx(#"hash_f4494f805f7d989", self gettagorigin("head_jnt"), anglestoforward(self.angles), anglestoup(self.angles));
	waitframe(5);
	if(isdefined(self.var_6332d14f))
	{
		self.var_6332d14f delete();
	}
	level notify(#"hash_405fb18663eebcb4");
}

/*
	Name: function_b20e6cff
	Namespace: namespace_dbaeabbd
	Checksum: 0xC4CF1FB0
	Offset: 0x8660
	Size: 0x120
	Parameters: 0
	Flags: None
*/
function function_b20e6cff()
{
	level endon(#"end_game", #"hash_405fb18663eebcb4");
	wait(120);
	var_53313495 = struct::get("s_reward_chest", "targetname");
	namespace_58949729::function_4ec9fc99(var_53313495, "large_chest_level_5", #"hash_39c86bb99fc237d", #"hash_473df02427c669ff", 3);
	self thread function_7c6752c8();
	var_53313495 thread util::delay(30, undefined, &function_3076a002);
	level notify(#"hash_3be82500af95ce1d");
	level thread function_7b92ffd7(self);
	level notify(#"hash_405fb18663eebcb4");
}

/*
	Name: function_3076a002
	Namespace: namespace_dbaeabbd
	Checksum: 0x36B3AC4D
	Offset: 0x8788
	Size: 0x17C
	Parameters: 0
	Flags: None
*/
function function_3076a002()
{
	self endon(#"death");
	chest = self.scriptmodel;
	trigger = self.trigger;
	if(isdefined(chest))
	{
		chest thread item_world::loop_sound("wpn_semtex_alert", 0.84);
		util::wait_network_frame(1);
	}
	wait(5);
	if(isdefined(chest))
	{
		chest scene::stop();
		playfx(#"hash_131031222bb89ea", chest.origin);
		playsoundatposition(#"hash_2f1ae087d02ed33f", chest.origin);
		chest radiusdamage(chest.origin, 128, 50, 10, undefined, "MOD_EXPLOSIVE", getweapon(#"supplydrop"));
		chest delete();
	}
	if(isdefined(trigger))
	{
		trigger delete();
	}
}

/*
	Name: function_12f0e19b
	Namespace: namespace_dbaeabbd
	Checksum: 0xD3399A98
	Offset: 0x8910
	Size: 0x25C
	Parameters: 3
	Flags: None
*/
function function_12f0e19b(var_5a2c0004, var_5359b8ff, n_spawn_count)
{
	if(!isdefined(var_5a2c0004))
	{
		var_5a2c0004 = 0;
	}
	if(!isdefined(var_5359b8ff))
	{
		var_5359b8ff = 0;
	}
	if(!isdefined(n_spawn_count))
	{
		n_spawn_count = undefined;
	}
	level endon(#"end_game", #"hash_405fb18663eebcb4");
	n_count = 0;
	wait(3);
	while(true)
	{
		if(zombie_utility::get_current_actor_count() > level.zombie_ai_limit - 1)
		{
			waitframe(1);
			continue;
		}
		if(var_5a2c0004)
		{
			ai_type = #"hash_704a090ff9fcffd0";
		}
		else
		{
			if(var_5359b8ff)
			{
				ai_type = #"hash_51edd7595ecda822";
			}
			else
			{
				ai_type = get_ai_type();
			}
		}
		if(isdefined(ai_type))
		{
			var_ac6fac3 = spawnactor(ai_type, self.origin, self.angles, "burger_boy_zombie", 1);
		}
		if(isdefined(var_ac6fac3))
		{
			var_ac6fac3.var_126d7bef = 1;
			var_ac6fac3.ignore_round_spawn_failsafe = 1;
			var_ac6fac3.b_ignore_cleanup = 1;
			var_ac6fac3.ignore_enemy_count = 1;
			var_ac6fac3.no_powerups = 1;
			var_ac6fac3 pathmode("move allowed");
			var_ac6fac3.completed_emerging_into_playable_area = 1;
			var_ac6fac3.zombie_think_done = 1;
			if(is_true(level.var_ab34de1f))
			{
				var_ac6fac3 namespace_85745671::function_9758722("sprint");
			}
			n_count++;
		}
		if(isdefined(n_spawn_count) && n_count >= n_spawn_count)
		{
			break;
		}
		wait(function_21a3a673(1, 3));
	}
	/#
		iprintlnbold("");
	#/
}

/*
	Name: get_ai_type
	Namespace: namespace_dbaeabbd
	Checksum: 0x940CA706
	Offset: 0x8B78
	Size: 0x96
	Parameters: 0
	Flags: None
*/
function get_ai_type()
{
	var_628d63d0 = randomintrange(0, 100);
	if(var_628d63d0 > 20)
	{
		ai_type = array::random(array("spawner_bo5_zombie_zm_tungsten", "spawner_bo5_zombie_zm_tungsten_omega_soldier"));
		return ai_type;
	}
	if(var_628d63d0 > 5)
	{
		return "spawner_bo5_zombie_zm_tungsten_armor_medium";
	}
	return "spawner_bo5_zombie_zm_tungsten_armor_heavy";
}

/*
	Name: function_aa9da0e
	Namespace: namespace_dbaeabbd
	Checksum: 0x91038EF1
	Offset: 0x8C18
	Size: 0x34E
	Parameters: 0
	Flags: None
*/
function function_aa9da0e()
{
	level endon(#"end_game", #"hash_405fb18663eebcb4");
	var_73a44ab8 = function_21a3a673(4, 6);
	self.var_57e65c03 = 1;
	self clientfield::set("" + #"hash_79077a9af52542c8", 1);
	for(i = 0; i <= var_73a44ab8; i++)
	{
		var_65c9209b = function_21a3a673(1, 3);
		var_3927b8fb = struct::get_array(self.target, "targetname");
		var_b449a058 = array::random(var_3927b8fb);
		traceresult = groundtrace(var_b449a058.origin + vectorscale((0, 0, 1), 50), var_b449a058.origin + (vectorscale((0, 0, -1), 100)), 0, 0);
		if(isdefined(traceresult[#"position"]))
		{
			var_9917b0be = traceresult[#"position"];
			var_9917b0be = getrandomnavpoint(var_9917b0be, 50, 15);
		}
		else
		{
			waitframe(1);
			continue;
		}
		point = function_4ba8fde(#"hash_6a952597b6a662fb");
		var_4f434a9b = item_drop::drop_item(0, undefined, 1, 0, point.id, self gettagorigin("tag_mouth"), self.angles, 0);
		var_4f434a9b.var_dd21aec2 = 1 | 16;
		var_4f434a9b.var_a6762160.droptimeout = 30;
		var_4f434a9b playsound(#"hash_3dae72c7171166b8");
		n_power = length(self gettagorigin("tag_mouth") - var_9917b0be);
		drop_time = var_4f434a9b zm_utility::fake_physicslaunch(var_9917b0be, n_power);
		self clientfield::increment("" + #"hash_4a1dfb77dccf6587", 1);
		wait(var_65c9209b);
	}
	self clientfield::set("" + #"hash_79077a9af52542c8", 0);
	self.var_57e65c03 = 0;
}

/*
	Name: function_7c6752c8
	Namespace: namespace_dbaeabbd
	Checksum: 0xFBD8F7E7
	Offset: 0x8F70
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function function_7c6752c8()
{
	var_89f315b8 = vectorscale((0, 0, 1), 102);
	v_position = (4188, 2542, -362);
	v_origin = self gettagorigin("tag_mouth");
	v_angles = self.angles;
	wait(5);
	point = function_4ba8fde(#"hash_4add6df00de2903a");
	var_772c2945 = item_drop::drop_item(0, undefined, 1, 0, point.id, v_origin, v_angles, 0);
	var_772c2945.var_dd21aec2 = 1 | 16;
	var_772c2945.var_a6762160.droptimeout = 35;
	var_772c2945 playsound(#"hash_3dae72c7171166b8");
	n_power = length((v_origin + var_89f315b8) - v_position);
	drop_time = var_772c2945 zm_utility::fake_physicslaunch(v_position, n_power);
}

/*
	Name: function_7b92ffd7
	Namespace: namespace_dbaeabbd
	Checksum: 0x82C3E303
	Offset: 0x90E8
	Size: 0x174
	Parameters: 1
	Flags: None
*/
function function_7b92ffd7(entity)
{
	namespace_85745671::function_b70e2a37(entity);
	level thread objective_manager::stop_timer();
	level clientfield::set("" + #"hash_112d67305f861fe", 0);
	entity thread function_4895e5f6();
	foreach(player in getplayers())
	{
		player healthoverlay::restart_player_health_regen();
	}
	if(isdefined(entity.mdl_dome))
	{
		entity.mdl_dome clientfield::set("" + #"hash_46bf4cc1eea0741a", 0);
		entity.mdl_dome thread util::delayed_delete(1);
	}
}

/*
	Name: function_4895e5f6
	Namespace: namespace_dbaeabbd
	Checksum: 0xF05DF43F
	Offset: 0x9268
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_4895e5f6()
{
	self clientfield::set("" + #"hash_79077a9af52542c8", 0);
	self clientfield::set("" + #"hash_3d5c2390c0768ed2", 1);
	self playsound(#"hash_1e57a07d7ae159c2");
	level thread function_e8799ac6(self);
}

/*
	Name: function_e8799ac6
	Namespace: namespace_dbaeabbd
	Checksum: 0x43107BAB
	Offset: 0x9308
	Size: 0x2DC
	Parameters: 2
	Flags: None
*/
function function_e8799ac6(entity, override_radius)
{
	if(!isdefined(override_radius))
	{
		override_radius = 1024;
	}
	var_f0bfc7a8 = override_radius;
	var_17c7dbe6 = arraysortclosest(zombie_utility::get_zombie_array(), entity.origin, undefined, 0, var_f0bfc7a8);
	foreach(var_ccea7dbf in var_17c7dbe6)
	{
		if(isalive(var_ccea7dbf))
		{
			level.zombie_total++;
			level.zombie_respawns++;
			level.zombie_total_subtract++;
			if(math::cointoss())
			{
				gibserverutils::gibhead(var_ccea7dbf);
			}
			if(math::cointoss())
			{
				if(math::cointoss())
				{
					gibserverutils::gibleftarm(var_ccea7dbf);
				}
				else
				{
					gibserverutils::gibrightarm(var_ccea7dbf);
				}
			}
			if(math::cointoss())
			{
				if(math::cointoss())
				{
					gibserverutils::gibleftleg(var_ccea7dbf);
				}
				else
				{
					gibserverutils::gibrightleg(var_ccea7dbf);
				}
			}
			n_random_x = randomfloatrange(-3, 3);
			n_random_y = randomfloatrange(-3, 3);
			v_fling = 150 * (vectornormalize((var_ccea7dbf.origin - entity.origin) + (n_random_x, n_random_y, 500)));
			var_ccea7dbf.var_d45ca662 = 1;
			var_ccea7dbf.var_98f1f37c = 1;
			var_ccea7dbf thread zm_utility::function_ffc279(v_fling, var_ccea7dbf);
		}
	}
	level thread zm_utility::function_9ad5aeb1(1, 1, 0, 0);
}

/*
	Name: function_edc7972d
	Namespace: namespace_dbaeabbd
	Checksum: 0x721DA947
	Offset: 0x95F0
	Size: 0xB8
	Parameters: 2
	Flags: None
*/
function function_edc7972d(var_a276c861, var_19e802fa)
{
	foreach(player in getplayers())
	{
		player healthoverlay::restart_player_health_regen();
	}
}

/*
	Name: item_pickup
	Namespace: namespace_dbaeabbd
	Checksum: 0xF83C9A46
	Offset: 0x96B0
	Size: 0xFA
	Parameters: 1
	Flags: None
*/
function item_pickup(params)
{
	item = params.item;
	if(isplayer(self))
	{
		if(isdefined(item.var_a6762160.name))
		{
			switch(item.var_a6762160.name)
			{
				case "hash_6a952597b6a662fb":
				{
					self thread function_965e8e5e(200);
					break;
				}
				case "hash_2aeb24fda8b1b4f2":
				{
					level flag::set(#"hash_60a7df7afef780c8");
					break;
				}
				case "hash_4add6df00de2903a":
				{
					level thread function_dc01274e();
					break;
				}
			}
		}
	}
}

/*
	Name: function_dc01274e
	Namespace: namespace_dbaeabbd
	Checksum: 0xDCC3CEE1
	Offset: 0x97B8
	Size: 0x80
	Parameters: 0
	Flags: None
*/
function function_dc01274e()
{
	level util::clientnotify("sndUnlockEESong");
	level thread zm_audio::sndmusicsystem_stopandflush();
	waitframe(1);
	level thread zm_audio::sndmusicsystem_playstate("ee_song");
	if(isdefined(level.var_da00670e))
	{
		level thread [[level.var_da00670e]]();
	}
}

/*
	Name: function_7990b88f
	Namespace: namespace_dbaeabbd
	Checksum: 0x1A414663
	Offset: 0x9840
	Size: 0x9C
	Parameters: 0
	Flags: Private
*/
function private function_7990b88f()
{
	level endon(#"end_game");
	self endon(#"death", #"player_downed");
	count = 0;
	while(count <= 60)
	{
		self.health = math::clamp(self.health + 1, 0, self.var_66cb03ad);
		count++;
		wait(1);
	}
}

/*
	Name: function_965e8e5e
	Namespace: namespace_dbaeabbd
	Checksum: 0x3B9EDFDF
	Offset: 0x98E8
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_965e8e5e(n_health)
{
	var_e873365a = self.health + n_health;
	if(var_e873365a < 0)
	{
		var_e873365a = 0;
	}
	else if(var_e873365a > self.var_66cb03ad)
	{
		var_e873365a = self.var_66cb03ad;
	}
	self.health = var_e873365a;
	self thread function_7990b88f();
}

/*
	Name: function_9a3e69a6
	Namespace: namespace_dbaeabbd
	Checksum: 0xE0D39D4B
	Offset: 0x9968
	Size: 0x2AC
	Parameters: 1
	Flags: None
*/
function function_9a3e69a6(var_a276c861)
{
	var_1391d96c = getent("vhs_tape", "targetname");
	var_f3ab12d1 = getent("e_tape_damage_proxy", "targetname");
	while(true)
	{
		waitresult = undefined;
		waitresult = var_f3ab12d1 waittill(#"damage");
		if(isplayer(waitresult.attacker) && waitresult.mod === "MOD_GRENADE" || waitresult.mod === "MOD_GRENADE_SPLASH")
		{
			break;
		}
	}
	var_73a3724e = struct::get(var_1391d96c.target, "targetname");
	if(isdefined(var_73a3724e))
	{
		var_1391d96c moveto(var_73a3724e.origin, 0.2, 0, 0);
		var_1391d96c rotateto(var_73a3724e.angles, 0.2, 0, 0);
		var_1391d96c playsound(#"hash_531ace2a44a3edf5");
	}
	wait(0.2);
	var_1391d96c zm_unitrigger::function_fac87205(#"hash_492081dc2a915c05", 70);
	playsoundatposition(#"hash_75da4e417535a408", var_1391d96c.origin);
	/#
		iprintlnbold("");
	#/
	if(isdefined(var_1391d96c))
	{
		var_1391d96c delete();
	}
	var_8263605f = getent("vhs_vcr", "targetname");
	var_8263605f zm_unitrigger::function_fac87205(#"hash_6bce8f715e409b18", 64);
	var_8263605f playsound(#"hash_124b4252b2a3a211");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_14f1a95a
	Namespace: namespace_dbaeabbd
	Checksum: 0x99CCC8B8
	Offset: 0x9C20
	Size: 0x26
	Parameters: 2
	Flags: None
*/
function function_14f1a95a(var_a276c861, var_19e802fa)
{
}

/*
	Name: function_e86d6eef
	Namespace: namespace_dbaeabbd
	Checksum: 0x6D50BE8
	Offset: 0x9C50
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_e86d6eef(var_a276c861)
{
	var_8263605f = getent("vhs_vcr", "targetname");
	s_trigger = var_8263605f zm_unitrigger::create(&function_2244edb0, 64, &function_942a2c48);
	level flag::wait_till(#"hash_25fe180b96ddb969");
	zm_unitrigger::unregister_unitrigger(s_trigger);
}

/*
	Name: function_2244edb0
	Namespace: namespace_dbaeabbd
	Checksum: 0x678C4693
	Offset: 0x9D00
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_2244edb0(e_player)
{
	if(isplayer(e_player))
	{
		if(!level flag::get_any([1:#"hash_514ccaae7a18d0fa", 0:#"hash_25fe180b96ddb969"]))
		{
			self sethintstring(#"hash_58431bdb2fd8fb05");
			return true;
		}
		return false;
	}
	return false;
}

/*
	Name: function_942a2c48
	Namespace: namespace_dbaeabbd
	Checksum: 0x24CC06E0
	Offset: 0x9DB0
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function function_942a2c48()
{
	level endon(#"end_game");
	while(true)
	{
		self waittill(#"trigger");
		level flag::set(#"hash_514ccaae7a18d0fa");
		level thread function_920c7b4b();
	}
}

/*
	Name: function_920c7b4b
	Namespace: namespace_dbaeabbd
	Checksum: 0xC1F13B46
	Offset: 0x9E30
	Size: 0x394
	Parameters: 0
	Flags: None
*/
function function_920c7b4b()
{
	level endon(#"end_game", #"hash_4fe5f8878c1357da");
	var_8263605f = getent("vhs_vcr", "targetname");
	var_8263605f playsound(#"hash_101c4836e7441e61");
	var_8263605f playloopsound(#"hash_71e903f03cdd95c7");
	level.var_ca0aefec = getentarray("television_damage_proxy", "targetname");
	level.var_d6c3dbb4 = [];
	if(isarray(level.var_ca0aefec))
	{
		level.var_d6c3dbb4[#"hash_3375f488d393fbfb"] = array::randomize(level.var_ca0aefec);
		var_6fe4d37f = array::randomize(level.var_ca0aefec);
		level.var_d6c3dbb4[#"sequence2"] = arraycombine(level.var_d6c3dbb4[#"hash_3375f488d393fbfb"], var_6fe4d37f, 1);
		var_6fe4d37f = array::randomize(level.var_ca0aefec);
		level.var_d6c3dbb4[#"sequence3"] = arraycombine(level.var_d6c3dbb4[#"sequence2"], var_6fe4d37f, 1);
	}
	function_a73a327a(2);
	wait(2);
	for(i = 1; i <= 3; i++)
	{
		level.var_1e36d56 = 0;
		function_33cf6f75(level.var_d6c3dbb4[#"sequence" + i], 0);
		wait(1);
		function_33cf6f75(level.var_d6c3dbb4[#"sequence" + i], undefined, 1);
		array::thread_all(level.var_ca0aefec, &function_7d36e498);
		level thread function_7921db45(i);
		level waittill(#"hash_70d8384a35c119f4");
		wait(1);
	}
	level thread function_a73a327a(2);
	var_8263605f playsound(#"hash_58111b194c4875e7");
	var_8263605f stoploopsound();
	/#
		iprintlnbold("");
	#/
	level flag::set(#"hash_25fe180b96ddb969");
}

/*
	Name: function_33cf6f75
	Namespace: namespace_dbaeabbd
	Checksum: 0x60B9B10F
	Offset: 0xA1D0
	Size: 0x390
	Parameters: 3
	Flags: None
*/
function function_33cf6f75(var_ca0aefec, var_fdea0c17, var_2549cdb0)
{
	if(!isdefined(var_fdea0c17))
	{
		var_fdea0c17 = undefined;
	}
	if(!isdefined(var_2549cdb0))
	{
		var_2549cdb0 = undefined;
	}
	if(is_true(var_2549cdb0))
	{
		for(i = 0; i < var_ca0aefec.size; i++)
		{
			var_d9ee8daa = struct::get(var_ca0aefec[i].target, "targetname");
			if(isdefined(var_d9ee8daa.model))
			{
				var_d9ee8daa.mdl = util::spawn_model(var_d9ee8daa.model, var_d9ee8daa.origin, var_d9ee8daa.angles);
				level thread function_c690f49d(var_d9ee8daa);
			}
			wait(1.5);
			if(isdefined(var_d9ee8daa.mdl))
			{
				var_d9ee8daa.mdl stoploopsound();
				var_d9ee8daa.mdl playsound(#"hash_66939a7693efd8db");
			}
			if(isdefined(var_d9ee8daa.mdl))
			{
				var_d9ee8daa.mdl delete();
			}
		}
	}
	else
	{
		if(is_true(var_fdea0c17))
		{
			foreach(entity in var_ca0aefec)
			{
				var_d9ee8daa = struct::get(entity.target, "targetname");
				if(isdefined(var_d9ee8daa.model) && !isdefined(var_d9ee8daa.mdl))
				{
					var_d9ee8daa.mdl = util::spawn_model(var_d9ee8daa.model, var_d9ee8daa.origin, var_d9ee8daa.angles);
					level thread function_c690f49d(var_d9ee8daa, 1);
				}
			}
		}
		else
		{
			foreach(entity in var_ca0aefec)
			{
				var_d9ee8daa = struct::get(entity.target, "targetname");
				if(isdefined(var_d9ee8daa.mdl))
				{
					var_d9ee8daa.mdl stoploopsound();
					var_d9ee8daa.mdl playsound(#"hash_66939a7693efd8db");
				}
				if(isdefined(var_d9ee8daa.mdl))
				{
					var_d9ee8daa.mdl delete();
				}
			}
		}
	}
}

/*
	Name: function_c690f49d
	Namespace: namespace_dbaeabbd
	Checksum: 0x4E8A9D02
	Offset: 0xA568
	Size: 0x14C
	Parameters: 2
	Flags: None
*/
function function_c690f49d(var_d9ee8daa, var_6f984799)
{
	if(!isdefined(var_6f984799))
	{
		var_6f984799 = 0;
	}
	str_alias = #"hash_4af7e4baa1e9ebd5";
	if(!var_6f984799)
	{
		switch(var_d9ee8daa.model)
		{
			case "hash_3ba44d5bd7f95189":
			{
				str_alias = #"hash_12dc213653f3d657";
				break;
			}
			case "hash_210abd506a527d7c":
			{
				str_alias = #"hash_2662d7b497d59042";
				break;
			}
			case "hash_3962b0086020f11c":
			{
				str_alias = #"hash_60370a4ca3a8e8c2";
				break;
			}
			case "hash_70991d20ad21c42d":
			{
				str_alias = #"hash_adc4b5656362597";
				break;
			}
		}
	}
	if(isdefined(var_d9ee8daa.mdl))
	{
		var_d9ee8daa.mdl playsound(str_alias);
		var_d9ee8daa.mdl playloopsound(#"hash_3adcb14cf7ce8ce4");
	}
}

/*
	Name: function_7d36e498
	Namespace: namespace_dbaeabbd
	Checksum: 0x1762AC89
	Offset: 0xA6C0
	Size: 0xB2
	Parameters: 0
	Flags: None
*/
function function_7d36e498()
{
	level endon(#"hash_4fe5f8878c1357da", #"end_game", #"hash_70d8384a35c119f4");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(isplayer(waitresult.attacker))
		{
			level notify(#"hash_452cf48337ae8aff", {#entity:self});
			wait(1);
		}
	}
}

/*
	Name: function_1affbba0
	Namespace: namespace_dbaeabbd
	Checksum: 0x57B8976C
	Offset: 0xA780
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_1affbba0()
{
	level endon(#"end_game");
	function_a73a327a(2);
	level flag::clear(#"hash_514ccaae7a18d0fa");
}

/*
	Name: function_7921db45
	Namespace: namespace_dbaeabbd
	Checksum: 0x51FAC337
	Offset: 0xA7E0
	Size: 0x338
	Parameters: 1
	Flags: None
*/
function function_7921db45(index)
{
	level endon(#"end_game");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_452cf48337ae8aff");
		entity = waitresult.entity;
		if(entity === (level.var_d6c3dbb4[#"sequence" + index][level.var_1e36d56]))
		{
			var_d9ee8daa = struct::get(entity.target, "targetname");
			if(!isdefined(var_d9ee8daa.mdl))
			{
				var_d9ee8daa.mdl = util::spawn_model(var_d9ee8daa.model, var_d9ee8daa.origin, var_d9ee8daa.angles);
				level thread function_c690f49d(var_d9ee8daa);
			}
			if(level.var_1e36d56 > 0 && entity != (level.var_d6c3dbb4[#"sequence" + index][level.var_1e36d56 - 1]))
			{
				var_75afea3b = level.var_d6c3dbb4[#"sequence" + index][level.var_1e36d56 - 1];
				var_26be52fa = struct::get(var_75afea3b.target, "targetname");
				if(isdefined(var_26be52fa.mdl))
				{
					var_26be52fa.mdl stoploopsound();
					var_26be52fa.mdl playsound(#"hash_66939a7693efd8db");
				}
				if(isdefined(var_26be52fa.mdl))
				{
					var_26be52fa.mdl delete();
				}
			}
			if(((level.var_d6c3dbb4[#"sequence" + index].size) - 1) === level.var_1e36d56)
			{
				level notify(#"hash_70d8384a35c119f4");
				break;
			}
			level.var_1e36d56++;
		}
		else
		{
			level thread function_1affbba0();
			waitframe(1);
			var_8263605f = getent("vhs_vcr", "targetname");
			var_8263605f playsound(#"hash_732cf9d0eaf6f9a0");
			var_8263605f stoploopsound();
			level notify(#"hash_4fe5f8878c1357da");
			break;
		}
	}
}

/*
	Name: function_a73a327a
	Namespace: namespace_dbaeabbd
	Checksum: 0x9117D26E
	Offset: 0xAB20
	Size: 0x8A
	Parameters: 1
	Flags: None
*/
function function_a73a327a(var_b05db174)
{
	level endon(#"end_game");
	for(i = 1; i <= var_b05db174; i++)
	{
		function_33cf6f75(level.var_ca0aefec, 1);
		wait(1);
		function_33cf6f75(level.var_ca0aefec, 0);
		wait(1);
	}
}

/*
	Name: function_8cf6a181
	Namespace: namespace_dbaeabbd
	Checksum: 0xD2D595FF
	Offset: 0xABB8
	Size: 0x26
	Parameters: 2
	Flags: None
*/
function function_8cf6a181(var_a276c861, var_19e802fa)
{
}

/*
	Name: function_4d5c7397
	Namespace: namespace_dbaeabbd
	Checksum: 0x56268EA2
	Offset: 0xABE8
	Size: 0x47C
	Parameters: 1
	Flags: None
*/
function function_4d5c7397(var_a276c861)
{
	callback::on_bleedout(&function_be3b6598);
	callback::on_disconnect(&function_be3b6598);
	level flag::set(#"hash_4be36d666c75b752");
	var_55c78eeb = struct::get("s_new_television", "targetname");
	var_55c78eeb.mdl = util::spawn_model(#"hash_3962b0086020f11c", var_55c78eeb.origin, var_55c78eeb.angles);
	var_55c78eeb.mdl playsound(#"hash_4af7e4baa1e9ebd5");
	var_55c78eeb.mdl playloopsound(#"hash_3adcb14cf7ce8ce4");
	var_46ae4489 = struct::get(var_55c78eeb.target, "targetname");
	level.var_72e30665 = var_46ae4489 zm_unitrigger::function_fac87205(#"hash_3f6a3a3a3ad8dd09", 32);
	var_55c78eeb.mdl setmodel(#"hash_210abd506a527d7c");
	var_55c78eeb.mdl playsound(#"hash_2662d7b497d59042");
	var_55c78eeb.mdl playloopsound(#"hash_d6ac9173e1059db");
	var_b510e160 = struct::get_array("s_little_girl", "targetname");
	level.var_6627533b = [];
	foreach(s_pos in var_b510e160)
	{
		if(isdefined(s_pos.script_int) && s_pos.script_int != 1)
		{
			if(!isdefined(level.var_6627533b))
			{
				level.var_6627533b = [];
			}
			else if(!isarray(level.var_6627533b))
			{
				level.var_6627533b = array(level.var_6627533b);
			}
			if(!isinarray(level.var_6627533b, s_pos))
			{
				level.var_6627533b[level.var_6627533b.size] = s_pos;
			}
		}
	}
	level thread function_2a0666fe(level.var_72e30665);
	level thread function_dd67f40a();
	level flag::wait_till_any([1:#"hash_2e2d9dcbebc02d13", 0:#"hash_2272df43583cd34a"]);
	/#
		iprintlnbold("");
	#/
	level flag::clear(#"hash_4be36d666c75b752");
	if(level flag::get(#"hash_2272df43583cd34a"))
	{
		if(isplayer(level.var_72e30665))
		{
			level.var_72e30665 thread function_6f4c3279();
		}
	}
}

/*
	Name: function_6f4c3279
	Namespace: namespace_dbaeabbd
	Checksum: 0x1EE1A556
	Offset: 0xB070
	Size: 0x154
	Parameters: 0
	Flags: None
*/
function function_6f4c3279()
{
	level endon(#"end_game");
	self endon(#"death", #"disconnect");
	while(is_true(self.var_b895a3ff))
	{
		wait(1);
	}
	wait(2);
	foreach(perk in level.var_b8be892e)
	{
		var_11868f5d = self namespace_791d0451::function_b852953c(perk);
		if(!isinarray(self.var_7341f980, perk))
		{
			self namespace_791d0451::function_3fecad82(var_11868f5d);
		}
	}
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_dd67f40a
	Namespace: namespace_dbaeabbd
	Checksum: 0xAA2C5B7B
	Offset: 0xB1D0
	Size: 0x1C2
	Parameters: 0
	Flags: None
*/
function function_dd67f40a()
{
	level endon(#"end_game", #"hash_2e2d9dcbebc02d13", #"hash_2272df43583cd34a");
	while(true)
	{
		var_209f99e7 = 0;
		foreach(player in getplayers())
		{
			if(is_true(player.var_b895a3ff))
			{
				if(!is_true(level.var_df6282df))
				{
					level thread function_c0151da7();
					level.var_df6282df = 1;
				}
				var_209f99e7 = 1;
				continue;
			}
			level clientfield::set("" + #"hash_1050257bf996b481", 0);
		}
		if(!var_209f99e7)
		{
			level notify(#"hash_1f239a8914b09591");
			function_212b0926(1, 1);
			level.var_df6282df = 0;
		}
		wait(1);
	}
}

/*
	Name: function_c0151da7
	Namespace: namespace_dbaeabbd
	Checksum: 0x9F37162A
	Offset: 0xB3A0
	Size: 0x112
	Parameters: 0
	Flags: None
*/
function function_c0151da7()
{
	level endon(#"end_game", #"hash_1f239a8914b09591", #"hash_2e2d9dcbebc02d13");
	level thread function_791bce0();
	for(i = 0; i < 3; i++)
	{
		function_f905bbc1(i);
		level waittill(#"hash_5d2dd6ae165f73df");
		if(i == 2)
		{
			level flag::set(#"hash_2272df43583cd34a");
			waitframe(1);
			function_212b0926(1, 0);
		}
		else
		{
			function_212b0926();
		}
		wait(1);
	}
}

/*
	Name: function_791bce0
	Namespace: namespace_dbaeabbd
	Checksum: 0x11D461B
	Offset: 0xB4C0
	Size: 0xD0
	Parameters: 0
	Flags: None
*/
function function_791bce0()
{
	level endon(#"end_game", #"hash_1f239a8914b09591", #"hash_2272df43583cd34a", #"hash_2e2d9dcbebc02d13");
	while(true)
	{
		level waittill(#"hash_764354347c05639d");
		if(isdefined(level.var_53eb5f78))
		{
			level.var_53eb5f78--;
			if(level.var_53eb5f78 == 0)
			{
				level notify(#"hash_5d2dd6ae165f73df");
				/#
					iprintlnbold("");
				#/
			}
		}
	}
}

/*
	Name: function_f905bbc1
	Namespace: namespace_dbaeabbd
	Checksum: 0xBDD8E2EB
	Offset: 0xB598
	Size: 0x2D4
	Parameters: 1
	Flags: None
*/
function function_f905bbc1(n_num)
{
	level endon(#"end_game", #"hash_1f239a8914b09591", #"hash_2e2d9dcbebc02d13");
	level.var_53eb5f78 = 3;
	var_b510e160 = struct::get_array("s_little_girl", "targetname");
	var_cdbf56b2 = function_80fdd2aa(var_b510e160, 1);
	switch(n_num)
	{
		case 0:
		{
			var_3709608a = 1;
			break;
		}
		case 1:
		{
			var_3709608a = 5;
			break;
		}
		case 2:
		{
			var_3709608a = 9;
			break;
		}
		default:
		{
			break;
		}
	}
	for(i = 1; i <= var_3709608a; i++)
	{
		var_338ebb64 = function_80fdd2aa(var_b510e160, i);
		if(!isdefined(var_338ebb64.var_a1e4509e))
		{
			var_338ebb64.var_a1e4509e = util::spawn_model(#"hash_46e513123e9c645f", var_cdbf56b2.origin, var_cdbf56b2.angles);
			var_338ebb64.var_a1e4509e.index = i;
			var_338ebb64.var_a1e4509e val::set(#"hash_4c77d3d6044fc98b", "takedamage", 1);
			var_338ebb64.var_a1e4509e thread function_7306a18a();
			if(!isdefined(level.var_e1148dd8))
			{
				level.var_e1148dd8 = [];
			}
			else if(!isarray(level.var_e1148dd8))
			{
				level.var_e1148dd8 = array(level.var_e1148dd8);
			}
			if(!isinarray(level.var_e1148dd8, var_338ebb64.var_a1e4509e))
			{
				level.var_e1148dd8[level.var_e1148dd8.size] = var_338ebb64.var_a1e4509e;
			}
		}
	}
	wait(0.5);
	level thread function_4a4eb289();
}

/*
	Name: function_4a4eb289
	Namespace: namespace_dbaeabbd
	Checksum: 0xBD04C0CC
	Offset: 0xB878
	Size: 0x26C
	Parameters: 0
	Flags: None
*/
function function_4a4eb289()
{
	level endon(#"end_game", #"hash_5d2dd6ae165f73df", #"hash_1f239a8914b09591", #"hash_2272df43583cd34a", #"hash_2e2d9dcbebc02d13");
	if(!isarray(level.var_e1148dd8))
	{
		return;
	}
	if(level.var_e1148dd8.size != 1)
	{
		while(true)
		{
			level.var_6627533b = array::randomize(level.var_6627533b);
			var_36a90c9e = 0;
			foreach(var_a1e4509e in level.var_e1148dd8)
			{
				if(!var_36a90c9e)
				{
					while(true)
					{
						var_f8f85893 = array::random(level.var_e1148dd8);
						if(level.var_65bd0e4e !== var_f8f85893)
						{
							level.var_65bd0e4e = var_f8f85893;
							var_36a90c9e = 1;
							break;
						}
						waitframe(1);
					}
				}
				var_a1e4509e thread function_c226ba4a();
			}
			level waittilltimeout(2.5, #"hash_764354347c05639d");
			function_212b0926();
			wait(1);
		}
	}
	else
	{
		level.var_65bd0e4e = level.var_e1148dd8[0];
		level.var_65bd0e4e.var_b62c64f9 = 1;
		level clientfield::set("" + #"hash_1050257bf996b481", level.var_65bd0e4e.index);
	}
}

/*
	Name: function_c226ba4a
	Namespace: namespace_dbaeabbd
	Checksum: 0x909E377
	Offset: 0xBAF0
	Size: 0x18C
	Parameters: 0
	Flags: None
*/
function function_c226ba4a()
{
	level endon(#"end_game", #"hash_5d2dd6ae165f73df", #"hash_1f239a8914b09591", #"hash_2272df43583cd34a", #"hash_2e2d9dcbebc02d13");
	if(!isdefined(self.index))
	{
		return;
	}
	var_338ebb64 = level.var_6627533b[self.index - 1];
	self clientfield::set("" + #"hash_2777a21403131281", 1);
	self moveto(var_338ebb64.origin, 0.1, 0, 0);
	self waittill(#"movedone");
	waitframe(1);
	self clientfield::set("" + #"hash_2777a21403131281", 0);
	if(self === level.var_65bd0e4e)
	{
		self.var_b62c64f9 = 1;
		waitframe(1);
		level clientfield::set("" + #"hash_1050257bf996b481", var_338ebb64.script_int);
	}
}

/*
	Name: function_212b0926
	Namespace: namespace_dbaeabbd
	Checksum: 0x1F4F09A2
	Offset: 0xBC88
	Size: 0x3AC
	Parameters: 2
	Flags: None
*/
function function_212b0926(var_8046dccf, var_a45fc89a)
{
	if(!isdefined(var_8046dccf))
	{
		var_8046dccf = 0;
	}
	if(!isdefined(var_a45fc89a))
	{
		var_a45fc89a = 0;
	}
	level endon(#"end_game", #"hash_1f239a8914b09591", #"hash_2e2d9dcbebc02d13");
	var_b510e160 = struct::get_array("s_little_girl", "targetname");
	if(!var_8046dccf)
	{
		if(isarray(level.var_e1148dd8) && level.var_e1148dd8.size != 1)
		{
			foreach(var_f9e2a3db in level.var_e1148dd8)
			{
				if(isdefined(var_f9e2a3db))
				{
					var_338ebb64 = function_80fdd2aa(var_b510e160, 1);
					if(isvec(var_338ebb64.origin))
					{
						var_f9e2a3db thread function_6e359973(var_338ebb64.origin);
					}
				}
			}
		}
	}
	else
	{
		if(!var_a45fc89a)
		{
			if(isarray(level.var_e1148dd8))
			{
				foreach(var_f9e2a3db in level.var_e1148dd8)
				{
					if(var_f9e2a3db !== level.var_65bd0e4e)
					{
						var_f9e2a3db clientfield::set("" + #"hash_2777a21403131281", 0);
						waitframe(1);
						if(isdefined(var_f9e2a3db))
						{
							var_f9e2a3db delete();
						}
					}
				}
			}
		}
		else if(isarray(level.var_e1148dd8))
		{
			foreach(var_f9e2a3db in level.var_e1148dd8)
			{
				var_f9e2a3db clientfield::set("" + #"hash_2777a21403131281", 0);
				waitframe(1);
				if(isdefined(var_f9e2a3db))
				{
					var_f9e2a3db delete();
				}
			}
			level.var_e1148dd8 = [];
		}
	}
	level clientfield::set("" + #"hash_1050257bf996b481", 0);
}

/*
	Name: function_6e359973
	Namespace: namespace_dbaeabbd
	Checksum: 0x4417ED00
	Offset: 0xC040
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function function_6e359973(v_target_pos)
{
	level endon(#"end_game");
	self endon(#"death");
	self clientfield::set("" + #"hash_2777a21403131281", 1);
	self moveto(v_target_pos, 0.5, 0, 0);
	self.var_b62c64f9 = 0;
	self waittill(#"movedone");
	waitframe(1);
	self clientfield::set("" + #"hash_2777a21403131281", 0);
}

/*
	Name: function_be3b6598
	Namespace: namespace_dbaeabbd
	Checksum: 0x818FE834
	Offset: 0xC128
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_be3b6598()
{
	self clientfield::set_to_player("" + #"hash_1c5f8a62c31e12a5", 0);
	if(self === level.var_72e30665)
	{
		level flag::set(#"hash_2e2d9dcbebc02d13");
	}
}

/*
	Name: function_7306a18a
	Namespace: namespace_dbaeabbd
	Checksum: 0xD53F8278
	Offset: 0xC190
	Size: 0x258
	Parameters: 0
	Flags: None
*/
function function_7306a18a()
{
	level endon(#"end_game", #"hash_2e2d9dcbebc02d13", #"hash_2272df43583cd34a", #"hash_1f239a8914b09591");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		player = waitresult.attacker;
		if(isplayer(player) && is_true(player.var_b895a3ff) && self === level.var_65bd0e4e && is_true(self.var_b62c64f9) || is_true(level.var_ec48a2e1))
		{
			if(isdefined(level.var_53eb5f78) && level.var_53eb5f78 <= 1)
			{
				self playsoundtoplayer(#"hash_3d7f889c68e0e3a0", player);
			}
			else
			{
				self playsoundtoplayer(#"hash_2e417766f83520aa", player);
			}
			level notify(#"hash_764354347c05639d");
			if(isarray(level.var_e1148dd8) && level.var_e1148dd8.size != 1)
			{
				self.var_b62c64f9 = 0;
			}
			if(damagefeedback::dodamagefeedback(waitresult.weapon, player))
			{
				player thread damagefeedback::update(waitresult.mod, waitresult.inflictor, undefined, waitresult.weapon, self);
			}
			/#
				iprintlnbold("");
			#/
		}
		wait(0.1);
	}
}

/*
	Name: function_2a0666fe
	Namespace: namespace_dbaeabbd
	Checksum: 0x6A709340
	Offset: 0xC3F0
	Size: 0x38E
	Parameters: 1
	Flags: None
*/
function function_2a0666fe(player)
{
	level endon(#"end_game", #"hash_2e2d9dcbebc02d13", #"hash_2272df43583cd34a");
	while(true)
	{
		if(isalive(player) && !is_true(player.var_b895a3ff))
		{
			var_3c29eed1 = function_6d122cef(player.origin);
			if(!isdefined(var_3c29eed1))
			{
				waitframe(1);
				continue;
			}
			playfx(#"hash_2a291b035fc8a73d", var_3c29eed1.origin, anglestoforward(var_3c29eed1.angles), (0, 0, 1));
			/#
				iprintlnbold("");
			#/
			level.var_a1e4509e = util::spawn_model(#"hash_46e513123e9c645f", var_3c29eed1.origin, var_3c29eed1.angles);
			level.var_a1e4509e notsolid();
			level.var_a1e4509e clientfield::set("" + #"hash_696368486685bb5c", 1);
			level.var_a1e4509e thread function_e1db8d2d(player);
			level.var_a1e4509e thread function_8857dc69();
			level waittilltimeout(20, #"hash_7f462520c4a4d2dc");
			level.var_a1e4509e clientfield::set("" + #"hash_696368486685bb5c", 0);
			playfx(#"hash_2a291b035fc8a73d", level.var_a1e4509e.origin, anglestoforward(level.var_a1e4509e.angles), (0, 0, 1));
			foreach(player in function_a1ef346b())
			{
				player clientfield::set_to_player("" + #"hash_1c5f8a62c31e12a5", 0);
			}
			waitframe(1);
			if(isdefined(level.var_a1e4509e))
			{
				level.var_a1e4509e delete();
			}
			var_c894aa01 = randomintrange(120, 240);
			wait(var_c894aa01);
		}
		wait(1);
	}
}

/*
	Name: function_8857dc69
	Namespace: namespace_dbaeabbd
	Checksum: 0xC0163E1
	Offset: 0xC788
	Size: 0x20A
	Parameters: 0
	Flags: None
*/
function function_8857dc69()
{
	level endon(#"end_game", #"hash_2e2d9dcbebc02d13", #"hash_2272df43583cd34a");
	self endon(#"death");
	while(true)
	{
		a_players = function_a1ef346b();
		if(isarray(a_players))
		{
			foreach(player in a_players)
			{
				dis = distancesquared(self.origin, player.origin);
				if(dis <= sqr(800))
				{
					player clientfield::set_to_player("" + #"hash_1c5f8a62c31e12a5", 1);
				}
				else
				{
					player clientfield::set_to_player("" + #"hash_1c5f8a62c31e12a5", 0);
				}
				if(dis <= sqr(60))
				{
					level notify(#"hash_7f462520c4a4d2dc");
					player zm_laststand::function_16c5dddd();
				}
			}
		}
		wait(1);
	}
}

/*
	Name: function_e1db8d2d
	Namespace: namespace_dbaeabbd
	Checksum: 0xBFB354B0
	Offset: 0xC9A0
	Size: 0x170
	Parameters: 1
	Flags: None
*/
function function_e1db8d2d(player)
{
	level endon(#"end_game", #"hash_2e2d9dcbebc02d13", #"hash_2272df43583cd34a");
	self endon(#"death");
	while(true)
	{
		if(isalive(player) && !is_true(player.var_b895a3ff))
		{
			dis = distance(self.origin, player.origin);
			n_time = dis / 30;
			self moveto(player.origin, n_time);
			v_face_angles = vectortoangles(player.origin - self.origin);
			self rotateto((0, v_face_angles[1], 0) + vectorscale((0, 1, 0), 90), 0.5);
		}
		wait(0.5);
	}
}

/*
	Name: function_6d122cef
	Namespace: namespace_dbaeabbd
	Checksum: 0x3C6EBAE1
	Offset: 0xCB18
	Size: 0x2F2
	Parameters: 1
	Flags: None
*/
function function_6d122cef(v_origin)
{
	level endon(#"end_game", #"hash_2e2d9dcbebc02d13", #"hash_1f239a8914b09591");
	while(true)
	{
		var_119decd6 = randomintrange(400, 600);
		new_angles = randomintrange(1, 360);
		var_e9104764 = (cos(new_angles) * var_119decd6) + v_origin[0];
		var_a3b7bcb0 = (sin(new_angles) * var_119decd6) + v_origin[1];
		new_vector = (var_e9104764, var_a3b7bcb0, v_origin[2]);
		traceresult = groundtrace(new_vector, new_vector + (vectorscale((0, 0, -1), 100)), 0, 0);
		if(isdefined(traceresult[#"position"]))
		{
			var_bf1cc8e2 = traceresult[#"position"];
		}
		spawn_loc = getclosestpointonnavmesh(var_bf1cc8e2, 100, 15);
		if(isdefined(spawn_loc))
		{
			zone = zm_zonemgr::get_zone_from_position(spawn_loc);
			/#
				if(isdefined(zone))
				{
					iprintlnbold(zone);
				}
			#/
			if(is_true(zm_zonemgr::zone_is_enabled(zone)) && is_true(level.zones[zone].is_active) && zm_utility::check_point_in_playable_area(spawn_loc))
			{
				/#
					iprintlnbold((((spawn_loc[0] + "") + spawn_loc[1]) + "") + spawn_loc[2]);
				#/
				s_spawn_loc = spawnstruct();
				s_spawn_loc.origin = spawn_loc;
				s_spawn_loc.angles = vectortoangles(v_origin - spawn_loc);
				return s_spawn_loc;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_ce6f66c8
	Namespace: namespace_dbaeabbd
	Checksum: 0xE083353A
	Offset: 0xCE18
	Size: 0x3AC
	Parameters: 2
	Flags: None
*/
function function_ce6f66c8(var_a276c861, var_19e802fa)
{
	foreach(player in getplayers())
	{
		player clientfield::set_to_player("" + #"hash_1c5f8a62c31e12a5", 0);
	}
	level clientfield::set("" + #"hash_1050257bf996b481", 0);
	callback::remove_on_disconnect(&function_be3b6598);
	callback::remove_callback(#"on_player_bleedout", &function_be3b6598);
	if(isdefined(level.var_a1e4509e))
	{
		level.var_a1e4509e delete();
	}
	var_c95c05d0 = getent("mannequin_girl_doll", "targetname");
	playfx(#"hash_116bd1b8ea044032", var_c95c05d0.origin, anglestoforward(var_c95c05d0.angles), anglestoup(var_c95c05d0.angles));
	if(level flag::get(#"hash_2e2d9dcbebc02d13"))
	{
		waitframe(1);
		function_212b0926(1, 1);
	}
	else if(isdefined(level.var_65bd0e4e) && level flag::get(#"hash_2272df43583cd34a"))
	{
		level.var_65bd0e4e clientfield::set("" + #"hash_3215084197667777", 1);
		level.var_65bd0e4e clientfield::set("" + #"hash_2777a21403131281", 0);
		level.var_65bd0e4e moveto(level.var_65bd0e4e.origin + vectorscale((0, 0, 1), 10), 3);
		level.var_65bd0e4e waittill(#"movedone");
		level.var_65bd0e4e clientfield::set("" + #"hash_3215084197667777", 0);
		waitframe(1);
		if(isdefined(level.var_65bd0e4e))
		{
			level.var_65bd0e4e delete();
		}
	}
}

/*
	Name: function_37597f29
	Namespace: namespace_dbaeabbd
	Checksum: 0xB5E5B5CA
	Offset: 0xD1D0
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_37597f29()
{
	/#
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		zm_devgui::add_custom_devgui_callback(&cmd);
	#/
}

/*
	Name: cmd
	Namespace: namespace_dbaeabbd
	Checksum: 0xFC117F22
	Offset: 0xD298
	Size: 0x42A
	Parameters: 1
	Flags: None
*/
function cmd(cmd)
{
	/#
		switch(cmd)
		{
			case "start_defend":
			{
				level thread function_ef77607f();
				break;
			}
			case "hash_247aab3abf6e12d0":
			{
				level flag::set(#"hash_60a7df7afef780c8");
				break;
			}
			case "give_reward":
			{
				foreach(player in function_a1ef346b())
				{
					foreach(perk in level.var_b8be892e)
					{
						var_11868f5d = player namespace_791d0451::function_b852953c(perk);
						if(!isinarray(player.var_7341f980, var_11868f5d))
						{
							player namespace_791d0451::function_3fecad82(var_11868f5d);
						}
					}
				}
				break;
			}
			case "hash_3a4ae233094bafaf":
			{
				level.var_ec48a2e1 = 1;
				function_212b0926(1, 1);
				var_b510e160 = struct::get_array("", "");
				level.var_6627533b = [];
				foreach(s_pos in var_b510e160)
				{
					if(isdefined(s_pos.script_int) && s_pos.script_int != 1)
					{
						if(!isdefined(level.var_6627533b))
						{
							level.var_6627533b = [];
						}
						else if(!isarray(level.var_6627533b))
						{
							level.var_6627533b = array(level.var_6627533b);
						}
						if(!isinarray(level.var_6627533b, s_pos))
						{
							level.var_6627533b[level.var_6627533b.size] = s_pos;
						}
					}
				}
				level thread function_c0151da7();
				break;
			}
			case "hash_1340b7323cd38cde":
			{
				setdvar(#"hash_4f9bc320ac30703d", 1);
				break;
			}
			case "hash_60d9b2ec2a80c5ae":
			{
				array::thread_all(level.var_3ab17de8, &function_7e0ee279);
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

