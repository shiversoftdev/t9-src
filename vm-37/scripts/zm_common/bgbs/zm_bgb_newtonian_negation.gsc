#using script_3f9e0dc8454d98e1;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_bgb.gsc;

#namespace zm_bgb_newtonian_negation;

/*
	Name: function_89f2df9
	Namespace: zm_bgb_newtonian_negation
	Checksum: 0xB12857CB
	Offset: 0xB0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_bgb_newtonian_negation", &function_70a657d8, undefined, undefined, #"bgb");
}

/*
	Name: function_70a657d8
	Namespace: zm_bgb_newtonian_negation
	Checksum: 0xFC7AE8B4
	Offset: 0x100
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
	Checksum: 0x63ABC524
	Offset: 0x1D8
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
	Checksum: 0x85DB7D32
	Offset: 0x208
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
	Checksum: 0xEF3B9EC8
	Offset: 0x248
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
	Checksum: 0xEBB17407
	Offset: 0x290
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
	Checksum: 0x6320CEB1
	Offset: 0x370
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_8622e664(var_b4666218)
{
	level clientfield::set("newtonian_negation", var_b4666218);
}

