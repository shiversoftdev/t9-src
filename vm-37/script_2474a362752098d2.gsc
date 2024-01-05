#using script_683a55734f15d50e;
#using script_77357b2d180aa2b8;
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_1ce46999727f2f2b;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_350cffecd05ef6cf;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using script_2e9202713de2b353;
#using script_41fbdfb1149a433e;
#using script_73ad7687b437e468;
#using script_48e04a393ec6d855;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_491fa2b2;

/*
	Name: init
	Namespace: namespace_491fa2b2
	Checksum: 0x403B0E6A
	Offset: 0x270
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function init()
{
	namespace_41f5b853::init();
	namespace_f63bdb08::init();
	level.doa.var_f4a69294 = [];
	level.doa.var_b8ef1466 = [];
	level.doa.var_c793b1bb = [];
	level.doa.var_f4a69294[#"green"] = function_f143eef7();
	level.doa.var_f4a69294[#"blue"] = function_f143eef7();
	level.doa.var_f4a69294[#"red"] = function_f143eef7();
	level.doa.var_f4a69294[#"yellow"] = function_f143eef7();
	main();
}

/*
	Name: main
	Namespace: namespace_491fa2b2
	Checksum: 0x24C3D77C
	Offset: 0x3B0
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function main()
{
	function_df55eb9d();
	level.doa.var_b8ef1466 = [];
	level.doa.var_c793b1bb = [];
}

/*
	Name: function_df55eb9d
	Namespace: namespace_491fa2b2
	Checksum: 0x84C80247
	Offset: 0x3F8
	Size: 0x272
	Parameters: 3
	Flags: Linked
*/
function function_df55eb9d(context, loottype, var_d1b6de15)
{
	if(!isdefined(context))
	{
		context = 0;
	}
	foreach(item in level.doa.var_b8ef1466)
	{
		if(!isdefined(item))
		{
			continue;
		}
		if(context != 0 && item.context != context)
		{
			continue;
		}
		if(item === var_d1b6de15)
		{
			continue;
		}
		if(isdefined(loottype))
		{
			if(!isdefined(item.loottype))
			{
				continue;
			}
			if(isdefined(item.loottype) && item.loottype != loottype)
			{
				continue;
			}
		}
		item delete();
	}
	arrayremovevalue(level.doa.var_b8ef1466, undefined);
	foreach(item in level.doa.var_c793b1bb)
	{
		if(isdefined(item))
		{
			item delete();
		}
	}
	level.doa.var_c793b1bb = [];
	foreach(trigger in level.doa.var_f4a69294)
	{
	}
}

/*
	Name: function_ebbc302
	Namespace: namespace_491fa2b2
	Checksum: 0x37028ECD
	Offset: 0x678
	Size: 0x2DE
	Parameters: 0
	Flags: Linked
*/
function function_ebbc302()
{
	self notify("10435409a9620955");
	self endon("10435409a9620955");
	self endon(#"disconnect");
	/#
		assert(isdefined(self.doa), "");
	#/
	mytrigger = level.doa.var_f4a69294[self.doa.color];
	mytrigger setteamfortrigger(self.team);
	self clientclaimtrigger(mytrigger);
	mytrigger.player = self;
	while(true)
	{
		wait(0.5);
		closest = undefined;
		items = arraysortclosest(level.doa.var_b8ef1466, self.origin, 1);
		if(items.size)
		{
			closest = items[0];
		}
		if(isdefined(closest))
		{
			if(closest !== self.doa.var_96175d8a)
			{
				deltaz = abs(self.origin[2] - closest.origin[2]);
				if(deltaz > 128)
				{
					closest = undefined;
				}
				if(isdefined(closest))
				{
					distsq = distancesquared(self.origin, closest.origin);
					if(distsq > sqr(1024))
					{
						closest = undefined;
					}
				}
			}
		}
		if(isdefined(closest))
		{
			if(closest !== self.doa.var_96175d8a || function_dd626f96(closest))
			{
				mytrigger function_8328d4bc(closest);
			}
			self.doa.var_96175d8a = closest;
		}
		else
		{
			mytrigger.origin = self.origin + (vectorscale((0, 0, -1), 30000));
			mytrigger.var_806ce8f = undefined;
			mytrigger sethintstring(#"");
			mytrigger triggerenable(0);
			self.doa.var_96175d8a = undefined;
		}
	}
}

/*
	Name: function_8f5419f1
	Namespace: namespace_491fa2b2
	Checksum: 0x95BCE9DB
	Offset: 0x960
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function function_8f5419f1()
{
	mytrigger = level.doa.var_f4a69294[self.doa.color];
	return self istouching(mytrigger);
}

/*
	Name: function_dd626f96
	Namespace: namespace_491fa2b2
	Checksum: 0xC6C81386
	Offset: 0x9B0
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function function_dd626f96(item)
{
	if(item.var_d6118311 === 2)
	{
		return 1;
	}
	if(item.var_d6118311 === 8)
	{
		return 1;
	}
	return is_true(item.locked);
}

/*
	Name: function_8328d4bc
	Namespace: namespace_491fa2b2
	Checksum: 0xBAC0E29F
	Offset: 0xA18
	Size: 0x894
	Parameters: 1
	Flags: Linked
*/
function function_8328d4bc(item)
{
	if(!isdefined(item))
	{
		return;
	}
	self.origin = item.origin + vectorscale((0, 0, 1), 24);
	if(isdefined(item.trigger_offset))
	{
		self.origin = self.origin + item.trigger_offset;
	}
	if(!isdefined(item.var_cbff4088))
	{
		item.var_cbff4088 = 0;
	}
	if(item.var_cbff4088 == -1)
	{
		if(getplayers().size <= 2)
		{
			item.var_cbff4088 = 1;
		}
		else
		{
			item.var_cbff4088 = 2;
		}
	}
	if(!isdefined(item.var_950bcf12))
	{
		item.var_950bcf12 = item.var_cbff4088;
	}
	self.var_b57ccc47 = self.var_806ce8f;
	self.var_806ce8f = item;
	self sethintstring(#"hash_bf1faaf9f4ab783");
	switch(item.var_d6118311)
	{
		case 9:
		{
			self sethintstring(#"hash_116cdb7f4910b48f");
			break;
		}
		case 4:
		{
			fate = item.data;
			if(self.player doa_fate::function_afe89b8c(fate.var_c8386627))
			{
				self sethintstring(#"hash_35d21b3088f19ee7");
			}
			else
			{
				self sethintstring(#"hash_26f6da6f6ca5dfa4");
			}
			break;
		}
		case 1:
		{
			self sethintstring(#"hash_226d9049ece37c17");
			break;
		}
		case 8:
		{
			if(self.doorstate === 1)
			{
				self sethintstring(#"hash_7ee185f0146bd791");
			}
			else
			{
				self sethintstring(#"hash_1830b9b637fcebaa");
			}
			break;
		}
		case 2:
		{
			if(isdefined(item.var_fc5f2aa0) && isdefined(item.var_fc5f2aa0.var_115ea089) && isdefined(item.var_fc5f2aa0.hintstring))
			{
				ent = getent(item.var_fc5f2aa0.var_115ea089, "script_noteworthy");
				if(!isdefined(ent))
				{
					item.var_fc5f2aa0.hintstring = item.var_fc5f2aa0.var_e8dff5e5;
					item.var_d6118311 = 1;
				}
			}
			if(isdefined(item.var_fc5f2aa0) && isdefined(item.var_fc5f2aa0.hintstring))
			{
				self sethintstring(item.var_fc5f2aa0.hintstring);
			}
			else
			{
				if(self.player.doa.score.keys == 0)
				{
					self sethintstring(#"hash_5c2a90001a3be8b5");
				}
				else
				{
					self sethintstring(#"hash_156739736ad89c28");
				}
			}
			break;
		}
		case 5:
		case 7:
		{
			if(is_true(item.locked))
			{
				if(self.player.doa.score.keys == 0)
				{
					self sethintstring(#"hash_2f8c4610353b9754");
				}
				else
				{
					self sethintstring(#"hash_692637e6361aa6fd");
				}
			}
			else
			{
				self sethintstring(#"hash_7c3502418402b5ea");
			}
			break;
		}
		case 6:
		{
			if(is_true(item.locked))
			{
				if(self.player.doa.score.keys == 0)
				{
					self sethintstring(#"hash_39ebdbb0226b329f");
					if(isdefined(self.var_b57ccc47) && self.var_b57ccc47 != self.var_806ce8f)
					{
						self.player playsoundtoplayer(#"hash_69cbee6dafb05bae", self.player);
					}
				}
				else
				{
					if(item.var_cbff4088 > 1 && item.var_cbff4088 != item.var_950bcf12)
					{
						self sethintstring(#"hash_7b23848ec07aad08");
					}
					else
					{
						self sethintstring(#"hash_54b6fea6bd91db7c");
					}
				}
			}
			else
			{
				self sethintstring(#"hash_20c1284622784d1d");
			}
			break;
		}
		case 3:
		{
			if(is_true(item.locked))
			{
				if(self.player.doa.score.keys == 0)
				{
					self sethintstring(#"hash_ce3afacfc4ce084");
				}
				else
				{
					self sethintstring(#"hash_d0088d8ea0c0b0d");
				}
			}
			else
			{
				switch(item.loottype)
				{
					case 1:
					case 2:
					case 3:
					case 4:
					{
						self sethintstring(#"hash_7dbf76733550293a");
						break;
					}
					case 6:
					{
						self sethintstring(#"hash_4bfbefc2b26dbccf");
						self function_dae4ab9b(0.15);
						break;
					}
					case 12:
					{
						self sethintstring(#"hash_2ae2e0909bc1c560");
						self function_dae4ab9b(0.15);
						break;
					}
					default:
					{
						self sethintstring(#"hash_49306fb46908df39");
						break;
					}
				}
			}
			break;
		}
	}
	self triggerenable(1);
}

/*
	Name: function_f143eef7
	Namespace: namespace_491fa2b2
	Checksum: 0xE53A8546
	Offset: 0x12B8
	Size: 0x80
	Parameters: 0
	Flags: Linked
*/
function function_f143eef7()
{
	usetrigger = namespace_ec06fe4a::spawntrigger("trigger_radius_use", (0, 0, 0), 0, 96, 96);
	if(isdefined(usetrigger))
	{
		usetrigger setcursorhint("HINT_NOICON");
		usetrigger callback::on_trigger(&onusecallback);
	}
	return usetrigger;
}

/*
	Name: onusecallback
	Namespace: namespace_491fa2b2
	Checksum: 0x5A040B32
	Offset: 0x1340
	Size: 0x6A8
	Parameters: 1
	Flags: Linked
*/
function onusecallback(trigger_struct)
{
	player = trigger_struct.activator;
	targ = self.var_806ce8f;
	if(!isdefined(targ))
	{
		return;
	}
	if(is_true(targ.activated))
	{
		return;
	}
	player.doa.var_af53a5b7 = 1;
	if(isdefined(targ))
	{
		switch(targ.var_d6118311)
		{
			case 2:
			{
				if(isdefined(targ.var_fc5f2aa0))
				{
					if(isdefined(targ.var_fc5f2aa0.var_115ea089))
					{
						ent = getent(targ.var_fc5f2aa0.var_115ea089, "script_noteworthy");
						if(isdefined(ent))
						{
							return;
						}
						targ.var_fc5f2aa0.completed = 1;
						targ.var_d6118311 = 1;
					}
				}
				else
				{
					player playrumbleonentity("door_kick");
					if(player.doa.score.keys == 0)
					{
						targ namespace_e32bb68::function_3a59ec34("door_locked");
						return;
					}
					else
					{
						player namespace_eccff4fb::function_849a9028();
						player namespace_e32bb68::function_3a59ec34("evt_doa_pickup_key_unlock");
						targ namespace_e32bb68::function_3a59ec34("door_unlocked");
						targ.var_d6118311 = 1;
					}
				}
			}
			case 1:
			{
				level thread namespace_f63bdb08::function_49957ef3(targ);
				break;
			}
			case 8:
			{
				break;
			}
			case 4:
			{
				fate = targ.data;
				if(self.player doa_fate::function_afe89b8c(fate.var_c8386627))
				{
					targ namespace_e32bb68::function_3a59ec34("fate_denied");
					return;
				}
				if(self.player doa_fate::function_e19c55bd() >= 2)
				{
					var_6b186658 = 1 + (self.player.entnum << 4);
					level clientfield::set("banner_eventplayer", var_6b186658);
					self.player thread function_fe008f40();
					return;
				}
				level thread doa_fate::function_42b0778(targ, player);
				break;
			}
			case 9:
			{
				targ namespace_e32bb68::function_3a59ec34("arcade_coin_insert");
				level thread namespace_41f5b853::function_4d27013d(targ);
				break;
			}
			case 3:
			case 5:
			case 6:
			case 7:
			{
				if(is_true(targ.locked))
				{
					player playrumbleonentity("door_kick");
					if(player.doa.score.keys == 0)
					{
						targ namespace_e32bb68::function_3a59ec34("item_locked");
						return;
					}
					player namespace_eccff4fb::function_849a9028();
					player namespace_e32bb68::function_3a59ec34("evt_doa_pickup_key_unlock");
					if(!isdefined(targ.var_cbff4088))
					{
						targ.var_cbff4088 = 1;
					}
					/#
						assert(targ.var_cbff4088 > 0);
					#/
					targ.var_cbff4088--;
					if(targ.var_d6118311 == 6)
					{
						if(!isdefined(level.doa.var_4ebe1b74))
						{
							level.doa.var_4ebe1b74 = 0;
						}
						level.doa.var_4ebe1b74++;
						if(targ.var_cbff4088 > 0)
						{
							player playsoundtoplayer(#"hash_54eea1b8087b2e05", player);
						}
						else if(targ.var_cbff4088 == 0)
						{
							player playsoundtoplayer(#"hash_477187e7253897bc", player);
						}
					}
					if(targ.var_cbff4088 > 0)
					{
						targ namespace_e32bb68::function_3a59ec34("evt_doa_teleporter_wilds_burst");
						targ namespace_83eb6304::function_3ecfde67("wild_portal_radial_burst");
						targ = undefined;
						break;
					}
					targ namespace_e32bb68::function_3a59ec34("item_unlocked");
					targ.locked = 0;
				}
				level thread namespace_41f5b853::function_4d27013d(targ);
				break;
			}
		}
	}
	if(isdefined(targ))
	{
		if(isdefined(targ.owner))
		{
			targ.owner.activated = 1;
		}
		targ.activated = 1;
		arrayremovevalue(level.doa.var_b8ef1466, targ);
		level.doa.var_c793b1bb[level.doa.var_c793b1bb.size] = targ;
	}
}

/*
	Name: function_fe008f40
	Namespace: namespace_491fa2b2
	Checksum: 0xF52B11EF
	Offset: 0x19F0
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_fe008f40(time)
{
	if(!isdefined(time))
	{
		time = 5;
	}
	self endon(#"disconnect");
	wait(time);
	var_6b186658 = 0 + (self.entnum << 4);
	level clientfield::set("banner_eventplayer", var_6b186658);
}

