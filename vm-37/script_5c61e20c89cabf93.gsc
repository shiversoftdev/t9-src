#using scripts\core_common\system_shared.gsc;

#namespace ammo;

/*
	Name: __init__system__
	Namespace: ammo
	Checksum: 0x8D7D7549
	Offset: 0x80
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
	Checksum: 0x375F569A
	Offset: 0xC0
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
	Checksum: 0x9BFBE0E9
	Offset: 0xE8
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

