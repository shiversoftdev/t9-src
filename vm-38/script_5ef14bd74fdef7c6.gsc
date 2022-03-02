#using script_49d63131b6de89a1;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_297ae820;

/*
	Name: function_a86f94e3
	Namespace: namespace_297ae820
	Checksum: 0x22594F2
	Offset: 0x1F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a86f94e3()
{
	level notify(2119896381);
}

/*
	Name: init
	Namespace: namespace_297ae820
	Checksum: 0x85972316
	Offset: 0x210
	Size: 0x30C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	var_a91808c6 = array("lgt_zipline_door_on");
	var_18e68ce9 = array("lgt_zipline_door_on");
	namespace_cf4aa5f0::function_6dbaba52("default", undefined, undefined, var_a91808c6, undefined);
	namespace_cf4aa5f0::function_6dbaba52("power_on", var_18e68ce9, undefined, undefined, undefined, &power_on);
	namespace_cf4aa5f0::function_6dbaba52("power_on_immediate", undefined, var_18e68ce9, undefined, undefined);
	namespace_cf4aa5f0::function_6dbaba52("end_boss_fight_light_on", "lgt_env_end_boss_fight", undefined, undefined, undefined);
	namespace_cf4aa5f0::function_6dbaba52("sq_rcxd_challenge_light_on", "lgt_bonus_race", undefined, undefined, undefined);
	namespace_cf4aa5f0::function_6dbaba52("sq_rcxd_challenge_light_off", undefined, undefined, "lgt_bonus_race", undefined);
	namespace_cf4aa5f0::function_6dbaba52("pistol_light_on", "lgt_env_shooting_gallery_pistol", undefined, undefined, undefined);
	namespace_cf4aa5f0::function_6dbaba52("pistol_light_off", undefined, undefined, "lgt_env_shooting_gallery_pistol", undefined);
	namespace_cf4aa5f0::function_6dbaba52("dark_aether_light_on", "zm_tungsten_dark_aether", undefined, undefined, undefined);
	clientfield::register("world", "" + #"hash_658f225a02b95617", 28000, 1, "int", &function_c5a7e457, 1, 0);
	clientfield::register("world", "" + #"hash_5e34e1c50fd13b32", 28000, 1, "int", &function_bdf1c128, 1, 0);
	clientfield::register("world", "" + #"hash_15ba92106568d817", 28000, 1, "int", &function_4b73168b, 1, 0);
	clientfield::register("world", "" + #"hash_4ed008087614d190", 28000, 1, "int", &function_ae88cc30, 1, 0);
}

/*
	Name: function_dcf22669
	Namespace: namespace_297ae820
	Checksum: 0x2C040E6B
	Offset: 0x528
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_dcf22669()
{
	namespace_cf4aa5f0::function_470d684a("default");
	if(level clientfield::get("zombie_power_on"))
	{
		namespace_cf4aa5f0::function_470d684a("power_on_immediate");
	}
	else
	{
		namespace_cf4aa5f0::function_470d684a("power_on");
	}
}

/*
	Name: power_on
	Namespace: namespace_297ae820
	Checksum: 0xB5243618
	Offset: 0x5A8
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private power_on()
{
	level waittill(#"power_on");
	/#
		iprintlnbold("");
	#/
}

/*
	Name: function_c5a7e457
	Namespace: namespace_297ae820
	Checksum: 0xC9C9C6E8
	Offset: 0x5F0
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_c5a7e457(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		namespace_cf4aa5f0::function_470d684a("end_boss_fight_light_on");
	}
}

/*
	Name: function_bdf1c128
	Namespace: namespace_297ae820
	Checksum: 0xACFC382B
	Offset: 0x658
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function function_bdf1c128(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		namespace_cf4aa5f0::function_470d684a("sq_rcxd_challenge_light_on");
	}
	else
	{
		namespace_cf4aa5f0::function_470d684a("sq_rcxd_challenge_light_off");
	}
}

/*
	Name: function_4b73168b
	Namespace: namespace_297ae820
	Checksum: 0x4CE5FC78
	Offset: 0x6E0
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function function_4b73168b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		namespace_cf4aa5f0::function_470d684a("pistol_light_on");
	}
	else
	{
		namespace_cf4aa5f0::function_470d684a("pistol_light_off");
	}
}

/*
	Name: function_ae88cc30
	Namespace: namespace_297ae820
	Checksum: 0x513F04D8
	Offset: 0x768
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_ae88cc30(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		namespace_cf4aa5f0::function_470d684a("dark_aether_light_on");
	}
}

