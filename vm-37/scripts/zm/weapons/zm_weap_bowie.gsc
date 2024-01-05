#using scripts\zm_common\zm_maptable.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_melee_weapon.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_weap_bowie;

/*
	Name: __init__system__
	Namespace: zm_weap_bowie
	Checksum: 0x9694C1B7
	Offset: 0x130
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
	Checksum: 0xE6F22346
	Offset: 0x188
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
	Checksum: 0x5F76A2E1
	Offset: 0x1B8
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
	Offset: 0x320
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function init()
{
}

