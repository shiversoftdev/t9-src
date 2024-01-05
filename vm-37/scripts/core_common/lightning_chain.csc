#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace lightning_chain;

/*
	Name: __init__system__
	Namespace: lightning_chain
	Checksum: 0x1554F0C3
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"lightning_chain", &init, undefined, undefined, undefined);
}

/*
	Name: init
	Namespace: lightning_chain
	Checksum: 0x147505AD
	Offset: 0xF8
	Size: 0x124
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("actor", "lc_fx", 1, 2, "int", &lc_shock_fx, 0, 1);
	clientfield::register("vehicle", "lc_fx", 1, 2, "int", &lc_shock_fx, 0, 0);
	clientfield::register("actor", "lc_death_fx", 1, 2, "int", &lc_play_death_fx, 0, 0);
	clientfield::register("vehicle", "lc_death_fx", 1, 2, "int", &lc_play_death_fx, 0, 0);
}

/*
	Name: lc_shock_fx
	Namespace: lightning_chain
	Checksum: 0x34B805DB
	Offset: 0x228
	Size: 0x3C
	Parameters: 7
	Flags: Linked
*/
function lc_shock_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
}

/*
	Name: lc_play_death_fx
	Namespace: lightning_chain
	Checksum: 0xA9FC7C74
	Offset: 0x270
	Size: 0x3C
	Parameters: 7
	Flags: Linked
*/
function lc_play_death_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
}

