#using script_471b31bd963b388e;
#using script_4108035fe400ce67;
#using script_1caf36ff04a85ff6;
#using scripts\core_common\item_inventory.gsc;
#using script_408211ac7ff6ef56;
#using scripts\core_common\dogtags.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace item_drop;

/*
	Name: __init__system__
	Namespace: item_drop
	Checksum: 0x18C70B4C
	Offset: 0x308
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"item_drop", &function_70a657d8, undefined, undefined, #"item_world");
}

/*
	Name: function_70a657d8
	Namespace: item_drop
	Checksum: 0xDE9CF38D
	Offset: 0x358
	Size: 0x12C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!item_world_util::use_item_spawns())
	{
		return;
	}
	register_client_fields();
	if(!isdefined(level.var_98d0ae2b))
	{
		level.var_98d0ae2b = new throttle();
		[[ level.var_98d0ae2b ]]->initialize(2, 0.05);
	}
	if(!isdefined(level.var_19011fa7))
	{
		level.var_19011fa7 = new throttle();
		[[ level.var_19011fa7 ]]->initialize(2, 0.05);
	}
	level.var_ace9fb52 = [];
	level.item_spawn_drops = [];
	level.var_18dc9d17 = [];
	level.var_8ac64bf3 = [];
	level.var_19e75cfb = [];
	level.var_2746aef8 = &function_ba4c90d9;
	/#
		function_344f8c02();
	#/
}

/*
	Name: register_client_fields
	Namespace: item_drop
	Checksum: 0xA4E7E114
	Offset: 0x490
	Size: 0x1E4
	Parameters: 0
	Flags: Linked, Private
*/
function private register_client_fields()
{
	clientfield::register("missile", "dynamic_item_drop", 1, 4, "int");
	clientfield::register("missile", "dynamic_item_drop_count", 1, 10, "int");
	clientfield::register("missile", "dynamic_item_drop_falling", 1, 1, "int");
	clientfield::register("missile", "dynamic_item_timing_out", 1, 1, "int");
	clientfield::register("scriptmover", "dynamic_item_drop", 1, 4, "int");
	clientfield::register("scriptmover", "dynamic_item_drop_count", 1, 10, "int");
	clientfield::register("scriptmover", "dynamic_stash", 1, 2, "int");
	clientfield::register("scriptmover", "dynamic_stash_type", 1, 2, "int");
	clientfield::register("scriptmover", "dynamic_item_drop_falling", 1, 1, "int");
	clientfield::register("scriptmover", "dynamic_item_timing_out", 1, 1, "int");
}

/*
	Name: function_344f8c02
	Namespace: item_drop
	Checksum: 0xDF3BCFDC
	Offset: 0x680
	Size: 0x54
	Parameters: 0
	Flags: Private
*/
function private function_344f8c02()
{
	/#
		adddebugcommand(("" + util::get_map_name()) + "");
		level thread function_60c9a9e1();
	#/
}

/*
	Name: function_60c9a9e1
	Namespace: item_drop
	Checksum: 0xD7E1F5DB
	Offset: 0x6E0
	Size: 0x76
	Parameters: 0
	Flags: Private
*/
function private function_60c9a9e1()
{
	/#
		while(true)
		{
			if(getdvarint(#"hash_9fd3c7ff85dca2c", 0))
			{
				setdvar(#"hash_9fd3c7ff85dca2c", 0);
				function_8a5fd783();
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_3b2b6383
	Namespace: item_drop
	Checksum: 0xE5B41F22
	Offset: 0x760
	Size: 0x1BA
	Parameters: 5
	Flags: Linked, Private
*/
function private function_3b2b6383(origin, angles, normal, var_a6762160, var_ba40b4c1)
{
	angles = function_c1fa62a2(angles, normal);
	angles = combineangles(angles, (0, angleclamp180((origin[0] + origin[1]) + origin[2]), 0));
	if(isdefined(var_a6762160))
	{
		if(var_ba40b4c1 && is_true(var_a6762160.var_32ceba33))
		{
			angles = combineangles(angles, ((isdefined(var_a6762160.var_d1f348db) ? var_a6762160.var_d1f348db : 0), (isdefined(var_a6762160.var_cc1bbd2c) ? var_a6762160.var_cc1bbd2c : 0), (isdefined(var_a6762160.var_ae6581c0) ? var_a6762160.var_ae6581c0 : 0)));
		}
		else
		{
			angles = combineangles(angles, ((isdefined(var_a6762160.var_7adcadc1) ? var_a6762160.var_7adcadc1 : 0), (isdefined(var_a6762160.var_6731866b) ? var_a6762160.var_6731866b : 0), (isdefined(var_a6762160.var_e6ac0592) ? var_a6762160.var_e6ac0592 : 0)));
		}
	}
	return angles;
}

/*
	Name: function_feb1473
	Namespace: item_drop
	Checksum: 0xFDA0FCAD
	Offset: 0x928
	Size: 0x122
	Parameters: 2
	Flags: Linked, Private
*/
function private function_feb1473(var_a6762160, var_ba40b4c1)
{
	origin = (0, 0, 0);
	if(isdefined(var_a6762160))
	{
		if(var_ba40b4c1 && is_true(var_a6762160.var_32ceba33))
		{
			origin = ((isdefined(var_a6762160.var_8a122876) ? var_a6762160.var_8a122876 : 0), (isdefined(var_a6762160.var_7c4c8ceb) ? var_a6762160.var_7c4c8ceb : 0), (isdefined(var_a6762160.var_ee67711f) ? var_a6762160.var_ee67711f : 0));
		}
		else
		{
			origin = ((isdefined(var_a6762160.var_ada071fe) ? var_a6762160.var_ada071fe : 0), (isdefined(var_a6762160.var_5ab74bb1) ? var_a6762160.var_5ab74bb1 : 0), (isdefined(var_a6762160.var_50773731) ? var_a6762160.var_50773731 : 0));
		}
	}
	return origin;
}

/*
	Name: function_a3675ae5
	Namespace: item_drop
	Checksum: 0x6EBA076
	Offset: 0xA58
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_a3675ae5()
{
	return (randomintrange(-10, 10), randomintrange(-180, 180), randomintrange(-10, 10));
}

/*
	Name: function_32b2794
	Namespace: item_drop
	Checksum: 0x704FE75A
	Offset: 0xAB0
	Size: 0x7A
	Parameters: 1
	Flags: Private
*/
function private function_32b2794(degree)
{
	distance = randomintrange(48, 60);
	return (cos(degree) * distance, sin(degree) * distance, randomintrange(24, 36));
}

/*
	Name: function_44a6883c
	Namespace: item_drop
	Checksum: 0xC3F327F3
	Offset: 0xB38
	Size: 0x494
	Parameters: 6
	Flags: Linked, Private
*/
function private function_44a6883c(&drop_item_id, &drop_items, &drop_count, &drop_amount, var_4a5c0085, var_fee0423a)
{
	if(!isdefined(var_4a5c0085))
	{
		var_4a5c0085 = 1;
	}
	if(!isdefined(var_fee0423a))
	{
		var_fee0423a = 0;
	}
	var_f55ea9e5 = drop_item_id.size;
	for(index = 0; index < var_f55ea9e5; index++)
	{
		if(!isdefined(drop_item_id[index]))
		{
			continue;
		}
		item = function_b1702735(drop_item_id[index]);
		var_a6762160 = item.var_a6762160;
		itemname = item_world_util::get_itemtype(var_a6762160);
		if(var_a6762160.itemtype == #"weapon")
		{
			continue;
		}
		var_a057551d = namespace_a0d533d1::function_cfa794ca(0, var_a6762160);
		if(var_fee0423a && !is_true(var_a6762160.stackable))
		{
			for(var_604c3ae6 = 0; var_604c3ae6 < index; var_604c3ae6++)
			{
				if(drop_item_id[var_604c3ae6] == -1)
				{
					continue;
				}
				var_92d652f2 = function_b1702735(drop_item_id[var_604c3ae6]);
				var_f6a3c690 = var_92d652f2.var_a6762160;
				var_fa38de52 = item_world_util::get_itemtype(var_f6a3c690);
				if(itemname != var_fa38de52)
				{
					continue;
				}
				drop_count[var_604c3ae6] = drop_count[var_604c3ae6] + drop_count[index];
				drop_item_id[index] = -1;
				drop_items[index] = undefined;
				drop_count[index] = undefined;
				drop_amount[index] = undefined;
			}
		}
		if(!is_true(var_a6762160.stackable))
		{
			continue;
		}
		if(var_4a5c0085)
		{
			if(var_a057551d <= 1)
			{
				continue;
			}
			if(drop_count[index] == var_a057551d)
			{
				continue;
			}
			if(drop_count[index] > var_a057551d)
			{
				excess = drop_count[index] - var_a057551d;
				drop_count[index] = var_a057551d;
				drop_item_id[var_f55ea9e5] = drop_item_id[index];
				if(isdefined(drop_items[index]))
				{
					drop_items[var_f55ea9e5] = drop_items[index];
				}
				drop_count[var_f55ea9e5] = excess;
				drop_amount[var_f55ea9e5] = drop_amount[index];
				var_f55ea9e5++;
				continue;
			}
		}
		if(!isdefined(drop_count[index]) || drop_count[index] <= 0)
		{
			continue;
		}
		for(var_604c3ae6 = 0; var_604c3ae6 < index; var_604c3ae6++)
		{
			if(!isdefined(drop_count[index]) || drop_count[index] <= 0)
			{
				break;
			}
			if(drop_item_id[var_604c3ae6] == -1)
			{
				continue;
			}
			var_92d652f2 = function_b1702735(drop_item_id[var_604c3ae6]);
			var_f6a3c690 = var_92d652f2.var_a6762160;
			var_fa38de52 = item_world_util::get_itemtype(var_f6a3c690);
			if(itemname != var_fa38de52)
			{
				continue;
			}
			excess = drop_count[index];
			if(var_4a5c0085)
			{
				var_8429965a = var_a057551d - drop_count[var_604c3ae6];
				excess = int(min(var_8429965a, drop_count[index]));
			}
			drop_count[var_604c3ae6] = drop_count[var_604c3ae6] + excess;
			drop_count[index] = drop_count[index] - excess;
			if(drop_count[index] <= 0)
			{
				/#
					assert(drop_count[index] == 0);
				#/
				drop_item_id[index] = -1;
				drop_items[index] = undefined;
				drop_count[index] = undefined;
				drop_amount[index] = undefined;
				break;
			}
		}
	}
}

/*
	Name: function_21cfd4a
	Namespace: item_drop
	Checksum: 0x6B996CAB
	Offset: 0xFD8
	Size: 0x28A
	Parameters: 4
	Flags: Linked, Private
*/
function private function_21cfd4a(index, position, angles, var_71a7bf18)
{
	maxindex = index + 12;
	checkdistance = 256;
	var_9942a6e3 = 13;
	var_ed81de82 = sqr(var_9942a6e3);
	var_f6c0e955 = 25;
	var_f24d242c = sqr(var_f6c0e955);
	var_f4b807cb = item_world::function_2e3efdda(position, undefined, undefined, checkdistance, undefined, 1);
	randomindex = randomintrange(index, maxindex + 1);
	var_5625a073 = undefined;
	for(var_b14af3be = index; var_b14af3be <= maxindex; var_b14af3be++)
	{
		var_135ae3f7 = namespace_b637a3ed::function_350c0e2b(var_b14af3be, position, angles, var_71a7bf18);
		var_e37d8974 = var_135ae3f7.end_origin;
		if(var_b14af3be == randomindex)
		{
			var_5625a073 = var_135ae3f7;
		}
		var_d154a9ba = 0;
		for(var_b7e54435 = 0; var_b7e54435 < var_f4b807cb.size; var_b7e54435++)
		{
			if(isdefined(var_f4b807cb[var_b7e54435].var_a6762160) && var_f4b807cb[var_b7e54435].var_a6762160.itemtype == #"weapon" && distance2dsquared(var_f4b807cb[var_b7e54435].origin, var_e37d8974) < var_f24d242c)
			{
				var_d154a9ba = 1;
				break;
				continue;
			}
			if(distance2dsquared(var_f4b807cb[var_b7e54435].origin, var_e37d8974) < var_ed81de82)
			{
				var_d154a9ba = 1;
				break;
			}
		}
		if(!var_d154a9ba)
		{
			break;
		}
	}
	if(var_b14af3be > maxindex)
	{
		var_b14af3be = randomindex;
		var_135ae3f7 = var_5625a073;
	}
	var_135ae3f7.drop_index = var_b14af3be;
	return var_135ae3f7;
}

/*
	Name: function_23b6897
	Namespace: item_drop
	Checksum: 0xA90AD122
	Offset: 0x1270
	Size: 0x8E6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_23b6897(player, position)
{
	if(isplayer(player))
	{
		heightoffset = max(player getplayerviewheight() + -20, 18);
		var_891dc751 = (0, 0, heightoffset);
		centerpoint = player.origin;
		var_bb96e272 = position - centerpoint;
		var_bb96e272 = (var_bb96e272[0], var_bb96e272[1], 0);
		var_bb96e272 = vectornormalize(var_bb96e272);
		forward = (1, 0, 0);
		theta = vectortoangles(var_bb96e272)[1] - vectortoangles(forward)[1];
		var_9942a6e3 = 13;
		var_ed81de82 = sqr(var_9942a6e3);
		var_f6c0e955 = 25;
		var_f24d242c = sqr(var_f6c0e955);
		var_93296058 = 40;
		var_c8214507 = sqr(var_93296058);
		var_408cb959 = 43;
		var_333b976a = sqr(var_408cb959);
		var_67aa12c4 = 43;
		var_978f1539 = sqr(var_67aa12c4);
		var_e20a427 = array(15, 15, 15, 15);
		var_ea03e490 = array(180 / var_e20a427[0], 240 / var_e20a427[1], 360 / var_e20a427[2], 360 / var_e20a427[3]);
		var_44a167ba = array(0, 0, int(var_ea03e490[2] - var_ea03e490[0]), int(var_ea03e490[3] - var_ea03e490[1]));
		distance = distance(position, centerpoint);
		distances = array(distance, distance * 1.5, distance, distance * 1.5);
		checkdistance = distance * 3;
		/#
			assert(distances.size == var_44a167ba.size);
		#/
		/#
			assert(distances.size == var_e20a427.size);
		#/
		/#
			assert(distances.size == var_ea03e490.size);
		#/
		var_f4b807cb = item_world::function_2e3efdda(centerpoint, undefined, undefined, checkdistance, undefined, 1);
		var_c36bd68a = arraysortclosest(level.var_ace9fb52, centerpoint, 24, 0, checkdistance);
		var_ac2b6007 = arraysortclosest(level.item_spawn_stashes, centerpoint, 36, 0, checkdistance);
		var_6594679a = arraysortclosest(level.item_supply_drops, centerpoint, 36, 0, checkdistance);
		for(var_709013a9 = 0; var_709013a9 < distances.size; var_709013a9++)
		{
			currentdistance = distances[var_709013a9];
			for(check = var_44a167ba[var_709013a9]; check < var_ea03e490[var_709013a9]; check++)
			{
				var_7e8fc0d7 = ((check % 2) == 1 ? int(ceil(check / -2)) : int(ceil(check / 2)));
				angle = theta + (var_e20a427[var_709013a9] * var_7e8fc0d7);
				checkpoint = ((currentdistance * (cos(angle), sin(angle), 0)) + centerpoint) + var_891dc751;
				/#
					debug_sphere(checkpoint, 2, (0, 1, 1));
				#/
				var_d154a9ba = 0;
				for(var_b7e54435 = 0; var_b7e54435 < var_f4b807cb.size; var_b7e54435++)
				{
					if(isdefined(var_f4b807cb[var_b7e54435].var_a6762160) && var_f4b807cb[var_b7e54435].var_a6762160.itemtype == #"weapon" && distance2dsquared(var_f4b807cb[var_b7e54435].origin, checkpoint) < var_f24d242c)
					{
						var_d154a9ba = 1;
						break;
						continue;
					}
					if(distance2dsquared(var_f4b807cb[var_b7e54435].origin, checkpoint) < var_ed81de82)
					{
						var_d154a9ba = 1;
						break;
					}
				}
				if(var_d154a9ba)
				{
					continue;
				}
				for(var_4271eacb = 0; var_4271eacb < var_c36bd68a.size; var_4271eacb++)
				{
					if(distance2dsquared(var_c36bd68a[var_4271eacb].origin, checkpoint) < var_c8214507)
					{
						var_d154a9ba = 1;
						break;
					}
				}
				if(var_d154a9ba)
				{
					continue;
				}
				for(var_cf8ede88 = 0; var_cf8ede88 < var_ac2b6007.size; var_cf8ede88++)
				{
					if(distance2dsquared(var_ac2b6007[var_cf8ede88].origin, checkpoint) < var_333b976a)
					{
						var_d154a9ba = 1;
						break;
					}
				}
				if(var_d154a9ba)
				{
					continue;
				}
				for(var_d0dbf0b4 = 0; var_d0dbf0b4 < var_6594679a.size; var_d0dbf0b4++)
				{
					if(distance2dsquared(var_6594679a[var_d0dbf0b4].origin, checkpoint) < var_978f1539)
					{
						var_d154a9ba = 1;
						break;
					}
				}
				if(!var_d154a9ba)
				{
					if(isplayer(player))
					{
						eyepos = player geteye();
						sighttrace = physicstraceex(eyepos, checkpoint, vectorscale((-1, -1, -1), 0.5), vectorscale((1, 1, 1), 0.5), player, 1);
						if(sighttrace[#"fraction"] < 1)
						{
							/#
								debug_line(eyepos, checkpoint, (1, 0, 0));
							#/
							continue;
						}
						/#
							debug_line(eyepos, checkpoint, (0, 1, 1));
						#/
					}
					return checkpoint;
				}
			}
		}
	}
	if(isplayer(player))
	{
		position = player.origin;
	}
	return position;
}

/*
	Name: function_2734eea3
	Namespace: item_drop
	Checksum: 0x9D91F610
	Offset: 0x1B60
	Size: 0x19E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2734eea3(player)
{
	if(!isplayer(player))
	{
		return 0;
	}
	var_24242c8e = 0;
	if(isdefined(player.laststandparams) && isdefined(player.laststandparams.attacker) && isplayer(player.laststandparams.attacker) && player.laststandparams.attacker != player)
	{
		var_24242c8e = var_24242c8e | !util::function_fbce7263(player.laststandparams.attacker.team, player.team);
	}
	if(!var_24242c8e && isdefined(player.var_a1d415ee) && isdefined(player.var_a1d415ee.attacker) && isplayer(player.var_a1d415ee.attacker) && player.var_a1d415ee.attacker != player)
	{
		var_24242c8e = var_24242c8e | !util::function_fbce7263(player.var_a1d415ee.attacker.team, player.team);
	}
	return var_24242c8e;
}

/*
	Name: function_a938fba7
	Namespace: item_drop
	Checksum: 0xD59D3898
	Offset: 0x1D08
	Size: 0x9DE
	Parameters: 6
	Flags: Linked, Private
*/
function private function_a938fba7(player, position, angles, var_a6762160, var_74e79ee3, var_ba40b4c1)
{
	if(!isdefined(var_74e79ee3))
	{
		var_74e79ee3 = 0;
	}
	if(!isdefined(var_ba40b4c1))
	{
		var_ba40b4c1 = 1;
	}
	/#
		assert(isentity(self));
	#/
	/#
		assert(isentity(player));
	#/
	/#
		assert(isvec(position));
	#/
	/#
		assert(isvec(angles));
	#/
	self notsolid();
	ignoreent = player;
	zoffset = 64;
	if(isplayer(player) && player isinvehicle())
	{
		var_1e60f7f2 = player getvehicleoccupied();
		var_6246b3c7 = 0;
		foreach(vehicle in array(#"tactical_raft_wz"))
		{
			if(isdefined(var_1e60f7f2.scriptvehicletype) && vehicle == var_1e60f7f2.scriptvehicletype)
			{
				var_6246b3c7 = 1;
				break;
			}
		}
		if(!var_6246b3c7)
		{
			ignoreent = var_1e60f7f2;
		}
		else
		{
			ignoreent = undefined;
		}
		vehicle = player getvehicleoccupied();
		if(vehicle getoccupantseat(player) == 0)
		{
			zoffset = zoffset + (abs(player.origin[2] - vehicle.origin[2]));
		}
	}
	origin = function_23b6897(player, position);
	self.origin = origin;
	var_96a432da = origin + (0, 0, zoffset);
	var_abe21f5c = origin - (0, 0, zoffset);
	starttrace = physicstraceex(origin, var_96a432da, vectorscale((-1, -1, -1), 0.5), vectorscale((1, 1, 1), 0.5), ignoreent, 1);
	var_96a432da = starttrace[#"position"];
	var_ed97e13a = 5;
	onground = 0;
	var_5a13db05 = 0;
	for(index = 0; index < var_ed97e13a; index++)
	{
		/#
			debug_sphere(var_96a432da, 1.5, (0, 1, 0));
			debug_sphere(var_abe21f5c, 1.5, (0, 1, 0));
			debug_line(var_96a432da, var_abe21f5c, (0, 1, 0));
		#/
		var_708a2754 = physicstraceex(var_96a432da, var_abe21f5c, vectorscale((-1, -1, -1), 0.5), vectorscale((1, 1, 1), 0.5), ignoreent, 1);
		if(var_708a2754[#"fraction"] < 1)
		{
			if(var_708a2754[#"position"][2] > -10000)
			{
				origin = var_708a2754[#"position"];
			}
			if(isdefined(var_a6762160))
			{
				originoffset = function_feb1473(var_a6762160, var_ba40b4c1);
				origin = origin + originoffset;
			}
			normal = var_708a2754[#"normal"];
			angles = function_3b2b6383(origin, angles, normal, var_a6762160, var_ba40b4c1);
			self.origin = origin;
			self.angles = angles;
			var_5a13db05 = 1;
			if(vectordot(var_708a2754[#"normal"], (0, 0, 1)) >= 0.5)
			{
				parentent = var_708a2754[#"entity"];
				if(isdefined(parentent) && parentent.model != "")
				{
					if(isplayer(parentent))
					{
						ignoreent = parentent;
						var_96a432da = var_708a2754[#"position"];
						continue;
					}
					if(parentent.classname == "script_vehicle")
					{
						var_fe7058af = 0;
						foreach(vehicle in array(#"player_atv", #"helicopter_light", "recon_wz", "hawk"))
						{
							if(isdefined(parentent.scriptvehicletype) && vehicle == parentent.scriptvehicletype)
							{
								var_fe7058af = 1;
								break;
							}
						}
						if(!var_fe7058af && isdefined(parentent.var_7b500c20) && !var_74e79ee3)
						{
							arrayremovevalue(parentent.var_7b500c20, undefined, 0);
							var_fe7058af = parentent.var_7b500c20.size >= 10;
						}
						if(var_fe7058af)
						{
							continue;
						}
					}
					if(self == parentent)
					{
						ignoreent = self;
						continue;
					}
					self linkto(parentent);
					if(!var_74e79ee3)
					{
						if(!isdefined(parentent.var_7b500c20))
						{
							parentent.var_7b500c20 = [];
						}
						else if(!isarray(parentent.var_7b500c20))
						{
							parentent.var_7b500c20 = array(parentent.var_7b500c20);
						}
						parentent.var_7b500c20[parentent.var_7b500c20.size] = self;
					}
				}
				onground = 1;
			}
			break;
		}
		break;
	}
	if(!onground)
	{
		if(!var_5a13db05)
		{
			self.angles = function_3b2b6383(self.origin, self.angles, (0, 0, 1), var_a6762160, var_ba40b4c1);
		}
		/#
			debug_sphere(self.origin, 1, (1, 0.5, 0));
		#/
		if(isplayer(player))
		{
			physicstrace = physicstraceex(self.origin, self.origin + (vectorscale((0, 0, -1), 5)), self.mins, self.maxs, ignoreent, 1);
			if(physicstrace[#"fraction"] < 1)
			{
				self.origin = player.origin + vectorscale((0, 0, 1), 18);
				/#
					debug_sphere(self.origin, 0.6, (1, 0, 0));
				#/
			}
		}
		self setcontents(self setcontents(0) & (~(((32768 | 16777216) | 2097152) | 8388608)));
		self physicslaunch();
		self thread function_10ececeb();
		return true;
	}
	/#
		debug_sphere(self.origin, 1, (1, 1, 0));
	#/
	return false;
}

/*
	Name: function_10ececeb
	Namespace: item_drop
	Checksum: 0xCC04E641
	Offset: 0x26F0
	Size: 0x5C6
	Parameters: 5
	Flags: Linked
*/
function function_10ececeb(var_e280bfe2, tracedistance, originheightoffset, min, max)
{
	if(!isdefined(var_e280bfe2))
	{
		var_e280bfe2 = 1;
	}
	if(!isdefined(tracedistance))
	{
		tracedistance = 24;
	}
	if(!isdefined(originheightoffset))
	{
		originheightoffset = 0;
	}
	if(!isdefined(min))
	{
		min = (0, 0, 0);
	}
	if(!isdefined(max))
	{
		max = (0, 0, 0);
	}
	self endon(#"death");
	self waittill(#"stationary");
	var_21f31454 = undefined;
	var_326ad23d = undefined;
	var_ba3b53da = undefined;
	parentent = undefined;
	var_9caaeb74 = undefined;
	var_6b8fe84d = undefined;
	while(true)
	{
		origin = self.origin + (anglestoup(self.angles) * originheightoffset);
		var_708a2754 = physicstrace(origin + (0, 0, 1), origin - (0, 0, tracedistance), min, max, self, 32);
		parentent = var_708a2754[#"entity"];
		if(var_708a2754[#"startsolid"])
		{
			self physicslaunch();
		}
		else
		{
			if(!isdefined(parentent))
			{
				if(isdefined(self.var_7b500c20))
				{
					foreach(item in self.var_7b500c20)
					{
						if(isdefined(item))
						{
							[[ level.var_19011fa7 ]]->waitinqueue(self);
							if(isdefined(item))
							{
								item unlink();
							}
						}
					}
					self.var_7b500c20 = undefined;
				}
				return;
			}
			if(!isdefined(parentent.iscorpse) && isdefined(parentent) && parentent.model != "" && !isplayer(parentent))
			{
				var_fe7058af = 0;
				if(!var_e280bfe2)
				{
					var_fe7058af = 1;
				}
				if(!var_fe7058af && parentent.classname == "script_vehicle")
				{
					foreach(vehicle in array(#"player_atv", #"helicopter_light", "recon_wz", "hawk"))
					{
						if(isdefined(parentent.scriptvehicletype) && vehicle == parentent.scriptvehicletype)
						{
							var_fe7058af = 1;
							break;
						}
					}
					if(!var_fe7058af && isdefined(parentent.var_7b500c20))
					{
						arrayremovevalue(parentent.var_7b500c20, undefined, 0);
						var_fe7058af = parentent.var_7b500c20.size >= 10;
					}
				}
				if(!var_fe7058af && self !== parentent)
				{
					self linkto(parentent);
					if(!isdefined(parentent.var_7b500c20))
					{
						parentent.var_7b500c20 = [];
					}
					else if(!isarray(parentent.var_7b500c20))
					{
						parentent.var_7b500c20 = array(parentent.var_7b500c20);
					}
					parentent.var_7b500c20[parentent.var_7b500c20.size] = self;
					return;
				}
				if(!isdefined(var_21f31454))
				{
					var_21f31454 = parentent;
					var_326ad23d = parentent.origin;
					var_ba3b53da = parentent.angles;
				}
				var_9caaeb74 = parentent.origin;
				var_6b8fe84d = parentent.angles;
			}
		}
		[[ level.var_19011fa7 ]]->waitinqueue(self);
		if(isdefined(var_21f31454) && isdefined(parentent) && var_21f31454 === parentent && distancesquared(var_326ad23d, var_9caaeb74) <= 2 && distancesquared(var_ba3b53da, var_6b8fe84d) <= 2)
		{
			waitframe(1);
			continue;
		}
		self physicslaunch();
		waitframe(1);
	}
}

/*
	Name: codecallback_playerkilled
	Namespace: item_drop
	Checksum: 0x68ECCC73
	Offset: 0x2CC0
	Size: 0x5E
	Parameters: 1
	Flags: Event
*/
event codecallback_playerkilled(eventstruct)
{
	if(sessionmodeiswarzonegame() && isplayer(self))
	{
		drop_inventory(self);
		if(isdefined(self))
		{
			self.inventory = undefined;
		}
	}
}

/*
	Name: codecallback_playerdisconnect
	Namespace: item_drop
	Checksum: 0xCEF43DED
	Offset: 0x2D28
	Size: 0xA6
	Parameters: 1
	Flags: Event
*/
event codecallback_playerdisconnect(eventstruct)
{
	if(sessionmodeiswarzonegame() && isplayer(self))
	{
		if(!is_true(level.inprematchperiod) && isdefined(self) && is_true(self.var_97b0977))
		{
			drop_inventory(self);
			if(isdefined(self))
			{
				self.inventory = undefined;
			}
		}
	}
}

/*
	Name: function_f3f9788a
	Namespace: item_drop
	Checksum: 0xDFF67388
	Offset: 0x2DD8
	Size: 0x94
	Parameters: 2
	Flags: None
*/
function function_f3f9788a(itemtype, percentchance)
{
	if(!item_world_util::use_item_spawns())
	{
		return;
	}
	level.var_19e75cfb[level.var_19e75cfb.size] = {#chance:max(min(percentchance, 1), 0), #type:itemtype};
}

/*
	Name: function_8a5fd783
	Namespace: item_drop
	Checksum: 0x44659672
	Offset: 0x2E78
	Size: 0x214
	Parameters: 0
	Flags: None
*/
function function_8a5fd783()
{
	foreach(item in level.item_spawn_drops)
	{
		if(isdefined(item))
		{
			item delete();
		}
	}
	arrayremovevalue(level.item_spawn_drops, undefined, 0);
	arrayremovevalue(level.var_18dc9d17, undefined, 0);
	foreach(stash in level.var_ace9fb52)
	{
		if(isdefined(stash))
		{
			stash delete();
		}
	}
	arrayremovevalue(level.var_ace9fb52, undefined, 0);
	foreach(stash in level.var_8ac64bf3)
	{
		if(isdefined(stash))
		{
			stash delete();
		}
	}
	arrayremovevalue(level.var_8ac64bf3, undefined, 0);
}

/*
	Name: function_767443cc
	Namespace: item_drop
	Checksum: 0xB33EC4D1
	Offset: 0x3098
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function function_767443cc(player)
{
	if(!isplayer(player))
	{
		return;
	}
	player.var_4896787f = 1;
}

/*
	Name: function_8a47b954
	Namespace: item_drop
	Checksum: 0xF6C068DD
	Offset: 0x30D8
	Size: 0x33C
	Parameters: 1
	Flags: Linked
*/
function function_8a47b954(player)
{
	item_world::function_1b11e73c();
	if(!isplayer(player))
	{
		return;
	}
	if(!isplayer(player) || !isdefined(player.inventory) || player oob::isoutofbounds())
	{
		return;
	}
	if(isdefined(player.laststandparams) && isdefined(player.laststandparams.smeansofdeath) && player.laststandparams.smeansofdeath == #"mod_trigger_hurt" && player.laststandparams.weapon.name === #"none")
	{
		return;
	}
	if(!item_world_util::function_74e1e547(player.origin))
	{
		return;
	}
	var_4838b749 = player item_inventory::function_d768ea30();
	if(!isdefined(var_4838b749))
	{
		return;
	}
	inventoryitem = player.inventory.items[var_4838b749];
	if(inventoryitem.id == 32767)
	{
		return;
	}
	item_weapon = item_world_util::function_f4a8d375(inventoryitem.id);
	var_4f21d62e = namespace_a0d533d1::function_2b83d3ff(inventoryitem);
	var_ca577a9c = player getweaponammoclip(var_4f21d62e);
	amount = min(item_weapon.clipsize, var_ca577a9c);
	if(is_true(var_4f21d62e.isdualwield) && isdefined(var_4f21d62e.dualwieldweapon) && var_4f21d62e.dualwieldweapon != level.weaponnone)
	{
		var_bce3d77a = player getweaponammoclip(var_4f21d62e.dualwieldweapon);
	}
	loc_0000339A:
	function_fd9026e4(0, item_world_util::function_f4a8d375(inventoryitem.id), (isdefined(inventoryitem.count) ? inventoryitem.count : 1), amount, inventoryitem.id, player.origin, player.angles, 2, 0, 0, undefined, undefined, (isdefined(inventoryitem.attachments) ? inventoryitem.attachments : undefined), 1, inventoryitem.weaponoptions, inventoryitem.var_e91aba42, inventoryitem.var_908f65ca, undefined, undefined, undefined, undefined, var_bce3d77a);
}

/*
	Name: drop_inventory
	Namespace: item_drop
	Checksum: 0xA0F86968
	Offset: 0x3420
	Size: 0x1190
	Parameters: 1
	Flags: Linked
*/
function drop_inventory(player)
{
	item_world::function_1b11e73c();
	if(!isplayer(player))
	{
		return;
	}
	if((isdefined(getgametypesetting(#"hash_613c2271ca477557")) ? getgametypesetting(#"hash_613c2271ca477557") : 0) || is_true(player.var_4896787f))
	{
		if((isdefined(getgametypesetting(#"disableweapondrop")) ? getgametypesetting(#"disableweapondrop") : 0))
		{
			function_8a47b954(player);
		}
		player item_inventory::reset_inventory();
		return;
	}
	if(isdefined(level.var_5cb948b1) && !player [[level.var_5cb948b1]]())
	{
		player item_inventory::reset_inventory();
		return;
	}
	playernum = player getentitynumber();
	level callback::callback(#"on_drop_inventory", player);
	items = [];
	if(!isplayer(player) || !isdefined(player.inventory) || player oob::isoutofbounds())
	{
		return items;
	}
	if(isdefined(player.laststandparams) && isdefined(player.laststandparams.smeansofdeath) && player.laststandparams.smeansofdeath == #"mod_trigger_hurt" && player.laststandparams.weapon.name === #"none")
	{
		return items;
	}
	if(!item_world_util::function_74e1e547(player.origin))
	{
		return items;
	}
	var_24242c8e = function_2734eea3(player);
	playerteam = player.team;
	drop_items = [];
	drop_count = [];
	drop_amount = [];
	drop_item_id = [];
	drop_weapon_options = [];
	var_d148a5b6 = [];
	var_d54d0589 = [];
	var_8049cf09 = 80;
	if(is_true(level.spawnsystem.deathcirclerespawn))
	{
		var_8049cf09 = 80;
	}
	if(sessionmodeiswarzonegame() && is_true(getgametypesetting(#"wzbigteambattle")))
	{
		var_8049cf09 = 60;
	}
	if(level.var_ace9fb52.size > var_8049cf09)
	{
		arrayremovevalue(level.var_ace9fb52, undefined);
		var_8aad666b = level.var_ace9fb52[0];
		if(isdefined(var_8aad666b))
		{
			dynamicitems = arraysortclosest(level.item_spawn_drops, var_8aad666b.origin, level.item_spawn_drops.size, 0, 12);
			var_6e680942 = dynamicitems.size;
			for(index = 0; index < var_6e680942; index++)
			{
				dynamicitem = dynamicitems[index];
				if(isdefined(dynamicitem))
				{
					dynamicitem delete();
				}
			}
			var_8aad666b delete();
			arrayremovevalue(level.var_ace9fb52, undefined);
		}
	}
	deathstash = spawn("script_model", player.origin);
	if(!isdefined(deathstash))
	{
		return;
	}
	if(is_true(level.var_65f7ae17))
	{
		deathstash setmodel("p8_fxanim_wz_win_death_stash_mod");
	}
	else
	{
		if(is_true(level.var_7b65cb7))
		{
			deathstash setmodel("p8_fxanim_wz_spd_death_stash_mod");
		}
		else
		{
			deathstash setmodel("p8_fxanim_wz_death_stash_mod");
		}
	}
	deathstash useanimtree("generic");
	deathstash notsolid();
	targetname = (player getentitynumber() + "_death_stash_") + randomint(2147483647);
	deathstash.targetname = targetname;
	deathstash.var_bad13452 = 0;
	deathstash.var_a76e4941 = 1;
	var_beee4134 = deathstash function_a938fba7(player, player.origin, player.angles, undefined, 1);
	level.var_8ac64bf3[level.var_8ac64bf3.size] = deathstash;
	deathstashitems = 0;
	if(!var_beee4134)
	{
		deathstash.stationary = 1;
	}
	foreach(inventoryitem in player.inventory.items)
	{
		itemid = inventoryitem.id;
		if(itemid == 32767)
		{
			continue;
		}
		if(isdefined(inventoryitem.endtime))
		{
			continue;
		}
		if(is_true(inventoryitem.var_a6762160.var_6b5d0aaa))
		{
			continue;
		}
		item_weapon = item_world_util::function_f4a8d375(itemid);
		count = (isdefined(inventoryitem.count) ? inventoryitem.count : 1);
		amount = inventoryitem.amount;
		if(isdefined(item_weapon) && inventoryitem.var_a6762160.itemtype == #"weapon")
		{
			var_4f21d62e = namespace_a0d533d1::function_2b83d3ff(inventoryitem);
			inventoryitem.weaponoptions = player item_inventory::function_fc04b237(var_4f21d62e, inventoryitem.weaponoptions);
			var_ca577a9c = player getweaponammoclip(var_4f21d62e);
			amount = min(item_weapon.clipsize, var_ca577a9c);
			addammo = var_ca577a9c - item_weapon.clipsize;
			if(addammo > 0)
			{
				player function_fc9f8b05(var_4f21d62e, addammo);
			}
		}
		if(count <= 0)
		{
			continue;
		}
		if(isdefined(item_weapon))
		{
			drop_items[drop_item_id.size] = item_weapon;
		}
		drop_count[drop_item_id.size] = count;
		drop_amount[drop_item_id.size] = amount;
		drop_weapon_options[drop_item_id.size] = inventoryitem.weaponoptions;
		var_3f67a340[drop_item_id.size] = inventoryitem.var_e91aba42;
		var_d54d0589[drop_item_id.size] = inventoryitem.var_1181c08b;
		drop_item_id[drop_item_id.size] = itemid;
	}
	foreach(itemid in player.inventory.ammo)
	{
		weapon = getweapon(ammoweapon);
		ammostock = player getweaponammostock(weapon);
		player setweaponammostock(weapon, 0);
		if(ammostock > 0)
		{
			drop_items[drop_item_id.size] = weapon;
			drop_amount[drop_item_id.size] = ammostock;
			drop_count[drop_item_id.size] = 1;
			drop_item_id[drop_item_id.size] = itemid;
		}
	}
	if(drop_item_id.size > 0)
	{
		foreach(var_bf145320 in level.var_19e75cfb)
		{
			itemname = var_bf145320.type;
			if(isdefined(level.var_4afb8f5a[itemname]))
			{
				itemname = level.var_4afb8f5a[itemname];
				if(itemname == #"")
				{
					continue;
				}
			}
			itempoint = function_4ba8fde(itemname);
			if(!isdefined(itempoint))
			{
				continue;
			}
			if(var_bf145320.chance >= randomfloat(1))
			{
				itemid = itempoint.id;
				item_weapon = item_world_util::function_f4a8d375(itemid);
				if(isdefined(item_weapon))
				{
					drop_items[drop_item_id.size] = item_weapon;
				}
				drop_count[drop_item_id.size] = 1;
				drop_amount[drop_item_id.size] = 1;
				drop_item_id[drop_item_id.size] = itemid;
			}
		}
	}
	var_ab883d36 = undefined;
	if(player function_ba84d97e())
	{
		dogtag = function_4ba8fde(#"hash_4aed1697bd23e59f");
		if(isdefined(dogtag))
		{
			var_ab883d36 = drop_item_id.size;
			drop_count[var_ab883d36] = 1;
			drop_amount[var_ab883d36] = 1;
			drop_item_id[var_ab883d36] = dogtag.id;
		}
	}
	if(player.sessionstate != "disconnected")
	{
		player item_inventory::reset_inventory(0);
	}
	deathstash endon(#"death");
	waitframe(1);
	function_44a6883c(drop_item_id, drop_items, drop_count, drop_amount, 1, 1);
	if(deathstashitems <= 0 && drop_item_id.size <= 0)
	{
		if(var_beee4134)
		{
			deathstash waittill(#"stationary");
		}
		deathstash.stationary = 1;
		deathstash animscripted("death_stash_open", deathstash.origin, deathstash.angles, "p8_fxanim_wz_death_stash_used_anim", "normal", "root", 1, 0);
		deathstash waittill(#"death_stash_open");
		deathstash animscripted("death_stash_empty", deathstash.origin, deathstash.angles, "p8_fxanim_wz_death_stash_empty_anim", "normal", "root", 1, 0);
		deathstash.var_bad13452 = 2;
		deathstash clientfield::set("dynamic_stash", 2);
	}
	else
	{
		deathstash clientfield::set("dynamic_stash", 1);
	}
	deathstash clientfield::set("dynamic_stash_type", 2);
	deathstash.stash_type = 2;
	if(drop_item_id.size <= 0)
	{
		return items;
	}
	if(!isdefined(player) && isdefined(var_ab883d36))
	{
		drop_item_id[var_ab883d36] = -1;
	}
	degree = 0;
	var_758f910 = drop_item_id.size;
	var_557c3e3e = int((360 / var_758f910) * 2);
	even = (drop_item_id.size % 2) == 0;
	for(index = 0; index < drop_item_id.size; index++)
	{
		if(drop_item_id[index] == -1)
		{
			continue;
		}
		item = player function_fd9026e4(index, drop_items[index], drop_count[index], drop_amount[index], drop_item_id[index], deathstash.origin, deathstash.angles, 0, 1, 1, targetname, deathstash, array(), 1, drop_weapon_options[index], var_d148a5b6[index], undefined, var_d54d0589[index]);
		items[items.size] = item;
		if(!isdefined(deathstash.var_7b500c20))
		{
			deathstash.var_7b500c20 = [];
		}
		else if(!isarray(deathstash.var_7b500c20))
		{
			deathstash.var_7b500c20 = array(deathstash.var_7b500c20);
		}
		deathstash.var_7b500c20[deathstash.var_7b500c20.size] = item;
		if(isplayer(player) && item.var_a6762160.itemtype == #"dogtag")
		{
			item.victim = player;
			item.victimteam = player.team;
			if(isdefined(player.laststandparams))
			{
				item.attacker = player.laststandparams.attacker;
				if(isdefined(item.attacker))
				{
					item.attackerteam = item.attacker.team;
				}
			}
			item.var_25b21f27 = deathstash;
			player.var_c0ad34c = item;
			deathstash.team = player.team;
			deathstash.var_befa8c8c = function_5c22c173(deathstash, player.team);
		}
	}
	level.var_ace9fb52[level.var_ace9fb52.size] = deathstash;
	return items;
}

/*
	Name: function_30f75868
	Namespace: item_drop
	Checksum: 0x6351EDCD
	Offset: 0x45B8
	Size: 0xB10
	Parameters: 11
	Flags: Linked
*/
function function_30f75868(index, weapon, count, amount, itemid, position, angles, falling, var_ba40b4c1, attachments, var_bce3d77a)
{
	if(!isdefined(index))
	{
		index = 0;
	}
	if(!isdefined(weapon))
	{
		weapon = undefined;
	}
	if(!isdefined(count))
	{
		count = 0;
	}
	if(!isdefined(amount))
	{
		amount = 0;
	}
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	if(!isdefined(falling))
	{
		falling = 2;
	}
	if(!isdefined(var_ba40b4c1))
	{
		var_ba40b4c1 = 1;
	}
	if(!isdefined(attachments))
	{
		attachments = undefined;
	}
	if(!isdefined(var_bce3d77a))
	{
		var_bce3d77a = undefined;
	}
	item_world::function_1b11e73c();
	/#
		assert(item_world_util::function_2c7fc531(itemid));
	#/
	if(count <= 0)
	{
		return undefined;
	}
	[[ level.var_98d0ae2b ]]->waitinqueue();
	arrayremovevalue(level.var_18dc9d17, undefined);
	var_2e8786e2 = 250;
	if(isdefined(level.var_75c2c45f))
	{
		var_2e8786e2 = level.var_75c2c45f;
	}
	if(sessionmodeiswarzonegame() && is_true(getgametypesetting(#"wzbigteambattle")))
	{
		var_2e8786e2 = 250;
	}
	if(level.var_18dc9d17.size > var_2e8786e2)
	{
		for(var_ab45d001 = 0; var_ab45d001 < level.var_18dc9d17.size; var_ab45d001++)
		{
			var_53b9fe70 = level.var_18dc9d17[var_ab45d001];
			if(isdefined(var_53b9fe70) && isdefined(var_53b9fe70.var_a6762160) && is_true(var_53b9fe70.var_a6762160.var_4cd830a))
			{
				continue;
			}
			var_53b9fe70.hidetime = gettime();
			item_world::function_a54d07e6(var_53b9fe70);
			var_53b9fe70 delete();
			break;
		}
		if(var_ab45d001 >= level.var_18dc9d17.size)
		{
			level.var_18dc9d17[0].hidetime = gettime();
			item_world::function_a54d07e6(level.var_18dc9d17[0]);
			level.var_18dc9d17[0] delete();
		}
	}
	item = function_b1702735(itemid);
	if(!isdefined(item) || !isdefined(item.var_a6762160))
	{
		return undefined;
	}
	if(is_true(item.var_a6762160.var_340eac1f))
	{
		originalattachments = item.attachments;
		item.attachments = attachments;
		if(!namespace_a0d533d1::function_ee669356(item))
		{
			if(isdefined(item.var_a6762160.baseweapon))
			{
				baseweapon = item.var_a6762160.baseweapon;
				item = function_4ba8fde(baseweapon);
				if(!isdefined(item) || !isdefined(item.var_a6762160))
				{
					/#
						assert(0, "" + baseweapon);
					#/
					return undefined;
				}
			}
			else
			{
				/#
					assert(0, "");
				#/
			}
		}
		item.attachments = originalattachments;
	}
	if(isdefined(level.var_4afb8f5a[item.var_a6762160.name]))
	{
		item_name = level.var_4afb8f5a[item.var_a6762160.name];
		if(item_name == #"")
		{
			return undefined;
		}
		item = function_4ba8fde(item_name);
		if(!isdefined(item) || !isdefined(item.var_a6762160))
		{
			return undefined;
		}
		weapon = item_world_util::function_f4a8d375(item.id);
	}
	if(!item_world_util::function_74e1e547(position))
	{
		return undefined;
	}
	dropitem = spawn("script_model", position);
	dropitem.angles = angles;
	dropitem.attachments = attachments;
	dropitem.var_627c698b = weapon;
	dropitem.deathstash = 0;
	dropitem.droptime = gettime();
	dropitem function_801fcc9e(250);
	dropitem.id = function_4ba8fde(item.var_a6762160.name).id;
	/#
		assert(dropitem.id < 2048);
	#/
	dropitem.var_bd027dd9 = item_world_util::function_1f0def85(dropitem);
	dropitem.var_a6762160 = item.var_a6762160;
	dropitem clientfield::set("dynamic_item_drop", 1);
	dropitem function_46d7f921(dropitem.id);
	dropitem notsolid();
	dropitem ghost();
	dropitem.hidetime = 0;
	dropitem.amount = amount;
	dropitem.count = count;
	dropitem.var_bce3d77a = var_bce3d77a;
	dropitem clientfield::set("dynamic_item_drop_count", int(max(dropitem.count, dropitem.amount)));
	if(var_ba40b4c1 && isdefined(dropitem.var_a6762160.var_77d2cbb5))
	{
		dropitem setmodel(dropitem.var_a6762160.var_77d2cbb5);
	}
	else
	{
		if(isdefined(dropitem.var_a6762160.model))
		{
			dropitem setmodel(dropitem.var_a6762160.model);
		}
		else
		{
			if(isdefined(weapon))
			{
				dropitem setmodel(weapon.worldmodel);
			}
			else
			{
				dropitem delete();
				return undefined;
			}
		}
	}
	if(!namespace_a0d533d1::function_70b12595(dropitem))
	{
		dropitem clientfield::set("item_world_attachments", 1);
	}
	else
	{
		dropitem clientfield::set("item_world_attachments", 0);
	}
	if(isdefined(weapon))
	{
		dropitem setweapon(weapon);
		dropitem useweaponhidetags(weapon);
	}
	if(isdefined(dropitem.var_a6762160.modelscale))
	{
		dropitem setscale(dropitem.var_a6762160.modelscale);
	}
	arrayremovevalue(level.item_spawn_drops, undefined, 1);
	if(isdefined(level.item_spawn_drops[dropitem.var_bd027dd9]))
	{
		level.item_spawn_drops[dropitem.var_bd027dd9] delete();
	}
	level.item_spawn_drops[dropitem.var_bd027dd9] = dropitem;
	level.var_18dc9d17[level.var_18dc9d17.size] = dropitem;
	dropitem.falling = falling;
	if(falling != 1 && falling != 0)
	{
		dropitem clientfield::set("dynamic_item_drop_falling", 1);
		var_135ae3f7 = dropitem function_21cfd4a(index, position, angles, falling);
		originoffset = function_feb1473(item.var_a6762160, var_ba40b4c1);
		anglesoffset = function_3b2b6383(var_135ae3f7.end_origin, angles, (0, 0, 1), item.var_a6762160, var_ba40b4c1);
		droptime = dropitem namespace_b637a3ed::drop_item(var_135ae3f7.drop_index, position, angles, falling, 1, originoffset, anglesoffset);
	}
	else if(falling == 1)
	{
		dropitem function_a938fba7((isentity(self) ? self : dropitem), position, angles, item.var_a6762160, undefined, var_ba40b4c1);
	}
	dropitem thread function_567cbe1c(dropitem, droptime);
	dropitem thread function_6abcd75d(dropitem, droptime);
	return dropitem;
}

/*
	Name: function_6abcd75d
	Namespace: item_drop
	Checksum: 0xC0AEAE22
	Offset: 0x50D0
	Size: 0x9C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6abcd75d(item, droptime)
{
	item endon(#"death");
	if(!isdefined(item) || !isdefined(item.var_a6762160) || !isdefined(item.var_a6762160.var_6cc98559))
	{
		return;
	}
	if(isdefined(droptime))
	{
		wait(droptime);
	}
	playsoundatposition(item.var_a6762160.var_6cc98559, item.origin);
}

/*
	Name: function_567cbe1c
	Namespace: item_drop
	Checksum: 0xDD0B8D39
	Offset: 0x5178
	Size: 0x2AC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_567cbe1c(item, droptime)
{
	item endon(#"death");
	var_7c26e82a = ((isdefined(item.var_a6762160.var_d22413f4) ? item.var_a6762160.var_d22413f4 : 0), (isdefined(item.var_a6762160.var_c3d47751) ? item.var_a6762160.var_c3d47751 : 0), (isdefined(item.var_a6762160.var_f47bd8a3) ? item.var_a6762160.var_f47bd8a3 : 0));
	var_88d33a4b = ((isdefined(item.var_a6762160.var_2e8b17a8) ? item.var_a6762160.var_2e8b17a8 : 0), (isdefined(item.var_a6762160.var_48644b5a) ? item.var_a6762160.var_48644b5a : 0), (isdefined(item.var_a6762160.var_fa2d2eed) ? item.var_a6762160.var_fa2d2eed : 0));
	if(lengthsquared(var_7c26e82a) <= 0.01 && lengthsquared(var_88d33a4b) <= 0.01)
	{
		return;
	}
	if(isdefined(droptime))
	{
		wait(droptime + 0.1);
	}
	var_696605c2 = (isdefined(item.var_a6762160.var_9e569978) ? item.var_a6762160.var_9e569978 : 1);
	var_488074a5 = (isdefined(item.var_a6762160.var_3af59a99) ? item.var_a6762160.var_3af59a99 : 1);
	item bobbing(var_7c26e82a, var_696605c2 * randomfloatrange(1, 1.1), var_488074a5 * randomfloatrange(1, 1.1));
	item rotate(var_88d33a4b);
}

/*
	Name: drop_item
	Namespace: item_drop
	Checksum: 0xE239A9F8
	Offset: 0x5430
	Size: 0x128
	Parameters: 8
	Flags: Linked
*/
function drop_item(index, weapon, count, amount, itemid, position, angles, falling)
{
	if(!isdefined(index))
	{
		index = 0;
	}
	if(!isdefined(weapon))
	{
		weapon = undefined;
	}
	if(!isdefined(count))
	{
		count = 0;
	}
	if(!isdefined(amount))
	{
		amount = 0;
	}
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	if(!isdefined(falling))
	{
		falling = 2;
	}
	dropitem = function_30f75868(index, weapon, count, amount, itemid, position, angles, falling);
	if(!isdefined(dropitem))
	{
		return undefined;
	}
	if(isplayer(self))
	{
		self callback::callback(#"on_drop_item", {#item:dropitem});
	}
	return dropitem;
}

/*
	Name: function_7910964d
	Namespace: item_drop
	Checksum: 0xC3EDB0CA
	Offset: 0x5560
	Size: 0xC4
	Parameters: 8
	Flags: None
*/
function function_7910964d(index, weapon, count, amount, itemid, position, angles, falling)
{
	if(!isdefined(index))
	{
		index = 0;
	}
	if(!isdefined(weapon))
	{
		weapon = undefined;
	}
	if(!isdefined(count))
	{
		count = 0;
	}
	if(!isdefined(amount))
	{
		amount = 0;
	}
	if(!isdefined(angles))
	{
		angles = (0, 0, 0);
	}
	if(!isdefined(falling))
	{
		falling = 2;
	}
	drop_item(index, weapon, count, amount, itemid, position, angles, falling);
}

/*
	Name: function_fd9026e4
	Namespace: item_drop
	Checksum: 0xD4E5BB1
	Offset: 0x5630
	Size: 0x3F0
	Parameters: 22
	Flags: Linked
*/
function function_fd9026e4(index, weapon, count, amount, itemid, position, angles, falling, stashitem, deathstash, targetname, parentent, attachments, var_ba40b4c1, weaponoptions, var_e91aba42, var_908f65ca, var_1181c08b, stockammo, aat, var_a8bccf69, var_bce3d77a)
{
	if(!isdefined(weapon))
	{
		weapon = 0;
	}
	if(!isdefined(count))
	{
		count = undefined;
	}
	if(!isdefined(amount))
	{
		amount = 0;
	}
	if(!isdefined(itemid))
	{
		itemid = 0;
	}
	if(!isdefined(falling))
	{
		falling = (0, 0, 0);
	}
	if(!isdefined(stashitem))
	{
		stashitem = 2;
	}
	if(!isdefined(deathstash))
	{
		deathstash = 0;
	}
	if(!isdefined(targetname))
	{
		targetname = 0;
	}
	if(!isdefined(parentent))
	{
		parentent = undefined;
	}
	if(!isdefined(attachments))
	{
		attachments = undefined;
	}
	if(!isdefined(var_ba40b4c1))
	{
		var_ba40b4c1 = undefined;
	}
	if(!isdefined(weaponoptions))
	{
		weaponoptions = 1;
	}
	if(!isdefined(var_e91aba42))
	{
		var_e91aba42 = undefined;
	}
	if(!isdefined(var_908f65ca))
	{
		var_908f65ca = undefined;
	}
	if(!isdefined(var_1181c08b))
	{
		var_1181c08b = undefined;
	}
	if(!isdefined(stockammo))
	{
		stockammo = undefined;
	}
	if(!isdefined(aat))
	{
		aat = undefined;
	}
	if(!isdefined(var_a8bccf69))
	{
		var_a8bccf69 = undefined;
	}
	if(!isdefined(var_bce3d77a))
	{
		var_bce3d77a = undefined;
	}
	/#
		assert(!isdefined(targetname) || targetname === 1 || targetname === 0);
	#/
	dropitem = function_30f75868(weapon, count, amount, itemid, position, angles, falling, stashitem, weaponoptions, var_ba40b4c1, var_bce3d77a);
	if(!isdefined(dropitem))
	{
		return;
	}
	dropitem.attachments = var_ba40b4c1;
	dropitem.var_67169c0b = parentent;
	dropitem.deathstash = targetname;
	dropitem.weaponoptions = var_e91aba42;
	dropitem.var_e91aba42 = var_908f65ca;
	dropitem.var_1181c08b = var_1181c08b;
	dropitem.aat = aat;
	dropitem.var_a8bccf69 = var_a8bccf69;
	dropitem.stockammo = stockammo;
	dropitem.var_bce3d77a = var_bce3d77a;
	if(deathstash)
	{
		dropitem clientfield::set("dynamic_item_drop", 5);
		dropitem.hidetime = -1;
	}
	if(isentity(attachments) && dropitem !== attachments && item_world_util::function_74e1e547(attachments.origin))
	{
		dropitem.origin = attachments.origin;
		if(!is_true(attachments.stationary) || isdefined(attachments getlinkedent()))
		{
			dropitem linkto(attachments);
		}
	}
	if(isplayer(self))
	{
		self callback::callback(#"on_drop_item", {#deathstash:targetname, #item:dropitem});
	}
	return dropitem;
}

/*
	Name: function_ba84d97e
	Namespace: item_drop
	Checksum: 0xC4FE430A
	Offset: 0x5A28
	Size: 0x112
	Parameters: 0
	Flags: Linked
*/
function function_ba84d97e()
{
	if(!is_true(level.droppedtagrespawn) || !item_world_util::use_item_spawns())
	{
		return 0;
	}
	/#
		if(is_true(getdvarint(#"hash_598e0518c577137d")))
		{
			return 1;
		}
	#/
	if(!isdefined(self.laststandparams))
	{
		return 0;
	}
	return self dogtags::should_spawn_tags(self.laststandparams.einflictor, self.laststandparams.attacker, self.laststandparams.idamage, self.laststandparams.smeansofdeath, self.laststandparams.weapon, self.laststandparams.vdir, self.laststandparams.shitloc, undefined, undefined);
}

/*
	Name: function_4da960f6
	Namespace: item_drop
	Checksum: 0x148EC3E8
	Offset: 0x5B48
	Size: 0x26A
	Parameters: 3
	Flags: Linked
*/
function function_4da960f6(origin, radius, time)
{
	/#
		assert(isvec(origin));
	#/
	/#
		assert(isfloat(radius) || isint(radius));
	#/
	/#
		assert(isfloat(time) || isint(time));
	#/
	if(time < 0)
	{
		return;
	}
	var_6665e24 = arraysortclosest(level.item_spawn_drops, origin, 24, 0, radius);
	var_c36bd68a = arraysortclosest(level.var_ace9fb52, origin, 24, 0, radius);
	var_f4b807cb = arraycombine(var_6665e24, var_c36bd68a, 1, 0);
	starttime = gettime();
	while((float(gettime() - starttime)) / 1000 < time)
	{
		foreach(item in var_f4b807cb)
		{
			if(!isentity(item))
			{
				continue;
			}
			if(isdefined(item.classname) && item.classname == #"grenade")
			{
				continue;
			}
			item physicslaunch();
		}
		waitframe(1);
	}
}

/*
	Name: function_d8342646
	Namespace: item_drop
	Checksum: 0x3C58A779
	Offset: 0x5DC0
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function function_d8342646(deathstash)
{
	if(isentity(deathstash))
	{
		function_f04e5fc2(deathstash.var_befa8c8c);
		deathstash.var_befa8c8c = undefined;
		deathstash.team = #"none";
	}
}

/*
	Name: function_ccba50c6
	Namespace: item_drop
	Checksum: 0xA91C0194
	Offset: 0x5E30
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_ccba50c6(dogtag)
{
	function_d8342646(dogtag.var_25b21f27);
	function_ba4c90d9(dogtag);
	dogtag delete();
}

/*
	Name: function_5c22c173
	Namespace: item_drop
	Checksum: 0xFC0912A7
	Offset: 0x5E90
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function function_5c22c173(ent, team)
{
	objid = gameobjects::get_next_obj_id();
	objective_add(objid, "active", ent, "conf_dogtags_hpc");
	objective_setteam(objid, team);
	function_4339912c(objid);
	function_29ef32ee(objid, team);
	return objid;
}

/*
	Name: function_f04e5fc2
	Namespace: item_drop
	Checksum: 0x275F95B6
	Offset: 0x5F38
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_f04e5fc2(objid)
{
	if(isdefined(objid))
	{
		objective_delete(objid);
		gameobjects::release_obj_id(objid);
	}
}

/*
	Name: function_3e7494e3
	Namespace: item_drop
	Checksum: 0x7F7C3AC6
	Offset: 0x5F88
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function function_3e7494e3()
{
	self.var_eeb03183 = 1;
}

/*
	Name: function_801fcc9e
	Namespace: item_drop
	Checksum: 0xB66A608
	Offset: 0x5FA8
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_801fcc9e(var_84802706)
{
	/#
		assert(isentity(self));
	#/
	/#
		assert(isint(var_84802706));
	#/
	self.var_afda6972 = gettime() + var_84802706;
}

/*
	Name: function_ba4c90d9
	Namespace: item_drop
	Checksum: 0x57DDCEF3
	Offset: 0x6020
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_ba4c90d9(item)
{
	if(isdefined(item) && isdefined(item.var_bd027dd9) && isdefined(level.item_spawn_drops[item.var_bd027dd9]))
	{
		item clientfield::set("dynamic_item_drop", 0);
		arrayremoveindex(level.item_spawn_drops, item.var_bd027dd9, 1);
	}
}

/*
	Name: debug_sphere
	Namespace: item_drop
	Checksum: 0xE09FB2F1
	Offset: 0x60B0
	Size: 0x114
	Parameters: 3
	Flags: None
*/
function debug_sphere(origin, radius, color)
{
	/#
		if(!getdvarint(#"hash_2844354393b7be9e", 0))
		{
			return;
		}
		sec = getdvarint(#"hash_6c3e4a7cf7546b8f", 10);
		var_f04d2832 = int(1 / (float(function_60d95f53()) / 1000));
		sphere(origin, radius, color, 1, 0, 10, var_f04d2832 * sec);
		recordsphere(origin, radius, color, "");
	#/
}

/*
	Name: debug_line
	Namespace: item_drop
	Checksum: 0xC0B6A3E4
	Offset: 0x61D0
	Size: 0x10C
	Parameters: 3
	Flags: None
*/
function debug_line(start, end, color)
{
	/#
		if(!getdvarint(#"hash_2844354393b7be9e", 0))
		{
			return;
		}
		sec = getdvarint(#"hash_6c3e4a7cf7546b8f", 10);
		var_f04d2832 = int(1 / (float(function_60d95f53()) / 1000));
		line(start, end, color, 1, 0, var_f04d2832 * sec);
		recordline(start, end, color, "");
	#/
}

