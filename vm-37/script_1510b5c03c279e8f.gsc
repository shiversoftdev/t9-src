#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1b01e95a6b5270fd;
#using script_1b905a8474ed2a62;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_3aa0f32b70d4f7cb;
#using script_47851dbeea22fe66;
#using script_4d85e8de54b02198;
#using script_522aeb6ae906391e;
#using script_5701633066d199f2;
#using script_59f07c660e6710a5;
#using script_5f20d3b434d24884;
#using script_7b7ed6e4bc963a51;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\statemachine_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace namespace_7457b8d5;

/*
	Name: init
	Namespace: namespace_7457b8d5
	Checksum: 0xCA88B1F0
	Offset: 0x248
	Size: 0x5E
	Parameters: 0
	Flags: Linked
*/
function init()
{
	namespace_250e9486::function_252dff4d("spider", 14, &function_66da4f00, &function_9bb842bf, 65, &function_75f88bcf);
	level.doa.var_5b56a42c = 0;
}

/*
	Name: function_75f88bcf
	Namespace: namespace_7457b8d5
	Checksum: 0x622E7E40
	Offset: 0x2B0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_75f88bcf()
{
	return level.doa.var_5b56a42c < 15;
}

/*
	Name: function_9bb842bf
	Namespace: namespace_7457b8d5
	Checksum: 0x80F724D1
	Offset: 0x2D8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_9bb842bf()
{
}

/*
	Name: function_66da4f00
	Namespace: namespace_7457b8d5
	Checksum: 0xE7F7B24A
	Offset: 0x2E8
	Size: 0x27C
	Parameters: 0
	Flags: Linked
*/
function function_66da4f00()
{
	level.doa.var_5b56a42c++;
	namespace_250e9486::function_25b2c8a9();
	self.fovcosine = 0;
	self.fovcosinebusy = 0;
	self.delete_on_death = 1;
	self.maxhealth = 2000;
	self.health = self.maxhealth;
	self useanimtree("generic");
	self vehicle::friendly_fire_shield();
	/#
		assert(isdefined(self.scriptbundlesettings));
	#/
	self.settings = getscriptbundle(self.scriptbundlesettings);
	self enableaimassist();
	self turretsetontargettolerance(0, 3);
	self setdrawinfrared(1);
	self setvehicleavoidance(1);
	blackboard::createblackboardforentity(self);
	self blackboard::registervehicleblackboardattributes();
	self setneargoalnotifydist(40);
	self.goalradius = 60;
	self.goalheight = 128;
	self.var_651e2d9b = 0.2;
	self setgoal(self.origin, 0, 1);
	self force_get_enemies();
	self.overridevehicledamage = &spider_callback_damage;
	self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_spider_spawn");
	self thread vehicle_ai::nudge_collision();
	if(isdefined(level.vehicle_initializer_cb))
	{
		[[level.vehicle_initializer_cb]](self);
	}
	self asmrequestsubstate("locomotion@movement");
	defaultrole();
}

/*
	Name: defaultrole
	Namespace: namespace_7457b8d5
	Checksum: 0xDD53E6FE
	Offset: 0x570
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function defaultrole()
{
	self vehicle_ai::init_state_machine_for_role("default");
	self vehicle_ai::get_state_callbacks("combat").update_func = &state_range_combat_update;
	self vehicle_ai::get_state_callbacks("death").update_func = &state_death_update;
	self vehicle_ai::get_state_callbacks("driving").update_func = &state_driving_update;
	self vehicle_ai::add_state("meleeCombat", undefined, &state_melee_combat_update, undefined);
	vehicle_ai::add_utility_connection("combat", "meleeCombat", &should_switch_to_melee);
	vehicle_ai::add_utility_connection("meleeCombat", "combat", &should_switch_to_range);
	self vehicle_ai::call_custom_add_state_callbacks();
	vehicle_ai::startinitialstate("combat");
}

/*
	Name: state_death_update
	Namespace: namespace_7457b8d5
	Checksum: 0x6C4698DD
	Offset: 0x6E8
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function state_death_update(params)
{
	self endon(#"death");
	self namespace_83eb6304::function_3ecfde67("egg_explode");
	self asmrequestsubstate("death@stationary");
	vehicle_ai::waittill_asm_complete("death@stationary", 2);
	level.doa.var_5b56a42c--;
	if(level.doa.var_5b56a42c < 0)
	{
		level.doa.var_5b56a42c = 0;
	}
	self vehicle_death::death_fx();
	vehicle_death::deletewhensafe();
}

/*
	Name: state_driving_update
	Namespace: namespace_7457b8d5
	Checksum: 0xD5708227
	Offset: 0x7D0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function state_driving_update(params)
{
	self endon(#"change_state");
	self endon(#"death");
	self asmrequestsubstate("locomotion@movement");
}

/*
	Name: getnextmoveposition_ranged
	Namespace: namespace_7457b8d5
	Checksum: 0xFDB38806
	Offset: 0x828
	Size: 0x76E
	Parameters: 1
	Flags: Linked
*/
function getnextmoveposition_ranged(enemy)
{
	if(self.goalforced)
	{
		return self.goalpos;
	}
	selfdisttotarget = distance2d(self.origin, enemy.origin);
	gooddist = 0.5 * (self.settings.engagementdistmin + self.settings.engagementdistmax);
	tooclosedist = 150;
	closedist = 1.2 * gooddist;
	fardist = 3 * gooddist;
	querymultiplier = mapfloat(closedist, fardist, 1, 3, selfdisttotarget);
	prefereddistawayfromorigin = 300;
	randomness = 30;
	queryresult = positionquery_source_navigation(self.origin, 80, 300 * querymultiplier, 150, (2 * self.radius) * querymultiplier, self, (1 * self.radius) * querymultiplier);
	positionquery_filter_distancetogoal(queryresult, self);
	vehicle_ai::positionquery_filter_outofgoalanchor(queryresult);
	positionquery_filter_inclaimedlocation(queryresult, self);
	vehicle_ai::positionquery_filter_engagementdist(queryresult, enemy, self.settings.engagementdistmin, self.settings.engagementdistmax);
	if(isdefined(self.avoidentities) && isdefined(self.avoidentitiesdistance))
	{
		vehicle_ai::positionquery_filter_distawayfromtarget(queryresult, self.avoidentities, self.avoidentitiesdistance, -500);
	}
	best_point = undefined;
	best_score = 999999;
	foreach(point in queryresult.data)
	{
		/#
			if(!isdefined(point._scoredebug))
			{
				point._scoredebug = [];
			}
			if(!isdefined(point._scoredebug[#"disttoorigin"]))
			{
				point._scoredebug[#"disttoorigin"] = spawnstruct();
			}
			point._scoredebug[#"disttoorigin"].score = mapfloat(0, prefereddistawayfromorigin, 0, 300, point.disttoorigin2d);
			point._scoredebug[#"disttoorigin"].scorename = "";
		#/
		point.score = point.score + mapfloat(0, prefereddistawayfromorigin, 0, 300, point.disttoorigin2d);
		if(point.inclaimedlocation)
		{
			/#
				if(!isdefined(point._scoredebug))
				{
					point._scoredebug = [];
				}
				if(!isdefined(point._scoredebug[#"inclaimedlocation"]))
				{
					point._scoredebug[#"inclaimedlocation"] = spawnstruct();
				}
				point._scoredebug[#"inclaimedlocation"].score = -500;
				point._scoredebug[#"inclaimedlocation"].scorename = "";
			#/
			point.score = point.score + -500;
		}
		/#
			if(!isdefined(point._scoredebug))
			{
				point._scoredebug = [];
			}
			if(!isdefined(point._scoredebug[#"random"]))
			{
				point._scoredebug[#"random"] = spawnstruct();
			}
			point._scoredebug[#"random"].score = randomfloatrange(0, randomness);
			point._scoredebug[#"random"].scorename = "";
		#/
		point.score = point.score + randomfloatrange(0, randomness);
		/#
			if(!isdefined(point._scoredebug))
			{
				point._scoredebug = [];
			}
			if(!isdefined(point._scoredebug[#"engagementdist"]))
			{
				point._scoredebug[#"engagementdist"] = spawnstruct();
			}
			point._scoredebug[#"engagementdist"].score = point.distawayfromengagementarea * -1;
			point._scoredebug[#"engagementdist"].scorename = "";
		#/
		point.score = point.score + (point.distawayfromengagementarea * -1);
		if(point.score > best_score)
		{
			best_score = point.score;
			best_point = point;
		}
	}
	self vehicle_ai::positionquery_debugscores(queryresult);
	/#
		self.debug_ai_move_to_points_considered = queryresult.data;
	#/
	if(!isdefined(best_point))
	{
		return undefined;
	}
	/#
		if(is_true(getdvarint(#"hkai_debugpositionquery")))
		{
			recordline(self.origin, best_point.origin, (0.3, 1, 0));
			recordline(self.origin, enemy.origin, (1, 0, 0.4));
		}
	#/
	return best_point.origin;
}

/*
	Name: state_range_combat_update
	Namespace: namespace_7457b8d5
	Checksum: 0xDA71462C
	Offset: 0xFA0
	Size: 0x22E
	Parameters: 1
	Flags: Linked
*/
function state_range_combat_update(params)
{
	self endon(#"change_state");
	self endon(#"death");
	self.pathfailcount = 0;
	self.foundpath = 1;
	self util::cooldown("state_change", 2);
	self thread prevent_stuck();
	self thread nudge_collision();
	self thread state_range_combat_attack();
	self setspeed(self.settings.defaultmovespeed);
	self asmrequestsubstate("locomotion@movement");
	self.dont_move = undefined;
	for(;;)
	{
		if(!isdefined(self.enemy))
		{
			self force_get_enemies();
			wait(0.1);
			continue;
		}
		else if(self.dont_move === 1)
		{
			wait(0.1);
			continue;
		}
		if(isdefined(self.can_reach_enemy))
		{
			if(!self [[self.can_reach_enemy]]())
			{
				wait(0.1);
				continue;
			}
		}
		if(!self seerecently(self.enemy, 5))
		{
			self.current_pathto_pos = spider_get_target_position();
		}
		else
		{
			self.current_pathto_pos = getnextmoveposition_ranged(self.enemy);
		}
		if(isdefined(self.current_pathto_pos))
		{
			self function_a57c34b7(self.current_pathto_pos, 0, 1);
			self vehicle_ai::waittill_pathing_done();
		}
		waitframe(1);
	}
}

/*
	Name: state_range_combat_attack
	Namespace: namespace_7457b8d5
	Checksum: 0x40B6D86B
	Offset: 0x11D8
	Size: 0x2C0
	Parameters: 0
	Flags: Linked
*/
function state_range_combat_attack()
{
	self endon(#"change_state");
	self endon(#"death");
	for(;;)
	{
		state_params = spawnstruct();
		state_params.playtransition = 1;
		self vehicle_ai::evaluate_connections(undefined, state_params);
		if(!isdefined(self.enemy))
		{
			wait(0.1);
			continue;
		}
		can_attack = 1;
		foreach(player in level.players)
		{
			self getperfectinfo(player, 0);
			if(player.b_is_designated_target === 1 && self.enemy.b_is_designated_target !== 1)
			{
				self getperfectinfo(player, 1);
				self setpersonalthreatbias(player, 100000, 2);
				can_attack = 0;
			}
		}
		if(can_attack)
		{
			if(self cansee(self.enemy))
			{
				self vehlookat(self.enemy);
				self turretsettarget(0, self.enemy);
			}
			if(distance2dsquared(self.origin, self.enemy.origin) < (sqr(self.settings.engagementdistmax * 1.5)) && util::iscooldownready("rocket") && self cansee(self.enemy))
			{
				self do_ranged_attack(self.enemy);
				wait(0.5);
			}
		}
		wait(0.1);
	}
}

/*
	Name: do_ranged_attack
	Namespace: namespace_7457b8d5
	Checksum: 0xA3788685
	Offset: 0x14A0
	Size: 0x316
	Parameters: 1
	Flags: Linked
*/
function do_ranged_attack(enemy)
{
	self notify(#"near_goal");
	self endon(#"death");
	self vehicle_ai::clearallmovement(1);
	self.dont_move = 1;
	self vehlookat(enemy);
	self turretsettarget(0, enemy);
	self function_a57c34b7(enemy.origin, 0, 0);
	self setgoal(enemy.origin, 0, 0);
	targetanglediff = 30;
	v_to_enemy = (enemy.origin - self.origin[0], enemy.origin - self.origin[1], 0);
	goalangles = vectortoangles(v_to_enemy);
	anglediff = absangleclamp180(self.angles[1] - goalangles[1]);
	angleadjustingstart = gettime();
	while(anglediff > targetanglediff && util::timesince(angleadjustingstart) < 0.8)
	{
		anglediff = absangleclamp180(self.angles[1] - goalangles[1]);
		waitframe(1);
	}
	self vehicle_ai::clearallmovement(1);
	if(anglediff <= targetanglediff && isdefined(enemy))
	{
		enemy thread function_f7d9bc34();
		wait(0.75);
		self asmrequestsubstate("fire@stationary");
		timedout = undefined;
		timedout = self waittilltimeout(5, #"spider_fire");
		if(timedout._notify !== #"timeout")
		{
			self fireweapon();
			self util::cooldown("rocket", 3);
			self vehicle_ai::waittill_asm_complete("fire@stationary", 5);
		}
	}
	self asmrequestsubstate("locomotion@movement");
	self.dont_move = undefined;
}

/*
	Name: function_f7d9bc34
	Namespace: namespace_7457b8d5
	Checksum: 0xFFC6F5F5
	Offset: 0x17C0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_f7d9bc34()
{
	self endon(#"disconnect");
	self namespace_83eb6304::function_3ecfde67("incoming_impact");
	wait(1.2);
	if(isdefined(self))
	{
		self namespace_83eb6304::turnofffx("incoming_impact");
	}
}

/*
	Name: switch_to_melee
	Namespace: namespace_7457b8d5
	Checksum: 0xDCDE33BA
	Offset: 0x1830
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function switch_to_melee()
{
	self.switch_to_melee = 1;
}

/*
	Name: should_switch_to_melee
	Namespace: namespace_7457b8d5
	Checksum: 0xD6C36723
	Offset: 0x1850
	Size: 0x50
	Parameters: 3
	Flags: Linked
*/
function should_switch_to_melee(from_state, to_state, connection)
{
	if(!util::iscooldownready("state_change"))
	{
		return false;
	}
	if(!isdefined(self.enemy))
	{
		return false;
	}
	return true;
}

/*
	Name: state_melee_combat_update
	Namespace: namespace_7457b8d5
	Checksum: 0x94D71294
	Offset: 0x18A8
	Size: 0x9A4
	Parameters: 1
	Flags: Linked
*/
function state_melee_combat_update(params)
{
	self endon(#"change_state");
	self endon(#"death");
	self util::cooldown("state_change", 8);
	self thread prevent_stuck();
	self thread nudge_collision();
	self thread state_melee_combat_attack();
	self.pathfailcount = 0;
	self.switch_to_melee = undefined;
	self setspeed(self.settings.defaultmovespeed * 1.5);
	self asmrequestsubstate("locomotion@movement");
	self.dont_move = undefined;
	wait(0.5);
	for(;;)
	{
		foreach(player in level.players)
		{
			self getperfectinfo(player, 1);
			if(player.b_is_designated_target === 1)
			{
				self setpersonalthreatbias(player, 100000, 3);
			}
		}
		if(!isdefined(self.enemy))
		{
			self force_get_enemies();
			wait(0.1);
			continue;
		}
		else if(self.dont_move === 1)
		{
			wait(0.1);
			continue;
		}
		if(isdefined(self.can_reach_enemy))
		{
			if(!self [[self.can_reach_enemy]]())
			{
				wait(0.1);
				continue;
			}
		}
		self.foundpath = 0;
		targetpos = spider_get_target_position();
		if(isdefined(targetpos))
		{
			if(distancesquared(self.origin, targetpos) > sqr(1300) && self isposinclaimedlocation(targetpos))
			{
				queryresult = positionquery_source_navigation(targetpos, 0, self.settings.max_move_dist, self.settings.max_move_dist, self.radius, self);
				positionquery_filter_inclaimedlocation(queryresult, self.enemy);
				best_point = undefined;
				best_score = 999999;
				foreach(point in queryresult.data)
				{
					/#
						if(!isdefined(point._scoredebug))
						{
							point._scoredebug = [];
						}
						if(!isdefined(point._scoredebug[#"disttoorigin"]))
						{
							point._scoredebug[#"disttoorigin"] = spawnstruct();
						}
						point._scoredebug[#"disttoorigin"].score = mapfloat(0, 200, 0, -200, distance(point.origin, queryresult.origin));
						point._scoredebug[#"disttoorigin"].scorename = "";
					#/
					point.score = point.score + (mapfloat(0, 200, 0, -200, distance(point.origin, queryresult.origin)));
					/#
						if(!isdefined(point._scoredebug))
						{
							point._scoredebug = [];
						}
						if(!isdefined(point._scoredebug[#"heighttoorigin"]))
						{
							point._scoredebug[#"heighttoorigin"] = spawnstruct();
						}
						point._scoredebug[#"heighttoorigin"].score = mapfloat(50, 200, 0, -200, abs(point.origin[2] - queryresult.origin[2]));
						point._scoredebug[#"heighttoorigin"].scorename = "";
					#/
					point.score = point.score + (mapfloat(50, 200, 0, -200, abs(point.origin[2] - queryresult.origin[2])));
					if(point.inclaimedlocation === 1)
					{
						/#
							if(!isdefined(point._scoredebug))
							{
								point._scoredebug = [];
							}
							if(!isdefined(point._scoredebug[#"inclaimedlocation"]))
							{
								point._scoredebug[#"inclaimedlocation"] = spawnstruct();
							}
							point._scoredebug[#"inclaimedlocation"].score = -500;
							point._scoredebug[#"inclaimedlocation"].scorename = "";
						#/
						point.score = point.score + -500;
					}
					if(point.score > best_score)
					{
						best_score = point.score;
						best_point = point;
					}
				}
				self vehicle_ai::positionquery_debugscores(queryresult);
				if(isdefined(best_point))
				{
					targetpos = best_point.origin;
				}
			}
			self function_a57c34b7(targetpos, 0, 1);
			self.foundpath = self vehicle_ai::waittill_pathresult();
			if(self.foundpath)
			{
				self.current_pathto_pos = targetpos;
				self thread path_update_interrupt_melee();
				self.pathfailcount = 0;
				self vehicle_ai::waittill_pathing_done();
			}
		}
		if(!self.foundpath)
		{
			self.pathfailcount++;
			if(self.pathfailcount > 2)
			{
				if(isdefined(self.enemy) && issentient(self.enemy))
				{
					self setpersonalthreatbias(self.enemy, -2000, 5);
				}
			}
			wait(0.1);
			queryresult = positionquery_source_navigation(self.origin, 0, self.settings.max_move_dist, self.settings.max_move_dist, self.radius, self);
			if(queryresult.data.size)
			{
				point = queryresult.data[randomint(queryresult.data.size)];
				self function_a57c34b7(point.origin, 0, 0);
				self.current_pathto_pos = undefined;
				self thread path_update_interrupt_melee();
				wait(2);
				self notify(#"near_goal");
			}
		}
		wait(0.2);
	}
}

/*
	Name: state_melee_combat_attack
	Namespace: namespace_7457b8d5
	Checksum: 0x9DA38002
	Offset: 0x2258
	Size: 0x200
	Parameters: 0
	Flags: Linked
*/
function state_melee_combat_attack()
{
	self endon(#"change_state");
	self endon(#"death");
	for(;;)
	{
		state_params = spawnstruct();
		state_params.playtransition = 1;
		if(!isdefined(self.enemy))
		{
			wait(0.1);
			self vehicle_ai::evaluate_connections(undefined, state_params);
			continue;
		}
		self vehicle_ai::evaluate_connections(undefined, state_params);
		if(self cansee(self.enemy))
		{
			self vehlookat(self.enemy);
			self turretsettarget(0, self.enemy);
		}
		if(distance2dsquared(self.origin, self.enemy.origin) < sqr(self.settings.meleereach) && self cansee(self.enemy))
		{
			if(bullettracepassed(self.origin + vectorscale((0, 0, 1), 10), self.enemy.origin + vectorscale((0, 0, 1), 20), 0, self, self.enemy, 0, 1))
			{
				self do_melee_attack(self.enemy);
				wait(0.5);
			}
		}
		wait(0.1);
	}
}

/*
	Name: do_melee_attack
	Namespace: namespace_7457b8d5
	Checksum: 0xD9BE7F2A
	Offset: 0x2460
	Size: 0x17E
	Parameters: 1
	Flags: Linked
*/
function do_melee_attack(enemy)
{
	self notify(#"near_goal");
	self vehicle_ai::clearallmovement(1);
	self.dont_move = 1;
	self asmrequestsubstate("melee@stationary");
	timedout = undefined;
	timedout = self waittilltimeout(3, #"spider_melee");
	if(timedout._notify !== #"timeout")
	{
		if(isalive(enemy) && distance2dsquared(self.origin, enemy.origin) < (sqr(self.settings.meleereach * 1.2)))
		{
			enemy dodamage(100, self.origin, self, self);
		}
		self vehicle_ai::waittill_asm_complete("melee@stationary", 2);
	}
	self asmrequestsubstate("locomotion@movement");
	self.dont_move = undefined;
}

/*
	Name: should_switch_to_range
	Namespace: namespace_7457b8d5
	Checksum: 0x819BB950
	Offset: 0x25E8
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function should_switch_to_range(from_state, to_state, connection)
{
	if(self.pathfailcount > 4)
	{
		return true;
	}
	if(!util::iscooldownready("state_change"))
	{
		return false;
	}
	if(isalive(self.enemy) && distance2dsquared(self.origin, self.enemy.origin) > (sqr(self.settings.meleedist * 4)))
	{
		return true;
	}
	if(!isdefined(self.enemy))
	{
		return true;
	}
	return false;
}

/*
	Name: prevent_stuck
	Namespace: namespace_7457b8d5
	Checksum: 0xECF8A2BB
	Offset: 0x26D0
	Size: 0xF8
	Parameters: 0
	Flags: Linked
*/
function prevent_stuck()
{
	self endon(#"change_state");
	self endon(#"death");
	self notify(#"end_prevent_stuck");
	self endon(#"end_prevent_stuck");
	wait(2);
	count = 0;
	previous_origin = undefined;
	while(true)
	{
		if(isdefined(previous_origin) && distancesquared(previous_origin, self.origin) < sqr(0.1))
		{
			count++;
		}
		else
		{
			previous_origin = self.origin;
			count = 0;
		}
		if(count > 10)
		{
			self.pathfailcount = 10;
		}
		wait(1);
	}
}

/*
	Name: spider_get_target_position
	Namespace: namespace_7457b8d5
	Checksum: 0x5796347B
	Offset: 0x27D0
	Size: 0x384
	Parameters: 0
	Flags: Linked
*/
function spider_get_target_position()
{
	if(self.goalforced)
	{
		return self.goalpos;
	}
	if(isdefined(self.settings.all_knowing))
	{
		if(isdefined(self.enemy))
		{
			target_pos = self.enemy.origin;
		}
	}
	else
	{
		target_pos = vehicle_ai::gettargetpos(vehicle_ai::getenemytarget());
	}
	enemy = self.enemy;
	if(isdefined(target_pos))
	{
		target_pos_onnavmesh = getclosestpointonnavmesh(target_pos, self.settings.detonation_distance * 1.5, self.radius, 4194287);
	}
	if(!isdefined(target_pos_onnavmesh))
	{
		if(isdefined(self.enemy) && issentient(self.enemy))
		{
			self setpersonalthreatbias(self.enemy, -2000, 5);
		}
		if(isdefined(self.current_pathto_pos) && distancesquared(self.origin, self.current_pathto_pos) > sqr(self.settings.meleereach))
		{
			return self.current_pathto_pos;
		}
		return undefined;
	}
	if(isdefined(self.enemy) && issentient(self.enemy))
	{
		if(distancesquared(target_pos, target_pos_onnavmesh) > sqr(self.settings.detonation_distance * 0.9))
		{
			self setpersonalthreatbias(self.enemy, -2000, 5);
		}
	}
	if(isdefined(enemy) && isplayer(enemy))
	{
		enemy_vel_offset = enemy getvelocity() * 0.5;
		enemy_look_dir_offset = anglestoforward(enemy.angles);
		if(distance2dsquared(self.origin, enemy.origin) > sqr(500))
		{
			enemy_look_dir_offset = enemy_look_dir_offset * 110;
		}
		else
		{
			enemy_look_dir_offset = enemy_look_dir_offset * 35;
		}
		offset = enemy_vel_offset + enemy_look_dir_offset;
		offset = (offset[0], offset[1], 0);
		if(tracepassedonnavmesh(target_pos_onnavmesh, target_pos + offset))
		{
			target_pos = target_pos + offset;
		}
		else
		{
			target_pos = target_pos_onnavmesh;
		}
	}
	else
	{
		target_pos = target_pos_onnavmesh;
	}
	return target_pos;
}

/*
	Name: path_update_interrupt_melee
	Namespace: namespace_7457b8d5
	Checksum: 0x4FCAB52F
	Offset: 0x2B60
	Size: 0x304
	Parameters: 0
	Flags: Linked
*/
function path_update_interrupt_melee()
{
	self endon(#"death");
	self endon(#"change_state");
	self endon(#"near_goal");
	self endon(#"reached_end_node");
	self notify(#"clear_interrupt_threads");
	self endon(#"clear_interrupt_threads");
	wait(0.1);
	while(true)
	{
		if(isdefined(self.current_pathto_pos))
		{
			if(distance2dsquared(self.current_pathto_pos, self.goalpos) > sqr(self.goalradius))
			{
				wait(0.5);
				self notify(#"near_goal");
			}
			targetpos = spider_get_target_position();
			if(isdefined(targetpos))
			{
				if(distancesquared(self.origin, targetpos) > sqr(1000))
				{
					repath_range = self.settings.repath_range * 2;
					wait(0.1);
				}
				else
				{
					repath_range = self.settings.repath_range;
				}
				if(distance2dsquared(self.current_pathto_pos, targetpos) > sqr(repath_range))
				{
					self notify(#"near_goal");
				}
			}
			if(isdefined(self.enemy) && isplayer(self.enemy))
			{
				forward = anglestoforward(self.enemy getplayerangles());
				dir_to_raps = self.origin - self.enemy.origin;
				speedtouse = self.settings.defaultmovespeed * 2;
				if(vectordot(forward, dir_to_raps) > 0)
				{
					self setspeed(speedtouse);
				}
				else
				{
					self setspeed(speedtouse * 0.75);
				}
			}
			else
			{
				speedtouse = self.settings.defaultmovespeed * 2;
				self setspeed(speedtouse);
			}
			wait(0.2);
		}
		else
		{
			wait(0.4);
		}
	}
}

/*
	Name: nudge_collision
	Namespace: namespace_7457b8d5
	Checksum: 0x6E1427C5
	Offset: 0x2E70
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function nudge_collision()
{
	self endon(#"death");
	self endon(#"change_state");
	self notify(#"end_nudge_collision");
	self endon(#"end_nudge_collision");
	while(true)
	{
		result = undefined;
		result = self waittill(#"veh_collision");
		ang_vel = self getangularvelocity() * 0.8;
		self setangularvelocity(ang_vel);
		if(isalive(self) && vectordot(result.normal, (0, 0, 1)) < 0.5)
		{
			self setvehvelocity(self.velocity + (result.normal * 400));
		}
	}
}

/*
	Name: force_get_enemies
	Namespace: namespace_7457b8d5
	Checksum: 0x5BFCC75F
	Offset: 0x2FA8
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function force_get_enemies()
{
	foreach(player in level.players)
	{
		if(self util::isenemyplayer(player) && !player.ignoreme)
		{
			self getperfectinfo(player, 1);
		}
	}
	self namespace_250e9486::function_4b49bf0d();
}

/*
	Name: spider_callback_damage
	Namespace: namespace_7457b8d5
	Checksum: 0xE52870CA
	Offset: 0x3088
	Size: 0xB6
	Parameters: 15
	Flags: Linked
*/
function spider_callback_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	if(isalive(partname) && partname.team === self.team)
	{
		return 0;
	}
	return vsurfacenormal;
}

