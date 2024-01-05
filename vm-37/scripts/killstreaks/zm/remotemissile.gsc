#using scripts\core_common\values_shared.gsc;
#using script_61828ad9e71c6616;
#using script_7bdcff4f92f3d220;
#using scripts\killstreaks\remotemissile_shared.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace remotemissile;

/*
	Name: __init__system__
	Namespace: remotemissile
	Checksum: 0x26A3EFED
	Offset: 0x118
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"remotemissile", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: remotemissile
	Checksum: 0x7D27588D
	Offset: 0x168
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("world", "" + #"hash_59ec82b1a72deb72", 1, 1, "int");
	init_shared("killstreak_remote_missile" + "_zm", &function_ea3ce28b);
	if(isdefined(level.killstreakrules[#"hero_weapons"]))
	{
		killstreakrules::addkillstreaktorule("remote_missile", "hero_weapons", 0, 0);
	}
	killstreaks::function_7b6102ed("remote_missile");
}

/*
	Name: function_ea3ce28b
	Namespace: remotemissile
	Checksum: 0x920BAC0C
	Offset: 0x240
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function function_ea3ce28b(killstreaktype)
{
	if(!self killstreakrules::function_34884f54())
	{
		self.var_baf4657c = 1;
		self killstreakrules::function_65739e7b("remote_missile");
		return 0;
	}
	self callback::function_d8abfc3d(#"hash_247d67dbf83dbc1a", &function_903cf6aa);
	self callback::function_d8abfc3d(#"hash_72a7670db71677f", &function_3e6a41b7);
	return tryusepredatormissile(killstreaktype);
}

/*
	Name: function_903cf6aa
	Namespace: remotemissile
	Checksum: 0x34329FFE
	Offset: 0x318
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_903cf6aa()
{
	level function_f7599440(1);
	self val::set(#"remote_missile", "ignoreme", 1);
	self val::set(#"remote_missile", "takedamage", 0);
}

/*
	Name: function_3e6a41b7
	Namespace: remotemissile
	Checksum: 0x9E378B8D
	Offset: 0x398
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_3e6a41b7()
{
	level function_f7599440(0);
	wait(2);
	if(isplayer(self))
	{
		self val::reset(#"remote_missile", "ignoreme");
		self val::reset(#"remote_missile", "takedamage");
	}
}

/*
	Name: function_f7599440
	Namespace: remotemissile
	Checksum: 0x3DA16AF3
	Offset: 0x430
	Size: 0xBE
	Parameters: 1
	Flags: Linked
*/
function function_f7599440(on)
{
	if(!isdefined(level.var_15ebb842))
	{
		level.var_15ebb842 = 0;
	}
	if(on)
	{
		clientfield::set("" + #"hash_59ec82b1a72deb72", 1);
		level.var_15ebb842++;
	}
	else
	{
		level.var_15ebb842--;
		if(level.var_15ebb842 <= 0)
		{
			clientfield::set("" + #"hash_59ec82b1a72deb72", 0);
			level.var_15ebb842 = undefined;
		}
	}
}

