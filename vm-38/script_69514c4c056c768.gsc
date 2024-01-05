#using script_75da5547b1822294;
#using script_471b31bd963b388e;
#using script_bf0c2c69ce5745e;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_3d2704b3;

/*
	Name: function_81640103
	Namespace: namespace_3d2704b3
	Checksum: 0xE44A310A
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_81640103()
{
	level notify(-532844384);
}

/*
	Name: __init__system__
	Namespace: namespace_3d2704b3
	Checksum: 0xF2229C25
	Offset: 0xB8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_280fe2667ed2d300", &function_70a657d8, undefined, undefined, #"item_supply_drop");
}

/*
	Name: function_70a657d8
	Namespace: namespace_3d2704b3
	Checksum: 0xCDB31EA6
	Offset: 0x108
	Size: 0x30
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!item_world_util::use_item_spawns())
	{
		return;
	}
	level.var_2ead97d1 = [];
	level.var_ef5dbc90 = [];
}

/*
	Name: function_2d47ee1e
	Namespace: namespace_3d2704b3
	Checksum: 0x94CDCEAA
	Offset: 0x140
	Size: 0x156
	Parameters: 6
	Flags: Private
*/
function private function_2d47ee1e(var_6ed927a6, var_caba78c2, waittime, var_ef5e1b44, var_d6388d1, vehicletype)
{
	if(!isdefined(var_d6388d1))
	{
		var_d6388d1 = 0;
	}
	if(!isdefined(vehicletype))
	{
		vehicletype = undefined;
	}
	if(is_true(var_d6388d1) && !isdefined(vehicletype))
	{
		return;
	}
	wait(randomfloatrange(var_caba78c2, waittime));
	if(isdefined(var_6ed927a6) && !var_d6388d1)
	{
		level callback::callback(#"hash_258e15865427fb62", var_6ed927a6);
		if(isdefined(level.var_ef5dbc90[var_6ed927a6]))
		{
			var_6ed927a6 = level.var_ef5dbc90[var_6ed927a6];
		}
	}
	voiceevent = !var_ef5e1b44.var_7f40d76c;
	var_ef5e1b44.var_7f40d76c = 1;
	level thread item_supply_drop::function_418e26fe(var_6ed927a6, var_d6388d1, voiceevent, var_ef5e1b44.heightoffset, var_d6388d1, vehicletype);
	var_ef5e1b44.heightoffset = var_ef5e1b44.heightoffset + 600;
}

/*
	Name: function_f0297225
	Namespace: namespace_3d2704b3
	Checksum: 0x3DD46AB7
	Offset: 0x2A0
	Size: 0x126
	Parameters: 3
	Flags: None
*/
function function_f0297225(var_2ab9d3bd, var_f532cd9f, var_3afaa57b)
{
	if(!ishash(var_2ab9d3bd) || !isint(var_f532cd9f) || !isint(var_3afaa57b))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(var_3afaa57b <= 0)
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!isdefined(level.var_2ead97d1[var_3afaa57b]))
	{
		level.var_2ead97d1[var_3afaa57b] = [];
	}
	var_37d0690b = level.var_2ead97d1[var_3afaa57b].size;
	level.var_2ead97d1[var_3afaa57b][var_37d0690b] = {#count:var_f532cd9f, #replacement:var_2ab9d3bd};
}

/*
	Name: function_d0178153
	Namespace: namespace_3d2704b3
	Checksum: 0x7E54B02C
	Offset: 0x3D0
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function function_d0178153(var_2ab9d3bd)
{
	level.var_ef5dbc90[var_2ab9d3bd] = #"hash_77212104c58adc03";
}

/*
	Name: start
	Namespace: namespace_3d2704b3
	Checksum: 0x4FE1B4B2
	Offset: 0x400
	Size: 0x764
	Parameters: 3
	Flags: None
*/
function start(supplydrops, minwaittime, var_fe6b2eab)
{
	if(!isdefined(supplydrops))
	{
		supplydrops = 1;
	}
	if(!isdefined(minwaittime))
	{
		minwaittime = 20;
	}
	if(!isdefined(var_fe6b2eab))
	{
		var_fe6b2eab = 20;
	}
	if(isint(supplydrops) && supplydrops < 1)
	{
		return;
	}
	level flag::wait_till(#"hash_405e46788e83af41");
	if(isarray(minwaittime))
	{
		foreach(key, value in minwaittime)
		{
			minwaittime[key] = minwaittime[key] * level.deathcircle.timescale;
		}
	}
	else
	{
		minwaittime = minwaittime * level.deathcircle.timescale;
	}
	if(isarray(var_fe6b2eab))
	{
		foreach(key, value in var_fe6b2eab)
		{
			var_fe6b2eab[key] = var_fe6b2eab[key] * level.deathcircle.timescale;
		}
	}
	else
	{
		var_fe6b2eab = var_fe6b2eab / level.deathcircle.timescale;
	}
	var_b2003e21 = 0;
	if(!isarray(supplydrops))
	{
		var_b2003e21 = supplydrops;
		supplydrops = [];
		for(index = 0; index < var_b2003e21; index++)
		{
			supplydrops[index] = 1;
		}
	}
	else
	{
		for(index = 0; index < supplydrops.size; index++)
		{
			var_b2003e21 = var_b2003e21 + supplydrops[index];
		}
	}
	var_7003bde7 = [];
	var_68f65b5a = getarraykeys(level.var_2ead97d1);
	for(index = var_68f65b5a.size - 1; index >= 0; index--)
	{
		var_3afaa57b = var_68f65b5a[index];
		var_64f52ca3 = [];
		for(var_77c44f00 = 0; var_77c44f00 < var_3afaa57b; var_77c44f00++)
		{
			var_64f52ca3[var_64f52ca3.size] = var_77c44f00;
		}
		for(var_a6872bd0 = 0; var_a6872bd0 < var_64f52ca3.size; var_a6872bd0++)
		{
			randindex = randomint(var_64f52ca3.size);
			var_521b73a = var_64f52ca3[var_a6872bd0];
			var_64f52ca3[var_a6872bd0] = var_64f52ca3[randindex];
			var_64f52ca3[randindex] = var_521b73a;
		}
		replacements = level.var_2ead97d1[var_3afaa57b];
		for(var_4d83f68a = 0; var_4d83f68a < replacements.size; var_4d83f68a++)
		{
			randindex = randomint(replacements.size);
			var_521b73a = replacements[var_4d83f68a];
			replacements[var_4d83f68a] = replacements[randindex];
			replacements[randindex] = var_521b73a;
		}
		var_b7d663a9 = 0;
		foreach(replacement in replacements)
		{
			while(var_b7d663a9 < var_64f52ca3.size && replacement.count > 0)
			{
				var_efecc884 = var_64f52ca3[var_b7d663a9];
				if(isdefined(var_7003bde7[var_efecc884]))
				{
				}
				else
				{
					var_7003bde7[var_efecc884] = replacement.replacement;
					replacement.count--;
				}
				var_b7d663a9++;
			}
		}
	}
	var_77c44f00 = 0;
	var_f2cf27c4 = 0;
	while(true)
	{
		if(!isdefined(level.deathcircleindex))
		{
			wait(1);
			continue;
		}
		deathcircle = level.deathcircles[level.deathcircleindex];
		var_caba78c2 = minwaittime;
		if(isarray(minwaittime))
		{
			var_caba78c2 = minwaittime[int(min(var_77c44f00, minwaittime.size - 1))];
		}
		var_205efcd5 = var_fe6b2eab;
		if(isarray(var_fe6b2eab))
		{
			var_205efcd5 = var_fe6b2eab[int(min(var_77c44f00, var_fe6b2eab.size - 1))];
		}
		waitsec = deathcircle.waitsec;
		scalesec = deathcircle.scalesec;
		var_7565ca79 = waitsec + scalesec;
		waittime = var_7565ca79 - var_205efcd5;
		var_ef5e1b44 = spawnstruct();
		var_ef5e1b44.var_7f40d76c = 0;
		var_ef5e1b44.heightoffset = 0;
		if(waittime > var_caba78c2)
		{
			var_972b892d = supplydrops[var_f2cf27c4];
			if(var_972b892d > 0)
			{
				var_9356dcab = randomint(var_972b892d);
				for(index = 0; index < var_972b892d; index++)
				{
					var_6ed927a6 = undefined;
					if(index == var_9356dcab)
					{
						var_6ed927a6 = var_7003bde7[var_f2cf27c4];
					}
					level thread function_2d47ee1e(var_6ed927a6, var_caba78c2, waittime, var_ef5e1b44);
					var_77c44f00++;
				}
			}
		}
		if(var_77c44f00 >= var_b2003e21)
		{
			return;
		}
		level waittill(#"hash_1ff3496c9049969");
		var_f2cf27c4++;
	}
}

/*
	Name: start_flare
	Namespace: namespace_3d2704b3
	Checksum: 0x8D81DC00
	Offset: 0xB70
	Size: 0xC8
	Parameters: 2
	Flags: None
*/
function start_flare(var_b3b96cdb, var_47d17dcb)
{
	if(!isdefined(var_b3b96cdb))
	{
		var_b3b96cdb = undefined;
	}
	if(!isdefined(var_47d17dcb))
	{
		var_47d17dcb = 0;
	}
	level flag::wait_till(#"hash_405e46788e83af41");
	var_3d3a70a8 = 0;
	while(true)
	{
		if(!isdefined(level.deathcircleindex))
		{
			return;
		}
		level thread item_supply_drop::function_7d4a448f(var_47d17dcb);
		var_3d3a70a8++;
		if(isdefined(var_b3b96cdb) && var_3d3a70a8 > var_b3b96cdb)
		{
			return;
		}
		level waittill(#"hash_1ff3496c9049969");
	}
}

/*
	Name: start_vehicle
	Namespace: namespace_3d2704b3
	Checksum: 0x35813C04
	Offset: 0xC40
	Size: 0x514
	Parameters: 4
	Flags: None
*/
function start_vehicle(vehicletype, supplydrops, minwaittime, var_fe6b2eab)
{
	if(!isdefined(supplydrops))
	{
		supplydrops = 1;
	}
	if(!isdefined(minwaittime))
	{
		minwaittime = 20;
	}
	if(!isdefined(var_fe6b2eab))
	{
		var_fe6b2eab = 20;
	}
	if(!isdefined(vehicletype))
	{
		return;
	}
	if(isint(supplydrops) && supplydrops < 1)
	{
		return;
	}
	level flag::wait_till(#"hash_405e46788e83af41");
	if(isarray(minwaittime))
	{
		foreach(key, value in minwaittime)
		{
			minwaittime[key] = minwaittime[key] * level.deathcircle.timescale;
		}
	}
	else
	{
		minwaittime = minwaittime * level.deathcircle.timescale;
	}
	if(isarray(var_fe6b2eab))
	{
		foreach(key, value in var_fe6b2eab)
		{
			var_fe6b2eab[key] = var_fe6b2eab[key] * level.deathcircle.timescale;
		}
	}
	else
	{
		var_fe6b2eab = var_fe6b2eab / level.deathcircle.timescale;
	}
	var_b2003e21 = 0;
	if(!isarray(supplydrops))
	{
		var_b2003e21 = supplydrops;
		supplydrops = [];
		for(index = 0; index < var_b2003e21; index++)
		{
			supplydrops[index] = 1;
		}
	}
	else
	{
		for(index = 0; index < supplydrops.size; index++)
		{
			var_b2003e21 = var_b2003e21 + supplydrops[index];
		}
	}
	var_77c44f00 = 0;
	var_f2cf27c4 = 0;
	while(true)
	{
		if(!isdefined(level.deathcircleindex))
		{
			wait(1);
			continue;
		}
		deathcircle = level.deathcircles[level.deathcircleindex];
		var_caba78c2 = minwaittime;
		if(isarray(minwaittime))
		{
			var_caba78c2 = minwaittime[int(min(var_77c44f00, minwaittime.size - 1))];
		}
		var_205efcd5 = var_fe6b2eab;
		if(isarray(var_fe6b2eab))
		{
			var_205efcd5 = var_fe6b2eab[int(min(var_77c44f00, var_fe6b2eab.size - 1))];
		}
		waitsec = deathcircle.waitsec;
		scalesec = deathcircle.scalesec;
		var_7565ca79 = waitsec + scalesec;
		waittime = var_7565ca79 - var_205efcd5;
		var_ef5e1b44 = spawnstruct();
		var_ef5e1b44.var_7f40d76c = 1;
		var_ef5e1b44.heightoffset = 0;
		var_30d3ad8b = vehicletype;
		if(isarray(vehicletype))
		{
			var_30d3ad8b = vehicletype[randomint(vehicletype.size)];
		}
		if(waittime > var_caba78c2)
		{
			var_972b892d = supplydrops[var_f2cf27c4];
			for(index = 0; index < var_972b892d; index++)
			{
				level thread function_2d47ee1e(undefined, var_caba78c2, waittime, var_ef5e1b44, 1, var_30d3ad8b);
				var_77c44f00++;
			}
		}
		if(var_77c44f00 >= var_b2003e21)
		{
			return;
		}
		level waittill(#"hash_1ff3496c9049969");
		var_f2cf27c4++;
	}
}

/*
	Name: function_7fc18ad5
	Namespace: namespace_3d2704b3
	Checksum: 0x13F07EC7
	Offset: 0x1160
	Size: 0x14C
	Parameters: 5
	Flags: None
*/
function function_7fc18ad5(var_2c229170, drops, var_e72444ee, minwaittime, maxwaittime)
{
	if(!isdefined(drops))
	{
		drops = 1;
	}
	if(!isdefined(var_e72444ee))
	{
		var_e72444ee = 30;
	}
	if(!isdefined(minwaittime))
	{
		minwaittime = 30;
	}
	if(!isdefined(maxwaittime))
	{
		maxwaittime = 60;
	}
	var_b77770ba = 0;
	wait(var_e72444ee);
	while(var_b77770ba < drops)
	{
		droppoint = undefined;
		if(isdefined(level.var_b7821ed9))
		{
			droppoint = [[level.var_b7821ed9]](var_b77770ba);
		}
		if(!isdefined(droppoint))
		{
			if(territory::function_c0de0601())
			{
				droppoint = territory::function_b3791221();
			}
			else
			{
				droppoint = item_supply_drop::function_186f5ca3();
			}
		}
		if(isdefined(droppoint))
		{
			item_supply_drop::drop_supply_drop(droppoint, 1, 0, undefined, var_2c229170);
		}
		wait(randomfloatrange(minwaittime, maxwaittime));
		var_b77770ba++;
	}
}

/*
	Name: function_add63876
	Namespace: namespace_3d2704b3
	Checksum: 0x172EBE43
	Offset: 0x12B8
	Size: 0x5AC
	Parameters: 9
	Flags: None
*/
function function_add63876(vehicletypes, var_4b43f3d, var_e72444ee, minwaittime, maxwaittime, var_6b662968, var_aeb310db, var_a1f975d8, var_69cea650)
{
	if(!isdefined(var_4b43f3d))
	{
		var_4b43f3d = 1;
	}
	if(!isdefined(var_e72444ee))
	{
		var_e72444ee = 30;
	}
	if(!isdefined(minwaittime))
	{
		minwaittime = 30;
	}
	if(!isdefined(maxwaittime))
	{
		maxwaittime = 60;
	}
	if(!isdefined(var_6b662968))
	{
		var_6b662968 = 1;
	}
	if(!isdefined(var_aeb310db))
	{
		var_aeb310db = 0;
	}
	if(!isdefined(var_a1f975d8))
	{
		var_a1f975d8 = undefined;
	}
	if(!isdefined(var_69cea650))
	{
		var_69cea650 = undefined;
	}
	if(!isdefined(vehicletypes))
	{
		return;
	}
	if(isint(var_4b43f3d) && var_4b43f3d < 1)
	{
		return;
	}
	if(!isdefined(level.var_3f771530))
	{
		level.var_3f771530 = [];
	}
	var_b77770ba = 0;
	wait(var_e72444ee);
	if(isdefined(var_a1f975d8))
	{
		var_9fb224d1 = array::randomize(var_a1f975d8);
		var_d9c4a78c = 0;
	}
	while(var_b77770ba < var_4b43f3d)
	{
		var_41666f53 = vehicletypes;
		if(isarray(vehicletypes))
		{
			var_41666f53 = array::random(vehicletypes);
		}
		if(isdefined(var_9fb224d1) && var_9fb224d1.size > 0)
		{
			if(isint(var_69cea650))
			{
				var_aff86dc2 = sqr(var_69cea650);
				var_dedb993c = 0;
				droppoint = var_9fb224d1[var_d9c4a78c];
				currentindex = var_d9c4a78c;
				do
				{
					var_d9c4a78c = (var_d9c4a78c + 1) % var_9fb224d1.size;
					var_c4e86af5 = var_9fb224d1[var_d9c4a78c];
					for(vehicleindex = 0; vehicleindex < level.var_3f771530.size; vehicleindex++)
					{
						vehicle = level.var_3f771530[vehicleindex];
						if(!isalive(vehicle))
						{
							continue;
						}
						if(distance2dsquared(vehicle.origin, var_c4e86af5.origin) <= var_aff86dc2)
						{
							continue;
						}
						droppoint = var_c4e86af5;
						var_dedb993c = 1;
						break;
					}
					if(level.var_3f771530.size == 0)
					{
						var_dedb993c = 1;
					}
				}
				while(var_d9c4a78c != currentindex && !var_dedb993c);
			}
			else
			{
				droppoint = var_9fb224d1[var_d9c4a78c];
				var_d9c4a78c = (var_d9c4a78c + 1) % var_9fb224d1.size;
			}
			if(isstruct(droppoint))
			{
				dropangles = droppoint.angles;
				droppoint = droppoint.origin;
			}
		}
		else
		{
			if(territory::function_c0de0601())
			{
				droppoint = territory::function_b3791221();
			}
			else
			{
				droppoint = item_supply_drop::function_186f5ca3();
			}
		}
		if(isdefined(droppoint))
		{
			while(level.var_3f771530.size >= var_6b662968)
			{
				var_b3bb5eb4 = [];
				foreach(vehicle in level.var_3f771530)
				{
					if(isdefined(vehicle) && vehicle.health > 0)
					{
						var_b3bb5eb4[var_b3bb5eb4.size] = vehicle;
					}
				}
				level.var_3f771530 = var_b3bb5eb4;
				wait(1);
			}
			var_f5c3cebd = undefined;
			var_81cb0c47 = 0;
			if(isdefined(level.var_11fa5782))
			{
				var_f5c3cebd = [[level.var_11fa5782]](var_41666f53, droppoint);
				if(isdefined(var_f5c3cebd))
				{
					level.var_3f771530[level.var_3f771530.size] = var_f5c3cebd;
					var_81cb0c47 = 1;
				}
			}
			if(!isdefined(var_f5c3cebd))
			{
				item_supply_drop::drop_supply_drop(droppoint, 1, 1, var_41666f53, undefined, dropangles);
				var_81cb0c47 = 1;
			}
			if(var_81cb0c47 && level.var_3f771530.size < var_6b662968)
			{
				wait(var_aeb310db);
			}
		}
		if(!isdefined(droppoint) || level.var_3f771530.size >= var_6b662968)
		{
			wait(randomfloatrange(minwaittime, maxwaittime));
		}
		var_b77770ba++;
	}
}

