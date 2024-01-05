#using scripts\core_common\system_shared.gsc;

#namespace namespace_d4606b05;

/*
	Name: function_5325afd1
	Namespace: namespace_d4606b05
	Checksum: 0xD69E633D
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5325afd1()
{
	level notify(909047466);
}

#namespace ammo;

/*
	Name: __init__system__
	Namespace: ammo
	Checksum: 0xBFA6031F
	Offset: 0xA0
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register("cp_ammo_perks", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: ammo
	Checksum: 0xAB88E2A5
	Offset: 0xE0
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_a253061b = &function_d1df9410;
}

/*
	Name: function_d1df9410
	Namespace: ammo
	Checksum: 0xF551BFE5
	Offset: 0x108
	Size: 0x204
	Parameters: 1
	Flags: Linked
*/
function function_d1df9410(waitresult)
{
	player = waitresult.player;
	/#
		assert(isplayer(player));
	#/
	player playsound(#"wpn_ammo_pickup");
	player playlocalsound(#"wpn_ammo_pickup");
	primary_weapons = player getweaponslistprimaries();
	for(i = 0; i < primary_weapons.size; i++)
	{
		weapon = primary_weapons[i];
		if(is_true(weapon.var_cc0ed831))
		{
			continue;
		}
		stock = player getweaponammostock(weapon);
		clip = weapon.clipsize;
		clip = clip * getdvarfloat(#"scavenger_clip_multiplier", 1);
		clip = int(clip);
		maxammo = player function_5d951520(weapon);
		if(stock < maxammo - (clip * 3))
		{
			ammo = stock + (clip * 3);
			player setweaponammostock(weapon, ammo);
			continue;
		}
		player setweaponammostock(weapon, maxammo);
	}
}

