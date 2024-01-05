#using scripts\zm_common\zm_trial.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_trial_door_lockdown;

/*
	Name: function_d4b89438
	Namespace: zm_trial_door_lockdown
	Checksum: 0xA6E69582
	Offset: 0x128
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d4b89438()
{
	level notify(-1042834868);
}

/*
	Name: __init__system__
	Namespace: zm_trial_door_lockdown
	Checksum: 0xC60E6F55
	Offset: 0x148
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_door_lockdown", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_door_lockdown
	Checksum: 0xD83D849F
	Offset: 0x190
	Size: 0x10C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	clientfield::register("scriptmover", "" + #"zm_trial_door_lockdown", 16000, 1, "int", &zm_trial_door_lockdown, 0, 0);
	level._effect[#"hash_351debe7af1f588b"] = "maps/zm_escape/fx8_flame_wall_64x64";
	level._effect[#"hash_257bf4ae70b5a852"] = "maps/zm_escape/fx8_flame_wall_128x128";
	level._effect[#"hash_3ea271ae7eb7fdce"] = "maps/zm_escape/fx8_flame_wall_256x256";
	zm_trial::register_challenge(#"door_lockdown", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_door_lockdown
	Checksum: 0x7D308FAA
	Offset: 0x2A8
	Size: 0x14
	Parameters: 2
	Flags: Private
*/
function private on_begin(localclientnum, a_params)
{
}

/*
	Name: on_end
	Namespace: zm_trial_door_lockdown
	Checksum: 0xCED05788
	Offset: 0x2C8
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private on_end(localclientnum)
{
}

/*
	Name: zm_trial_door_lockdown
	Namespace: zm_trial_door_lockdown
	Checksum: 0xC6981173
	Offset: 0x2E0
	Size: 0x1B6
	Parameters: 7
	Flags: Private
*/
function private zm_trial_door_lockdown(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		v_forward = anglestoforward(self.angles);
		switch(self.model)
		{
			case "collision_player_wall_64x64x10":
			{
				var_b1e1a2db = level._effect[#"hash_351debe7af1f588b"];
				break;
			}
			case "collision_player_wall_128x128x10":
			{
				var_b1e1a2db = level._effect[#"hash_257bf4ae70b5a852"];
				break;
			}
			case "collision_player_wall_256x256x10":
			{
				var_b1e1a2db = level._effect[#"hash_3ea271ae7eb7fdce"];
				break;
			}
			default:
			{
				var_b1e1a2db = level._effect[#"hash_257bf4ae70b5a852"];
				break;
			}
		}
		self.var_958e3374 = playfx(fieldname, var_b1e1a2db, self.origin - vectorscale((0, 0, 1), 48), v_forward);
	}
	else if(isdefined(self.var_958e3374))
	{
		stopfx(fieldname, self.var_958e3374);
		self.var_958e3374 = undefined;
	}
}

