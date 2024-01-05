#using scripts\core_common\array_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_vapor_random;

/*
	Name: __init__system__
	Namespace: zm_vapor_random
	Checksum: 0x21849687
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_vapor_random", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_vapor_random
	Checksum: 0x3ACF5919
	Offset: 0x140
	Size: 0x6C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "random_vapor_altar_available", 1, 1, "int", &random_vapor_altar_available_fx, 0, 0);
	level._effect[#"random_vapor_altar_available"] = "zombie/fx_powerup_on_green_zmb";
}

/*
	Name: random_vapor_altar_available_fx
	Namespace: zm_vapor_random
	Checksum: 0x94E3C1D
	Offset: 0x1B8
	Size: 0xCC
	Parameters: 7
	Flags: None
*/
function random_vapor_altar_available_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(!isdefined(self.var_476bef54))
		{
			self.var_476bef54 = util::playfxontag(fieldname, level._effect[#"random_vapor_altar_available"], self, "tag_origin");
		}
	}
	else if(isdefined(self.var_476bef54))
	{
		stopfx(fieldname, self.var_476bef54);
	}
}

