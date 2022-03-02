#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace hazard;

/*
	Name: function_89f2df9
	Namespace: hazard
	Checksum: 0x1D44D090
	Offset: 0x108
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hazard", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: hazard
	Checksum: 0xA6C9C5E9
	Offset: 0x150
	Size: 0xB4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "hazard_gas", 1, 1, "int", &hazard_gas, 0, 0);
	clientfield::register("toplayer", "hazard_gas_with_mask", 1, 1, "int", &hazard_gas_with_mask, 0, 0);
	level._effect[#"hash_667f50f096a9a290"] = "fire/fx_fire_ai_human_head_loop";
}

/*
	Name: hazard_gas
	Namespace: hazard
	Checksum: 0x3D1804B7
	Offset: 0x210
	Size: 0xBC
	Parameters: 7
	Flags: None
*/
function hazard_gas(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		setblurbylocalclientnum(fieldname, 16, 1);
	}
	else
	{
		if(isdefined(self.var_bca8cc88))
		{
			stopfx(fieldname, self.var_bca8cc88);
			self.var_bca8cc88 = undefined;
		}
		setblurbylocalclientnum(fieldname, 0, 3);
	}
}

/*
	Name: hazard_gas_with_mask
	Namespace: hazard
	Checksum: 0xC8D8A0EA
	Offset: 0x2D8
	Size: 0xD4
	Parameters: 7
	Flags: None
*/
function hazard_gas_with_mask(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump != fieldname)
	{
		if(bwastimejump)
		{
			setblurbylocalclientnum(binitialsnap, 2, 3);
			self thread function_f5b6d619();
		}
		else
		{
			setblurbylocalclientnum(binitialsnap, 0, 1);
			self notify(#"hash_452ba9cb2df33d3f");
			self postfx::exitpostfxbundle("pstfx_water_t_out");
		}
	}
}

/*
	Name: function_f5b6d619
	Namespace: hazard
	Checksum: 0x3AA3F5B8
	Offset: 0x3B8
	Size: 0x68
	Parameters: 0
	Flags: None
*/
function function_f5b6d619()
{
	self notify(#"hash_452ba9cb2df33d3f");
	self endon(#"death", #"hash_452ba9cb2df33d3f");
	while(true)
	{
		self postfx::playpostfxbundle("pstfx_water_t_out");
		wait(2.4);
	}
}

