#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\abilities\gadgets\gadget_smart_cover.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace gadget_smart_cover;

/*
	Name: function_3ac6ff77
	Namespace: gadget_smart_cover
	Checksum: 0xD74A4C7
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3ac6ff77()
{
	level notify(-367340919);
}

#namespace smart_cover;

/*
	Name: __init__system__
	Namespace: smart_cover
	Checksum: 0xA34D3656
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"gadget_smart_cover", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: smart_cover
	Checksum: 0x35915A90
	Offset: 0x100
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	function_649f8cbe(&onsmartcoverplaced);
	function_a9427b5c(&function_a430cceb);
	level.var_b57c1895 = &function_9a2b3318;
}

/*
	Name: onsmartcoverplaced
	Namespace: smart_cover
	Checksum: 0xEF6FD263
	Offset: 0x178
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function onsmartcoverplaced(smartcover)
{
	self battlechatter::function_fc82b10(smartcover.weapon, smartcover.origin, smartcover);
	self callback::callback(#"hash_70eeb7d813f149b2", {#cover:smartcover.smartcover, #owner:self});
}

/*
	Name: function_a430cceb
	Namespace: smart_cover
	Checksum: 0x7E352DEF
	Offset: 0x208
	Size: 0x114
	Parameters: 2
	Flags: Linked
*/
function function_a430cceb(attacker, weapon)
{
	concertinawire = self;
	if(isdefined(level.figure_out_attacker))
	{
		attacker = self [[level.figure_out_attacker]](attacker);
	}
	if(isdefined(attacker) && isplayer(attacker) && concertinawire.owner !== attacker && isdefined(weapon))
	{
		attacker stats::function_e24eec31(weapon, #"hash_1c9da51ed1906285", 1);
		killstreaks::function_e729ccee(attacker, weapon);
	}
	self callback::callback(#"hash_15858698313c5f32", {#cover:self, #owner:self.owner});
}

/*
	Name: function_9a2b3318
	Namespace: smart_cover
	Checksum: 0xFB25D82A
	Offset: 0x328
	Size: 0x14A
	Parameters: 3
	Flags: Linked
*/
function function_9a2b3318(origin, angles, player)
{
	if(isdefined(level.var_5101157d.bundle.var_bc78f60e))
	{
		length2 = sqr(level.var_5101157d.bundle.var_bc78f60e + level.var_5101157d.bundle.maxwidth);
		foreach(protectedzone in level.var_5101157d.var_d6a27a84)
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
	Namespace: smart_cover
	Checksum: 0x73AA84CF
	Offset: 0x480
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_18f38647(zone)
{
	array::add(level.var_5101157d.var_d6a27a84, zone);
}

/*
	Name: function_60a53911
	Namespace: smart_cover
	Checksum: 0x401001E6
	Offset: 0x4C0
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_60a53911(zone)
{
	arrayremovevalue(level.var_5101157d.var_d6a27a84, zone);
}

