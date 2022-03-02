#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace globallogic_player;

/*
	Name: function_eeb8f817
	Namespace: globallogic_player
	Checksum: 0x56C6199D
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eeb8f817()
{
	level notify(925227124);
}

/*
	Name: function_89f2df9
	Namespace: globallogic_player
	Checksum: 0x29021AA3
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"globallogic_player", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: globallogic_player
	Checksum: 0xBAA0DBA3
	Offset: 0x118
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "player_damage_type", 1, 1, "int", &player_damage_type_changed, 0, 0);
}

/*
	Name: player_damage_type_changed
	Namespace: globallogic_player
	Checksum: 0xAF193CD7
	Offset: 0x170
	Size: 0xD4
	Parameters: 7
	Flags: Linked
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

