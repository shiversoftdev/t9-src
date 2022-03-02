#using script_1b905a8474ed2a62;
#using script_3728b3b9606c4299;
#using script_522aeb6ae906391e;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace siegebot;

/*
	Name: function_89f2df9
	Namespace: siegebot
	Checksum: 0x6D842A9
	Offset: 0x360
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"siegebot", &function_5de06a3f, undefined, undefined, undefined);
}

/*
	Name: function_5de06a3f
	Namespace: siegebot
	Checksum: 0x429B0A1D
	Offset: 0x3A8
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_5de06a3f()
{
	level.var_7fcdba66 = 1;
	vehicle::add_main_callback("siegebot", &siegebot_initialize);
	vehicle::add_main_callback("xbot", &siegebot_initialize);
	if(!isdefined(level.var_3d1b6323))
	{
		level.var_3d1b6323 = new throttle();
		[[ level.var_3d1b6323 ]]->initialize(1, float(function_60d95f53()) / 1000);
	}
}

/*
	Name: siegebot_initialize
	Namespace: siegebot
	Checksum: 0x1916122B
	Offset: 0x488
	Size: 0x45C
	Parameters: 0
	Flags: Linked
*/
function siegebot_initialize()
{
	self useanimtree("generic");
	blackboard::createblackboardforentity(self);
	self blackboard::registervehicleblackboardattributes();
	self.health = self.healthdefault;
	self vehicle::friendly_fire_shield();
	vehicle::make_targetable(self, (0, 0, 0));
	self enableaimassist();
	self setneargoalnotifydist(40);
	self.fovcosine = 0.5;
	self.fovcosinebusy = 0.5;
	self.maxsightdistsqrd = sqr(10000);
	/#
		assert(isdefined(self.scriptbundlesettings));
	#/
	self.settings = getscriptbundle(self.scriptbundlesettings);
	self.goalradius = 9999999;
	self.goalheight = 5000;
	vehicle::function_ea56e00e(self);
	self.overridevehicledamage = &siegebot_callback_damage;
	self turretsetontargettolerance(0, 5);
	if(self.scriptvehicletype == #"xbot")
	{
		self.destructible_event_handler = &xbot_destructible_event_handler;
		self.isxbot = 1;
	}
	self siegebot_update_difficulty();
	self turretsetontargettolerance(0, self.settings.gunner_turret_on_target_range);
	self asmrequestsubstate(#"locomotion@movement");
	if(self.vehicletype === "spawner_enemy_boss_siegebot_zombietron")
	{
		self asmsetanimationrate(0.5);
		self hidepart("tag_turret_canopy_animate");
		self hidepart("tag_turret_panel_01_d0");
		self hidepart("tag_turret_panel_02_d0");
		self hidepart("tag_turret_panel_03_d0");
		self hidepart("tag_turret_panel_04_d0");
		self hidepart("tag_turret_panel_05_d0");
	}
	else if(self.vehicletype == #"zombietron_veh_siegebot")
	{
		self asmsetanimationrate(2);
	}
	self initjumpstruct();
	if(isdefined(level.vehicle_initializer_cb))
	{
		[[level.vehicle_initializer_cb]](self);
	}
	self.airfollowconfig = spawnstruct();
	self.airfollowconfig.distance = 130;
	self.airfollowconfig.numberofpoints = 8;
	self.airfollowconfig.pitchrange = 90;
	self.airfollowconfig.tag = "tag_turret_null";
	self.disableburndamage = 1;
	self thread vehicle_ai::target_hijackers();
	self thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile(undefined, "crashing", "death");
	defaultrole();
}

/*
	Name: xbot_destructible_event_handler
	Namespace: siegebot
	Checksum: 0x82CBA407
	Offset: 0x8F0
	Size: 0xB2
	Parameters: 5
	Flags: Linked
*/
function xbot_destructible_event_handler(event, param1, param2, param3, param4)
{
	if(param3 == "broken")
	{
		message = param4;
		if(message == "left_arm_broken")
		{
			self.left_arm_disabled = 1;
		}
		else
		{
			if(message == "right_arm_broken")
			{
				self.right_arm_disabled = 1;
			}
			else if(message == "javelin_broken")
			{
				self.javelin_disabled = 1;
			}
		}
	}
}

/*
	Name: siegebot_update_difficulty
	Namespace: siegebot
	Checksum: 0xFC059D34
	Offset: 0x9B0
	Size: 0xBE
	Parameters: 0
	Flags: Linked
*/
function siegebot_update_difficulty()
{
	value = 1;
	if(isdefined(level.var_4b2a137e))
	{
		value = [[level.var_4b2a137e]]();
	}
	scale_up = mapfloat(0, 9, 0.8, 2, value);
	scale_down = mapfloat(0, 9, 1, 0.5, value);
	self.difficulty_scale_up = scale_up;
	self.difficulty_scale_down = scale_down;
}

/*
	Name: defaultrole
	Namespace: siegebot
	Checksum: 0x74EA61FF
	Offset: 0xA78
	Size: 0x284
	Parameters: 0
	Flags: Linked
*/
function defaultrole()
{
	self vehicle_ai::init_state_machine_for_role("default");
	self vehicle_ai::get_state_callbacks("combat").update_func = &state_combat_update;
	self vehicle_ai::get_state_callbacks("combat").exit_func = &state_combat_exit;
	self vehicle_ai::get_state_callbacks("driving").update_func = &siegebot_driving;
	self vehicle_ai::get_state_callbacks("death").update_func = &state_death_update;
	self vehicle_ai::get_state_callbacks("pain").update_func = &pain_update;
	self vehicle_ai::get_state_callbacks("emped").enter_func = &emped_enter;
	self vehicle_ai::get_state_callbacks("emped").update_func = &emped_update;
	self vehicle_ai::get_state_callbacks("emped").exit_func = &emped_exit;
	self vehicle_ai::get_state_callbacks("emped").reenter_func = &emped_reenter;
	self vehicle_ai::add_state("jump", &state_jump_enter, &state_jump_update, &state_jump_exit);
	vehicle_ai::add_utility_connection("combat", "jump", &state_jump_can_enter);
	vehicle_ai::add_utility_connection("jump", "combat");
	vehicle_ai::startinitialstate("combat");
}

/*
	Name: state_death_update
	Namespace: siegebot
	Checksum: 0x4C5AB93A
	Offset: 0xD08
	Size: 0x32C
	Parameters: 1
	Flags: Linked
*/
function state_death_update(params)
{
	self endon(#"death", #"nodeath_thread");
	streamermodelhint(self.deathmodel, 6);
	death_type = vehicle_ai::get_death_type(params);
	if(!isdefined(death_type))
	{
		params.death_type = "gibbed";
		death_type = params.death_type;
	}
	self clean_up_spawned();
	self setturretspinning(0);
	self stopmovementandsetbrake();
	badplace_box("", 0, self.origin, 50, "all");
	self vehicle::set_damage_fx_level(0);
	self playsound(#"veh_quadtank_sparks");
	if(self.vehicletype === "spawner_enemy_boss_siegebot_zombietron")
	{
		self asmsetanimationrate(1);
	}
	self.turretrotscale = 3;
	self turretsettargetangles(0, (0, 0, 0));
	self turretsettargetangles(1, (0, 0, 0));
	self turretsettargetangles(2, (0, 0, 0));
	self asmrequestsubstate(#"death@stationary");
	self waittill(#"model_swap");
	self vehicle_death::set_death_model(self.deathmodel, self.modelswapdelay);
	self vehicle::do_death_dynents();
	self vehicle_death::death_radius_damage();
	self waittilltimeout(3, #"bodyfall large");
	self radiusdamage(self.origin + vectorscale((0, 0, 1), 10), self.radius * 0.8, 150, 60, self, "MOD_CRUSH");
	vehicle_ai::waittill_asm_complete("death@stationary", 3);
	self disconnectpaths(1);
	self thread vehicle_death::cleanup();
	self vehicle_death::freewhensafe();
}

/*
	Name: siegebot_driving
	Namespace: siegebot
	Checksum: 0x93D01C90
	Offset: 0x1040
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function siegebot_driving(params)
{
	self thread siegebot_player_fireupdate();
	self thread siegebot_kill_on_tilting();
	self turretcleartarget(0);
	self cancelaimove();
	self function_d4c687c9();
}

/*
	Name: siegebot_kill_on_tilting
	Namespace: siegebot
	Checksum: 0xAD69015F
	Offset: 0x10D0
	Size: 0x14E
	Parameters: 0
	Flags: Linked
*/
function siegebot_kill_on_tilting()
{
	self endon(#"death", #"exit_vehicle");
	tilecount = 0;
	while(true)
	{
		selfup = anglestoup(self.angles);
		worldup = (0, 0, 1);
		if(vectordot(selfup, worldup) < 0.64)
		{
			tilecount = tilecount + 1;
		}
		else
		{
			tilecount = 0;
		}
		if(tilecount > 20)
		{
			driver = self getseatoccupant(0);
			if(isdefined(driver))
			{
				self usevehicle(driver, 0);
				self notify(#"flipped");
				util::wait_network_frame();
			}
			self kill(self.origin);
		}
		waitframe(1);
	}
}

/*
	Name: siegebot_player_fireupdate
	Namespace: siegebot
	Checksum: 0x5F001A6
	Offset: 0x1228
	Size: 0x110
	Parameters: 0
	Flags: Linked
*/
function siegebot_player_fireupdate()
{
	self endon(#"death", #"exit_vehicle");
	weapon = self seatgetweapon(2);
	firetime = weapon.firetime;
	driver = self getseatoccupant(0);
	self thread siegebot_player_aimupdate();
	while(true)
	{
		if(driver vehicleattackbuttonpressed())
		{
			if(isdefined(self.var_8c05c51a))
			{
				[[self.var_8c05c51a]]();
			}
			else
			{
				self fireweapon(2);
				wait(firetime);
			}
		}
		else
		{
			waitframe(1);
		}
	}
}

/*
	Name: siegebot_player_aimupdate
	Namespace: siegebot
	Checksum: 0x4CF2D6C8
	Offset: 0x1340
	Size: 0x86
	Parameters: 0
	Flags: Linked
*/
function siegebot_player_aimupdate()
{
	self endon(#"death", #"exit_vehicle");
	while(true)
	{
		target = self turretgettarget(1);
		if(isdefined(target))
		{
			self turretsettarget(2, target);
		}
		waitframe(1);
	}
}

/*
	Name: emped_enter
	Namespace: siegebot
	Checksum: 0xE84CD4D9
	Offset: 0x13D0
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function emped_enter(params)
{
	if(!isdefined(self.abnormal_status))
	{
		self.abnormal_status = spawnstruct();
	}
	self.abnormal_status.emped = 1;
	self.abnormal_status.attacker = params.param1;
	self.abnormal_status.inflictor = params.param2;
	self vehicle::toggle_emp_fx(1);
}

/*
	Name: emped_update
	Namespace: siegebot
	Checksum: 0x4104BA66
	Offset: 0x1468
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function emped_update(params)
{
	self endon(#"death", #"change_state");
	self stopmovementandsetbrake();
	if(self.vehicletype === "spawner_enemy_boss_siegebot_zombietron")
	{
		self asmsetanimationrate(1);
	}
	asmstate = "damage_2@pain";
	self asmrequestsubstate(asmstate);
	self vehicle_ai::waittill_asm_complete(asmstate, 3);
	self setbrake(0);
	self vehicle_ai::evaluate_connections();
}

/*
	Name: emped_exit
	Namespace: siegebot
	Checksum: 0xBA176106
	Offset: 0x1560
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function emped_exit(params)
{
}

/*
	Name: emped_reenter
	Namespace: siegebot
	Checksum: 0xC7223D5F
	Offset: 0x1578
	Size: 0xE
	Parameters: 1
	Flags: Linked
*/
function emped_reenter(params)
{
	return false;
}

/*
	Name: pain_toggle
	Namespace: siegebot
	Checksum: 0xDA2EC672
	Offset: 0x1590
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function pain_toggle(enabled)
{
	self._enablepain = enabled;
}

/*
	Name: pain_update
	Namespace: siegebot
	Checksum: 0x61C0D217
	Offset: 0x15B8
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function pain_update(params)
{
	self endon(#"death", #"change_state");
	self stopmovementandsetbrake();
	if(self.vehicletype === "spawner_enemy_boss_siegebot_zombietron")
	{
		self asmsetanimationrate(1);
	}
	if(self.newdamagelevel == 3)
	{
		asmstate = "damage_2@pain";
	}
	else
	{
		asmstate = "damage_1@pain";
	}
	self asmrequestsubstate(asmstate);
	self vehicle_ai::waittill_asm_complete(asmstate, 1.5);
	self setbrake(0);
	self vehicle_ai::evaluate_connections();
}

/*
	Name: clean_up_spawned
	Namespace: siegebot
	Checksum: 0x1EAD9537
	Offset: 0x16D0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function clean_up_spawned()
{
	if(isdefined(self.jump) && isdefined(self.jump.linkent))
	{
		self.jump.linkent delete();
	}
}

/*
	Name: clean_up_spawnedondeath
	Namespace: siegebot
	Checksum: 0xECB011F2
	Offset: 0x1720
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function clean_up_spawnedondeath(enttowatch)
{
	self endon(#"death");
	enttowatch waittill(#"death");
	self delete();
}

/*
	Name: initjumpstruct
	Namespace: siegebot
	Checksum: 0xA4B2B4C1
	Offset: 0x1778
	Size: 0x122
	Parameters: 0
	Flags: Linked
*/
function initjumpstruct()
{
	if(isdefined(self.jump))
	{
		self unlink();
		self.jump.linkent delete();
		self.jump delete();
	}
	self.jump = spawnstruct();
	self.jump.linkent = spawn("script_origin", self.origin);
	self.jump.linkent thread clean_up_spawnedondeath(self);
	self.jump.in_air = 0;
	self.jump.highgrounds = struct::get_array("balcony_point");
	self.jump.groundpoints = struct::get_array("ground_point");
}

/*
	Name: state_jump_can_enter
	Namespace: siegebot
	Checksum: 0x4D664C04
	Offset: 0x18A8
	Size: 0x4C
	Parameters: 3
	Flags: Linked
*/
function state_jump_can_enter(from_state, to_state, connection)
{
	if(is_true(self.nojumping))
	{
		return 0;
	}
	return self.vehicletype === "spawner_enemy_boss_siegebot_zombietron";
}

/*
	Name: state_jump_enter
	Namespace: siegebot
	Checksum: 0xEB5C60D8
	Offset: 0x1900
	Size: 0x1C4
	Parameters: 1
	Flags: Linked
*/
function state_jump_enter(params)
{
	goal = params.jumpgoal;
	trace = physicstrace(goal + vectorscale((0, 0, 1), 500), goal - vectorscale((0, 0, 1), 10000), vectorscale((-1, -1, -1), 10), vectorscale((1, 1, 1), 10), self, 2);
	if(0)
	{
		/#
			debugstar(goal, 60000, (0, 1, 0));
		#/
		/#
			debugstar(trace[#"position"], 60000, (0, 1, 0));
		#/
		/#
			line(goal, trace[#"position"], (0, 1, 0), 1, 0, 60000);
		#/
	}
	if(trace[#"fraction"] < 1)
	{
		goal = trace[#"position"];
	}
	self.jump.goal = goal;
	params.scaleforward = 40;
	params.gravityforce = vectorscale((0, 0, -1), 6);
	params.upbyheight = 50;
	params.landingstate = "land@jump";
	self pain_toggle(0);
	self stopmovementandsetbrake();
}

/*
	Name: state_jump_update
	Namespace: siegebot
	Checksum: 0xE14FA99E
	Offset: 0x1AD0
	Size: 0xB5C
	Parameters: 1
	Flags: Linked
*/
function state_jump_update(params)
{
	self endon(#"change_state", #"death");
	goal = self.jump.goal;
	self face_target(goal);
	self.jump.linkent.origin = self.origin;
	self.jump.linkent.angles = self.angles;
	waitframe(1);
	self linkto(self.jump.linkent);
	self.jump.in_air = 1;
	if(0)
	{
		/#
			debugstar(goal, 60000, (0, 1, 0));
		#/
		/#
			debugstar(goal + vectorscale((0, 0, 1), 100), 60000, (0, 1, 0));
		#/
		/#
			line(goal, goal + vectorscale((0, 0, 1), 100), (0, 1, 0), 1, 0, 60000);
		#/
	}
	totaldistance = distance2d(goal, self.jump.linkent.origin);
	forward = ((goal - self.jump.linkent.origin) / totaldistance[0], (goal - self.jump.linkent.origin) / totaldistance[1], 0);
	upbydistance = mapfloat(500, 2000, 46, 52, totaldistance);
	antigravitybydistance = 0;
	initvelocityup = (0, 0, 1) * (upbydistance + params.upbyheight);
	initvelocityforward = (forward * params.scaleforward) * mapfloat(500, 2000, 0.8, 1, totaldistance);
	velocity = initvelocityup + initvelocityforward;
	if(self.vehicletype === "spawner_enemy_boss_siegebot_zombietron")
	{
		self asmsetanimationrate(1);
	}
	self asmrequestsubstate(#"hash_513a4bf9337d7336");
	self waittill(#"engine_startup");
	self vehicle::impact_fx(self.settings.startupfx1);
	self waittill(#"leave_ground");
	self vehicle::impact_fx(self.settings.takeofffx1);
	while(true)
	{
		distancetogoal = distance2d(self.jump.linkent.origin, goal);
		antigravityscaleup = 1;
		antigravityscale = 1;
		antigravity = (0, 0, 0);
		if(0)
		{
			/#
				line(self.jump.linkent.origin, self.jump.linkent.origin + antigravity, (0, 1, 0), 1, 0, 60000);
			#/
		}
		velocityforwardscale = mapfloat(self.radius * 1, self.radius * 4, 0.2, 1, distancetogoal);
		velocityforward = initvelocityforward * velocityforwardscale;
		if(0)
		{
			/#
				line(self.jump.linkent.origin, self.jump.linkent.origin + velocityforward, (0, 1, 0), 1, 0, 60000);
			#/
		}
		oldverticlespeed = velocity[2];
		velocity = (0, 0, velocity[2]);
		velocity = velocity + ((velocityforward + params.gravityforce) + antigravity);
		if(oldverticlespeed > 0 && velocity[2] < 0)
		{
			self asmrequestsubstate(#"hash_7ed8f3dbe3df1eec");
		}
		if(velocity[2] < 0 && (self.jump.linkent.origin[2] + velocity[2]) < goal[2])
		{
			break;
		}
		heightthreshold = goal[2] + 110;
		oldheight = self.jump.linkent.origin[2];
		self.jump.linkent.origin = self.jump.linkent.origin + velocity;
		if(self.jump.linkent.origin[2] < heightthreshold && (oldheight > heightthreshold || (oldverticlespeed > 0 && velocity[2] < 0)))
		{
			self notify(#"start_landing");
			self asmrequestsubstate(params.landingstate);
		}
		if(0)
		{
			/#
				debugstar(self.jump.linkent.origin, 60000, (1, 0, 0));
			#/
		}
		waitframe(1);
	}
	self.jump.linkent.origin = (self.jump.linkent.origin[0], self.jump.linkent.origin[1], 0) + (0, 0, goal[2]);
	self notify(#"land_crush");
	foreach(player in level.players)
	{
		player val::set(#"hash_1199035500d4ef6a", "takedamage", 0);
	}
	self radiusdamage(self.origin + vectorscale((0, 0, 1), 15), self.radiusdamageradius, self.radiusdamagemax, self.radiusdamagemin, self, "MOD_EXPLOSIVE");
	foreach(player in level.players)
	{
		player val::reset(#"hash_1199035500d4ef6a", "takedamage");
		if(distance2dsquared(self.origin, player.origin) < sqr(200))
		{
			direction = (player.origin - self.origin[0], player.origin - self.origin[1], 0);
			if(abs(direction[0]) < 0.01 && abs(direction[1]) < 0.01)
			{
				direction = (randomfloatrange(1, 2), randomfloatrange(1, 2), 0);
			}
			direction = vectornormalize(direction);
			strength = 700;
			player setvelocity(player getvelocity() + (direction * strength));
			if(player.health > 80)
			{
				player dodamage(player.health - 70, self.origin, self);
			}
		}
	}
	self vehicle::impact_fx(self.settings.landingfx1);
	self stopmovementandsetbrake();
	wait(0.3);
	self unlink();
	waitframe(1);
	self.jump.in_air = 0;
	self notify(#"jump_finished");
	util::cooldown("jump", 7);
	self vehicle_ai::waittill_asm_complete(params.landingstate, 3);
	self vehicle_ai::evaluate_connections();
}

/*
	Name: state_jump_exit
	Namespace: siegebot
	Checksum: 0x9BB9E7CA
	Offset: 0x2638
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function state_jump_exit(params)
{
}

/*
	Name: state_combat_update
	Namespace: siegebot
	Checksum: 0xE1B7BF2
	Offset: 0x2650
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function state_combat_update(params)
{
	self endon(#"death", #"change_state");
	self thread movement_thread();
	self thread attack_thread_machinegun();
	self thread attack_thread_rocket();
	if(is_true(self.isxbot))
	{
		self thread attack_thread_main();
		self thread attack_thread_javelin();
	}
}

/*
	Name: state_combat_exit
	Namespace: siegebot
	Checksum: 0x640AF92C
	Offset: 0x2718
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function state_combat_exit(params)
{
	self turretcleartarget(0);
	self setturretspinning(0);
}

/*
	Name: locomotion_start
	Namespace: siegebot
	Checksum: 0x5079E401
	Offset: 0x2760
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function locomotion_start()
{
	if(self.vehicletype === "spawner_enemy_boss_siegebot_zombietron")
	{
		self asmsetanimationrate(0.5);
	}
	self asmrequestsubstate(#"locomotion@movement");
}

/*
	Name: weapon_doors_state
	Namespace: siegebot
	Checksum: 0x8B4C6DF5
	Offset: 0x27C0
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function weapon_doors_state(isopen, waittime)
{
	if(!isdefined(waittime))
	{
		waittime = 0;
	}
	self endon(#"death");
	self notify(#"weapon_doors_state");
	self endon(#"weapon_doors_state");
	if(isdefined(waittime) && waittime > 0)
	{
		wait(waittime);
	}
	self vehicle::toggle_ambient_anim_group(1, isopen);
}

/*
	Name: waittill_pathing_done
	Namespace: siegebot
	Checksum: 0x7A446E7E
	Offset: 0x2860
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function waittill_pathing_done(maxtime)
{
	if(!isdefined(maxtime))
	{
		maxtime = 15;
	}
	self endon(#"change_state");
	self notify("6c6e5a29d1dadca5");
	self endon("6c6e5a29d1dadca5");
	result = undefined;
	result = self waittilltimeout(maxtime, #"enemy", #"near_goal", #"force_goal", #"reached_end_node", #"pathfind_failed");
}

/*
	Name: movement_thread
	Namespace: siegebot
	Checksum: 0xBAB25363
	Offset: 0x2920
	Size: 0x2FC
	Parameters: 0
	Flags: Linked
*/
function movement_thread()
{
	self endon(#"death", #"change_state");
	self notify(#"end_movement_thread");
	self endon(#"end_movement_thread");
	/#
		assert(isdefined(level.var_3d1b6323));
	#/
	while(true)
	{
		if(isdefined(self.owner))
		{
			wait(1);
			continue;
		}
		[[ level.var_3d1b6323 ]]->waitinqueue(self);
		self.current_pathto_pos = self vehicle_ai::function_1d436633(self, self.enemy);
		if(!isdefined(self.current_pathto_pos))
		{
			wait(1);
			continue;
		}
		foundpath = self function_a57c34b7(self.current_pathto_pos, 0, 1);
		if(foundpath)
		{
			if(isdefined(self.enemy) && self seerecently(self.enemy, 1))
			{
				self vehlookat(self.enemy);
				self turretsettarget(0, self.enemy);
			}
			locomotion_start();
			self waittill_pathing_done();
			self cancelaimove();
			self function_d4c687c9();
			if(isdefined(self.enemy) && self seerecently(self.enemy, 2))
			{
				if(isdefined(self.isxbot))
				{
					self vehlookat(self.enemy);
					self turretsettarget(0, self.enemy);
				}
				else
				{
					self face_target(self.enemy.origin);
				}
			}
		}
		wait(1);
		startadditionalwaiting = gettime();
		while(isdefined(self.enemy) && self cansee(self.enemy) && util::timesince(startadditionalwaiting) < 1.5)
		{
			wait(0.4);
		}
	}
}

/*
	Name: stopmovementandsetbrake
	Namespace: siegebot
	Checksum: 0xEF99142
	Offset: 0x2C28
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function stopmovementandsetbrake()
{
	self notify(#"end_movement_thread");
	self notify(#"near_goal");
	self cancelaimove();
	self function_d4c687c9();
	self turretcleartarget(0);
	self vehclearlookat();
	self setbrake(1);
}

/*
	Name: face_target
	Namespace: siegebot
	Checksum: 0xD1CB2159
	Offset: 0x2CD0
	Size: 0x1DC
	Parameters: 2
	Flags: Linked
*/
function face_target(position, targetanglediff)
{
	if(!isdefined(targetanglediff))
	{
		targetanglediff = 30;
	}
	v_to_enemy = (position - self.origin[0], position - self.origin[1], 0);
	v_to_enemy = vectornormalize(v_to_enemy);
	goalangles = vectortoangles(v_to_enemy);
	anglediff = absangleclamp180(self.angles[1] - goalangles[1]);
	if(anglediff <= targetanglediff)
	{
		return;
	}
	self vehlookat(position);
	self turretsettarget(0, position);
	self locomotion_start();
	angleadjustingstart = gettime();
	while(anglediff > targetanglediff && util::timesince(angleadjustingstart) < 4)
	{
		anglediff = absangleclamp180(self.angles[1] - goalangles[1]);
		waitframe(1);
	}
	self function_d4c687c9();
	self vehclearlookat();
	self turretcleartarget(0);
	self cancelaimove();
}

/*
	Name: scan
	Namespace: siegebot
	Checksum: 0x5D17FAFB
	Offset: 0x2EB8
	Size: 0x20C
	Parameters: 0
	Flags: None
*/
function scan()
{
	angles = self gettagangles("tag_barrel");
	angles = (0, angles[1], 0);
	rotate = 360;
	while(rotate > 0)
	{
		angles = angles + vectorscale((0, 1, 0), 30);
		rotate = rotate - 30;
		forward = anglestoforward(angles);
		aimpos = self.origin + (forward * 1000);
		self turretsettarget(0, aimpos);
		self waittilltimeout(0.5, #"turret_on_target");
		wait(0.1);
		if(isdefined(self.enemy) && self cansee(self.enemy))
		{
			self turretsettarget(0, self.enemy);
			self vehlookat(self.enemy);
			self face_target(self.enemy);
			return;
		}
	}
	forward = anglestoforward(self.angles);
	aimpos = self.origin + (forward * 1000);
	self turretsettarget(0, aimpos);
	self waittilltimeout(3, #"turret_on_target");
	self turretcleartarget(0);
}

/*
	Name: attack_thread_machinegun
	Namespace: siegebot
	Checksum: 0x34782DBC
	Offset: 0x30D0
	Size: 0x2B8
	Parameters: 0
	Flags: Linked
*/
function attack_thread_machinegun()
{
	self endon(#"death", #"change_state", #"end_attack_thread");
	self notify(#"end_machinegun_attack_thread");
	self endon(#"end_machinegun_attack_thread");
	self.turretrotscale = 1 * self.difficulty_scale_up;
	spinning = 0;
	while(!is_true(self.left_arm_disabled))
	{
		enemy = self.enemy;
		if(is_true(self.isxbot))
		{
			enemy = self.gunner1enemy;
		}
		if(isdefined(enemy) && self cansee(enemy))
		{
			self vehlookat(enemy);
			self turretsettarget(0, enemy);
			if(!spinning)
			{
				spinning = 1;
				self setturretspinning(1);
				wait(0.5);
				continue;
			}
			self turretsettarget(1, enemy, (0, 0, 0));
			self turretsettarget(2, enemy, (0, 0, 0));
			self vehicle_ai::fire_for_time(randomfloatrange(0.75, 1.5) * self.difficulty_scale_up, 1, enemy);
			if(isdefined(enemy) && isai(enemy))
			{
				wait(randomfloatrange(0.1, 0.2));
			}
			else
			{
				wait(randomfloatrange(0.2, 0.3) * self.difficulty_scale_down);
			}
		}
		else
		{
			spinning = 0;
			self setturretspinning(0);
			self turretcleartarget(1);
			self turretcleartarget(2);
			wait(0.4);
		}
	}
}

/*
	Name: attack_rocket
	Namespace: siegebot
	Checksum: 0xD3EF724B
	Offset: 0x3390
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function attack_rocket(target)
{
	if(isdefined(target))
	{
		self turretsettarget(0, target);
		self turretsettarget(3, target, vectorscale((0, 0, -1), 10));
		self waittilltimeout(1, #"turret_on_target");
		self fireweapon(2, target, vectorscale((0, 0, -1), 10));
		self turretcleartarget(2);
	}
}

/*
	Name: function_e177d7af
	Namespace: siegebot
	Checksum: 0x2684DDAF
	Offset: 0x3448
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function function_e177d7af(target)
{
	if(isdefined(target))
	{
		self turretsettarget(0, target);
		self turretsettarget(3, target, vectorscale((0, 0, -1), 10));
		self waittilltimeout(1, #"turret_on_target");
		var_628cb978 = getweapon(#"hash_2a42cf9b8d71ff7e");
		v_aim_pos = target.origin;
		v_origin = self gettagorigin("tag_gunner_flash2");
		v_dir = vectornormalize(v_aim_pos - v_origin);
		var_a64609fe = v_dir * 1000;
		self magicmissile(var_628cb978, v_origin, var_a64609fe, target);
		self turretcleartarget(2);
	}
}

/*
	Name: attack_thread_rocket
	Namespace: siegebot
	Checksum: 0x1F80B5D2
	Offset: 0x3598
	Size: 0x3C0
	Parameters: 0
	Flags: Linked
*/
function attack_thread_rocket()
{
	self endon(#"death", #"change_state", #"end_attack_thread");
	self notify(#"end_rocket_attack_thread");
	self endon(#"end_rocket_attack_thread");
	util::cooldown("rocket", 3);
	while(!is_true(self.right_arm_disabled))
	{
		if(isdefined(self.gunner2enemy) && self seerecently(self.gunner2enemy, 3) && util::iscooldownready("rocket", 1.5) && !is_true(self.var_a8c60b0e))
		{
			self turretsettarget(1, self.gunner2enemy, (0, 0, 0));
			self turretsettarget(3, self.gunner2enemy, vectorscale((0, 0, -1), 10));
			self thread weapon_doors_state(1);
			wait(1.5);
			if(isdefined(self.gunner2enemy) && self seerecently(self.gunner2enemy, 1))
			{
				util::cooldown("rocket", 5);
				if(isdefined(self.gunner2enemy) && !is_true(self ai::function_63734291(self.gunner2enemy)))
				{
					attack_rocket(self.gunner2enemy);
				}
				else if(isdefined(self.gunner2enemy) && is_true(self ai::function_63734291(self.gunner2enemy)))
				{
					function_e177d7af(self.gunner2enemy);
				}
				wait(1);
				if(isdefined(self.gunner2enemy) && !is_true(self ai::function_63734291(self.gunner2enemy)))
				{
					attack_rocket(self.gunner2enemy);
				}
				else if(isdefined(self.gunner2enemy) && is_true(self ai::function_63734291(self.gunner2enemy)))
				{
					function_e177d7af(self.gunner2enemy);
				}
				self thread weapon_doors_state(0, 1);
			}
			else
			{
				self thread weapon_doors_state(0);
			}
		}
		else
		{
			self turretcleartarget(1);
			self turretcleartarget(2);
			wait(0.4);
		}
	}
}

/*
	Name: attack_thread_main
	Namespace: siegebot
	Checksum: 0x6E03CA0A
	Offset: 0x3960
	Size: 0xE0
	Parameters: 0
	Flags: Linked
*/
function attack_thread_main()
{
	self endon(#"death", #"change_state", #"end_attack_thread");
	while(true)
	{
		if(isdefined(self.enemy) && self cansee(self.enemy) && self.turretontarget)
		{
			self vehicle_ai::fire_for_time(randomfloatrange(0.75, 1.5), 0, self.enemy);
		}
		wait(randomfloatrange(0.5, 1.5));
	}
}

/*
	Name: attack_thread_javelin
	Namespace: siegebot
	Checksum: 0x3D591AD3
	Offset: 0x3A48
	Size: 0x280
	Parameters: 0
	Flags: Linked
*/
function attack_thread_javelin()
{
	self endon(#"death", #"change_state", #"end_attack_thread");
	while(!is_true(self.javelin_disabled))
	{
		if(isdefined(self.enemy) && util::iscooldownready("javelin_rocket_launcher"))
		{
			fired = 0;
			for(i = 0; i < 3 && isdefined(self.enemy); i++)
			{
				enemy = self.enemy;
				if(i == 1 && isdefined(self.gunner3enemy))
				{
					enemy = self.gunner3enemy;
					if(enemy == self.enemy)
					{
						continue;
					}
				}
				if(i == 2 && isdefined(self.gunner2enemy))
				{
					enemy = self.gunner2enemy;
					if(enemy == self.enemy)
					{
						continue;
					}
				}
				if(distance2dsquared(self.origin, enemy.origin) < sqr(300))
				{
					continue;
				}
				self thread vehicle_ai::javelin_losetargetatrighttime(enemy, 2);
				self fireweapon(3, enemy);
				fired = 1;
				wait(0.8);
			}
			if(fired)
			{
				cooldown = 15;
				if(self.scriptvehicletype == #"xbot")
				{
					if(is_true(self.left_arm_disabled))
					{
						cooldown = cooldown - 5;
					}
					if(is_true(self.right_arm_disabled))
					{
						cooldown = cooldown - 5;
					}
				}
				util::cooldown("javelin_rocket_launcher", cooldown);
			}
		}
		wait(0.3);
	}
}

/*
	Name: siegebot_callback_damage
	Namespace: siegebot
	Checksum: 0x6BDDFD45
	Offset: 0x3CD0
	Size: 0x270
	Parameters: 15
	Flags: Linked
*/
function siegebot_callback_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	if(vehicle_ai::should_emp(self, vsurfacenormal, partname, psoffsettime, damagefromunderneath))
	{
		minempdowntime = 0.8 * self.settings.empdowntime;
		maxempdowntime = 1.2 * self.settings.empdowntime;
		self notify(#"emped", {#param2:psoffsettime, #param1:damagefromunderneath, #param0:randomfloatrange(minempdowntime, maxempdowntime)});
	}
	if(!isdefined(self.damagelevel))
	{
		self.damagelevel = 0;
		self.newdamagelevel = self.damagelevel;
	}
	newdamagelevel = vehicle::should_update_damage_fx_level(self.health, modelindex, self.healthdefault);
	if(newdamagelevel > self.damagelevel)
	{
		self.newdamagelevel = newdamagelevel;
	}
	if(self.newdamagelevel > self.damagelevel)
	{
		self.damagelevel = self.newdamagelevel;
		driver = self getseatoccupant(0);
		if(!isdefined(driver))
		{
			self notify(#"pain");
		}
		vehicle::set_damage_fx_level(self.damagelevel);
	}
	if((self.health - modelindex) <= 0 && target_istarget(self))
	{
		target_remove(self);
	}
	return modelindex;
}

