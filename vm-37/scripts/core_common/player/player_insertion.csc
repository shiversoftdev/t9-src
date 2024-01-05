#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace player_insertion;

/*
	Name: __init__system__
	Namespace: player_insertion
	Checksum: 0x6665299F
	Offset: 0x368
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
	Checksum: 0x373B98B6
	Offset: 0x3B0
	Size: 0x114
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(level.var_f2814a96 !== 0 && level.var_f2814a96 !== 2)
	{
		return;
	}
	level.playerinsertion = 1;
	spawnpoints = struct::get_array("infil_spawn", "targetname");
	/#
		if(spawnpoints.size == 0)
		{
			spawnpoints = struct::get_array("", "");
		}
	#/
	if(spawnpoints.size != 0)
	{
		level.var_1194a9a5 = spawnpoints;
	}
	init_clientfields();
	level.var_a3c42585 = getgametypesetting(#"hash_15a01ec180d4ba8e");
	callback::on_localclient_connect(&on_localclient_connect);
}

/*
	Name: init_clientfields
	Namespace: player_insertion
	Checksum: 0xB91BA00
	Offset: 0x4D0
	Size: 0x42C
	Parameters: 0
	Flags: None
*/
function init_clientfields()
{
	clientfield::register("vehicle", "infiltration_transport", 1, 1, "int", &function_d8beedc9, 0, 0);
	clientfield::register("vehicle", "infiltration_landing_gear", 1, 1, "int", &function_ba7d9848, 0, 0);
	clientfield::register("toplayer", "infiltration_jump_warning", 1, 1, "int", &function_ded53cc6, 0, 0);
	clientfield::register("toplayer", "infiltration_final_warning", 1, 1, "int", &function_ea3cc318, 0, 0);
	clientfield::register("toplayer", "inside_infiltration_vehicle", 1, 1, "int", &inside_infiltration_vehicle, 0, 0);
	clientfield::register("world", "infiltration_compass", 1, 2, "int", &function_4da7bee9, 0, 0);
	clientfield::register("scriptmover", "infiltration_camera", 1, 3, "int", &function_7bac6764, 0, 0);
	clientfield::register("scriptmover", "infiltration_plane", 1, 2, "int", &infil_plane, 0, 0);
	clientfield::register("scriptmover", "infiltration_ent", 1, 2, "int", &infil_ent, 0, 0);
	clientfield::register("scriptmover", "infiltration_jump_point", 1, 2, "int", &function_73a03a18, 0, 0);
	clientfield::register("scriptmover", "infiltration_force_drop_point", 1, 2, "int", &function_f1c37912, 0, 0);
	clientfield::register("toplayer", "heatblurpostfx", 1, 1, "int", &function_c9851cb, 0, 0);
	clientfield::register("vehicle", "warpportalfx", 1, 1, "int", &function_c0c7c219, 0, 0);
	clientfield::register("vehicle", "warpportalfx_launch", 1, 1, "counter", &function_9767bbd8, 0, 0);
	clientfield::register("toplayer", "warpportal_fx_wormhole", 1, 1, "int", undefined, 0, 0);
}

/*
	Name: function_20cba65e
	Namespace: player_insertion
	Checksum: 0x9522E813
	Offset: 0x908
	Size: 0x1CC
	Parameters: 1
	Flags: None
*/
function function_20cba65e(player)
{
	/#
		assert(isplayer(player));
	#/
	if(!isdefined(player))
	{
		return 0;
	}
	teams = array(#"allies", #"axis");
	for(index = 3; index <= getgametypesetting(#"teamcount"); index++)
	{
		teams[teams.size] = #"team" + index;
	}
	var_aa3d62e3 = [];
	for(index = 0; index < teams.size; index++)
	{
		var_aa3d62e3[teams[index]] = index;
	}
	for(index = 0; index < max((isdefined(getgametypesetting(#"hash_731988b03dc6ee17")) ? getgametypesetting(#"hash_731988b03dc6ee17") : 1), 1); index++)
	{
		if(isdefined(var_aa3d62e3[player.team]) && var_aa3d62e3[player.team] == (index % (teams.size - 1)))
		{
			return index;
		}
	}
	return 0;
}

/*
	Name: on_localclient_connect
	Namespace: player_insertion
	Checksum: 0x6D29737B
	Offset: 0xAE0
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function on_localclient_connect(localclientnum)
{
	var_7eb8f61a = (isdefined(getgametypesetting(#"wzplayerinsertiontypeindex")) ? getgametypesetting(#"wzplayerinsertiontypeindex") : 0);
	if(var_7eb8f61a == 1)
	{
		level thread function_6c4ae982(localclientnum);
	}
}

/*
	Name: function_a4c14f8c
	Namespace: player_insertion
	Checksum: 0x554543AB
	Offset: 0xB78
	Size: 0x16
	Parameters: 1
	Flags: Private
*/
function private function_a4c14f8c(value)
{
	return value & 1;
}

/*
	Name: function_ff16ec5f
	Namespace: player_insertion
	Checksum: 0xA0C69E23
	Offset: 0xB98
	Size: 0x18
	Parameters: 1
	Flags: Private
*/
function private function_ff16ec5f(value)
{
	return (~value) & 1;
}

/*
	Name: function_76a4b21e
	Namespace: player_insertion
	Checksum: 0x8557FC0C
	Offset: 0xBB8
	Size: 0x16
	Parameters: 1
	Flags: Private
*/
function private function_76a4b21e(value)
{
	return value >> 1;
}

/*
	Name: function_6c4ae982
	Namespace: player_insertion
	Checksum: 0xA5871AB6
	Offset: 0xBD8
	Size: 0x1AC
	Parameters: 1
	Flags: Private
*/
function private function_6c4ae982(localclientnum)
{
	var_d5823792 = 0;
	var_b9d612e8 = 0;
	var_a106daf5 = 0;
	while(true)
	{
		local_player = function_5c10bd79(localclientnum);
		if(isdefined(local_player))
		{
			if(!local_player hasdobj(localclientnum))
			{
				waitframe(1);
				continue;
			}
		}
		if(isdefined(local_player))
		{
			wormhole_fx = local_player clientfield::get_to_player("warpportal_fx_wormhole");
			if(wormhole_fx === 1 && !var_d5823792)
			{
				var_d5823792 = 1;
				playsound(localclientnum, #"hash_37244e4f8de40dd5");
				local_player codeplaypostfxbundle("pstfx_wz_esc_tele_reveal");
				local_player codeplaypostfxbundle("pstfx_wz_esc_tele_sprites");
			}
			else if(wormhole_fx === 0 && var_d5823792)
			{
				var_d5823792 = 0;
				local_player function_3f145588("pstfx_wz_esc_tele_reveal");
				local_player function_3f145588("pstfx_wz_esc_tele_sprites");
			}
		}
		else
		{
			return;
		}
		waitframe(1);
	}
}

/*
	Name: function_d8beedc9
	Namespace: player_insertion
	Checksum: 0xFA112193
	Offset: 0xD90
	Size: 0x60
	Parameters: 7
	Flags: None
*/
function function_d8beedc9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		level notify(#"hash_5975d5f569535c41");
	}
}

/*
	Name: function_ba7d9848
	Namespace: player_insertion
	Checksum: 0xF28D15FA
	Offset: 0xDF8
	Size: 0x8C
	Parameters: 7
	Flags: None
*/
function function_ba7d9848(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(1)
	{
		if(bwastimejump)
		{
			self function_d309e55a("tag_landing_gear_control_animate", 1);
		}
		else
		{
			self function_d309e55a("tag_landing_gear_control_animate", 0);
		}
	}
}

/*
	Name: function_ded53cc6
	Namespace: player_insertion
	Checksum: 0x93E1D297
	Offset: 0xE90
	Size: 0x74
	Parameters: 7
	Flags: None
*/
function function_ded53cc6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1 && fieldname != bwastimejump)
	{
		self playsound(0, #"hash_7ba1b4b83540b238");
	}
}

/*
	Name: function_ea3cc318
	Namespace: player_insertion
	Checksum: 0x4FD00EEF
	Offset: 0xF10
	Size: 0x94
	Parameters: 7
	Flags: None
*/
function function_ea3cc318(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(self function_da43934d())
	{
		if(bwastimejump == 1 && fieldname != bwastimejump)
		{
			self playsound(0, #"hash_783bdfd900c11eed");
		}
	}
}

/*
	Name: function_8c515e6
	Namespace: player_insertion
	Checksum: 0x3962406A
	Offset: 0xFB0
	Size: 0x6C
	Parameters: 1
	Flags: Private
*/
function private function_8c515e6(player)
{
	self notify("7c6ff3d6cda434b3");
	self endon("7c6ff3d6cda434b3");
	self waittill(#"death");
	if(isdefined(player) && player isplayer())
	{
		player camerasetupdatecallback();
	}
}

/*
	Name: function_7bac6764
	Namespace: player_insertion
	Checksum: 0x60CE3436
	Offset: 0x1028
	Size: 0x23C
	Parameters: 7
	Flags: None
*/
function function_7bac6764(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level endon(#"game_ended");
	self endon(#"death");
	player = function_5c10bd79(fieldname);
	if(!isdefined(player))
	{
		return;
	}
	while(!isplayer(player))
	{
		waitframe(1);
		player = function_5c10bd79(fieldname);
	}
	if(!isdefined(self))
	{
		return;
	}
	var_5ed0195b = function_20cba65e(player);
	var_1e7db62f = function_a4c14f8c(bwastimejump);
	if(var_5ed0195b != var_1e7db62f)
	{
		return;
	}
	value = function_76a4b21e(bwastimejump);
	if(value == 0)
	{
		player camerasetupdatecallback();
	}
	else
	{
		if(value == 1)
		{
			level.var_88a92c26 = self;
			self camerasetupdatecallback(&function_cbe63de1);
			self thread function_8c515e6(player);
			player function_ec94346();
		}
		else if(value == 2)
		{
			level.var_88a92c26 = self;
			self camerasetupdatecallback(&function_c8ea4bcc);
			self thread function_8c515e6(player);
			player function_ec94346();
		}
	}
}

/*
	Name: infil_plane
	Namespace: player_insertion
	Checksum: 0x9E06DB78
	Offset: 0x1270
	Size: 0xA4
	Parameters: 7
	Flags: None
*/
function infil_plane(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(is_true(level.var_a3c42585))
	{
		return;
	}
	function_1b88c5(fieldname, function_a4c14f8c(bwastimejump), self);
	self setcompassicon("t8_hud_waypoints_drone_hunter_scaled_down");
}

/*
	Name: infil_ent
	Namespace: player_insertion
	Checksum: 0x68460EE5
	Offset: 0x1320
	Size: 0xCC
	Parameters: 7
	Flags: None
*/
function infil_ent(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(is_true(level.var_a3c42585))
	{
		return;
	}
	var_1e7db62f = function_a4c14f8c(bwastimejump);
	var_36f945fe = function_ff16ec5f(bwastimejump);
	function_c8ae746a(fieldname, var_1e7db62f, 1);
	function_c8ae746a(fieldname, var_36f945fe, 0);
}

/*
	Name: function_cbe63de1
	Namespace: player_insertion
	Checksum: 0xF5D1BD50
	Offset: 0x13F8
	Size: 0x1D4
	Parameters: 2
	Flags: None
*/
function function_cbe63de1(localclientnum, delta_t)
{
	player = function_5c10bd79(delta_t);
	if(!isdefined(player))
	{
		return;
	}
	if(!isdefined(level.var_88a92c26))
	{
		player camerasetposition(player.origin);
		player camerasetlookat(player.angles);
		return;
	}
	var_c9c16c96 = level.var_88a92c26.origin;
	var_6775ae79 = level.var_88a92c26.angles;
	/#
		assert(isdefined(var_6775ae79), "");
	#/
	if(!isdefined(var_6775ae79))
	{
		var_6775ae79 = player getcamangles();
		if(!isdefined(var_6775ae79))
		{
			var_6775ae79 = (isdefined(player.angles) ? player.angles : (0, 0, 0));
		}
	}
	cameravec = anglestoforward(var_6775ae79);
	camerapos = var_c9c16c96 - ((isdefined(level.var_427d6976.("insertionCameraFollowDistance")) ? level.var_427d6976.("insertionCameraFollowDistance") : 1600) * cameravec);
	player camerasetposition(camerapos);
	player camerasetlookat(var_6775ae79);
}

/*
	Name: function_c8ea4bcc
	Namespace: player_insertion
	Checksum: 0x9A04B6CE
	Offset: 0x15D8
	Size: 0x24C
	Parameters: 2
	Flags: None
*/
function function_c8ea4bcc(localclientnum, delta_t)
{
	player = function_5c10bd79(delta_t);
	if(!isdefined(player))
	{
		return;
	}
	if(!isdefined(level.var_88a92c26))
	{
		player camerasetposition(player.origin);
		player camerasetlookat(player.angles);
		return;
	}
	var_c9c16c96 = level.var_88a92c26.origin;
	var_6775ae79 = player getcamangles();
	if(!isdefined(var_6775ae79))
	{
		player camerasetlookat(player.angles);
		var_6775ae79 = player getcamangles();
		if(!isdefined(var_6775ae79))
		{
			var_6775ae79 = (isdefined(player.angles) ? player.angles : (0, 0, 0));
		}
	}
	cameravec = anglestoforward(var_6775ae79);
	camerapos = var_c9c16c96 - ((isdefined(level.var_427d6976.("insertionCameraFollowDistance")) ? level.var_427d6976.("insertionCameraFollowDistance") : 1600) * cameravec);
	player camerasetposition(camerapos);
	player camerasetlookat(var_6775ae79);
	player function_36b630a3(0);
	player callback::add_entity_callback(#"freefall", &function_c9a18304);
	player callback::add_entity_callback(#"on_start_gametype", &function_c9a18304);
}

/*
	Name: function_84ba1c41
	Namespace: player_insertion
	Checksum: 0x486A7103
	Offset: 0x1830
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_84ba1c41(local_client_num, eventstruct)
{
	if(!eventstruct.parachute)
	{
		function_f9e5d4d3(local_client_num, eventstruct);
	}
}

/*
	Name: function_f9e5d4d3
	Namespace: player_insertion
	Checksum: 0x3236791D
	Offset: 0x1878
	Size: 0x94
	Parameters: 2
	Flags: None
*/
function function_f9e5d4d3(local_client_num, eventstruct)
{
	if(is_true(self.infiltrating))
	{
		self.infiltrating = undefined;
		self callback::function_52ac9652(#"parachute", &function_84ba1c41);
		self callback::function_52ac9652(#"death", &function_f9e5d4d3);
	}
}

/*
	Name: function_ec94346
	Namespace: player_insertion
	Checksum: 0x193CEB54
	Offset: 0x1918
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_ec94346()
{
	if(!is_true(self.infiltrating))
	{
		self.infiltrating = 1;
		self callback::add_entity_callback(#"parachute", &function_84ba1c41);
		self callback::add_entity_callback(#"death", &function_f9e5d4d3);
	}
}

/*
	Name: function_c9a18304
	Namespace: player_insertion
	Checksum: 0x198DE862
	Offset: 0x19B0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_c9a18304(local_client_num, eventstruct)
{
	if(eventstruct.freefall)
	{
		self function_36b630a3(1);
	}
}

/*
	Name: function_73a03a18
	Namespace: player_insertion
	Checksum: 0xAED483
	Offset: 0x19F8
	Size: 0xCC
	Parameters: 7
	Flags: None
*/
function function_73a03a18(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_1e7db62f = function_a4c14f8c(bwastimejump);
	if(!isdefined(level.var_a3ede655))
	{
		level.var_a3ede655 = [];
	}
	else if(!isarray(level.var_a3ede655))
	{
		level.var_a3ede655 = array(level.var_a3ede655);
	}
	level.var_a3ede655[var_1e7db62f] = self;
}

/*
	Name: function_f1c37912
	Namespace: player_insertion
	Checksum: 0xD0EA3809
	Offset: 0x1AD0
	Size: 0xCC
	Parameters: 7
	Flags: None
*/
function function_f1c37912(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_1e7db62f = function_a4c14f8c(bwastimejump);
	if(!isdefined(level.var_697988b1))
	{
		level.var_697988b1 = [];
	}
	else if(!isarray(level.var_697988b1))
	{
		level.var_697988b1 = array(level.var_697988b1);
	}
	level.var_697988b1[var_1e7db62f] = self;
}

/*
	Name: function_65cca2e1
	Namespace: player_insertion
	Checksum: 0xDCC17705
	Offset: 0x1BA8
	Size: 0x264
	Parameters: 2
	Flags: None
*/
function function_65cca2e1(localclientnum, var_1e7db62f)
{
	if(is_true(level.var_a3c42585))
	{
		return;
	}
	self notify(#"hash_503cb9224ca331c" + var_1e7db62f);
	self endon(#"hash_503cb9224ca331c" + var_1e7db62f);
	while(true)
	{
		if(isdefined(level.var_a3ede655) && isdefined(level.var_a3ede655[var_1e7db62f]) && isdefined(level.var_697988b1) && isdefined(level.var_697988b1[var_1e7db62f]))
		{
			break;
		}
		waitframe(1);
	}
	jump_point = level.var_a3ede655[var_1e7db62f].origin;
	force_drop_point = level.var_697988b1[var_1e7db62f].origin;
	direction = anglestoforward(level.var_a3ede655[var_1e7db62f].angles);
	start_point = jump_point - (direction * 150000);
	end_point = force_drop_point + (direction * 150000);
	var_5a20cc9d = createuimodel(function_1df4c3b0(localclientnum, #"hud_items"), "freeFallStartAltitude");
	setuimodelvalue(var_5a20cc9d, jump_point[2]);
	var_7eb8f61a = (isdefined(getgametypesetting(#"wzplayerinsertiontypeindex")) ? getgametypesetting(#"wzplayerinsertiontypeindex") : 0);
	if(var_7eb8f61a == 0 || var_7eb8f61a == 3)
	{
		function_4dfe3112(localclientnum, var_1e7db62f, start_point, end_point, jump_point, force_drop_point);
	}
}

/*
	Name: function_4da7bee9
	Namespace: player_insertion
	Checksum: 0xEF2A27F5
	Offset: 0x1E18
	Size: 0x15C
	Parameters: 7
	Flags: None
*/
function function_4da7bee9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(is_true(level.var_a3c42585))
	{
		return;
	}
	for(var_1e7db62f = 0; var_1e7db62f < 2; var_1e7db62f++)
	{
		oldvalue = binitialsnap & 1;
		value = fieldname & 1;
		fieldname = fieldname >> 1;
		binitialsnap = binitialsnap >> 1;
		if(oldvalue == value && !bwastimejump)
		{
			continue;
		}
		if(value)
		{
			level thread function_65cca2e1(bnewent, var_1e7db62f);
			continue;
		}
		self notify(#"hash_503cb9224ca331c" + var_1e7db62f);
		function_c8ae746a(bnewent, var_1e7db62f, 0);
		function_71fec565(bnewent, var_1e7db62f);
	}
}

/*
	Name: inside_infiltration_vehicle
	Namespace: player_insertion
	Checksum: 0xF47ACC54
	Offset: 0x1F80
	Size: 0x140
	Parameters: 7
	Flags: None
*/
function inside_infiltration_vehicle(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"hud_items"), "infiltrationVehicle"), bwastimejump);
	if(bwastimejump)
	{
		if(!is_true(level.var_a3c42585))
		{
			self function_811196d1(1);
		}
	}
	else
	{
		self notify(#"hash_70483f3d5a2f87f0");
		if(!is_true(level.var_a3c42585))
		{
			self function_811196d1(0);
		}
		self camerasetupdatecallback();
		level notify(#"hash_413d64e47311dcf8");
	}
}

/*
	Name: function_c9851cb
	Namespace: player_insertion
	Checksum: 0x91DA6216
	Offset: 0x20C8
	Size: 0x84
	Parameters: 7
	Flags: Private
*/
function private function_c9851cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self codeplaypostfxbundle("pstfx_heat_distortion");
	}
	else
	{
		self codestoppostfxbundle("pstfx_heat_distortion");
	}
}

/*
	Name: function_9767bbd8
	Namespace: player_insertion
	Checksum: 0xBD6C58D
	Offset: 0x2158
	Size: 0x64
	Parameters: 7
	Flags: Private
*/
function private function_9767bbd8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	playfx(bwastimejump, #"hash_3697b0b0d7cd6874", self.origin);
}

/*
	Name: function_c0c7c219
	Namespace: player_insertion
	Checksum: 0x595B1B0E
	Offset: 0x21C8
	Size: 0x132
	Parameters: 7
	Flags: Private
*/
function private function_c0c7c219(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		player = function_5c10bd79(fieldname);
		player function_ec94346();
		if(isdefined(self.var_227361c6))
		{
			stopfx(fieldname, self.var_227361c6);
		}
		self.var_227361c6 = playfx(fieldname, #"hash_28b5c6ccaabb4afe", self.origin);
	}
	else
	{
		if(isdefined(self.var_227361c6))
		{
			stopfx(fieldname, self.var_227361c6);
		}
		self.var_227361c6 = playfx(fieldname, #"hash_45086f1ffcabbf47", self.origin);
	}
}

