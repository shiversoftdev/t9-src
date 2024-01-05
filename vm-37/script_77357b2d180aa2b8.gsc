#using script_2474a362752098d2;
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using script_48e04a393ec6d855;
#using script_50fca1a24ae351;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\animation_shared.gsc;

#namespace namespace_f63bdb08;

/*
	Name: init
	Namespace: namespace_f63bdb08
	Checksum: 0x80F724D1
	Offset: 0x318
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init()
{
}

/*
	Name: function_94c7c0d9
	Namespace: namespace_f63bdb08
	Checksum: 0xA404EA0A
	Offset: 0x328
	Size: 0xCE
	Parameters: 3
	Flags: Linked
*/
function function_94c7c0d9(type, var_5653e2ee, context)
{
	if(!isdefined(type))
	{
		type = 1;
	}
	if(!isdefined(var_5653e2ee))
	{
		var_5653e2ee = 2;
	}
	self solid();
	self.targetname = namespace_ec06fe4a::function_3390402b();
	self.script_noteworthy = "dungeon_door";
	if(context !== 2)
	{
		self disconnectpaths();
	}
	self.type = type;
	self.trigger_offset = (0, 0, 0);
	self.var_d6118311 = var_5653e2ee;
	self.context = context;
}

/*
	Name: function_2a1e5c1f
	Namespace: namespace_f63bdb08
	Checksum: 0xDD2E198E
	Offset: 0x400
	Size: 0x244
	Parameters: 7
	Flags: Linked
*/
function function_2a1e5c1f(origin, angles, modelname, type, var_5653e2ee, context, var_fc5f2aa0)
{
	if(!isdefined(type))
	{
		type = 1;
	}
	if(!isdefined(var_5653e2ee))
	{
		var_5653e2ee = 2;
	}
	door_model = namespace_ec06fe4a::function_e22ae9b3(origin, modelname);
	if(!isdefined(door_model))
	{
		return;
	}
	door_model.angles = angles;
	door_model function_94c7c0d9(type, var_5653e2ee, context);
	if(type === 4)
	{
		door_model.trigger_offset = vectorscale((0, 0, -1), 64);
	}
	if(isdefined(var_fc5f2aa0))
	{
		args = strtok(var_fc5f2aa0, ";");
		if(args.size > 1)
		{
			door_model.var_fc5f2aa0 = {#type:args[1]};
			if(args.size > 2)
			{
				switch(int(args[2]))
				{
					case 1:
					{
						door_model.var_fc5f2aa0.hintstring = #"hash_4bd50984d9d381eb";
						door_model.var_fc5f2aa0.var_e8dff5e5 = #"hash_4de7d058f1248fe8";
						break;
					}
				}
			}
			if(args.size > 3)
			{
				door_model.var_fc5f2aa0.var_115ea089 = args[3];
			}
		}
	}
	namespace_1e25ad94::debugmsg((("Creating Door (" + modelname) + ") at ") + origin);
	level.doa.var_b8ef1466[level.doa.var_b8ef1466.size] = door_model;
	return door_model;
}

/*
	Name: function_49957ef3
	Namespace: namespace_f63bdb08
	Checksum: 0x93EC1457
	Offset: 0x650
	Size: 0x234
	Parameters: 2
	Flags: Linked
*/
function function_49957ef3(door, ignore)
{
	if(!isdefined(ignore))
	{
		ignore = 1;
	}
	level notify(#"hash_3bbf4237ccea5dd5", {#door:door});
	door notify(#"hash_46e32085692bcb4b");
	door endon(#"death", #"hash_46e32085692bcb4b");
	if(door.type == 4)
	{
		door namespace_83eb6304::function_3ecfde67("magic_door_open");
		door notsolid();
		door namespace_e32bb68::function_3a59ec34("zmb_magic_door_open");
		door scene::play(#"hash_7898f4b9a394157e", door);
		door waittill(#"scenes_done");
		door namespace_83eb6304::function_3ecfde67("magic_door_open");
		door namespace_ec06fe4a::function_8c808737();
		door connectpaths();
		wait(0.5);
		door delete();
		return;
	}
	namespace_1e25ad94::debugmsg("Door Opened");
	door namespace_e32bb68::function_3a59ec34("fly_open_door");
	door thread function_2740974(1);
	door.var_81b6ad63 = ignore;
	wait(0.5);
	door notsolid();
	door connectpaths();
}

/*
	Name: function_4c065330
	Namespace: namespace_f63bdb08
	Checksum: 0xBF353264
	Offset: 0x890
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_4c065330(door)
{
	door notify(#"hash_46e32085692bcb4b");
	door endon(#"death", #"hash_46e32085692bcb4b");
	door endon(#"death", #"hash_19761dff271382b");
	if(door.type == 4)
	{
		return;
	}
	namespace_1e25ad94::debugmsg("Door Closed");
	door namespace_e32bb68::function_3a59ec34("fly_close_door");
	door thread function_2740974(2);
	wait(0.5);
	door solid();
	door disconnectpaths();
}

/*
	Name: function_2740974
	Namespace: namespace_f63bdb08
	Checksum: 0xB4ECA7AE
	Offset: 0x9A0
	Size: 0x234
	Parameters: 1
	Flags: Linked
*/
function function_2740974(state)
{
	self notify("6dd03326a601c07c");
	self endon("6dd03326a601c07c");
	self endon(#"death");
	self useanimtree("generic");
	if(!isdefined(self.var_1f5ad513))
	{
		self.var_1f5ad513 = 0;
	}
	if(!isdefined(self.doorstate))
	{
		self.doorstate = 0;
	}
	while(gettime() < self.var_1f5ad513)
	{
		waitframe(1);
	}
	if(state === self.doorstate)
	{
		return;
	}
	self.doorstate = state;
	if(state == 1)
	{
		switch(self.type)
		{
			case 1:
			{
				animname = "p8_fxanim_zm_towers_buyable_gate_01_open_anim";
				break;
			}
			case 2:
			{
				animname = "p8_fxanim_zm_towers_buyable_gate_02_a_open_anim";
				break;
			}
			case 3:
			{
				animname = "p8_fxanim_zm_towers_buyable_gate_02_b_open_anim";
				break;
			}
			case 4:
			{
				return;
			}
		}
	}
	else if(state == 2)
	{
		switch(self.type)
		{
			case 1:
			{
				animname = "p8_fxanim_zm_towers_buyable_gate_01_close_anim";
				break;
			}
			case 2:
			{
				animname = "p8_fxanim_zm_towers_buyable_gate_02_a_close_anim";
				break;
			}
			case 3:
			{
				animname = "p8_fxanim_zm_towers_buyable_gate_02_b_close_anim";
				break;
			}
			case 4:
			{
				return;
			}
		}
	}
	length = getanimlength(animname);
	self.var_1f5ad513 = gettime() + (length * 1000);
	self play_anim(animname);
}

/*
	Name: play_anim
	Namespace: namespace_f63bdb08
	Checksum: 0xD90EC3C5
	Offset: 0xBE0
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function play_anim(animation, rate, mode)
{
	if(!isdefined(rate))
	{
		rate = 1;
	}
	if(!isdefined(mode))
	{
		mode = "server script";
	}
	self endon(#"death");
	self notify(#"stop_idle");
	self stopanimscripted();
	var_4e1ed731 = self.origin;
	var_451a755d = self.angles;
	self thread animation::play(animation, var_4e1ed731, var_451a755d, rate, 0.2, 0.2, 0, 0, 0, 0, undefined, 0, mode);
}

