#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using script_305d57cf0618009d;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace bot_insertion;

/*
	Name: function_c70dd777
	Namespace: bot_insertion
	Checksum: 0xBA52EBF5
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c70dd777()
{
	level notify(1035002659);
}

/*
	Name: __init__system__
	Namespace: bot_insertion
	Checksum: 0x38DFFF6F
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"bot_insertion", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: bot_insertion
	Checksum: 0xFA7AE8D6
	Offset: 0x110
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::add_callback(#"freefall", &function_c9a18304);
}

/*
	Name: function_b7de760d
	Namespace: bot_insertion
	Checksum: 0xF41FB86D
	Offset: 0x150
	Size: 0x10E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b7de760d()
{
	foreach(insertion in level.insertions)
	{
		player_insertion::function_a5fd9aa8(insertion);
		foreach(player in insertion.players)
		{
			if(player == self)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_58a44f22
	Namespace: bot_insertion
	Checksum: 0x673C4E40
	Offset: 0x268
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_58a44f22()
{
	teammates = getplayers(self.team);
	foreach(player in teammates)
	{
		if(isplayer(player) && !isbot(player) && player function_b7de760d())
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_9ea8f9d6
	Namespace: bot_insertion
	Checksum: 0xF34AF814
	Offset: 0x358
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9ea8f9d6()
{
	teammates = getplayers(self.team);
	foreach(player in teammates)
	{
		if(isplayer(player) && !isbot(player) && player function_b7de760d())
		{
			return player;
		}
	}
	return undefined;
}

/*
	Name: function_a4f516ef
	Namespace: bot_insertion
	Checksum: 0x5326733F
	Offset: 0x448
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function function_a4f516ef()
{
	self endon(#"death", #"disconnect");
	/#
		if(getdvarint(#"scr_disable_infiltration", 0))
		{
			return;
		}
	#/
	if(!self flag::get(#"hash_287397edba8966f9"))
	{
		var_f9664338 = [1:#"hash_224cb97b8f682317", 0:#"hash_287397edba8966f9"];
		self flag::wait_till_any(var_f9664338);
	}
	if(function_58a44f22())
	{
		waitresult = undefined;
		waitresult = self waittill(#"hash_3a41cbe85bdb81e1", #"hash_224cb97b8f682317");
		if(waitresult._notify != #"hash_224cb97b8f682317")
		{
			self flag::wait_till_timeout(function_8ed212d(), #"hash_224cb97b8f682317");
		}
	}
	else if(isdefined(self.var_33a2e995))
	{
		self flag::wait_till_timeout(self.var_33a2e995, #"hash_224cb97b8f682317");
	}
}

/*
	Name: function_2ed2a1bb
	Namespace: bot_insertion
	Checksum: 0xD139E13E
	Offset: 0x5E0
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function function_2ed2a1bb(max)
{
	random = randomfloat(1);
	return ((random * random) * random) * max;
}

/*
	Name: function_9526ce62
	Namespace: bot_insertion
	Checksum: 0x3F58049B
	Offset: 0x628
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_9526ce62(max)
{
	return function_2ed2a1bb(max);
}

/*
	Name: function_8ed212d
	Namespace: bot_insertion
	Checksum: 0xD7D14A68
	Offset: 0x658
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_8ed212d()
{
	return 1 + function_2ed2a1bb(3);
}

/*
	Name: function_24ca8ecf
	Namespace: bot_insertion
	Checksum: 0x781346A5
	Offset: 0x688
	Size: 0x31E
	Parameters: 1
	Flags: Linked
*/
function function_24ca8ecf(insertion)
{
	/#
		assert(isstruct(insertion));
	#/
	if(!isdefined(insertion.start_point) || !isdefined(insertion.end_point))
	{
		return;
	}
	bots = [];
	foreach(player in insertion.players)
	{
		if(isbot(player))
		{
			if(!isdefined(bots[player.team]))
			{
				bots[player.team] = [];
			}
			if(!isdefined(bots[player.team]))
			{
				bots[player.team] = [];
			}
			else if(!isarray(bots[player.team]))
			{
				bots[player.team] = array(bots[player.team]);
			}
			bots[player.team][bots[player.team].size] = player;
		}
	}
	distance = distance2d(insertion.start_point, insertion.end_point);
	var_5d59bc67 = 17.6 * level.var_c7f8ccf6;
	var_ef4bfcd8 = distance / var_5d59bc67;
	foreach(team in bots)
	{
		var_28cd9792 = function_9526ce62(var_ef4bfcd8);
		foreach(bot in team)
		{
			bot.var_33a2e995 = var_28cd9792 + function_8ed212d();
		}
	}
}

/*
	Name: function_d7ba3d0b
	Namespace: bot_insertion
	Checksum: 0xBC8C063A
	Offset: 0x9B0
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function function_d7ba3d0b()
{
	self thread function_39c5371e();
	return function_9526ce62(5);
}

/*
	Name: function_9699dc95
	Namespace: bot_insertion
	Checksum: 0xC992D4F4
	Offset: 0x9F0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_9699dc95()
{
	self thread function_39c5371e();
}

/*
	Name: function_39c5371e
	Namespace: bot_insertion
	Checksum: 0x80F724D1
	Offset: 0xA18
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_39c5371e()
{
}

/*
	Name: function_8f2f3bcd
	Namespace: bot_insertion
	Checksum: 0xE7519C6B
	Offset: 0xA28
	Size: 0x8A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8f2f3bcd()
{
	center = death_circle::function_b980b4ca();
	radius = death_circle::function_f8dae197() * 0.75;
	goal = center + (anglestoforward((0, randomint(360), 0)) * radius);
	return goal;
}

/*
	Name: function_d26744ff
	Namespace: bot_insertion
	Checksum: 0xE0DDEAC2
	Offset: 0xAC0
	Size: 0xC4
	Parameters: 2
	Flags: Linked
*/
function function_d26744ff(target_point, lead_player)
{
	direction = vectornormalize(lead_player - self.origin);
	goal_angles = vectortoangles(direction);
	if(goal_angles[0] < 45)
	{
		distance = distance(lead_player, self.origin);
		if(distance > 20000)
		{
			goal_angles = (0, goal_angles[1], 0);
		}
	}
	return goal_angles;
}

/*
	Name: function_233a1027
	Namespace: bot_insertion
	Checksum: 0xBA92E2E0
	Offset: 0xB90
	Size: 0x66
	Parameters: 2
	Flags: Linked
*/
function function_233a1027(target_point, lead_player)
{
	if(lead_player isonground())
	{
		return self function_d26744ff(lead_player.origin, lead_player);
	}
	goal_angles = lead_player.angles;
	return goal_angles;
}

/*
	Name: function_13ba9cec
	Namespace: bot_insertion
	Checksum: 0x988C16A1
	Offset: 0xC00
	Size: 0x1D0
	Parameters: 3
	Flags: Linked
*/
function function_13ba9cec(target_point, lead_player, var_282c0a8e)
{
	/#
		assert(isdefined(var_282c0a8e));
	#/
	if(self isonground())
	{
		return false;
	}
	goal_angles = [[var_282c0a8e]](target_point, lead_player);
	var_8fbb46cd = vectornormalize(self getvelocity());
	var_e0db94ca = vectortoangles(var_8fbb46cd);
	angle_delta = goal_angles - var_e0db94ca;
	var_ce2f4ce0 = function_dac81c9a(angleclamp180(angle_delta[0]));
	angle_yaw = function_dac81c9a(angleclamp180(angle_delta[1]));
	angles = var_e0db94ca + (var_ce2f4ce0, angle_yaw, 0);
	angles = (angleclamp180(angles[0]), angleclamp180(angles[1]), 0);
	self botsetmoveangles(angles);
	self botsetlookangles(angles);
	return true;
}

/*
	Name: function_c9a18304
	Namespace: bot_insertion
	Checksum: 0x3342C9F
	Offset: 0xDD8
	Size: 0x254
	Parameters: 1
	Flags: Linked
*/
function function_c9a18304(params)
{
	if(!isarray(level.insertions))
	{
		return;
	}
	if(!isbot(self))
	{
		return;
	}
	if(params.freefall === 1)
	{
		self notify("11c4495a170177d9");
		self endon("11c4495a170177d9");
		self endon(#"death", #"disconnect");
		waitframe(1);
		self botsetmovemagnitude(1);
		target_point = function_8f2f3bcd();
		direction = vectornormalize(target_point - self.origin);
		angles = vectortoangles(direction);
		angles = (90, angles[1], 0);
		self botsetmoveangles(angles);
		self botsetlookangles(angles);
		while(true)
		{
			if(length(self getvelocity()) * 0.05681818 > 110)
			{
				break;
			}
			wait(1);
		}
		var_26a66f9d = &function_d26744ff;
		var_2706b530 = function_9ea8f9d6();
		if(isdefined(var_2706b530))
		{
			var_26a66f9d = &function_233a1027;
		}
		while(true)
		{
			if(!self function_13ba9cec(target_point, var_2706b530, var_26a66f9d))
			{
				return;
			}
			waitframe(1);
		}
	}
	else
	{
		self botsetmovemagnitude(0);
	}
}

/*
	Name: function_dac81c9a
	Namespace: bot_insertion
	Checksum: 0xD8A0F33B
	Offset: 0x1038
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private function_dac81c9a(angle_delta)
{
	max_delta = getdvarint(#"hash_11e45cd7d81b76c", 30);
	if(angle_delta > 0)
	{
		return math::clamp(max_delta, angle_delta * -1, angle_delta);
	}
	return math::clamp(max_delta * -1, angle_delta, angle_delta * -1);
}

