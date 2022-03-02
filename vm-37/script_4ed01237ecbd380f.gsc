#using script_19f3d8b7a687a3f1;
#using script_7e75c6a3429e6a90;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_4b9fccd8;

/*
	Name: function_89f2df9
	Namespace: namespace_4b9fccd8
	Checksum: 0x3A0B5C84
	Offset: 0xD0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_794c3bb2e36b3278", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_4b9fccd8
	Checksum: 0x934C199B
	Offset: 0x128
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
	Offset: 0x1A8
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
	Checksum: 0x5A32E1F1
	Offset: 0x1B8
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

