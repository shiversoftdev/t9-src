#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using script_4dc6a9b234b838e1;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_35598499769dbb3d;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_5a359049;

/*
	Name: function_e59497f
	Namespace: namespace_5a359049
	Checksum: 0x840C6B6C
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e59497f()
{
	level notify(-944168281);
}

/*
	Name: __init__system__
	Namespace: namespace_5a359049
	Checksum: 0x3BEB0B08
	Offset: 0x110
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_695bd4a240716800", &function_70a657d8, &function_8ac3bea9, undefined, #"zm_weapons");
}

/*
	Name: function_70a657d8
	Namespace: namespace_5a359049
	Checksum: 0x7A722BE
	Offset: 0x170
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_1b5a1f0d = &zm_utility::is_point_inside_enabled_zone;
	level.var_3da1a113 = #"hash_733eecf99198ecb9";
	level.weaponzmcymbalmonkey = getweapon(#"cymbal_monkey");
	zm_loadout::register_lethal_grenade_for_level(#"cymbal_monkey");
	zm_weapons::function_404c3ad5(level.weaponzmcymbalmonkey, &function_c1c47eb6);
	callback::add_callback(#"on_ai_killed", &function_c58f9108);
	namespace_cc411409::function_70a657d8();
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_5a359049
	Checksum: 0xFCF15095
	Offset: 0x260
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	if(!cymbal_monkey_exists())
	{
		return;
	}
	if(is_true(level.legacy_cymbal_monkey))
	{
		level.cymbal_monkey_model = "weapon_zombie_monkey_bomb";
	}
	else
	{
		level.cymbal_monkey_model = "wpn_t7_zmb_monkey_bomb_world";
	}
}

/*
	Name: cymbal_monkey_exists
	Namespace: namespace_5a359049
	Checksum: 0xDB095530
	Offset: 0x2C8
	Size: 0x18
	Parameters: 0
	Flags: Linked
*/
function cymbal_monkey_exists()
{
	return level.weaponzmcymbalmonkey != level.weaponnone;
}

/*
	Name: function_c1c47eb6
	Namespace: namespace_5a359049
	Checksum: 0x683CEE73
	Offset: 0x2E8
	Size: 0xDA
	Parameters: 15
	Flags: Linked
*/
function function_c1c47eb6(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, modelindex, surfacetype, vsurfacenormal)
{
	if(isentity(surfacetype) && isplayer(vsurfacenormal) && self.var_6f84b820 === #"normal")
	{
		self.var_9a4dd099 = surfacetype.origin;
	}
}

/*
	Name: function_c58f9108
	Namespace: namespace_5a359049
	Checksum: 0x912261A
	Offset: 0x3D0
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_c58f9108(params)
{
	if(params.weapon.name === #"cymbal_monkey" && isplayer(params.eattacker) && self.var_6f84b820 === #"normal" && isvec(self.var_9a4dd099))
	{
		self namespace_cc411409::function_706a56ae(self.var_9a4dd099, 2);
		self thread function_3fb4ce3b();
	}
}

/*
	Name: function_3fb4ce3b
	Namespace: namespace_5a359049
	Checksum: 0xC1BC57AE
	Offset: 0x4A0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_3fb4ce3b()
{
	util::wait_network_frame();
	if(isdefined(self))
	{
		self zombie_utility::gib_random_parts();
	}
}

