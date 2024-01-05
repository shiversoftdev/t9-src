#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\weapons\deployable.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\turret_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\placeables.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace mini_turret;

/*
	Name: __init__system__
	Namespace: mini_turret
	Checksum: 0x28F69917
	Offset: 0x1F0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"mini_turret", &function_70a657d8, undefined, undefined, #"zm_weapons");
}

/*
	Name: function_70a657d8
	Namespace: mini_turret
	Checksum: 0xCDAE9F0E
	Offset: 0x240
	Size: 0xFC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("vehicle", "mini_turret_open", 1, 1, "int");
	vehicle::add_main_callback("veh_mini_turret_zm", &initturret);
	weaponobjects::function_e6400478(#"mini_turret", &function_c41ea657, undefined);
	callback::on_revived(&on_player_revived);
	deployable::register_deployable(getweapon(#"mini_turret"), &function_2994c93, undefined, undefined, #"hash_2afe1c9235ce67ab");
}

/*
	Name: function_2994c93
	Namespace: mini_turret
	Checksum: 0xDE0AE51C
	Offset: 0x348
	Size: 0x78
	Parameters: 3
	Flags: None
*/
function function_2994c93(v_origin, v_angles, player)
{
	if(zm_utility::check_point_in_playable_area(player) && zm_utility::check_point_in_enabled_zone(player, 1) && ispointonnavmesh(player))
	{
		return true;
	}
	return false;
}

/*
	Name: on_player_revived
	Namespace: mini_turret
	Checksum: 0x5739C781
	Offset: 0x3C8
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function on_player_revived(s_params)
{
	if(isdefined(s_params) && isplayer(s_params.e_revivee))
	{
		e_revivee = s_params.e_revivee;
	}
	else if(isplayer(self))
	{
		e_revivee = self;
	}
	if(isdefined(e_revivee))
	{
		e_revivee thread weaponobjects::watchweaponobjectusage();
		e_revivee thread weaponobjects::watchweaponobjectspawn();
	}
}

/*
	Name: initturret
	Namespace: mini_turret
	Checksum: 0x4CE41392
	Offset: 0x470
	Size: 0xCA
	Parameters: 0
	Flags: None
*/
function initturret()
{
	turretvehicle = self;
	turretvehicle.dontfreeme = 1;
	turretvehicle.damage_on_death = 0;
	turretvehicle.delete_on_death = undefined;
	turretvehicle.maxhealth = 2000;
	turretvehicle.damagetaken = 0;
	turretvehicle.health = turretvehicle.maxhealth;
	turretvehicle.maxsightdistsqrd = 2500 * 2500;
	turretvehicle turretsetontargettolerance(0, 15);
	turretvehicle.soundmod = "mini_turret";
	turretvehicle.overridevehicledamage = &onturretdamage;
	turretvehicle.overridevehiclekilled = &onturretdeath;
}

/*
	Name: function_c41ea657
	Namespace: mini_turret
	Checksum: 0x81CE9C80
	Offset: 0x548
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function function_c41ea657(watcher)
{
	watcher.onspawn = &function_3be2d17f;
	watcher.ontimeout = &function_d3ea6abe;
}

/*
	Name: function_3be2d17f
	Namespace: mini_turret
	Checksum: 0x8085184F
	Offset: 0x590
	Size: 0x39C
	Parameters: 2
	Flags: None
*/
function function_3be2d17f(watcher, player)
{
	player endon(#"death", #"disconnect");
	level endon(#"game_ended");
	self endon(#"death");
	slot = player gadgetgetslot(self.weapon);
	if(is_true(player.b_talisman_extra_miniturret))
	{
		n_charge = player gadgetpowerget(slot);
		player gadgetpowerset(slot, n_charge - 50);
	}
	else
	{
		player gadgetpowerreset(slot);
		player gadgetpowerset(slot, 0);
	}
	self weaponobjects::onspawnuseweaponobject(watcher, player);
	self hide();
	if(isdefined(player))
	{
		player val::set(#"mini_turret", "freezecontrols");
	}
	self waittill(#"stationary");
	player stats::function_e24eec31(self.weapon, #"used", 1);
	self deployable::function_dd266e08(player);
	self.origin = self.origin + vectorscale((0, 0, 1), 2);
	player onplaceturret(self);
	if(isdefined(player))
	{
		player val::reset(#"mini_turret", "freezecontrols");
	}
	if(!isdefined(player.mini_turrets))
	{
		player.mini_turrets = [];
	}
	if(!isdefined(player.mini_turrets))
	{
		player.mini_turrets = [];
	}
	else if(!isarray(player.mini_turrets))
	{
		player.mini_turrets = array(player.mini_turrets);
	}
	player.mini_turrets[player.mini_turrets.size] = self.vehicle;
	if(isdefined(self.weapon) && isdefined(self.vehicle))
	{
		self.vehicle thread weaponobjects::function_d9c08e94(self.weapon.fusetime, &function_99f0804f);
		self.vehicle clientfield::set("mini_turret_open", 1);
	}
	self ghost();
	self thread function_24910d60();
	self.vehicle thread function_7f9eb7f();
}

/*
	Name: function_d3ea6abe
	Namespace: mini_turret
	Checksum: 0xA7D91C8B
	Offset: 0x938
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_d3ea6abe()
{
	if(isdefined(self) && isdefined(self.vehicle))
	{
		self.vehicle thread function_99f0804f();
	}
}

/*
	Name: function_24910d60
	Namespace: mini_turret
	Checksum: 0x7B4222D
	Offset: 0x978
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_24910d60()
{
	vehicle = self.vehicle;
	waitresult = undefined;
	waitresult = self waittill(#"death");
	if(waitresult._notify != "death")
	{
		return;
	}
	if(isdefined(vehicle))
	{
		vehicle function_45ffb470(undefined, undefined);
	}
}

/*
	Name: function_7f9eb7f
	Namespace: mini_turret
	Checksum: 0x2D4E2645
	Offset: 0xA00
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function function_7f9eb7f()
{
	owner = self.owner;
	owner endon(#"disconnect");
	waitresult = undefined;
	waitresult = self waittill(#"death", #"death_started");
	if(!isdefined(self))
	{
		arrayremovevalue(owner.mini_turrets, undefined);
	}
	else if(self.damagetaken > self.health)
	{
		arrayremovevalue(owner.mini_turrets, self);
	}
}

/*
	Name: onplaceturret
	Namespace: mini_turret
	Checksum: 0x2C94C9C
	Offset: 0xAC0
	Size: 0x4A4
	Parameters: 1
	Flags: None
*/
function onplaceturret(turret)
{
	player = self;
	/#
		assert(isplayer(player));
	#/
	if(isdefined(turret.vehicle))
	{
		turret.vehicle.origin = turret.origin;
		turret.vehicle.angles = turret.angles;
		turret.vehicle thread util::ghost_wait_show(0.05);
		turret.vehicle playsound(#"mpl_turret_startup");
	}
	else
	{
		turret.vehicle = spawnvehicle("veh_mini_turret_zm", turret.origin, turret.angles, "dynamic_spawn_ai");
		turret.vehicle.owner = player;
		turret.vehicle setowner(player);
		turret.vehicle.ownerentnum = player.entnum;
		turret.vehicle.parentstruct = turret;
		turret.vehicle.controlled = 0;
		turret.vehicle.treat_owner_damage_as_friendly_fire = 1;
		turret.vehicle.ignore_team_kills = 1;
		turret.vehicle.deal_no_crush_damage = 1;
		turret.vehicle.turret = turret;
		turret.vehicle.team = player.team;
		turret.vehicle setteam(player.team);
		turret.vehicle turret::set_team(player.team, 0);
		turret.vehicle turret::set_torso_targetting(0);
		turret.vehicle turret::set_target_leading(0);
		turret.vehicle.use_non_teambased_enemy_selection = 1;
		turret.vehicle.waittill_turret_on_target_delay = 0.25;
		turret.vehicle.ignore_vehicle_underneath_splash_scalar = 1;
		turret.vehicle thread turret_watch_owner_events();
		turret.vehicle thread turret_laser_watch();
		turret.vehicle thread setup_death_watch_for_new_targets();
		turret.vehicle thread function_31477582();
		turret.vehicle thread util::ghost_wait_show(0.05);
		turret.vehicle.var_63d65a8d = "arc";
		turret.vehicle notsolid();
		if(issentient(turret.vehicle) == 0)
		{
			turret.vehicle makesentient();
		}
		player stats::function_e24eec31(getweapon(#"mini_turret"), #"used", 1);
	}
	turret.vehicle playloopsound(#"hash_69240c6db92da5bf", 0.25);
	turret.vehicle.turret_enabled = 1;
	target_set(turret.vehicle, vectorscale((0, 0, 1), 36));
	turret.vehicle unlink();
	turret.vehicle vehicle::connect_paths();
	turret.vehicle thread turretscanning();
}

/*
	Name: onturretdamage
	Namespace: mini_turret
	Checksum: 0x99276472
	Offset: 0xF70
	Size: 0x188
	Parameters: 15
	Flags: None
*/
function onturretdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	empdamage = int((vdamageorigin + (self.healthdefault * 1)) + 0.5);
	var_820fb5ae = self.damagetaken;
	self.damagetaken = self.damagetaken + vdamageorigin;
	if(self.damagetaken > 100 && 100 >= var_820fb5ae)
	{
		playfxontag(#"hash_3215f91a276a69ec", self, "tag_fx");
	}
	if(self.damagetaken > self.maxhealth && !isdefined(self.will_die))
	{
		self.will_die = 1;
		self thread ondeathafterframeend(vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
	}
	return vdamageorigin;
}

/*
	Name: onturretdeath
	Namespace: mini_turret
	Checksum: 0xE85B3AF0
	Offset: 0x1100
	Size: 0x6C
	Parameters: 8
	Flags: None
*/
function onturretdeath(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime)
{
	self ondeath(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime);
}

/*
	Name: ondeathafterframeend
	Namespace: mini_turret
	Checksum: 0xC021B342
	Offset: 0x1178
	Size: 0x74
	Parameters: 8
	Flags: None
*/
function ondeathafterframeend(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime)
{
	waittillframeend();
	if(isdefined(self))
	{
		self ondeath(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime);
	}
}

/*
	Name: ondeath
	Namespace: mini_turret
	Checksum: 0x6F0FA19B
	Offset: 0x11F8
	Size: 0x2D4
	Parameters: 8
	Flags: None
*/
function ondeath(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime)
{
	turretvehicle = self;
	turretvehicle notify(#"death_started");
	if(turretvehicle.dead === 1)
	{
		return;
	}
	turretvehicle.dead = 1;
	turretvehicle disabledriverfiring(1);
	turretvehicle.turret_enabled = 0;
	psoffsettime = self [[level.figure_out_attacker]](psoffsettime);
	if(isdefined(turretvehicle.parentstruct))
	{
		turretvehicle.parentstruct placeables::forceshutdown();
	}
	if(isdefined(level.var_d2600afc))
	{
		self [[level.var_d2600afc]](psoffsettime, self.owner, self.turretweapon);
	}
	turretvehicle stoploopsound(0.5);
	turretvehicle playsound("mpl_turret_exp");
	playfx(level._equipment_explode_fx_lg, self.origin);
	if(isdefined(self.owner) && isdefined(level.playequipmentdestroyedonplayer))
	{
		self.owner [[level.playequipmentdestroyedonplayer]]();
	}
	var_980fde21 = self.turret;
	wait(0.1);
	if(isdefined(turretvehicle))
	{
		turretvehicle ghost();
		turretvehicle notsolid();
		turretvehicle waittilltimeout(2, #"remote_weapon_end", #"death");
	}
	if(isdefined(turretvehicle))
	{
		while(isdefined(turretvehicle) && (turretvehicle.controlled || !isdefined(turretvehicle.owner)))
		{
			waitframe(1);
		}
		if(isdefined(turretvehicle))
		{
			turretvehicle.dontfreeme = undefined;
			wait(0.5);
		}
		if(isdefined(turretvehicle))
		{
			turretvehicle delete();
		}
	}
	if(isdefined(var_980fde21))
	{
		var_980fde21 delete();
	}
}

/*
	Name: onshutdown
	Namespace: mini_turret
	Checksum: 0x4504E17E
	Offset: 0x14D8
	Size: 0x20
	Parameters: 1
	Flags: None
*/
function onshutdown(turret)
{
	turret notify(#"mini_turret_shutdown");
}

/*
	Name: turret_watch_owner_events
	Namespace: mini_turret
	Checksum: 0xBD88590
	Offset: 0x1500
	Size: 0x114
	Parameters: 0
	Flags: None
*/
function turret_watch_owner_events()
{
	self notify(#"turret_watch_owner_events_singleton");
	self endon(#"death", #"turret_watch_owner_events_singleton");
	self.owner waittill(#"joined_team", #"disconnect", #"joined_spectators", #"changed_specialist");
	self makevehicleusable();
	self.controlled = 0;
	if(isdefined(self.owner))
	{
		self.owner unlink();
	}
	self makevehicleunusable();
	self.abandoned = 1;
	onshutdown(self);
	self function_99f0804f();
}

/*
	Name: turret_laser_watch
	Namespace: mini_turret
	Checksum: 0x76D6DB52
	Offset: 0x1620
	Size: 0xD8
	Parameters: 0
	Flags: None
*/
function turret_laser_watch()
{
	veh = self;
	veh endon(#"death");
	while(true)
	{
		laser_should_be_on = !veh.controlled && isdefined(veh.enemy);
		if(laser_should_be_on)
		{
			if(islaseron(veh) == 0)
			{
				veh vehicle::enable_laser(1, 0);
			}
		}
		else if(islaseron(veh))
		{
			veh vehicle::enable_laser(0, 0);
		}
		wait(0.25);
	}
}

/*
	Name: setup_death_watch_for_new_targets
	Namespace: mini_turret
	Checksum: 0x3928BCE1
	Offset: 0x1700
	Size: 0xAE
	Parameters: 0
	Flags: None
*/
function setup_death_watch_for_new_targets()
{
	turretvehicle = self;
	turretvehicle endon(#"death");
	old_target = undefined;
	while(true)
	{
		waitresult = undefined;
		waitresult = turretvehicle waittill(#"has_new_target");
		if(isdefined(old_target))
		{
			old_target notify(#"abort_death_watch");
		}
		waitresult.target thread target_death_watch(turretvehicle);
		old_target = waitresult.target;
	}
}

/*
	Name: target_death_watch
	Namespace: mini_turret
	Checksum: 0xDAD1ED1D
	Offset: 0x17B8
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function target_death_watch(turretvehicle)
{
	target = self;
	target endon(#"abort_death_watch");
	turretvehicle endon(#"death");
	target waittill(#"death", #"disconnect", #"joined_team", #"joined_spectators");
	turretvehicle clearenemy();
}

/*
	Name: turretscanning
	Namespace: mini_turret
	Checksum: 0x947373E6
	Offset: 0x1870
	Size: 0x7E8
	Parameters: 0
	Flags: None
*/
function turretscanning()
{
	veh = self;
	veh endon(#"death", #"death_started", #"end_turret_scanning");
	veh.turret_target = undefined;
	veh.do_not_clear_targets_during_think = 1;
	wait(0.8);
	veh playsound(#"mpl_turret_startup");
	veh playloopsound(#"hash_69240c6db92da5bf");
	while(true)
	{
		if(veh.controlled || !veh.turret_enabled)
		{
			wait(0.5);
			continue;
		}
		if(isdefined(veh.enemy))
		{
			if(isvehicle(veh.enemy) && issentient(veh.enemy) && !veh.enemy.var_232915af === 1)
			{
				veh setignoreent(veh.enemy, 1);
				wait(0.1);
				continue;
			}
		}
		if(veh has_active_enemy() && isdefined(veh.enemy) && isalive(veh.enemy))
		{
			veh.turretrotscale = getdvarfloat(#"hash_7a767607be3081e9", 3);
			if(!isdefined(veh.turret_target) || veh.turret_target != veh.enemy)
			{
				veh vehicle_ai::setturrettarget(veh.enemy, 0, vectorscale((0, 0, -1), 15));
				veh.turret_target = veh.enemy;
				veh playsoundtoteam("mpl_turret_alert", veh.team);
			}
			if(veh.turretontarget)
			{
				if(1)
				{
					fire_time = (0.33 < 0.33 ? randomfloatrange(0.33, 0.33) : 0.33);
					var_fc9f290e = veh.enemy;
					veh vehicle_ai::fire_for_time(fire_time, 0, veh.enemy);
					var_afae28e0 = !isdefined(var_fc9f290e) || !isalive(var_fc9f290e);
					if(0.34 > 0 && !var_afae28e0)
					{
						pause_time = (0.34 < 0.34 ? randomfloatrange(0.34, 0.34) : 0.34);
						waitresult = undefined;
						waitresult = veh.turret_target waittilltimeout(pause_time, #"death", #"disconnect");
						var_afae28e0 = waitresult._notify === "death";
					}
				}
				else
				{
					var_fc9f290e = veh.enemy;
					veh vehicle_ai::fire_for_rounds(10, 0, veh.enemy);
					var_afae28e0 = !isdefined(var_fc9f290e) || !isalive(var_fc9f290e);
				}
				if(var_afae28e0 && isdefined(veh.turret_target) && isdefined(veh.turret_target.var_e78602fc) && veh.turret_target.var_e78602fc == veh)
				{
					veh.owner playsoundtoplayer(#"hash_7ea486136cd776c", veh.owner);
					veh.turretrotscale = 1;
					wait(randomfloatrange(0.05, 0.2));
				}
			}
			else
			{
				wait(0.25);
			}
			continue;
		}
		var_4ec572ee = isdefined(veh.turret_target);
		var_bb861d93 = 0;
		if(var_4ec572ee)
		{
			var_bb861d93 = isalive(veh.turret_target);
			veh setpersonalignore(veh.turret_target, 1.5);
		}
		veh clearenemy();
		veh.turret_target = undefined;
		veh.turretrotscale = 1;
		if(var_4ec572ee && var_bb861d93)
		{
			veh playsoundtoteam("mpl_turret_lost", veh.team);
		}
		if(veh.var_63d65a8d == "arc")
		{
			if(veh.scanpos === "left")
			{
				veh turretsettargetangles(0, (-20, 40, 0));
				veh.scanpos = "right";
			}
			else
			{
				veh turretsettargetangles(0, (-20, -40, 0));
				veh.scanpos = "left";
			}
		}
		else
		{
			if(veh.scanpos === "left")
			{
				veh turretsettargetangles(0, (-20, 180, 0));
				veh.scanpos = "left2";
			}
			else
			{
				if(veh.scanpos === "left2")
				{
					veh turretsettargetangles(0, (-20, 360, 0));
					veh.scanpos = "right";
				}
				else
				{
					if(veh.scanpos === "right")
					{
						veh turretsettargetangles(0, (-20, -180, 0));
						veh.scanpos = "right2";
					}
					else
					{
						veh turretsettargetangles(0, (-20, -360, 0));
						veh.scanpos = "left";
					}
				}
			}
		}
		veh waittilltimeout(3.5, #"enemy");
	}
}

/*
	Name: has_active_enemy
	Namespace: mini_turret
	Checksum: 0xDF730A72
	Offset: 0x2060
	Size: 0x26
	Parameters: 0
	Flags: None
*/
function has_active_enemy()
{
	if(!isdefined(self.enemylastseentime))
	{
		return 0;
	}
	return gettime() < (self.enemylastseentime + 1000);
}

/*
	Name: function_99f0804f
	Namespace: mini_turret
	Checksum: 0x5C311FD1
	Offset: 0x2090
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_99f0804f()
{
	self thread function_45ffb470(undefined, undefined);
}

/*
	Name: function_45ffb470
	Namespace: mini_turret
	Checksum: 0xED601D3C
	Offset: 0x20B8
	Size: 0xE4
	Parameters: 2
	Flags: None
*/
function function_45ffb470(attacker, callback_data)
{
	if(!isdefined(self))
	{
		return;
	}
	if(self.dead === 1)
	{
		return;
	}
	playfx(level._equipment_explode_fx_lg, self.origin);
	self playsound("mpl_turret_exp");
	self stoploopsound(0.5);
	turret = self.turret;
	self delete();
	if(isdefined(self.turret))
	{
		self.turret delete();
	}
}

/*
	Name: function_31477582
	Namespace: mini_turret
	Checksum: 0x43BA753F
	Offset: 0x21A8
	Size: 0x1BC
	Parameters: 0
	Flags: None
*/
function function_31477582()
{
	self endon(#"death");
	waitframe(1);
	var_463c449d = 386.0886 * (float(function_60d95f53()) / 1000);
	max_delta = 1;
	while(true)
	{
		if(!isdefined(self.turret))
		{
			wait(1);
			continue;
		}
		trace = physicstrace(self.origin + (0, 0, 0), self.origin + (vectorscale((0, 0, -1), 10)), (-3, -3, -1), (3, 3, 1), self.turret, 1 | 16);
		if(trace[#"fraction"] > 0)
		{
			new_origin = trace[#"position"];
			self.origin = (new_origin[0], new_origin[1], self.origin[2] - (min(max_delta, self.origin[2] - new_origin[2])));
			max_delta = max_delta + var_463c449d;
			waitframe(1);
			continue;
		}
		max_delta = 1;
		wait(1);
	}
}

