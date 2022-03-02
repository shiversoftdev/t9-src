#using script_8988fdbc78d6c53;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_c6f8b01;

/*
	Name: function_89f2df9
	Namespace: namespace_c6f8b01
	Checksum: 0x592DD82F
	Offset: 0x78
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_51f0619dbe43da80", &init, undefined, undefined, undefined);
}

/*
	Name: init
	Namespace: namespace_c6f8b01
	Checksum: 0x6F31A0AF
	Offset: 0xC0
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
	Checksum: 0xD0C57014
	Offset: 0x100
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
	Checksum: 0x780F6609
	Offset: 0x150
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
	Checksum: 0x115AFB26
	Offset: 0x290
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function function_4ba658e5(s_watcher, player)
{
}

