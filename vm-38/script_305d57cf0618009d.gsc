#using script_d9b5c8b1ad38ef5;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_3088f362;

/*
	Name: function_3fbd0a49
	Namespace: namespace_3088f362
	Checksum: 0xB1725341
	Offset: 0x2B0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3fbd0a49()
{
	level notify(811336963);
}

#namespace namespace_67838d10;

/*
	Name: function_63977a98
	Namespace: namespace_67838d10
	Checksum: 0x4A79D337
	Offset: 0x2D0
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_63977a98(newtime)
{
	level.var_8367fa0f = newtime;
}

/*
	Name: function_d28162a2
	Namespace: namespace_67838d10
	Checksum: 0x798449B6
	Offset: 0x2F8
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_d28162a2(newtime)
{
	level.var_ab0cc070 = newtime;
}

/*
	Name: function_1a50e8a5
	Namespace: namespace_67838d10
	Checksum: 0xC02753A9
	Offset: 0x320
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_1a50e8a5(newtime)
{
	level.var_b28c6a29 = newtime;
}

/*
	Name: function_a21d9dc
	Namespace: namespace_67838d10
	Checksum: 0x126D7950
	Offset: 0x348
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_a21d9dc(insertion)
{
	insertion flag::clear(#"hash_60fcdd11812a0134");
	insertion flag::clear(#"hash_122f326d72f4c884");
	insertion flag::clear(#"hash_5a3e17fbc33cdc86");
	insertion flag::clear(#"hash_3dc9cb68998d9dfd");
	function_bb93a8cd(insertion);
}

/*
	Name: function_bb93a8cd
	Namespace: namespace_67838d10
	Checksum: 0x9CC1CE0A
	Offset: 0x3F8
	Size: 0x196
	Parameters: 1
	Flags: Linked
*/
function function_bb93a8cd(insertion)
{
	var_f90ae72e = (isdefined(getgametypesetting(#"hash_731988b03dc6ee17")) ? getgametypesetting(#"hash_731988b03dc6ee17") : 1);
	if(var_f90ae72e > 0)
	{
		activeplayers = function_a1ef346b();
		var_2c34761b = [];
		otherplayers = [];
		foreach(player in activeplayers)
		{
			if(function_20cba65e(player) == insertion.index)
			{
				var_2c34761b[var_2c34761b.size] = player;
				continue;
			}
			otherplayers[otherplayers.size] = player;
		}
		insertion.players = var_2c34761b;
		insertion.otherplayers = otherplayers;
	}
	else
	{
		insertion.players = function_a1ef346b();
		insertion.otherplayers = [];
	}
}

/*
	Name: function_dd34168c
	Namespace: namespace_67838d10
	Checksum: 0xA34BDE96
	Offset: 0x598
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_dd34168c(insertion, flag)
{
	insertion flag::set(flag);
	if(function_df47b31b(flag))
	{
		level flag::set(flag);
	}
}

/*
	Name: function_df47b31b
	Namespace: namespace_67838d10
	Checksum: 0xA26FC475
	Offset: 0x600
	Size: 0x76
	Parameters: 1
	Flags: Linked, Private
*/
function private function_df47b31b(flag)
{
	for(index = 0; index < level.insertions.size; index++)
	{
		insertion = level.insertions[index];
		if(!insertion flag::get(flag))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_1e4302d0
	Namespace: namespace_67838d10
	Checksum: 0x6C393617
	Offset: 0x680
	Size: 0x5A
	Parameters: 2
	Flags: Linked
*/
function function_1e4302d0(value, index)
{
	/#
		assert(index < 2);
	#/
	newvalue = (value << 1) | (index & 1);
	return newvalue;
}

/*
	Name: function_fd3c1bcc
	Namespace: namespace_67838d10
	Checksum: 0x3909C76F
	Offset: 0x6E8
	Size: 0xD8
	Parameters: 3
	Flags: Linked, Private
*/
function private function_fd3c1bcc(start, end, default_val)
{
	/#
		assert(isvec(default_val));
	#/
	trace = worldtrace(start, end);
	if(trace[#"fraction"] < 1)
	{
		/#
			assert(isvec(trace[#"position"]));
		#/
		return trace[#"position"];
	}
	return default_val;
}

/*
	Name: function_a5fd9aa8
	Namespace: namespace_67838d10
	Checksum: 0x730BD403
	Offset: 0x7D0
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_a5fd9aa8(insertion)
{
	/#
		assert(isstruct(insertion));
	#/
	arrayremovevalue(insertion.players, undefined, 0);
	if(isdefined(insertion.otherplayers))
	{
		arrayremovevalue(insertion.otherplayers, undefined, 0);
	}
}

/*
	Name: function_70dd0500
	Namespace: namespace_67838d10
	Checksum: 0xC6B0F2A7
	Offset: 0x860
	Size: 0x88
	Parameters: 0
	Flags: Linked
*/
function function_70dd0500()
{
	height = 0;
	/#
		height = getdvarint(#"hash_37d751a610a5c2fc", 0);
	#/
	if(height == 0)
	{
		height = (isdefined(level.var_427d6976.("insertionHeightAboveCenter")) ? level.var_427d6976.("insertionHeightAboveCenter") : 0);
	}
	return height;
}

/*
	Name: function_3ca86964
	Namespace: namespace_67838d10
	Checksum: 0x7E8BC24C
	Offset: 0x8F0
	Size: 0x192
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3ca86964(var_1d83d08d)
{
	var_6024133d = getentarray("map_corner", "targetname");
	mins = vectorscale((-1, -1, 0), 150000);
	maxs = vectorscale((1, 1, 0), 150000);
	if(var_6024133d.size == 0)
	{
		return {#end:maxs, #start:mins};
	}
	var_f5663ad6 = var_6024133d[0].origin;
	var_4ffef006 = var_6024133d[1].origin;
	mins = (min(var_f5663ad6[0], var_4ffef006[0]), min(var_f5663ad6[1], var_4ffef006[1]), 150000);
	maxs = (max(var_f5663ad6[0], var_4ffef006[0]), max(var_f5663ad6[1], var_4ffef006[1]), 150000);
	return function_24531a26(var_1d83d08d.start, var_1d83d08d.end, mins, maxs);
}

/*
	Name: function_9ddb4115
	Namespace: namespace_67838d10
	Checksum: 0xC42385EA
	Offset: 0xA90
	Size: 0x26A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9ddb4115(var_1d83d08d)
{
	/#
		assert(isstruct(var_1d83d08d));
	#/
	/#
		assert(isdefined(var_1d83d08d.start));
	#/
	/#
		assert(isdefined(var_1d83d08d.end));
	#/
	if(isdefined(level.var_fb91af8) && level.var_fb91af8.size > 0)
	{
		initcircle = level.var_fb91af8[0];
		var_ddab8e6c = var_1d83d08d.start;
		var_dd00b78e = vectornormalize(var_1d83d08d.end - var_1d83d08d.start);
		var_164fe5c9 = distance2dsquared(var_ddab8e6c, initcircle.origin);
		while(var_164fe5c9 > sqr(initcircle.radius))
		{
			var_ddab8e6c = var_ddab8e6c + (var_dd00b78e * 1000);
			var_c820832 = distance2dsquared(var_ddab8e6c, initcircle.origin);
			if(var_c820832 > var_164fe5c9)
			{
				break;
			}
			var_164fe5c9 = var_c820832;
		}
		var_1d83d08d.start = var_ddab8e6c;
		var_1b8e09d2 = var_1d83d08d.end;
		var_6d773f9e = var_dd00b78e * -1;
		var_164fe5c9 = distance2dsquared(var_1b8e09d2, initcircle.origin);
		while(var_164fe5c9 > sqr(initcircle.radius))
		{
			var_1b8e09d2 = var_1b8e09d2 + (var_6d773f9e * 1000);
			var_c820832 = distance2dsquared(var_1b8e09d2, initcircle.origin);
			if(var_c820832 > var_164fe5c9)
			{
				break;
			}
			var_164fe5c9 = var_c820832;
		}
		var_1d83d08d.end = var_1b8e09d2;
	}
}

/*
	Name: function_ea1ad421
	Namespace: namespace_67838d10
	Checksum: 0xACA8AB64
	Offset: 0xD08
	Size: 0x168
	Parameters: 3
	Flags: Linked, Private
*/
function private function_ea1ad421(insertion, start, end)
{
	/#
		assert(isstruct(insertion));
	#/
	/#
		assert(isvec(start));
	#/
	/#
		assert(isvec(end));
	#/
	direction = end - start;
	direction = vectornormalize(direction);
	step = (isdefined(level.var_427d6976.("insertionOOBCheckStepSize")) ? level.var_427d6976.("insertionOOBCheckStepSize") : 1000);
	/#
		assert(!oob::chr_party(start));
	#/
	point = function_f31cf3bb(start, direction, step, 0);
	if(!isdefined(point))
	{
		return end;
	}
	return point;
}

/*
	Name: function_f31cf3bb
	Namespace: namespace_67838d10
	Checksum: 0x1B6D96C1
	Offset: 0xE78
	Size: 0x128
	Parameters: 5
	Flags: Linked
*/
function function_f31cf3bb(point, direction, step, depth, var_94a1d56d)
{
	if(!isdefined(var_94a1d56d))
	{
		var_94a1d56d = 5;
	}
	var_23685c5 = point;
	var_19132446 = 50;
	if(step < var_19132446)
	{
		return var_23685c5;
	}
	count = 0;
	fail_safe = 50;
	while(true)
	{
		if(depth > var_94a1d56d || count > fail_safe)
		{
			return undefined;
		}
		new_point = var_23685c5 + (direction * step);
		touching = oob::chr_party(new_point);
		/#
		#/
		if(touching)
		{
			depth++;
			return function_f31cf3bb(var_23685c5, direction, step / 2, depth, var_94a1d56d);
		}
		count++;
		var_23685c5 = new_point;
	}
}

/*
	Name: function_9368af66
	Namespace: namespace_67838d10
	Checksum: 0x689134D4
	Offset: 0xFA8
	Size: 0xC4
	Parameters: 2
	Flags: Linked
*/
function function_9368af66(insertion, player)
{
	/#
		assert(isstruct(insertion));
	#/
	/#
		assert(isplayer(player));
	#/
	insertion.var_ef59e360 setvisibletoplayer(player);
	insertion.var_ef59e360 clientfield::set("infiltration_ent", function_1e4302d0(1, insertion.index));
}

/*
	Name: function_d53a8c5b
	Namespace: namespace_67838d10
	Checksum: 0xAF2F260E
	Offset: 0x1078
	Size: 0x2DC
	Parameters: 4
	Flags: Linked
*/
function function_d53a8c5b(insertion, fly_over_point, var_59526dd5, offset)
{
	/#
		assert(isstruct(insertion));
	#/
	/#
		assert(isvec(fly_over_point));
	#/
	/#
		assert(isint(var_59526dd5) || isfloat(var_59526dd5));
	#/
	insertion.fly_over_point = fly_over_point;
	insertion.var_59526dd5 = var_59526dd5;
	var_872f085f = (0, var_59526dd5, 0);
	direction = anglestoforward(var_872f085f);
	direction = vectornormalize(direction);
	var_7c712437 = fly_over_point + (anglestoright(var_872f085f) * offset);
	var_1d83d08d = {#end:var_7c712437 + (direction * 150000), #start:var_7c712437 + (direction * 150000)};
	result = function_3ca86964(var_1d83d08d);
	var_1d83d08d.start = function_fd3c1bcc(fly_over_point, var_1d83d08d.start, result.start);
	var_1d83d08d.end = function_fd3c1bcc(fly_over_point, var_1d83d08d.end, result.end);
	if(is_true(getgametypesetting(#"hash_82c01ef004ff0a3")))
	{
		function_9ddb4115(var_1d83d08d);
	}
	var_1d83d08d.start = function_ea1ad421(insertion, fly_over_point, var_1d83d08d.start);
	var_1d83d08d.end = function_ea1ad421(insertion, fly_over_point, var_1d83d08d.end);
	fly_path(insertion, var_1d83d08d, var_7c712437, var_59526dd5);
	insertion flag::set(#"hash_4e5fc66b9144a5c8");
}

/*
	Name: function_e04b0ea8
	Namespace: namespace_67838d10
	Checksum: 0x651AFB54
	Offset: 0x1360
	Size: 0x1AC
	Parameters: 5
	Flags: Linked, Private
*/
function private function_e04b0ea8(insertion, start_point, var_872f085f, var_37362e08, var_f69b665b)
{
	/#
		assert(isstruct(insertion));
	#/
	direction = anglestoforward(var_872f085f);
	insertion.var_b686c9d = spawn("script_model", start_point + (direction * var_37362e08));
	insertion.var_b686c9d.targetname = "insertion_jump";
	insertion.var_b686c9d.angles = var_872f085f;
	insertion.var_d908905e = spawn("script_model", start_point + (direction * var_f69b665b));
	insertion.var_d908905e.targetname = "insertion_force";
	insertion.var_d908905e.angles = var_872f085f;
	waitframe(1);
	insertion.var_b686c9d clientfield::set("infiltration_jump_point", function_1e4302d0(1, insertion.index));
	insertion.var_d908905e clientfield::set("infiltration_force_drop_point", function_1e4302d0(1, insertion.index));
}

/*
	Name: function_1db63266
	Namespace: namespace_67838d10
	Checksum: 0xCEA2A043
	Offset: 0x1518
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_1db63266()
{
	/#
		assert(isplayer(self));
	#/
	var_5ed0195b = function_20cba65e(self);
	insertion = level.insertions[var_5ed0195b];
	if(isdefined(insertion) && isdefined(insertion.var_ef59e360))
	{
		function_9368af66(insertion, self);
	}
}

/*
	Name: fly_path
	Namespace: namespace_67838d10
	Checksum: 0xD1D66C4F
	Offset: 0x15C0
	Size: 0x914
	Parameters: 4
	Flags: Linked, Private
*/
function private fly_path(insertion, var_1d83d08d, fly_over_point, var_59526dd5)
{
	/#
		assert(isstruct(insertion));
	#/
	var_872f085f = (0, var_59526dd5, 0);
	direction = anglestoforward(var_872f085f);
	direction = vectornormalize(direction);
	var_b828343b = (isdefined(level.var_427d6976.("insertionDropStartOffset")) ? level.var_427d6976.("insertionDropStartOffset") : 5000);
	var_59141f3d = (isdefined(level.var_427d6976.("insertionDropEndOffset")) ? level.var_427d6976.("insertionDropEndOffset") : 15000);
	var_82b0af47 = var_1d83d08d.start + (var_b828343b * direction);
	var_ee07e61a = var_1d83d08d.end - (var_59141f3d * direction);
	var_5d59bc67 = 17.6 * level.var_c7f8ccf6;
	var_858edbc2 = var_5d59bc67 * (isdefined(level.var_427d6976.("insertionPreDropTime")) ? level.var_427d6976.("insertionPreDropTime") : 10);
	var_abb846da = var_5d59bc67 * (isdefined(level.var_427d6976.("insertionPostDropTime")) ? level.var_427d6976.("insertionPostDropTime") : 20);
	startpoint = var_82b0af47 - (var_858edbc2 * direction);
	endpoint = var_ee07e61a + (var_abb846da * direction);
	/#
		if(getdvarint(#"hash_64f65224ca092b2d", 0) == 1)
		{
			offset = vectorscale((0, 0, 1), 300);
			debug_sphere(var_1d83d08d.start + (2 * offset), 45, (0, 1, 1));
			debug_sphere(var_1d83d08d.end + (2 * offset), 45, (1, 1, 0));
			debug_sphere(fly_over_point, 75, (1, 1, 1));
			var_92a2e682 = vectorscale((0, 0, 1), 500);
			debug_sphere(var_82b0af47, 75, (0, 1, 0));
			debug_sphere(var_ee07e61a, 75, (1, 0, 0));
			debug_line(var_82b0af47, var_ee07e61a, (0, 1, 0));
			debug_line(var_82b0af47 + var_92a2e682, var_82b0af47 - var_92a2e682, (0, 1, 0));
			debug_line(var_ee07e61a + var_92a2e682, var_ee07e61a - var_92a2e682, (1, 0, 0));
			debug_sphere(startpoint, 75, (1, 0.5, 0));
			debug_sphere(endpoint, 75, (1, 0.5, 0));
			debug_line(var_82b0af47, startpoint, (1, 0, 0));
			debug_line(var_ee07e61a, endpoint, (1, 0, 0));
			minimaporigins = territory::get_ent_array("", "");
			if(minimaporigins.size == 2)
			{
				maxheight = float(max(minimaporigins[0].origin[2], minimaporigins[1].origin[2]));
				corner1 = (minimaporigins[0].origin[0], minimaporigins[0].origin[1], maxheight);
				corner2 = (minimaporigins[1].origin[0], minimaporigins[1].origin[1], maxheight);
				corner3 = (minimaporigins[0].origin[0], minimaporigins[1].origin[1], maxheight);
				var_c8e1161c = (minimaporigins[1].origin[0], minimaporigins[0].origin[1], maxheight);
				debug_sphere(corner1, 750, (0, 0, 1));
				debug_sphere(corner2, 750, (0, 0, 1));
				debug_line(corner1, corner3, (0, 0, 1));
				debug_line(corner1, var_c8e1161c, (0, 0, 1));
				debug_line(corner2, corner3, (0, 0, 1));
				debug_line(corner2, var_c8e1161c, (0, 0, 1));
			}
		}
	#/
	var_742f9da2 = distance(startpoint, var_82b0af47);
	var_f69b665b = distance(startpoint, var_ee07e61a);
	insertion thread function_e04b0ea8(insertion, startpoint, var_872f085f, var_742f9da2, var_f69b665b);
	currentvalue = level clientfield::get("infiltration_compass");
	newvalue = (1 << insertion.index) | currentvalue;
	level clientfield::set("infiltration_compass", newvalue);
	insertion.start_point = startpoint;
	insertion.end_point = endpoint;
	insertion.var_f253731f = var_872f085f;
	insertion.var_37362e08 = var_742f9da2;
	insertion.var_7743b329 = var_f69b665b;
	if(max((isdefined(getgametypesetting(#"hash_731988b03dc6ee17")) ? getgametypesetting(#"hash_731988b03dc6ee17") : 1), 1) > 1)
	{
		util::wait_network_frame();
		insertion.var_ef59e360 = spawn("script_model", (0, 0, 0));
		insertion.var_ef59e360.targetname = "infil_team_ent";
		insertion.var_ef59e360 setinvisibletoall();
		activeplayers = function_a1ef346b();
		foreach(player in activeplayers)
		{
			if(function_20cba65e(player) == insertion.index)
			{
				function_9368af66(insertion, player);
			}
		}
		callback::on_spawned(&function_1db63266);
	}
}

/*
	Name: function_20cba65e
	Namespace: namespace_67838d10
	Checksum: 0x8E126D63
	Offset: 0x1EE0
	Size: 0x1B4
	Parameters: 1
	Flags: Linked
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
	for(index = 3; index <= level.teamcount; index++)
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
	Name: function_1b105d5b
	Namespace: namespace_67838d10
	Checksum: 0x49D7D7F4
	Offset: 0x20A0
	Size: 0x3DC
	Parameters: 5
	Flags: Linked
*/
function function_1b105d5b(insertion, fadeouttime, var_8e0c0121, fadeintime, rumble)
{
	/#
		assert(isstruct(insertion));
	#/
	if(isdefined(lui::function_e810a527("FullScreenBlack")))
	{
		lui_menu = lui::function_e810a527("FullScreenBlack");
	}
	else
	{
		insertion flag::set(#"hash_3dc9cb68998d9dfd");
		return;
	}
	function_a5fd9aa8(insertion);
	foreach(player in insertion.players)
	{
		if(isdefined(player))
		{
			if(![[ lui_menu ]]->function_7bfd10e6(player))
			{
				[[ lui_menu ]]->open(player);
			}
			[[ lui_menu ]]->function_9cd54463(player, 0);
			[[ lui_menu ]]->function_331f9dd(player, 1);
			[[ lui_menu ]]->function_237ff433(player, int(fadeouttime * 1000));
		}
	}
	wait(fadeouttime + var_8e0c0121);
	insertion flag::wait_till_timeout(2, #"hash_5a3e17fbc33cdc86");
	function_a5fd9aa8(insertion);
	foreach(player in insertion.players)
	{
		if(rumble)
		{
			player function_bc82f900(#"hash_4b19c1d08875f55c");
		}
		if(![[ lui_menu ]]->function_7bfd10e6(player))
		{
			[[ lui_menu ]]->open(player);
		}
		[[ lui_menu ]]->function_9cd54463(player, 1);
		[[ lui_menu ]]->function_331f9dd(player, 0);
		[[ lui_menu ]]->function_237ff433(player, int(fadeintime * 1000));
	}
	wait(fadeintime);
	function_a5fd9aa8(insertion);
	foreach(player in insertion.players)
	{
		[[ lui_menu ]]->close(player);
	}
	insertion flag::set(#"hash_3dc9cb68998d9dfd");
}

/*
	Name: function_9ed051a4
	Namespace: namespace_67838d10
	Checksum: 0xD612261C
	Offset: 0x2488
	Size: 0x49C
	Parameters: 0
	Flags: Linked
*/
function function_9ed051a4()
{
	if(is_true(getgametypesetting(#"hash_2b05db5822050708")))
	{
		return (level.mapcenter[0], level.mapcenter[1], function_70dd0500());
	}
	/#
		assert(isdefined(level.mapbounds.var_8faef7b7));
	#/
	/#
		assert(isdefined(level.mapbounds.var_68fd6e0a));
	#/
	map_center = math::find_box_center(level.mapbounds.var_8faef7b7, level.mapbounds.var_68fd6e0a);
	map_center = map_center + (0, 0, function_70dd0500());
	if(is_true(getgametypesetting(#"hash_7d3d69a0fd97862d")))
	{
		circleindex = (isdefined(getgametypesetting(#"hash_567a288b2ca685f3")) ? getgametypesetting(#"hash_567a288b2ca685f3") : 0);
		if(isdefined(level.var_fb91af8) && level.var_fb91af8.size > 0 && circleindex < level.var_fb91af8.size)
		{
			center = level.var_fb91af8[circleindex].origin;
			return (center[0], center[1], map_center[2]);
		}
	}
	if(isdefined(level.var_cd008cab))
	{
		var_7ed8b321 = [[level.var_cd008cab]]();
		if(isdefined(var_7ed8b321))
		{
			return (var_7ed8b321[0], var_7ed8b321[1], map_center[2]);
		}
	}
	x = (abs(level.mapbounds.var_68fd6e0a[0] - level.mapbounds.var_8faef7b7[0])) * 0.5;
	y = (abs(level.mapbounds.var_68fd6e0a[1] - level.mapbounds.var_8faef7b7[1])) * 0.5;
	var_b97cc2ac = math::clamp(level.var_427d6976.("insertionFlyoverBoundsOuterRatio"), 0, 1);
	var_40f8484d = math::clamp(level.var_427d6976.("insertionFlyoverBoundsInnerRatio"), 0, var_b97cc2ac);
	var_5017ad06 = (x * (var_b97cc2ac - var_40f8484d), y * (var_b97cc2ac - var_40f8484d), 0);
	random_point = (randomfloatrange(var_5017ad06[0] * -1, var_5017ad06[0]), randomfloatrange(var_5017ad06[1] * -1, var_5017ad06[1]), 0);
	if(var_40f8484d > 0)
	{
		random_point = (random_point[0] + (math::sign(random_point[0]) * (x * var_40f8484d)), random_point[1] + (math::sign(random_point[1]) * (y * var_40f8484d)), 0);
	}
	fly_over_point = map_center + random_point;
	fly_over_point = (fly_over_point[0], fly_over_point[1], map_center[2]);
	return fly_over_point;
}

/*
	Name: function_da0c552e
	Namespace: namespace_67838d10
	Checksum: 0x6547F6F2
	Offset: 0x2930
	Size: 0x1D2
	Parameters: 0
	Flags: Linked
*/
function function_da0c552e()
{
	if(is_true(getgametypesetting(#"hash_7d3d69a0fd97862d")))
	{
		circleindex = (isdefined(getgametypesetting(#"hash_567a288b2ca685f3")) ? getgametypesetting(#"hash_567a288b2ca685f3") : 0);
		if(isdefined(level.var_fb91af8) && level.var_fb91af8.size > 0 && circleindex < level.var_fb91af8.size)
		{
			center = level.var_fb91af8[circleindex].origin;
			if(circleindex > 0)
			{
				var_6bf489f1 = level.var_fb91af8[0].origin;
				var_1ce870a0 = vectornormalize(center - var_6bf489f1);
				var_6e3e0ad7 = vectortoangles(var_1ce870a0);
				if(math::cointoss())
				{
					return var_6e3e0ad7[1];
				}
				return var_6e3e0ad7[1] - 180;
			}
		}
	}
	if(isdefined(level.var_fd30a287))
	{
		var_684dfce3 = [[level.var_fd30a287]]();
		if(isdefined(var_684dfce3))
		{
			return var_684dfce3;
		}
	}
	return randomint(360);
}

/*
	Name: function_85635daf
	Namespace: namespace_67838d10
	Checksum: 0x21533913
	Offset: 0x2B10
	Size: 0x74
	Parameters: 3
	Flags: Linked
*/
function function_85635daf(startpoint, total_distance, delta_t)
{
	while(true)
	{
		current_distance = distance(startpoint, self.origin);
		var_3d1b6203 = current_distance / total_distance;
		if(var_3d1b6203 > delta_t)
		{
			return;
		}
		waitframe(1);
	}
}

/*
	Name: function_2b41b403
	Namespace: namespace_67838d10
	Checksum: 0xC648F6AD
	Offset: 0x2B90
	Size: 0x98
	Parameters: 1
	Flags: Linked
*/
function function_2b41b403(velocity)
{
	speed = 17.6 * (isdefined(level.var_427d6976.("insertionPlayerFreefallStartSpeed")) ? level.var_427d6976.("insertionPlayerFreefallStartSpeed") : 0);
	var_4626a28f = (10, self.angles[1], 0);
	return anglestoforward(var_4626a28f) * speed;
}

/*
	Name: function_51350a25
	Namespace: namespace_67838d10
	Checksum: 0x428F1AB0
	Offset: 0x2C30
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_51350a25()
{
	if(level.var_f2814a96 !== 0 && level.var_f2814a96 !== 2)
	{
		return false;
	}
	if(self clientfield::get_to_player("inside_infiltration_vehicle") == 1)
	{
		return true;
	}
	return false;
}

/*
	Name: debug_sphere
	Namespace: namespace_67838d10
	Checksum: 0xA522C6A7
	Offset: 0x2C98
	Size: 0xF4
	Parameters: 5
	Flags: None
*/
function debug_sphere(origin, radius, color, alpha, time)
{
	/#
		if(!isdefined(alpha))
		{
			alpha = 1;
		}
		if(!isdefined(time))
		{
			time = 5000;
		}
		if(getdvarint(#"hash_64f65224ca092b2d", 0) == 1)
		{
			if(!isdefined(color))
			{
				color = (1, 1, 1);
			}
			sides = int(10 * (1 + (int(radius / 100))));
			sphere(origin, radius, color, alpha, 1, sides, time);
		}
	#/
}

/*
	Name: debug_line
	Namespace: namespace_67838d10
	Checksum: 0xA7BBC667
	Offset: 0x2D98
	Size: 0xC4
	Parameters: 5
	Flags: None
*/
function debug_line(from, to, color, time, depthtest)
{
	/#
		if(!isdefined(time))
		{
			time = 5000;
		}
		if(!isdefined(depthtest))
		{
			depthtest = 1;
		}
		if(getdvarint(#"hash_64f65224ca092b2d", 0) == 1)
		{
			if(distancesquared(from, to) < 0.01)
			{
				return;
			}
			line(from, to, color, 1, depthtest, time);
		}
	#/
}

