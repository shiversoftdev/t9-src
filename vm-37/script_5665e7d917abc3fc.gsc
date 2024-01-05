#using script_19f3d8b7a687a3f1;
#using script_3f2bc2eef03cbecc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_dd7e54e3;

/*
	Name: __init__system__
	Namespace: namespace_dd7e54e3
	Checksum: 0x4645269C
	Offset: 0x128
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7da9887a9375293", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_dd7e54e3
	Checksum: 0xA50A7A25
	Offset: 0x180
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	level.var_2a994cc0 = sr_armor_menu::register();
	namespace_52c8f34d::function_70a657d8();
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_dd7e54e3
	Checksum: 0xBCB160B3
	Offset: 0x1B8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
	clientfield::register("scriptmover", "armor_machine_fx", 1, 1, "int", &armor_machine_fx, 0, 0);
}

/*
	Name: armor_machine_fx
	Namespace: namespace_dd7e54e3
	Checksum: 0x1E036AFE
	Offset: 0x210
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function armor_machine_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		function_239993de(fieldname, "zombie/fx9_armor_station_idle", self, "tag_origin");
		function_239993de(fieldname, "zombie/fx9_armor_station_light", self, "monitor_01_bulb_jnt");
	}
}

