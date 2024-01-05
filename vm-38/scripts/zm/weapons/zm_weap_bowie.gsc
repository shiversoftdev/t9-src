#using scripts\zm_common\zm_maptable.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_melee_weapon.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_weap_bowie;

/*
	Name: function_feb1e7c4
	Namespace: zm_weap_bowie
	Checksum: 0x46E6BCBC
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_feb1e7c4()
{
	level notify(307015755);
}

/*
	Name: __init__system__
	Namespace: zm_weap_bowie
	Checksum: 0x3A903798
	Offset: 0x150
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"bowie_knife", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_weap_bowie
	Checksum: 0x13231BF0
	Offset: 0x1A8
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_loadout::register_melee_weapon_for_level(#"bowie_knife");
}

/*
	Name: function_8ac3bea9
	Namespace: zm_weap_bowie
	Checksum: 0x40A7711F
	Offset: 0x1D8
	Size: 0x15C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	if(isdefined(level.bowie_cost))
	{
		cost = level.bowie_cost;
	}
	else
	{
		cost = 3000;
	}
	prompt = #"hash_60606b68e93a29c8";
	level.var_8e4168e9 = "bowie_knife";
	level.var_63af3e00 = "bowie_flourish";
	var_57858dd5 = "zombie_fists_bowie";
	if(zm_maptable::get_story() == 1)
	{
		level.var_8e4168e9 = "bowie_knife_story_1";
		level.var_63af3e00 = "bowie_flourish_story_1";
		var_57858dd5 = "zombie_fists_bowie_story_1";
	}
	zm_melee_weapon::init(level.var_8e4168e9, level.var_63af3e00, cost, "bowie_upgrade", prompt, "bowie", undefined);
	zm_melee_weapon::set_fallback_weapon(level.var_8e4168e9, var_57858dd5);
	level.w_bowie_knife = getweapon(hash(level.var_8e4168e9));
}

/*
	Name: init
	Namespace: zm_weap_bowie
	Checksum: 0x80F724D1
	Offset: 0x340
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function init()
{
}

