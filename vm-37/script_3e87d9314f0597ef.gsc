#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_e7c67ece;

/*
	Name: function_89f2df9
	Namespace: namespace_e7c67ece
	Checksum: 0x21849687
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_145b120e873ea191", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e7c67ece
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
	Namespace: namespace_e7c67ece
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

