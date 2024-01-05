#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\serverfield_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_2ed67032;

/*
	Name: function_897dfc9e
	Namespace: namespace_2ed67032
	Checksum: 0x3729E372
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_897dfc9e()
{
	level notify(-942754065);
}

/*
	Name: __init__system__
	Namespace: namespace_2ed67032
	Checksum: 0xC2C0D8A
	Offset: 0x100
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7aac5c09cf9461e3", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_2ed67032
	Checksum: 0x25D96210
	Offset: 0x148
	Size: 0x14C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register_clientuimodel("hudItems.armorPlateCount", #"hud_items", #"hash_7c65108f5dcd93ef", 1, 4, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.armorPlateMaxCarry", #"hud_items", #"hash_6260c609342f556d", 1, 4, "int", undefined, 0, 0);
	level.var_a05cd64e = &function_a05cd64e;
	level.var_8ef8b9e8 = getweapon(#"hash_9825a3f1d038c6f");
	callback::on_localclient_connect(&on_localclient_connect);
	callback::on_localplayer_spawned(&on_localplayer_spawned);
	serverfield::register("armor_plate_behavior", 1, 1, "int");
}

/*
	Name: on_localclient_connect
	Namespace: namespace_2ed67032
	Checksum: 0x2B5ACFD2
	Offset: 0x2A0
	Size: 0x24
	Parameters: 1
	Flags: Private
*/
function private on_localclient_connect(localclientnum)
{
	function_321bb79b(localclientnum);
}

/*
	Name: on_localplayer_spawned
	Namespace: namespace_2ed67032
	Checksum: 0x4DDC7AD6
	Offset: 0x2D0
	Size: 0x24
	Parameters: 1
	Flags: Private
*/
function private on_localplayer_spawned(localclientnum)
{
	function_321bb79b(localclientnum);
}

/*
	Name: function_321bb79b
	Namespace: namespace_2ed67032
	Checksum: 0x272FA2C3
	Offset: 0x300
	Size: 0x102
	Parameters: 2
	Flags: Private
*/
function private function_321bb79b(localclientnum, value)
{
	player = function_27673a7(localclientnum);
	if(!isdefined(player))
	{
		return;
	}
	if(!isdefined(value))
	{
		setting = (gamepadusedlast(localclientnum) ? #"hash_682672bd6f1c579d" : #"hash_528fda2b50f86795");
		value = (isdefined(function_ab88dbd2(localclientnum, setting)) ? function_ab88dbd2(localclientnum, setting) : 0);
	}
	if(player.var_8d801ee2 !== value)
	{
		player serverfield::set("armor_plate_behavior", value);
		player.var_8d801ee2 = value;
	}
}

/*
	Name: function_a05cd64e
	Namespace: namespace_2ed67032
	Checksum: 0x7FD36FA0
	Offset: 0x410
	Size: 0x7C
	Parameters: 1
	Flags: Private
*/
function private function_a05cd64e(localclientnum)
{
	if(!self function_da43934d())
	{
		return;
	}
	if(self function_86b9a404())
	{
		function_321bb79b(localclientnum);
		switchtoweapon(localclientnum, level.var_8ef8b9e8);
		return true;
	}
	return false;
}

/*
	Name: function_86b9a404
	Namespace: namespace_2ed67032
	Checksum: 0x62FDAE6
	Offset: 0x498
	Size: 0x214
	Parameters: 0
	Flags: Private
*/
function private function_86b9a404()
{
	if(!isplayer(self) || self isplayerdead())
	{
		return 0;
	}
	localclientnum = self getlocalclientnumber();
	if(!isdefined(localclientnum))
	{
		return 0;
	}
	currentweapon = getcurrentweapon(localclientnum);
	if(currentweapon === level.var_8ef8b9e8 || currentweapon === level.weaponnone)
	{
		return 0;
	}
	if(isonturret(localclientnum) || self function_94ba7a2e() || self function_9a0edd92() || self isinfreefall() || self inlaststand() || self isskydiving())
	{
		return 0;
	}
	if(isdefined(getplayervehicle(self)))
	{
		if(currentweapon === level.weaponnone || function_3feb54c8(localclientnum))
		{
			return 0;
		}
	}
	var_6aae821e = hasweapon(localclientnum, level.var_8ef8b9e8);
	currentcount = self clientfield::get_player_uimodel("hudItems.armorPlateCount");
	return currentcount > 0 && self function_e8ef30cc() < 225 && var_6aae821e;
}

/*
	Name: function_465c8646
	Namespace: namespace_2ed67032
	Checksum: 0x22FDCCE5
	Offset: 0x6B8
	Size: 0x7C
	Parameters: 1
	Flags: Event
*/
event function_465c8646(eventstruct)
{
	if(eventstruct.name === #"hash_682672bd6f1c579d" || eventstruct.name === #"hash_528fda2b50f86795")
	{
		function_321bb79b(eventstruct.localclientnum, int(eventstruct.value));
	}
}

