#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_3faf478d5b0850fe;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_774302f762d76254;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

class class_3593c7e6 
{
	var var_c0503cf7;
	var var_89dfe89b;
	var var_24544f42;
	var var_edee94ca;
	var m_name;
	var var_9d95490b;
	var var_fde25292;
	var m_type;
	var var_b1b82dc;
	var var_c23bfa1e;

	/*
		Name: constructor
		Namespace: namespace_3593c7e6
		Checksum: 0xB1C5FB51
		Offset: 0x278
		Size: 0x4E
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.m_name = "";
		self.var_edee94ca = undefined;
		self.var_9d95490b = [];
		self.var_24544f42 = 100;
		self.var_c23bfa1e = undefined;
		self.m_type = -1;
	}

	/*
		Name: destructor
		Namespace: namespace_3593c7e6
		Checksum: 0x80F724D1
		Offset: 0x2D0
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16
	*/
	destructor()
	{
	}

	/*
		Name: function_10c2bd8
		Namespace: namespace_3593c7e6
		Checksum: 0x6A25E4C1
		Offset: 0x3E8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_10c2bd8()
	{
		return var_c0503cf7;
	}

	/*
		Name: function_744739a
		Namespace: namespace_3593c7e6
		Checksum: 0xA9BA422A
		Offset: 0x400
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_744739a()
	{
		return var_89dfe89b;
	}

	/*
		Name: function_17454656
		Namespace: namespace_3593c7e6
		Checksum: 0x3EA0D39
		Offset: 0x480
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_17454656()
	{
		return var_24544f42;
	}

	/*
		Name: getspawner
		Namespace: namespace_3593c7e6
		Checksum: 0x8D03CA6
		Offset: 0x3D0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getspawner()
	{
		return var_edee94ca;
	}

	/*
		Name: getname
		Namespace: namespace_3593c7e6
		Checksum: 0xB2D898C1
		Offset: 0x388
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function getname()
	{
		return m_name;
	}

	/*
		Name: function_3262a6e9
		Namespace: namespace_3593c7e6
		Checksum: 0xA50AAF42
		Offset: 0x430
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_3262a6e9(var_c940cca)
	{
		self.var_fde25292 = var_c940cca;
	}

	/*
		Name: function_36573e6c
		Namespace: namespace_3593c7e6
		Checksum: 0xC4006107
		Offset: 0x518
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_36573e6c(name)
	{
		self.var_9d95490b[var_9d95490b.size] = name;
	}

	/*
		Name: function_4a15d1dd
		Namespace: namespace_3593c7e6
		Checksum: 0xFEAD1543
		Offset: 0x418
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_4a15d1dd()
	{
		return var_fde25292;
	}

	/*
		Name: function_5ce4fb28
		Namespace: namespace_3593c7e6
		Checksum: 0x9BA24851
		Offset: 0x3A0
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_5ce4fb28()
	{
		return m_type;
	}

	/*
		Name: function_7edd7727
		Namespace: namespace_3593c7e6
		Checksum: 0x253E6568
		Offset: 0x458
		Size: 0x1A
		Parameters: 1
		Flags: Linked
	*/
	function function_7edd7727(val)
	{
		self.var_24544f42 = val;
	}

	/*
		Name: function_7f3e577e
		Namespace: namespace_3593c7e6
		Checksum: 0xC3FAD96F
		Offset: 0x4D0
		Size: 0x3C
		Parameters: 1
		Flags: Linked
	*/
	function function_7f3e577e(range)
	{
		if(!isdefined(range))
		{
			range = 100;
		}
		return randomint(range) < var_24544f42;
	}

	/*
		Name: init
		Namespace: namespace_3593c7e6
		Checksum: 0x8D0F07C5
		Offset: 0x2E0
		Size: 0x9E
		Parameters: 6
		Flags: Linked
	*/
	function init(spawner, name, type, init_func, think_func, var_af7a3d7c)
	{
		self.m_name = name;
		self.m_type = type;
		self.var_b1b82dc = 1 << type;
		self.var_edee94ca = spawner;
		self.var_c0503cf7 = init_func;
		self.var_89dfe89b = think_func;
		self.var_c23bfa1e = var_af7a3d7c;
		self.var_fde25292 = undefined;
	}

	/*
		Name: function_b8c8dfea
		Namespace: namespace_3593c7e6
		Checksum: 0x4A71C144
		Offset: 0x3B8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function function_b8c8dfea()
	{
		return var_b1b82dc;
	}

	/*
		Name: function_baae6c9d
		Namespace: namespace_3593c7e6
		Checksum: 0x8970253F
		Offset: 0x548
		Size: 0x22
		Parameters: 1
		Flags: Linked
	*/
	function function_baae6c9d(name)
	{
		return isinarray(var_9d95490b, name);
	}

	/*
		Name: canspawn
		Namespace: namespace_3593c7e6
		Checksum: 0x72575F56
		Offset: 0x498
		Size: 0x28
		Parameters: 0
		Flags: Linked
	*/
	function canspawn()
	{
		if(isdefined(var_c23bfa1e))
		{
			return [[var_c23bfa1e]]();
		}
		return 1;
	}

}

#namespace doa_enemy;

/*
	Name: init
	Namespace: doa_enemy
	Checksum: 0x6166A4A7
	Offset: 0x8D0
	Size: 0x2A8
	Parameters: 0
	Flags: Linked
*/
function init()
{
	namespace_250e9486::init();
	level.doa.var_adb2d4b9 = [];
	spawners = getspawnerarray("doa_enemy", "targetname");
	foreach(spawner in spawners)
	{
		var_d240d5de = undefined;
		var_41157a40 = undefined;
		var_c8ceaddf = undefined;
		var_9f19fcb6 = 100;
		type = -1;
		result = level namespace_250e9486::function_2c6dd74c(spawner);
		if(isdefined(result))
		{
			var_d240d5de = result.var_d240d5de;
			var_41157a40 = result.var_41157a40;
			var_c8ceaddf = result.var_c8ceaddf;
			var_9f19fcb6 = result.var_9f19fcb6;
			type = result.type;
		}
		var_7a8f2a62 = function_eff7e0fb(spawner, spawner.script_noteworthy, type, var_d240d5de, var_41157a40, var_c8ceaddf);
		[[ var_7a8f2a62 ]]->function_7edd7727(var_9f19fcb6);
		if(isdefined(result))
		{
			foreach(arena in result.var_71e54e3a)
			{
				[[ var_7a8f2a62 ]]->function_36573e6c(arena);
			}
		}
		var_663588d = "Zombietron/AI/";
		var_59ea00e = ("scr_spawn_enemy " + ([[ var_7a8f2a62 ]]->getname())) + "; zombie_devgui enemy";
		util::add_devgui(var_663588d + ([[ var_7a8f2a62 ]]->getname()), var_59ea00e);
	}
}

/*
	Name: function_2f73ff73
	Namespace: doa_enemy
	Checksum: 0x34806AD8
	Offset: 0xB80
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function function_2f73ff73()
{
	level.doa.var_dcbded2 = [];
	level.doa.var_af6d47dd = [];
	level.doa.var_e2e8967b = [];
	level.doa.var_329c97a3 = [];
	level.doa.var_13e8f9c9 = undefined;
	level.doa.var_f4cf4e3 = 24;
	level.doa.zombie_health = 1000;
	level.doa.var_2ad97fac = 0;
	level.doa.var_65a70dc = function_d7c5adee("basic_zombie");
	function_83d593c5(level.doa.var_65a70dc);
}

/*
	Name: main
	Namespace: doa_enemy
	Checksum: 0x935D4A6C
	Offset: 0xC70
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function main()
{
	function_2f73ff73();
	level thread function_7292bc();
}

/*
	Name: function_c617d577
	Namespace: doa_enemy
	Checksum: 0xAEB9C7F4
	Offset: 0xCA8
	Size: 0x8A
	Parameters: 0
	Flags: Linked
*/
function function_c617d577()
{
	level endon(#"game_over");
	self notify("13d7a68c50b7bd36");
	self endon("13d7a68c50b7bd36");
	while(true)
	{
		level waittill(#"round_about_to_start", #"round_over", #"doa_exit_taken");
		level.doa.var_2ad97fac = 0;
	}
}

/*
	Name: function_7495bd30
	Namespace: doa_enemy
	Checksum: 0x9ACC3F84
	Offset: 0xD40
	Size: 0x14E
	Parameters: 0
	Flags: Linked
*/
function function_7495bd30()
{
	self notify("13a24a56ec61b2f9");
	self endon("13a24a56ec61b2f9");
	level endon(#"game_over", #"hash_40a4d01c20db352c");
	level thread function_c617d577();
	level.doa.var_2ad97fac = 0;
	level.doa.var_afae28e0 = 0;
	while(true)
	{
		last = level.doa.var_afae28e0;
		wait(1);
		if(last == level.doa.var_afae28e0)
		{
			if(level.doa.var_2ad97fac < 30)
			{
				level.doa.var_2ad97fac++;
			}
		}
		else
		{
			level.doa.var_2ad97fac = level.doa.var_2ad97fac - 8;
			if(level.doa.var_2ad97fac < 0)
			{
				level.doa.var_2ad97fac = 0;
			}
		}
	}
}

/*
	Name: function_e7e91016
	Namespace: doa_enemy
	Checksum: 0xBE4EC44C
	Offset: 0xE98
	Size: 0x38
	Parameters: 0
	Flags: Linked
*/
function function_e7e91016()
{
	if(flag::get("doa_round_spawning"))
	{
		return level.doa.var_2ad97fac == 30;
	}
	return 0;
}

/*
	Name: function_83d593c5
	Namespace: doa_enemy
	Checksum: 0x43DE79FE
	Offset: 0xED8
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function function_83d593c5(var_7a8f2a62)
{
	if(!isinarray(level.doa.var_329c97a3, var_7a8f2a62))
	{
		level.doa.var_329c97a3[level.doa.var_329c97a3.size] = var_7a8f2a62;
	}
}

/*
	Name: function_251ee3bd
	Namespace: doa_enemy
	Checksum: 0x289F6D17
	Offset: 0xF40
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function function_251ee3bd(name)
{
	def = function_d7c5adee(name);
	if(isdefined(def))
	{
		function_83d593c5(def);
	}
	return def;
}

/*
	Name: function_eff7e0fb
	Namespace: doa_enemy
	Checksum: 0x5F7FC8FF
	Offset: 0xF98
	Size: 0x124
	Parameters: 6
	Flags: Linked
*/
function function_eff7e0fb(spawner, name, type, init, think, canspawn)
{
	var_7a8f2a62 = new class_3593c7e6();
	[[ var_7a8f2a62 ]]->init(spawner, name, type, init, think, canspawn);
	if(name == "basic_zombie")
	{
		[[ var_7a8f2a62 ]]->function_3262a6e9(&function_8a080c79);
		level.doa.var_65a70dc = var_7a8f2a62;
	}
	if(name == "crawler_zombie")
	{
		[[ var_7a8f2a62 ]]->function_3262a6e9(&killme);
	}
	if(isdefined([[ var_7a8f2a62 ]]->getspawner()))
	{
		level.doa.var_adb2d4b9[level.doa.var_adb2d4b9.size] = var_7a8f2a62;
	}
	return var_7a8f2a62;
}

/*
	Name: function_c89f6305
	Namespace: doa_enemy
	Checksum: 0xE466E8BB
	Offset: 0x10C8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_c89f6305()
{
	if(namespace_4dae815d::function_59a9cf1d() == 0)
	{
		namespace_1e25ad94::debugmsg((("AI moveFailure at:" + self.origin) + " AI Type: ") + self.zombie_type);
	}
}

/*
	Name: function_8a080c79
	Namespace: doa_enemy
	Checksum: 0x74414023
	Offset: 0x1120
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_8a080c79()
{
	self thread namespace_ec06fe4a::function_570729f0(0.5);
	self namespace_ed80aead::function_586ef822();
}

/*
	Name: killme
	Namespace: doa_enemy
	Checksum: 0xF72C09CC
	Offset: 0x1168
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function killme()
{
	self thread namespace_ec06fe4a::function_570729f0(0.1);
}

/*
	Name: function_d7c5adee
	Namespace: doa_enemy
	Checksum: 0xDD1ACA7F
	Offset: 0x1198
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_d7c5adee(name)
{
	foreach(def in level.doa.var_adb2d4b9)
	{
		if(([[ def ]]->getname()) === name)
		{
			return def;
		}
	}
}

/*
	Name: function_924423d
	Namespace: doa_enemy
	Checksum: 0x771E8110
	Offset: 0x1248
	Size: 0x126
	Parameters: 1
	Flags: Linked
*/
function function_924423d(ent)
{
	items = [];
	newqueue = [];
	foreach(item in level.doa.var_dcbded2)
	{
		if(item.notifyent === ent)
		{
			items[items.size] = ent;
			continue;
		}
		if(!isdefined(newqueue))
		{
			newqueue = [];
		}
		else if(!isarray(newqueue))
		{
			newqueue = array(newqueue);
		}
		newqueue[newqueue.size] = item;
	}
	level.doa.var_dcbded2 = newqueue;
	return items;
}

/*
	Name: function_f7086924
	Namespace: doa_enemy
	Checksum: 0x3D3C14C1
	Offset: 0x1378
	Size: 0x10A
	Parameters: 1
	Flags: Linked
*/
function function_f7086924(var_64a23077)
{
	newqueue = [];
	foreach(item in level.doa.var_dcbded2)
	{
		if(item.var_64a23077 === var_64a23077)
		{
			continue;
		}
		if(!isdefined(newqueue))
		{
			newqueue = [];
		}
		else if(!isarray(newqueue))
		{
			newqueue = array(newqueue);
		}
		newqueue[newqueue.size] = item;
	}
	level.doa.var_dcbded2 = newqueue;
}

/*
	Name: function_5982ca9d
	Namespace: doa_enemy
	Checksum: 0x87538C67
	Offset: 0x1490
	Size: 0x1B6
	Parameters: 10
	Flags: Linked
*/
function function_5982ca9d(spawndef, count, targetpoint, radius, generator, enemy, var_294cccb7, arena, groupid, var_5a0af621)
{
	if(!isdefined(count))
	{
		count = 10;
	}
	if(!isdefined(radius))
	{
		radius = 0;
	}
	var_3046d90a = spawnstruct();
	var_3046d90a.spawndef = spawndef;
	var_3046d90a.targetpoint = targetpoint;
	var_3046d90a.radius = radius;
	var_3046d90a.count = count;
	var_3046d90a.enemy = enemy;
	var_3046d90a.notifyent = var_294cccb7;
	var_3046d90a.groupid = groupid;
	if(var_5a0af621 !== -1)
	{
		var_3046d90a.expiration = (isdefined(var_5a0af621) ? var_5a0af621 : gettime() + 3000);
	}
	var_3046d90a.var_64a23077 = (isdefined(generator) ? [[ generator ]]->getmodel() : undefined);
	if(isdefined(generator))
	{
		var_3046d90a.var_d55f22cb = 1;
	}
	var_3046d90a.arena = arena;
	if(!isdefined(arena) && !isdefined(level.doa.var_6f3d327) && level.doa.world_state == 0)
	{
		var_3046d90a.arena = level.doa.var_39e3fa99;
	}
	return var_3046d90a;
}

/*
	Name: function_4e8ae191
	Namespace: doa_enemy
	Checksum: 0xCE0419F3
	Offset: 0x1650
	Size: 0xBA
	Parameters: 10
	Flags: Linked
*/
function function_4e8ae191(spawndef, count, targetpoint, radius, generator, enemy, var_294cccb7, arena, groupid, var_5a0af621)
{
	if(!isdefined(count))
	{
		count = 10;
	}
	if(!isdefined(radius))
	{
		radius = 0;
	}
	var_3046d90a = function_5982ca9d(spawndef, count, targetpoint, radius, generator, enemy, var_294cccb7, arena, groupid, var_5a0af621);
	return spawnai(var_3046d90a, targetpoint);
}

/*
	Name: function_a6b807ea
	Namespace: doa_enemy
	Checksum: 0x7D0D840
	Offset: 0x1718
	Size: 0x17C
	Parameters: 11
	Flags: Linked
*/
function function_a6b807ea(spawndef, count, targetpoint, radius, generator, enemy, var_294cccb7, arena, groupid, var_1be0f060, var_5a0af621)
{
	if(!isdefined(count))
	{
		count = 10;
	}
	if(!isdefined(radius))
	{
		radius = 0;
	}
	if(!isdefined(var_1be0f060))
	{
		var_1be0f060 = 0;
	}
	if(!isdefined(spawndef))
	{
		return;
	}
	if(isdefined(generator))
	{
		if(level.doa.var_dcbded2.size > 256)
		{
			return;
		}
	}
	/#
		assert(level.doa.var_dcbded2.size < 500, "");
	#/
	var_3046d90a = function_5982ca9d(spawndef, count, targetpoint, radius, generator, enemy, var_294cccb7, arena, groupid, var_5a0af621);
	if(!var_1be0f060)
	{
		level.doa.var_dcbded2[level.doa.var_dcbded2.size] = var_3046d90a;
	}
	else
	{
		arrayinsert(level.doa.var_dcbded2, var_3046d90a, 0);
	}
}

/*
	Name: function_7292bc
	Namespace: doa_enemy
	Checksum: 0xD659CC32
	Offset: 0x18A0
	Size: 0x614
	Parameters: 0
	Flags: Linked
*/
function function_7292bc()
{
	self notify("4c835e34b1643ae0");
	self endon("4c835e34b1643ae0");
	level endon(#"game_over");
	var_1fb31dea = gettime() + 2000;
	while(true)
	{
		time = gettime();
		if(namespace_4dae815d::function_59a9cf1d() != 0 && time > var_1fb31dea)
		{
			var_ba479a33 = [];
			foreach(var_3046d90a in level.doa.var_dcbded2)
			{
				if(is_true(var_3046d90a.var_d55f22cb) && !isdefined(var_3046d90a.var_64a23077))
				{
					var_ba479a33[var_ba479a33.size] = var_3046d90a;
				}
			}
			foreach(removeitem in var_ba479a33)
			{
				arrayremovevalue(level.doa.var_dcbded2, removeitem);
			}
			var_ba479a33 = [];
			var_1fb31dea = (gettime() + 1000) + randomint(1500);
		}
		if(level.doa.var_dcbded2.size > 0)
		{
			spawner::global_spawn_throttle();
			scanned = 0;
			while(level.doa.var_dcbded2.size)
			{
				var_3046d90a = level.doa.var_dcbded2[0];
				scanned++;
				if(scanned > 20)
				{
					waitframe(1);
					scanned = 0;
				}
				if(var_3046d90a.count <= 0)
				{
					var_3046d90a = undefined;
					arrayremoveindex(level.doa.var_dcbded2, 0);
					continue;
				}
				if(isdefined(var_3046d90a.expiration) && time > var_3046d90a.expiration)
				{
					arrayremoveindex(level.doa.var_dcbded2, 0);
					level.doa.var_2b4e2465 = level.doa.var_2b4e2465 + var_3046d90a.count;
					var_3046d90a = undefined;
					continue;
				}
				break;
			}
			if(!isdefined(var_3046d90a) || namespace_250e9486::function_60f6a9e() == 0)
			{
				waitframe(1);
				continue;
			}
			if(isdefined(var_3046d90a.groupid))
			{
				groupid = var_3046d90a.groupid;
				var_d9e7e8e2 = 0;
				idx = 0;
				while(true)
				{
					if(level.doa.var_dcbded2.size > idx && level.doa.var_dcbded2[idx].groupid === groupid)
					{
						var_d9e7e8e2 = var_d9e7e8e2 + level.doa.var_dcbded2[idx].count;
						level.doa.var_dcbded2[idx].groupid = undefined;
						idx++;
					}
					else
					{
						break;
					}
				}
				for(var_44f97d52 = 10; var_44f97d52; var_44f97d52--)
				{
					var_68a09a83 = namespace_250e9486::function_17d3b57();
					if(var_68a09a83 >= var_d9e7e8e2)
					{
						break;
					}
					wait(1);
				}
			}
			if(var_3046d90a.radius > 0)
			{
				spawn_spot = namespace_ec06fe4a::function_65ee50ba(var_3046d90a.targetpoint + (randomintrange(var_3046d90a.radius * -1, var_3046d90a.radius), randomintrange(var_3046d90a.radius * -1, var_3046d90a.radius), 0));
			}
			else
			{
				spawn_spot = var_3046d90a.targetpoint;
			}
			ai = spawnai(var_3046d90a, spawn_spot);
			if(isdefined(ai))
			{
				/#
					if(isdefined(ai))
					{
						namespace_1e25ad94::debugmsg(((("" + ai getentitynumber()) + "") + ([[ var_3046d90a.spawndef ]]->getname()) + "") + ai.origin);
					}
					else
					{
						namespace_1e25ad94::debugmsg("" + ([[ var_3046d90a.spawndef ]]->getname()));
					}
				#/
			}
		}
		else
		{
			wait(0.25);
		}
	}
}

/*
	Name: spawnai
	Namespace: doa_enemy
	Checksum: 0x20185F71
	Offset: 0x1EC0
	Size: 0x3C0
	Parameters: 2
	Flags: Linked
*/
function spawnai(var_984b8ddf, spawnloc)
{
	if(!namespace_250e9486::function_60f6a9e())
	{
		level.doa.var_cde5274e++;
		return;
	}
	if(([[ var_984b8ddf.spawndef ]]->canspawn()) == 0)
	{
		return;
	}
	ai = function_db55a448(var_984b8ddf.spawndef, spawnloc, var_984b8ddf.enemy);
	if(isdefined(ai))
	{
		level.doa.var_9fcf26ea++;
		if(!is_true(ai.basic))
		{
			level.doa.var_5de71250++;
		}
		var_984b8ddf.count--;
		namespace_1e25ad94::debugmsg((("Type " + ([[ var_984b8ddf.spawndef ]]->getname())) + " spawning; count left: ") + var_984b8ddf.count);
		ai.arena = var_984b8ddf.arena;
		if(isdefined(var_984b8ddf.var_64a23077) && isdefined(var_984b8ddf.var_64a23077.generator))
		{
			[[ var_984b8ddf.var_64a23077.generator ]]->function_bcd1aaf5(ai);
			center = [[ var_984b8ddf.var_64a23077.generator ]]->getcenter();
			radius = [[ var_984b8ddf.var_64a23077.generator ]]->function_e5ee7aea();
			ai.var_c8b974fe = center;
			ai.var_f506c5cd = radius;
			ai.var_32d07c96 = sqr(radius) + (sqr(radius) >> 2);
			ai.var_5603780 = [[ var_984b8ddf.spawndef ]]->function_4a15d1dd();
			ai.var_d55f22cb = 1;
			if(isactor(ai))
			{
				ai forceteleport(ai.origin, ai.angles + (0, randomint(360), 0));
			}
			var_6b57b559 = (getplayers().size - 1) * 0.1;
			if(var_6b57b559 > 0)
			{
				ai.maxhealth = ai.maxhealth + (int(ai.maxhealth * var_6b57b559));
				ai.health = ai.maxhealth;
			}
			var_984b8ddf.var_64a23077 = undefined;
		}
		if(isdefined(var_984b8ddf.notifyent))
		{
			namespace_1e25ad94::debugmsg((("ai_queue_spawned notify sending for ent:" + ai getentitynumber()) + " at: ") + gettime());
			var_984b8ddf.notifyent notify(#"hash_4c72e79bdad8315e", {#time:gettime(), #ai:ai});
		}
	}
	else
	{
		level.doa.var_de939ab7++;
	}
	return ai;
}

/*
	Name: function_db55a448
	Namespace: doa_enemy
	Checksum: 0x554504EF
	Offset: 0x2288
	Size: 0x2AE
	Parameters: 3
	Flags: Linked
*/
function function_db55a448(spawndef, spawn_spot, enemy)
{
	ai = [[ spawndef ]]->getspawner() spawner::spawn(1, undefined, spawn_spot);
	if(isdefined(ai))
	{
		ai.var_e53efa7e = [[ spawndef ]]->function_5ce4fb28();
		ai.var_22b748b = [[ spawndef ]]->function_b8c8dfea();
		ai ghost();
		if(isdefined(enemy))
		{
			ai.favoriteenemy = enemy;
			ai setentitytarget(enemy);
		}
		ai.spawndef = spawndef;
		var_d240d5de = [[ spawndef ]]->function_10c2bd8();
		if(!isdefined(var_d240d5de))
		{
			var_d240d5de = &namespace_250e9486::function_25b2c8a9;
		}
		ai [[var_d240d5de]]();
		if(isdefined(ai.spawnloc))
		{
			if(isactor(ai))
			{
				ai forceteleport(ai.spawnloc.origin, ai.spawnloc.angles);
			}
			else if(isvehicle(ai))
			{
				ai.origin = ai.spawnloc.origin;
				ai.angles = ai.spawnloc.angles;
			}
		}
		else
		{
			if(isactor(ai))
			{
				ai forceteleport(spawn_spot);
			}
			else if(isvehicle(ai))
			{
				ai.origin = spawn_spot;
			}
		}
		var_41157a40 = [[ spawndef ]]->function_744739a();
		if(!isdefined(var_41157a40))
		{
			var_41157a40 = &namespace_250e9486::function_8971bbb7;
		}
		ai thread [[var_41157a40]]();
		ai thread function_b56f90d7(ai.var_651e2d9b);
		if(isdefined(level.doa.var_4425d066))
		{
			ai [[level.doa.var_4425d066]]();
		}
	}
	return ai;
}

/*
	Name: function_b56f90d7
	Namespace: doa_enemy
	Checksum: 0xB4A407DF
	Offset: 0x2540
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_b56f90d7(delay)
{
	if(!isdefined(delay))
	{
		delay = 0.1;
	}
	self endon(#"hash_5251ab0953e7989f");
	self endon(#"death");
	if(delay > 0)
	{
		wait(delay);
	}
	self namespace_ec06fe4a::function_4f72130c();
	self solid();
}

/*
	Name: function_4b2f19cb
	Namespace: doa_enemy
	Checksum: 0x45140EEA
	Offset: 0x25C8
	Size: 0x192
	Parameters: 0
	Flags: Linked
*/
function function_4b2f19cb()
{
	if(namespace_4dae815d::function_59a9cf1d() == 0)
	{
		spot = [[ level.doa.var_39e3fa99 ]]->function_70fb5745();
		return spot.origin;
	}
	if(!isdefined(self.var_f506c5cd))
	{
		return undefined;
	}
	range = randomfloatrange(0.65, 0.98);
	distance = self.var_f506c5cd * range;
	angle = randomint(360);
	vec = (distance, 0, 0);
	rotated = namespace_ec06fe4a::function_f1e8ce76(vec, angle);
	groundpos = groundtrace((self.var_c8b974fe + rotated) + vectorscale((0, 0, 1), 1024) + vectorscale((0, 0, 1), 8), (self.var_c8b974fe + rotated) + vectorscale((0, 0, 1), 1024) + (vectorscale((0, 0, -1), 100000)), 0, self)[#"position"];
	return getclosestpointonnavmesh(groundpos, 10000);
}

