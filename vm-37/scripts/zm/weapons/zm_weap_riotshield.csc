#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace zm_equip_shield;

/*
	Name: __init__system__
	Namespace: zm_equip_shield
	Checksum: 0x1BFC9462
	Offset: 0x128
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
	Checksum: 0xF317CF4B
	Offset: 0x170
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
	Checksum: 0x5A01ED8F
	Offset: 0x280
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
	Checksum: 0x41D25EEA
	Offset: 0x2B0
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
	Checksum: 0x630F1141
	Offset: 0x3D8
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
	Checksum: 0x5E4E2CE3
	Offset: 0x448
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

