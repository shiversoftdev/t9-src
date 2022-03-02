#using script_1c65dbfc2f1c8d8f;
#using script_1cc417743d7c262d;
#using script_3411bb48d41bd3b;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_score.gsc;

#namespace namespace_dd8b9b1a;

/*
	Name: function_b951494f
	Namespace: namespace_dd8b9b1a
	Checksum: 0xC25EEE8B
	Offset: 0x310
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b951494f()
{
	level notify(925824253);
}

#namespace namespace_4faef43b;

/*
	Name: function_89f2df9
	Namespace: namespace_4faef43b
	Checksum: 0x569022D1
	Offset: 0x330
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3793eb4a6c52c66f", &__init__, undefined, undefined, undefined);
}

/*
	Name: __init__
	Namespace: namespace_4faef43b
	Checksum: 0x2B023864
	Offset: 0x378
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	clientfield::register("scriptmover", "" + #"hash_322ed89801938bb9", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_6d9aa5215e695ca2", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_1f232116f775fa91", 1, 1, "counter");
	clientfield::register("scriptmover", "" + #"hash_4719ef7fda616f3a", 1, 1, "counter");
	clientfield::function_a8bbc967("hudItems.reinforcing", 1, 1, "int", 0);
	level thread init_doors();
	level thread function_e5d01ba1();
	level.var_dd9a04c9 = 0;
	callback::on_player_killed(&on_player_killed);
}

/*
	Name: on_player_killed
	Namespace: namespace_4faef43b
	Checksum: 0xBCB36DB1
	Offset: 0x510
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function on_player_killed(var_a2f12b49)
{
	self clientfield::set_player_uimodel("hudItems.reinforcing", 0);
}

/*
	Name: function_3dfeef3b
	Namespace: namespace_4faef43b
	Checksum: 0x80981A18
	Offset: 0x548
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_3dfeef3b(reinforcing)
{
	if(!isdefined(reinforcing))
	{
		reinforcing = 0;
	}
	self clientfield::set_player_uimodel("hudItems.reinforcing", reinforcing);
}

/*
	Name: init_doors
	Namespace: namespace_4faef43b
	Checksum: 0x497E8E02
	Offset: 0x590
	Size: 0x400
	Parameters: 0
	Flags: Linked
*/
function init_doors()
{
	var_51eefac8 = array("p9_sr_barricade_01_window_01", "p9_sr_barricade_01_window_01", "p9_sr_barricade_01_window_01", "p9_sr_barricade_01_window_01_dmg_a", "p9_sr_barricade_01_window_01_dmg_a", "p9_sr_barricade_01_window_01_dmg_a", "p9_sr_barricade_01_window_01_dmg_b", "p9_sr_barricade_01_window_01_dmg_b", "p9_sr_barricade_01_window_01_dmg_b");
	var_57652081 = struct::get_array("survival_door");
	foreach(door_struct in var_57652081)
	{
		door_struct.var_a7417bea = var_51eefac8;
		door_struct.s_boards = arraygetclosest(door_struct.origin, struct::get_array("survival_door_boards"));
		use_trigger = spawn("trigger_radius_use", door_struct.origin, 0, 96, 96, 1);
		/#
			assert(isdefined(use_trigger));
		#/
		use_trigger triggerignoreteam();
		use_trigger setvisibletoall();
		use_trigger setteamfortrigger(#"none");
		use_trigger setcursorhint("HINT_NOICON");
		use_trigger sethintstring(#"hash_e0e56e669b6a886");
		use_trigger usetriggerignoreuseholdtime();
		door_model = spawn("script_model", door_struct.origin);
		/#
			assert(isdefined(door_model));
		#/
		door_model.angles = door_struct.angles;
		door_model.health = 10000000;
		door_model setcandamage(1);
		door_model setmodel("p8_wz_door_01");
		door_model.var_1c553fa4 = 1;
		door_model.damage_level = 0;
		door_model.var_27a45076 = 0;
		door_model.reinforced = 0;
		door_struct.trigger = use_trigger;
		door_struct.door = door_model;
		use_trigger.parent_struct = door_struct;
		door_model.parent_struct = door_struct;
		var_8b4e689b = spawn("trigger_radius", door_struct.origin, 0, 96, 96);
		var_8b4e689b.parent_struct = door_struct;
		var_8b4e689b thread function_6a3e8a89();
		use_trigger callback::function_a04381e0(&door_think);
		namespace_85745671::function_1ede0cd3(door_struct.target, door_struct.door, 3);
		function_be2c24a3(door_struct.target, 0);
	}
}

/*
	Name: function_6a3e8a89
	Namespace: namespace_4faef43b
	Checksum: 0xB68CCA43
	Offset: 0x998
	Size: 0x4F8
	Parameters: 0
	Flags: Linked
*/
function function_6a3e8a89()
{
	level endon(#"game_ended");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		player = waitresult.activator;
		timer_start = gettime();
		elapsed_time = 0;
		parent_struct = self.parent_struct;
		door = self.parent_struct.door;
		while(isalive(player) && player istouching(self) && player usebuttonpressed() && elapsed_time < 0.5)
		{
			elapsed_time = (float(gettime() - timer_start)) / 1000;
			progress = elapsed_time / 0.5;
			n_resource = player zm_score::function_ffc2d0bc();
			if(!isdefined(self.parent_struct.door))
			{
				var_b9fbcc94 = 0;
			}
			else
			{
				var_b9fbcc94 = 0;
			}
			if(isdefined(n_resource) && n_resource >= var_b9fbcc94 && elapsed_time > 0.1)
			{
				if(!isdefined(door) || (isdefined(door.damage_level) && door.damage_level > 0 || !is_true(door.reinforced)))
				{
					player clientfield::set_player_uimodel("hudItems.dynentUseHoldProgress", progress);
					player function_3dfeef3b(1);
					if(isdefined(self.parent_struct.trigger))
					{
						self.parent_struct.trigger sethintstring("");
					}
				}
			}
			waitframe(1);
		}
		player function_3dfeef3b(0);
		if(elapsed_time >= 0.5)
		{
			n_resource = player zm_score::function_ffc2d0bc();
			if(!isdefined(self.parent_struct.door))
			{
				var_b9fbcc94 = 0;
			}
			else
			{
				var_b9fbcc94 = 0;
			}
			if(isdefined(n_resource) && n_resource >= var_b9fbcc94)
			{
				var_c598073c = parent_struct function_55859752();
				if(var_c598073c)
				{
					player zm_score::minus_to_player_score(var_b9fbcc94);
					if(isdefined(self.parent_struct.trigger))
					{
						self.parent_struct.trigger function_dae4ab9b(0.3);
						self.parent_struct.trigger sethintstring(#"");
					}
				}
			}
		}
		else
		{
			if(!isdefined(self.parent_struct.door))
			{
				self.parent_struct.trigger sethintstring(#"hash_3d9e6b6b1984617d");
			}
			else
			{
				if(self.parent_struct.door.var_27a45076 === -1 || self.parent_struct.door.var_27a45076 === 1)
				{
					if(!is_true(self.parent_struct.door.reinforced))
					{
						self.parent_struct.trigger sethintstring(#"hash_3197c6dc91249ca2");
					}
				}
				else if(!is_true(self.parent_struct.door.reinforced))
				{
					self.parent_struct.trigger sethintstring(#"hash_e0e56e669b6a886");
				}
			}
		}
	}
}

/*
	Name: door_think
	Namespace: namespace_4faef43b
	Checksum: 0xDA1B29FB
	Offset: 0xE98
	Size: 0x4D4
	Parameters: 1
	Flags: Linked, Private
*/
function private door_think(eventstruct)
{
	player = eventstruct.activator;
	parent_struct = self.parent_struct;
	door = self.parent_struct.door;
	if(isdefined(door) && is_true(door.reinforced))
	{
		self thread function_48a16d8d(player, &door_think);
	}
	else
	{
		if(isdefined(door))
		{
			current_angles = door.angles;
			var_f6f828b2 = vectorscale((0, 1, 0), 90) + current_angles;
			var_bc7389e4 = (vectorscale((0, -1, 0), 90)) + current_angles;
			var_1be3aa53 = (vectordot(player.origin - door.origin, anglestoforward(door.angles))) > 0;
			if(door.var_27a45076 == 0 && var_1be3aa53)
			{
				door rotateto(var_f6f828b2, 0.5);
				door.var_27a45076 = 1;
				function_be2c24a3(parent_struct.target, 1);
				if(!is_true(door.reinforced))
				{
					self sethintstring(#"hash_3197c6dc91249ca2");
				}
				else
				{
					self sethintstring(#"hash_3df5eb7de3fa5e80");
				}
			}
			else
			{
				if(door.var_27a45076 == 0 && !var_1be3aa53)
				{
					door rotateto(var_bc7389e4, 0.5);
					door.var_27a45076 = -1;
					function_be2c24a3(parent_struct.target, 1);
					if(!is_true(door.reinforced))
					{
						self sethintstring(#"hash_3197c6dc91249ca2");
					}
					else
					{
						self sethintstring(#"hash_3df5eb7de3fa5e80");
					}
				}
				else
				{
					if(door.var_27a45076 == 1)
					{
						door rotateto(var_bc7389e4, 0.5);
						door.var_27a45076 = 0;
						function_be2c24a3(parent_struct.target, 0);
						if(!is_true(door.reinforced))
						{
							self sethintstring(#"hash_e0e56e669b6a886");
						}
					}
					else if(door.var_27a45076 == -1)
					{
						door rotateto(var_f6f828b2, 0.5);
						door.var_27a45076 = 0;
						function_be2c24a3(parent_struct.target, 0);
						if(!is_true(door.reinforced))
						{
							self sethintstring(#"hash_e0e56e669b6a886");
						}
					}
				}
			}
			if(door.var_27a45076 == 0)
			{
				door namespace_85745671::function_aa894590();
			}
			else
			{
				door namespace_85745671::function_a63a9610();
			}
			self thread function_be463e75(0.5, &door_think);
		}
		else
		{
			self sethintstring(#"hash_3d9e6b6b1984617d");
			self thread function_48a16d8d(player, &door_think);
		}
	}
}

/*
	Name: function_9d78f548
	Namespace: namespace_4faef43b
	Checksum: 0xB0F0B7F0
	Offset: 0x1378
	Size: 0x84
	Parameters: 1
	Flags: Event
*/
event function_9d78f548(eventstruct)
{
	parent_struct = self.parent_struct;
	if(!isdefined(parent_struct))
	{
		return;
	}
	if(parent_struct.targetname == "survival_door")
	{
		self function_ae47792b(eventstruct);
	}
	else if(parent_struct.targetname == "survival_window")
	{
		self function_994e81b7(eventstruct);
	}
}

/*
	Name: function_ae47792b
	Namespace: namespace_4faef43b
	Checksum: 0xCD01CDC
	Offset: 0x1408
	Size: 0x434
	Parameters: 1
	Flags: Linked
*/
function function_ae47792b(eventstruct)
{
	self endon(#"death", #"destroyed");
	self.health = 10000000;
	parent_struct = self.parent_struct;
	if(!is_true(self.var_1c553fa4))
	{
		return;
	}
	if(isactor(eventstruct.attacker) && (eventstruct.mod === "MOD_MELEE" || eventstruct.mod === "MOD_EXPLOSIVE"))
	{
		self.damage_level++;
		if(self.var_27a45076 === 0)
		{
			self.parent_struct.trigger sethintstring(#"hash_330249c707d8e92b");
		}
	}
	if(!isdefined(self.parent_struct.fx_org))
	{
		self.parent_struct.fx_org = spawn("script_model", self.origin);
		self.parent_struct.fx_org.angles = self.angles;
		waitframe(1);
	}
	if(self.damage_level > 8 || (!self.reinforced && self.damage_level > 4))
	{
		self.parent_struct.fx_org clientfield::increment("" + #"hash_6d9aa5215e695ca2");
		if(level flag::get("obj_defend_start") && !level flag::get("obj_defend_complete") && level.var_dd9a04c9 < 3)
		{
			level thread globallogic_audio::leader_dialog("objectiveDefendBarrierBroken");
			level.var_dd9a04c9++;
		}
		if(!self.reinforced)
		{
			self playsound(#"hash_75beb5fd873ee815");
		}
		else
		{
			self playsound(#"hash_15d3a67feb395a2a");
		}
		function_be2c24a3(self.parent_struct.target, 1);
		self.parent_struct.trigger sethintstring(#"hash_3d9e6b6b1984617d");
		waittillframeend();
		self delete();
	}
	else if(self.reinforced)
	{
		if(self.model != parent_struct.var_a7417bea[self.damage_level])
		{
			self.parent_struct.fx_org clientfield::increment("" + #"hash_322ed89801938bb9");
		}
		self playsound(#"hash_7c72cea06ae4906c");
		self setmodel(parent_struct.var_a7417bea[self.damage_level]);
		self.origin = parent_struct.s_boards.origin;
		self setscale(parent_struct.s_boards.modelscale);
		self thread function_9801cde9();
	}
}

/*
	Name: function_9801cde9
	Namespace: namespace_4faef43b
	Checksum: 0x3BD41F2A
	Offset: 0x1848
	Size: 0x36
	Parameters: 0
	Flags: Linked
*/
function function_9801cde9()
{
	self endon(#"death");
	self.var_1c553fa4 = 0;
	wait(1);
	self.var_1c553fa4 = 1;
}

/*
	Name: function_55859752
	Namespace: namespace_4faef43b
	Checksum: 0xBB533DE0
	Offset: 0x1888
	Size: 0x1E0
	Parameters: 0
	Flags: Linked
*/
function function_55859752()
{
	door = self.door;
	if(!isdefined(door))
	{
		door = spawn("script_model", self.origin);
		/#
			assert(isdefined(door));
		#/
		door.angles = self.angles;
		door.health = 10000000;
		door setcandamage(1);
		door.var_27a45076 = 0;
		self.door = door;
		door.parent_struct = self;
		function_be2c24a3(self.target, 0);
	}
	else if(door.reinforced && door.damage_level <= 0 || door.var_27a45076 != 0)
	{
		return false;
	}
	door.damage_level = 0;
	door.var_1c553fa4 = 1;
	door setmodel(self.var_a7417bea[door.damage_level]);
	door.origin = self.s_boards.origin;
	door setscale(self.s_boards.modelscale);
	door.reinforced = 1;
	namespace_85745671::function_1ede0cd3(self.target, self.door);
	door playsound(#"hash_4ef96dfa0f645331");
	return true;
}

/*
	Name: function_e5d01ba1
	Namespace: namespace_4faef43b
	Checksum: 0x612A5718
	Offset: 0x1A70
	Size: 0x290
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e5d01ba1()
{
	var_23c777e4 = array("p9_sr_barricade_01_window_01", "p9_sr_barricade_01_window_01", "p9_sr_barricade_01_window_01_dmg_a", "p9_sr_barricade_01_window_01_dmg_a", "p9_sr_barricade_01_window_01_dmg_b", "p9_sr_barricade_01_window_01_dmg_b");
	var_7f2b410c = array("p9_sr_barricade_01_window_02", "p9_sr_barricade_01_window_02", "p9_sr_barricade_01_window_02_dmg_a", "p9_sr_barricade_01_window_02_dmg_a", "p9_sr_barricade_01_window_02_dmg_b", "p9_sr_barricade_01_window_01_dmg_b");
	var_dbba5e0 = struct::get_array("survival_window");
	foreach(window_boards in var_dbba5e0)
	{
		window_boards.var_811c2d3a = undefined;
		if(window_boards.var_cd17ea88 == "window_01")
		{
			window_boards.var_811c2d3a = var_23c777e4;
		}
		else if(window_boards.var_cd17ea88 == "window_02")
		{
			window_boards.var_811c2d3a = var_7f2b410c;
		}
		var_47eecade = spawn("trigger_radius", window_boards.origin, 0, 64, 80, 1);
		/#
			assert(isdefined(var_47eecade));
		#/
		var_47eecade triggerignoreteam();
		var_47eecade setvisibletoall();
		var_47eecade usetriggerrequirelookat();
		var_47eecade setcursorhint("HINT_NOICON");
		var_47eecade sethintstring(#"hash_3766e0d30f6782ad");
		var_47eecade.window_boards = window_boards;
		window_boards.trigger = var_47eecade;
		var_47eecade.parent_struct = window_boards;
		var_47eecade thread function_51095a3d();
	}
}

/*
	Name: function_51095a3d
	Namespace: namespace_4faef43b
	Checksum: 0x32BA1878
	Offset: 0x1D08
	Size: 0x460
	Parameters: 0
	Flags: Linked, Private
*/
function private function_51095a3d()
{
	level endon(#"game_ended");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		player = waitresult.activator;
		parent_struct = self.parent_struct;
		timer_start = gettime();
		elapsed_time = 0;
		if(!isdefined(self.window_boards.window.model) || (isdefined(self.window_boards.window.damage_level) && self.window_boards.window.damage_level > 0))
		{
			while(isalive(player) && player istouching(self) && player util::is_player_looking_at(self.parent_struct.origin, 0.8) && player usebuttonpressed() && elapsed_time < 1.5)
			{
				elapsed_time = (float(gettime() - timer_start)) / 1000;
				progress = elapsed_time / 1.5;
				n_resource = player zm_score::function_ffc2d0bc();
				if(!isdefined(self.parent_struct.window))
				{
					var_b9fbcc94 = 0;
				}
				else
				{
					var_b9fbcc94 = 0;
				}
				if(isdefined(n_resource) && n_resource >= var_b9fbcc94 && elapsed_time > 0.1)
				{
					player clientfield::set_player_uimodel("hudItems.dynentUseHoldProgress", progress);
					player function_3dfeef3b(1);
					self sethintstring("");
				}
				waitframe(1);
			}
		}
		player function_3dfeef3b(0);
		if(elapsed_time >= 1.5 && player util::is_player_looking_at(self.parent_struct.origin, 0.8))
		{
			n_resource = player zm_score::function_ffc2d0bc();
			if(!isdefined(self.parent_struct.window))
			{
				var_b9fbcc94 = 0;
			}
			else
			{
				var_b9fbcc94 = 0;
			}
			if(isdefined(n_resource) && n_resource >= var_b9fbcc94)
			{
				if(isdefined(n_resource) && n_resource >= var_b9fbcc94)
				{
					var_c598073c = parent_struct function_673a485();
					if(var_c598073c)
					{
						player zm_score::minus_to_player_score(var_b9fbcc94);
						self sethintstring("");
						self.parent_struct.window notify(#"repaired");
					}
				}
			}
		}
		else
		{
			if(!isdefined(self.parent_struct.window))
			{
				self sethintstring(#"hash_3766e0d30f6782ad");
			}
			else if(isdefined(self.parent_struct.window.damage_level) && self.parent_struct.window.damage_level > 0)
			{
				self sethintstring(#"hash_7b18ee0053fc3a7b");
			}
		}
	}
}

/*
	Name: function_994e81b7
	Namespace: namespace_4faef43b
	Checksum: 0xD624D693
	Offset: 0x2170
	Size: 0x2EC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_994e81b7(eventstruct)
{
	self endon(#"death", #"destroyed");
	self.health = 10000000;
	if(!is_true(self.var_1c553fa4))
	{
		return;
	}
	if(isactor(eventstruct.attacker) && (eventstruct.mod === "MOD_MELEE" || eventstruct.mod === "MOD_EXPLOSIVE"))
	{
		self.damage_level++;
	}
	if(!isdefined(self.parent_struct.fx_org))
	{
		self.parent_struct.fx_org = spawn("script_model", self.origin);
		self.parent_struct.fx_org.angles = self.angles;
		waitframe(1);
	}
	if(self.damage_level > 5)
	{
		self.parent_struct.fx_org clientfield::increment("" + #"hash_4719ef7fda616f3a");
		self playsound(#"hash_bf0f566d836c8a2");
		self.parent_struct.trigger sethintstring(#"hash_3766e0d30f6782ad");
		waittillframeend();
		self delete();
	}
	else if(self.damage_level > 0)
	{
		if(self.model != self.parent_struct.var_811c2d3a[self.damage_level])
		{
			self.parent_struct.fx_org clientfield::increment("" + #"hash_1f232116f775fa91");
		}
		self playsound(#"hash_6d3a81cd3c4049f4");
		self setmodel(self.parent_struct.var_811c2d3a[self.damage_level]);
		self.parent_struct.trigger sethintstring(#"hash_7b18ee0053fc3a7b");
		if(!isplayer(eventstruct.attacker))
		{
			self thread function_82c85f70();
		}
	}
}

/*
	Name: function_82c85f70
	Namespace: namespace_4faef43b
	Checksum: 0x55C887E4
	Offset: 0x2468
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function function_82c85f70()
{
	self endon(#"death");
	self.var_1c553fa4 = 0;
	wait(0.5);
	self.var_1c553fa4 = 1;
}

/*
	Name: function_673a485
	Namespace: namespace_4faef43b
	Checksum: 0x73479ECE
	Offset: 0x24B0
	Size: 0x150
	Parameters: 0
	Flags: Linked
*/
function function_673a485()
{
	window = self.window;
	if(!isdefined(window))
	{
		window = spawn("script_model", self.origin);
		/#
			assert(isdefined(window));
		#/
		window.angles = self.angles;
		window.health = 10000000;
		window setcandamage(1);
		self.window = window;
		window.parent_struct = self;
	}
	else if(window.damage_level <= 0)
	{
		return false;
	}
	window.damage_level = 0;
	window.var_1c553fa4 = 1;
	window setmodel(self.var_811c2d3a[window.damage_level]);
	window playsound(#"hash_65d45ffe1b39c009");
	namespace_85745671::function_1ede0cd3(self.target, self.window);
	return true;
}

/*
	Name: function_48a16d8d
	Namespace: namespace_4faef43b
	Checksum: 0xFB2EC62B
	Offset: 0x2608
	Size: 0x5C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_48a16d8d(activator, func)
{
	level endon(#"game_ended");
	while(activator usebuttonpressed())
	{
		waitframe(1);
	}
	self callback::function_a04381e0(func);
}

/*
	Name: function_be463e75
	Namespace: namespace_4faef43b
	Checksum: 0xC4B03542
	Offset: 0x2670
	Size: 0x44
	Parameters: 2
	Flags: Linked, Private
*/
function private function_be463e75(delay, func)
{
	level endon(#"game_ended");
	wait(delay);
	self callback::function_a04381e0(func);
}

/*
	Name: function_be2c24a3
	Namespace: namespace_4faef43b
	Checksum: 0xF863DAE7
	Offset: 0x26C0
	Size: 0xCC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_be2c24a3(var_6de4a710, value)
{
	if(!isdefined(var_6de4a710))
	{
		return;
	}
	var_e86e150a = undefined;
	if(ispathnode(var_6de4a710))
	{
		var_e86e150a = var_6de4a710;
	}
	else
	{
		var_e86e150a = getnode(var_6de4a710, "targetname");
	}
	if(isdefined(var_e86e150a))
	{
		var_c88f4455 = namespace_85745671::function_5a4a952a(var_e86e150a);
		function_dc0a8e61(var_e86e150a, value);
		if(isdefined(var_c88f4455))
		{
			function_dc0a8e61(var_c88f4455, value);
		}
	}
}

