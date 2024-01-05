#using script_79aa222369853cdc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\airsupport.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using script_4721de209091b1a6;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using script_396f7d71538c9677;

#namespace planemortar_shared;

/*
	Name: function_6242da6
	Namespace: planemortar_shared
	Checksum: 0x6D217378
	Offset: 0x238
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6242da6()
{
	level notify(1234096345);
}

#namespace planemortar;

/*
	Name: init_shared
	Namespace: planemortar
	Checksum: 0x537F1EA3
	Offset: 0x258
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	if(!isdefined(level.planemortar_shared))
	{
		level.planemortar_shared = {};
		airsupport::init_shared();
		clientfield::register("scriptmover", "planemortar_contrail", 1, 1, "int");
		clientfield::register_clientuimodel("hudItems.planeMortarShotsRemaining", 1, 2, "int");
		killstreaks::function_d8c32ca4("planemortar", &function_a385666);
		killstreaks::function_94c74046("planemortar");
		scene::add_scene_func(#"p9_fxanim_mp_planemortar_01_bundle", &function_ac3ad2f8, "play");
	}
}

/*
	Name: function_a385666
	Namespace: planemortar
	Checksum: 0x392744E1
	Offset: 0x368
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function function_a385666(slot)
{
	/#
		assert(slot != 3);
	#/
	var_127d1ed1 = (isdefined(self.pers[#"hash_1aaccfe69e328d6e"][slot]) ? self.pers[#"hash_1aaccfe69e328d6e"][slot] : 0);
	return var_127d1ed1 > 0;
}

/*
	Name: usekillstreakplanemortar
	Namespace: planemortar
	Checksum: 0x443AFBF5
	Offset: 0x3F0
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function usekillstreakplanemortar(hardpointtype)
{
	if(self killstreakrules::iskillstreakallowed(hardpointtype, self.team) == 0)
	{
		return false;
	}
	result = self selectplanemortarlocation(hardpointtype);
	if(!isdefined(result) || !result)
	{
		return false;
	}
	return true;
}

/*
	Name: waittill_confirm_location
	Namespace: planemortar
	Checksum: 0x7BDD7DEE
	Offset: 0x470
	Size: 0x56
	Parameters: 0
	Flags: None
*/
function waittill_confirm_location()
{
	self endon(#"emp_jammed", #"emp_grenaded");
	waitresult = undefined;
	waitresult = self waittill(#"confirm_location");
	return waitresult.position;
}

/*
	Name: function_a3cb6b44
	Namespace: planemortar
	Checksum: 0xFEF4223
	Offset: 0x4D0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_a3cb6b44()
{
	radius = (sessionmodeiswarzonegame() ? 2000 : 800);
	self beginlocationmortarselection("lui_plane_mortar", radius);
}

/*
	Name: selectplanemortarlocation
	Namespace: planemortar
	Checksum: 0x4B53055E
	Offset: 0x528
	Size: 0x608
	Parameters: 1
	Flags: Linked
*/
function selectplanemortarlocation(hardpointtype)
{
	self endon(#"disconnect");
	self.planemortarpilotindex = self namespace_f9b02f80::get_random_pilot_index("planemortar");
	params = killstreaks::get_script_bundle("planemortar");
	self airsupport::function_9e2054b0(&function_a3cb6b44);
	if(is_true(params.var_7436c1c5) && !is_true(self.pers[#"mortarradarused"]))
	{
		self thread airsupport::singleradarsweep();
	}
	if(isdefined(level.var_269fec2))
	{
		self [[level.var_269fec2]]();
	}
	if(!isdefined(self.var_b86e8690))
	{
		self.var_b86e8690 = new throttle();
		[[ self.var_b86e8690 ]]->initialize(1, params.var_e847a141);
	}
	killstreakid = undefined;
	slot = killstreaks::function_a2c375bb(hardpointtype);
	if(!isdefined(self.pers[#"hash_1aaccfe69e328d6e"]))
	{
		self.pers[#"hash_1aaccfe69e328d6e"] = [];
	}
	else if(!isarray(self.pers[#"hash_1aaccfe69e328d6e"]))
	{
		self.pers[#"hash_1aaccfe69e328d6e"] = array(self.pers[#"hash_1aaccfe69e328d6e"]);
	}
	selections = (isdefined(self.pers[#"hash_1aaccfe69e328d6e"][slot]) ? self.pers[#"hash_1aaccfe69e328d6e"][slot] : 3);
	self.pers[#"hash_1aaccfe69e328d6e"][slot] = selections;
	clientfield::set_player_uimodel("hudItems.planeMortarShotsRemaining", selections);
	yaw = randomintrange(0, 360);
	for(i = 0; i < selections; i++)
	{
		location = self airsupport::waitforlocationselection();
		if(!isdefined(location.origin) || (i == 0 && self killstreakrules::iskillstreakallowed(hardpointtype, self.team) == 0))
		{
			if(isdefined(killstreakid))
			{
				self thread function_16f87e96(6);
			}
			self.pers[#"hash_1aaccfe69e328d6e"][slot] = selections - i;
			self.pers[#"mortarradarused"] = 1;
			self notify(#"cancel_selection");
			return false;
		}
		if(!isdefined(killstreakid))
		{
			killstreakid = self killstreakrules::killstreakstart("planemortar", self.team, 0, 1);
			if(i == 0 && selections == 3)
			{
				self stats::function_dad108fa(#"call_in_killstreak_for_operator_mission", 1);
			}
			if((isdefined(self.var_fb18d24e) ? self.var_fb18d24e : 0) < gettime())
			{
				self namespace_f9b02f80::play_killstreak_start_dialog("planemortar", self.team, killstreakid);
				self.var_fb18d24e = gettime() + (int(battlechatter::mpdialog_value("planeMortarCooldown", 7) * 1000));
			}
			self thread function_5f89ffc2(hardpointtype, self.usingkillstreakfrominventory, slot);
		}
		clientfield::set_player_uimodel("hudItems.planeMortarShotsRemaining", (selections - i) - 1);
		self thread function_c47dc560(location.origin, killstreakid, params, i + 1, selections, yaw, self.usingkillstreakfrominventory, slot);
		self playsoundtoplayer(#"hash_40ab546591b2ecfa", self);
		wait(0.2);
	}
	if(!is_true(self.usingkillstreakfrominventory))
	{
		self killstreakrules::function_d9f8f32b("planemortar");
	}
	self notify(#"used");
	self.pers[#"hash_1aaccfe69e328d6e"][slot] = undefined;
	self.pers[#"mortarradarused"] = 0;
	self thread function_16f87e96(6);
	return true;
}

/*
	Name: function_c47dc560
	Namespace: planemortar
	Checksum: 0x5DB963B4
	Offset: 0xB38
	Size: 0x104
	Parameters: 8
	Flags: Linked
*/
function function_c47dc560(position, killstreakid, params, currentselection, var_cd46130c, yaw, isfrominventory, slot)
{
	team = self.team;
	if(currentselection == 1)
	{
		if(var_cd46130c == 3)
		{
			self stats::function_e24eec31(params.ksweapon, #"used", 1);
		}
		self thread planemortar_watchforendnotify(team, killstreakid, params.var_d3413870, isfrominventory, slot);
	}
	[[ self.var_b86e8690 ]]->waitinqueue();
	if(isdefined(self))
	{
		wait(0.1);
		self doartillerystrike(params, position, team, yaw, killstreakid);
	}
}

/*
	Name: doartillerystrike
	Namespace: planemortar
	Checksum: 0x304A0F45
	Offset: 0xC48
	Size: 0x114
	Parameters: 5
	Flags: Linked
*/
function doartillerystrike(params, position, team, yaw, killstreakid)
{
	self endon(#"disconnect");
	if(isdefined(params.var_675bebb2))
	{
		wait(params.var_675bebb2);
	}
	var_b0490eb9 = getheliheightlockheight(position);
	trace = groundtrace(position + (0, 0, var_b0490eb9), position + (0, 0, var_b0490eb9 * -1), 1, undefined);
	var_c5e0ca9e = trace[#"position"];
	level influencers::create_enemy_influencer("artillery", var_c5e0ca9e, team);
	self thread function_83e61117(var_c5e0ca9e, yaw, killstreakid);
}

/*
	Name: doplanemortar
	Namespace: planemortar
	Checksum: 0xCF50D97E
	Offset: 0xD68
	Size: 0x1FC
	Parameters: 2
	Flags: None
*/
function doplanemortar(positions, team)
{
	self endon(#"emp_jammed", #"disconnect");
	params = killstreaks::get_script_bundle("planemortar");
	wait(params.var_675bebb2);
	if(!isdefined(positions))
	{
		positions = [];
	}
	else if(!isarray(positions))
	{
		positions = array(positions);
	}
	yaw = randomintrange(0, 360);
	odd = 0;
	foreach(position in positions)
	{
		level influencers::create_enemy_influencer("artillery", position.origin, team);
		self thread function_4ef32baf(position.origin, yaw, team);
		if(odd == 0)
		{
			yaw = (yaw + 35) % 360;
		}
		else
		{
			yaw = (yaw + 290) % 360;
		}
		odd = (odd + 1) % 2;
		wait(0.8);
	}
	if(positions.size > 1)
	{
		self function_16f87e96();
	}
}

/*
	Name: function_16f87e96
	Namespace: planemortar
	Checksum: 0x9776212C
	Offset: 0xF70
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function function_16f87e96(predelay)
{
	self endon(#"disconnect");
	if(isdefined(predelay))
	{
		wait(predelay);
	}
	self notify(#"planemortarcomplete");
	wait(1);
	if(isdefined(level.plane_mortar_bda_dialog))
	{
		self thread [[level.plane_mortar_bda_dialog]]();
	}
}

/*
	Name: function_5f89ffc2
	Namespace: planemortar
	Checksum: 0xBDC6D79
	Offset: 0xFE0
	Size: 0x11C
	Parameters: 3
	Flags: Linked
*/
function function_5f89ffc2(hardpointtype, isfrominventory, slot)
{
	if(!isdefined(isfrominventory))
	{
		isfrominventory = 0;
	}
	result = undefined;
	result = self waittill(#"death", #"killstreak_used");
	if(isdefined(self) && result._notify == "death")
	{
		if(!is_true(getgametypesetting(#"hash_7647d0e9a45eeca6")))
		{
			self.pers[#"hash_1aaccfe69e328d6e"][slot] = undefined;
		}
		self killstreaks::function_aa56f6a0(hardpointtype, isfrominventory);
		if(!isfrominventory)
		{
			self killstreakrules::function_d9f8f32b("planemortar");
		}
	}
}

/*
	Name: planemortar_watchforendnotify
	Namespace: planemortar
	Checksum: 0xD66BD31B
	Offset: 0x1108
	Size: 0x154
	Parameters: 5
	Flags: Linked
*/
function planemortar_watchforendnotify(team, killstreak_id, killstreaktype, isfrominventory, slot)
{
	if(!isdefined(isfrominventory))
	{
		isfrominventory = 0;
	}
	self notify("54021368ba56d85");
	self endon("54021368ba56d85");
	self waittill(#"disconnect", #"joined_team", #"joined_spectators", #"planemortarcomplete", #"emp_jammed");
	killstreakrules::killstreakstop("planemortar", killstreak_id, killstreaktype);
	if(isdefined(self) && !isfrominventory)
	{
		var_b47e114f = (isdefined(self.pers[#"hash_1aaccfe69e328d6e"][slot]) ? self.pers[#"hash_1aaccfe69e328d6e"][slot] : 0);
		if(!var_b47e114f)
		{
			self killstreakrules::function_d9f8f32b("planemortar");
		}
	}
}

/*
	Name: function_ac3ad2f8
	Namespace: planemortar
	Checksum: 0xD9E979D2
	Offset: 0x1268
	Size: 0x25A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ac3ad2f8(ents)
{
	fakebomb = ents[#"bomb"];
	fakebomb endon(#"death");
	fakebomb waittill(#"spawn_killcam");
	angles = (35, self.angles[1] - 180, 0);
	direction = anglestoforward(angles);
	var_31688e84 = scene::function_12479eba(#"p9_fxanim_mp_planemortar_01_bundle");
	weapon = getweapon("planemortar");
	killcament = spawn("script_model", fakebomb gettagorigin("tag_killcam") + (vectorscale(direction, -1500)));
	killcament util::deleteaftertime(var_31688e84 * 2);
	killcament.starttime = gettime();
	killcament.angles = angles;
	killcament linkto(fakebomb, "tag_killcam");
	killcament setweapon(weapon);
	killcament killcam::store_killcam_entity_on_entity(self);
	killcament thread function_6ffdbd95(fakebomb);
	fakebomb waittill(#"magic_missile");
	if(isdefined(self.owner))
	{
		bomb = self.owner magicmissile(weapon, self.origin + vectorscale((0, 0, 1), 100), vectorscale((0, 0, -1), 5000));
		bomb.killstreakid = self.killstreakid;
		bomb.killcament = killcament;
	}
}

/*
	Name: function_6ffdbd95
	Namespace: planemortar
	Checksum: 0x1D3B7F4F
	Offset: 0x14D0
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_6ffdbd95(fakebomb)
{
	self endon(#"death");
	fakebomb endon(#"death");
	self rotatepitch(15, 3.5);
	wait(3.5);
	self rotatepitch(-15, 3);
	fakebomb waittill(#"unlink_killcam");
	self unlink();
}

/*
	Name: function_77ed0e9b
	Namespace: planemortar
	Checksum: 0x1CC81DC7
	Offset: 0x1588
	Size: 0x1E0
	Parameters: 2
	Flags: None
*/
function function_77ed0e9b(fakebomb, fxanim)
{
	/#
		fakebomb endon(#"magic_missile");
		while(true)
		{
			println("" + fxanim.angles);
			println("" + fxanim.origin);
			println("" + fakebomb.origin);
			println("" + self.origin);
			offset = fakebomb.origin - self.origin;
			println("" + offset);
			var_2c942dba = vectornormalize(offset);
			println("" + var_2c942dba);
			println("" + vectortoangles(var_2c942dba));
			println("" + self.angles);
			println("" + anglestoforward(self.angles));
			wait(0.5);
		}
	#/
}

/*
	Name: function_83e61117
	Namespace: planemortar
	Checksum: 0x2C0D06BC
	Offset: 0x1770
	Size: 0xD4
	Parameters: 3
	Flags: Linked
*/
function function_83e61117(position, baseyaw, killstreakid)
{
	yaw = baseyaw + (randomfloatrange(-1, 1));
	var_81c41c6e = util::spawn_model("tag_origin", position, (0, baseyaw, 0));
	var_81c41c6e.owner = self;
	var_81c41c6e.killstreakid = killstreakid;
	var_81c41c6e scene::play(#"p9_fxanim_mp_planemortar_01_bundle");
	wait(0.5);
	if(isdefined(var_81c41c6e))
	{
		var_81c41c6e delete();
	}
}

/*
	Name: function_4ef32baf
	Namespace: planemortar
	Checksum: 0xED3BD8FF
	Offset: 0x1850
	Size: 0x564
	Parameters: 3
	Flags: Linked
*/
function function_4ef32baf(position, yaw, team)
{
	self endon(#"emp_jammed");
	player = self;
	angles = (0, yaw, 0);
	direction = anglestoforward(angles);
	height = (killstreaks::function_43f4782d() + 2000) + (randomfloatrange(-200, 200));
	position = (position[0] + randomfloat(30), position[1] + randomfloat(30), height);
	startpoint = position + (vectorscale(direction, -12000));
	endpoint = position + vectorscale(direction, 18000);
	height = airsupport::getnoflyzoneheightcrossed(startpoint, endpoint, height);
	height = height + (randomfloatrange(-200, 200));
	startpoint = (startpoint[0], startpoint[1], height);
	position = (position[0], position[1], height);
	endpoint = (endpoint[0], endpoint[1], height);
	plane = spawn("script_model", startpoint);
	plane.weapon = getweapon("planemortar");
	plane setweapon(plane.weapon);
	plane.team = team;
	plane setteam(team);
	plane.targetname = "plane_mortar";
	plane setowner(self);
	plane.owner = self;
	plane endon(#"delete", #"death");
	plane.angles = angles;
	plane setmodel("veh_t8_mil_air_jet_fighter_mp_light");
	plane setenemymodel("veh_t8_mil_air_jet_fighter_mp_dark");
	plane clientfield::set("planemortar_contrail", 1);
	plane clientfield::set("enemyvehicle", 1);
	plane playsound(#"mpl_lightning_flyover_boom");
	plane setdrawinfrared(1);
	plane.killcament = spawn("script_model", (plane.origin + vectorscale((0, 0, 1), 700)) + (vectorscale(direction, -1500)));
	plane.killcament util::deleteaftertime(2 * 3);
	plane.killcament.angles = (15, yaw, 0);
	plane.killcament.starttime = gettime();
	plane.killcament linkto(plane);
	start = (position[0], position[1], plane.origin[2]);
	playsoundatposition(#"hash_5a17b7541482a04f", plane.origin);
	impact = bullettrace(start, start + (vectorscale((0, 0, -1), 100000)), 1, plane);
	plane moveto(endpoint, (2 * 5) / 4, 0, 0);
	plane.killcament thread followbomb(plane, position, direction, impact, player);
	wait(2 / 2);
	if(isdefined(self))
	{
		self thread dropbomb(plane, position);
	}
	wait((2 * 3) / 4);
	plane plane_cleanupondeath();
}

/*
	Name: followbomb
	Namespace: planemortar
	Checksum: 0x919ED37
	Offset: 0x1DC0
	Size: 0xCC
	Parameters: 5
	Flags: Linked
*/
function followbomb(plane, position, direction, impact, player)
{
	player endon(#"emp_jammed");
	wait((2 * 5) / 12);
	position.killcament unlink();
	position.killcament moveto((impact[#"position"] + vectorscale((0, 0, 1), 1000)) + (vectorscale(direction, -600)), 0.8, 0, 0.2);
}

/*
	Name: lookatexplosion
	Namespace: planemortar
	Checksum: 0x9819612A
	Offset: 0x1E98
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function lookatexplosion(bomb)
{
	while(isdefined(self) && isdefined(bomb))
	{
		angles = vectortoangles(vectornormalize(bomb.origin - self.origin));
		self.angles = (max(angles[0], 15), angles[1], angles[2]);
		waitframe(1);
	}
}

/*
	Name: planewatchforemp
	Namespace: planemortar
	Checksum: 0xB4EAF71
	Offset: 0x1F40
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function planewatchforemp(owner)
{
	self endon(#"delete", #"death");
	waitresult = undefined;
	waitresult = self waittill(#"emp_deployed");
	if(isdefined(level.planeawardscoreevent))
	{
		thread [[level.planeawardscoreevent]](waitresult.attacker, self);
	}
	self plane_cleanupondeath();
}

/*
	Name: plane_cleanupondeath
	Namespace: planemortar
	Checksum: 0x7055B6A
	Offset: 0x1FE0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function plane_cleanupondeath()
{
	self delete();
}

/*
	Name: dropbomb
	Namespace: planemortar
	Checksum: 0xDCEE7C76
	Offset: 0x2008
	Size: 0x22C
	Parameters: 2
	Flags: Linked
*/
function dropbomb(plane, bombposition)
{
	if(!isdefined(plane.owner))
	{
		return;
	}
	z = bombposition[2];
	targets = getplayers();
	foreach(target in targets)
	{
		if(plane.owner util::isenemyplayer(target) && distance2dsquared(target.origin, bombposition) < 250000)
		{
			if(bullettracepassed((target.origin[0], target.origin[1], plane.origin[2]), target.origin, 0, plane))
			{
				bombposition = target.origin;
				break;
			}
		}
	}
	bombposition = (bombposition[0], bombposition[1], z - 100);
	bomb = self magicmissile(getweapon("planemortar"), bombposition, vectorscale((0, 0, -1), 5000));
	bomb.soundmod = "heli";
	bomb playsound(#"mpl_lightning_bomb_incoming");
	bomb.killcament = plane.killcament;
	plane.killcament thread lookatexplosion(bomb);
}

