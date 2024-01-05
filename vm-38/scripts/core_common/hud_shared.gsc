#using script_6103fadfc4a82745;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace hud_shared;

/*
	Name: function_c1912477
	Namespace: hud_shared
	Checksum: 0xD666DB54
	Offset: 0x348
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c1912477()
{
	level notify(-332348023);
}

#namespace hud;

/*
	Name: function_e0a8e4ba
	Namespace: hud
	Checksum: 0x7D8776EA
	Offset: 0x368
	Size: 0x22C
	Parameters: 1
	Flags: Linked, Private, Event
*/
event private function_e0a8e4ba(struct)
{
	foreach(k in [0:"script_main_objective_src"])
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
	Name: __init__system__
	Namespace: hud
	Checksum: 0x1F198033
	Offset: 0x5A0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hud", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: hud
	Checksum: 0xCC529174
	Offset: 0x5E8
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
	level.scavenger_icon = scavenger_icon::register();
	mission flag::init("pvp_objectives_updating");
}

/*
	Name: init
	Namespace: hud
	Checksum: 0xD5151208
	Offset: 0x650
	Size: 0x2CC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	level.uiparent = spawnstruct();
	level.uiparent.horzalign = "left";
	level.uiparent.vertalign = "top";
	level.uiparent.alignx = "left";
	level.uiparent.aligny = "top";
	level.uiparent.x = 0;
	level.uiparent.y = 0;
	level.uiparent.width = 0;
	level.uiparent.height = 0;
	level.uiparent.children = [];
	level.fontheight = 12;
	level.primaryprogressbary = -61;
	level.primaryprogressbarx = 0;
	level.primaryprogressbarheight = 9;
	level.primaryprogressbarwidth = 120;
	level.primaryprogressbartexty = -75;
	level.primaryprogressbartextx = 0;
	level.primaryprogressbarfontsize = 1.4;
	if(level.splitscreen)
	{
		level.primaryprogressbarx = 20;
		level.primaryprogressbartextx = 20;
		level.primaryprogressbary = 15;
		level.primaryprogressbartexty = 0;
		level.primaryprogressbarheight = 2;
	}
	level.secondaryprogressbary = -85;
	level.secondaryprogressbarx = 0;
	level.secondaryprogressbarheight = 9;
	level.secondaryprogressbarwidth = 120;
	level.secondaryprogressbartexty = -100;
	level.secondaryprogressbartextx = 0;
	level.secondaryprogressbarfontsize = 1.4;
	if(level.splitscreen)
	{
		level.secondaryprogressbarx = 20;
		level.secondaryprogressbartextx = 20;
		level.secondaryprogressbary = 15;
		level.secondaryprogressbartexty = 0;
		level.secondaryprogressbarheight = 2;
	}
	setdvar(#"ui_generic_status_bar", 0);
}

/*
	Name: on_player_connect
	Namespace: hud
	Checksum: 0x8F0AE4A3
	Offset: 0x928
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self scavenger_hud_create();
}

/*
	Name: on_player_spawned
	Namespace: hud
	Checksum: 0x80F724D1
	Offset: 0x950
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
}

/*
	Name: fade_to_black_for_x_sec
	Namespace: hud
	Checksum: 0x33FB0C8C
	Offset: 0x960
	Size: 0x94
	Parameters: 5
	Flags: Linked
*/
function fade_to_black_for_x_sec(startwait, blackscreenwait, fadeintime, fadeouttime, shadername)
{
	self endon(#"disconnect");
	wait(startwait);
	if(!isdefined(self))
	{
		return;
	}
	self lui::screen_fade_out(fadeintime, shadername);
	wait(blackscreenwait);
	if(!isdefined(self))
	{
		return;
	}
	self lui::screen_fade_in(fadeouttime, shadername);
}

/*
	Name: screen_fade_in
	Namespace: hud
	Checksum: 0xA434D3E2
	Offset: 0xA00
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function screen_fade_in(fadeintime)
{
	self lui::screen_fade_in(fadeintime);
}

/*
	Name: scavenger_hud_create
	Namespace: hud
	Checksum: 0x3E5BB179
	Offset: 0xA30
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function scavenger_hud_create()
{
	if(!level.scavenger_icon scavenger_icon::is_open(self))
	{
		level.scavenger_icon scavenger_icon::open(self, 1);
	}
}

/*
	Name: function_4a4de0de
	Namespace: hud
	Checksum: 0xAEFE8269
	Offset: 0xA80
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_4a4de0de()
{
	if(level.scavenger_icon scavenger_icon::is_open(self))
	{
		level.scavenger_icon scavenger_icon::function_e4e9c303(self);
	}
}

/*
	Name: function_801bf40f
	Namespace: hud
	Checksum: 0xD5E2F8B9
	Offset: 0xAD0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_801bf40f()
{
	if(level.scavenger_icon scavenger_icon::is_open(self))
	{
		level.scavenger_icon scavenger_icon::function_65b281a(self);
	}
}

/*
	Name: function_8577b83e
	Namespace: hud
	Checksum: 0x2DD13A0F
	Offset: 0xB20
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_8577b83e()
{
	if(level.scavenger_icon scavenger_icon::is_open(self))
	{
		level.scavenger_icon scavenger_icon::function_47e82a09(self);
	}
}

/*
	Name: function_32de5fc7
	Namespace: hud
	Checksum: 0x29CC6990
	Offset: 0xB70
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_32de5fc7()
{
	if(level.scavenger_icon scavenger_icon::is_open(self))
	{
		level.scavenger_icon scavenger_icon::function_417df30c(self);
	}
}

/*
	Name: function_6cf4a466
	Namespace: hud
	Checksum: 0xF1B4103E
	Offset: 0xBC0
	Size: 0x128
	Parameters: 0
	Flags: Linked
*/
function function_6cf4a466()
{
	level.var_6371e281 = [];
	foreach(var_cc966c56 in array(#"axis", #"allies"))
	{
		level.var_6371e281[var_cc966c56] = {#hash_bde2b289:[], #hash_4e490ff2:[], #hash_f6fd19fc:[], #hash_ba87ac95:[]};
		level.var_6371e281[var_cc966c56] flag::init("updating");
	}
}

/*
	Name: set_team_objective
	Namespace: hud
	Checksum: 0xF717512D
	Offset: 0xCF0
	Size: 0x4AC
	Parameters: 6
	Flags: Linked
*/
function set_team_objective(var_3c9f56bd, var_cc966c56, n_obj_id, n_widget, var_48d81699, b_pvp)
{
	if(!isdefined(level.var_6371e281))
	{
		level function_6cf4a466();
	}
	var_cc966c56 = util::get_team_mapping(var_cc966c56);
	if(isstruct(var_3c9f56bd))
	{
		s_objective = var_3c9f56bd;
	}
	else
	{
		s_objective = {#s_radiant:self, #n_widget:n_widget, #n_obj_id:n_obj_id, #str_identifier:var_3c9f56bd};
	}
	var_776f69c5 = level.var_6371e281[var_cc966c56];
	str_team = level.teams[var_cc966c56];
	var_67af9061 = "hudItems.cpObjective." + str_team;
	s_radiant = s_objective.s_radiant;
	var_776f69c5 flag::wait_till_clear("updating");
	if(is_true(s_radiant.var_9578a248))
	{
		if(is_true(b_pvp))
		{
			s_radiant flag::set("pvp_objective_set_" + str_team);
		}
		return;
	}
	self function_69ae81e(var_776f69c5, var_67af9061, s_radiant, var_cc966c56);
	level function_7227b733(var_776f69c5, var_67af9061, s_objective, var_cc966c56);
	if(!isinarray(var_776f69c5.var_ba87ac95, s_objective))
	{
		level function_323820d9(s_objective, var_776f69c5);
	}
	if(!isdefined(var_48d81699))
	{
		var_48d81699 = is_true(s_radiant.var_e16ea912);
	}
	if(var_48d81699)
	{
		var_776f69c5.var_85444a6a = s_objective;
		if(var_776f69c5.var_ba87ac95[0] != s_objective)
		{
			var_776f69c5.var_ba87ac95[0].s_radiant flag::set(#"hud_pause_tracking_" + str_team);
		}
	}
	else if(isdefined(var_776f69c5.var_85444a6a) || var_776f69c5.var_ba87ac95[0] != s_objective || is_true(s_radiant.var_7ed82df7))
	{
		s_radiant flag::set(#"hud_pause_tracking_" + str_team);
		if(is_true(b_pvp))
		{
			s_radiant flag::set("pvp_objective_set_" + str_team);
		}
		return;
	}
	var_e563ad04 = var_776f69c5.var_f6fd19fc[0];
	if(isdefined(var_e563ad04) && isdefined(s_objective.n_widget))
	{
		if(var_e563ad04 == s_radiant)
		{
			s_radiant function_a0c57df5(var_cc966c56);
		}
		else
		{
			var_e563ad04 flag::set(#"hud_pause_tracking_" + str_team);
		}
	}
	if(isdefined(s_objective.n_widget))
	{
		clientfield::set_world_uimodel(var_67af9061 + ".objWidgetId", s_objective.n_widget);
		clientfield::set_world_uimodel(var_67af9061 + ".objectiveIconObjId", s_objective.n_obj_id);
	}
	if(is_true(b_pvp))
	{
		s_radiant flag::set("pvp_objective_set_" + str_team);
	}
}

/*
	Name: function_6d6eb1eb
	Namespace: hud
	Checksum: 0xF90FEDD6
	Offset: 0x11A8
	Size: 0xE8
	Parameters: 3
	Flags: Linked, Private
*/
function private function_6d6eb1eb(var_776f69c5, var_67af9061, var_cc966c56)
{
	s_objective = var_776f69c5.var_ba87ac95[0];
	s_radiant = s_objective.s_radiant;
	s_radiant function_a0c57df5(var_cc966c56);
	if(isdefined(s_objective.n_widget))
	{
		clientfield::set_world_uimodel(var_67af9061 + ".objWidgetId", s_objective.n_widget);
		clientfield::set_world_uimodel(var_67af9061 + ".objectiveIconObjId", s_objective.n_obj_id);
		if(isdefined(s_radiant.var_dc224d5b))
		{
			s_radiant thread [[s_radiant.var_dc224d5b]]();
		}
	}
}

/*
	Name: function_a0c57df5
	Namespace: hud
	Checksum: 0x249F4558
	Offset: 0x1298
	Size: 0x78
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a0c57df5(var_cc966c56)
{
	str_flag = "hud_pause_tracking_" + level.teams[var_cc966c56];
	if(self flag::get(str_flag))
	{
		self flag::clear(str_flag);
		if(isdefined(self.var_94f48890))
		{
			self thread [[self.var_94f48890]]();
		}
	}
}

/*
	Name: function_9b9f0fd8
	Namespace: hud
	Checksum: 0xDB059D0B
	Offset: 0x1318
	Size: 0x4FC
	Parameters: 5
	Flags: Linked
*/
function function_9b9f0fd8(str_identifier, var_cc966c56, b_success, e_player, b_pvp)
{
	if(!isdefined(b_success))
	{
		b_success = 1;
	}
	if(!isdefined(level.var_6371e281))
	{
		return;
	}
	if(!is_true(self.var_7e41993e))
	{
		self.var_9578a248 = 1;
	}
	var_cc966c56 = util::get_team_mapping(var_cc966c56);
	var_776f69c5 = level.var_6371e281[var_cc966c56];
	var_67af9061 = "hudItems.cpObjective." + level.teams[var_cc966c56];
	if(b_success)
	{
		str_winning_team = var_cc966c56;
		n_state = 1;
	}
	else
	{
		if(is_true(b_pvp))
		{
			str_winning_team = util::get_enemy_team(var_cc966c56);
		}
		else
		{
			str_winning_team = #"none";
		}
		n_state = 2;
	}
	s_objective = function_751f0d79(str_identifier, var_776f69c5);
	if(!isdefined(s_objective))
	{
		if(var_776f69c5.var_f6fd19fc.size)
		{
			self thread function_e5ae6379(str_winning_team, 0);
		}
		return;
	}
	var_776f69c5 flag::set("updating");
	wait(0.75);
	if(isdefined(s_objective.s_radiant.var_b6340ad0) && is_true(s_objective.s_radiant.var_b6340ad0[var_cc966c56]))
	{
		clientfield::set_world_uimodel(var_67af9061 + ".progressType", 0);
		s_objective.s_radiant.var_b6340ad0[var_cc966c56] = undefined;
	}
	if(var_776f69c5.var_f6fd19fc.size)
	{
		s_objective.s_radiant thread function_e5ae6379(str_winning_team, 0);
	}
	if(isdefined(self.m_str_objective))
	{
		if(!isdefined(world.var_82105eb4))
		{
			world.var_82105eb4 = [];
		}
		if(!isdefined(world.var_82105eb4[var_cc966c56]))
		{
			world.var_82105eb4[var_cc966c56] = [];
		}
		if(!isdefined(world.var_82105eb4[var_cc966c56][self.m_str_objective]))
		{
			world.var_82105eb4[var_cc966c56][self.m_str_objective] = n_state;
		}
	}
	if(isdefined(s_objective.var_c85f05da))
	{
		if(s_objective.var_c85f05da <= 3)
		{
			clientfield::set_world_uimodel(((var_67af9061 + ".teamSubObjective") + s_objective.var_c85f05da) + ".state", n_state);
		}
		s_objective.var_a15c87b0 = n_state;
	}
	if(isdefined(e_player))
	{
		a_e_players = array(e_player);
	}
	else
	{
		a_e_players = getplayers(var_cc966c56);
	}
	s_objective function_a192bfac(a_e_players, var_cc966c56, n_state);
	wait(5);
	var_268f9951 = 0;
	if(var_776f69c5.var_85444a6a === s_objective)
	{
		var_268f9951 = 1;
		var_776f69c5.var_85444a6a = undefined;
	}
	else
	{
		var_268f9951 = var_776f69c5.var_ba87ac95[0] === s_objective;
	}
	if(isdefined(s_objective.var_c85f05da))
	{
		level function_faab2ef9(var_776f69c5, var_67af9061, s_objective, getplayers(var_cc966c56));
	}
	arrayremovevalue(var_776f69c5.var_ba87ac95, s_objective, 0);
	if(var_268f9951)
	{
		if(var_776f69c5.var_ba87ac95.size && !is_true(var_776f69c5.var_ba87ac95[0].var_7ed82df7))
		{
			level function_6d6eb1eb(var_776f69c5, var_67af9061, var_cc966c56);
		}
		else
		{
			clientfield::set_world_uimodel(var_67af9061 + ".objWidgetId", 0);
		}
	}
	var_776f69c5 flag::clear("updating");
}

/*
	Name: function_323820d9
	Namespace: hud
	Checksum: 0xADD291A2
	Offset: 0x1820
	Size: 0x230
	Parameters: 2
	Flags: Linked, Private
*/
function private function_323820d9(var_fd92dd8f, var_776f69c5)
{
	s_radiant = var_fd92dd8f.s_radiant;
	if(!is_true(s_radiant.var_7ed82df7))
	{
		var_24955a61 = var_776f69c5.var_f6fd19fc.size && (!isinarray(var_776f69c5.var_f6fd19fc, s_radiant) || is_true(s_radiant.var_4b2ab62));
		foreach(s_objective in var_776f69c5.var_ba87ac95)
		{
			if(var_24955a61 && isinarray(var_776f69c5.var_f6fd19fc, s_objective.s_radiant))
			{
				break;
				continue;
			}
			if(is_true(s_objective.s_radiant.var_7ed82df7))
			{
				break;
			}
		}
		if(isdefined(n_index))
		{
			arrayinsert(var_776f69c5.var_ba87ac95, var_fd92dd8f, n_index);
			return;
		}
	}
	if(!isdefined(var_776f69c5.var_ba87ac95))
	{
		var_776f69c5.var_ba87ac95 = [];
	}
	else if(!isarray(var_776f69c5.var_ba87ac95))
	{
		var_776f69c5.var_ba87ac95 = array(var_776f69c5.var_ba87ac95);
	}
	if(!isinarray(var_776f69c5.var_ba87ac95, var_fd92dd8f))
	{
		var_776f69c5.var_ba87ac95[var_776f69c5.var_ba87ac95.size] = var_fd92dd8f;
	}
}

/*
	Name: function_751f0d79
	Namespace: hud
	Checksum: 0x21DF2362
	Offset: 0x1A58
	Size: 0xA0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_751f0d79(str_identifier, var_776f69c5)
{
	foreach(s_objective in var_776f69c5.var_ba87ac95)
	{
		if(s_objective.str_identifier == str_identifier)
		{
			return s_objective;
		}
	}
	return undefined;
}

/*
	Name: function_69ae81e
	Namespace: hud
	Checksum: 0xCF32ED68
	Offset: 0x1B00
	Size: 0x2AC
	Parameters: 4
	Flags: Linked
*/
function function_69ae81e(var_776f69c5, var_67af9061, s_radiant, var_cc966c56)
{
	if(!isdefined(var_776f69c5))
	{
		if(!isdefined(level.var_6371e281))
		{
			level function_6cf4a466();
		}
		var_cc966c56 = util::get_team_mapping(self.script_team);
		var_776f69c5 = level.var_6371e281[var_cc966c56];
		var_67af9061 = "hudItems.cpObjective." + level.teams[var_cc966c56];
		s_radiant = self;
	}
	if(!isdefined(s_radiant.var_e563ad04))
	{
		if(isdefined(s_radiant.var_88293629))
		{
			var_e563ad04 = struct::get(s_radiant.var_88293629, "script_main_objective_src");
			var_e563ad04 function_6b2e2adf();
		}
		else if(isdefined(s_radiant.var_4310a44e))
		{
			s_radiant.var_e563ad04 = s_radiant;
		}
	}
	var_e563ad04 = (isdefined(s_radiant.var_e563ad04) ? s_radiant.var_e563ad04 : s_radiant);
	if(isinarray(var_776f69c5.var_f6fd19fc, var_e563ad04))
	{
		return;
	}
	if(is_true(var_e563ad04.var_a3417ee3))
	{
		return;
	}
	if(var_e563ad04 != self)
	{
		var_e563ad04.var_a067b105 = self;
	}
	if(is_true(var_e563ad04.var_4b2ab62))
	{
		arrayinsert(var_776f69c5.var_f6fd19fc, var_e563ad04, 0);
	}
	else
	{
		if(!isdefined(var_776f69c5.var_f6fd19fc))
		{
			var_776f69c5.var_f6fd19fc = [];
		}
		else if(!isarray(var_776f69c5.var_f6fd19fc))
		{
			var_776f69c5.var_f6fd19fc = array(var_776f69c5.var_f6fd19fc);
		}
		var_776f69c5.var_f6fd19fc[var_776f69c5.var_f6fd19fc.size] = var_e563ad04;
	}
	if(!isdefined(var_e563ad04.var_4310a44e))
	{
		var_e563ad04.var_46c5ff67 = 1;
	}
	if(var_e563ad04 == var_776f69c5.var_f6fd19fc[0])
	{
		level thread function_da72e57e(var_776f69c5, var_67af9061, var_cc966c56);
	}
}

/*
	Name: function_da72e57e
	Namespace: hud
	Checksum: 0x233747FA
	Offset: 0x1DB8
	Size: 0x3A8
	Parameters: 3
	Flags: Linked, Private
*/
function private function_da72e57e(var_776f69c5, var_67af9061, var_cc966c56)
{
	var_e563ad04 = var_776f69c5.var_f6fd19fc[0];
	if(!isdefined(var_e563ad04.var_f84d27e3))
	{
		var_e563ad04.var_f84d27e3 = gameobjects::get_next_obj_id();
		if(isdefined(var_e563ad04.var_4310a44e))
		{
			var_e563ad04.str_objective_name = var_e563ad04.var_4310a44e;
			str_objective = var_e563ad04.var_4310a44e;
			if(!isdefined(var_e563ad04.var_4e490ff2))
			{
				var_e563ad04.var_4e490ff2 = [];
			}
			else if(!isarray(var_e563ad04.var_4e490ff2))
			{
				var_e563ad04.var_4e490ff2 = array(var_e563ad04.var_4e490ff2);
			}
			if(!isinarray(var_e563ad04.var_4e490ff2, var_e563ad04))
			{
				var_e563ad04.var_4e490ff2[var_e563ad04.var_4e490ff2.size] = var_e563ad04;
			}
		}
		else
		{
			str_objective = var_e563ad04 [[var_e563ad04.var_2f9eb5c3]]();
		}
		if(isdefined(str_objective))
		{
			objective_add(var_e563ad04.var_f84d27e3, "invisible", var_e563ad04.origin, str_objective);
			var_ac7d7a76 = var_e563ad04 [[var_e563ad04.var_1e7ed591]]();
			if(isdefined(var_ac7d7a76))
			{
				objective_setteam(var_e563ad04.var_f84d27e3, var_ac7d7a76);
			}
			if(isdefined(var_e563ad04.var_8fcc64e7))
			{
				var_e563ad04 thread [[var_e563ad04.var_8fcc64e7]]();
			}
		}
	}
	if((clientfield::get_world_uimodel(var_67af9061 + ".activeObjective.objId")) != var_e563ad04.var_f84d27e3)
	{
		clientfield::set_world_uimodel(var_67af9061 + ".activeObjective.objId", var_e563ad04.var_f84d27e3);
		clientfield::set_world_uimodel(var_67af9061 + ".activeObjective.state", 0);
		wait(1);
		var_e563ad04.var_53ea10a7[var_cc966c56] = 1;
		if(is_true(var_e563ad04.var_4df20a3b))
		{
			var_776f69c5.var_d201303e = 1;
		}
		if(is_true(var_e563ad04.var_3093fd62) || var_e563ad04.script_team === #"any")
		{
			level function_21ad06d5(1, var_cc966c56);
		}
		foreach(var_b60373bf in arraycopy(var_776f69c5.var_bde2b289))
		{
			if(var_b60373bf function_11a980cd(var_cc966c56, var_776f69c5))
			{
				arrayremovevalue(var_776f69c5.var_bde2b289, var_b60373bf, 0);
				level function_24ce2fd1(var_776f69c5, var_b60373bf, var_67af9061, var_cc966c56);
			}
		}
	}
}

/*
	Name: function_e5ae6379
	Namespace: hud
	Checksum: 0x1708B33
	Offset: 0x2168
	Size: 0x71A
	Parameters: 2
	Flags: Linked
*/
function function_e5ae6379(var_ea5acf75, var_f30c60cd)
{
	if(!isdefined(var_ea5acf75))
	{
		var_ea5acf75 = #"none";
	}
	if(!isdefined(var_f30c60cd))
	{
		var_f30c60cd = 1;
	}
	if(!isdefined(level.var_6371e281))
	{
		level function_6cf4a466();
	}
	var_ea5acf75 = util::get_team_mapping(var_ea5acf75);
	if(isdefined(self.var_e563ad04))
	{
		var_e563ad04 = self.var_e563ad04;
	}
	else
	{
		if(isdefined(self.var_4e490ff2))
		{
			var_e563ad04 = self;
		}
		else
		{
			foreach(var_776f69c5 in level.var_6371e281)
			{
				if(isinarray(var_776f69c5.var_f6fd19fc, self))
				{
					var_e563ad04 = self;
					break;
				}
			}
		}
	}
	if(!isdefined(var_e563ad04))
	{
		if(isdefined(self.script_main_objective_src))
		{
			self.script_main_objective_src = undefined;
		}
		else if(isdefined(self.var_88293629))
		{
			self.var_88293629 = undefined;
		}
		return;
	}
	b_clear = 0;
	if(var_e563ad04 == self && !isdefined(var_e563ad04.var_4310a44e))
	{
		b_clear = 1;
	}
	else if(isdefined(var_e563ad04.var_4e490ff2) && var_e563ad04.var_4e490ff2.size)
	{
		arrayremovevalue(var_e563ad04.var_4e490ff2, self, 0);
		if(!var_e563ad04.var_4e490ff2.size)
		{
			var_e563ad04.var_4e490ff2 = undefined;
			if(isdefined(var_e563ad04.var_4310a44e))
			{
				b_clear = 1;
			}
		}
	}
	if(self == var_e563ad04)
	{
		self.var_ea5acf75 = var_ea5acf75;
	}
	var_5ebfaa95 = [];
	if(b_clear)
	{
		if(is_true(var_e563ad04.var_852d1dbb))
		{
			var_e563ad04 function_e16f5c1b();
		}
		else
		{
			wait(2.25);
		}
		foreach(var_cc966c56 in array(#"axis", #"allies"))
		{
			var_776f69c5 = level.var_6371e281[var_cc966c56];
			if(isinarray(var_776f69c5.var_f6fd19fc, var_e563ad04))
			{
				if(var_776f69c5.var_f6fd19fc[0] == var_e563ad04)
				{
					if(!isdefined(var_5ebfaa95))
					{
						var_5ebfaa95 = [];
					}
					else if(!isarray(var_5ebfaa95))
					{
						var_5ebfaa95 = array(var_5ebfaa95);
					}
					var_5ebfaa95[var_5ebfaa95.size] = var_cc966c56;
					var_67af9061 = "hudItems.cpObjective." + level.teams[var_cc966c56];
					if(var_ea5acf75 == var_cc966c56 || (var_ea5acf75 == #"none" && var_f30c60cd))
					{
						n_state = 1;
					}
					else
					{
						n_state = 2;
					}
					if(isdefined(var_e563ad04.str_objective_name))
					{
						if(!isdefined(world.var_82105eb4))
						{
							world.var_82105eb4 = [];
						}
						if(!isdefined(world.var_82105eb4[var_cc966c56]))
						{
							world.var_82105eb4[var_cc966c56] = [];
						}
						if(!isdefined(world.var_82105eb4[var_cc966c56][var_e563ad04.str_objective_name]))
						{
							world.var_82105eb4[var_cc966c56][var_e563ad04.str_objective_name] = n_state;
						}
					}
					clientfield::set_world_uimodel(var_67af9061 + ".activeObjective.state", n_state);
					level function_7d2a6070(var_776f69c5, var_67af9061, var_cc966c56, var_e563ad04);
					continue;
				}
				arrayremovevalue(var_776f69c5.var_f6fd19fc, var_e563ad04, 0);
			}
		}
	}
	if(var_5ebfaa95.size)
	{
		wait(5);
		foreach(var_cc966c56 in var_5ebfaa95)
		{
			var_776f69c5 = level.var_6371e281[var_cc966c56];
			var_67af9061 = "hudItems.cpObjective." + level.teams[var_cc966c56];
			clientfield::set_world_uimodel(var_67af9061 + ".activeObjective.objId", 0);
			clientfield::set_world_uimodel(var_67af9061 + ".activeObjective.state", 0);
			if(isdefined(var_e563ad04.var_f84d27e3))
			{
				gameobjects::release_obj_id(var_e563ad04.var_f84d27e3);
				var_e563ad04.var_f84d27e3 = undefined;
			}
			arrayremovevalue(var_776f69c5.var_f6fd19fc, var_e563ad04, 0);
			if(is_true(var_e563ad04.var_3093fd62) || var_e563ad04.script_team === #"any")
			{
				level function_21ad06d5(0, var_cc966c56);
			}
			level function_4a151e92(var_776f69c5, var_67af9061, var_cc966c56, var_e563ad04);
			if(var_776f69c5.var_f6fd19fc.size)
			{
				level thread function_da72e57e(var_776f69c5, var_67af9061, var_cc966c56);
			}
		}
		var_e563ad04.var_53ea10a7 = undefined;
	}
}

/*
	Name: function_6b2e2adf
	Namespace: hud
	Checksum: 0x4F67E6B
	Offset: 0x2890
	Size: 0xBE
	Parameters: 0
	Flags: Linked
*/
function function_6b2e2adf()
{
	if(!isdefined(self.var_4e490ff2))
	{
		self.var_4e490ff2 = self namespace_2e6206f9::get_target_structs("script_main_objective");
		foreach(var_b60373bf in arraycopy(self.var_4e490ff2))
		{
			var_b60373bf.var_e563ad04 = self;
		}
	}
}

/*
	Name: function_e16f5c1b
	Namespace: hud
	Checksum: 0x5AE8CE6D
	Offset: 0x2958
	Size: 0x140
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e16f5c1b()
{
	var_ea5acf75 = self.var_ea5acf75;
	if(var_ea5acf75 == #"allies" && isdefined(self.var_49b9fc91))
	{
		var_2d3a83aa = self.var_49b9fc91;
		if(isdefined(self.var_c082bba2))
		{
			var_733d0d81 = self.var_c082bba2;
		}
		else
		{
			var_733d0d81 = self.var_49b9fc91;
		}
	}
	else
	{
		if(var_ea5acf75 == #"axis" && isdefined(self.var_50023bc7))
		{
			var_2d3a83aa = self.var_50023bc7;
			if(isdefined(self.var_eaadc829))
			{
				var_733d0d81 = self.var_eaadc829;
			}
			else
			{
				var_733d0d81 = self.var_50023bc7;
			}
		}
		else
		{
			level notify(#"hash_3a83767fc316ef21");
			return;
		}
	}
	level thread objective_result(var_ea5acf75, var_2d3a83aa, var_733d0d81);
	wait(5);
	function_ba453727();
	level notify(#"hash_3a83767fc316ef21");
}

/*
	Name: function_7d2a6070
	Namespace: hud
	Checksum: 0x77CBC1D9
	Offset: 0x2AA0
	Size: 0x282
	Parameters: 4
	Flags: Linked, Private
*/
function private function_7d2a6070(var_776f69c5, var_67af9061, var_cc966c56, var_e563ad04)
{
	foreach(e_player in getplayers(var_cc966c56))
	{
		if(isdefined(e_player.var_4e490ff2))
		{
			foreach(var_b60373bf in e_player.var_4e490ff2)
			{
				if(isdefined(e_player.var_3a93e1f9) && isinarray(e_player.var_3a93e1f9, var_b60373bf))
				{
					continue;
				}
				if(function_4ea80779(var_b60373bf, var_e563ad04))
				{
					var_c85f05da = var_b60373bf.var_75659ce3[e_player getentitynumber()];
					if(isdefined(var_c85f05da) && var_c85f05da <= 3)
					{
						e_player clientfield::set_player_uimodel(("hudItems.cpObjective.perPlayer.subObjective" + var_c85f05da) + ".state", 2);
					}
					if(isinarray(var_776f69c5.var_4e490ff2, var_b60373bf) && var_b60373bf.var_a15c87b0 !== 0)
					{
						if(isdefined(var_b60373bf.var_c85f05da))
						{
							if(var_b60373bf.var_c85f05da <= 3)
							{
								clientfield::set_world_uimodel(((var_67af9061 + ".teamSubObjective") + var_b60373bf.var_c85f05da) + ".state", 2);
							}
							var_b60373bf.var_a15c87b0 = 2;
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_4a151e92
	Namespace: hud
	Checksum: 0x39BD09C7
	Offset: 0x2D30
	Size: 0x2B8
	Parameters: 4
	Flags: Linked, Private
*/
function private function_4a151e92(var_776f69c5, var_67af9061, var_cc966c56, var_e563ad04)
{
	a_e_players = getplayers(var_cc966c56);
	var_b6a0b95a = [];
	foreach(e_player in a_e_players)
	{
		if(isdefined(e_player.var_4e490ff2))
		{
			foreach(var_b60373bf in e_player.var_4e490ff2)
			{
				if(isdefined(e_player.var_3a93e1f9) && isinarray(e_player.var_3a93e1f9, var_b60373bf))
				{
					continue;
				}
				if(function_4ea80779(var_b60373bf, var_e563ad04))
				{
					if(isinarray(var_776f69c5.var_4e490ff2, var_b60373bf))
					{
						if(!isdefined(var_b6a0b95a))
						{
							var_b6a0b95a = [];
						}
						else if(!isarray(var_b6a0b95a))
						{
							var_b6a0b95a = array(var_b6a0b95a);
						}
						if(!isinarray(var_b6a0b95a, var_b60373bf))
						{
							var_b6a0b95a[var_b6a0b95a.size] = var_b60373bf;
						}
						continue;
					}
					e_player function_cbf3f034(var_b60373bf);
				}
			}
		}
	}
	foreach(var_366f2726 in var_b6a0b95a)
	{
		level function_faab2ef9(var_776f69c5, var_67af9061, var_366f2726, a_e_players);
	}
}

/*
	Name: function_4ea80779
	Namespace: hud
	Checksum: 0x95D32E5C
	Offset: 0x2FF0
	Size: 0x64
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4ea80779(var_b60373bf, var_e563ad04)
{
	if(!isdefined(var_b60373bf.var_e563ad04))
	{
		if(is_true(var_b60373bf.var_b1f5cba2))
		{
			return true;
		}
	}
	else if(var_b60373bf.var_e563ad04 == var_e563ad04)
	{
		return true;
	}
	return false;
}

/*
	Name: function_7227b733
	Namespace: hud
	Checksum: 0x3D81CA96
	Offset: 0x3060
	Size: 0x158
	Parameters: 5
	Flags: Linked, Private
*/
function private function_7227b733(var_776f69c5, var_67af9061, s_objective, var_cc966c56, e_player)
{
	if(isdefined(s_objective.s_radiant))
	{
		var_ac1d69cd = s_objective.s_radiant;
	}
	else
	{
		var_ac1d69cd = s_objective;
	}
	if(is_true(var_ac1d69cd.var_46c5ff67))
	{
		return;
	}
	if(var_ac1d69cd function_11a980cd(var_cc966c56, var_776f69c5))
	{
		level function_24ce2fd1(var_776f69c5, s_objective, var_67af9061, var_cc966c56, e_player);
	}
	else
	{
		if(!isdefined(var_776f69c5.var_bde2b289))
		{
			var_776f69c5.var_bde2b289 = [];
		}
		else if(!isarray(var_776f69c5.var_bde2b289))
		{
			var_776f69c5.var_bde2b289 = array(var_776f69c5.var_bde2b289);
		}
		if(!isinarray(var_776f69c5.var_bde2b289, s_objective))
		{
			var_776f69c5.var_bde2b289[var_776f69c5.var_bde2b289.size] = s_objective;
		}
	}
}

/*
	Name: function_11a980cd
	Namespace: hud
	Checksum: 0xC151FE29
	Offset: 0x31C0
	Size: 0x11A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_11a980cd(var_cc966c56, var_776f69c5)
{
	if(var_776f69c5.var_f6fd19fc.size == 0)
	{
		return 0;
	}
	if(isdefined(self.var_e563ad04))
	{
		return self.var_e563ad04 == var_776f69c5.var_f6fd19fc[0] && isdefined(self.var_e563ad04.var_53ea10a7) && is_true(self.var_e563ad04.var_53ea10a7[var_cc966c56]);
	}
	if(isdefined(self.s_radiant))
	{
		s_radiant = self.s_radiant;
		return s_radiant.var_e563ad04 == var_776f69c5.var_f6fd19fc[0] && isdefined(s_radiant.var_e563ad04.var_53ea10a7) && is_true(s_radiant.var_e563ad04.var_53ea10a7[var_cc966c56]);
	}
	return 1;
}

/*
	Name: function_24ce2fd1
	Namespace: hud
	Checksum: 0xD3AA3F9E
	Offset: 0x32E8
	Size: 0x18C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_24ce2fd1(var_776f69c5, s_objective, var_67af9061, var_cc966c56, e_player)
{
	if(!isdefined(var_776f69c5.var_4e490ff2))
	{
		var_776f69c5.var_4e490ff2 = [];
	}
	else if(!isarray(var_776f69c5.var_4e490ff2))
	{
		var_776f69c5.var_4e490ff2 = array(var_776f69c5.var_4e490ff2);
	}
	if(!isinarray(var_776f69c5.var_4e490ff2, s_objective))
	{
		var_776f69c5.var_4e490ff2[var_776f69c5.var_4e490ff2.size] = s_objective;
	}
	var_c85f05da = getlastarraykey(var_776f69c5.var_4e490ff2) + 1;
	s_objective.var_c85f05da = var_c85f05da;
	s_objective.var_a15c87b0 = 0;
	if(var_c85f05da <= 3)
	{
		var_67af9061 = (var_67af9061 + ".teamSubObjective") + var_c85f05da;
		clientfield::set_world_uimodel(var_67af9061 + ".objId", s_objective.n_obj_id);
		clientfield::set_world_uimodel(var_67af9061 + ".state", 0);
	}
	s_objective function_f71931ab(e_player, var_cc966c56);
}

/*
	Name: function_faab2ef9
	Namespace: hud
	Checksum: 0x28A55E35
	Offset: 0x3480
	Size: 0x276
	Parameters: 4
	Flags: Linked, Private
*/
function private function_faab2ef9(var_776f69c5, var_67af9061, s_objective, a_e_players)
{
	if(isinarray(var_776f69c5.var_bde2b289, s_objective))
	{
		arrayremovevalue(var_776f69c5.var_bde2b289, s_objective, 0);
		s_objective.b_clearing = undefined;
		return;
	}
	arrayremovevalue(var_776f69c5.var_4e490ff2, s_objective, 0);
	for(i = 0; i < 3; i++)
	{
		var_c85f05da = i + 1;
		var_b60373bf = var_776f69c5.var_4e490ff2[i];
		var_3e690886 = (var_67af9061 + ".teamSubObjective") + var_c85f05da;
		if(isdefined(var_b60373bf))
		{
			if(var_b60373bf.var_c85f05da != var_c85f05da)
			{
				clientfield::set_world_uimodel(var_3e690886 + ".objId", var_b60373bf.n_obj_id);
				clientfield::set_world_uimodel(var_3e690886 + ".state", var_b60373bf.var_a15c87b0);
				var_b60373bf.var_c85f05da = var_c85f05da;
			}
			continue;
		}
		if((clientfield::get_world_uimodel(var_3e690886 + ".objId")) != 0)
		{
			clientfield::set_world_uimodel(var_3e690886 + ".objId", 0);
			clientfield::set_world_uimodel(var_3e690886 + ".state", 0);
		}
	}
	foreach(e_player in a_e_players)
	{
		e_player function_cbf3f034(s_objective);
	}
	s_objective.var_c85f05da = undefined;
	s_objective.b_clearing = undefined;
}

/*
	Name: function_f71931ab
	Namespace: hud
	Checksum: 0xFE04D287
	Offset: 0x3700
	Size: 0x228
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f71931ab(e_player, var_cc966c56)
{
	if(isdefined(e_player))
	{
		a_e_players = array(e_player);
	}
	else
	{
		a_e_players = getplayers(var_cc966c56);
	}
	var_67af9061 = "hudItems.cpObjective.perPlayer.subObjective";
	foreach(e_player in a_e_players)
	{
		if(!isdefined(e_player.var_4e490ff2))
		{
			e_player.var_4e490ff2 = [];
		}
		else if(!isarray(e_player.var_4e490ff2))
		{
			e_player.var_4e490ff2 = array(e_player.var_4e490ff2);
		}
		if(!isinarray(e_player.var_4e490ff2, self))
		{
			e_player.var_4e490ff2[e_player.var_4e490ff2.size] = self;
		}
		var_c85f05da = getlastarraykey(e_player.var_4e490ff2) + 1;
		if(!isdefined(self.var_75659ce3))
		{
			self.var_75659ce3 = [];
		}
		self.var_75659ce3[e_player getentitynumber()] = var_c85f05da;
		if(var_c85f05da <= 3)
		{
			e_player clientfield::set_player_uimodel((var_67af9061 + var_c85f05da) + ".objId", self.n_obj_id);
			e_player clientfield::set_player_uimodel((var_67af9061 + var_c85f05da) + ".state", 0);
		}
	}
}

/*
	Name: function_a192bfac
	Namespace: hud
	Checksum: 0xBAC0564F
	Offset: 0x3930
	Size: 0x194
	Parameters: 3
	Flags: Linked, Private
*/
function private function_a192bfac(a_e_players, var_cc966c56, n_state)
{
	if(isdefined(self.var_75659ce3))
	{
		foreach(e_player in var_cc966c56)
		{
			var_c85f05da = self.var_75659ce3[e_player getentitynumber()];
			if(isdefined(var_c85f05da) && var_c85f05da <= 3)
			{
				e_player clientfield::set_player_uimodel(("hudItems.cpObjective.perPlayer.subObjective" + var_c85f05da) + ".state", n_state);
				if(!isdefined(e_player.var_3a93e1f9))
				{
					e_player.var_3a93e1f9 = [];
				}
				else if(!isarray(e_player.var_3a93e1f9))
				{
					e_player.var_3a93e1f9 = array(e_player.var_3a93e1f9);
				}
				if(!isinarray(e_player.var_3a93e1f9, self))
				{
					e_player.var_3a93e1f9[e_player.var_3a93e1f9.size] = self;
				}
			}
		}
	}
}

/*
	Name: function_cbf3f034
	Namespace: hud
	Checksum: 0x6FFA2A73
	Offset: 0x3AD0
	Size: 0x264
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cbf3f034(s_objective)
{
	if(isdefined(self.var_4e490ff2))
	{
		arrayremovevalue(self.var_4e490ff2, s_objective, 0);
		for(i = 0; i < 3; i++)
		{
			var_c85f05da = i + 1;
			var_b60373bf = self.var_4e490ff2[i];
			var_67af9061 = "hudItems.cpObjective.perPlayer.subObjective" + var_c85f05da;
			if(isdefined(var_b60373bf))
			{
				if(var_b60373bf.var_75659ce3[self getentitynumber()] != var_c85f05da)
				{
					self clientfield::set_player_uimodel(var_67af9061 + ".objId", var_b60373bf.n_obj_id);
					self clientfield::set_player_uimodel(var_67af9061 + ".state", var_b60373bf.var_a15c87b0);
					var_b60373bf.var_75659ce3[self getentitynumber()] = var_c85f05da;
				}
				continue;
			}
			if((clientfield::get_player_uimodel(var_67af9061 + ".objId")) != 0)
			{
				self clientfield::set_player_uimodel(var_67af9061 + ".objId", 0);
				self clientfield::set_player_uimodel(var_67af9061 + ".state", 0);
			}
		}
		if(isdefined(self.var_3a93e1f9))
		{
			arrayremovevalue(self.var_3a93e1f9, s_objective, 0);
		}
		s_objective.var_75659ce3[self getentitynumber()] = undefined;
		if(!isdefined(s_objective.var_75659ce3) || !s_objective.var_75659ce3.size)
		{
			s_objective.var_75659ce3 = undefined;
			if(is_true(s_objective.var_428fe2c1))
			{
				s_objective.var_a15c87b0 = undefined;
				gameobjects::release_obj_id(s_objective.n_obj_id);
			}
		}
	}
}

/*
	Name: set_pvp_objective
	Namespace: hud
	Checksum: 0x7DC7A2D9
	Offset: 0x3D40
	Size: 0x29C
	Parameters: 6
	Flags: None
*/
function set_pvp_objective(str_identifier, n_obj_id, n_widget, var_48d81699, var_94fe5aa5, var_23b4190)
{
	foreach(str_flag in array("pvp_objective_set_allies", "pvp_objective_set_axis"))
	{
		self flag::init(str_flag);
	}
	mission flag::wait_till_clear("pvp_objectives_updating");
	mission flag::set("pvp_objectives_updating");
	var_ae4241f = 1;
	foreach(var_cc966c56 in array(#"axis", #"allies"))
	{
		if(var_23b4190 === var_cc966c56)
		{
			var_fc6b273a = var_94fe5aa5;
		}
		else
		{
			var_fc6b273a = n_widget;
		}
		if(is_true(var_ae4241f))
		{
			var_ae4241f = undefined;
			self thread set_team_objective(str_identifier, var_cc966c56, n_obj_id, var_fc6b273a, var_48d81699, 1);
			continue;
		}
		self set_team_objective(str_identifier, var_cc966c56, n_obj_id, var_fc6b273a, var_48d81699, 1);
	}
	flag::wait_till_all(array("pvp_objective_set_allies", "pvp_objective_set_axis"));
	mission flag::clear("pvp_objectives_updating");
}

/*
	Name: function_426b1c79
	Namespace: hud
	Checksum: 0x55AD7647
	Offset: 0x3FE8
	Size: 0x1C8
	Parameters: 3
	Flags: None
*/
function function_426b1c79(str_identifier, str_winning_team, var_f30c60cd)
{
	if(!isdefined(str_winning_team))
	{
		str_winning_team = #"none";
	}
	if(!isdefined(var_f30c60cd))
	{
		var_f30c60cd = 1;
	}
	var_ea5acf75 = util::get_team_mapping(str_winning_team);
	var_ae4241f = 1;
	var_f30c60cd = str_winning_team == #"none" && var_f30c60cd;
	foreach(var_cc966c56 in array(#"axis", #"allies"))
	{
		if(var_f30c60cd || var_ea5acf75 == var_cc966c56)
		{
			b_success = 1;
		}
		else
		{
			b_success = 0;
		}
		if(is_true(var_ae4241f))
		{
			var_ae4241f = undefined;
			self thread function_9b9f0fd8(str_identifier, var_cc966c56, b_success, undefined, 1);
			continue;
		}
		self function_9b9f0fd8(str_identifier, var_cc966c56, b_success, undefined, 1);
	}
}

/*
	Name: function_b825bd3d
	Namespace: hud
	Checksum: 0x7245DF97
	Offset: 0x41B8
	Size: 0x234
	Parameters: 3
	Flags: None
*/
function function_b825bd3d(str_team, var_ba9a7af4, var_b002585c)
{
	if(!isdefined(var_b002585c))
	{
		var_b002585c = 1;
	}
	var_cc966c56 = util::get_team_mapping(var_ba9a7af4);
	var_f6d0dfa6 = 0;
	if(var_cc966c56 == #"allies")
	{
		if(isdefined(self.var_8f05313c) && self.var_8f05313c > 0)
		{
			n_progress = self.var_8f05313c;
		}
		if(1 && (!isdefined(self.var_682d5f28) || self.var_682d5f28 == 0))
		{
			var_f6d0dfa6 = 1;
		}
	}
	else if(var_cc966c56 == #"axis")
	{
		if(isdefined(self.var_682d5f28) && self.var_682d5f28 > 0)
		{
			n_progress = self.var_682d5f28;
		}
		if(1 && (!isdefined(self.var_8f05313c) || self.var_8f05313c == 0))
		{
			var_f6d0dfa6 = 1;
		}
	}
	if(!isdefined(n_progress))
	{
		return;
	}
	level function_9d9a1a4c();
	n_progress = n_progress * var_b002585c;
	if(isdefined(self.var_552af36b) && isdefined(self.var_552af36b[var_cc966c56]))
	{
		if(n_progress <= self.var_552af36b[var_cc966c56])
		{
			return;
		}
		var_a75ab061 = n_progress - self.var_552af36b[var_cc966c56];
	}
	else
	{
		var_a75ab061 = n_progress;
	}
	if(!isdefined(self.var_552af36b))
	{
		self.var_552af36b = [];
	}
	self.var_552af36b[var_cc966c56] = n_progress;
	var_255c51c = var_a75ab061 + level.var_f8cfac6[var_cc966c56];
	level function_ccc1b91c(var_cc966c56, var_255c51c, var_f6d0dfa6);
}

/*
	Name: function_ccc1b91c
	Namespace: hud
	Checksum: 0xED9AA9E6
	Offset: 0x43F8
	Size: 0x124
	Parameters: 3
	Flags: Linked, Private
*/
function private function_ccc1b91c(var_cc966c56, n_progress, var_f6d0dfa6)
{
	n_progress = math::clamp(n_progress, 0, 100);
	if(n_progress > level.var_f8cfac6[var_cc966c56])
	{
		level.var_f8cfac6[var_cc966c56] = n_progress;
		if(isdefined(level.var_d1623b35) && isdefined(level.var_d1623b35[var_cc966c56]) && level.var_d1623b35[var_cc966c56] > n_progress)
		{
			return;
		}
		clientfield::set_world_uimodel(("hudItems.cpObjective." + level.teams[var_cc966c56]) + ".totalProgress", n_progress / 100);
		if(var_f6d0dfa6 && !is_true(level.var_e1b15552))
		{
			level thread function_6609ffc(var_cc966c56, n_progress);
		}
	}
}

/*
	Name: function_6609ffc
	Namespace: hud
	Checksum: 0x3FEA73BF
	Offset: 0x4528
	Size: 0x1DC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6609ffc(var_cc966c56, n_progress)
{
	if(n_progress >= 100)
	{
		return;
	}
	var_7dd3cd12 = util::get_enemy_team(var_cc966c56);
	if(!isdefined(level.var_d1623b35))
	{
		level.var_d1623b35 = [];
	}
	if(!isdefined(level.var_d1623b35[var_7dd3cd12]))
	{
		level.var_d1623b35[var_7dd3cd12] = 0;
	}
	wait(randomfloatrange(0.5, 3));
	var_1f533a56 = n_progress - 10;
	if(randomint(100) > 90 && (n_progress + 2.5) < 100)
	{
		var_8b3ae2d6 = n_progress + 2.5;
	}
	else
	{
		var_8b3ae2d6 = n_progress;
	}
	n_progress = randomfloatrange(var_1f533a56, var_8b3ae2d6);
	n_progress = math::clamp(n_progress, 0, 100);
	if(n_progress > level.var_d1623b35[var_7dd3cd12])
	{
		level.var_d1623b35[var_7dd3cd12] = n_progress;
		if(n_progress > level.var_f8cfac6[var_7dd3cd12])
		{
			clientfield::set_world_uimodel(("hudItems.cpObjective." + level.teams[var_7dd3cd12]) + ".totalProgress", n_progress / 100);
		}
	}
}

/*
	Name: function_9d9a1a4c
	Namespace: hud
	Checksum: 0x42FA1134
	Offset: 0x4710
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9d9a1a4c()
{
	if(!isdefined(level.var_f8cfac6))
	{
		level.var_f8cfac6 = [];
		foreach(var_8061b838 in array(#"axis", #"allies"))
		{
			level.var_f8cfac6[var_8061b838] = 0;
		}
	}
}

/*
	Name: function_de3adc4
	Namespace: hud
	Checksum: 0x9D5F1531
	Offset: 0x47E8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function function_de3adc4(var_94f48890)
{
	self.var_94f48890 = var_94f48890;
}

/*
	Name: function_b452cecc
	Namespace: hud
	Checksum: 0x8E14F04A
	Offset: 0x4810
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function function_b452cecc(var_2f9eb5c3)
{
	self.var_2f9eb5c3 = var_2f9eb5c3;
}

/*
	Name: function_804d9c38
	Namespace: hud
	Checksum: 0x2F77DDDA
	Offset: 0x4838
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function function_804d9c38(var_1e7ed591)
{
	self.var_1e7ed591 = var_1e7ed591;
}

/*
	Name: function_c77e2583
	Namespace: hud
	Checksum: 0x1B4A6614
	Offset: 0x4860
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function function_c77e2583(var_8fcc64e7)
{
	self.var_8fcc64e7 = var_8fcc64e7;
}

/*
	Name: function_11c081f
	Namespace: hud
	Checksum: 0x89DB362
	Offset: 0x4888
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function function_11c081f(var_dc224d5b)
{
	self.var_dc224d5b = var_dc224d5b;
}

/*
	Name: mission_result
	Namespace: hud
	Checksum: 0x90E508E4
	Offset: 0x48B0
	Size: 0x584
	Parameters: 5
	Flags: None
*/
function mission_result(str_winning_team, var_db3d629e, var_95ee5812, var_b6213032, var_c8b60423)
{
	if(!isdefined(var_db3d629e))
	{
		var_db3d629e = #"hash_6ef5bcff7fb1d1ab";
	}
	if(!isdefined(var_95ee5812))
	{
		var_95ee5812 = #"hash_6ef5bcff7fb1d1ab";
	}
	if(!isdefined(var_b6213032))
	{
		var_b6213032 = 0;
	}
	if(!isdefined(var_c8b60423))
	{
		var_c8b60423 = 0.5;
	}
	foreach(e_player in function_58385b58())
	{
		if(e_player util::is_on_side(str_winning_team))
		{
			var_1a47c004 = #"hash_7fd63164f504dda1";
			var_1da53c42 = var_db3d629e;
		}
		else
		{
			var_1a47c004 = #"hash_294bb2c7021b1b72";
			var_1da53c42 = var_95ee5812;
		}
		if(isdefined(level.var_6371e281))
		{
			var_776f69c5 = level.var_6371e281[e_player.team];
		}
		if(isdefined(var_776f69c5) && !is_true(var_776f69c5.var_d201303e))
		{
			e_player.var_ac2de17e = e_player openluimenu("CPLoseTransition");
			e_player setluimenudata(e_player.var_ac2de17e, #"fade_out", 0);
		}
	}
	world.str_winning_team = str_winning_team;
	if(var_b6213032)
	{
		function_bc4f0b54();
		a_players = getplayers();
		array::run_all(a_players, &setlowready, 1);
		array::thread_all(a_players, &val::set, "mission_result", "show_hud", 0);
		array::thread_all(a_players, &val::set, "mission_result", "ignoreme", 1);
		array::thread_all(a_players, &val::set, "mission_result", "takedamage", 0);
		wait(1);
		array::thread_all(a_players, &val::set, "mission_result", "freezecontrols_allowlook", 1);
		wait(1);
		array::thread_all(a_players, &lui::screen_fade_out, 2, undefined, "mission_result", 1);
		wait(2.5);
		/#
			iprintln(("" + var_c8b60423) + "");
		#/
		level util::streamer_wait(undefined, undefined, var_c8b60423);
		function_ba453727();
		foreach(player in a_players)
		{
			player util::delay(0.25, "disconnect", &lui::screen_fade_in, 0.25, undefined, "mission_result");
		}
		array::run_all(a_players, &setlowready, 0);
		array::thread_all(a_players, &val::reset, "mission_result", "show_hud");
		array::thread_all(a_players, &val::reset, "mission_result", "freezecontrols_allowlook");
		array::thread_all(a_players, &val::reset, "mission_result", "ignoreme");
		array::thread_all(a_players, &val::reset, "mission_result", "takedamage");
	}
	else
	{
		wait(4);
		function_ba453727();
	}
}

/*
	Name: function_bc4f0b54
	Namespace: hud
	Checksum: 0xBE384E2F
	Offset: 0x4E40
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bc4f0b54()
{
	a_players = getplayers();
	foreach(player in a_players)
	{
		if(player.sessionstate === #"spectator")
		{
			player thread [[level.spawnplayer]]();
			continue;
		}
		if(player laststand::player_is_in_laststand())
		{
			player notify(#"auto_revive");
		}
	}
}

/*
	Name: function_ba453727
	Namespace: hud
	Checksum: 0xA6251E5D
	Offset: 0x4F30
	Size: 0x1F0
	Parameters: 0
	Flags: Linked
*/
function function_ba453727()
{
	if(!isdefined(level.var_6371e281))
	{
		level function_6cf4a466();
	}
	var_407fef8b = [];
	foreach(e_player in function_58385b58())
	{
		var_776f69c5 = level.var_6371e281[e_player.team];
		if(isdefined(e_player.var_ac2de17e))
		{
			e_player setluimenudata(e_player.var_ac2de17e, #"fade_out", 1);
			if(!isdefined(var_407fef8b))
			{
				var_407fef8b = [];
			}
			else if(!isarray(var_407fef8b))
			{
				var_407fef8b = array(var_407fef8b);
			}
			var_407fef8b[var_407fef8b.size] = e_player;
		}
	}
	if(var_407fef8b.size)
	{
		wait(1);
		foreach(e_player in var_407fef8b)
		{
			e_player closeluimenu(e_player.var_ac2de17e);
		}
	}
}

/*
	Name: objective_result
	Namespace: hud
	Checksum: 0xA8FC35D
	Offset: 0x5128
	Size: 0x11E
	Parameters: 3
	Flags: Linked
*/
function objective_result(str_winning_team, var_db3d629e, var_95ee5812)
{
	if(!isdefined(var_db3d629e))
	{
		var_db3d629e = #"hash_6ef5bcff7fb1d1ab";
	}
	if(!isdefined(var_95ee5812))
	{
		var_95ee5812 = #"hash_6ef5bcff7fb1d1ab";
	}
	var_1a47c004 = #"hash_70cccbb95b710d8c";
	foreach(e_player in level.players)
	{
		if(isalive(e_player))
		{
			if(e_player util::is_on_side(str_winning_team))
			{
				var_1da53c42 = var_db3d629e;
				continue;
			}
			var_1da53c42 = var_95ee5812;
		}
	}
}

/*
	Name: function_e2f8b883
	Namespace: hud
	Checksum: 0xBA2FE939
	Offset: 0x5250
	Size: 0x19C
	Parameters: 6
	Flags: None
*/
function function_e2f8b883(str_team, str_objective, var_e563ad04, e_player, var_2f3a056c, var_b1f5cba2)
{
	if(!isdefined(var_b1f5cba2))
	{
		var_b1f5cba2 = 0;
	}
	if(!isdefined(level.var_6371e281))
	{
		level function_6cf4a466();
	}
	var_cc966c56 = util::get_team_mapping(str_objective);
	var_776f69c5 = level.var_6371e281[var_cc966c56];
	var_67af9061 = "hudItems.cpObjective." + level.teams[var_cc966c56];
	n_obj_id = gameobjects::get_next_obj_id();
	objective_add(n_obj_id, "invisible", undefined, var_e563ad04);
	objective_setteam(n_obj_id, var_cc966c56);
	var_869753ec = {#hash_b1f5cba2:var_b1f5cba2, #str_objective:var_e563ad04, #hash_428fe2c1:1, #n_obj_id:n_obj_id};
	if(isdefined(e_player))
	{
		var_869753ec.var_e563ad04 = e_player;
	}
	level function_7227b733(var_776f69c5, var_67af9061, var_869753ec, var_cc966c56, var_2f3a056c);
}

/*
	Name: function_e1f39986
	Namespace: hud
	Checksum: 0x111BED27
	Offset: 0x53F8
	Size: 0x394
	Parameters: 4
	Flags: None
*/
function function_e1f39986(str_team, str_objective, b_success, e_player)
{
	if(!isdefined(b_success))
	{
		b_success = 1;
	}
	if(!isdefined(level.var_6371e281))
	{
		level function_6cf4a466();
	}
	var_cc966c56 = util::get_team_mapping(str_team);
	var_776f69c5 = level.var_6371e281[var_cc966c56];
	var_67af9061 = "hudItems.cpObjective." + level.teams[var_cc966c56];
	foreach(var_b60373bf in var_776f69c5.var_4e490ff2)
	{
		if(var_b60373bf.str_objective === str_objective && !is_true(var_b60373bf.b_clearing))
		{
			var_b60373bf.b_clearing = 1;
			_plant_player_tablet_state = var_b60373bf;
			var_f8f93ac7 = 1;
			break;
		}
	}
	if(!isdefined(_plant_player_tablet_state) && isdefined(e_player) && isdefined(e_player.var_4e490ff2))
	{
		foreach(var_b60373bf in e_player.var_4e490ff2)
		{
			if(isdefined(e_player.var_3a93e1f9) && isinarray(e_player.var_3a93e1f9, var_b60373bf))
			{
				continue;
			}
			if(var_b60373bf.str_objective === str_objective)
			{
				var_b60373bf.b_clearing = 1;
				_plant_player_tablet_state = var_b60373bf;
				var_f8f93ac7 = 0;
				break;
			}
		}
	}
	if(!isdefined(_plant_player_tablet_state))
	{
		return;
	}
	if(b_success)
	{
		n_state = 1;
	}
	else
	{
		n_state = 2;
	}
	if(var_f8f93ac7 && _plant_player_tablet_state.var_c85f05da <= 3)
	{
		clientfield::set_world_uimodel(((var_67af9061 + ".teamSubObjective") + _plant_player_tablet_state.var_c85f05da) + ".state", n_state);
	}
	_plant_player_tablet_state.var_a15c87b0 = n_state;
	if(isdefined(e_player))
	{
		a_e_players = array(e_player);
	}
	else
	{
		a_e_players = getplayers(var_cc966c56);
	}
	_plant_player_tablet_state function_a192bfac(a_e_players, var_cc966c56, n_state);
	wait(5);
	level function_faab2ef9(var_776f69c5, var_67af9061, _plant_player_tablet_state, a_e_players);
}

/*
	Name: function_ffebf739
	Namespace: hud
	Checksum: 0xD6EC70CE
	Offset: 0x5798
	Size: 0xC4
	Parameters: 4
	Flags: None
*/
function function_ffebf739(str_team, n_progress, b_additive, var_ed465381)
{
	if(!isdefined(b_additive))
	{
		b_additive = 0;
	}
	if(!isdefined(var_ed465381))
	{
		var_ed465381 = 0;
	}
	level function_9d9a1a4c();
	var_cc966c56 = util::get_team_mapping(str_team);
	var_ed465381 = var_ed465381 && 1;
	if(b_additive)
	{
		n_progress = n_progress + level.var_f8cfac6[var_cc966c56];
	}
	level function_ccc1b91c(var_cc966c56, n_progress, var_ed465381);
}

/*
	Name: function_21ad06d5
	Namespace: hud
	Checksum: 0xF023DD6E
	Offset: 0x5868
	Size: 0x334
	Parameters: 2
	Flags: Linked
*/
function function_21ad06d5(b_active, var_7dfc932e)
{
	if(!isdefined(var_7dfc932e))
	{
		var_7dfc932e = array(#"axis", #"allies");
	}
	if(!isdefined(level.var_20e69608))
	{
		level.var_20e69608 = [];
		level.var_20e69608[#"allies"] = 0;
		level.var_20e69608[#"axis"] = 0;
	}
	if(!isarray(var_7dfc932e))
	{
		if(!isdefined(var_7dfc932e))
		{
			var_7dfc932e = [];
		}
		else if(!isarray(var_7dfc932e))
		{
			var_7dfc932e = array(var_7dfc932e);
		}
	}
	if(b_active)
	{
		foreach(var_cc966c56 in var_7dfc932e)
		{
			foreach(e_player in getplayers(var_cc966c56))
			{
				e_player clientfield::set_player_uimodel("hudItems.cpObjective.perPlayer.isPvp", 1);
			}
			level.var_20e69608[var_cc966c56]++;
		}
	}
	else
	{
		foreach(var_cc966c56 in var_7dfc932e)
		{
			level.var_20e69608[var_cc966c56]--;
			if(level.var_20e69608[var_cc966c56] <= 0)
			{
				foreach(e_player in getplayers(var_cc966c56))
				{
					e_player clientfield::set_player_uimodel("hudItems.cpObjective.perPlayer.isPvp", 0);
				}
			}
		}
	}
}

/*
	Name: function_c9800094
	Namespace: hud
	Checksum: 0x8F8ED46C
	Offset: 0x5BA8
	Size: 0x194
	Parameters: 5
	Flags: Linked
*/
function function_c9800094(eattacker, vpoint, damage, type, var_64e1375e)
{
	if(!isdefined(var_64e1375e))
	{
		var_64e1375e = 0;
	}
	if(!(isdefined(eattacker) && (isdefined(vpoint) && (isdefined(damage) && (isdefined(type) && isdefined(var_64e1375e))))))
	{
		return;
	}
	if(is_true(getgametypesetting(#"hash_a564dde6ee3c657")))
	{
		if(isplayer(eattacker))
		{
			eattacker luinotifyevent(#"hash_49cd322df9ace483", 6, int(vpoint[0]), int(vpoint[1]), int(vpoint[2]), damage, type, var_64e1375e);
			eattacker luinotifyeventtospectators(#"hash_49cd322df9ace483", 6, int(vpoint[0]), int(vpoint[1]), int(vpoint[2]), damage, type, var_64e1375e);
		}
	}
}

/*
	Name: showperks
	Namespace: hud
	Checksum: 0x9DC07926
	Offset: 0x5D48
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function showperks()
{
	self luinotifyevent(#"show_perk_notification", 0);
}

