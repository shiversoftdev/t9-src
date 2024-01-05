#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zipline_player;

/*
	Name: __init__system__
	Namespace: zipline_player
	Checksum: 0x534DF62A
	Offset: 0x128
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zipline_player", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zipline_player
	Checksum: 0x7B845E1A
	Offset: 0x170
	Size: 0x10A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_e02fab68 = struct::get_array("zipline_start", "script_noteworthy");
	/#
		level thread debug_zipline();
	#/
	level.var_8e1ba65f = [];
	level.var_58e84ce5 = getweapon(#"hash_3089757a990e0f6c");
	foreach(a in level.var_e02fab68)
	{
		function_2a1bd467(a);
	}
	level.var_e02fab68 = undefined;
}

/*
	Name: function_e415c864
	Namespace: zipline_player
	Checksum: 0x36125DE0
	Offset: 0x288
	Size: 0x178
	Parameters: 1
	Flags: Linked
*/
function function_e415c864(var_5da09c55)
{
	if(!isdefined(var_5da09c55.radius))
	{
		var_5da09c55.radius = 96;
	}
	if(!isdefined(var_5da09c55.height))
	{
		var_5da09c55.height = 128;
	}
	zipline_trigger = spawn("trigger_radius_use", var_5da09c55.origin + vectorscale((0, 0, 1), 16), 0, var_5da09c55.radius, var_5da09c55.height);
	zipline_trigger.var_5da09c55 = var_5da09c55;
	zipline_trigger triggerignoreteam();
	zipline_trigger setvisibletoall();
	zipline_trigger setteamfortrigger(#"none");
	zipline_trigger setcursorhint("HINT_NOICON");
	hint = #"hash_5ca3696cb6c3bea9";
	zipline_trigger sethintstring(hint);
	zipline_trigger callback::on_trigger(&function_234876c9);
	zipline_trigger function_2e7a1fba();
	return zipline_trigger;
}

/*
	Name: function_77fde59c
	Namespace: zipline_player
	Checksum: 0x47AC692
	Offset: 0x408
	Size: 0xD0
	Parameters: 1
	Flags: None
*/
function function_77fde59c(var_5da09c55)
{
	zipline_trigger = spawn("trigger_radius", var_5da09c55.origin + vectorscale((0, 0, 1), 16), 0, 96, 128);
	zipline_trigger.var_5da09c55 = var_5da09c55;
	zipline_trigger triggerignoreteam();
	zipline_trigger setvisibletoall();
	zipline_trigger setteamfortrigger(#"none");
	zipline_trigger callback::on_trigger(&function_5abc3f1f);
	return zipline_trigger;
}

/*
	Name: function_5abc3f1f
	Namespace: zipline_player
	Checksum: 0xE39CAD2D
	Offset: 0x4E0
	Size: 0x1DC
	Parameters: 1
	Flags: Linked
*/
function function_5abc3f1f(var_df401071)
{
	player = var_df401071.activator;
	if(!isplayer(player))
	{
		return;
	}
	if(player function_e128a831())
	{
		return;
	}
	if(!player function_77d8d4fc())
	{
		return;
	}
	velocity = player getvelocity();
	var_aba19503 = self.var_5da09c55.endstruct.origin - self.var_5da09c55.origin;
	var_aba19503 = vectornormalize(var_aba19503);
	velocitymag = vectordot(var_aba19503, velocity);
	if(velocitymag < getdvarfloat(#"hash_22b8f78d9b451771", 170))
	{
		return;
	}
	angles = player getangles();
	forward = anglestoforward(angles);
	if(vectordot(var_aba19503, forward) < getdvarfloat(#"hash_1d72909e619429dc", -1))
	{
		return;
	}
	player start_zipline(self.var_5da09c55.endstruct.origin, self.var_5da09c55.origin, 1);
}

/*
	Name: function_2a1bd467
	Namespace: zipline_player
	Checksum: 0x727CB547
	Offset: 0x6C8
	Size: 0x8A
	Parameters: 1
	Flags: Linked
*/
function function_2a1bd467(struct)
{
	endstruct = struct::get(struct.target, "targetname");
	if(!isdefined(endstruct))
	{
		return;
	}
	level.var_8e1ba65f[struct.target] = struct;
	struct.endstruct = endstruct;
	struct.inuse = 0;
	struct.trigger = function_e415c864(struct);
}

/*
	Name: function_f8e9f7d7
	Namespace: zipline_player
	Checksum: 0xC02C16BF
	Offset: 0x760
	Size: 0xD6
	Parameters: 2
	Flags: Linked
*/
function function_f8e9f7d7(player, var_5da09c55)
{
	if(is_true(self.laststand))
	{
		return false;
	}
	if(var_5da09c55 getstance() == "prone")
	{
		return false;
	}
	if(!var_5da09c55 function_b59f3ecd())
	{
		return false;
	}
	weapon = var_5da09c55 getcurrentweapon();
	if(killstreaks::is_killstreak_weapon(weapon) && weapon.iscarriedkillstreak !== 1 || weapon === level.weaponnone)
	{
		return false;
	}
	return true;
}

/*
	Name: function_234876c9
	Namespace: zipline_player
	Checksum: 0x2475E0F1
	Offset: 0x840
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_234876c9(var_df401071)
{
	player = var_df401071.activator;
	var_5da09c55 = self.var_5da09c55;
	if(!function_f8e9f7d7(player, var_5da09c55))
	{
		return;
	}
	player start_zipline(var_5da09c55.endstruct.origin, var_5da09c55.origin, 0);
}

/*
	Name: start_zipline
	Namespace: zipline_player
	Checksum: 0xE98DF87B
	Offset: 0x8D0
	Size: 0xCA
	Parameters: 3
	Flags: Linked
*/
function start_zipline(target, start, inair)
{
	var_b527f10 = spawn("script_model", self.origin);
	var_b527f10 setmodel("tag_origin");
	var_b527f10 setowner(self);
	var_b527f10 setweapon(level.var_58e84ce5);
	self function_ac5595ff(target, start, inair, var_b527f10);
	self.var_b527f10 = var_b527f10;
}

/*
	Name: debug_zipline
	Namespace: zipline_player
	Checksum: 0x8B7DC264
	Offset: 0x9A8
	Size: 0x39C
	Parameters: 0
	Flags: None
*/
function debug_zipline()
{
	/#
		if(!getdvarint(#"hash_13a9fb4be8e86e13", 0))
		{
			return;
		}
		ziplines = level.var_e02fab68;
		mapname = util::get_map_name();
		adddebugcommand(("" + mapname) + "");
		while(getdvarint(#"hash_13a9fb4be8e86e13", 0))
		{
			waitframe(1);
			foreach(zipline in ziplines)
			{
				var_86660d95 = zipline.origin;
				print3d(var_86660d95 + vectorscale((0, 0, 1), 16), zipline.targetname, (0, 1, 0));
				sphere(var_86660d95, 4, (0, 1, 0));
				circle(var_86660d95, zipline.radius, (0, 1, 0), 1, 1);
				circle(var_86660d95 + (0, 0, zipline.height), zipline.radius, (0, 1, 0), 1, 1);
				line(var_86660d95, zipline.endstruct.origin, (0, 1, 0));
				if(isdefined(level.var_94f4ca81))
				{
					foreach(dataset in level.var_94f4ca81.dataset)
					{
						foreach(spawn in dataset.spawns)
						{
							spawn_origin = spawn.origin;
							if(distance2dsquared(spawn_origin, var_86660d95) <= 4096)
							{
								cylinder(spawn_origin, spawn_origin + vectorscale((0, 0, 1), 72), 15, (1, 0, 0));
								sphere(spawn_origin, 4, (1, 0, 0));
							}
						}
					}
				}
			}
		}
	#/
}

