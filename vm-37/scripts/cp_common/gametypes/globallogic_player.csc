#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace globallogic_player;

/*
	Name: __init__system__
	Namespace: globallogic_player
	Checksum: 0x862DBDD7
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"globallogic_player", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: globallogic_player
	Checksum: 0x1F0EC3D9
	Offset: 0xF8
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "player_damage_type", 1, 1, "int", &player_damage_type_changed, 0, 0);
}

/*
	Name: player_damage_type_changed
	Namespace: globallogic_player
	Checksum: 0xE6ED1948
	Offset: 0x150
	Size: 0xD4
	Parameters: 7
	Flags: None
*/
function player_damage_type_changed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	if(bwastimejump)
	{
		self setdamagedirectionindicator(1);
		setsoundcontext("plr_impact", "flesh");
	}
	else
	{
		self setdamagedirectionindicator(0);
		setsoundcontext("plr_impact", "flesh");
	}
}

