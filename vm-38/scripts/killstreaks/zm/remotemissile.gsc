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
	Name: function_367e41f9
	Namespace: remotemissile
	Checksum: 0xBDD30C31
	Offset: 0x140
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_367e41f9()
{
	level notify(-26506275);
}

/*
	Name: __init__system__
	Namespace: remotemissile
	Checksum: 0xE2E13402
	Offset: 0x160
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
	Checksum: 0xA6FAE1E1
	Offset: 0x1B0
	Size: 0x164
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("world", "" + #"hash_59ec82b1a72deb72", 1, 1, "int");
	clientfield::register("toplayer", "" + #"hash_7bdbbf163a28169", 6000, 1, "int");
	clientfield::register("toplayer", "" + #"hash_4241f7b51f8c144", 8000, 1, "int");
	init_shared("killstreak_remote_missile" + "_zm", &function_ea3ce28b);
	if(isdefined(level.killstreakrules[#"hero_weapons"]))
	{
		killstreakrules::addkillstreaktorule("remote_missile", "hero_weapons", 0, 0);
	}
	killstreaks::function_7b6102ed("remote_missile");
	killstreaks::function_7b6102ed("inventory_remote_missile");
}

/*
	Name: function_ea3ce28b
	Namespace: remotemissile
	Checksum: 0xBC182D8F
	Offset: 0x320
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function function_ea3ce28b(killstreaktype)
{
	if(!self killstreakrules::function_71e94a3b())
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
	Checksum: 0x8EB36861
	Offset: 0x3F8
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_903cf6aa()
{
	level function_f7599440(1);
	self clientfield::set_to_player("" + #"hash_4241f7b51f8c144", 1);
	self val::set(#"remote_missile", "ignoreme", 1);
	self val::set(#"remote_missile", "takedamage", 0);
}

/*
	Name: function_3e6a41b7
	Namespace: remotemissile
	Checksum: 0x68CAE24E
	Offset: 0x4A8
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_3e6a41b7()
{
	level function_f7599440(0);
	self clientfield::set_to_player("" + #"hash_4241f7b51f8c144", 0);
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
	Checksum: 0x1B26549D
	Offset: 0x568
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

