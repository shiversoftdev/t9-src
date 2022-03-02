#using script_3c362258ff800237;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_6f53a9bb;

/*
	Name: function_89f2df9
	Namespace: namespace_6f53a9bb
	Checksum: 0x48B5C80E
	Offset: 0x128
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_530f1e3dbb50b5f6", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_6f53a9bb
	Checksum: 0x3FE75CC7
	Offset: 0x170
	Size: 0x10C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	clientfield::register("scriptmover", "" + #"hash_530f1e3dbb50b5f6", 16000, 1, "int", &function_6f53a9bb, 0, 0);
	level._effect[#"hash_351debe7af1f588b"] = "maps/zm_escape/fx8_flame_wall_64x64";
	level._effect[#"hash_257bf4ae70b5a852"] = "maps/zm_escape/fx8_flame_wall_128x128";
	level._effect[#"hash_3ea271ae7eb7fdce"] = "maps/zm_escape/fx8_flame_wall_256x256";
	zm_trial::register_challenge(#"hash_6f720e698e84015d", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_6f53a9bb
	Checksum: 0xB764BAD9
	Offset: 0x288
	Size: 0x14
	Parameters: 2
	Flags: Private
*/
function private function_d1de6a85(localclientnum, a_params)
{
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_6f53a9bb
	Checksum: 0x50C0B3F5
	Offset: 0x2A8
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(localclientnum)
{
}

/*
	Name: function_6f53a9bb
	Namespace: namespace_6f53a9bb
	Checksum: 0xD42EDCBF
	Offset: 0x2C0
	Size: 0x1B6
	Parameters: 7
	Flags: Private
*/
function private function_6f53a9bb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
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

