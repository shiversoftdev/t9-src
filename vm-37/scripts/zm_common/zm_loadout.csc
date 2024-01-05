#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_weapons.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_score.csc;
#using scripts\zm_common\zm_magicbox.csc;
#using scripts\zm_common\zm_equipment.csc;
#using scripts\zm_common\zm_bgb.csc;
#using scripts\zm_common\zm_audio.csc;
#using scripts\zm_common\util.csc;
#using scripts\core_common\player\player_stats.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\aat_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_loadout;

/*
	Name: __init__system__
	Namespace: zm_loadout
	Checksum: 0x36B24543
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_loadout", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_loadout
	Checksum: 0x3350A4F9
	Offset: 0x158
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	/#
		if(!isdemoplaying())
		{
			callback::on_localplayer_spawned(&on_localplayer_spawned);
		}
	#/
}

/*
	Name: on_localplayer_spawned
	Namespace: zm_loadout
	Checksum: 0xF838A1EC
	Offset: 0x1A0
	Size: 0x1EC
	Parameters: 1
	Flags: None
*/
function on_localplayer_spawned(localclientnum)
{
	self.class_num = 0;
	if(isplayer(self))
	{
		self.class_num = function_cc90c352(localclientnum);
	}
	self.loadout = [];
	var_cd6fae8c = self get_loadout_item(localclientnum, "primarygrenade");
	self.loadout[#"lethal"] = getunlockableiteminfofromindex(var_cd6fae8c, 1);
	var_9aeb4447 = self get_loadout_item(localclientnum, "primary");
	self.loadout[#"primary"] = getunlockableiteminfofromindex(var_9aeb4447, 1);
	self.loadout[#"perks"] = [];
	for(i = 1; i <= 4; i++)
	{
		var_96861ec8 = self get_loadout_item(localclientnum, "specialty" + i);
		self.loadout[#"perks"][i] = getunlockableiteminfofromindex(var_96861ec8, 3);
	}
	self.loadout[#"hero"] = self function_439b009a(localclientnum, "herogadget");
}

/*
	Name: function_622d8349
	Namespace: zm_loadout
	Checksum: 0x5F69BE82
	Offset: 0x398
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function function_622d8349(localclientnum)
{
	level endon(#"demo_jump");
	while(!function_908617f2(localclientnum))
	{
		waitframe(1);
	}
}

/*
	Name: get_loadout_item
	Namespace: zm_loadout
	Checksum: 0x6766A092
	Offset: 0x3E0
	Size: 0x92
	Parameters: 2
	Flags: Linked
*/
function get_loadout_item(localclientnum, slot)
{
	if(!isplayer(self))
	{
		return undefined;
	}
	if(!isdefined(self.class_num))
	{
		self.class_num = function_cc90c352(localclientnum);
	}
	if(!isdefined(self.class_num))
	{
		self.class_num = 0;
	}
	return getloadoutitem(localclientnum, self.class_num, slot);
}

/*
	Name: function_439b009a
	Namespace: zm_loadout
	Checksum: 0x19E5D89E
	Offset: 0x480
	Size: 0x92
	Parameters: 2
	Flags: Linked
*/
function function_439b009a(localclientnum, slot)
{
	if(!isplayer(self))
	{
		return undefined;
	}
	if(!isdefined(self.class_num))
	{
		self.class_num = function_cc90c352(localclientnum);
	}
	if(!isdefined(self.class_num))
	{
		self.class_num = 0;
	}
	return getloadoutweapon(localclientnum, self.class_num, slot);
}

