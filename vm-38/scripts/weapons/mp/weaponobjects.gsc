#using scripts\mp_common\util.gsc;
#using script_6b221588ece2c4aa;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace weaponobjects;

/*
	Name: function_4118d49c
	Namespace: weaponobjects
	Checksum: 0x7C8FF036
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4118d49c()
{
	level notify(1994408782);
}

/*
	Name: __init__system__
	Namespace: weaponobjects
	Checksum: 0xE7FF0B14
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"weaponobjects", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: weaponobjects
	Checksum: 0x20C87620
	Offset: 0x118
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	callback::on_start_gametype(&start_gametype);
}

/*
	Name: start_gametype
	Namespace: weaponobjects
	Checksum: 0x1049691
	Offset: 0x158
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function start_gametype()
{
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: weaponobjects
	Checksum: 0x80F724D1
	Offset: 0x1A8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
}

