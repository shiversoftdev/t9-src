#using script_165beea08a63a243;
#using script_1940fc077a028a81;
#using script_256b8879317373de;
#using script_27347f09888ad15;
#using script_2bb5600d583e2812;
#using script_3357acf79ce92f4b;
#using script_340a2e805e35f7a2;
#using script_37aecc8eb906ed91;
#using script_3f9e0dc8454d98e1;
#using script_4163291d6e693552;
#using script_47fb62300ac0bd60;
#using script_7464a3005f61a5f6;
#using script_7e294a061be2fd9;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_85745671;

/*
	Name: function_1742a4bf
	Namespace: namespace_85745671
	Checksum: 0x5ACA219B
	Offset: 0x398
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1742a4bf()
{
	level notify(56787903);
}

/*
	Name: function_89f2df9
	Namespace: namespace_85745671
	Checksum: 0x8D162386
	Offset: 0x3B8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_74761c506cae8855", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_85745671
	Checksum: 0xF3599FFF
	Offset: 0x400
	Size: 0x40C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_91a15ec0 = #"world";
	level.zombie_team = #"axis";
	level.attackables = [];
	level.var_7fc48a1a = [];
	/#
		level thread function_b4f41a02();
	#/
	level.var_8a3036cc = 0;
	level.var_57a77bb = 0;
	level.var_d5cd88c2 = 0;
	level.var_2510617f = 0;
	level.var_6eb6193a = 0;
	level.var_7dff87f1 = 0;
	level.var_d0c8ad06 = [2:#"hash_7f951f9c9843eb2b", 1:#"hash_7bd308fb4272946", 0:#"hash_5f0909d6906df88"];
	if(is_true(getgametypesetting(#"hash_3109a8794543000f")))
	{
		if(is_true(getgametypesetting(#"hash_42471cb0cbc19544")))
		{
			level.var_9eb9a467 = #"hash_2a471518604bcd8b";
		}
		else
		{
			level.var_9eb9a467 = #"hash_15895bcfe301ee08";
		}
	}
	else
	{
		if(is_true(getgametypesetting(#"hash_42471cb0cbc19544")))
		{
			level.var_9eb9a467 = #"hash_3a93829b52b54c36";
		}
		else
		{
			level.var_9eb9a467 = #"hash_7da4c1f53ef0f7d7";
		}
	}
	level.var_db43cbd7 = #"hash_3165784c9d75971c";
	level.var_1b7acd6d = #"hash_33bdf9068c8cfb57";
	level.var_72151997 = #"hash_3e1e0d5abe4173f2";
	level.var_14364e26 = #"hash_1d5141b0fcc5b473";
	level.var_7d2bc89 = #"hash_1ee01737fce4ccfe";
	if(!isdefined(level.var_454ed97e))
	{
		level.var_454ed97e = new class_c6c0e94();
		[[ level.var_454ed97e ]]->initialize("aiCleanupThrottle", 1, (float(function_60d95f53()) / 1000) * 5);
	}
	level.var_ee27c905 = &function_401070dd;
	clientfield::register("actor", "zombie_teleport", 1, 1, "counter");
	clientfield::register("toplayer", "zombie_vehicle_shake", 1, 1, "counter");
	clientfield::register("toplayer", "zombie_melee_shake", 1, 1, "counter");
	namespace_df7b10e3::register_slowdown(#"hash_4ec13a63f7786c40", 0.5, 1.5);
	if(zm_utility::is_survival())
	{
		callback::on_ai_damage(&on_ai_damage);
	}
}

/*
	Name: function_b4f41a02
	Namespace: namespace_85745671
	Checksum: 0x26A976ED
	Offset: 0x818
	Size: 0x578
	Parameters: 0
	Flags: None
*/
function function_b4f41a02()
{
	/#
		level endon(#"game_ended");
		aitypes = function_19df1c1c();
		setdvar(#"hash_70cb00491d863294", "");
		setdvar(#"hash_209287456d55fca1", "");
		foreach(type in aitypes)
		{
			if(function_e949cfd7(type))
			{
				util::function_345e5b9a((("" + function_9e72a96(type)) + "") + function_9e72a96(type) + "");
				util::function_345e5b9a((("" + function_9e72a96(type)) + "") + function_9e72a96(type) + "");
			}
		}
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		while(true)
		{
			wait(0.1);
			cmd = getdvarstring(#"hash_209287456d55fca1", "");
			if(cmd == "")
			{
				continue;
			}
			cmd_tokens = strtok(cmd, "");
			switch(cmd_tokens[0])
			{
				case "hash_c0b89e8d4a71cff":
				{
					player = level.players[0];
					direction = player getplayerangles();
					direction_vec = anglestoforward(direction);
					eye = player geteye();
					direction_vec = (direction_vec[0] * 8000, direction_vec[1] * 8000, direction_vec[2] * 8000);
					trace = bullettrace(eye, eye + direction_vec, 0, undefined);
					spawner::add_ai_spawn_function(&function_df8d461e);
					ai = spawnactor(cmd_tokens[1], trace[#"position"], (0, 0, 0), "", 1);
					spawner::function_932006d1(&function_df8d461e);
					break;
				}
				case "hash_deec03a3269d42":
				{
					player = level.players[0];
					direction = player getplayerangles();
					direction_vec = anglestoforward(direction);
					eye = player geteye();
					direction_vec = (direction_vec[0] * 8000, direction_vec[1] * 8000, direction_vec[2] * 8000);
					trace = bullettrace(eye, eye + direction_vec, 0, undefined);
					spawner::add_ai_spawn_function(&function_df8d461e);
					ai = spawnactor(cmd_tokens[1], trace[#"position"], (0, 0, 0), "", 1);
					spawner::function_932006d1(&function_df8d461e);
					break;
				}
			}
			setdvar(#"hash_209287456d55fca1", "");
		}
	#/
}

/*
	Name: function_df8d461e
	Namespace: namespace_85745671
	Checksum: 0x4556791C
	Offset: 0xD98
	Size: 0x3C
	Parameters: 0
	Flags: Private
*/
function private function_df8d461e()
{
	/#
		if(self.targetname === "")
		{
			self.ignoreall = 1;
			awareness::pause(self);
		}
	#/
}

/*
	Name: debug_ai
	Namespace: namespace_85745671
	Checksum: 0x9766BCA2
	Offset: 0xDE0
	Size: 0xDFE
	Parameters: 0
	Flags: None
*/
function debug_ai()
{
	/#
		level endon(#"game_ended");
		level.var_b4702614 = [];
		level.var_b4702614[0] = "";
		level.var_b4702614[1] = "";
		level.var_b4702614[2] = "";
		level.var_b4702614[3] = "";
		level.var_b4702614[4] = "";
		level.var_b4702614[5] = "";
		level.var_b4702614[6] = "";
		while(true)
		{
			if(is_true(level.var_e066667d) && isdefined(level.var_91a15ec0))
			{
				var_1795ed47 = getaiteamarray(level.var_91a15ec0);
				foreach(entity in var_1795ed47)
				{
					if(!isalive(entity))
					{
						continue;
					}
					org = entity.origin + vectorscale((0, 0, 1), 100);
					if(isdefined(entity.aistate))
					{
						org = entity.origin + vectorscale((0, 0, 1), 90);
						if(getdvarint(#"recorder_enablerec", 0))
						{
							record3dtext(((isdefined(level.var_b4702614[entity.aistate]) ? level.var_b4702614[entity.aistate] : "") + "") + entity.health, entity.origin, (1, 0.5, 0), "", entity);
						}
						else
						{
							print3d(org, ((isdefined(level.var_b4702614[entity.aistate]) ? level.var_b4702614[entity.aistate] : "") + "") + entity.health, (1, 0.5, 0), 1, 0.2);
						}
					}
					var_2f8d622d = 0;
					if(isdefined(entity.enemy) && entity cansee(entity.enemy))
					{
						var_2f8d622d = 1;
					}
					if(isdefined(entity.var_5a8f690))
					{
						org = entity.origin + vectorscale((0, 0, 1), 85);
						if(getdvarint(#"recorder_enablerec", 0))
						{
							record3dtext(((("" + entity.var_5a8f690) + "") + var_2f8d622d) + "", entity.origin, (1, 0.5, 0), "", entity);
						}
						else
						{
							print3d(org, ((("" + entity.var_5a8f690) + "") + var_2f8d622d) + "", (1, 0.5, 0), 1, 0.2);
						}
					}
					if(isdefined(entity.allowoffnavmesh))
					{
						org = entity.origin + vectorscale((0, 0, 1), 80);
						if(getdvarint(#"recorder_enablerec", 0))
						{
							record3dtext("" + entity.allowoffnavmesh, entity.origin, (1, 0.5, 0), "", entity);
						}
						else
						{
							print3d(org, "" + entity.allowoffnavmesh, (1, 0.5, 0), 1, 0.2);
						}
					}
					if(isdefined(entity.var_6e3313ab))
					{
						org = entity.origin + vectorscale((0, 0, 1), 75);
						if(getdvarint(#"recorder_enablerec", 0))
						{
							record3dtext("" + entity.var_6e3313ab, entity.origin, (1, 0.5, 0), "", entity);
						}
						else
						{
							print3d(org, "" + entity.var_6e3313ab, (1, 0.5, 0), 1, 0.2);
						}
					}
					if(isdefined(entity.var_ad26639d))
					{
						org = entity.origin + vectorscale((0, 0, 1), 70);
						if(getdvarint(#"recorder_enablerec", 0))
						{
							record3dtext("" + entity.var_ad26639d, entity.origin, (1, 0.5, 0), "", entity);
						}
						else
						{
							print3d(org, "" + entity.var_ad26639d, (1, 0.5, 0), 1, 0.2);
						}
					}
					if(isdefined(entity.var_9a79d89d))
					{
						origin = entity.var_9a79d89d;
						if(!isvec(entity.var_9a79d89d))
						{
							origin = entity.var_9a79d89d.origin;
						}
						if(getdvarint(#"recorder_enablerec", 0))
						{
							record3dtext("", entity.origin, (0, 0, 1), "", entity);
						}
						else
						{
							print3d(entity.var_9a79d89d + vectorscale((0, 0, 1), 10), "", (0, 0, 1), 1, 1);
						}
					}
					if(isdefined(entity.var_db912cfe) && isdefined(entity.surfacetype))
					{
						org = entity.origin + vectorscale((0, 0, 1), 70);
						if(getdvarint(#"recorder_enablerec", 0))
						{
							record3dtext((("" + entity.surfacetype) + "") + entity.var_db912cfe, entity.origin, (1, 0.5, 0), "", entity);
						}
						else
						{
							print3d(org, (("" + entity.surfacetype) + "") + entity.var_db912cfe, (1, 0.5, 0), 1, 0.2);
						}
					}
					if(isdefined(entity.var_1e9a96f7))
					{
						org = entity.origin + vectorscale((0, 0, 1), 200);
						if(getdvarint(#"recorder_enablerec", 0))
						{
							record3dtext(((("" + entity.var_1e9a96f7) + "") + entity.var_1e9a96f7) + "", entity.origin, (1, 0.5, 0), "", entity);
						}
						else
						{
							print3d(org, ((("" + entity.var_1e9a96f7) + "") + entity.var_1e9a96f7) + "", (1, 0.5, 0), 1, 2);
						}
					}
					if(isdefined(entity.movetime) && getdvarint(#"hash_1aebd3ffed21a22a", 0))
					{
						org = entity.origin + vectorscale((0, 0, 1), 90);
						if(getdvarint(#"recorder_enablerec", 0))
						{
							record3dtext("" + (gettime() - entity.movetime), entity.origin, (1, 0.5, 0), "", entity);
						}
						else
						{
							print3d(org, "" + (gettime() - entity.movetime), (1, 0.5, 0), 1, 0.2);
						}
					}
					if(isdefined(entity.idletime) && getdvarint(#"hash_1aebd3ffed21a22a", 0))
					{
						org = entity.origin + vectorscale((0, 0, 1), 95);
						if(getdvarint(#"recorder_enablerec", 0))
						{
							record3dtext("" + (gettime() - entity.idletime), entity.origin, (1, 0.5, 0), "", entity);
						}
						else
						{
							print3d(org, "" + (gettime() - entity.idletime), (1, 0.5, 0), 1, 0.2);
						}
					}
					if(isdefined(entity.attackable) && getdvarint(#"hash_6e5b3c35cb223a9d", 0))
					{
						recordline(entity.origin, entity.attackable_slot.origin, (0, 1, 0));
						recordstar(entity.attackable_slot.origin, (0, 0, 1));
						org = entity.origin + vectorscale((0, 0, 1), 100);
						if(getdvarint(#"recorder_enablerec", 0))
						{
							record3dtext("" + distance2dsquared(entity.origin, entity.attackable_slot.origin), entity.origin, (1, 0.5, 0), "", entity);
						}
						else
						{
							print3d(org, "" + distance2dsquared(entity.origin, entity.attackable_slot.origin), (1, 0.5, 0), 1, 0.2);
						}
					}
					if(isdefined(entity.var_6c408220))
					{
						entity [[entity.var_6c408220]]();
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_55625f76
	Namespace: namespace_85745671
	Checksum: 0xB1371482
	Offset: 0x1BE8
	Size: 0x12C
	Parameters: 3
	Flags: Linked
*/
function function_55625f76(origin, angles, anim_name)
{
	self endon(#"death");
	self ghost();
	self orientmode("face default");
	anim_length = getanimlength(anim_name);
	self animscripted("rise_anim", origin, angles, anim_name, "normal");
	util::wait_network_frame();
	self show();
	self waittilltimeout(anim_length, {#notetrack:"end"}, #"rise_anim");
	self setgoal(self.origin);
}

/*
	Name: function_2089690e
	Namespace: namespace_85745671
	Checksum: 0xFD68B90D
	Offset: 0x1D20
	Size: 0x19E
	Parameters: 0
	Flags: Linked
*/
function function_2089690e()
{
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"death");
	if(is_true(self.var_83fa6083))
	{
		return;
	}
	self show();
	var_90d0c0ff = (isdefined(self.var_c9b11cb3) ? self.var_c9b11cb3 : self.var_90d0c0ff);
	spawn_anim = (isdefined(self.var_d32d749d) ? self.var_d32d749d : self.spawn_anim);
	if(!isdefined(spawn_anim) && isdefined(var_90d0c0ff))
	{
		spawn_anim = self animmappingsearch(var_90d0c0ff);
	}
	self.var_90d0c0ff = var_90d0c0ff;
	self.var_1a02009e = spawn_anim;
	if(!isdefined(spawn_anim))
	{
		return;
	}
	if(isdefined(self.var_f8df968e))
	{
		[[self.var_f8df968e]](self.origin, self.angles, spawn_anim);
	}
	else
	{
		function_55625f76(self.origin, self.angles, spawn_anim);
	}
	self callback::callback(#"hash_790882ac8688cee5", {#spawn_anim:spawn_anim});
	/#
		self notify(#"hash_790882ac8688cee5");
	#/
}

/*
	Name: function_347f7d34
	Namespace: namespace_85745671
	Checksum: 0xACE4D148
	Offset: 0x1EC8
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function function_347f7d34()
{
	a_valid_players = [];
	foreach(player in getplayers())
	{
		if(is_player_valid(player))
		{
			if(!isdefined(a_valid_players))
			{
				a_valid_players = [];
			}
			else if(!isarray(a_valid_players))
			{
				a_valid_players = array(a_valid_players);
			}
			a_valid_players[a_valid_players.size] = player;
		}
	}
	return a_valid_players;
}

/*
	Name: is_player_valid
	Namespace: namespace_85745671
	Checksum: 0xEE4A3892
	Offset: 0x1FC8
	Size: 0x130
	Parameters: 1
	Flags: Linked
*/
function is_player_valid(player)
{
	if(!isdefined(player))
	{
		return false;
	}
	if(!isalive(player))
	{
		return false;
	}
	if(!isplayer(player) && !isdefined(player.is_companion))
	{
		return false;
	}
	if(isplayer(player))
	{
		if(player.sessionstate == "spectator")
		{
			return false;
		}
		if(player.sessionstate == "intermission")
		{
			return false;
		}
		if(is_true(player.intermission))
		{
			return false;
		}
		if(player laststand::player_is_in_laststand() && !is_true(player.var_b895a3ff))
		{
			return false;
		}
	}
	if(player.ignoreme || player isnotarget())
	{
		return false;
	}
	return true;
}

/*
	Name: function_1b9ed9b0
	Namespace: namespace_85745671
	Checksum: 0x66E68F22
	Offset: 0x2100
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function function_1b9ed9b0(companion)
{
	if(!isalive(companion))
	{
		return false;
	}
	if(!is_true(companion.is_companion))
	{
		return false;
	}
	if(companion.ignoreme || companion isnotarget())
	{
		return false;
	}
	return true;
}

/*
	Name: function_9fa1c215
	Namespace: namespace_85745671
	Checksum: 0x35D6964
	Offset: 0x2180
	Size: 0x2FC
	Parameters: 1
	Flags: Linked
*/
function function_9fa1c215(var_4dc5382f)
{
	if(isdefined(level.var_18bf5e98))
	{
		return [[level.var_18bf5e98]]();
	}
	itemlist = level.var_9eb9a467;
	var_1130690 = 0;
	if(is_true(level.var_b4143320))
	{
		var_d0c1e811 = 0;
		if(death_circle::is_active() && isdefined(level.var_52b56362))
		{
			if(level.var_52b56362 < level.var_1a35832e)
			{
				var_d0c1e811 = 1;
			}
		}
		else
		{
			var_d0c1e811 = 1;
		}
		if(var_d0c1e811 && isdefined(var_4dc5382f) && var_4dc5382f.var_c573acdd == var_4dc5382f.var_ce8df1c9)
		{
			if(level.var_d5cd88c2 < level.var_acfc1745 && randomfloat(1) <= 0.3)
			{
				itemlist = level.var_1b7acd6d;
				level.var_d5cd88c2++;
				var_1130690 = 1;
				level.var_57a77bb = 1;
			}
			if(!level.var_2510617f < level.var_1b2f5c9d && randomfloat(1) <= 0.3)
			{
				itemlist = level.var_72151997;
				level.var_2510617f++;
				var_1130690 = 1;
				level.var_57a77bb = 0;
			}
			if(!level.var_6eb6193a < level.var_ad2edeba && randomfloat(1) <= 0.3)
			{
				itemlist = level.var_14364e26;
				level.var_6eb6193a++;
				var_1130690 = 1;
				level.var_57a77bb = 0;
			}
			if(!level.var_7dff87f1 < level.var_a71296ac && randomfloat(1) <= 0.3)
			{
				itemlist = level.var_7d2bc89;
				level.var_7dff87f1++;
				var_1130690 = 1;
				level.var_57a77bb = 0;
			}
		}
	}
	if(!var_1130690)
	{
		if(randomint(100) <= 2)
		{
			if(!level.var_8a3036cc)
			{
				itemlist = level.var_db43cbd7;
				level.var_8a3036cc = 1;
			}
		}
	}
	if(isdefined(var_4dc5382f))
	{
		var_4dc5382f.var_c573acdd++;
	}
	return itemlist;
}

/*
	Name: function_f311bd4c
	Namespace: namespace_85745671
	Checksum: 0xD50B2EA7
	Offset: 0x2488
	Size: 0x3B4
	Parameters: 2
	Flags: None
*/
function function_f311bd4c(var_4dc5382f, var_ee6563f8)
{
	if(!isdefined(var_ee6563f8))
	{
		var_ee6563f8 = 1;
	}
	self notify("1d439ee27920c763");
	self endon("1d439ee27920c763");
	if(var_ee6563f8)
	{
		waitresult = undefined;
		waitresult = self waittill(#"death");
	}
	else
	{
		waitresult = spawnstruct();
		waitresult.attacker = function_a1ef346b()[0];
	}
	var_a98b31aa = isdefined(self.var_4dc5382f) && isdefined(self.var_4dc5382f.def);
	self.var_4dc5382f = undefined;
	if(isdefined(self.fxent))
	{
		self clientfield::set("zombie_has_microwave", 0);
		self.fxent delete();
	}
	if(isplayer(waitresult.attacker))
	{
		scoreevents::processscoreevent(#"zombie_kills", waitresult.attacker, undefined, undefined);
		var_b25650ab = spawnstruct();
		var_b25650ab.origin = self.origin;
		var_b25650ab.archetype = self.archetype;
		if(isdefined(self.var_e575a1bb))
		{
			var_b25650ab.var_e575a1bb = self.var_e575a1bb;
		}
		if(isdefined(self.var_40c895b9))
		{
			var_b25650ab.var_40c895b9 = self.var_40c895b9;
		}
		if(isdefined(self.var_e154425f))
		{
			var_b25650ab.var_e154425f = self.var_e154425f;
		}
		if(isdefined(self.var_4f53e075))
		{
			var_b25650ab.var_4f53e075 = self.var_4f53e075;
		}
		if(isdefined(var_a98b31aa) || is_true(self.var_54f8158e))
		{
			if(!level.inprematchperiod)
			{
				waitresult.attacker stats::function_d40764f3(#"hash_5e146097143ab761", 1);
			}
			if(isdefined(self.var_2cee3556))
			{
				var_b25650ab.var_2cee3556 = self.var_2cee3556;
				foreach(var_c46cdc46 in var_b25650ab.var_2cee3556)
				{
					var_b25650ab.var_6a7537d8 = var_c46cdc46;
					var_b25650ab namespace_7da6f8ca::function_d92e3c5a(waitresult.attacker, var_4dc5382f, item_list);
				}
			}
			else
			{
				if(isdefined(self.var_ef46cd4))
				{
					self namespace_7da6f8ca::function_d92e3c5a(waitresult.attacker, var_4dc5382f, self.var_ef46cd4);
				}
				else
				{
					itemlist = function_9fa1c215(var_4dc5382f);
					if(isdefined(itemlist))
					{
						self namespace_7da6f8ca::function_d92e3c5a(waitresult.attacker, var_4dc5382f, itemlist);
					}
				}
			}
		}
	}
}

/*
	Name: function_9758722
	Namespace: namespace_85745671
	Checksum: 0x6DBA3310
	Offset: 0x2848
	Size: 0x128
	Parameters: 1
	Flags: Linked
*/
function function_9758722(speed)
{
	if(self.zombie_move_speed === speed)
	{
		return;
	}
	self.zombie_move_speed = speed;
	if(!isdefined(self.zombie_arms_position))
	{
		self.zombie_arms_position = (math::cointoss() == 1 ? "up" : "down");
	}
	if(isdefined(level.var_9ee73630))
	{
		self.variant_type = randomint(level.var_9ee73630[self.zombie_move_speed][self.zombie_arms_position]);
	}
	if(isdefined(self.zombie_move_speed_override))
	{
		var_4d3692b7 = zombie_utility::function_33da7a07();
		new_move_speed = self.zombie_move_speed_override;
		new_move_speed = self zombie_utility::function_d2f660ce(new_move_speed);
		self.zombie_move_speed = new_move_speed;
		self.zombie_move_speed_restore = var_4d3692b7;
		return;
	}
}

/*
	Name: function_35eac38d
	Namespace: namespace_85745671
	Checksum: 0x4F9F3EB5
	Offset: 0x2978
	Size: 0x14C
	Parameters: 1
	Flags: None
*/
function function_35eac38d(pathnode)
{
	path_struct = {#loops:0, #path:array(pathnode)};
	var_592eaf7 = pathnode;
	while(isdefined(var_592eaf7.target))
	{
		var_592eaf7 = getnode(var_592eaf7.target, "targetname");
		if(!isdefined(var_592eaf7))
		{
			break;
		}
		if(isinarray(path_struct.path, var_592eaf7))
		{
			path_struct.loops = 1;
			break;
		}
		if(!isdefined(path_struct.path))
		{
			path_struct.path = [];
		}
		else if(!isarray(path_struct.path))
		{
			path_struct.path = array(path_struct.path);
		}
		path_struct.path[path_struct.path.size] = var_592eaf7;
	}
	return path_struct;
}

/*
	Name: function_9a5f0c0
	Namespace: namespace_85745671
	Checksum: 0x4E6679A6
	Offset: 0x2AD0
	Size: 0xAE
	Parameters: 2
	Flags: Linked
*/
function function_9a5f0c0(startpt, endpt)
{
	self endon(#"delete");
	self.origin = startpt + vectorscale((0, 0, 1), 10);
	time = self namespace_7da6f8ca::fake_physicslaunch(endpt, 100);
	self playsound(#"hash_52de50e5184d1c7");
	wait(time);
	if(isdefined(self))
	{
		self.origin = endpt;
	}
}

/*
	Name: function_bf357ddf
	Namespace: namespace_85745671
	Checksum: 0x1B39C89F
	Offset: 0x2B88
	Size: 0x102
	Parameters: 2
	Flags: None
*/
function function_bf357ddf(spawnpt, itemlist)
{
	waitresult = undefined;
	waitresult = self waittill(#"death");
	if(isdefined(spawnpt.target))
	{
		var_10508147 = struct::get(spawnpt.target, "targetname");
		items = self namespace_65181344::function_fd87c780(itemlist, 1);
		for(i = 0; i < items.size; i++)
		{
			item = items[i];
			if(isdefined(item))
			{
				item thread function_9a5f0c0(self.origin, var_10508147.origin);
			}
			waitframe(1);
		}
	}
}

/*
	Name: function_f656f22e
	Namespace: namespace_85745671
	Checksum: 0x1C7F0C9C
	Offset: 0x2C98
	Size: 0x106
	Parameters: 1
	Flags: None
*/
function function_f656f22e(var_4dc5382f)
{
	all_ai = getaiteamarray(#"world");
	if(isdefined(all_ai) && all_ai.size > 0)
	{
		foreach(ai in all_ai)
		{
			if(isdefined(ai.var_ea7e9b57) && ai.var_ea7e9b57 == var_4dc5382f)
			{
				ai kill(undefined, undefined, undefined, undefined, 0, 1);
				waitframe(1);
			}
		}
	}
}

/*
	Name: function_ebf83b77
	Namespace: namespace_85745671
	Checksum: 0xBB2E43ED
	Offset: 0x2DA8
	Size: 0x206
	Parameters: 6
	Flags: Linked, Private
*/
function private function_ebf83b77(origin, entity, var_c83b605b, min_range, max_range, attackable)
{
	var_c7089ecd = origin - attackable.origin;
	var_7e365edf = randomfloatrange(min_range, max_range);
	var_c7089ecd = vectornormalize(var_c7089ecd);
	var_b042e906 = var_c7089ecd * var_7e365edf;
	var_72e946f3 = getclosestpointonnavmesh(var_c83b605b + ((var_c7089ecd * entity getpathfindingradius()) * 1.1), 128, entity getpathfindingradius());
	if(!isdefined(var_72e946f3))
	{
		return undefined;
	}
	goal_point = checknavmeshdirection(var_72e946f3, var_b042e906, var_7e365edf - (entity getpathfindingradius() * 1.2), entity getpathfindingradius() * 1.1);
	/#
		recordline(var_c83b605b, var_c83b605b + var_b042e906, (0, 0, 1), "");
		recordline(var_c83b605b, goal_point, (1, 0.5, 0), "");
	#/
	if(distancesquared(goal_point, var_72e946f3) < sqr(min_range))
	{
		return undefined;
	}
	if(!function_57816a50(goal_point, entity, attackable))
	{
		return undefined;
	}
	return goal_point;
}

/*
	Name: function_57816a50
	Namespace: namespace_85745671
	Checksum: 0x802E88FF
	Offset: 0x2FB8
	Size: 0x15C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_57816a50(point, entity, attackable)
{
	var_c76dd642 = entity getpathfindingradius();
	if(isdefined(attackable) && (isdefined(attackable.var_b79a8ac7) && isdefined(attackable.var_b79a8ac7.var_3a3788af)))
	{
		foreach(attacker in attackable.var_b79a8ac7.var_3a3788af)
		{
			if(!isdefined(attacker.var_3f8ea75c))
			{
				continue;
			}
			var_d0fcbffe = attacker getpathfindingradius();
			if(distancesquared(point, attacker.var_3f8ea75c) <= (sqr(var_d0fcbffe + var_c76dd642)))
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_12d90bae
	Namespace: namespace_85745671
	Checksum: 0xDDCC0B74
	Offset: 0x3120
	Size: 0x14A
	Parameters: 4
	Flags: Linked
*/
function function_12d90bae(entity, min_range, max_range, attackable)
{
	var_c83b605b = getclosestpointonnavmesh(attackable.origin, 128, entity getpathfindingradius());
	if(!isdefined(var_c83b605b))
	{
		return undefined;
	}
	spots = arraysortclosest(attackable.var_b79a8ac7.slots, entity.origin);
	foreach(spot in spots)
	{
		goal_point = function_ebf83b77(spot.origin, entity, var_c83b605b, min_range, max_range, attackable);
		if(isdefined(goal_point))
		{
			return goal_point;
		}
	}
	return undefined;
}

/*
	Name: get_attackable
	Namespace: namespace_85745671
	Checksum: 0x609B455A
	Offset: 0x3278
	Size: 0x254
	Parameters: 3
	Flags: Linked
*/
function get_attackable(entity, var_83917763, var_bb6705b)
{
	if(isdefined(level.attackables) && level.attackables.size > 0)
	{
		if(!is_true(var_83917763) && !isinarray(level.var_8de0b84e, entity getentitynumber()))
		{
			return undefined;
		}
		arrayremovevalue(level.attackables, undefined);
		foreach(attackable in level.attackables)
		{
			if(is_true(entity.var_12af7864))
			{
				return undefined;
			}
			if(!isdefined(attackable.var_b79a8ac7) || !isdefined(attackable.var_b79a8ac7.var_f019ea1a))
			{
				continue;
			}
			dist = distancesquared(entity.origin, attackable.origin);
			if(dist < sqr(attackable.var_b79a8ac7.var_f019ea1a))
			{
				if(attackable get_attackable_slot(entity))
				{
					return attackable;
				}
				if(is_true(var_bb6705b))
				{
					if(!isdefined(attackable.var_b79a8ac7.var_3a3788af))
					{
						attackable.var_b79a8ac7.var_3a3788af = [];
					}
					attackable.var_b79a8ac7.var_3a3788af[attackable.var_b79a8ac7.var_3a3788af.size] = entity;
					return attackable;
				}
			}
		}
	}
	return undefined;
}

/*
	Name: get_attackable_slot
	Namespace: namespace_85745671
	Checksum: 0x944AE05
	Offset: 0x34D8
	Size: 0x23E
	Parameters: 1
	Flags: Linked
*/
function get_attackable_slot(entity)
{
	if(!isdefined(self.var_b79a8ac7))
	{
		return false;
	}
	self clear_slots();
	var_4dbfc246 = [];
	var_34bcb139 = [];
	foreach(slot in self.var_b79a8ac7.slots)
	{
		if(isdefined(slot) && !isdefined(slot.entity))
		{
			var_34bcb139[var_34bcb139.size] = slot;
		}
	}
	if(var_34bcb139.size == 0)
	{
		return false;
	}
	var_754df93c = entity.origin;
	var_b2c0d134 = arraygetclosest(var_754df93c, var_34bcb139);
	if(is_true(var_b2c0d134.var_bb075e37))
	{
		var_acdc8d71 = getclosestpointonnavmesh(var_b2c0d134.origin, entity getpathfindingradius(), entity getpathfindingradius());
		if(isdefined(var_acdc8d71))
		{
			var_b2c0d134.entity = entity;
			entity.var_b238ef38 = {#position:var_acdc8d71, #slot:var_b2c0d134};
			return true;
		}
	}
	else if(isdefined(var_b2c0d134))
	{
		var_b2c0d134.entity = entity;
		entity.var_b238ef38 = {#position:var_b2c0d134.origin, #slot:var_b2c0d134};
		return true;
	}
	return false;
}

/*
	Name: clear_slots
	Namespace: namespace_85745671
	Checksum: 0x300AD898
	Offset: 0x3720
	Size: 0xEE
	Parameters: 0
	Flags: Linked
*/
function clear_slots()
{
	if(!isdefined(self.var_b79a8ac7))
	{
		return;
	}
	foreach(slot in self.var_b79a8ac7.slots)
	{
		if(!isalive(slot.entity))
		{
			slot.entity = undefined;
			continue;
		}
		if(is_true(slot.entity.missinglegs))
		{
			slot.entity = undefined;
		}
	}
}

/*
	Name: function_2b925fa5
	Namespace: namespace_85745671
	Checksum: 0x1F2D4608
	Offset: 0x3818
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function function_2b925fa5(entity)
{
	if(isdefined(entity.attackable))
	{
		entity.attackable = undefined;
	}
	if(isdefined(entity.var_b238ef38))
	{
		entity.var_b238ef38.slot.entity = undefined;
		entity.var_b238ef38 = undefined;
	}
	entity.var_3f8ea75c = undefined;
	entity notify(#"hash_5114eb062d7568b6");
}

/*
	Name: function_b70e2a37
	Namespace: namespace_85745671
	Checksum: 0x9373172E
	Offset: 0x3898
	Size: 0x1B4
	Parameters: 1
	Flags: Linked
*/
function function_b70e2a37(attackable)
{
	if(!isdefined(attackable.var_b79a8ac7))
	{
		return;
	}
	foreach(slot in attackable.var_b79a8ac7.slots)
	{
		if(!isalive(slot.entity))
		{
			continue;
		}
		function_2b925fa5(slot.entity);
	}
	if(isdefined(attackable.var_b79a8ac7.var_3a3788af))
	{
		foreach(attacker in attackable.var_b79a8ac7.var_3a3788af)
		{
			if(!isalive(attacker))
			{
				continue;
			}
			function_2b925fa5(attacker);
		}
	}
	attackable.var_b79a8ac7 = undefined;
	arrayremovevalue(level.attackables, attackable);
}

/*
	Name: function_bdb2b85b
	Namespace: namespace_85745671
	Checksum: 0xD79D0A6C
	Offset: 0x3A58
	Size: 0x39E
	Parameters: 6
	Flags: Linked
*/
function function_bdb2b85b(entity, origin, angles, radius, num_spots, var_7a2632b5)
{
	level endon(#"game_ended");
	slots = [];
	mins = vectorscale((-1, -1, 0), 10);
	maxs = (10, 10, 48);
	/#
		record3dtext("", origin, (0, 0, 1));
	#/
	for(i = 0; i < num_spots; i++)
	{
		t = mapfloat(0, num_spots, 0, 360, i);
		x = radius * (cos(t + angles[1]));
		y = radius * (sin(t + angles[1]));
		pos = (x, y, 0) + origin;
		if(!bullettracepassed(origin + vectorscale((0, 0, 1), 5), pos + vectorscale((0, 0, 1), 5), 0, entity))
		{
			if((i % 2) == 1)
			{
				waitframe(1);
			}
			continue;
		}
		var_e07c7e8 = physicstrace(pos + vectorscale((0, 0, 1), 10), pos + (vectorscale((0, 0, -1), 10)), mins, maxs, self, 1);
		var_c060661b = var_e07c7e8[#"position"];
		var_3e98a413 = getclosestpointonnavmesh(var_c060661b, 64, 20);
		if(isdefined(var_3e98a413))
		{
			/#
				recordstar(var_3e98a413, (0, 1, 0));
			#/
			slots[slots.size] = {#hash_bb075e37:1, #origin:var_3e98a413};
		}
		else if(isdefined(var_c060661b))
		{
			if(isdefined(var_7a2632b5))
			{
				var_acdc8d71 = getclosestpointonnavmesh(var_c060661b, var_7a2632b5, 15);
			}
			/#
				if(isdefined(var_acdc8d71))
				{
					recordstar(var_acdc8d71, (1, 0, 1));
				}
			#/
			/#
				recordstar(var_c060661b, (1, 0.5, 0));
			#/
			slots[slots.size] = {#hash_acdc8d71:var_acdc8d71, #hash_bb075e37:0, #origin:var_c060661b};
		}
		if((i % 2) == 1)
		{
			waitframe(1);
		}
	}
	return slots;
}

/*
	Name: function_16e2f075
	Namespace: namespace_85745671
	Checksum: 0xCF4949CE
	Offset: 0x3E00
	Size: 0x2C4
	Parameters: 1
	Flags: Linked
*/
function function_16e2f075(params)
{
	self.var_cd7665dd = gettime();
	if(isdefined(self.var_1b5e8136) && (gettime() - self.var_1b5e8136) > 1000)
	{
		return;
	}
	if(!is_true(self.var_85c3882d))
	{
		self.var_1b5e8136 = gettime();
	}
	self.var_85c3882d = 1;
	if(!is_true(self.var_a9d9d11b) || self.var_a9d9d11b < gettime())
	{
		self.var_a9d9d11b = gettime() + 500;
		if(is_true(level.is_survival))
		{
			switch(self.archetype)
			{
				case "zombie":
				{
					damageamount = randomintrange(20, 60);
					self thread namespace_df7b10e3::slowdown(#"hash_4ec13a63f7786c40");
					break;
				}
				case "zombie_dog":
				{
					damageamount = self.health;
					break;
				}
				case "avogadro":
				{
					damageamount = 5;
					break;
				}
			}
			if(!isdefined(damageamount))
			{
				damageamount = int(self.health * 0.1);
			}
		}
		else
		{
			damageamount = (isdefined(level.var_87226c31.bundle.var_a9502662) ? level.var_87226c31.bundle.var_a9502662 : 0);
		}
		self dodamage(damageamount, self.origin, params.wire.owner, params.wire, undefined, "MOD_IMPACT", 0, level.var_87226c31.var_3e7344ee);
	}
	if(isdefined(level.var_f2e76de4))
	{
		if(!isinarray(level.var_f2e76de4, self))
		{
			level.var_f2e76de4[level.var_f2e76de4.size] = self;
		}
	}
	else
	{
		level.var_f2e76de4 = array(self);
		level thread function_7a87d2a7();
	}
}

/*
	Name: function_7a87d2a7
	Namespace: namespace_85745671
	Checksum: 0xA56085E6
	Offset: 0x40D0
	Size: 0x1FA
	Parameters: 1
	Flags: Linked
*/
function function_7a87d2a7(var_a9ffa6ec)
{
	level endon(#"game_ended");
	self endon(#"death");
	while(true)
	{
		var_202d087b = [];
		foreach(ai in level.var_f2e76de4)
		{
			if(!isdefined(ai) || !isalive(ai))
			{
				var_202d087b[var_202d087b.size] = ai;
				continue;
			}
			var_3a8a4c13 = gettime() - ai.var_1b5e8136;
			if(var_3a8a4c13 > 1000)
			{
				ai.var_85c3882d = undefined;
			}
			timesincelast = gettime() - ai.var_cd7665dd;
			if(timesincelast > 250)
			{
				ai.var_85c3882d = undefined;
				ai.var_1b5e8136 = undefined;
				var_202d087b[var_202d087b.size] = ai;
			}
		}
		foreach(ai in var_202d087b)
		{
			arrayremovevalue(level.var_f2e76de4, ai);
		}
		waitframe(1);
	}
}

/*
	Name: function_b7dc3ab4
	Namespace: namespace_85745671
	Checksum: 0x1267C2C3
	Offset: 0x42D8
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_b7dc3ab4(var_45e5ae09)
{
	if(!getdvarint(#"hash_57db5678926e0c9c", 1))
	{
		return;
	}
	level thread function_301d4089(var_45e5ae09);
}

/*
	Name: function_301d4089
	Namespace: namespace_85745671
	Checksum: 0x669BDF5B
	Offset: 0x4338
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_301d4089(var_45e5ae09)
{
	level function_b0dc6ff2(var_45e5ae09);
	if((isdefined(getgametypesetting(#"hash_2d40f1434ed94a2b")) ? getgametypesetting(#"hash_2d40f1434ed94a2b") : 0))
	{
		level function_71578099();
	}
	else
	{
		level function_9caf8627();
	}
}

/*
	Name: function_d65d6079
	Namespace: namespace_85745671
	Checksum: 0xC85BFB59
	Offset: 0x43E8
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_d65d6079(targetname)
{
	if(!isdefined(targetname))
	{
		return undefined;
	}
	var_99b5fc08 = function_c79d31c4(targetname);
	if(isdefined(var_99b5fc08) && var_99b5fc08.size > 0)
	{
		return var_99b5fc08[0];
	}
	return getent(targetname, "target");
}

/*
	Name: function_5a4a952a
	Namespace: namespace_85745671
	Checksum: 0x2EA44905
	Offset: 0x4468
	Size: 0x296
	Parameters: 1
	Flags: Linked
*/
function function_5a4a952a(node)
{
	if(node.type === #"begin" || node.type === #"end")
	{
		return getothernodeinnegotiationpair(node);
	}
	if(node.type === #"volume")
	{
		var_41c9f1a0 = undefined;
		backwards = 0;
		if(isdefined(node.target))
		{
			var_41c9f1a0 = getnodearray(node.target, "targetname");
		}
		if(!isdefined(var_41c9f1a0) && isdefined(node.targetname))
		{
			backwards = 1;
			var_41c9f1a0 = getnodearray(node.targetname, "target");
		}
		if(isdefined(var_41c9f1a0) && var_41c9f1a0.size == 1)
		{
			foreach(var_41235e94 in var_41c9f1a0)
			{
				if(var_41235e94.type === #"volume")
				{
					return var_41235e94;
				}
				if(var_41235e94.type === #"mantle")
				{
					if(backwards && isdefined(var_41235e94.targetname))
					{
						nodearray = getnodearray(var_41235e94.targetname, "target");
						if(isdefined(nodearray) && nodearray.size == 1)
						{
							return nodearray[0];
						}
						continue;
					}
					if(isdefined(var_41235e94.target))
					{
						nodearray = getnodearray(var_41235e94.target, "targetname");
						if(isdefined(nodearray) && nodearray.size == 1)
						{
							return nodearray[0];
						}
					}
				}
			}
		}
	}
	return undefined;
}

/*
	Name: function_7085a000
	Namespace: namespace_85745671
	Checksum: 0x2283B3EE
	Offset: 0x4708
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function function_7085a000(node)
{
	var_59476739 = function_d65d6079(node.targetname);
	if(!isdefined(var_59476739))
	{
		var_41235e94 = function_5a4a952a(node);
		if(isdefined(var_41235e94))
		{
			var_59476739 = function_d65d6079(var_41235e94.targetname);
		}
	}
	if(!getdvarint(#"hash_397bf855bf5ab4de", 1) && isdefined(var_59476739) && (var_59476739.var_15d44120 === #"p8_fxanim_wz_rollup_door_medium_mod" || var_59476739.var_15d44120 === #"hash_30cb30fe79cd7bc0" || var_59476739.var_15d44120 === #"hash_3cccdd3bf12018bc" || var_59476739.var_15d44120 === #"hash_7edcc0480c4f0164"))
	{
		function_dc0a8e61(node, 1);
		return undefined;
	}
	return var_59476739;
}

/*
	Name: function_b0dc6ff2
	Namespace: namespace_85745671
	Checksum: 0x775D0FA2
	Offset: 0x4868
	Size: 0x2E4
	Parameters: 1
	Flags: Linked
*/
function function_b0dc6ff2(var_45e5ae09)
{
	nodes = getallnodes();
	var_4c106ee3 = 0;
	var_8d594927 = undefined;
	if(isarray(var_45e5ae09) && var_45e5ae09.size > 0)
	{
		var_8d594927 = util::spawn_model("tag_origin");
	}
	var_fa527c6d = 0;
	foreach(node in nodes)
	{
		var_4c106ee3 = (var_4c106ee3 + 1) % 50;
		if(!var_4c106ee3 % 50)
		{
			waitframe(1);
		}
		if(node.type != #"begin" && node.type != #"end" && node.type != #"volume")
		{
			continue;
		}
		var_59476739 = function_7085a000(node);
		if(!isdefined(var_59476739))
		{
			continue;
		}
		if(isdefined(var_8d594927))
		{
			var_8d594927.origin = var_59476739.origin;
			is_touching = 0;
			foreach(ent in var_45e5ae09)
			{
				if(var_8d594927 istouching(ent))
				{
					is_touching = 1;
					var_fa527c6d++;
					break;
				}
			}
			if(!is_touching)
			{
				continue;
			}
		}
		function_1ede0cd3(node, var_59476739, 1);
	}
	/#
		println("" + var_fa527c6d);
	#/
	if(isdefined(var_8d594927))
	{
		var_8d594927 delete();
	}
}

/*
	Name: function_71578099
	Namespace: namespace_85745671
	Checksum: 0x6DF40653
	Offset: 0x4B58
	Size: 0x1CE
	Parameters: 0
	Flags: Linked
*/
function function_71578099()
{
	nodes = getallnodes();
	foreach(node in nodes)
	{
		if(node.type != #"begin")
		{
			if(node.type === #"end" && getdvarint(#"hash_397bf855bf5ab4de", 1) && !isentity(node.traversal_blocker))
			{
				function_dc0a8e61(node, 1);
			}
			continue;
		}
		if(isdefined(node.traversal_blocker))
		{
			linktraversal(node);
			if(getdvarint(#"hash_397bf855bf5ab4de", 1) && !isentity(node.traversal_blocker))
			{
				function_dc0a8e61(node, 1);
			}
			node.traversal_blocker.var_993e9bb0 = 1;
		}
	}
}

/*
	Name: function_9caf8627
	Namespace: namespace_85745671
	Checksum: 0xB47A7E94
	Offset: 0x4D30
	Size: 0x106
	Parameters: 0
	Flags: Linked
*/
function function_9caf8627()
{
	nodes = getallnodes();
	foreach(node in nodes)
	{
		if(node.type != #"begin" && node.type != #"end")
		{
			continue;
		}
		if(isdefined(node.traversal_blocker))
		{
			function_dc0a8e61(node, 1);
			node.traversal_blocker.var_993e9bb0 = 1;
		}
	}
}

/*
	Name: function_1ede0cd3
	Namespace: namespace_85745671
	Checksum: 0xD78ED892
	Offset: 0x4E40
	Size: 0x23C
	Parameters: 3
	Flags: Linked
*/
function function_1ede0cd3(var_521b1043, var_59476739, var_be10591b)
{
	if(!isdefined(var_521b1043))
	{
		return;
	}
	var_e86e150a = undefined;
	if(ispathnode(var_521b1043))
	{
		var_e86e150a = var_521b1043;
	}
	else
	{
		var_e86e150a = getnode(var_521b1043, "targetname");
	}
	if(!isdefined(var_e86e150a) || !isdefined(var_59476739))
	{
		return;
	}
	var_76648d30 = array(var_e86e150a);
	var_c88f4455 = function_5a4a952a(var_e86e150a);
	if(isdefined(var_c88f4455))
	{
		var_76648d30[var_76648d30.size] = var_c88f4455;
	}
	foreach(node in var_76648d30)
	{
		node.traversal_blocker = var_59476739;
		if(!isdefined(node.var_74785dff))
		{
			node.var_74785dff = node.var_a4409af1;
		}
		node.var_3e7103ff = (isdefined(var_be10591b) ? var_be10591b : 1);
	}
	if(isdefined(var_59476739.var_993e9bb0))
	{
		if(var_59476739.var_939413d0 === 1)
		{
			var_59476739 function_aa894590();
		}
		return;
	}
	var_59476739.var_993e9bb0 = 1;
	var_59476739.var_fa527c6d = var_76648d30;
	if(isentity(var_59476739))
	{
		var_59476739 callback::on_death(&function_af978c79);
	}
	var_59476739 function_aa894590();
}

/*
	Name: function_af978c79
	Namespace: namespace_85745671
	Checksum: 0x4FCC4EAB
	Offset: 0x5088
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_af978c79(params)
{
	if(!isdefined(self.var_fa527c6d))
	{
		return;
	}
	function_a63a9610(params);
	self.var_fa527c6d = undefined;
}

/*
	Name: function_a63a9610
	Namespace: namespace_85745671
	Checksum: 0x2DA321FF
	Offset: 0x50C8
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function function_a63a9610(params)
{
	if(!isdefined(self.var_fa527c6d))
	{
		return;
	}
	self.var_939413d0 = undefined;
	foreach(node in self.var_fa527c6d)
	{
		if(!isdefined(node.var_74785dff))
		{
			continue;
		}
		node.var_a4409af1 = node.var_74785dff;
	}
}

/*
	Name: function_aa894590
	Namespace: namespace_85745671
	Checksum: 0x1C3AEA4
	Offset: 0x5188
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function function_aa894590(params)
{
	if(!isdefined(self.var_fa527c6d))
	{
		return;
	}
	self.var_939413d0 = 1;
	foreach(node in self.var_fa527c6d)
	{
		if(!isdefined(node) || !isdefined(node.var_3e7103ff))
		{
			continue;
		}
		node.var_a4409af1 = node.var_3e7103ff;
	}
}

/*
	Name: is_blocker_valid
	Namespace: namespace_85745671
	Checksum: 0x1CEA5F76
	Offset: 0x5260
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function is_blocker_valid(blocker)
{
	return isdefined(blocker) && (isdefined(blocker.var_fa527c6d) && isdefined(blocker.var_939413d0)) && blocker.var_939413d0 === 1;
}

/*
	Name: function_142c3c86
	Namespace: namespace_85745671
	Checksum: 0x8FC5EF98
	Offset: 0x52B0
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function function_142c3c86(entity)
{
	if(is_true(entity.usingvehicle))
	{
		vehicle = entity getvehicleoccupied();
		if(function_44a83b40(vehicle))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_3981d015
	Namespace: namespace_85745671
	Checksum: 0x15A6B91D
	Offset: 0x5320
	Size: 0x374
	Parameters: 1
	Flags: Event
*/
event function_3981d015(eventstruct)
{
	if(isdefined(eventstruct.ent.target) && eventstruct.ent.target != "")
	{
		traversal_start_node = getnode(eventstruct.ent.target, "targetname");
		if(isdefined(traversal_start_node))
		{
			var_c88f4455 = getothernodeinnegotiationpair(traversal_start_node);
			if(eventstruct.state == 0)
			{
				if((isdefined(getgametypesetting(#"hash_2d40f1434ed94a2b")) ? getgametypesetting(#"hash_2d40f1434ed94a2b") : 0) && isdefined(traversal_start_node.traversal_blocker))
				{
					function_dc0a8e61(traversal_start_node, getdvarint(#"hash_397bf855bf5ab4de", 1));
					if(isdefined(var_c88f4455))
					{
						function_dc0a8e61(var_c88f4455, getdvarint(#"hash_397bf855bf5ab4de", 1));
					}
					if(isdefined(traversal_start_node.var_4dc5382f))
					{
						if(is_true(traversal_start_node.var_4dc5382f.var_6411ebfb))
						{
							linktraversal(traversal_start_node);
						}
						else
						{
							unlinktraversal(traversal_start_node);
						}
					}
					eventstruct.ent function_aa894590();
				}
				else
				{
					unlinktraversal(traversal_start_node);
				}
			}
			else
			{
				if((isdefined(getgametypesetting(#"hash_2d40f1434ed94a2b")) ? getgametypesetting(#"hash_2d40f1434ed94a2b") : 0))
				{
					if(eventstruct.ent.health > 0)
					{
						forward = anglestoforward(eventstruct.ent.angles);
						if(eventstruct.state == 2)
						{
							forward = forward * -1;
						}
						function_d9a69cf2(eventstruct.ent.origin, forward);
					}
					function_dc0a8e61(traversal_start_node, 1);
					if(isdefined(var_c88f4455))
					{
						function_dc0a8e61(var_c88f4455, 1);
					}
					eventstruct.ent function_a63a9610();
					linktraversal(traversal_start_node);
				}
				else
				{
					linktraversal(traversal_start_node);
				}
			}
		}
	}
}

/*
	Name: function_d9a69cf2
	Namespace: namespace_85745671
	Checksum: 0xE4CCB16B
	Offset: 0x56A0
	Size: 0x12E
	Parameters: 2
	Flags: Linked
*/
function function_d9a69cf2(origin, forward)
{
	var_8e1582ca = getentitiesinradius(origin, 50, 15);
	foreach(ent in var_8e1582ca)
	{
		if(!isdefined(forward) || (vectordot(origin - ent.origin, forward)) < 0)
		{
			var_43b3242 = 0;
			if(isdefined(ent.var_834b0770))
			{
				var_43b3242 = 1;
			}
			ent zombie_utility::setup_zombie_knockdown(origin, var_43b3242);
			ent.knockdown_type = "knockdown_shoved";
		}
	}
}

/*
	Name: function_44a83b40
	Namespace: namespace_85745671
	Checksum: 0xFF4A47AE
	Offset: 0x57D8
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_44a83b40(vehicle)
{
	return isdefined(vehicle) && vehicle.scriptvehicletype !== "recon_wz" && vehicle.scriptvehicletype !== "dart_wz" && vehicle.scriptvehicletype !== "hawk" && vehicle.scriptvehicletype !== "player_tank";
}

/*
	Name: function_ab8b93d1
	Namespace: namespace_85745671
	Checksum: 0xBF0026FF
	Offset: 0x5858
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function function_ab8b93d1(vehicle)
{
	return vehicle.targetname === "exfil_heli" || vehicle.vehicleclass === "helicopter";
}

/*
	Name: function_7243fef2
	Namespace: namespace_85745671
	Checksum: 0xA0D0147D
	Offset: 0x58A0
	Size: 0x58
	Parameters: 1
	Flags: None
*/
function function_7243fef2(vehicle)
{
	var_562ae86f = 30;
	return (abs(vehicle.origin[2] - getwaterheight(vehicle.origin))) < var_562ae86f;
}

/*
	Name: function_401070dd
	Namespace: namespace_85745671
	Checksum: 0x2717A96F
	Offset: 0x5900
	Size: 0x4E6
	Parameters: 2
	Flags: Linked
*/
function function_401070dd(vehicle, enemy)
{
	if(!isdefined(enemy))
	{
		enemy = self.favoriteenemy;
	}
	/#
		/#
			assert(isplayer(enemy) && enemy isinvehicle(), "");
		#/
	#/
	if(!isdefined(vehicle))
	{
		vehicle = enemy getvehicleoccupied();
	}
	if(!isdefined(vehicle))
	{
		return undefined;
	}
	function_13d991c7(vehicle);
	if(!isdefined(vehicle.attack_spots) || vehicle.attack_spots.size == 0)
	{
		return vehicle.origin;
	}
	var_65374bf9 = distance2dsquared(vehicle.origin, self.origin);
	if(abs(vehicle getspeed()) > 100)
	{
		vehicle.attack_spots = undefined;
		return vehicle.origin;
	}
	if(var_65374bf9 > sqr(300))
	{
		var_af76c64c = arraygetclosest(self.origin, vehicle.attack_spots);
		return var_af76c64c.origin;
	}
	var_e7f6ebff = undefined;
	for(var_656ca683 = 0; var_656ca683 < 4; var_656ca683++)
	{
		var_a10e63f5 = &vehicle.var_30206623[var_656ca683];
		if(isinarray(var_a10e63f5, self))
		{
			var_e7f6ebff = var_656ca683;
			break;
		}
	}
	if(!isdefined(var_e7f6ebff))
	{
		var_a8b5fe0b = arraysortclosest(vehicle.var_cef3270f, self.origin);
		foreach(var_fea19523 in var_a8b5fe0b)
		{
			if(vehicle.var_30206623[var_fea19523.side].size < 2)
			{
				array::add(vehicle.var_30206623[var_fea19523.side], self);
				return var_fea19523.origin;
			}
		}
		var_847cb128 = arraysortclosest(vehicle.attack_spots, self.origin);
		foreach(spot in var_847cb128)
		{
			if(vehicle.var_30206623[spot.side].size < 3)
			{
				array::add(vehicle.var_30206623[spot.side], self);
				return spot.origin;
			}
		}
		array::add(vehicle.var_30206623[var_847cb128[0].side], self);
		return var_847cb128[0].origin;
	}
	var_8909d642 = vehicle.var_d9381ace[var_e7f6ebff];
	if(vehicle.var_30206623[var_e7f6ebff].size < 2)
	{
		var_5cdd8f0a = arrayintersect(vehicle.var_d9381ace[var_e7f6ebff], vehicle.var_cef3270f);
		if(var_5cdd8f0a.size > 0)
		{
			var_8909d642 = var_5cdd8f0a;
		}
	}
	var_d14dd1fa = arraygetclosest(self.origin, var_8909d642);
	return var_d14dd1fa.origin;
}

/*
	Name: function_13d991c7
	Namespace: namespace_85745671
	Checksum: 0x255ADED7
	Offset: 0x5E00
	Size: 0x7F8
	Parameters: 1
	Flags: Linked
*/
function function_13d991c7(vehicle)
{
	if(abs(vehicle getspeed()) > 100)
	{
		vehicle.var_30206623 = [3:[], 2:[], 1:[], 0:[]];
		return;
	}
	if(!isdefined(vehicle.var_a5b3bf1))
	{
		vehicle.var_a5b3bf1 = vehicle.origin;
	}
	var_30206623 = [3:[], 2:[], 1:[], 0:[]];
	if(!isdefined(vehicle.var_30206623))
	{
		vehicle.var_30206623 = var_30206623;
	}
	var_d556ca21 = 30;
	if(!isdefined(vehicle.var_74193f59))
	{
		vehicle.var_74193f59 = -1;
	}
	if(gettime() > vehicle.var_74193f59)
	{
		vehicle.var_74193f59 = gettime() + 1000;
		for(list_index = 0; list_index < vehicle.var_30206623.size; list_index++)
		{
			function_1eaaceab(vehicle.var_30206623[list_index]);
		}
		vehicle.attack_spots = undefined;
	}
	if(distancesquared(vehicle.var_a5b3bf1, vehicle.origin) > sqr(var_d556ca21) || !isdefined(vehicle.attack_spots))
	{
		vehicle.var_a5b3bf1 = vehicle.origin;
		var_69cd50a3 = anglestoforward(vehicle.angles);
		var_63017913 = anglestoright(vehicle.angles);
		var_328f42e5 = vehicle getboundshalfsize();
		var_11560bb5 = (isdefined(var_328f42e5[1]) ? var_328f42e5[1] : 0);
		front_dist = (isdefined(var_328f42e5[0]) ? var_328f42e5[0] : 0);
		var_35bc98c = var_63017913 * var_11560bb5;
		vehicle.var_cef3270f = [];
		vehicle.attack_spots = [];
		vehicle.var_d9381ace = [3:[], 2:[], 1:[], 0:[]];
		occupants = vehicle getvehoccupants();
		foreach(occupant in occupants)
		{
			projected = vectorprojection(vehicle.origin - occupant.origin, var_35bc98c);
			var_c090ff87 = lengthsquared(projected);
			var_4e5e0fc4 = (occupant.origin[0], occupant.origin[1], vehicle.origin[2]) + projected;
			var_bc4c0533 = [1:var_4e5e0fc4 - var_35bc98c, 0:var_4e5e0fc4 + var_35bc98c];
			if(var_c090ff87 < sqr(var_11560bb5))
			{
				if(var_c090ff87 > 2)
				{
					var_81952387 = arraygetclosest(occupant.origin, var_bc4c0533);
					side = (var_81952387 === var_bc4c0533[0] ? 1 : 3);
					function_3c2e73c7(vehicle, var_81952387, side, 1);
					continue;
				}
				for(i = 0; i < var_bc4c0533.size; i++)
				{
					side = (i === 0 ? 1 : 3);
					function_3c2e73c7(vehicle, var_bc4c0533[i], side, 1);
				}
			}
		}
		var_c8394a1c = 2 / ((front_dist * 2) / 35);
		var_e74e4ad9 = ((front_dist * 2) / 35) - 4;
		xx = -1;
		while(xx <= 1)
		{
			side = (xx < 0 ? 1 : 3);
			spot = vehicle getpointinbounds(-1 + var_c8394a1c, xx, -1);
			for(spot_index = 0; spot_index < var_e74e4ad9; spot_index++)
			{
				spot = spot + (var_69cd50a3 * 35);
				function_3c2e73c7(vehicle, spot, side);
			}
			xx = xx + 2;
		}
		var_a8beb071 = 2 / ((var_11560bb5 * 2) / 35);
		var_98185c02 = ((var_11560bb5 * 2) / 35) - 1;
		var_9bb18379 = -1;
		while(var_9bb18379 <= 1)
		{
			side = (var_9bb18379 < 0 ? 2 : 0);
			spot = vehicle getpointinbounds(var_9bb18379, -1 + var_a8beb071, -1);
			for(spot_index = 0; spot_index < var_98185c02; spot_index++)
			{
				spot = spot - (var_63017913 * 35);
				function_3c2e73c7(vehicle, spot, side);
			}
			var_9bb18379 = var_9bb18379 + 2;
		}
	}
	/#
		if(getdvarint(#"hash_24148fb67250b39a", 0))
		{
			foreach(spot in vehicle.attack_spots)
			{
				debugstar(spot.origin, 40, (0, 0, 1));
			}
		}
	#/
}

/*
	Name: function_3c2e73c7
	Namespace: namespace_85745671
	Checksum: 0x9D495E3A
	Offset: 0x6600
	Size: 0x2BC
	Parameters: 4
	Flags: Linked, Private
*/
function private function_3c2e73c7(vehicle, spot, side, b_top)
{
	/#
		/#
			assert(isdefined(vehicle.attack_spots), "");
		#/
	#/
	if(!(isdefined(vehicle) && (isdefined(spot) && (isdefined(side) && isdefined(vehicle.attack_spots)))))
	{
		return;
	}
	var_4103e33e = arraygetclosest(spot, vehicle.attack_spots);
	if(isdefined(var_4103e33e) && distancesquared(var_4103e33e.origin, spot) < sqr(30))
	{
		return;
	}
	struct = {#side:side, #origin:spot};
	if(!isdefined(vehicle.attack_spots))
	{
		vehicle.attack_spots = [];
	}
	else if(!isarray(vehicle.attack_spots))
	{
		vehicle.attack_spots = array(vehicle.attack_spots);
	}
	vehicle.attack_spots[vehicle.attack_spots.size] = struct;
	if(!isdefined(vehicle.var_d9381ace[side]))
	{
		vehicle.var_d9381ace[side] = [];
	}
	else if(!isarray(vehicle.var_d9381ace[side]))
	{
		vehicle.var_d9381ace[side] = array(vehicle.var_d9381ace[side]);
	}
	vehicle.var_d9381ace[side][vehicle.var_d9381ace[side].size] = struct;
	if(is_true(b_top))
	{
		if(!isdefined(vehicle.var_cef3270f))
		{
			vehicle.var_cef3270f = [];
		}
		else if(!isarray(vehicle.var_cef3270f))
		{
			vehicle.var_cef3270f = array(vehicle.var_cef3270f);
		}
		vehicle.var_cef3270f[vehicle.var_cef3270f.size] = struct;
	}
}

/*
	Name: function_98e73b11
	Namespace: namespace_85745671
	Checksum: 0xC8567913
	Offset: 0x68C8
	Size: 0xFA
	Parameters: 1
	Flags: Linked
*/
function function_98e73b11(vehicle)
{
	if(!isvehicle(vehicle) || !isdefined(vehicle.var_30206623))
	{
		return 0;
	}
	result = 0;
	for(var_656ca683 = 0; var_656ca683 < 4; var_656ca683++)
	{
		var_a10e63f5 = &vehicle.var_30206623[var_656ca683];
		if(isinarray(var_a10e63f5, self))
		{
			var_e7f6ebff = var_656ca683;
			break;
		}
	}
	if(isdefined(var_e7f6ebff) && function_758df15d(vehicle, self.origin) === var_e7f6ebff)
	{
		result = 1;
	}
	return result;
}

/*
	Name: function_758df15d
	Namespace: namespace_85745671
	Checksum: 0xB7357460
	Offset: 0x69D0
	Size: 0x24E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_758df15d(vehicle, position)
{
	var_69cd50a3 = anglestoforward((0, vehicle.angles[1], 0));
	var_63017913 = anglestoright((0, vehicle.angles[1], 0));
	var_a0a475e3 = vehicle getboundshalfsize();
	var_b62b2d3 = vehicle.origin + (var_69cd50a3 * var_a0a475e3[0]);
	var_3cf03ef4 = vehicle.origin - (var_69cd50a3 * var_a0a475e3[0]);
	var_24927517 = vehicle.origin + (var_63017913 * var_a0a475e3[1]);
	var_456fde32 = vehicle.origin - (var_63017913 * var_a0a475e3[1]);
	b_right = (vectordot(var_63017913, position - var_24927517)) > 0;
	b_left = (vectordot(var_63017913 * -1, position - var_456fde32)) > 0;
	var_47c54be9 = (vectordot(var_69cd50a3, position - var_b62b2d3)) > 0;
	var_7253c519 = (vectordot(var_69cd50a3 * -1, position - var_3cf03ef4)) > 0;
	if(!var_47c54be9 && !var_7253c519)
	{
		if(b_right)
		{
			return 1;
		}
		if(b_left)
		{
			return 3;
		}
	}
	if(!b_right && !b_left)
	{
		if(var_47c54be9)
		{
			return 0;
		}
		if(var_7253c519)
		{
			return 2;
		}
	}
	return undefined;
}

/*
	Name: function_ff8b3908
	Namespace: namespace_85745671
	Checksum: 0x5294BAAC
	Offset: 0x6C28
	Size: 0x3C
	Parameters: 1
	Flags: Private, Event
*/
event private function_ff8b3908(eventstruct)
{
	if(isdefined(eventstruct.ent.var_fa527c6d))
	{
		eventstruct.ent function_af978c79();
	}
}

/*
	Name: function_847ab632
	Namespace: namespace_85745671
	Checksum: 0x759AF03A
	Offset: 0x6C70
	Size: 0x5E0
	Parameters: 0
	Flags: Linked
*/
function function_847ab632()
{
	idflags = 0;
	if(isdefined(self.enemy) && is_true(self.enemy.armor))
	{
		idflags = idflags | 2048;
	}
	var_2258ffbe = undefined;
	if(isdefined(self.attackable))
	{
		var_2258ffbe = anglestoforward(self.angles);
	}
	hitent = self melee(var_2258ffbe, idflags);
	if(isdefined(hitent) && hitent.team !== self.team)
	{
		if(self.attackable === hitent)
		{
			self function_924c0c6f(self.attackable);
			if(isvehicle(self.attackable))
			{
				self function_e441487e(hitent);
			}
		}
		else
		{
			if(isvehicle(hitent))
			{
				damage = self.var_a0193213;
				if(self.var_6f84b820 === #"elite")
				{
					damage = randomintrange(850, 1200);
				}
				self function_e441487e(hitent);
				self function_2713ff17(hitent, damage);
			}
			else if(isplayer(hitent))
			{
				function_95c99579(hitent);
				if(hitent isinvehicle())
				{
					vehicle = hitent getvehicleoccupied();
					damage = self.var_a0193213;
					if(self.var_6f84b820 === #"elite")
					{
						damage = randomintrange(850, 1200);
					}
					self function_e441487e(vehicle);
					self function_2713ff17(vehicle, damage);
				}
			}
		}
	}
	else
	{
		if(isdefined(self.attackable) && (isdefined(self.var_b238ef38) && isdefined(self.var_b238ef38.position)) && self isingoal(self.var_b238ef38.position))
		{
			self function_924c0c6f(self.attackable);
		}
		else if(isdefined(self.enemy) && isplayer(self.enemy) && self.enemy getstance() != "stand")
		{
			z_dist = self.enemy.origin[2] - self.origin[2];
			if(abs(z_dist) < 24)
			{
				var_e98404d8 = self getcentroid();
				var_6bd1cb3c = self.enemy geteye();
				dist_sq = distancesquared(var_e98404d8, var_6bd1cb3c);
				if(dist_sq < sqr(64))
				{
					if(bullettracepassed(var_e98404d8, var_6bd1cb3c, 0, self))
					{
						self function_a7a7d0b2();
					}
				}
				else
				{
					/#
						recordstar(self.enemy.origin, (1, 0, 0));
						recordstar(self.origin, (1, 0.5, 0));
						record3dtext("" + sqrt(dist_sq), self.origin, (1, 0.5, 0));
					#/
					if(getdvarint(#"hash_44035b03496fb5de", 0))
					{
					}
				}
			}
			else
			{
				/#
					recordstar(self.enemy.origin, (1, 0, 0));
					recordstar(self.origin, (1, 0.5, 0));
					record3dtext("" + z_dist, self.origin, (1, 0.5, 0));
				#/
				if(getdvarint(#"hash_44035b03496fb5de", 0))
				{
				}
			}
		}
	}
	return hitent;
}

/*
	Name: function_95c99579
	Namespace: namespace_85745671
	Checksum: 0xFDC244C7
	Offset: 0x7258
	Size: 0xE4
	Parameters: 2
	Flags: Linked
*/
function function_95c99579(player, b_distance_check)
{
	if(!isdefined(b_distance_check))
	{
		b_distance_check = 0;
	}
	if(!isdefined(player))
	{
		player = self.enemy;
	}
	if(!isplayer(player))
	{
		return;
	}
	if(is_true(b_distance_check) && distancesquared(self getcentroid(), player geteye()) > sqr(self.meleeweapon.var_d3cafde6))
	{
		return;
	}
	player clientfield::increment_to_player("zombie_melee_shake", 1);
}

/*
	Name: function_a7a7d0b2
	Namespace: namespace_85745671
	Checksum: 0xE39844EE
	Offset: 0x7348
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_a7a7d0b2(damage_override)
{
	var_bff5eef3 = self.meleeweapon.meleedamage;
	if(isdefined(damage_override))
	{
		var_bff5eef3 = damage_override;
	}
	if(!isdefined(self.enemy))
	{
		return;
	}
	self.enemy dodamage(var_bff5eef3, self.origin, self, self, "torso_upper", "MOD_MELEE", 0, self.meleeweapon);
	if(!isdefined(self.enemy))
	{
		return;
	}
	self.enemy playsoundtoplayer(#"hash_6307f941b1ae7ed4", self.enemy);
	if(!isdefined(self.enemy))
	{
		return;
	}
	self function_95c99579(self.enemy);
}

/*
	Name: function_924c0c6f
	Namespace: namespace_85745671
	Checksum: 0x50B9B832
	Offset: 0x7440
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function function_924c0c6f(attackable)
{
	var_8b4a973a = undefined;
	if(isdefined(attackable.startinghealth))
	{
		var_8b4a973a = attackable.startinghealth;
	}
	else if(isdefined(attackable.maxhealth))
	{
		var_8b4a973a = attackable.maxhealth;
	}
	if(isdefined(var_8b4a973a))
	{
		if(is_true(self.var_d8695234))
		{
			damage = (int(var_8b4a973a / 2)) + 1;
			attackable dodamage(damage, attackable.origin, self, self);
		}
		else
		{
			if(is_true(self.is_companion))
			{
				damage = int(145);
				attackable dodamage(damage, attackable.origin, self, self, "torso_upper");
			}
			else
			{
				damage = (int(var_8b4a973a / 20)) + 1;
				attackable dodamage(damage, attackable.origin, self, self);
			}
		}
	}
}

/*
	Name: function_68cc8bce
	Namespace: namespace_85745671
	Checksum: 0x87B70DE2
	Offset: 0x75B8
	Size: 0x13C
	Parameters: 1
	Flags: None
*/
function function_68cc8bce(params)
{
	owner = params.owner;
	turret = params.turret;
	owner endon(#"death");
	turret endon(#"death");
	wait(1);
	slots = function_bdb2b85b(turret, turret.origin, turret.angles, 30, 4, 300);
	if(!isdefined(slots) || slots.size <= 0)
	{
		return;
	}
	turret.var_b79a8ac7 = {#slots:slots, #hash_f019ea1a:500};
	turret.var_ba721a2c = 20;
	if(!isdefined(level.attackables))
	{
		level.attackables = [];
	}
	turret.is_active = 1;
	level.attackables[level.attackables.size] = turret;
}

/*
	Name: function_ff5fd6b8
	Namespace: namespace_85745671
	Checksum: 0xE8EA0561
	Offset: 0x7700
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_ff5fd6b8(params)
{
	owner = params.owner;
	turret = params.turret;
	function_b70e2a37(turret);
}

/*
	Name: function_cf065988
	Namespace: namespace_85745671
	Checksum: 0x850AFFA9
	Offset: 0x7758
	Size: 0x17C
	Parameters: 1
	Flags: Linked
*/
function function_cf065988(params)
{
	owner = params.owner;
	cover = params.cover;
	owner endon(#"death");
	cover endon(#"death");
	slots = function_bdb2b85b(cover, owner.smartcover.var_add809de.origin, owner.smartcover.var_add809de.angles, (owner.smartcover.var_add809de.width / 2) + 12, 6, level.var_5101157d.bundle.var_b345c668);
	if(!isdefined(slots) || slots.size <= 0)
	{
		return;
	}
	cover.var_b79a8ac7 = {#slots:slots};
	cover.var_ba721a2c = 1;
	cover.var_d83d7db3 = 100;
	if(!isdefined(level.attackables))
	{
		level.attackables = [];
	}
	level.attackables[level.attackables.size] = cover;
}

/*
	Name: function_b0503d98
	Namespace: namespace_85745671
	Checksum: 0xF3F5DF06
	Offset: 0x78E0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_b0503d98(params)
{
	cover = params.cover;
	function_b70e2a37(cover);
}

/*
	Name: function_2713ff17
	Namespace: namespace_85745671
	Checksum: 0x76C2B367
	Offset: 0x7920
	Size: 0x20C
	Parameters: 2
	Flags: Linked
*/
function function_2713ff17(vehicle, damage_amount)
{
	if(isdefined(vehicle))
	{
		if(isdefined(damage_amount))
		{
			vehicle dodamage(damage_amount, vehicle.origin);
		}
		else
		{
			/#
				iprintlnbold(("" + (isdefined(self.archetype) ? self.archetype : "")) + "");
			#/
		}
		org = vehicle.origin;
		nearby_players = getentitiesinradius(vehicle.origin, vehicle.radius, 1);
		foreach(player in nearby_players)
		{
			if(isdefined(vehicle getoccupantseat(player)) || player getgroundent() === vehicle || (player getmoverent() === vehicle && player istouching(player getmoverent())))
			{
				player clientfield::increment_to_player("zombie_vehicle_shake", 1);
			}
		}
		playrumbleonposition("grenade_rumble", org);
	}
}

/*
	Name: function_e441487e
	Namespace: namespace_85745671
	Checksum: 0x85ECE1E
	Offset: 0x7B38
	Size: 0x1C4
	Parameters: 1
	Flags: Linked
*/
function function_e441487e(vehicle)
{
	var_496cfa10 = vehicle.origin + vehicle getboundsmidpoint();
	melee_radius = 15;
	var_f7ee0c3f = self getpathfindingradius() + melee_radius;
	var_c86c1e8e = self gettagorigin("j_spine4");
	var_747c692d = (isdefined(var_c86c1e8e[2]) ? var_c86c1e8e[2] : var_496cfa10[2]);
	var_14c32c86 = (self.origin[0], self.origin[1], var_747c692d);
	var_14c32c86 = var_14c32c86 + ((vectornormalize(var_496cfa10 - var_14c32c86)) * var_f7ee0c3f);
	fx = #"hash_759f82a7cd698ae";
	if(self.var_6f84b820 === #"normal")
	{
		fx = #"hash_61a4124615c8df27";
	}
	else if(self.var_6f84b820 === #"elite")
	{
		fx = #"hash_61a11c4615c6ba4e";
	}
	if(!isdefined(fx))
	{
		/#
			println("");
		#/
		return;
	}
	playfx(fx, var_14c32c86);
}

/*
	Name: on_ai_damage
	Namespace: namespace_85745671
	Checksum: 0xD6E7EA08
	Offset: 0x7D08
	Size: 0x66C
	Parameters: 1
	Flags: Linked
*/
function on_ai_damage(params)
{
	if(isdefined(params.einflictor.scriptvehicletype) && isdefined(params.smeansofdeath) && isdefined(params.idamage))
	{
		if(params.einflictor.classname === "script_vehicle" && params.smeansofdeath == "MOD_CRUSH")
		{
			var_80730518 = params.einflictor;
			switch(var_80730518.scriptvehicletype)
			{
				case "hash_1aa3be97c5bfcefa":
				{
					n_damage = 200;
					var_bbbf4dc0 = 0.05;
					var_e96b9598 = 0.2;
					break;
				}
				case "hash_2d53e3136f122763":
				{
					n_damage = 75;
					var_bbbf4dc0 = 0.05;
					var_e96b9598 = 0.55;
					break;
				}
				case "hash_2212824fabcc986c":
				{
					n_damage = 100;
					var_bbbf4dc0 = 0.05;
					var_e96b9598 = 0.25;
					break;
				}
				case "hash_65231a254dac5391":
				{
					n_damage = 90;
					var_bbbf4dc0 = 0.05;
					var_e96b9598 = 0.7;
					break;
				}
				case "hash_1314c8c8bb6fdb10":
				{
					n_damage = 95;
					var_bbbf4dc0 = 0.05;
					var_e96b9598 = 0.7;
					break;
				}
				default:
				{
					n_damage = 100;
					var_bbbf4dc0 = 0.05;
					break;
				}
			}
			if(isdefined(n_damage))
			{
				if(isalive(self) && !is_true(self.var_490b950e))
				{
					self.var_490b950e = 1;
					self thread function_595cd0e4();
					v_forward = var_80730518.origin + (vectornormalize(anglestoforward(var_80730518.angles)) * 110);
					v_velocity = var_80730518 getvelocity();
					v_launch = v_velocity * (var_bbbf4dc0 * -1);
					v_hitloc = params.vpoint;
					if(self.aitype === #"hash_704a090ff9fcffd0" || self.aitype === #"hash_4f87aa2a203d37d0" || self.aitype === #"spawner_zm_steiner")
					{
						v_launch = v_velocity * (var_e96b9598 * -1);
						n_damage = n_damage * 4;
					}
					else if(self.aitype === #"hash_60d7855358ceb53d" || self.aitype === #"spawner_zm_steiner_hvt" || self.aitype === #"hash_3ff43755c44e6d3d")
					{
						v_launch = v_velocity * (var_e96b9598 * -1);
						n_damage = n_damage * 8;
					}
					if(isdefined(var_80730518))
					{
						var_80730518 thread function_66c37f3b();
						var_80730518 function_dbf5bfd3(self, params.idamage);
						var_80730518 function_117ab176(self, params.idamage);
						if(isdefined(v_forward) && !isdefined(var_80730518.b_launched))
						{
							var_80730518.b_launched = 1;
							var_80730518 thread function_695f2040();
							n_damage = int(n_damage);
							if(!is_true(self.var_81568da5) && (!is_true(self.var_6cdeac5e) || !is_true(var_80730518.var_2b60f92f)))
							{
								var_80730518 launchvehicle(v_launch, v_hitloc, 0, 0);
							}
						}
						damage_percentage = params.idamage / (isdefined(self.maxhealth) ? self.maxhealth : 1);
						if(damage_percentage >= 0.4)
						{
							if(damage_percentage > 2.4)
							{
								if(isdefined(self) && self.archetype === #"zombie")
								{
									if(math::cointoss(40) || isdefined(var_80730518.var_e955dfad))
									{
										self thread zombie_utility::zombie_gut_explosion();
									}
									else
									{
										self thread zombie_utility::zombie_gib();
									}
								}
							}
							else if(damage_percentage > 1)
							{
								if(isdefined(self) && self.archetype === #"zombie")
								{
									if(math::cointoss(50))
									{
										self thread zombie_utility::zombie_gib();
									}
								}
							}
							var_80730518 dodamage(n_damage, var_80730518.origin, self, undefined, "", "MOD_IMPACT");
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_595cd0e4
	Namespace: namespace_85745671
	Checksum: 0x38A779F4
	Offset: 0x8380
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function function_595cd0e4()
{
	self endon(#"death");
	wait(1);
	if(isalive(self))
	{
		self.var_490b950e = 0;
	}
}

/*
	Name: function_695f2040
	Namespace: namespace_85745671
	Checksum: 0x39FC3401
	Offset: 0x83D0
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function function_695f2040()
{
	self endon(#"death");
	waitframe(1);
	self.b_launched = undefined;
}

/*
	Name: function_66c37f3b
	Namespace: namespace_85745671
	Checksum: 0xF4F15F6F
	Offset: 0x8400
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_66c37f3b()
{
	self endon(#"death");
	waitframe(1);
	self playrumbleonentity("sr_prototype_vehicle_run_over");
	self playsound(#"hash_7c72cea06ae4906c");
}

/*
	Name: function_dbf5bfd3
	Namespace: namespace_85745671
	Checksum: 0xF4987308
	Offset: 0x8468
	Size: 0x29C
	Parameters: 2
	Flags: Linked
*/
function function_dbf5bfd3(victim, damage)
{
	if(!isdefined(victim.var_97ca51c7) || victim.var_97ca51c7 === 0)
	{
		return;
	}
	var_496cfa10 = self.origin + self getboundsmidpoint();
	var_f7ee0c3f = victim getpathfindingradius();
	var_14c32c86 = (victim.origin[0], victim.origin[1], var_496cfa10[2]);
	var_14c32c86 = var_14c32c86 + ((vectornormalize(var_496cfa10 - var_14c32c86)) * var_f7ee0c3f);
	switch(victim.var_97ca51c7)
	{
		case 1:
		{
			fx = #"hash_2a892324f9a00349";
			break;
		}
		case 2:
		{
			fx = #"hash_300ecf1e2906e7e1";
			break;
		}
		case 3:
		{
			fx = #"hash_55233930bd381063";
			break;
		}
		case 4:
		{
			fx = #"hash_7ce4d6b506f915e";
			break;
		}
	}
	if(isdefined(damage) && damage > 100)
	{
		switch(victim.var_97ca51c7)
		{
			case 1:
			{
				fx = #"hash_18293e40b9cad276";
				break;
			}
			case 2:
			{
				fx = #"hash_294ea8c5b97f912e";
				break;
			}
			case 3:
			{
				fx = #"hash_3938808083de38a4";
				break;
			}
			case 4:
			{
				fx = #"hash_17ad5569b3b11753";
				break;
			}
		}
	}
	if(!isdefined(fx))
	{
		/#
			println("");
		#/
		return;
	}
	playfx(fx, var_14c32c86);
}

/*
	Name: function_117ab176
	Namespace: namespace_85745671
	Checksum: 0x7A7A9BEA
	Offset: 0x8710
	Size: 0x1EE
	Parameters: 2
	Flags: Linked
*/
function function_117ab176(victim, damage)
{
	current_time = gettime();
	damage.var_b99c0512 = current_time;
	damage.var_4ac8985e = current_time + getdvarfloat(#"hash_6180fc224acfa00f", 250);
	var_348afc81 = vectortoangles((self.origin[0], self.origin[1], 0) - (damage.origin[0], damage.origin[1], 0))[1];
	new_angles = (damage.angles[0], var_348afc81, damage.angles[2]);
	damage teleport(damage.origin, new_angles);
	damage.var_24594a06 = abs(self getspeed());
	damage.var_331c8e1b = abs(anglestoup(self.angles)[2]);
	damage.var_b98d64dc = self getvelocity()[2];
	damage.var_d8481de = self.var_586465e4;
	/#
		var_bfc27406 = getdvarfloat(#"hash_29f0c6f284a3a04e", -1);
		if(var_bfc27406 >= 0)
		{
			damage.var_d8481de = var_bfc27406;
		}
	#/
}

/*
	Name: function_dc276637
	Namespace: namespace_85745671
	Checksum: 0xDCB50CE7
	Offset: 0x8908
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_dc276637(ai)
{
	if(!isdefined(ai.var_4ac8985e))
	{
		ai.var_4ac8985e = 0;
	}
	return gettime() < ai.var_4ac8985e || is_true(ai.var_d667c9b7);
}

/*
	Name: function_3cfa8bfe
	Namespace: namespace_85745671
	Checksum: 0x1019FCCA
	Offset: 0x8968
	Size: 0x132
	Parameters: 5
	Flags: None
*/
function function_3cfa8bfe(str_model, v_offset, v_ang, n_forward, n_scale)
{
	self setbrake(1);
	wait(0.5);
	v_forward = self.origin + (vectornormalize(anglestoforward(self.angles)) * n_forward);
	var_6d29abb0 = util::spawn_model(str_model, v_forward + v_offset, v_ang);
	if(isdefined(var_6d29abb0))
	{
		wait(0.1);
		var_6d29abb0.health = int(self.health * 0.4);
		var_6d29abb0 setscale(n_scale);
		var_6d29abb0 linkto(self);
		self.var_e955dfad = var_6d29abb0;
	}
}

/*
	Name: function_8f57dc52
	Namespace: namespace_85745671
	Checksum: 0x332DCB6A
	Offset: 0x8AA8
	Size: 0x118
	Parameters: 2
	Flags: Linked
*/
function function_8f57dc52(dynent, var_83085b86)
{
	if(!isdefined(var_83085b86))
	{
		var_83085b86 = 0;
	}
	if(isdefined(dynent))
	{
		var_9680a0e4 = function_ffdbe8c2(dynent);
		if(!isdefined(dynent.bundle))
		{
			dynent.bundle = function_489009c1(dynent);
		}
		if(!dynent.destructible || !dynent.var_e76c7e9f || !isdefined(dynent.bundle.destroyed) || var_9680a0e4 === dynent.bundle.destroyed || var_9680a0e4 === dynent.bundle.vehicledestroyed || (is_true(dynent.var_993e9bb0) && !var_83085b86))
		{
			return false;
		}
		return true;
	}
	return false;
}

/*
	Name: ee_head
	Namespace: namespace_85745671
	Checksum: 0x1CC0AC9B
	Offset: 0x8BC8
	Size: 0xEA
	Parameters: 3
	Flags: Linked
*/
function ee_head(entity, var_30ce4d1e, forwardoffset)
{
	if(!isdefined(var_30ce4d1e))
	{
		var_30ce4d1e = 1;
	}
	if(!isactor(entity))
	{
		return [];
	}
	if(!isdefined(forwardoffset))
	{
		forwardoffset = anglestoforward(entity.angles) * entity getpathfindingradius();
	}
	return function_c3d68575(entity.origin + forwardoffset, (entity getpathfindingradius() * var_30ce4d1e, entity getpathfindingradius() * var_30ce4d1e, entity function_6a9ae71() * var_30ce4d1e));
}

/*
	Name: function_b8eb5dea
	Namespace: namespace_85745671
	Checksum: 0xD6405023
	Offset: 0x8CC0
	Size: 0x11A
	Parameters: 1
	Flags: Linked
*/
function function_b8eb5dea(params)
{
	var_d54999e4 = ee_head(self, 1.5);
	foreach(dynent in var_d54999e4)
	{
		if(function_8f57dc52(dynent))
		{
			if(!isdefined(dynent.bundle))
			{
				dynent.bundle = function_489009c1(dynent);
			}
			function_e2a06860(dynent, dynent.bundle.destroyed);
		}
	}
	self.var_4c85ebad = undefined;
}

/*
	Name: function_9d3ad056
	Namespace: namespace_85745671
	Checksum: 0x2EDD4FBC
	Offset: 0x8DE8
	Size: 0x1FC
	Parameters: 6
	Flags: Linked
*/
function function_9d3ad056(var_7ecdee63, v_origin, v_angles, str_name, var_c427317f, var_1028910)
{
	if(!isdefined(var_c427317f))
	{
		var_c427317f = 1;
	}
	if(!isdefined(var_1028910))
	{
		var_1028910 = #"hash_5d96e8e3ed203968";
	}
	n_percent = min(0.8, (level.var_b48509f9 * 0.1) + 0.5);
	if(var_c427317f && getaiarray().size >= (int(getailimit() * n_percent)))
	{
		function_904d21fd();
	}
	ai_spawned = spawnactor(var_7ecdee63, v_origin, v_angles, str_name, 1);
	if(isdefined(ai_spawned))
	{
		if(str_name === "kill_hvt_ai")
		{
			ai_spawned.var_c9b11cb3 = #"hash_1f92e0fae04824cd";
		}
		else if(ai_spawned.archetype === #"zombie")
		{
			ai_spawned.var_c9b11cb3 = var_1028910;
		}
		if(isdefined(str_name) && !isinarray(level.var_d0c8ad06, hash(str_name)))
		{
			ai_spawned.var_921627ad = 1;
		}
		if(ai_spawned.aitype === #"hash_785d6a6acd470388")
		{
			ai_spawned.var_43c4bc66 = 1;
		}
		return ai_spawned;
	}
}

/*
	Name: function_904d21fd
	Namespace: namespace_85745671
	Checksum: 0x98CEF32E
	Offset: 0x8FF0
	Size: 0x35C
	Parameters: 0
	Flags: Linked
*/
function function_904d21fd()
{
	actor_array = getaiarchetypearray(#"zombie");
	max_dist = 0;
	var_202d087b = undefined;
	foreach(i, actor in actor_array)
	{
		if(is_true(actor.var_921627ad) || is_true(actor.var_a950813d) || is_true(actor.var_4df707f6))
		{
			actor_array[i] = -1;
		}
	}
	arrayremovevalue(actor_array, -1);
	players = getplayers();
	foreach(player in players)
	{
		if(player.sessionstate === "spectator")
		{
			continue;
		}
		while(true)
		{
			if(!isdefined(player))
			{
				break;
			}
			var_3817a6b3 = arraygetfarthest(player.origin, actor_array);
			if(!isdefined(var_3817a6b3))
			{
				return;
			}
			if(!player util::is_player_looking_at(var_3817a6b3 getcentroid(), undefined, 0))
			{
				break;
			}
			arrayremovevalue(actor_array, var_3817a6b3);
			if(!actor_array.size)
			{
				return;
			}
			waitframe(1);
		}
		if(isdefined(var_3817a6b3))
		{
			closest_player = arraygetclosest(var_3817a6b3.origin, getplayers());
		}
		if(isdefined(closest_player) && isdefined(var_3817a6b3))
		{
			dist = distancesquared(closest_player.origin, var_3817a6b3.origin);
			if(max_dist < dist)
			{
				max_dist = dist;
				var_202d087b = var_3817a6b3;
			}
		}
	}
	if(!isdefined(var_202d087b))
	{
		var_202d087b = array::random(actor_array);
	}
	if(isdefined(var_202d087b))
	{
		var_202d087b callback::callback(#"hash_10ab46b52df7967a");
	}
}

/*
	Name: function_143a09ab
	Namespace: namespace_85745671
	Checksum: 0x83E3C137
	Offset: 0x9358
	Size: 0x196
	Parameters: 2
	Flags: None
*/
function function_143a09ab(n_radius, v_loc)
{
	level endon(#"defend_over");
	self endon(#"death");
	if(!isdefined(v_loc))
	{
		v_loc = self.origin;
	}
	a_ai_zombies = getaiarray();
	foreach(ai_zombie in a_ai_zombies)
	{
		if(isalive(ai_zombie) && !isdefined(ai_zombie.var_921627ad) && !isdefined(ai_zombie.var_4df707f6))
		{
			if(distance2dsquared(v_loc, ai_zombie.origin) >= sqr(n_radius))
			{
				ai_zombie callback::callback(#"hash_10ab46b52df7967a");
			}
			else
			{
				ai_zombie thread function_b7e28ade(v_loc, n_radius);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_b7e28ade
	Namespace: namespace_85745671
	Checksum: 0xF1E73CAE
	Offset: 0x94F8
	Size: 0x184
	Parameters: 2
	Flags: Linked
*/
function function_b7e28ade(v_loc, var_743fe0c8)
{
	if(!isdefined(var_743fe0c8))
	{
		var_743fe0c8 = 2000;
	}
	self endon(#"death");
	self.b_visible = 0;
	foreach(player in getplayers())
	{
		if(isdefined(var_743fe0c8) && isdefined(v_loc) && distance2dsquared(self.origin, v_loc) > sqr(var_743fe0c8) && player util::is_looking_at(self, 0.7, 1))
		{
			self.b_visible = 1;
		}
		waitframe(1);
	}
	if(!self.b_visible && !isdefined(self.enemy) && !isdefined(self.var_b238ef38))
	{
		self callback::callback(#"hash_10ab46b52df7967a");
	}
}

/*
	Name: function_5cb3181e
	Namespace: namespace_85745671
	Checksum: 0x663DEFB9
	Offset: 0x9688
	Size: 0x2C4
	Parameters: 1
	Flags: Linked
*/
function function_5cb3181e(params)
{
	self endoncallback(&function_ed58e498, #"death");
	if(is_true(self.var_a950813d) || !isalive(self))
	{
		return;
	}
	self.var_4df707f6 = 1;
	despawn_anim = self.despawn_anim;
	if(!isdefined(despawn_anim) && isdefined(self.var_ecbef856))
	{
		despawn_anim = self animmappingsearch(self.var_ecbef856);
	}
	if(!isdefined(despawn_anim))
	{
		self clientfield::increment("zombie_teleport", 1);
	}
	waitframe(randomintrange(2, 5));
	if(isdefined(self.attackable))
	{
		function_2b925fa5(self);
	}
	self hide();
	self.ignoreall = 1;
	[[ level.var_454ed97e ]]->waitinqueue(self);
	if(isdefined(despawn_anim) && !self isragdoll())
	{
		length = getanimlength(despawn_anim);
		self animscripted("despawn_anim", self.origin, self.angles, despawn_anim, "normal", undefined, 1, 0.2);
		self waittilltimeout(length + 1, {#notetrack:"end"}, #"despawn_anim");
	}
	self util::stop_magic_bullet_shield();
	self ghost();
	self notsolid();
	waittillframeend();
	self.allowdeath = 1;
	self.var_98f1f37c = 1;
	if(self isplayinganimscripted())
	{
		self stopanimscripted();
	}
	self deletedelay();
}

/*
	Name: function_ed58e498
	Namespace: namespace_85745671
	Checksum: 0x61BA747C
	Offset: 0x9958
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ed58e498(notifyhash)
{
	[[ level.var_454ed97e ]]->function_5ef47bb4(self);
}

/*
	Name: function_b67c088d
	Namespace: namespace_85745671
	Checksum: 0x630F645B
	Offset: 0x9988
	Size: 0x72
	Parameters: 0
	Flags: Linked
*/
function function_b67c088d()
{
	enemy_override = undefined;
	if(self.archetype === #"zombie")
	{
		if(isdefined(level.zombielevelspecifictargetcallback))
		{
			enemy_override = [[level.zombielevelspecifictargetcallback]]();
			return enemy_override;
		}
		enemy_override = self function_a9cfe717();
	}
	return enemy_override;
}

/*
	Name: function_a9cfe717
	Namespace: namespace_85745671
	Checksum: 0xBB203746
	Offset: 0x9A08
	Size: 0xEA
	Parameters: 0
	Flags: Linked
*/
function function_a9cfe717()
{
	if(level.var_15e68c97.size <= 0 && level.var_432fa05c.var_402a4207.size <= 0 && level.var_2da60c10.size <= 0)
	{
		return undefined;
	}
	var_38023c1a = [2:namespace_8bf2881e::function_bd59a592(self), 1:namespace_c5ba6e2a::function_4a5dff80(self), 0:nightingale::function_29fbe24f(self)];
	arrayremovevalue(var_38023c1a, undefined);
	return arraygetclosest(self.origin, var_38023c1a);
}

/*
	Name: function_9456addc
	Namespace: namespace_85745671
	Checksum: 0xA502845B
	Offset: 0x9B00
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_9456addc(var_fb09158c)
{
	if(!isdefined(var_fb09158c))
	{
		var_fb09158c = 15;
	}
	if(isalive(self))
	{
		a_players = array::get_all_closest(self.origin, laststand::function_7fb2bbfc());
		enemy = a_players[0];
		if(isalive(enemy))
		{
			awareness::function_c241ef9a(self, enemy, var_fb09158c);
		}
	}
}

/*
	Name: function_744beb04
	Namespace: namespace_85745671
	Checksum: 0xDA501C94
	Offset: 0x9BC0
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function function_744beb04(entity)
{
	if(!isdefined(entity))
	{
		return;
	}
	if(entity.team !== level.zombie_team || isdefined(entity.var_ff290a61) || isdefined(entity.enemy_override) || (isdefined(entity.var_b238ef38) && !isdefined(entity.attackable)))
	{
		function_2b925fa5(entity);
	}
	else if(!isdefined(entity.attackable))
	{
		entity.attackable = get_attackable(entity, 1, entity.var_c11b8a5a);
	}
}

/*
	Name: function_caa890e2
	Namespace: namespace_85745671
	Checksum: 0x6DBC78B4
	Offset: 0x9C90
	Size: 0x234
	Parameters: 6
	Flags: None
*/
function function_caa890e2(origin, &spawn_points, var_79d43d2f, height, outer_radius, inner_radius)
{
	var_31189d28 = (isdefined(inner_radius) ? inner_radius : 0);
	queryresult = positionquery_source_navigation(origin, var_31189d28, outer_radius, height / 2, 20);
	var_c94c8429 = int(min(queryresult.data.size, var_79d43d2f));
	while(queryresult.data.size && spawn_points.size < var_c94c8429)
	{
		spawn_point = array::pop(queryresult.data, randomint(queryresult.data.size), 0);
		trace_start = (spawn_point.origin[0], spawn_point.origin[1], spawn_point.origin[2] + height);
		traceresult = physicstraceex(trace_start, spawn_point.origin, vectorscale((-1, -1, 0), 15), (15, 15, 72));
		var_d1a33279 = traceresult[#"position"];
		if(traceresult[#"fraction"] > 0 && (abs(var_d1a33279[2] - spawn_point.origin[2])) < 32)
		{
			spawn_points[spawn_points.size] = var_d1a33279 - origin;
		}
	}
}

/*
	Name: function_6b273d22
	Namespace: namespace_85745671
	Checksum: 0xDC04CA3C
	Offset: 0x9ED0
	Size: 0x262
	Parameters: 5
	Flags: Linked
*/
function function_6b273d22(origin, var_1faf023a, outer_radius, inner_radius, var_b28b1642)
{
	if(!isdefined(origin))
	{
		return [];
	}
	point_start = (origin[0] + var_1faf023a[0], origin[1] + var_1faf023a[1], origin[2] + var_1faf023a[2]);
	point_end = (origin[0] + var_1faf023a[0], origin[1] + var_1faf023a[1], origin[2] - var_1faf023a[2]);
	traceresult = physicstraceex(point_start, point_end, vectorscale((-1, -1, 0), 15), (15, 15, 72));
	var_d1a33279 = traceresult[#"position"];
	if(is_true(var_b28b1642))
	{
		waitframe(1);
	}
	if(traceresult[#"fraction"] > 0 && isdefined(var_d1a33279))
	{
		var_47efca42 = getclosestpointonnavmesh(var_d1a33279, 500, 32);
	}
	if(isdefined(var_47efca42) && (abs(var_d1a33279[2] - var_47efca42[2])) < 32)
	{
		if(distance2dsquared(var_47efca42, origin) <= sqr(outer_radius) && (!isdefined(inner_radius) || distance2dsquared(var_47efca42, origin) >= sqr(inner_radius)))
		{
			var_a7a99675 = (var_47efca42[0], var_47efca42[1], max(var_d1a33279[2], var_47efca42[2]));
		}
	}
	return var_a7a99675;
}

/*
	Name: function_5f4ef4d0
	Namespace: namespace_85745671
	Checksum: 0xE93FBF0A
	Offset: 0xA140
	Size: 0x26A
	Parameters: 6
	Flags: Linked
*/
function function_5f4ef4d0(origin, angles, var_1faf023a, width, length, height)
{
	point_start = (origin[0] + var_1faf023a[0], origin[1] + var_1faf023a[1], origin[2] + var_1faf023a[2]);
	point_end = (origin[0] + var_1faf023a[0], origin[1] + var_1faf023a[1], origin[2] - var_1faf023a[2]);
	traceresult = physicstraceex(point_start, point_end, vectorscale((-1, -1, 0), 15), (15, 15, 72));
	var_d1a33279 = traceresult[#"position"];
	if(traceresult[#"fraction"] > 0 && isdefined(var_d1a33279))
	{
		var_47efca42 = var_d1a33279;
	}
	if(isdefined(var_47efca42) && (abs(var_d1a33279[2] - var_47efca42[2])) < 32)
	{
		var_2e0bd94f = var_47efca42 - origin;
		var_1e98886a = function_72c0c267(var_2e0bd94f, angles);
		mins = (-0.5 * width, -0.5 * length, -0.5 * height);
		maxs = mins * -1;
		if(function_fc3f770b(mins, maxs, var_1e98886a))
		{
			var_a7a99675 = (var_47efca42[0], var_47efca42[1], max(var_d1a33279[2], var_47efca42[2]));
		}
	}
	return var_a7a99675;
}

/*
	Name: function_72c54d21
	Namespace: namespace_85745671
	Checksum: 0xBF048026
	Offset: 0xA3B8
	Size: 0x10A
	Parameters: 4
	Flags: Linked
*/
function function_72c54d21(origin, height, outer_radius, inner_radius)
{
	theta = randomfloatrange(0, 360);
	var_9bdfd = 0.2;
	if(isdefined(inner_radius))
	{
		var_9bdfd = inner_radius / outer_radius;
	}
	x = (sin(theta) * outer_radius) * randomfloatrange(var_9bdfd, 1);
	y = (cos(theta) * outer_radius) * randomfloatrange(var_9bdfd, 1);
	z = height;
	return (x, y, z);
}

/*
	Name: function_4ed3741d
	Namespace: namespace_85745671
	Checksum: 0x497176E5
	Offset: 0xA4D0
	Size: 0xEA
	Parameters: 7
	Flags: Linked
*/
function function_4ed3741d(origin, angles, height, outer_radius, inner_radius, min_angle, max_angle)
{
	if(!isdefined(min_angle))
	{
		min_angle = 0;
	}
	if(!isdefined(max_angle))
	{
		max_angle = 180;
	}
	loc_0000A550:
	return rotatepoint((1, 0, height) * (randomfloatrange((isdefined(inner_radius) ? inner_radius / outer_radius : 0), outer_radius)), (0, (randomintrange(0, 2) ? -1 : 1) * randomfloatrange(min_angle, max_angle) + angles[1], 0));
}

/*
	Name: function_81a53f3b
	Namespace: namespace_85745671
	Checksum: 0x63014B0B
	Offset: 0xA5C8
	Size: 0xF2
	Parameters: 5
	Flags: Linked
*/
function function_81a53f3b(origin, angles, width, length, height)
{
	x = randomfloatrange(-0.5 * width, 0.5 * width);
	y = randomfloatrange(-0.5 * length, 0.5 * length);
	z = height;
	point = (x, y, z);
	point = rotatepoint(point, (0, angles[1], 0));
	return point;
}

/*
	Name: function_e4791424
	Namespace: namespace_85745671
	Checksum: 0x4CBC4A63
	Offset: 0xA6C8
	Size: 0x222
	Parameters: 8
	Flags: Linked
*/
function function_e4791424(origin, var_79d43d2f, height, outer_radius, inner_radius, var_f0ee0fcd, var_362d6269, var_632ad0e5)
{
	if(!isdefined(inner_radius))
	{
		inner_radius = 0;
	}
	if(!isdefined(var_f0ee0fcd))
	{
		var_f0ee0fcd = 0;
	}
	if(!isdefined(var_362d6269))
	{
		var_362d6269 = 1;
	}
	if(!isdefined(var_632ad0e5))
	{
		var_632ad0e5 = 1;
	}
	level endon(#"game_ended");
	if(!isdefined(origin))
	{
		return [];
	}
	var_ec81389d = 0;
	var_fa7134f3 = (var_632ad0e5 ? 3 : 1);
	spawn_points = [];
	for(i = 0; i < var_79d43d2f; i++)
	{
		var_8b63a38e = 0;
		var_a7a99675 = undefined;
		while(!isdefined(var_a7a99675) && var_8b63a38e < 5)
		{
			point = function_72c54d21(origin, height, outer_radius, inner_radius);
			var_a7a99675 = function_6b273d22(origin, point, outer_radius, inner_radius, !var_632ad0e5);
			if(isdefined(var_a7a99675))
			{
				if(var_f0ee0fcd)
				{
					spawn_points[spawn_points.size] = var_a7a99675 - origin;
				}
				else
				{
					angles = origin - var_a7a99675;
					spawn_points[spawn_points.size] = {#angles:(0, angles[1], 0), #origin:var_a7a99675};
				}
			}
			else
			{
				var_8b63a38e++;
			}
			var_ec81389d++;
			if(var_362d6269 && (var_ec81389d % var_fa7134f3) == 0)
			{
				waitframe(1);
			}
		}
	}
	return spawn_points;
}

/*
	Name: function_7a1b21f6
	Namespace: namespace_85745671
	Checksum: 0x2D963C6A
	Offset: 0xA8F8
	Size: 0x1E6
	Parameters: 8
	Flags: Linked
*/
function function_7a1b21f6(origin, angles, var_79d43d2f, width, length, height, var_f0ee0fcd, var_362d6269)
{
	if(!isdefined(var_f0ee0fcd))
	{
		var_f0ee0fcd = 0;
	}
	if(!isdefined(var_362d6269))
	{
		var_362d6269 = 1;
	}
	level endon(#"game_ended");
	var_ec81389d = 0;
	spawn_points = [];
	for(i = 0; i < var_79d43d2f; i++)
	{
		var_8b63a38e = 0;
		var_a7a99675 = undefined;
		while(!isdefined(var_a7a99675) && var_8b63a38e < 5)
		{
			point = function_81a53f3b(origin, angles, width, length, height);
			var_a7a99675 = function_5f4ef4d0(origin, angles, point, width, length, height);
			if(isdefined(var_a7a99675))
			{
				if(var_f0ee0fcd)
				{
					spawn_points[spawn_points.size] = var_a7a99675 - origin;
				}
				else
				{
					final_angles = origin - var_a7a99675;
					spawn_points[spawn_points.size] = {#angles:(0, final_angles[1], 0), #origin:var_a7a99675};
				}
			}
			else
			{
				var_8b63a38e++;
			}
			var_ec81389d++;
			if(var_362d6269 && (var_ec81389d % 3) == 0)
			{
				waitframe(1);
			}
		}
	}
	return spawn_points;
}

/*
	Name: function_af5f7fc8
	Namespace: namespace_85745671
	Checksum: 0xD15B5C6A
	Offset: 0xAAE8
	Size: 0x122
	Parameters: 5
	Flags: None
*/
function function_af5f7fc8(id, var_44f5a49b, origin, angles, targetname)
{
	/#
		assert(isdefined(id) && isdefined(var_44f5a49b));
	#/
	if(!isdefined(level.var_754b2a4a))
	{
		level.var_754b2a4a = [];
	}
	if(!isdefined(level.var_754b2a4a[id]))
	{
		level.var_754b2a4a[id] = namespace_679a22ba::function_77be8a83(var_44f5a49b);
	}
	spawn_info = namespace_679a22ba::function_ca209564(var_44f5a49b, level.var_754b2a4a[id]);
	if(!isdefined(spawn_info))
	{
		return undefined;
	}
	var_944250d2 = spawnactor(spawn_info.var_990b33df, origin, angles, targetname, 1);
	if(isdefined(var_944250d2))
	{
		var_944250d2.var_29459a31 = spawn_info.var_29459a31;
	}
	return var_944250d2;
}

/*
	Name: function_eb8e8b81
	Namespace: namespace_85745671
	Checksum: 0xF72D6DC
	Offset: 0xAC18
	Size: 0x38
	Parameters: 1
	Flags: None
*/
function function_eb8e8b81(id)
{
	if(!isdefined(level.var_754b2a4a))
	{
		level.var_754b2a4a = [];
	}
	level.var_754b2a4a[id] = undefined;
}

/*
	Name: function_6c308e81
	Namespace: namespace_85745671
	Checksum: 0x8C2B7E79
	Offset: 0xAC58
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_6c308e81()
{
	if(is_true(level.is_survival))
	{
		self thread function_625a781d();
	}
	else
	{
		self thread play_ambient_zombie_vocals();
	}
}

/*
	Name: play_ambient_zombie_vocals
	Namespace: namespace_85745671
	Checksum: 0x5031FE33
	Offset: 0xACB0
	Size: 0x188
	Parameters: 0
	Flags: Linked
*/
function play_ambient_zombie_vocals()
{
	self endon(#"death");
	self thread function_b8c2c5cc();
	while(true)
	{
		type = "ambient";
		float = 3;
		if(isdefined(self.aistate))
		{
			switch(self.aistate)
			{
				case 0:
				case 1:
				case 2:
				case 4:
				{
					type = "ambient";
					float = 3;
					break;
				}
				case 3:
				{
					type = "sprint";
					float = 3;
					break;
				}
			}
		}
		if(is_true(self.missinglegs))
		{
			float = 2;
			type = "crawler";
		}
		function_6eac4ca1(self, type);
		self notify(#"bhtn_action_notify", {#action:type});
		wait(randomfloatrange(1, float));
	}
}

/*
	Name: function_625a781d
	Namespace: namespace_85745671
	Checksum: 0xDC8005F4
	Offset: 0xAE40
	Size: 0x1B0
	Parameters: 0
	Flags: Linked
*/
function function_625a781d()
{
	self endon(#"death");
	self thread function_c2be61f2();
	while(true)
	{
		type = "ambient";
		float = 3;
		if(isdefined(self.current_state))
		{
			switch(self.current_state.name)
			{
				case "investigate":
				case "wander":
				{
					type = "ambient";
					float = 3;
					break;
				}
				case "chase":
				{
					type = "sprint";
					float = 3;
					break;
				}
			}
		}
		if(is_true(self.missinglegs))
		{
			float = 2;
			type = "crawler";
		}
		function_6eac4ca1(self, type);
		self notify(#"bhtn_action_notify", {#action:type});
		wait(0.1);
		while(is_true(self.talking))
		{
			wait(0.1);
		}
		wait(randomfloatrange(0.25, 1.5));
	}
}

/*
	Name: function_b8c2c5cc
	Namespace: namespace_85745671
	Checksum: 0xEAA9D30C
	Offset: 0xAFF8
	Size: 0x78
	Parameters: 0
	Flags: Linked
*/
function function_b8c2c5cc()
{
	self endon(#"death", #"disconnect");
	while(true)
	{
		self waittill(#"hash_795f82c293077362");
		if(self.aistate == 3)
		{
			function_6eac4ca1(self, "chase_state_start");
		}
	}
}

/*
	Name: function_c2be61f2
	Namespace: namespace_85745671
	Checksum: 0x7704E055
	Offset: 0xB078
	Size: 0x98
	Parameters: 0
	Flags: Linked
*/
function function_c2be61f2()
{
	self endon(#"death", #"disconnect");
	while(true)
	{
		self waittill(#"state_changed");
		waitframe(1);
		if(isdefined(self.current_state) && self.current_state.name == #"chase")
		{
			function_6eac4ca1(self, "chase_state_start");
		}
	}
}

