#using script_8988fdbc78d6c53;
#using scripts\core_common\clientfield_shared.gsc;

#namespace grenades;

/*
	Name: function_ef3cb5db
	Namespace: grenades
	Checksum: 0x223AFF50
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ef3cb5db()
{
	level notify(1904027658);
}

/*
	Name: init_shared
	Namespace: grenades
	Checksum: 0x6FE7DB73
	Offset: 0xA0
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	weaponobjects::function_e6400478(#"eq_sticky_grenade", &function_ece99a15, 1);
	weaponobjects::function_e6400478(#"concussion_grenade", &function_ece99a15, 1);
	weaponobjects::function_e6400478(#"hash_5825488ac68418af", &function_ece99a15, 1);
}

/*
	Name: function_ece99a15
	Namespace: grenades
	Checksum: 0x34E40EF9
	Offset: 0x158
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_ece99a15(watcher)
{
	watcher.onspawn = &function_aa95d684;
}

/*
	Name: function_aa95d684
	Namespace: grenades
	Checksum: 0x7F5D35A2
	Offset: 0x188
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_aa95d684(watcher, player)
{
	self clientfield::set("enemyequip", 1);
	self thread function_5f86757d();
}

/*
	Name: function_5f86757d
	Namespace: grenades
	Checksum: 0xB81BCEB7
	Offset: 0x1E0
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_5f86757d()
{
	level endon(#"game_ended");
	self waittill(#"explode", #"death");
	if(!isdefined(self))
	{
		return;
	}
	self clientfield::set("enemyequip", 0);
}

