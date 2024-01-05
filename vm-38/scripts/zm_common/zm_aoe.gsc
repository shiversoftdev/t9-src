#using scripts\zm_common\zm.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

class class_8d574d24 
{

	/*
		Name: constructor
		Namespace: namespace_8d574d24
		Checksum: 0x5139B7BD
		Offset: 0x170
		Size: 0x2A
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.spawntime = gettime();
		self.state = 0;
		self.var_be1913ae = gettime() + 100;
	}

	/*
		Name: destructor
		Namespace: namespace_8d574d24
		Checksum: 0x80F724D1
		Offset: 0x1A8
		Size: 0x4
		Parameters: 0
		Flags: Linked, 128
	*/
	destructor()
	{
	}

}

class class_698343df 
{

	/*
		Name: constructor
		Namespace: namespace_698343df
		Checksum: 0x679170C9
		Offset: 0x240
		Size: 0xE
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.var_9a08bb02 = [];
	}

	/*
		Name: destructor
		Namespace: namespace_698343df
		Checksum: 0x80F724D1
		Offset: 0x258
		Size: 0x4
		Parameters: 0
		Flags: Linked, 128
	*/
	destructor()
	{
	}

}

#namespace zm_aoe;

/*
	Name: function_5a21617a
	Namespace: zm_aoe
	Checksum: 0xF893EAA
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5a21617a()
{
	level notify(-636054716);
}

/*
	Name: __init__system__
	Namespace: zm_aoe
	Checksum: 0x8DDA802D
	Offset: 0x118
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_aoe", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_aoe
	Checksum: 0xF64BA1D4
	Offset: 0x2F0
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "aoe_state", 1, getminbitcountfornum(5), "int");
	clientfield::register("scriptmover", "aoe_id", 1, getminbitcountfornum(2), "int");
}

/*
	Name: function_8ac3bea9
	Namespace: zm_aoe
	Checksum: 0x87E598BE
	Offset: 0x380
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	function_15dea507(1, "zm_aoe_radiation_hazard", 10, 95000, 5000, 1, 1, 75, 175);
}

/*
	Name: function_e969e75
	Namespace: zm_aoe
	Checksum: 0xF4543642
	Offset: 0x3D0
	Size: 0x98
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e969e75(type)
{
	/#
		assert(isdefined(level.var_400ae143));
	#/
	arraykeys = getarraykeys(level.var_400ae143);
	if(isinarray(arraykeys, hash(type)))
	{
		return level.var_400ae143[hash(type)];
	}
	return undefined;
}

/*
	Name: function_15dea507
	Namespace: zm_aoe
	Checksum: 0x2BF9130D
	Offset: 0x470
	Size: 0x1C4
	Parameters: 9
	Flags: Linked
*/
function function_15dea507(aoeid, type, var_3a11a165, lifetime, var_f2cd3aad, damagemin, damagemax, radius, height)
{
	if(!isdefined(level.var_400ae143))
	{
		level.var_400ae143 = [];
	}
	arraykeys = getarraykeys(level.var_400ae143);
	/#
		assert(!isinarray(arraykeys, hash(type)));
	#/
	var_508aaded = new class_698343df();
	level.var_400ae143[type] = var_508aaded;
	/#
		assert(damagemin <= damagemax, "");
	#/
	var_508aaded.type = type;
	var_508aaded.var_3a11a165 = var_3a11a165;
	var_508aaded.lifetime = lifetime;
	var_508aaded.damagemin = damagemin;
	var_508aaded.damagemax = damagemax;
	var_508aaded.var_f2cd3aad = var_f2cd3aad;
	var_508aaded.radius = radius;
	var_508aaded.height = height;
	var_508aaded.aoeid = aoeid;
	level thread function_60bb02f3(type);
	/#
		level thread function_e39c0be4(var_508aaded);
	#/
}

/*
	Name: function_371b4147
	Namespace: zm_aoe
	Checksum: 0x2EA5735B
	Offset: 0x640
	Size: 0x1C2
	Parameters: 6
	Flags: None
*/
function function_371b4147(aoeid, type, position, userdata, var_fb4d789f, var_6efc944c)
{
	var_46f1b5eb = function_e969e75(type);
	/#
		assert(isdefined(var_46f1b5eb), "");
	#/
	if(var_46f1b5eb.var_9a08bb02.size >= var_46f1b5eb.var_3a11a165)
	{
		function_2c33d107(type);
	}
	/#
		assert(var_46f1b5eb.var_9a08bb02.size < var_46f1b5eb.var_3a11a165);
	#/
	aoe = new class_8d574d24();
	aoe.position = position;
	aoe.endtime = gettime() + var_46f1b5eb.lifetime;
	aoe.entity = spawn("script_model", position);
	aoe.type = type;
	aoe.entity clientfield::set("aoe_id", aoeid);
	function_668a9b2d(aoe, type);
	if(isdefined(userdata))
	{
		aoe.userdata = userdata;
	}
	if(isdefined(var_fb4d789f))
	{
		aoe.var_fb4d789f = var_fb4d789f;
	}
	if(isdefined(var_6efc944c))
	{
		aoe.var_6efc944c = var_6efc944c;
	}
}

/*
	Name: function_668a9b2d
	Namespace: zm_aoe
	Checksum: 0x15818F59
	Offset: 0x810
	Size: 0xA4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_668a9b2d(aoe, type)
{
	var_46f1b5eb = function_e969e75(type);
	/#
		assert(isdefined(var_46f1b5eb), "");
	#/
	array::add(var_46f1b5eb.var_9a08bb02, aoe);
	/#
		assert(var_46f1b5eb.var_9a08bb02.size <= var_46f1b5eb.var_3a11a165);
	#/
}

/*
	Name: function_87bbe4fc
	Namespace: zm_aoe
	Checksum: 0x2A062CD9
	Offset: 0x8C0
	Size: 0x108
	Parameters: 1
	Flags: Linked, Private
*/
function private function_87bbe4fc(type)
{
	var_46f1b5eb = function_e969e75(type);
	/#
		assert(isdefined(var_46f1b5eb), "");
	#/
	if(var_46f1b5eb.var_9a08bb02.size)
	{
		oldest = var_46f1b5eb.var_9a08bb02[0];
		foreach(aoe in var_46f1b5eb.var_9a08bb02)
		{
			if(aoe.spawntime < oldest.spawntime)
			{
				oldest = aoe;
			}
		}
		return oldest;
	}
}

/*
	Name: function_fa03204a
	Namespace: zm_aoe
	Checksum: 0xAF79EBDB
	Offset: 0x9D0
	Size: 0x12C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_fa03204a(aoe, type)
{
	var_46f1b5eb = function_e969e75(type);
	/#
		assert(isinarray(var_46f1b5eb.var_9a08bb02, aoe));
	#/
	if(isdefined(aoe.userdata))
	{
		if(isdefined(level.var_6efc944c))
		{
			[[level.var_6efc944c]](aoe);
		}
		if(isdefined(aoe.var_6efc944c))
		{
			[[aoe.var_6efc944c]](aoe);
		}
	}
	arrayremovevalue(var_46f1b5eb.var_9a08bb02, aoe);
	/#
		assert(var_46f1b5eb.var_9a08bb02.size < var_46f1b5eb.var_3a11a165);
	#/
	thread function_4f0db8cf(aoe.entity);
}

/*
	Name: function_4f0db8cf
	Namespace: zm_aoe
	Checksum: 0x81D719E6
	Offset: 0xB08
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4f0db8cf(entity)
{
	waitframe(2);
	entity delete();
}

/*
	Name: function_2c33d107
	Namespace: zm_aoe
	Checksum: 0xB4D366C0
	Offset: 0xB38
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2c33d107(type)
{
	var_46f1b5eb = function_e969e75(type);
	var_528d5f55 = function_87bbe4fc(type);
	function_ccf8f659(var_528d5f55, 1);
	thread function_fa03204a(var_528d5f55, type);
}

/*
	Name: function_ccf8f659
	Namespace: zm_aoe
	Checksum: 0x9BC9E56B
	Offset: 0xBC8
	Size: 0x25A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ccf8f659(aoe, forceend)
{
	if(!isdefined(forceend))
	{
		forceend = 0;
	}
	var_46f1b5eb = function_e969e75(aoe.type);
	/#
		assert(isdefined(var_46f1b5eb));
	#/
	if(aoe.state == 5)
	{
		return;
	}
	if(forceend || is_true(aoe.forceend))
	{
		if(aoe.state != 3 && aoe.state != 4)
		{
			function_97d801ea(aoe, var_46f1b5eb, aoe.var_a0739fc1);
			return;
		}
	}
	if(gettime() < aoe.var_be1913ae)
	{
		return;
	}
	if(aoe.state == 0)
	{
		aoe.entity clientfield::set("aoe_state", 1);
		aoe.state = 1;
		aoe.var_be1913ae = gettime() + 100;
	}
	else
	{
		if(aoe.state == 1)
		{
			aoe.entity clientfield::set("aoe_state", 2);
			aoe.state = 2;
			aoe.var_be1913ae = aoe.endtime;
			if(isdefined(aoe.var_fb4d789f))
			{
				[[aoe.var_fb4d789f]](aoe);
			}
		}
		else
		{
			if(aoe.state == 2)
			{
				function_97d801ea(aoe, var_46f1b5eb, 0);
			}
			else if(aoe.state == 3 || aoe.state == 4)
			{
				aoe.entity clientfield::set("aoe_state", 5);
				aoe.state = 5;
			}
		}
	}
}

/*
	Name: function_97d801ea
	Namespace: zm_aoe
	Checksum: 0x1F8AED2A
	Offset: 0xE30
	Size: 0xE8
	Parameters: 3
	Flags: Linked, Private
*/
function private function_97d801ea(aoe, var_46f1b5eb, var_a0739fc1)
{
	var_46f1b5eb.var_be1913ae = gettime() + var_a0739fc1.var_f2cd3aad;
	if(is_true(var_46f1b5eb.var_a0739fc1))
	{
		var_46f1b5eb.entity clientfield::set("aoe_state", 4);
		var_46f1b5eb.state = 4;
		var_46f1b5eb notify(#"hash_16055baf8d7c453a");
	}
	else
	{
		var_46f1b5eb.entity clientfield::set("aoe_state", 3);
		var_46f1b5eb.state = 3;
		var_46f1b5eb notify(#"hash_3913004963ca6fe4");
	}
}

/*
	Name: function_3690781e
	Namespace: zm_aoe
	Checksum: 0x4EA963DC
	Offset: 0xF20
	Size: 0x164
	Parameters: 0
	Flags: None
*/
function function_3690781e()
{
	foreach(var_eb93f0b0 in level.var_400ae143)
	{
		if(isarray(var_eb93f0b0.var_9a08bb02))
		{
			var_4df07587 = arraycopy(var_eb93f0b0.var_9a08bb02);
			foreach(var_3e8795ff in var_4df07587)
			{
				function_ccf8f659(var_3e8795ff, 1);
				level thread function_fa03204a(var_3e8795ff, var_3e8795ff.type);
			}
		}
	}
}

/*
	Name: function_389bf7bf
	Namespace: zm_aoe
	Checksum: 0x2C292E54
	Offset: 0x1090
	Size: 0x2E
	Parameters: 2
	Flags: None
*/
function function_389bf7bf(aoe, var_a0739fc1)
{
	aoe.forceend = 1;
	aoe.var_a0739fc1 = var_a0739fc1;
}

/*
	Name: function_e5950b1e
	Namespace: zm_aoe
	Checksum: 0x1509C571
	Offset: 0x10C8
	Size: 0x190
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e5950b1e(type)
{
	var_46f1b5eb = function_e969e75(type);
	/#
		assert(isdefined(var_46f1b5eb));
	#/
	var_2aad0cec = [];
	foreach(aoe in var_46f1b5eb.var_9a08bb02)
	{
		function_ccf8f659(aoe);
		if(aoe.state == 5)
		{
			array::add(var_2aad0cec, aoe, 0);
		}
	}
	foreach(aoe in var_2aad0cec)
	{
		function_fa03204a(aoe, aoe.type);
	}
}

/*
	Name: function_bea2e288
	Namespace: zm_aoe
	Checksum: 0x5E31CE
	Offset: 0x1260
	Size: 0x2F0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bea2e288(type)
{
	var_46f1b5eb = function_e969e75(type);
	/#
		assert(isdefined(var_46f1b5eb));
	#/
	players = getplayers();
	foreach(aoe in var_46f1b5eb.var_9a08bb02)
	{
		foreach(player in players)
		{
			/#
				assert(isdefined(aoe.entity));
			#/
			dist = distance(aoe.entity.origin, player.origin);
			withinrange = dist <= var_46f1b5eb.radius;
			var_c0af03ae = 0;
			if(!withinrange)
			{
				continue;
			}
			heightdiff = abs(aoe.entity.origin[2] - player.origin[2]);
			if(heightdiff <= var_46f1b5eb.height)
			{
				var_c0af03ae = 1;
			}
			if(withinrange && var_c0af03ae)
			{
				damage = mapfloat(0, var_46f1b5eb.radius, var_46f1b5eb.damagemin, var_46f1b5eb.damagemax, dist);
				player dodamage(damage, aoe.entity.origin);
				player notify(#"aoe_damage", {#origin:aoe.entity.origin, #hash_159100b7:aoe.type});
			}
		}
	}
}

/*
	Name: function_60bb02f3
	Namespace: zm_aoe
	Checksum: 0x16BBD6E3
	Offset: 0x1558
	Size: 0xA6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_60bb02f3(type)
{
	var_46f1b5eb = function_e969e75(type);
	/#
		assert(isdefined(var_46f1b5eb));
	#/
	while(true)
	{
		if(!var_46f1b5eb.var_9a08bb02.size)
		{
			waitframe(1);
			continue;
		}
		function_e5950b1e(type);
		function_bea2e288(type);
		waitframe(1);
	}
}

/*
	Name: function_e39c0be4
	Namespace: zm_aoe
	Checksum: 0xD6BC24D1
	Offset: 0x1608
	Size: 0x2A6
	Parameters: 1
	Flags: Private
*/
function private function_e39c0be4(var_46f1b5eb)
{
	/#
		var_46f1b5eb endon(#"hash_343e166e4aa4288e");
		while(true)
		{
			if(getdvarint(#"zm_debug_aoe", 0))
			{
				if(var_46f1b5eb.var_9a08bb02.size)
				{
					var_87bbe4fc = function_87bbe4fc(var_46f1b5eb.type);
					i = 0;
					foreach(aoe in var_46f1b5eb.var_9a08bb02)
					{
						circle(aoe.position, var_46f1b5eb.radius, (1, 0.5, 0), 1, 1);
						circle(aoe.position + (0, 0, var_46f1b5eb.height), var_46f1b5eb.radius, (1, 0.5, 0), 1, 1);
						line(aoe.position, aoe.position + (0, 0, var_46f1b5eb.height), (1, 0.5, 0));
						if(aoe == var_87bbe4fc)
						{
							print3d(aoe.position + (0, 0, var_46f1b5eb.height + 5), ((("" + var_46f1b5eb.type) + "") + i) + "", (1, 0, 0));
						}
						else
						{
							print3d(aoe.position + (0, 0, var_46f1b5eb.height + 5), ((("" + var_46f1b5eb.type) + "") + i) + "", (1, 0.5, 0));
						}
						i++;
					}
				}
			}
			waitframe(1);
		}
	#/
}

