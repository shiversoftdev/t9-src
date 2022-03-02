#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace location;

/*
	Name: function_21f9b79b
	Namespace: location
	Checksum: 0x95FF79E
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_21f9b79b()
{
	level notify(1060119890);
}

/*
	Name: function_89f2df9
	Namespace: location
	Checksum: 0xE1B5FD3A
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"location", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: location
	Checksum: 0xC351FBB0
	Offset: 0x108
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_1383915 = getentarray(0, "location_zone", "targetname");
	level.var_b6d0f0ba = getmapfields().var_9350cee1;
	level.var_d6c4af7f = &function_5f3b1735;
	callback::on_localplayer_spawned(&on_player_spawned);
}

/*
	Name: function_ab7f70b9
	Namespace: location
	Checksum: 0x956322D2
	Offset: 0x1A0
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function function_ab7f70b9(str_zone)
{
	if(!isdefined(str_zone) || !isdefined(level.var_b6d0f0ba))
	{
		return undefined;
	}
	foreach(var_87ce7586 in level.var_b6d0f0ba)
	{
		if(var_87ce7586.zonename === hash(str_zone))
		{
			return var_87ce7586.displayname;
		}
	}
}

/*
	Name: get_current_zone
	Namespace: location
	Checksum: 0x3DFFE22B
	Offset: 0x270
	Size: 0xDE
	Parameters: 0
	Flags: Linked
*/
function get_current_zone()
{
	player = self;
	if(!isalive(player))
	{
		return;
	}
	foreach(zone in level.var_1383915)
	{
		if(isalive(player) && player istouching(zone))
		{
			return zone.script_location;
		}
		waitframe(1);
	}
}

/*
	Name: function_5f3b1735
	Namespace: location
	Checksum: 0x3404C303
	Offset: 0x358
	Size: 0xBA
	Parameters: 1
	Flags: Linked
*/
function function_5f3b1735(point)
{
	foreach(zone in level.var_1383915)
	{
		if(istouching(point, zone))
		{
			return function_ab7f70b9(zone.script_location);
		}
	}
	return undefined;
}

/*
	Name: function_f6ad2be6
	Namespace: location
	Checksum: 0x2B90E325
	Offset: 0x420
	Size: 0xE6
	Parameters: 1
	Flags: Linked
*/
function function_f6ad2be6(localclientnum)
{
	self endon(#"death");
	uimodel = getuimodel(function_1df4c3b0(localclientnum, #"hud_items"), "locationText");
	while(true)
	{
		if(isdefined(self))
		{
			str_location = get_current_zone();
			str_location = function_ab7f70b9(str_location);
			setuimodelvalue(uimodel, (isdefined(str_location) ? str_location : #""));
		}
		waitframe(1);
	}
}

/*
	Name: on_player_spawned
	Namespace: location
	Checksum: 0x90AC7CAA
	Offset: 0x510
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function on_player_spawned(localclientnum)
{
	if(is_true(level.var_36a81b25))
	{
		return;
	}
	if(!self function_21c0fa55())
	{
		return;
	}
	if(!isdefined(level.var_1383915[0]))
	{
		return;
	}
	self thread function_f6ad2be6(localclientnum);
}

