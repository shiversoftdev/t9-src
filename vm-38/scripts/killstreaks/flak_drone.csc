#using scripts\core_common\clientfield_shared.csc;

#namespace flak_drone;

/*
	Name: function_286c9f2e
	Namespace: flak_drone
	Checksum: 0x1DDE83AA
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_286c9f2e()
{
	level notify(1337176358);
}

/*
	Name: init_shared
	Namespace: flak_drone
	Checksum: 0x24D9FD23
	Offset: 0xC0
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	if(!isdefined(level.var_5460023b))
	{
		level.var_5460023b = {};
		clientfield::register("vehicle", "flak_drone_camo", 1, 3, "int", &active_camo_changed, 0, 0);
	}
}

/*
	Name: active_camo_changed
	Namespace: flak_drone
	Checksum: 0x209D2D94
	Offset: 0x130
	Size: 0x6C
	Parameters: 7
	Flags: None
*/
function active_camo_changed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self notify(#"endtest");
	self thread doreveal(fieldname, bwastimejump != 0);
}

/*
	Name: doreveal
	Namespace: flak_drone
	Checksum: 0xE5206151
	Offset: 0x1A8
	Size: 0xEA
	Parameters: 2
	Flags: None
*/
function doreveal(localclientnum, direction)
{
	self notify(#"endtest");
	self endon(#"endtest");
	self endon(#"death");
	if(direction)
	{
		startval = 1;
	}
	else
	{
		startval = 0;
	}
	while(startval >= 0 && startval <= 1)
	{
		self mapshaderconstant(localclientnum, 0, "scriptVector0", startval, 0, 0, 0);
		if(direction)
		{
			startval = startval - 0.032;
		}
		else
		{
			startval = startval + 0.032;
		}
		waitframe(1);
	}
}

