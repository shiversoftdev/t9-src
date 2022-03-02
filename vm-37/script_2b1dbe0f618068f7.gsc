#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\serverfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_2ed67032;

/*
	Name: function_89f2df9
	Namespace: namespace_2ed67032
	Checksum: 0x852DE83A
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7aac5c09cf9461e3", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_2ed67032
	Checksum: 0x3D083884
	Offset: 0x128
	Size: 0x14C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::function_a8bbc967("hudItems.armorPlateCount", #"hud_items", #"hash_7c65108f5dcd93ef", 1, 4, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.armorPlateMaxCarry", #"hud_items", #"hash_6260c609342f556d", 1, 4, "int", undefined, 0, 0);
	level.var_a05cd64e = &function_a05cd64e;
	level.var_8ef8b9e8 = getweapon(#"hash_9825a3f1d038c6f");
	callback::on_localclient_connect(&on_localclient_connect);
	callback::on_localplayer_spawned(&on_localplayer_spawned);
	serverfield::register("armor_plate_behavior", 1, 1, "int");
}

/*
	Name: on_localclient_connect
	Namespace: namespace_2ed67032
	Checksum: 0x73B6735F
	Offset: 0x280
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
	Checksum: 0x575D2AC7
	Offset: 0x2B0
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
	Checksum: 0x1ED76F33
	Offset: 0x2E0
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
	Checksum: 0xD4BE69D7
	Offset: 0x3F0
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
	Checksum: 0xDD7BE7EE
	Offset: 0x478
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
	Checksum: 0xF51D6A6C
	Offset: 0x698
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

