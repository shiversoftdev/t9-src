#using script_8988fdbc78d6c53;
#using scripts\core_common\clientfield_shared.gsc;

#namespace grenades;

/*
	Name: init_shared
	Namespace: grenades
	Checksum: 0x249E8BAE
	Offset: 0x80
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
	Checksum: 0x938A0960
	Offset: 0x138
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
	Checksum: 0x51C580D6
	Offset: 0x168
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
	Checksum: 0x6B941925
	Offset: 0x1C0
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

