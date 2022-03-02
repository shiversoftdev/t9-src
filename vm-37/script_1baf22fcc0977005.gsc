#using script_6b221588ece2c4aa;
#using script_8988fdbc78d6c53;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\mp_common\util.gsc;

#namespace weaponobjects;

/*
	Name: function_89f2df9
	Namespace: weaponobjects
	Checksum: 0x48D0AC60
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"weaponobjects", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: weaponobjects
	Checksum: 0xC299B227
	Offset: 0xF8
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
	Checksum: 0x41B9E17F
	Offset: 0x138
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
	Offset: 0x188
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
}

