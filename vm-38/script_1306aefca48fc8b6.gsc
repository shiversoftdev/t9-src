#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_48e04a393ec6d855;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_73ad7687b437e468;
#using script_746267f0669c40ae;
#using script_74a56359b7d02ab6;
#using script_dc59353021baee1;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_c004634e;

/*
	Name: function_f025314d
	Namespace: namespace_c004634e
	Checksum: 0xBCB08486
	Offset: 0x580
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f025314d()
{
	level notify(1586979701);
}

/*
	Name: init
	Namespace: namespace_c004634e
	Checksum: 0x1CAC91E2
	Offset: 0x5A0
	Size: 0xDA
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.var_e1a08718 = &function_1210f64b;
	level.var_21910540 = &function_1648f5a1;
	level.var_8efaa0c8 = &function_a4c07e18;
	level.var_84c76431 = &function_d5a0313a;
	level.doa.var_e4d7094b = [];
	level.doa.var_4cdaff39 = [];
	level.doa.var_830f8412 = [];
	level.doa.var_fa21a3aa = 0;
	level.doa.var_f23e2931 = 0;
	level.doa.var_f5f2b4e8 = 0;
}

/*
	Name: function_4e886036
	Namespace: namespace_c004634e
	Checksum: 0x22835C9
	Offset: 0x688
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function function_4e886036(room)
{
	if(isdefined(level.doa.var_e4d7094b[room.template.rg_room]))
	{
		return level.doa.var_e4d7094b[room.template.rg_room];
	}
}

/*
	Name: function_4f9f7687
	Namespace: namespace_c004634e
	Checksum: 0x6E549048
	Offset: 0x6F0
	Size: 0x134
	Parameters: 2
	Flags: Linked
*/
function function_4f9f7687(roomname, iconname)
{
	if(!isinarray(level.doa.var_830f8412, roomname))
	{
		if(!isdefined(level.doa.var_830f8412))
		{
			level.doa.var_830f8412 = [];
		}
		else if(!isarray(level.doa.var_830f8412))
		{
			level.doa.var_830f8412 = array(level.doa.var_830f8412);
		}
		level.doa.var_830f8412[level.doa.var_830f8412.size] = roomname;
		level.doa.var_4cdaff39[roomname] = 0;
		level.doa.var_e4d7094b[roomname] = iconname;
	}
	namespace_f27a9d0d::function_2ff463e2(roomname);
}

/*
	Name: function_1648f5a1
	Namespace: namespace_c004634e
	Checksum: 0x36B0A445
	Offset: 0x830
	Size: 0x47C
	Parameters: 1
	Flags: Linked
*/
function function_1648f5a1(name)
{
	if(!isdefined(name))
	{
		name = "";
	}
	switch(name)
	{
		case "jungle_1_dungeon4":
		{
			function_4f9f7687("hall_dirt_2iflogger_exit_1024x1024", "doa_hud_icon_dungeon_hall_straight");
			function_4f9f7687("room_2b_exit_1024x1024", "doa_hud_icon_dungeon_room_octagon");
			function_4f9f7687("room_5_exit_1024x1024", "doa_hud_icon_dungeon_room_octagon");
		}
		case "cellar":
		{
			function_4f9f7687("room_1_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
			function_4f9f7687("room_2i_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
			function_4f9f7687("room_3_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
			function_4f9f7687("room_4_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
			function_4f9f7687("hall_dirt_2_exit_ver1_1024x1024", "doa_hud_icon_dungeon_hall_straight");
			function_4f9f7687("hall_dirt_2_exit_ver2_1024x1024", "doa_hud_icon_dungeon_hall_straight");
			function_4f9f7687("hall_dirt_2l_exit_ver1_1024x1024", "doa_hud_icon_dungeon_hall_right_angle");
			function_4f9f7687("hall_dirt_2l_exit_ver2_1024x1024", "doa_hud_icon_dungeon_hall_right_angle");
			function_4f9f7687("hall_dirt_3_exit_ver1_1024x1024", "doa_hud_icon_dungeon_hall_inverse_t");
			function_4f9f7687("hall_dirt_4_exit_ver1_1024x1024", "doa_hud_icon_dungeon_hall_plus");
			break;
		}
		default:
		{
			function_4f9f7687("room_1_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
			function_4f9f7687("room_1b_exit_1024x1024", "doa_hud_icon_dungeon_room_1b");
			function_4f9f7687("room_2b_exit_1024x1024", "doa_hud_icon_dungeon_room_octagon");
			function_4f9f7687("room_2i_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
			function_4f9f7687("room_2l_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
			function_4f9f7687("room_3_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
			function_4f9f7687("room_3b_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
			function_4f9f7687("room_4_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
			function_4f9f7687("room_5_exit_1024x1024", "doa_hud_icon_dungeon_room_octagon");
			function_4f9f7687("hall_2i_exit_1024x1024", "doa_hud_icon_dungeon_hall_straight");
			function_4f9f7687("hall_2ii_exit_1024x1024", "doa_hud_icon_dungeon_hall_2ii");
			function_4f9f7687("hall_2ilava_exit_1024x1024", "doa_hud_icon_dungeon_hall_straight");
			function_4f9f7687("hall_2iflogger_exit_1024x1024", "doa_hud_icon_dungeon_hall_straight");
			function_4f9f7687("hall_2l_exit_1024x1024", "doa_hud_icon_dungeon_hall_right_angle");
			function_4f9f7687("hall_3_exit_1024x1024", "doa_hud_icon_dungeon_hall_inverse_t");
			function_4f9f7687("hall_3b_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
			function_4f9f7687("hall_4_exit_1024x1024", "doa_hud_icon_dungeon_hall_plus");
			function_4f9f7687("hall_4l_exit_1024x1024", "doa_hud_icon_dungeon_hall_diamond");
			break;
		}
	}
	function_ed9ae881(name);
	function_18276de3(name);
}

/*
	Name: function_1a3f9fe1
	Namespace: namespace_c004634e
	Checksum: 0x8513105F
	Offset: 0xCB8
	Size: 0xCD0
	Parameters: 1
	Flags: Linked
*/
function function_1a3f9fe1(expanded)
{
	level.var_e1daf6fe[0] = [];
	level.var_e1daf6fe[1] = array({#orientation:3, #hash_fef51edb:"room_1_exit_1024x1024"});
	level.var_e1daf6fe[2] = array({#orientation:2, #hash_fef51edb:"room_1_exit_1024x1024"});
	level.var_e1daf6fe[4] = array({#orientation:1, #hash_fef51edb:"room_1_exit_1024x1024"});
	level.var_e1daf6fe[8] = array({#orientation:0, #hash_fef51edb:"room_1_exit_1024x1024"});
	if(is_true(expanded))
	{
		level.var_e1daf6fe[10] = array({#orientation:0, #hash_fef51edb:"room_2i_exit_1024x1024"}, {#orientation:0, #hash_fef51edb:"room_2b_exit_1024x1024"});
		level.var_e1daf6fe[5] = array({#orientation:1, #hash_fef51edb:"room_2i_exit_1024x1024"}, {#orientation:1, #hash_fef51edb:"room_2b_exit_1024x1024"});
	}
	else
	{
		level.var_e1daf6fe[10] = array({#orientation:0, #hash_fef51edb:"room_2i_exit_1024x1024"});
		level.var_e1daf6fe[5] = array({#orientation:1, #hash_fef51edb:"room_2i_exit_1024x1024"});
	}
	level.var_e1daf6fe[9] = array({#orientation:3, #hash_fef51edb:"hall_dirt_2l_exit_ver1_1024x1024"});
	level.var_e1daf6fe[3] = array({#orientation:2, #hash_fef51edb:"hall_dirt_2l_exit_ver1_1024x1024"});
	level.var_e1daf6fe[6] = array({#orientation:1, #hash_fef51edb:"hall_dirt_2l_exit_ver2_1024x1024"});
	level.var_e1daf6fe[12] = array({#orientation:0, #hash_fef51edb:"hall_dirt_2l_exit_ver2_1024x1024"});
	level.var_e1daf6fe[11] = array({#orientation:3, #hash_fef51edb:"room_3_exit_1024x1024"});
	level.var_e1daf6fe[7] = array({#orientation:2, #hash_fef51edb:"room_3_exit_1024x1024"});
	level.var_e1daf6fe[14] = array({#orientation:1, #hash_fef51edb:"room_3_exit_1024x1024"});
	level.var_e1daf6fe[13] = array({#orientation:0, #hash_fef51edb:"room_3_exit_1024x1024"});
	if(is_true(expanded))
	{
		level.var_e1daf6fe[15] = array({#orientation:0, #hash_fef51edb:"room_4_exit_1024x1024"}, {#orientation:0, #hash_fef51edb:"room_5_exit_1024x1024"}, {#orientation:0, #hash_fef51edb:"room_5_exit_1024x1024"});
	}
	else
	{
		level.var_e1daf6fe[15] = array({#orientation:0, #hash_fef51edb:"room_4_exit_1024x1024"});
	}
	level.var_86fb599e[0] = [];
	level.var_86fb599e[1] = array({#orientation:3, #hash_fef51edb:"hall_1_exit_1024x1024"});
	level.var_86fb599e[2] = array({#orientation:2, #hash_fef51edb:"hall_1_exit_1024x1024"});
	level.var_86fb599e[4] = array({#orientation:1, #hash_fef51edb:"hall_1_exit_1024x1024"});
	level.var_86fb599e[8] = array({#orientation:0, #hash_fef51edb:"hall_1_exit_1024x1024"});
	if(is_true(expanded))
	{
		level.var_86fb599e[10] = array({#orientation:0, #hash_fef51edb:"hall_dirt_2_exit_ver1_1024x1024"}, {#orientation:0, #hash_fef51edb:"hall_dirt_2_exit_ver2_1024x1024"}, {#orientation:0, #hash_fef51edb:"hall_dirt_2iflogger_exit_1024x1024"});
		level.var_86fb599e[5] = array({#orientation:1, #hash_fef51edb:"hall_dirt_2_exit_ver1_1024x1024"}, {#orientation:1, #hash_fef51edb:"hall_dirt_2_exit_ver2_1024x1024"}, {#orientation:1, #hash_fef51edb:"hall_dirt_2iflogger_exit_1024x1024"});
	}
	else
	{
		level.var_86fb599e[10] = array({#orientation:0, #hash_fef51edb:"hall_dirt_2_exit_ver1_1024x1024"}, {#orientation:0, #hash_fef51edb:"hall_dirt_2_exit_ver2_1024x1024"});
		level.var_86fb599e[5] = array({#orientation:1, #hash_fef51edb:"hall_dirt_2_exit_ver1_1024x1024"}, {#orientation:1, #hash_fef51edb:"hall_dirt_2_exit_ver2_1024x1024"});
	}
	level.var_86fb599e[9] = array({#orientation:3, #hash_fef51edb:"hall_dirt_2l_exit_ver1_1024x1024"}, {#orientation:3, #hash_fef51edb:"hall_dirt_2l_exit_ver2_1024x1024"});
	level.var_86fb599e[3] = array({#orientation:2, #hash_fef51edb:"hall_dirt_2l_exit_ver1_1024x1024"}, {#orientation:2, #hash_fef51edb:"hall_dirt_2l_exit_ver2_1024x1024"});
	level.var_86fb599e[6] = array({#orientation:1, #hash_fef51edb:"hall_dirt_2l_exit_ver1_1024x1024"}, {#orientation:1, #hash_fef51edb:"hall_dirt_2l_exit_ver2_1024x1024"});
	level.var_86fb599e[12] = array({#orientation:0, #hash_fef51edb:"hall_dirt_2l_exit_ver1_1024x1024"}, {#orientation:0, #hash_fef51edb:"hall_dirt_2l_exit_ver2_1024x1024"});
	level.var_86fb599e[11] = array({#orientation:3, #hash_fef51edb:"hall_dirt_3_exit_ver1_1024x1024"});
	level.var_86fb599e[7] = array({#orientation:2, #hash_fef51edb:"hall_dirt_3_exit_ver1_1024x1024"});
	level.var_86fb599e[14] = array({#orientation:1, #hash_fef51edb:"hall_dirt_3_exit_ver1_1024x1024"});
	level.var_86fb599e[13] = array({#orientation:0, #hash_fef51edb:"hall_dirt_3_exit_ver1_1024x1024"});
	level.var_86fb599e[15] = array({#orientation:0, #hash_fef51edb:"hall_dirt_4_exit_ver1_1024x1024"});
}

/*
	Name: function_9df20e11
	Namespace: namespace_c004634e
	Checksum: 0xE68FC6AC
	Offset: 0x1990
	Size: 0xBE0
	Parameters: 0
	Flags: Linked
*/
function function_9df20e11()
{
	level.var_e1daf6fe[0] = [];
	level.var_e1daf6fe[1] = array({#orientation:3, #hash_fef51edb:"room_1_exit_1024x1024"}, {#orientation:3, #hash_fef51edb:"room_1b_exit_1024x1024"});
	level.var_e1daf6fe[2] = array({#orientation:2, #hash_fef51edb:"room_1_exit_1024x1024"}, {#orientation:2, #hash_fef51edb:"room_1b_exit_1024x1024"});
	level.var_e1daf6fe[4] = array({#orientation:1, #hash_fef51edb:"room_1_exit_1024x1024"}, {#orientation:1, #hash_fef51edb:"room_1b_exit_1024x1024"});
	level.var_e1daf6fe[8] = array({#orientation:0, #hash_fef51edb:"room_1_exit_1024x1024"}, {#orientation:0, #hash_fef51edb:"room_1b_exit_1024x1024"});
	level.var_e1daf6fe[10] = array({#orientation:0, #hash_fef51edb:"room_2i_exit_1024x1024"}, {#orientation:0, #hash_fef51edb:"room_2b_exit_1024x1024"});
	level.var_e1daf6fe[5] = array({#orientation:1, #hash_fef51edb:"room_2i_exit_1024x1024"}, {#orientation:1, #hash_fef51edb:"room_2b_exit_1024x1024"});
	level.var_e1daf6fe[9] = array({#orientation:3, #hash_fef51edb:"room_2l_exit_1024x1024"});
	level.var_e1daf6fe[3] = array({#orientation:2, #hash_fef51edb:"room_2l_exit_1024x1024"});
	level.var_e1daf6fe[6] = array({#orientation:1, #hash_fef51edb:"room_2l_exit_1024x1024"});
	level.var_e1daf6fe[12] = array({#orientation:0, #hash_fef51edb:"room_2l_exit_1024x1024"});
	level.var_e1daf6fe[11] = array({#orientation:3, #hash_fef51edb:"room_3_exit_1024x1024"}, {#orientation:3, #hash_fef51edb:"room_3b_exit_1024x1024"});
	level.var_e1daf6fe[7] = array({#orientation:2, #hash_fef51edb:"room_3_exit_1024x1024"}, {#orientation:2, #hash_fef51edb:"room_3b_exit_1024x1024"});
	level.var_e1daf6fe[14] = array({#orientation:1, #hash_fef51edb:"room_3_exit_1024x1024"});
	level.var_e1daf6fe[13] = array({#orientation:0, #hash_fef51edb:"room_3_exit_1024x1024"});
	level.var_e1daf6fe[15] = array({#orientation:0, #hash_fef51edb:"room_4_exit_1024x1024"}, {#orientation:0, #hash_fef51edb:"room_5_exit_1024x1024"}, {#orientation:0, #hash_fef51edb:"room_5_exit_1024x1024"});
	level.var_86fb599e[0] = [];
	level.var_86fb599e[1] = array({#orientation:3, #hash_fef51edb:"hall_1_exit_1024x1024"});
	level.var_86fb599e[2] = array({#orientation:2, #hash_fef51edb:"hall_1_exit_1024x1024"});
	level.var_86fb599e[4] = array({#orientation:1, #hash_fef51edb:"hall_1_exit_1024x1024"});
	level.var_86fb599e[8] = array({#orientation:0, #hash_fef51edb:"hall_1_exit_1024x1024"});
	level.var_86fb599e[10] = array({#orientation:0, #hash_fef51edb:"hall_2i_exit_1024x1024"}, {#orientation:0, #hash_fef51edb:"hall_2ii_exit_1024x1024"}, {#orientation:0, #hash_fef51edb:"hall_2ilava_exit_1024x1024"}, {#orientation:0, #hash_fef51edb:"hall_2iflogger_exit_1024x1024"});
	level.var_86fb599e[5] = array({#orientation:1, #hash_fef51edb:"hall_2i_exit_1024x1024"}, {#orientation:1, #hash_fef51edb:"hall_2ii_exit_1024x1024"}, {#orientation:1, #hash_fef51edb:"hall_2ilava_exit_1024x1024"}, {#orientation:1, #hash_fef51edb:"hall_2iflogger_exit_1024x1024"});
	level.var_86fb599e[9] = array({#orientation:3, #hash_fef51edb:"hall_2l_exit_1024x1024"});
	level.var_86fb599e[3] = array({#orientation:2, #hash_fef51edb:"hall_2l_exit_1024x1024"});
	level.var_86fb599e[6] = array({#orientation:1, #hash_fef51edb:"hall_2l_exit_1024x1024"});
	level.var_86fb599e[12] = array({#orientation:0, #hash_fef51edb:"hall_2l_exit_1024x1024"});
	level.var_86fb599e[11] = array({#orientation:3, #hash_fef51edb:"hall_3_exit_1024x1024"});
	level.var_86fb599e[7] = array({#orientation:2, #hash_fef51edb:"hall_3_exit_1024x1024"}, {#orientation:2, #hash_fef51edb:"hall_3b_exit_1024x1024"});
	level.var_86fb599e[14] = array({#orientation:1, #hash_fef51edb:"hall_3_exit_1024x1024"});
	level.var_86fb599e[13] = array({#orientation:0, #hash_fef51edb:"hall_3_exit_1024x1024"}, {#orientation:0, #hash_fef51edb:"hall_3b_exit_1024x1024"});
	level.var_86fb599e[15] = array({#orientation:0, #hash_fef51edb:"hall_4_exit_1024x1024"}, {#orientation:0, #hash_fef51edb:"hall_4l_exit_1024x1024"});
}

/*
	Name: function_a4c07e18
	Namespace: namespace_c004634e
	Checksum: 0x50EEA70A
	Offset: 0x2578
	Size: 0x1DA
	Parameters: 1
	Flags: Linked
*/
function function_a4c07e18(name)
{
	playercount = getplayers().size;
	gridsize = math::clamp(3 + playercount, 4, 6);
	var_5d3143fb = math::clamp(7 + playercount, 8, 12);
	switch(name)
	{
		case "jungle_1_dungeon4":
		{
			setdvar(#"hash_4c2ff1f11662c879", var_5d3143fb);
			setdvar(#"hash_788fb3bfb03132f", gridsize);
			function_1a3f9fe1(1);
			break;
		}
		case "cellar":
		{
			setdvar(#"hash_4c2ff1f11662c879", var_5d3143fb);
			setdvar(#"hash_788fb3bfb03132f", gridsize);
			function_1a3f9fe1();
			break;
		}
		default:
		{
			setdvar(#"hash_4c2ff1f11662c879", var_5d3143fb);
			setdvar(#"hash_788fb3bfb03132f", gridsize);
			function_9df20e11();
			break;
		}
	}
}

/*
	Name: function_1210f64b
	Namespace: namespace_c004634e
	Checksum: 0xC6C4F967
	Offset: 0x2760
	Size: 0x1E
	Parameters: 3
	Flags: Linked
*/
function function_1210f64b(unused1, unused2, unused3)
{
	return undefined;
}

/*
	Name: function_18276de3
	Namespace: namespace_c004634e
	Checksum: 0xAC97A5A3
	Offset: 0x2788
	Size: 0xA2A
	Parameters: 1
	Flags: Linked
*/
function function_18276de3(name)
{
	if(!isdefined(name))
	{
		name = "";
	}
	level.doa.var_3d1f118d = [];
	level.doa.var_3d1f118d[#"wall"] = [];
	level.doa.var_3d1f118d[#"floor"] = [];
	switch(name)
	{
		default:
		{
			level.doa.var_3d1f118d[#"wall"][#"torch"][0] = {#fx:"fx_fire_torch_wall_lit_castle", #weight:1, #scale:1, #yaw_offset:0, #model:#"hash_4806b879eea49e81"};
			level.doa.var_3d1f118d[#"wall"][#"hash_2ec1ad0b894eb316"][0] = {#weight:1, #scale:1, #yaw_offset:-90, #model:#"zombietron_gargoyle_sconce_1"};
			level.doa.var_3d1f118d[#"wall"][#"hash_2ec1ad0b894eb316"][1] = {#weight:1, #scale:1, #yaw_offset:180, #model:#"hash_291981c5c2b46c54"};
			level.doa.var_3d1f118d[#"wall"][#"hash_2ec1ad0b894eb316"][2] = {#weight:1, #scale:1, #yaw_offset:0, #model:#"zombietron_gargoyle_sconce_3"};
			level.doa.var_3d1f118d[#"wall"][#"hash_2ec1ad0b894eb316"][3] = {#weight:1, #scale:1, #yaw_offset:180, #model:#"zombietron_gargoyle_sconce_4"};
			level.doa.var_3d1f118d[#"wall"][#"hash_2ec1ad0b894eb316"][4] = {#weight:1, #scale:3, #yaw_offset:0, #model:#"zombietron_treasure_mask_gold"};
			level.doa.var_3d1f118d[#"floor"][#"statue"][0] = {#weight:1, #scale:1, #yaw_offset:0, #model:#"hash_106e3aed469dc9f5"};
			level.doa.var_3d1f118d[#"floor"][#"statue"][1] = {#weight:1, #scale:1, #yaw_offset:0, #model:#"zombietron_templar_statue_01"};
			level.doa.var_3d1f118d[#"floor"][#"statue"][2] = {#weight:1, #scale:1, #yaw_offset:0, #model:#"zombietron_templar_statue_02"};
			level.doa.var_3d1f118d[#"floor"][#"statue"][3] = {#weight:1, #scale:1, #yaw_offset:0, #model:#"zombietron_templar_statue_03"};
			level.doa.var_3d1f118d[#"floor"][#"statue"][4] = {#weight:1, #scale:1, #yaw_offset:0, #model:#"zombietron_templar_statue_04"};
			level.doa.var_3d1f118d[#"floor"][#"statue"][5] = {#weight:1, #scale:1, #yaw_offset:0, #model:#"zombietron_arena_statue_man_wings"};
			level.doa.var_3d1f118d[#"floor"][#"statue"][6] = {#weight:1, #scale:1, #yaw_offset:0, #model:#"zombietron_altar_roman_statue_lt"};
			level.doa.var_3d1f118d[#"floor"][#"statue"][7] = {#weight:1, #scale:1, #yaw_offset:0, #model:#"zombietron_altar_roman_statue_rt"};
			level.doa.var_3d1f118d[#"floor"][#"statue"][8] = {#weight:1, #scale:1, #yaw_offset:0, #model:#"zombietron_sha_statue_finial"};
			level.doa.var_3d1f118d[#"floor"][#"statue"][9] = {#weight:1, #scale:0.6, #yaw_offset:90, #model:#"zombietron_statue_keeper_undercroft"};
			break;
		}
	}
}

/*
	Name: function_ed9ae881
	Namespace: namespace_c004634e
	Checksum: 0x34AED642
	Offset: 0x31C0
	Size: 0x82
	Parameters: 1
	Flags: Linked
*/
function function_ed9ae881(name)
{
	switch(name)
	{
		case "jungle_1_dungeon4":
		case "cellar":
		{
			level.var_84c76431 = &function_9a834e27;
			break;
		}
		default:
		{
			level.var_84c76431 = &function_d5a0313a;
			break;
		}
	}
}

/*
	Name: function_9a834e27
	Namespace: namespace_c004634e
	Checksum: 0x431FD79E
	Offset: 0x3250
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_9a834e27()
{
	var_1b8ba6f5 = function_d5a0313a();
	return var_1b8ba6f5;
}

/*
	Name: function_d5a0313a
	Namespace: namespace_c004634e
	Checksum: 0xAB0D2FE0
	Offset: 0x3280
	Size: 0x10E
	Parameters: 0
	Flags: Linked
*/
function function_d5a0313a()
{
	var_1b8ba6f5 = [];
	var_1b8ba6f5[0] = 1E-05;
	var_1b8ba6f5[1] = 0.001;
	var_1b8ba6f5[2] = 0.001;
	var_1b8ba6f5[3] = 1;
	var_1b8ba6f5[4] = 0.001;
	var_1b8ba6f5[5] = 1;
	var_1b8ba6f5[6] = 1;
	var_1b8ba6f5[7] = 0.5;
	var_1b8ba6f5[8] = 0.001;
	var_1b8ba6f5[9] = 1;
	var_1b8ba6f5[10] = 1;
	var_1b8ba6f5[11] = 0.5;
	var_1b8ba6f5[12] = 1;
	var_1b8ba6f5[13] = 0.5;
	var_1b8ba6f5[14] = 0.5;
	var_1b8ba6f5[15] = 1;
	return var_1b8ba6f5;
}

/*
	Name: function_1f81f464
	Namespace: namespace_c004634e
	Checksum: 0x5E03A76F
	Offset: 0x3398
	Size: 0xF6
	Parameters: 2
	Flags: Linked
*/
function function_1f81f464(type, subtype)
{
	if(isdefined(level.doa.var_3d1f118d[type]))
	{
		if(!isdefined(subtype))
		{
			subtype = function_d59c2d03(level.doa.var_3d1f118d[type].size);
		}
		else
		{
			subtype = hash(subtype);
		}
		if(isdefined(level.doa.var_3d1f118d[type][subtype]))
		{
			var_71b4f6c7 = function_d59c2d03(level.doa.var_3d1f118d[type][subtype].size);
			return level.doa.var_3d1f118d[type][subtype][var_71b4f6c7];
		}
	}
}

/*
	Name: function_6a09928b
	Namespace: namespace_c004634e
	Checksum: 0x7D8A39B0
	Offset: 0x3498
	Size: 0xE8
	Parameters: 2
	Flags: Linked
*/
function function_6a09928b(location, type)
{
	if(isdefined(location.script_parameters))
	{
		modelname = location.script_parameters;
	}
	else
	{
		var_95734d8b = function_1f81f464(type, location.script_noteworthy);
		modelname = var_95734d8b.model;
	}
	model = undefined;
	if(isdefined(modelname))
	{
		/#
			namespace_1e25ad94::debugmsg((((("" + function_9e72a96(type)) + "") + modelname) + "") + location.origin);
		#/
	}
	return model;
}

