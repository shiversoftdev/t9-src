#using script_17a9d06bf819b2d3;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_2291eec4;

/*
	Name: function_25049cef
	Namespace: namespace_2291eec4
	Checksum: 0xDCAD43A8
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_25049cef()
{
	level notify(1861331172);
}

#namespace namespace_780aaec4;

/*
	Name: function_89f2df9
	Namespace: namespace_780aaec4
	Checksum: 0xDC767970
	Offset: 0x128
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_fb0b00f613ec7da", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_780aaec4
	Checksum: 0xD05B7ECD
	Offset: 0x170
	Size: 0x16C
	Parameters: 0
	Flags: None
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_7732e7b9e5c4e0e")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	clientfield::register("scriptmover", "supply_drop_parachute_rob", 1, 1, "int", &function_6567bf42, 0, 0);
	callback::on_vehicle_spawned(&on_vehicle_spawned);
	namespace_5b1144e::function_5ae4a10c(undefined, "helicopter_escape_heli", #"hash_5783e6ae1065d00", "pingVehicle");
	namespace_5b1144e::function_5ae4a10c(#"wpn_t9_streak_care_package_friendly_world", "helicopter_escape_crate", #"hash_12f3d2dc40a1670e", #"hash_49f4ae06ae4af262", #"hash_50bc9e26c4837c85");
}

/*
	Name: function_6567bf42
	Namespace: namespace_780aaec4
	Checksum: 0x161BBE36
	Offset: 0x2E8
	Size: 0x94
	Parameters: 7
	Flags: None
*/
function function_6567bf42(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self function_bf9d3071(#"hash_336cece53ae2342f");
	}
	else
	{
		self function_5d482e78(#"hash_336cece53ae2342f");
	}
}

/*
	Name: on_vehicle_spawned
	Namespace: namespace_780aaec4
	Checksum: 0xFAB92085
	Offset: 0x388
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function on_vehicle_spawned(localclientnum)
{
	if(self.vehicletype === #"hash_669d01ea5db4e10c")
	{
		self function_1f0c7136(3);
		self.var_fc558e74 = "helicopter_escape_heli";
	}
}

