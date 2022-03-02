#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\vehicle_shared.csc;

#namespace namespace_b1fabd77;

/*
	Name: function_89f2df9
	Namespace: namespace_b1fabd77
	Checksum: 0xFD0A36A8
	Offset: 0xF0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_755cb45f3199fa30", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: namespace_b1fabd77
	Checksum: 0x90B78850
	Offset: 0x140
	Size: 0xC4
	Parameters: 1
	Flags: Private
*/
function private function_70a657d8(localclientnum)
{
	vehicle::add_vehicletype_callback("helicopter_heavy", &function_8220feb0);
	clientfield::register("toplayer", "hind_gunner_postfx_active", 1, 1, "int", &function_44ad5e3e, 0, 1);
	clientfield::register("vehicle", "hind_compass_icon", 1, 2, "int", &hind_compass_icon, 0, 1);
}

/*
	Name: function_8220feb0
	Namespace: namespace_b1fabd77
	Checksum: 0x10F06E92
	Offset: 0x210
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private function_8220feb0(localclientnum)
{
}

/*
	Name: function_44ad5e3e
	Namespace: namespace_b1fabd77
	Checksum: 0xFB76AB3B
	Offset: 0x228
	Size: 0xCC
	Parameters: 7
	Flags: None
*/
function function_44ad5e3e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!self postfx::function_556665f2(#"hash_4a4dfccbf3585bcc"))
		{
			self postfx::playpostfxbundle(#"hash_4a4dfccbf3585bcc");
		}
	}
	else if(self postfx::function_556665f2(#"hash_4a4dfccbf3585bcc"))
	{
		self postfx::stoppostfxbundle(#"hash_4a4dfccbf3585bcc");
	}
}

/*
	Name: hind_compass_icon
	Namespace: namespace_b1fabd77
	Checksum: 0x2F53E39D
	Offset: 0x300
	Size: 0x112
	Parameters: 7
	Flags: None
*/
function hind_compass_icon(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self.scriptvehicletype) || self.scriptvehicletype != "helicopter_heavy")
	{
		return;
	}
	switch(bwastimejump)
	{
		case 0:
		{
			self setcompassicon(#"hash_238039183607226d");
			break;
		}
		case 1:
		{
			self setcompassicon(#"hash_a6a2a558ed7bec6");
			break;
		}
		case 2:
		{
			self setcompassicon("");
			break;
		}
	}
}

