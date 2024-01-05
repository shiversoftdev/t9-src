#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_daf1661f;

/*
	Name: init
	Namespace: namespace_daf1661f
	Checksum: 0xD4E5AC24
	Offset: 0x70
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
	Checksum: 0x8E0939B1
	Offset: 0xA0
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
	Checksum: 0x4B38DDE4
	Offset: 0xD8
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

