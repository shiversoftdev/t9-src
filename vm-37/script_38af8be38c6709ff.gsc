#using script_1650e0411c055aa7;
#using script_47fb62300ac0bd60;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace concertina_wire;

/*
	Name: function_89f2df9
	Namespace: concertina_wire
	Checksum: 0xC1854C1B
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2089d7dfe76d99c6", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: concertina_wire
	Checksum: 0x148C6675
	Offset: 0x118
	Size: 0xC4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(getgametypesetting(#"competitivesettings") === 1)
	{
		init_shared("concertina_wire_custom_settings_comp");
	}
	else
	{
		init_shared("concertina_wire_settings");
	}
	function_c5f0b9e7(&function_6230d238);
	function_d700c081(&function_806b0f85);
	level.var_cbec7a45 = 0;
	level.var_d1ae43e3 = &function_6190ae9e;
}

/*
	Name: function_6230d238
	Namespace: concertina_wire
	Checksum: 0xC1DF4B04
	Offset: 0x1E8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_6230d238(concertinawire)
{
	self battlechatter::function_bd715920(concertinawire.weapon, undefined, concertinawire.origin, concertinawire);
}

/*
	Name: function_806b0f85
	Namespace: concertina_wire
	Checksum: 0x8D2AF4F0
	Offset: 0x230
	Size: 0xAC
	Parameters: 2
	Flags: Linked
*/
function function_806b0f85(attacker, weapon)
{
	concertinawire = self;
	if(isdefined(level.figure_out_attacker))
	{
		attacker = self [[level.figure_out_attacker]](attacker);
	}
	if(isdefined(attacker) && isplayer(attacker) && concertinawire.owner !== attacker && isdefined(weapon))
	{
		attacker stats::function_e24eec31(weapon, #"hash_1c9da51ed1906285", 1);
	}
}

/*
	Name: function_6190ae9e
	Namespace: concertina_wire
	Checksum: 0x93C7CF7
	Offset: 0x2E8
	Size: 0x14A
	Parameters: 3
	Flags: Linked
*/
function function_6190ae9e(origin, angles, player)
{
	if(isdefined(level.var_87226c31.bundle.var_bc78f60e))
	{
		length2 = sqr(level.var_87226c31.bundle.var_bc78f60e + level.var_87226c31.bundle.maxwidth);
		foreach(protectedzone in level.var_87226c31.var_d6a27a84)
		{
			if(isdefined(protectedzone))
			{
				dist2 = distance2dsquared(player, protectedzone.origin);
				if(dist2 < length2)
				{
					return false;
				}
			}
		}
	}
	return true;
}

/*
	Name: function_18f38647
	Namespace: concertina_wire
	Checksum: 0xEF4CB5F2
	Offset: 0x440
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_18f38647(zone)
{
	array::add(level.var_87226c31.var_d6a27a84, zone);
}

/*
	Name: function_60a53911
	Namespace: concertina_wire
	Checksum: 0x8671DB30
	Offset: 0x480
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_60a53911(zone)
{
	arrayremovevalue(level.var_87226c31.var_d6a27a84, zone);
}

