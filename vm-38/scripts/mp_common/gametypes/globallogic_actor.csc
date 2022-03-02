#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace globallogic_actor;

/*
	Name: function_dc297b5d
	Namespace: globallogic_actor
	Checksum: 0xDF5DB471
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_dc297b5d()
{
	level notify(1547517482);
}

/*
	Name: function_89f2df9
	Namespace: globallogic_actor
	Checksum: 0xF4ACAC49
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"globallogic_actor", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: globallogic_actor
	Checksum: 0xB11258BF
	Offset: 0xF8
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level._effect[#"rcbombexplosion"] = #"killstreaks/fx_rcxd_exp";
}

