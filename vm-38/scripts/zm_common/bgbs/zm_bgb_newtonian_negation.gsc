#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_bgb_newtonian_negation;

/*
	Name: function_237eca26
	Namespace: zm_bgb_newtonian_negation
	Checksum: 0x5B84F3BC
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_237eca26()
{
	level notify(1973655781);
}

/*
	Name: __init__system__
	Namespace: zm_bgb_newtonian_negation
	Checksum: 0xA09EDF1C
	Offset: 0xD0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_bgb_newtonian_negation", &function_70a657d8, undefined, undefined, #"bgb");
}

/*
	Name: function_70a657d8
	Namespace: zm_bgb_newtonian_negation
	Checksum: 0x535BA23C
	Offset: 0x120
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(level.bgb_in_use) && !is_true(level.var_5470be1c))
	{
		return;
	}
	clientfield::register("world", "newtonian_negation", 1, 1, "int");
	bgb::register(#"zm_bgb_newtonian_negation", "time", 1500, &enable, &disable, &validation);
}

/*
	Name: validation
	Namespace: zm_bgb_newtonian_negation
	Checksum: 0x81C6A613
	Offset: 0x1F8
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function validation()
{
	if(is_true(level.var_6bbb45f9))
	{
		return false;
	}
	return true;
}

/*
	Name: enable
	Namespace: zm_bgb_newtonian_negation
	Checksum: 0x600AF617
	Offset: 0x228
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function enable()
{
	function_8622e664(1);
	self thread function_4712db36();
}

/*
	Name: function_4712db36
	Namespace: zm_bgb_newtonian_negation
	Checksum: 0x6BA61D27
	Offset: 0x268
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_4712db36()
{
	self endon(#"hash_429f79a1bdb91087");
	self waittill(#"disconnect");
	thread disable();
}

/*
	Name: disable
	Namespace: zm_bgb_newtonian_negation
	Checksum: 0xC847EB9C
	Offset: 0x2B0
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function disable()
{
	if(isdefined(self))
	{
		self notify(#"hash_429f79a1bdb91087");
	}
	foreach(player in level.players)
	{
		if(player !== self && player bgb::is_enabled(#"zm_bgb_newtonian_negation"))
		{
			return;
		}
	}
	function_8622e664(0);
}

/*
	Name: function_8622e664
	Namespace: zm_bgb_newtonian_negation
	Checksum: 0xFA59F9AB
	Offset: 0x390
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_8622e664(var_b4666218)
{
	level clientfield::set("newtonian_negation", var_b4666218);
}

