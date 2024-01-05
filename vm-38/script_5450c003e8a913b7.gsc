#using script_3819e7a1427df6d2;
#using script_3072532951b5b4ae;
#using script_7e3221b6c80d8cc4;
#using script_912160eeb6a2d51;
#using script_16a28d93ee216f6f;
#using script_42310dfa1362069f;
#using script_139ae0bb0a87141c;
#using script_1883fa4e60abbf9f;
#using script_3ad66e3076c279ab;
#using scripts\cp_common\util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace enemy;

/*
	Name: function_83252eac
	Namespace: enemy
	Checksum: 0x8D773B33
	Offset: 0x4B8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_83252eac()
{
	level notify(169091459);
}

/*
	Name: scalevolume
	Namespace: enemy
	Checksum: 0xD4F6B558
	Offset: 0x4D8
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function scalevolume(ent, vol)
{
}

#namespace namespace_f1f700ac;

/*
	Name: main
	Namespace: namespace_f1f700ac
	Checksum: 0x128B2276
	Offset: 0x4F8
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function main()
{
	self init_settings();
	self init_flags();
	stealth_group::addtogroup(self.script_stealthgroup, self);
	self setpatrolstyle_base();
	self stealth_event::event_init_entity();
	self thread monitor_damage_thread(level.stealth.damage_auto_range, level.stealth.damage_sight_range);
	self set_alert_level("reset");
	self bt_set_stealth_state("idle");
	self stealth_init_goal_radius();
	/#
		self thread stealth_debug::function_8c76fdc5();
	#/
	if(isdefined(level.stealth.fninitenemygame))
	{
		self thread [[level.stealth.fninitenemygame]]();
	}
	self thread function_2b1c382();
}

/*
	Name: init_flags
	Namespace: namespace_f1f700ac
	Checksum: 0x2386C914
	Offset: 0x670
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function init_flags()
{
	self flag::init("stealth_enabled");
	self flag::set("stealth_enabled");
	self flag::init("stealth_override_goal");
	self flag::init("stealth_hold_position");
	self flag::init("stealth_attack");
	self flag::init("stealth_cover_blown");
	self flag::init("stealth_local_investigation_only");
	self flag::init("stealth_disable_unresponsive_ai_check");
	self flag::init("stealth_non_player_combat");
	self.stealth.var_103386e8 = self namespace_979752dc::group_flag_init("stealth_spotted");
	self namespace_979752dc::group_flag_init("stealth_cover_blown");
	self namespace_979752dc::group_flag_init("stealth_combat_hunting");
	self namespace_979752dc::group_flag_init("stealth_disable_unresponsive_ai_check");
}

/*
	Name: stealth_init_goal_radius
	Namespace: namespace_f1f700ac
	Checksum: 0x8091A5AB
	Offset: 0x828
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function stealth_init_goal_radius()
{
	if(isdefined(self.script_radius))
	{
		self namespace_979752dc::set_goal_radius(self.script_radius);
		return;
	}
	if(!is_true(self.patroller) && !isdefined(self getgoalvolume()))
	{
		self namespace_979752dc::set_goal_radius(level.default_goalradius);
	}
}

/*
	Name: init_settings
	Namespace: namespace_f1f700ac
	Checksum: 0xB350FCF1
	Offset: 0x8B8
	Size: 0x1CC
	Parameters: 0
	Flags: Linked
*/
function init_settings()
{
	self.stealth = spawnstruct();
	self namespace_979752dc::assign_unique_id();
	self.stealth.funcs = [];
	self.stealth.max_warnings = 2;
	self.stealth.reachedinvestigate = 0;
	/#
		self.stealth.ai_event = "";
		self.stealth.var_29672bb5 = "";
	#/
	self.newenemyreactiondistsq = sqr(400);
	self stealth_corpse::corpse_init_entity();
	self.stealth.event_escalation_scalar = 0;
	if(!isdefined(level.stealth.damage_auto_range))
	{
		level.stealth.damage_auto_range = 175;
	}
	if(!isdefined(level.stealth.damage_sight_range))
	{
		level.stealth.damage_sight_range = 600;
	}
	self.var_13c8de0c = self.grenadeawareness;
	self.grenadeawareness = 0;
	self.canacquirenearbytacvisenemies = 0;
	self.stealth.bsmstate = -1;
	self.stealth.starttime = gettime();
	self namespace_979752dc::function_6a3b08d0();
	self namespace_77fd5d41::initstealthfunctions();
	self namespace_6c0cd084::threat_sight_set_state("hidden");
}

/*
	Name: function_2b1c382
	Namespace: namespace_f1f700ac
	Checksum: 0x6A7784F6
	Offset: 0xA90
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_2b1c382()
{
	self endon(#"death");
	while(true)
	{
		self flag::wait_till("stealth_enabled");
		level flag::wait_till_clear("stealth_spotted");
		self flag::wait_till_clear("in_action");
		self namespace_77fd5d41::stealth_enemy_updateeveryframe(self);
		switch(self.stealth.bsmstate)
		{
			case 0:
			{
				break;
			}
			case 1:
			{
				self namespace_77fd5d41::investigate_updateeveryframe(self);
				break;
			}
			case 2:
			{
				break;
			}
		}
		waitframe(1);
	}
}

/*
	Name: death_cleanup
	Namespace: namespace_f1f700ac
	Checksum: 0xE9855D76
	Offset: 0xBA8
	Size: 0x1FC
	Parameters: 0
	Flags: Linked
*/
function death_cleanup()
{
	if(isdefined(self))
	{
		self namespace_6c0cd084::threat_sight_set_state("death");
		aiutility::removeaioverridedamagecallback(self, &check_kill_damage);
	}
	else
	{
		foreach(player in getplayers())
		{
			foreach(v in player.stealth.threat_entities)
			{
				if(!isdefined(v))
				{
					player.stealth.threat_entities[k] = undefined;
				}
			}
			foreach(v in player.stealth.threat_sighted)
			{
				if(!isdefined(v))
				{
					player.stealth.threat_sighted[k] = undefined;
				}
			}
		}
	}
	if(isdefined(self.stealth_vo_ent))
	{
		self.stealth_vo_ent thread death_vo_cleanup();
	}
}

/*
	Name: death_vo_cleanup
	Namespace: namespace_f1f700ac
	Checksum: 0xAC274E4E
	Offset: 0xDB0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function death_vo_cleanup()
{
	self stopsounds();
	waitframe(1);
	self delete();
}

/*
	Name: add_active_sense_function
	Namespace: namespace_f1f700ac
	Checksum: 0x4A5237F8
	Offset: 0xDF0
	Size: 0xA0
	Parameters: 1
	Flags: None
*/
function add_active_sense_function(func)
{
	/#
		assert(isdefined(self.stealth), (("" + self getentitynumber()) + "") + self.origin);
	#/
	if(!isdefined(self.stealth.active_sense_funcs))
	{
		self.stealth.active_sense_funcs = [];
	}
	self.stealth.active_sense_funcs[self.stealth.active_sense_funcs.size] = func;
}

/*
	Name: proximity_check
	Namespace: namespace_f1f700ac
	Checksum: 0x38025F3A
	Offset: 0xE98
	Size: 0x57A
	Parameters: 0
	Flags: Linked
*/
function proximity_check()
{
	if(self.ignoreall)
	{
		return;
	}
	if(!isdefined(level.stealth))
	{
		return;
	}
	var_c23cc9e4 = self geteyeapprox();
	var_bf444fb4 = (self.origin + var_c23cc9e4) / 2;
	playeroffset = vectorscale((0, 0, 1), 35);
	if(isdefined(self.proximity_bump_dist_sqr_override))
	{
		var_4af2cd8d = self.proximity_bump_dist_sqr_override;
	}
	else
	{
		var_4af2cd8d = 1764;
	}
	var_9f447779 = 11025;
	myeye = undefined;
	playereye = undefined;
	foreach(player in getplayers())
	{
		donotify = 0;
		dotrace = 0;
		if(!isalive(player))
		{
			continue;
		}
		if(issentient(player) && (player.ignoreme || player isnotarget()))
		{
			continue;
		}
		distsq = distancesquared(var_bf444fb4, player.origin + playeroffset);
		if(distance2dsquared(self.origin, player.origin) < var_4af2cd8d)
		{
			zdist = self.origin[2] - player.origin[2];
			if(zdist * zdist < 5184)
			{
				dotrace = 1;
				donotify = 1;
			}
		}
		if(!donotify && isdefined(level.stealth.proximity_combat_radius_fake_sight) && level.stealth.proximity_combat_radius_fake_sight > 0)
		{
			if(distsq < level.stealth.proximity_combat_radius_fake_sight * level.stealth.proximity_combat_radius_fake_sight)
			{
				if(!isdefined(self.stealth.blind))
				{
					var_14fc0a20 = player.origin - self.origin;
					var_14fc0a20 = (var_14fc0a20[0], var_14fc0a20[1], 0);
					var_a0e80ff2 = anglestoforward((0, self.angles[1], 0));
					if(vectordot(var_a0e80ff2, var_14fc0a20) > 0)
					{
						dotrace = 1;
						donotify = 1;
					}
				}
			}
		}
		if(!donotify && isdefined(level.stealth.proximity_combat_radius_bump) && level.stealth.proximity_combat_radius_bump > 0)
		{
			if(distsq < level.stealth.proximity_combat_radius_bump * level.stealth.proximity_combat_radius_bump)
			{
				var_29751967 = lengthsquared((player getvelocity()[0], player getvelocity()[1], 0));
				if(var_29751967 > var_9f447779)
				{
					dotrace = 1;
					donotify = 1;
				}
			}
		}
		if(!donotify && isdefined(level.stealth.proximity_combat_radius_sight) && level.stealth.proximity_combat_radius_sight > 0)
		{
			if(distsq < level.stealth.proximity_combat_radius_sight * level.stealth.proximity_combat_radius_sight)
			{
				if(self cansee(player, 0))
				{
					donotify = 1;
				}
			}
		}
		if(donotify && dotrace)
		{
			donotify = sighttracepassed(self geteye(), player geteye(), 0, self, player);
		}
		if(donotify)
		{
			self function_a3fcf9e0("proximity", player, player.origin);
			self util::delay(0.05, undefined, &getenemyinfo, player);
			return;
		}
	}
}

/*
	Name: set_blind
	Namespace: namespace_f1f700ac
	Checksum: 0xE11BC337
	Offset: 0x1420
	Size: 0x15C
	Parameters: 2
	Flags: Linked
*/
function set_blind(blind, force)
{
	if(!isdefined(self.stealth))
	{
		return;
	}
	if(!blind && !isdefined(self.stealth.blind))
	{
		return;
	}
	var_88ec3efd = isdefined(self.fnisinstealthcombat) && self [[self.fnisinstealthcombat]]();
	var_4d00933b = isdefined(self.fnisinstealthhunt) && self [[self.fnisinstealthhunt]]();
	var_da41c771 = var_88ec3efd || var_4d00933b;
	if(blind && (!var_da41c771 || is_true(force)))
	{
		self.stealth.blind = 1;
		set_sight_state("blind");
	}
	else
	{
		self.stealth.blind = undefined;
		if(var_da41c771)
		{
			set_sight_state("spotted");
		}
		else
		{
			set_sight_state("hidden");
		}
	}
}

/*
	Name: set_sight_state
	Namespace: namespace_f1f700ac
	Checksum: 0xF061E94C
	Offset: 0x1588
	Size: 0x3C2
	Parameters: 1
	Flags: Linked
*/
function set_sight_state(state)
{
	switch(state)
	{
		case "blind":
		{
			self namespace_6c0cd084::threat_sight_set_state("blind");
			self.fovcosine = 0.98;
			self.fovcosinebusy = 0.98;
			self.fovcosinez = 0;
			self.fovground = 0;
			self.fovcosineperiph = 0.99;
			self.fovcosineperiphmaxdistsq = 1;
			break;
		}
		case "idle":
		case "hidden":
		case "unaware":
		{
			self namespace_6c0cd084::threat_sight_set_state("hidden");
			self.fovcosine = 0.7;
			self.fovcosinebusy = 0.86;
			self.fovcosinez = 0.97;
			self.fovground = 1;
			self.fovcosineperiph = 0.34;
			self.fovcosineperiphmaxdistsq = 90000;
			break;
		}
		case "investigate":
		{
			self namespace_6c0cd084::threat_sight_set_state("investigate");
			self.fovcosine = 0.7;
			self.fovcosinebusy = 0.86;
			self.fovcosinez = 0.97;
			self.fovground = 1;
			self.fovcosineperiph = 0.34;
			self.fovcosineperiphmaxdistsq = 90000;
			break;
		}
		case "hunt":
		case "combat_hunt":
		{
			self namespace_6c0cd084::threat_sight_set_state("combat_hunt");
			self.fovcosine = 0.7;
			self.fovcosinebusy = 0.86;
			self.fovcosinez = 0.97;
			self.fovground = 1;
			self.fovcosineperiph = 0.01;
			self.fovcosineperiphmaxdistsq = 90000;
			break;
		}
		case "combat":
		case "spotted":
		{
			self namespace_6c0cd084::threat_sight_set_state("spotted");
			self.fovcosine = 0.01;
			self.fovcosinebusy = 0.574;
			self.fovcosinez = 0;
			self.fovground = 0;
			self.fovcosineperiph = 0.01;
			self.fovcosineperiphmaxdistsq = 16384;
			break;
		}
		case "hash_5689f41e8c0ad00":
		{
			/#
				assertmsg("");
			#/
			break;
		}
		case "hash_2689c03316776ffb":
		{
			/#
				assertmsg("");
			#/
			break;
		}
		case "elevated":
		{
			/#
				assertmsg("");
			#/
			break;
		}
	}
	if(isdefined(self.var_e6b70cdb))
	{
		self.fovcosine = self.var_e6b70cdb;
	}
	if(isdefined(self.var_fcc58b22))
	{
		self.fovcosineperiph = self.var_fcc58b22;
	}
}

/*
	Name: set_alert_level
	Namespace: namespace_f1f700ac
	Checksum: 0x14F6C22D
	Offset: 0x1958
	Size: 0x2F2
	Parameters: 2
	Flags: Linked
*/
function set_alert_level(type, event)
{
	if(!self flag::get("stealth_enabled"))
	{
		return;
	}
	if(isdefined(self.alertlevelscript) && self.alertlevelscript == type)
	{
		return;
	}
	self endon(#"death");
	self notify(#"set_alert_level");
	self endon(#"set_alert_level");
	if(isdefined(event) && namespace_979752dc::function_7211414e(self.alertlevelscript) < namespace_979752dc::function_7211414e(type))
	{
		self notify(#"hash_7943e96754003c55");
		event.var_c0659057 = namespace_979752dc::function_7211414e(type);
		players = getplayers();
		if(isdefined(players) && players.size > 0)
		{
			foreach(player in players)
			{
				player notify(#"stealth_alert", event);
			}
		}
	}
	self.alertlevelscript = type;
	while(isdefined(self.syncedmeleetarget))
	{
		wait(0.05);
	}
	/#
		self thread stealth_debug::function_690312e5(type);
	#/
	self namespace_979752dc::set_stealth_state(type);
	self notify(#"hash_1969930500784d9a", type);
	self.alertlevel = namespace_979752dc::alertlevel_script_to_exe(type);
	var_da41c771 = self.alertlevelint >= level.stealth.alert_levels_exe[#"combat"];
	self stealth_event::event_entity_core_set_enabled(!var_da41c771);
	self.ignoreexplosionevents = !var_da41c771;
	if(self.awarenesslevelcurrent === "unaware" && self.awarenesslevelprevious !== "unaware" && self.awarenesslevelprevious !== "combat")
	{
		self.stealth.var_e39ea5e7 = 1;
	}
}

/*
	Name: set_default_stealth_funcs
	Namespace: namespace_f1f700ac
	Checksum: 0xA664F67D
	Offset: 0x1C58
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function set_default_stealth_funcs()
{
	level namespace_979752dc::set_stealth_func("set_patrol_style", &namespace_979752dc::set_patrol_style);
	level namespace_979752dc::set_stealth_func("trigger_cover_blown", &trigger_cover_blown);
	level namespace_979752dc::set_stealth_func("set_blind", &set_blind);
	level namespace_979752dc::set_stealth_func("investigate", &bt_event_handler_severity);
	level namespace_979752dc::set_stealth_func("cover_blown", &bt_event_handler_severity);
	level namespace_979752dc::set_stealth_func("combat", &bt_event_handler_severity);
}

/*
	Name: monitor_damage_thread
	Namespace: namespace_f1f700ac
	Checksum: 0xDA7D5B92
	Offset: 0x1D58
	Size: 0x34C
	Parameters: 2
	Flags: Linked
*/
function monitor_damage_thread(var_b2a2de70, var_a3dc7b53)
{
	self endon(#"entitydeleted");
	other = undefined;
	team = self.team;
	aiutility::addaioverridedamagecallback(self, &check_kill_damage);
	while(true)
	{
		if(!isalive(self))
		{
			return;
		}
		var_7f729179 = undefined;
		var_7f729179 = self waittill(#"damage");
		var_2c9fbcbe = self.origin;
		if(isalive(self) && !self flag::get("stealth_enabled"))
		{
			continue;
		}
		if(isalive(var_7f729179.attacker))
		{
			other = var_7f729179.attacker;
		}
		if(!isdefined(other))
		{
			continue;
		}
		self function_a3fcf9e0("damage", other, other.origin);
		if(isplayer(other) || (isdefined(other.team) && other.team != team))
		{
			break;
		}
		if(isdefined(other.classname) && other.classname == "script_model")
		{
			if(other.isbarrel)
			{
				break;
			}
		}
	}
	if(!isdefined(self))
	{
		return;
	}
	aiutility::removeaioverridedamagecallback(self, &check_kill_damage);
	if(isdefined(self.stealth.override_damage_auto_range))
	{
		var_b2a2de70 = self.stealth.override_damage_auto_range;
	}
	else if(isdefined(level.stealth.override_damage_auto_range))
	{
		var_b2a2de70 = level.stealth.override_damage_auto_range;
	}
	if(isdefined(self.stealth.override_damage_sight_range))
	{
		var_a3dc7b53 = self.stealth.override_damage_sight_range;
	}
	else if(isdefined(level.stealth.override_damage_sight_range))
	{
		var_a3dc7b53 = level.stealth.override_damage_sight_range;
	}
	if(isalive(self) && self.health > 0)
	{
		self stealth_event::event_broadcast_axis("ally_damaged", "ally_hurt_peripheral", other, var_b2a2de70, var_a3dc7b53);
	}
	else
	{
		self stealth_event::event_broadcast_axis("ally_killed", "ally_hurt_peripheral", other, var_b2a2de70, var_a3dc7b53);
	}
}

/*
	Name: check_kill_damage
	Namespace: namespace_f1f700ac
	Checksum: 0x14BAE7B8
	Offset: 0x20B0
	Size: 0x1A8
	Parameters: 13
	Flags: Linked
*/
function check_kill_damage(inflictor, attacker, damage, flags, meansofdamage, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	if(isdefined(self.disableeasystealthheadshot))
	{
		return hitloc;
	}
	if(isdefined(boneindex) && boneindex.weapclass == "grenade" && (boneindex.name == #"eq_flash_grenade" || offsettime == "MOD_IMPACT"))
	{
		return hitloc;
	}
	if(hitloc > 0 && offsettime != "MOD_MELEE" && hitloc < self.health && self.alertlevelscript != "attack" && self.alertlevelscript != "combat")
	{
		eyepos = self geteye();
		if(distancesquared(modelindex, eyepos) < sqr(level.stealth.head_shot_dist))
		{
			self.var_27feb91e = hitloc;
			return self.health;
		}
	}
	return hitloc;
}

/*
	Name: headtrack_player_toggle
	Namespace: namespace_f1f700ac
	Checksum: 0x41409C65
	Offset: 0x2260
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function headtrack_player_toggle(bool)
{
	if(bool)
	{
		if(!isdefined(self.stealth.allowplayerheadtracking))
		{
			self.stealth.allowplayerheadtracking = 1;
		}
		else if(!self.stealth.allowplayerheadtracking)
		{
			return;
		}
		if(!isdefined(self.stealth.looking_at_entity))
		{
			self.stealth.looking_at_entity = getplayers()[0];
		}
		self lookatentity(getplayers()[0]);
	}
	else if(isdefined(self.stealth.looking_at_entity))
	{
		self.stealth.looking_at_entity = undefined;
		self lookatentity();
	}
}

/*
	Name: lock_player_headtracking_off
	Namespace: namespace_f1f700ac
	Checksum: 0x138F574
	Offset: 0x2358
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function lock_player_headtracking_off(duration)
{
	self endon(#"death");
	self notify(#"hash_602f82a12f43d586");
	self endon(#"hash_602f82a12f43d586");
	self disable_player_headtracking();
	wait(duration);
	self enable_player_headtracking();
}

/*
	Name: disable_player_headtracking
	Namespace: namespace_f1f700ac
	Checksum: 0x1A508B63
	Offset: 0x23D8
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function disable_player_headtracking()
{
	self.stealth.allowplayerheadtracking = 0;
	headtrack_player_toggle(0);
}

/*
	Name: enable_player_headtracking
	Namespace: namespace_f1f700ac
	Checksum: 0xA4300639
	Offset: 0x2410
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function enable_player_headtracking()
{
	self.stealth.allowplayerheadtracking = 1;
}

/*
	Name: event_handler_should_ignore
	Namespace: namespace_f1f700ac
	Checksum: 0xFA13523A
	Offset: 0x2430
	Size: 0x3D6
	Parameters: 1
	Flags: Linked
*/
function event_handler_should_ignore(event)
{
	event_severity_min = self.stealth.event_severity_min;
	if(!isdefined(event_severity_min))
	{
		event_severity_min = level.stealth.event_severity_min;
	}
	if(event.type == "combat" && self namespace_77fd5d41::iscombating())
	{
		return 1;
	}
	if(isdefined(event_severity_min))
	{
		diff = stealth_event::event_severity_compare(event_severity_min, event.type);
		if(diff > 0)
		{
			return 1;
		}
	}
	if(is_true(level.stealth.disguised) && self event_override_disguise(event))
	{
		return 1;
	}
	if(event.typeorig == "explode")
	{
		if(isdefined(event.entity) && isdefined(event.entity.team) && event.entity.team == self.team)
		{
			return 1;
		}
	}
	if(event.typeorig == "footstep_sprint" || event.typeorig == "footstep_run")
	{
		if(should_ignore_sprint_footstep(event))
		{
			return 1;
		}
	}
	if(event.typeorig == "silenced_shot")
	{
		if(isplayer(event.entity) && distancesquared(event.entity geteye(), event.origin) > 1296)
		{
			return 1;
		}
	}
	if(event.typeorig == "gunshot" || event.typeorig == "gunshot_teammate" || event.typeorig == "bulletwhizby")
	{
		if(event.entity == self)
		{
			return 1;
		}
		if(isai(event.entity) && event.entity isinscriptedstate())
		{
			return 1;
		}
	}
	if(event.typeorig == "grenade danger")
	{
		if(isdefined(event.entity.item.name) && event.entity.item.name == #"hatchet")
		{
			return 1;
		}
	}
	if(is_true(self namespace_b2b86d39::stealth_call("event_should_ignore", event)))
	{
		return 1;
	}
	var_9cb4da4 = self namespace_b2b86d39::stealth_get_func("event_" + event.type);
	if(isdefined(var_9cb4da4))
	{
		return self namespace_b2b86d39::stealth_call("event_" + event.type, event);
	}
	return 0;
}

/*
	Name: should_ignore_sprint_footstep
	Namespace: namespace_f1f700ac
	Checksum: 0x17751DAE
	Offset: 0x2810
	Size: 0x1E8
	Parameters: 1
	Flags: Linked
*/
function should_ignore_sprint_footstep(event)
{
	traceoffset = vectorscale((0, 0, 1), 18);
	ignoreents = getplayers();
	if(isdefined(self.stealth.cantracetoaiignoreents))
	{
		ignoreents = arraycombine(ignoreents, self.stealth.cantracetoaiignoreents);
	}
	if(isplayer(event.entity) && util::can_see_ai(event.origin + traceoffset, self, 250, ignoreents[0], ignoreents[1]))
	{
		dist_sq = distancesquared(self.origin, event.origin);
		radius = 250;
		if(isdefined(self.sprintfootstepradius))
		{
			radius = self.sprintfootstepradius;
		}
		if(dist_sq < sqr(radius))
		{
			var_c1c8aacd = util::can_see_ai(event.origin + traceoffset, self, 250, ignoreents[0], ignoreents[1]);
			return false;
		}
		var_1cc7bd2f = self cansee(event.entity);
		if(!var_1cc7bd2f && event.entity namespace_6c0cd084::player_is_sprinting_at_me(self))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: event_override_disguise
	Namespace: namespace_f1f700ac
	Checksum: 0x8F053C9E
	Offset: 0x2A00
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function event_override_disguise(event)
{
	if(issentient(event.entity))
	{
		switch(event.typeorig)
		{
			case "footstep_sprint":
			case "footstep":
			case "footstep_walk":
			case "footstep_run":
			case "proximity":
			{
				self thread namespace_6c0cd084::threat_sight_force_visible(event.entity, 1);
				return true;
			}
		}
	}
	return false;
}

/*
	Name: event_anyone_within_radius
	Namespace: namespace_f1f700ac
	Checksum: 0xD53C6685
	Offset: 0x2AC8
	Size: 0xE8
	Parameters: 2
	Flags: Linked
*/
function event_anyone_within_radius(var_87017634, dist)
{
	distsq = dist * dist;
	ais = getactorteamarray("axis", "team3");
	foreach(ai in ais)
	{
		if(distancesquared(var_87017634, ai.origin) <= distsq)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: event_handler_translate_severity
	Namespace: namespace_f1f700ac
	Checksum: 0xA893B9C3
	Offset: 0x2BB8
	Size: 0x3D2
	Parameters: 1
	Flags: Linked
*/
function event_handler_translate_severity(event)
{
	if(!isdefined(event) || !isdefined(event.typeorig))
	{
		return;
	}
	if(isdefined(self.fnisinstealthhunt) && self [[self.fnisinstealthhunt]]())
	{
		if(event.type == "investigate")
		{
			event.type = "cover_blown";
		}
	}
	if(isdefined(self.fnisinstealthcombat) && self [[self.fnisinstealthcombat]]())
	{
		event.type = "combat";
	}
	switch(event.typeorig)
	{
		case "sight":
		{
			if(self.species == "dog")
			{
				event.type = "investigate";
			}
			else
			{
				if(self namespace_979752dc::function_d58e1c1c() && self.alertlevel == "low_alert")
				{
					event.type = "cover_blown";
				}
				else
				{
					if(isdefined(self.stealth.threat_sight_lost) && self.stealth.threat_sight_lost == 0)
					{
						if(isdefined(event.entity) && issentient(event.entity))
						{
							self getenemyinfo(event.entity);
						}
						event.type = "combat";
					}
					else if(distancesquared(self.origin, event.origin) < 62500)
					{
						if(isdefined(event.entity))
						{
							threatsight = self getthreatsight(event.entity);
							if(threatsight >= 1)
							{
								event.type = "combat";
							}
						}
					}
				}
			}
			break;
		}
		case "grenade danger":
		{
			if(event_anyone_within_radius(event.origin, 128))
			{
				event.type = "combat";
			}
			break;
		}
		case "explode":
		{
			if(event_anyone_within_radius(event.origin, 192))
			{
				event.type = "combat";
			}
			else if(distancesquared(event.origin, self.origin) <= 1048576)
			{
				event.type = "combat";
			}
			break;
		}
		case "gunshot":
		{
			if(distancesquared(event.origin, self.origin) < 640000)
			{
				event.type = "combat";
			}
			break;
		}
		case "glass_destroyed":
		{
			if(self util::has_tac_vis(event.origin, 0) && distance2dsquared(event.origin, self.origin) < 36864)
			{
				event.type = "combat";
			}
			break;
		}
	}
}

/*
	Name: trigger_cover_blown
	Namespace: namespace_f1f700ac
	Checksum: 0x6AAD5940
	Offset: 0x2F98
	Size: 0x4A
	Parameters: 2
	Flags: Linked
*/
function trigger_cover_blown(event, bdocoverblownreaction)
{
	if(!isdefined(self.stealth))
	{
		return;
	}
	self.stealth.bcoverhasbeenblown = 1;
	self.stealth.bdocoverblownreaction = bdocoverblownreaction;
}

/*
	Name: react_announce
	Namespace: namespace_f1f700ac
	Checksum: 0xE412336E
	Offset: 0x2FF0
	Size: 0x2B4
	Parameters: 1
	Flags: Linked
*/
function react_announce(event)
{
	self endon(#"death");
	delaytime = randomfloatrange(0.5, 1.1);
	var_bed01a48 = hash(event.type);
	switch(var_bed01a48)
	{
		case "investigate":
		{
			self thread namespace_979752dc::function_f5f4416f("stealth", "announce", "investigate", delaytime);
			/#
				println(((("" + self getentitynumber()) + "") + event.typeorig) + "");
			#/
			/#
				stealth_debug::function_65b21ab8(self, "");
			#/
			return true;
		}
		case "cover_blown":
		{
			self thread namespace_979752dc::function_f5f4416f("stealth", "announce", "coverblown", delaytime);
			/#
				println(((("" + self getentitynumber()) + "") + event.typeorig) + "");
			#/
			/#
				stealth_debug::function_65b21ab8(self, "");
			#/
			return true;
		}
		case "combat":
		{
			self thread namespace_979752dc::function_f5f4416f("stealth", "announce", "combat", 1);
			/#
				println(((("" + self getentitynumber()) + "") + event.typeorig) + "");
			#/
			/#
				stealth_debug::function_65b21ab8(self, "");
			#/
			return true;
		}
	}
	return false;
}

/*
	Name: react_announce_specific
	Namespace: namespace_f1f700ac
	Checksum: 0x592F722C
	Offset: 0x32B0
	Size: 0x49C
	Parameters: 1
	Flags: Linked
*/
function react_announce_specific(event)
{
	self endon(#"death");
	if(isdefined(event.typeorig))
	{
		delaytime = randomfloatrange(0.5, 1);
		switch(event.typeorig)
		{
			case "sight":
			{
				self thread namespace_979752dc::function_f5f4416f("stealth", "announce", "sight", delaytime);
				return true;
			}
			case "explode":
			{
				self thread namespace_979752dc::function_f5f4416f("stealth", "announce", "explosion", delaytime);
				return true;
			}
			case "grenade danger":
			{
				self thread namespace_979752dc::function_f5f4416f("stealth", "announce", "grenade_danger", delaytime);
				return true;
			}
			case "seek_backup":
			{
				self thread namespace_979752dc::function_f5f4416f("stealth", "announce", "seek_backup", randomfloatrange(2, 2.5), event);
				return true;
			}
			case "saw_corpse":
			case "found_corpse":
			{
				self thread namespace_979752dc::function_f5f4416f("stealth", "announce", event.typeorig, delaytime);
				/#
					stealth_debug::function_65b21ab8(self, "");
				#/
				return true;
			}
			case "bulletwhizby":
			case "gunshot":
			{
				self thread namespace_979752dc::function_f5f4416f("stealth", "announce", "gunshot", 0.2, event);
				/#
					stealth_debug::function_65b21ab8(self, "");
				#/
				return true;
			}
			case "ally_damaged":
			case "gunshot_teammate":
			{
				self thread namespace_979752dc::function_f5f4416f("stealth", "announce", "gunshot", randomfloatrange(0.8, 1.3), event);
				/#
					stealth_debug::function_65b21ab8(self, "");
				#/
				return true;
			}
			case "ally_killed":
			{
				self thread namespace_979752dc::function_f5f4416f("stealth", "announce", "ally_killed", 0.5);
				/#
					stealth_debug::function_65b21ab8(self, "");
				#/
				return true;
			}
			case "proximity":
			{
				self thread namespace_979752dc::function_f5f4416f("stealth", "announce", "proximity", 0.5);
				return true;
			}
			case "footstep_sprint":
			case "footstep":
			case "glass_destroyed":
			case "footstep_run":
			{
				self thread namespace_979752dc::function_f5f4416f("stealth", "announce", "investigate", delaytime);
				return true;
			}
			default:
			{
				/#
					println(("" + event.typeorig) + "");
				#/
			}
		}
	}
	return false;
}

/*
	Name: setpatrolstyle_base
	Namespace: namespace_f1f700ac
	Checksum: 0xA2CCFDD0
	Offset: 0x3758
	Size: 0x1CC
	Parameters: 0
	Flags: Linked
*/
function setpatrolstyle_base()
{
	var_237ae2e3 = namespace_979752dc::get_patrol_style_default();
	var_ef544d66 = isdefined(var_237ae2e3) && var_237ae2e3 != "unaware" && var_237ae2e3 != "patrol";
	groupdata = stealth_group::getgroup(self.script_stealthgroup);
	var_9e029d73 = self.awarenesslevelcurrent !== "unaware" && (isdefined(self.stealth.bcoverhasbeenblown) || isdefined(groupdata.bcoverhasbeenblown));
	if(var_ef544d66 || var_9e029d73)
	{
		var_a0f0f6ed = isdefined(self.stealth.bdocoverblownreaction) && self.stealth.bdocoverblownreaction;
		var_ff42b0fb = namespace_979752dc::get_patrol_style() === "patrol" && var_a0f0f6ed;
		var_ff42b0fb = 0;
		self namespace_979752dc::set_patrol_style("alert", var_ff42b0fb, undefined, "small");
	}
	else
	{
		delay = (self getblackboardattribute("_human_demeanor") === "ALERT" ? 0.05 : 0);
		self thread function_6935155f("patrol", delay);
	}
}

/*
	Name: function_6935155f
	Namespace: namespace_f1f700ac
	Checksum: 0x4C7A9D7F
	Offset: 0x3930
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function function_6935155f(style, delay)
{
	self endon(#"death");
	if(delay > 0)
	{
		wait(delay);
	}
	self namespace_979752dc::set_patrol_style(style);
}

/*
	Name: bt_set_stealth_state
	Namespace: namespace_f1f700ac
	Checksum: 0xB68C44AB
	Offset: 0x3988
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function bt_set_stealth_state(statename, event)
{
	/#
		assert(isdefined(self.fnsetstealthstate));
	#/
	self [[self.fnsetstealthstate]](statename, event);
}

/*
	Name: bt_event_handler_severity
	Namespace: namespace_f1f700ac
	Checksum: 0x4FD57DA3
	Offset: 0x39E0
	Size: 0x28E
	Parameters: 1
	Flags: Linked
*/
function bt_event_handler_severity(event)
{
	event.investigate_pos = event.origin;
	if(isdefined(self.enemy) && isdefined(event.entity) && event.entity == self.enemy)
	{
		event.investigate_pos = self lastknownpos(self.enemy);
	}
	else if(isdefined(event.entity) && event.typeorig == "bulletwhizby")
	{
		event.investigate_pos = event.entity.origin;
	}
	self event_handler_translate_severity(event);
	if(self event_handler_should_ignore(event))
	{
		return false;
	}
	self.stealth.last_severity_time = gettime();
	if(!namespace_979752dc::bcisincombat())
	{
		if(!self react_announce_specific(event))
		{
			self react_announce(event);
		}
	}
	var_bed01a48 = hash(event.type);
	switch(var_bed01a48)
	{
		case "investigate":
		{
			self thread bt_event_investigate(event);
			break;
		}
		case "cover_blown":
		{
			self thread bt_event_cover_blown(event);
			break;
		}
		case "combat":
		{
			self thread bt_event_combat(event);
			break;
		}
	}
	level notify(#"stealth_event", {#receiver:self, #event:event});
	func = namespace_b2b86d39::stealth_get_func(event.typeorig);
	if(isdefined(func) && func != (&bt_event_handler_severity))
	{
		self thread [[func]](event);
	}
	return true;
}

/*
	Name: bt_event_investigate
	Namespace: namespace_f1f700ac
	Checksum: 0x71C2BDB3
	Offset: 0x3C78
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function bt_event_investigate(event)
{
	self set_alert_level("warning1", event);
	self bt_set_stealth_state("investigate", event);
}

/*
	Name: bt_event_cover_blown
	Namespace: namespace_f1f700ac
	Checksum: 0x8D5E0B26
	Offset: 0x3CD0
	Size: 0x34C
	Parameters: 1
	Flags: Linked
*/
function bt_event_cover_blown(event)
{
	if(event.typeorig == "sight" && self.awarenesslevelcurrent == "unaware" && self namespace_979752dc::function_d58e1c1c())
	{
		self set_alert_level("warning1", event);
	}
	else
	{
		if(event.typeorig == "sight" && self namespace_979752dc::function_d58e1c1c() && isdefined(event.entity))
		{
			self namespace_6c0cd084::function_7af4fa05(event.entity);
		}
		self set_alert_level("warning2", event);
	}
	if(isdefined(event.entity) && isdefined(event.entity.classname) && event.entity.classname == "script_vehicle_blackhornet")
	{
		return;
	}
	if(is_true(level.stealth.disguised))
	{
		switch(event.typeorig)
		{
			case "explode":
			case "silenced_shot":
			case "gunshot":
			{
				namespace_979752dc::set_disguised(0);
				level util::delay(20, undefined, &namespace_979752dc::set_disguised, 1);
				break;
			}
		}
	}
	if(event.typeorig == "light_killed")
	{
		event.look_pos = event.investigate_pos;
		event.investigate_pos = util::ground_position(event.investigate_pos);
	}
	if(isdefined(self.fnisinstealthcombat) && !self [[self.fnisinstealthcombat]]())
	{
		if(isdefined(self.fnisinstealthhunt) && self [[self.fnisinstealthhunt]]())
		{
			var_ffdc33b3 = stealth_group::group_updatepodhuntorigin(self, event.investigate_pos);
			if(!isdefined(self.pathgoalpos) || distancesquared(var_ffdc33b3, self.pathgoalpos) > 576)
			{
				self namespace_979752dc::function_2b21025e(event.investigate_pos);
				self namespace_979752dc::set_patrol_react(event.investigate_pos, "small");
			}
		}
		else
		{
			self bt_set_stealth_state("investigate", event);
		}
	}
}

/*
	Name: bt_event_combat
	Namespace: namespace_f1f700ac
	Checksum: 0x66B373E1
	Offset: 0x4028
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function bt_event_combat(event)
{
	if(!isactor(self))
	{
		return;
	}
	self endon(#"death");
	self notify(#"hash_543c5a6a505d931b");
	self notify(#"stop_going_to_node");
	self set_alert_level("attack", event);
	self bt_set_stealth_state("combat", event);
	if(isdefined(event) && issentient(event.entity))
	{
		if(!isdefined(self.enemy))
		{
			self resetthreatupdate();
		}
		self thread set_provide_cover_fire();
	}
	self flag::set("stealth_attack");
}

/*
	Name: set_provide_cover_fire
	Namespace: namespace_f1f700ac
	Checksum: 0x2E2B5396
	Offset: 0x4150
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function set_provide_cover_fire()
{
	self.providecoveringfire = 1;
	self endon(#"death");
	self endon(#"hash_6d1907ea25e20b08");
	self endon(#"hash_2b54d5e1df815470");
	self endon(#"stealth_combat");
	wait(5);
	self.providecoveringfire = 0;
}

