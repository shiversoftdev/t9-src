#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_350cffecd05ef6cf;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_74a56359b7d02ab6;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_9038b9d9;

/*
	Name: function_6ec0595a
	Namespace: namespace_9038b9d9
	Checksum: 0xBF9C4944
	Offset: 0x2E0
	Size: 0x24E
	Parameters: 0
	Flags: Linked
*/
function function_6ec0595a()
{
	self notify("504669bff9236601");
	self endon("504669bff9236601");
	if(isplayer(self))
	{
		self endon(#"disconnect");
	}
	self endon(#"death");
	self endon(#"player_died");
	if(!isdefined(self.doa.tesla_org))
	{
		org = namespace_ec06fe4a::function_e22ae9b3(self.origin, "tag_origin");
		if(!isdefined(org))
		{
			return;
		}
		org enablelinkto();
		org.targetname = "tesla_org";
		org.angles = (0, randomint(180), 0);
		self.doa.tesla_org = org;
		org.owner = self;
		org.objects = [];
		org linkto(self, "tag_origin", vectorscale((0, 0, 1), 30));
		org thread namespace_ec06fe4a::function_f506b4c7(1);
		org thread watchforcleanup(self);
		self thread function_8efc825c(org);
	}
	self function_dd76db7c(self.doa.tesla_org);
	timeout = self doa_fate::function_4808b985(30);
	while(!doa_pickups::function_f759a457())
	{
		waitframe(1);
	}
	wait(timeout);
	if(isdefined(self.doa.tesla_org))
	{
		self.doa.tesla_org notify(#"hash_44e59870e1833e7");
	}
	self notify(#"hash_5c369acbb01ea11");
}

/*
	Name: function_9b8a196a
	Namespace: namespace_9038b9d9
	Checksum: 0xDD509F4
	Offset: 0x538
	Size: 0x1C0
	Parameters: 0
	Flags: Linked
*/
function function_9b8a196a()
{
	ball = namespace_ec06fe4a::function_e22ae9b3(self.origin, "zombietron_tesla_ball");
	if(!isdefined(ball))
	{
		return;
	}
	ball setplayercollision(0);
	ball enablelinkto();
	ball.targetname = "teslaBall";
	ball thread function_453dcc55();
	trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", ball.origin, (1 | 512) | 8, 18, 50);
	if(!isdefined(trigger))
	{
		ball delete();
		return;
	}
	trigger.targetname = "teslaTrigger";
	trigger enablelinkto();
	trigger linkto(ball);
	trigger thread function_49ee8def();
	trigger.ball = ball;
	ball.trigger = trigger;
	ball namespace_83eb6304::function_3ecfde67("tesla_trail");
	ball namespace_83eb6304::function_3ecfde67("tesla_ball");
	ball namespace_e32bb68::function_3a59ec34("evt_doa_pickup_teslaball_active_lp");
	return ball;
}

/*
	Name: function_dd76db7c
	Namespace: namespace_9038b9d9
	Checksum: 0x88A8BBA8
	Offset: 0x700
	Size: 0x2DC
	Parameters: 1
	Flags: Linked
*/
function function_dd76db7c(org)
{
	angle = randomint(360);
	var_eb19ca0d = rotatepointaroundaxis(vectorscale((1, 0, 0), 60), (0, 0, 1), org.angles[1] + angle);
	var_19e02799 = rotatepointaroundaxis(vectorscale((1, 0, 0), 60), (0, 0, 1), (org.angles[1] + angle) + 180);
	var_7ccfed7b = rotatepointaroundaxis(vectorscale((1, 0, 0), 60), (0, 0, 1), (org.angles[1] + angle) + 90);
	var_6b8d4af6 = rotatepointaroundaxis(vectorscale((1, 0, 0), 60), (0, 0, 1), (org.angles[1] + angle) - 90);
	ball = function_9b8a196a();
	if(isdefined(ball))
	{
		ball.org = org;
		ball linkto(org, "tag_origin", var_eb19ca0d);
		org.objects[org.objects.size] = ball;
	}
	ball = function_9b8a196a();
	if(isdefined(ball))
	{
		ball.org = org;
		ball linkto(org, "tag_origin", var_19e02799);
		org.objects[org.objects.size] = ball;
	}
	ball = function_9b8a196a();
	if(isdefined(ball))
	{
		ball.org = org;
		ball linkto(org, "tag_origin", var_7ccfed7b);
		org.objects[org.objects.size] = ball;
	}
	ball = function_9b8a196a();
	if(isdefined(ball))
	{
		ball.org = org;
		ball linkto(org, "tag_origin", var_6b8d4af6);
		org.objects[org.objects.size] = ball;
	}
}

/*
	Name: function_453dcc55
	Namespace: namespace_9038b9d9
	Checksum: 0xC032A12C
	Offset: 0x9E8
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function function_453dcc55()
{
	self notify("12a6bbadf7d75f0d");
	self endon("12a6bbadf7d75f0d");
	self endon(#"death");
	self waittill(#"hash_44e59870e1833e7");
	if(isdefined(self.trigger))
	{
		self.trigger delete();
	}
	self unlink();
	vel = (self.org.origin - self.origin) + vectorscale((0, 0, 1), 50);
	self thread function_f50d3546(self.org, vel);
	wait(5);
	self delete();
}

/*
	Name: function_f50d3546
	Namespace: namespace_9038b9d9
	Checksum: 0x79949CEE
	Offset: 0xAE0
	Size: 0xC4
	Parameters: 2
	Flags: Linked
*/
function function_f50d3546(org, vel)
{
	self moveto(org.origin, 0.5);
	self waittilltimeout(1, #"movedone");
	vel = vel * 0.25;
	self namespace_83eb6304::function_3ecfde67("tesla_launch");
	self namespace_e32bb68::function_ae271c0b("evt_doa_pickup_teslaball_active_lp");
	self physicslaunch(self.origin, vel);
}

/*
	Name: watchforcleanup
	Namespace: namespace_9038b9d9
	Checksum: 0xA7D5358A
	Offset: 0xBB0
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function watchforcleanup(owner)
{
	self notify("6ed3af9293313a");
	self endon("6ed3af9293313a");
	self endon(#"death");
	self endon(#"hash_5c369acbb01ea11");
	self waittill(#"hash_44e59870e1833e7");
	foreach(obj in self.objects)
	{
		if(isdefined(obj))
		{
			obj notify(#"hash_44e59870e1833e7");
		}
	}
	if(isdefined(owner))
	{
		owner namespace_e32bb68::function_3a59ec34("evt_doa_pickup_teslaball_active_end");
		owner.doa.tesla_org = undefined;
	}
	waitframe(1);
	self delete();
}

/*
	Name: function_8efc825c
	Namespace: namespace_9038b9d9
	Checksum: 0xB760ACDB
	Offset: 0xCF8
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function function_8efc825c(org)
{
	self notify("3855061df1c54fcc");
	self endon("3855061df1c54fcc");
	self endon(#"hash_5c369acbb01ea11");
	self waittill(#"disconnect", #"entering_last_stand", #"death", #"player_died", #"clone_shutdown");
	if(isdefined(org))
	{
		org notify(#"hash_44e59870e1833e7");
	}
}

/*
	Name: function_49ee8def
	Namespace: namespace_9038b9d9
	Checksum: 0x3D490B48
	Offset: 0xDA8
	Size: 0x100
	Parameters: 0
	Flags: Linked
*/
function function_49ee8def()
{
	self endon(#"death");
	while(true)
	{
		result = undefined;
		result = self waittill(#"trigger");
		guy = result.activator;
		if(isplayer(guy))
		{
			continue;
		}
		if(is_true(guy.boss))
		{
			continue;
		}
		result = level function_8d45f3be(guy, self.ball.org.owner);
		if(result)
		{
			self.ball delete();
			self delete();
		}
	}
}

/*
	Name: function_8d45f3be
	Namespace: namespace_9038b9d9
	Checksum: 0x6163611D
	Offset: 0xEB0
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_8d45f3be(guy, attacker)
{
	if(!isdefined(guy))
	{
		return;
	}
	if(isdefined(guy.damagedby) && guy.damagedby == "tesla" || is_true(guy.tesla_death))
	{
		return false;
	}
	if(tesla_ok_to_discharge(attacker))
	{
		guy.damagedby = "tesla";
		guy thread tesla_damage_init(attacker);
		return true;
	}
	return false;
}

/*
	Name: tesla_ok_to_discharge
	Namespace: namespace_9038b9d9
	Checksum: 0xEBC3EF05
	Offset: 0xF70
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function tesla_ok_to_discharge(player)
{
	if(!isdefined(player.tesla_discharge))
	{
		return true;
	}
	if(player.tesla_discharge == 0)
	{
		return false;
	}
	return true;
}

/*
	Name: tesla_damage_init
	Namespace: namespace_9038b9d9
	Checksum: 0x81483A78
	Offset: 0xFB8
	Size: 0xD6
	Parameters: 1
	Flags: Linked
*/
function tesla_damage_init(player)
{
	if(!isdefined(player))
	{
		return;
	}
	if(isplayer(player))
	{
		player endon(#"disconnect");
	}
	player endon(#"death");
	player.tesla_enemies = undefined;
	player.tesla_enemies_hit = 1;
	player.tesla_powerup_dropped = 0;
	player notify(#"tesla_discharged");
	self namespace_83eb6304::function_3ecfde67("tesla_shock");
	self tesla_arc_damage(self, player, 0);
	player.tesla_enemies_hit = 0;
}

/*
	Name: tesla_arc_damage
	Namespace: namespace_9038b9d9
	Checksum: 0xE6AE6693
	Offset: 0x1098
	Size: 0x2A0
	Parameters: 3
	Flags: Linked
*/
function tesla_arc_damage(source_enemy, player, arc_num)
{
	if(isplayer(player))
	{
		player endon(#"disconnect");
	}
	player endon(#"death");
	tesla_flag_hit(self, 1);
	radius_decay = getdvarint(#"hash_3eb3a662a40de94a", 20) * arc_num;
	enemies = tesla_get_enemies_in_area(self gettagorigin("j_head"), getdvarint(#"hash_28fd9a5b3176c120", 300) - radius_decay, player);
	tesla_flag_hit(enemies, 1);
	self thread tesla_do_damage(source_enemy, arc_num, player);
	foreach(guy in enemies)
	{
		if(!isactor(guy))
		{
			continue;
		}
		if(guy == self)
		{
			continue;
		}
		if(is_true(guy.var_d415ee14) || is_true(guy.boss))
		{
			continue;
		}
		if(tesla_end_arc_damage(arc_num + 1, player.tesla_enemies_hit))
		{
			tesla_flag_hit(guy, 0);
			continue;
		}
		player.tesla_enemies_hit++;
		guy thread tesla_arc_damage(self, player, arc_num + 1);
	}
}

/*
	Name: tesla_end_arc_damage
	Namespace: namespace_9038b9d9
	Checksum: 0xC92567FC
	Offset: 0x1340
	Size: 0xE8
	Parameters: 2
	Flags: Linked
*/
function tesla_end_arc_damage(arc_num, enemies_hit_num)
{
	if(arc_num >= getdvarint(#"hash_7ec1e8e3c113c497", 5))
	{
		return true;
	}
	if(enemies_hit_num >= getdvarint(#"hash_29241bffeb128947", 20))
	{
		return true;
	}
	radius_decay = getdvarint(#"hash_3eb3a662a40de94a", 20) * arc_num;
	if((getdvarint(#"hash_28fd9a5b3176c120", 300) - radius_decay) <= 0)
	{
		return true;
	}
	return false;
}

/*
	Name: tesla_get_enemies_in_area
	Namespace: namespace_9038b9d9
	Checksum: 0x40B3F7A6
	Offset: 0x1430
	Size: 0x1E6
	Parameters: 3
	Flags: Linked
*/
function tesla_get_enemies_in_area(origin, distance, player)
{
	if(!isdefined(origin))
	{
		return [];
	}
	distance_squared = distance * distance;
	enemies = [];
	if(!isdefined(player.tesla_enemies))
	{
		team = util::getotherteam(player.team);
		player.tesla_enemies = getaiteamarray(team);
		player.tesla_enemies = arraysortclosest(player.tesla_enemies, origin);
	}
	foreach(zombie in player.tesla_enemies)
	{
		if(!isdefined(zombie))
		{
			continue;
		}
		if(!isactor(zombie))
		{
			continue;
		}
		if(is_true(zombie.zombie_tesla_hit))
		{
			continue;
		}
		test_origin = zombie gettagorigin("j_head");
		if(distancesquared(origin, test_origin) > distance_squared)
		{
			continue;
		}
		if(!bullettracepassed(origin, test_origin, 0, undefined))
		{
			continue;
		}
		enemies[enemies.size] = zombie;
	}
	return enemies;
}

/*
	Name: tesla_flag_hit
	Namespace: namespace_9038b9d9
	Checksum: 0xCE07725D
	Offset: 0x1620
	Size: 0x76
	Parameters: 2
	Flags: Linked
*/
function tesla_flag_hit(enemy, hit)
{
	if(!isdefined(enemy))
	{
		return;
	}
	if(isarray(enemy))
	{
		for(i = 0; i < enemy.size; i++)
		{
			enemy[i].zombie_tesla_hit = hit;
		}
	}
	else
	{
		enemy.zombie_tesla_hit = hit;
	}
}

/*
	Name: tesla_do_damage
	Namespace: namespace_9038b9d9
	Checksum: 0x35564E76
	Offset: 0x16A0
	Size: 0x1C4
	Parameters: 3
	Flags: Linked
*/
function tesla_do_damage(source_enemy, arc_num, player)
{
	if(isplayer(player))
	{
		player endon(#"disconnect");
	}
	timetowait = 0.2 * arc_num;
	if(timetowait > 0)
	{
		wait(timetowait);
	}
	if(!isdefined(self) || !isalive(self))
	{
		return;
	}
	if(isdefined(source_enemy) && source_enemy != self)
	{
		source_enemy tesla_play_arc_fx(self);
	}
	if(!isdefined(self) || !isalive(self))
	{
		return;
	}
	self.tesla_death = 1;
	self thread tesla_play_death_fx(arc_num);
	origin = player.origin;
	if(isdefined(source_enemy) && source_enemy != self)
	{
		origin = source_enemy.origin;
	}
	self thread namespace_ec06fe4a::function_570729f0(0.1, player);
	if(self.archetype == "zombie")
	{
		self namespace_ed80aead::function_c25b3c76();
	}
	if(self.archetype == "robot")
	{
		self namespace_ed80aead::function_586ef822();
	}
}

/*
	Name: tesla_play_death_fx
	Namespace: namespace_9038b9d9
	Checksum: 0x4688A05B
	Offset: 0x1870
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function tesla_play_death_fx(arc_num)
{
	if(arc_num > 1)
	{
		self namespace_83eb6304::function_3ecfde67("tesla_shock_eyes");
	}
	self namespace_83eb6304::function_3ecfde67("tesla_shock");
	self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_teslaball_impact");
	level namespace_ed80aead::trygibbinghead(self, 100);
}

/*
	Name: tesla_play_arc_fx
	Namespace: namespace_9038b9d9
	Checksum: 0x80B9949
	Offset: 0x1910
	Size: 0x254
	Parameters: 1
	Flags: Linked
*/
function tesla_play_arc_fx(target)
{
	if(!isdefined(self) || !isdefined(target))
	{
		wait(getdvarfloat(#"hash_d68c28b3c93b18f", 0.05));
		return;
	}
	tag = "J_SpineUpper";
	if(is_true(self.isdog))
	{
		tag = "J_Spine1";
	}
	target_tag = "J_SpineUpper";
	if(is_true(target.isdog))
	{
		target_tag = "J_Spine1";
	}
	origin = self gettagorigin(tag);
	target_origin = target gettagorigin(target_tag);
	distsq = distancesquared(origin, target_origin);
	var_1a24eda0 = distsq / sqr(128);
	timemove = var_1a24eda0 * getdvarfloat(#"hash_d68c28b3c93b18f", 0.05);
	if(timemove < 0.2)
	{
		timemove = 0.2;
	}
	fxorg = namespace_ec06fe4a::function_e22ae9b3(origin, "tag_origin");
	if(isdefined(fxorg))
	{
		fxorg.targetname = "tesla_trail";
		fxorg namespace_83eb6304::function_3ecfde67("tesla_trail");
		fxorg moveto(target_origin, timemove);
		fxorg waittilltimeout(timemove + 1, #"movedone");
		fxorg delete();
	}
}

