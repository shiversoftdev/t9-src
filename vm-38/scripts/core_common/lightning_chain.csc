#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace lightning_chain;

/*
	Name: function_85bacde7
	Namespace: lightning_chain
	Checksum: 0xE295EE85
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_85bacde7()
{
	level notify(-5795328);
}

/*
	Name: __init__system__
	Namespace: lightning_chain
	Checksum: 0x9BEF5798
	Offset: 0xD0
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
	Checksum: 0x28C6AB97
	Offset: 0x118
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
	Checksum: 0xB4230D8E
	Offset: 0x248
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
	Checksum: 0x5D224480
	Offset: 0x290
	Size: 0x3C
	Parameters: 7
	Flags: Linked
*/
function lc_play_death_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
}

