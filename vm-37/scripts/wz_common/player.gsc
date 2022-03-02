#using script_bf0c2c69ce5745e;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_2d81529e;

/*
	Name: function_89f2df9
	Namespace: namespace_2d81529e
	Checksum: 0x4F442979
	Offset: 0x78
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_6d455d07ee9a592c", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_2d81529e
	Checksum: 0x7C6DD44
	Offset: 0xC0
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: namespace_2d81529e
	Checksum: 0xAE13FF4B
	Offset: 0xF0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	self callback::function_20263b9e(&function_20263b9e);
}

/*
	Name: function_20263b9e
	Namespace: namespace_2d81529e
	Checksum: 0xBE1EE67D
	Offset: 0x120
	Size: 0xA2
	Parameters: 1
	Flags: None
*/
function function_20263b9e(params)
{
	grenade = params.projectile;
	weapon = params.weapon;
	switch(weapon.name)
	{
		case "flare_gun":
		{
			grenade function_4861487f(weapon, self);
			grenade thread function_cd8ee3c5();
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_4861487f
	Namespace: namespace_2d81529e
	Checksum: 0xFD1DFEDF
	Offset: 0x1D0
	Size: 0x56
	Parameters: 2
	Flags: None
*/
function function_4861487f(weapon, player)
{
	if(!isdefined(self))
	{
		return;
	}
	if(!self grenade_safe_to_throw(player, weapon))
	{
		self thread makegrenadedudanddestroy();
		return;
	}
}

/*
	Name: function_cd8ee3c5
	Namespace: namespace_2d81529e
	Checksum: 0x15135B62
	Offset: 0x230
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_cd8ee3c5()
{
	self endon(#"grenade_dud");
	waitresult = undefined;
	waitresult = self waittill(#"explode", #"death");
	if(waitresult._notify == #"explode")
	{
		trace = groundtrace(waitresult.position, waitresult.position + (vectorscale((0, 0, -1), 20000)), 0, self, 0);
		if(isdefined(trace[#"position"]) && trace[#"surfacetype"] != #"none")
		{
			org = trace[#"position"];
			namespace_8f74625a::function_1b48df6d(org, 1);
		}
	}
}

/*
	Name: grenade_safe_to_throw
	Namespace: namespace_2d81529e
	Checksum: 0xF646C058
	Offset: 0x360
	Size: 0x18
	Parameters: 2
	Flags: None
*/
function grenade_safe_to_throw(player, weapon)
{
	return true;
}

/*
	Name: makegrenadedudanddestroy
	Namespace: namespace_2d81529e
	Checksum: 0x3DC0EC2F
	Offset: 0x380
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function makegrenadedudanddestroy()
{
	self endon(#"death");
	self notify(#"grenade_dud");
	self makegrenadedud();
	wait(3);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: debug_star
	Namespace: namespace_2d81529e
	Checksum: 0x57E3ECE3
	Offset: 0x3F0
	Size: 0x7C
	Parameters: 3
	Flags: None
*/
function debug_star(origin, seconds, color)
{
	/#
		if(!isdefined(seconds))
		{
			seconds = 1;
		}
		if(!isdefined(color))
		{
			color = (1, 0, 0);
		}
		frames = int(20 * seconds);
		debugstar(origin, frames, color);
	#/
}

