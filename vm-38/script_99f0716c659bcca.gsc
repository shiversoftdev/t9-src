#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_cd0ada25;

/*
	Name: function_247d8b5b
	Namespace: namespace_cd0ada25
	Checksum: 0xF01BB220
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_247d8b5b()
{
	level notify(-13496632);
}

#namespace namespace_c6f8b01;

/*
	Name: __init__system__
	Namespace: namespace_c6f8b01
	Checksum: 0xF6027F5B
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_51f0619dbe43da80", &init, undefined, undefined, undefined);
}

/*
	Name: init
	Namespace: namespace_c6f8b01
	Checksum: 0xEF3EEB6B
	Offset: 0xE0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.playthrowhatchet = &function_e879ee6d;
	level.createhatchetwatcher = &function_1679806a;
}

/*
	Name: function_1679806a
	Namespace: namespace_c6f8b01
	Checksum: 0xEABAF86E
	Offset: 0x120
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1679806a(s_watcher)
{
	s_watcher.onspawnretrievetriggers = &function_4ba658e5;
	s_watcher.pickup = &function_4ba658e5;
	s_watcher.deleteonplayerspawn = 0;
}

/*
	Name: function_e879ee6d
	Namespace: namespace_c6f8b01
	Checksum: 0x8184354C
	Offset: 0x170
	Size: 0x138
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e879ee6d(hatchet)
{
	hatchet endon(#"delete", #"death");
	while(true)
	{
		var_51b88026 = undefined;
		var_51b88026 = hatchet waittill(#"grenade_stuck");
		if(!isdefined(var_51b88026.hitent) || !isactor(var_51b88026.hitent))
		{
			continue;
		}
		if(isalive(var_51b88026.hitent))
		{
			var_51b88026.hitent waittill(#"death");
		}
		hatchet unlink();
		waitframe(1);
		hatchet.angles = (hatchet.angles[0] + 90, 0, 0);
		hatchet launch(vectorscale((0, 0, -1), 0.5));
	}
}

/*
	Name: function_4ba658e5
	Namespace: namespace_c6f8b01
	Checksum: 0x124446CA
	Offset: 0x2B0
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function function_4ba658e5(s_watcher, player)
{
}

