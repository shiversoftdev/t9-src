#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace location;

/*
	Name: __init__system__
	Namespace: location
	Checksum: 0xE3FF622C
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"location", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: location
	Checksum: 0xF47D3802
	Offset: 0xE8
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
	Checksum: 0x95B6C5F
	Offset: 0x180
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
	Checksum: 0x1074DC5C
	Offset: 0x250
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
	Checksum: 0x4BDCB2C8
	Offset: 0x338
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
	Checksum: 0x9EFCCA67
	Offset: 0x400
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
	Checksum: 0xAB12BE2
	Offset: 0x4F0
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

