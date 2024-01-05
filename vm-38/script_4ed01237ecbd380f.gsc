#using script_19f3d8b7a687a3f1;
#using script_7e75c6a3429e6a90;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_4b9fccd8;

/*
	Name: function_47ea6c5b
	Namespace: namespace_4b9fccd8
	Checksum: 0x18775750
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_47ea6c5b()
{
	level notify(524299456);
}

/*
	Name: __init__system__
	Namespace: namespace_4b9fccd8
	Checksum: 0x3091B662
	Offset: 0xF0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_794c3bb2e36b3278", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_4b9fccd8
	Checksum: 0xC22DBD76
	Offset: 0x148
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	level.var_2457162c = sr_weapon_upgrade_menu::register();
	clientfield::register("scriptmover", "weapon_machine_fx", 1, 1, "int", &function_3f010f7a, 0, 0);
	namespace_52c8f34d::function_70a657d8();
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_4b9fccd8
	Checksum: 0x80F724D1
	Offset: 0x1C8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
}

/*
	Name: function_3f010f7a
	Namespace: namespace_4b9fccd8
	Checksum: 0x5F739DFA
	Offset: 0x1D8
	Size: 0xAE
	Parameters: 7
	Flags: Linked
*/
function function_3f010f7a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.var_3f010f7a = function_239993de(fieldname, #"zombie/fx9_pap_idle", self, "sphere_jnt");
	}
	else if(isdefined(self.var_3f010f7a))
	{
		stopfx(fieldname, self.var_3f010f7a);
		self.var_3f010f7a = undefined;
	}
}

