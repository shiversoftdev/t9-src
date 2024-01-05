#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_daf1661f;

/*
	Name: function_8aa85f9f
	Namespace: namespace_daf1661f
	Checksum: 0xC3C33B5C
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8aa85f9f()
{
	level notify(-1011568404);
}

/*
	Name: init
	Namespace: namespace_daf1661f
	Checksum: 0x44A644FA
	Offset: 0x90
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function init()
{
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: namespace_daf1661f
	Checksum: 0x1D35D00C
	Offset: 0xC0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function on_player_spawned(local_client_num)
{
	level callback::function_6231c19(&on_weapon_change);
}

/*
	Name: on_weapon_change
	Namespace: namespace_daf1661f
	Checksum: 0x4C4C5574
	Offset: 0xF8
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function on_weapon_change(params)
{
	if(params.weapon.name == #"none")
	{
		return;
	}
	if(isstruct(self))
	{
		return;
	}
	if(!self function_da43934d() || !isplayer(self) || !isalive(self))
	{
		return;
	}
	function_fad60cb1(params.localclientnum, params.weapon);
}

