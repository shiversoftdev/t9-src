#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace zm_weap_riotshield;

/*
	Name: function_89fd8511
	Namespace: zm_weap_riotshield
	Checksum: 0x78CA51C
	Offset: 0x128
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_89fd8511()
{
	level notify(178366723);
}

#namespace zm_equip_shield;

/*
	Name: __init__system__
	Namespace: zm_equip_shield
	Checksum: 0x64E48F7C
	Offset: 0x148
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_equip_shield", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_equip_shield
	Checksum: 0xE7F3A07A
	Offset: 0x190
	Size: 0x104
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_spawned(&player_on_spawned);
	clientfield::register("toplayer", "zm_shield_damage_rumble", 1, 1, "counter", &zm_shield_damage_rumble, 0, 0);
	clientfield::register("toplayer", "zm_shield_break_rumble", 1, 1, "counter", &zm_shield_break_rumble, 0, 0);
	clientfield::register_clientuimodel("ZMInventoryPersonal.shield_health", #"hash_1d3ddede734994d8", #"shield_health", 1, 4, "float", undefined, 0, 0);
}

/*
	Name: player_on_spawned
	Namespace: zm_equip_shield
	Checksum: 0x97F0FC1E
	Offset: 0x2A0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function player_on_spawned(localclientnum)
{
	self thread watch_weapon_changes(localclientnum);
}

/*
	Name: watch_weapon_changes
	Namespace: zm_equip_shield
	Checksum: 0x3D9D1416
	Offset: 0x2D0
	Size: 0x120
	Parameters: 1
	Flags: None
*/
function watch_weapon_changes(localclientnum)
{
	self endon(#"death");
	while(isdefined(self))
	{
		waitresult = undefined;
		waitresult = self waittill(#"weapon_change");
		w_current = waitresult.weapon;
		w_previous = waitresult.last_weapon;
		if(w_current.isriotshield)
		{
			for(i = 0; i < w_current.var_21329beb.size; i++)
			{
				util::lock_model(w_current.var_21329beb[i]);
			}
		}
		else if(w_previous.isriotshield)
		{
			for(i = 0; i < w_previous.var_21329beb.size; i++)
			{
				util::unlock_model(w_previous.var_21329beb[i]);
			}
		}
	}
}

/*
	Name: zm_shield_damage_rumble
	Namespace: zm_equip_shield
	Checksum: 0x42D47328
	Offset: 0x3F8
	Size: 0x64
	Parameters: 7
	Flags: None
*/
function zm_shield_damage_rumble(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self playrumbleonentity(fieldname, "zm_shield_damage");
	}
}

/*
	Name: zm_shield_break_rumble
	Namespace: zm_equip_shield
	Checksum: 0x1B9B06C2
	Offset: 0x468
	Size: 0x64
	Parameters: 7
	Flags: None
*/
function zm_shield_break_rumble(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self playrumbleonentity(fieldname, "zm_shield_break");
	}
}

