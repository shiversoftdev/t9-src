#using script_1cc417743d7c262d;
#using script_383a3b1bb18ba876;
#using script_396f7d71538c9677;
#using script_3b334409f11762b8;
#using script_4721de209091b1a6;
#using script_4a81c26d2ddde9c;
#using script_61828ad9e71c6616;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using script_7bdcff4f92f3d220;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_player.gsc;

#namespace planemortar;

/*
	Name: function_cb58f261
	Namespace: planemortar
	Checksum: 0x572D4D6F
	Offset: 0x2A0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cb58f261()
{
	level notify(226835720);
}

/*
	Name: function_89f2df9
	Namespace: planemortar
	Checksum: 0x53DC062E
	Offset: 0x2C0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"planemortar", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: planemortar
	Checksum: 0xFCD8D75B
	Offset: 0x310
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	clientfield::register("scriptmover", "planemortar_marker_on", 1, 2, "int");
	bundlename = "killstreak_planemortar" + "_zm";
	killstreaks::function_e4ef8390(bundlename, &function_c9ca313b);
	level.plane_mortar_bda_dialog = &plane_mortar_bda_dialog;
	level.var_269fec2 = &function_269fec2;
	level.var_eb0c5d6 = 1;
	zm_player::register_player_damage_callback(&function_5e7e3e86);
}

/*
	Name: function_269fec2
	Namespace: planemortar
	Checksum: 0x6441C3CC
	Offset: 0x400
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function function_269fec2()
{
	if(isdefined(level.var_30264985))
	{
		self notify(#"mortarradarused");
	}
}

/*
	Name: plane_mortar_bda_dialog
	Namespace: planemortar
	Checksum: 0xECE04461
	Offset: 0x430
	Size: 0x1DE
	Parameters: 0
	Flags: Linked
*/
function plane_mortar_bda_dialog()
{
	if(isdefined(self.planemortarbda))
	{
		if(self.planemortarbda === 1)
		{
			bdadialog = "kill1";
			killconfirmed = "killConfirmed1_p";
		}
		else
		{
			if(self.planemortarbda === 2)
			{
				bdadialog = "kill2";
				killconfirmed = "killConfirmed2_p";
			}
			else
			{
				if(self.planemortarbda === 3)
				{
					bdadialog = "kill3";
					killconfirmed = "killConfirmed3_p";
				}
				else if(isdefined(self.planemortarbda) && self.planemortarbda > 3)
				{
					bdadialog = "killMultiple";
					killconfirmed = "killConfirmedMult_p";
				}
			}
		}
		self namespace_f9b02f80::play_pilot_dialog(bdadialog, "planemortar", undefined, self.planemortarpilotindex);
		if(battlechatter::dialog_chance("taacomPilotKillConfirmChance"))
		{
			self namespace_f9b02f80::play_taacom_dialog_response(killconfirmed, "planemortar", undefined, self.planemortarpilotindex);
		}
		else
		{
			self namespace_f9b02f80::play_taacom_dialog_response("hitConfirmed_p", "planemortar", undefined, self.planemortarpilotindex);
		}
		globallogic_audio::play_taacom_dialog("confirmHit");
	}
	else
	{
		namespace_f9b02f80::play_pilot_dialog("killNone", "planemortar", undefined, self.planemortarpilotindex);
		globallogic_audio::play_taacom_dialog("confirmMiss");
	}
	self.planemortarbda = undefined;
}

/*
	Name: function_c9ca313b
	Namespace: planemortar
	Checksum: 0xFED64731
	Offset: 0x618
	Size: 0x112
	Parameters: 1
	Flags: Linked
*/
function function_c9ca313b(killstreaktype)
{
	if(!self killstreakrules::iskillstreakallowed("planemortar", self.team))
	{
		return 0;
	}
	if(!self killstreakrules::function_71e94a3b())
	{
		self.var_baf4657c = 1;
		self killstreakrules::function_65739e7b("planemortar");
		return;
	}
	if(isint(level.var_fd269dce))
	{
		level.var_fd269dce = (level.var_fd269dce + 1) % 100;
	}
	else
	{
		level.var_fd269dce = 0;
	}
	if(isdefined(level.var_269fec2))
	{
		self [[level.var_269fec2]]();
	}
	result = function_66133f8b(level.var_fd269dce);
	return result;
}

/*
	Name: function_58189f7d
	Namespace: planemortar
	Checksum: 0xAC70807F
	Offset: 0x738
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_58189f7d(killstreaktype)
{
	self endon(#"death");
	waitresult = undefined;
	waitresult = self waittill(#"weapon_fired", #"weapon_change");
	if(!self killstreakrules::function_71e94a3b() && waitresult._notify === "weapon_fired")
	{
		return false;
	}
	if(waitresult._notify === "weapon_fired")
	{
		return true;
	}
	return false;
}

/*
	Name: function_4776caf4
	Namespace: planemortar
	Checksum: 0xEF24ADB1
	Offset: 0x7F8
	Size: 0x2D4
	Parameters: 1
	Flags: Private, Event
*/
event private function_4776caf4(eventstruct)
{
	if(!is_true(level.var_eb0c5d6))
	{
		return;
	}
	if(!isplayer(self))
	{
		return;
	}
	weapon = eventstruct.weapon;
	if(!isdefined(weapon))
	{
		return;
	}
	if(weapon == killstreaks::get_killstreak_weapon("planemortar") || weapon == (killstreaks::get_killstreak_weapon("inventory_" + "planemortar")))
	{
		if(!self killstreakrules::function_71e94a3b())
		{
			self.var_baf4657c = 1;
			self killstreakrules::function_65739e7b("planemortar");
			projectile = eventstruct.projectile;
			if(isdefined(projectile))
			{
				projectile delete();
			}
			return;
		}
		projectile = eventstruct.projectile;
		if(isdefined(projectile))
		{
			projectile endon(#"death");
			projectile waittill(#"rolling");
			if(isdefined(projectile))
			{
				playfxontag("weapon/fx8_equip_swat_smk_signal", projectile, "tag_flash");
			}
			projectile waittill(#"stationary");
			if(isdefined(projectile))
			{
				projectile.angles = vectorscale((-1, 0, 1), 90);
			}
			wait(1);
			if(isdefined(projectile) && isplayer(self))
			{
				projectile thread function_5673c107();
				s_location = spawnstruct();
				s_location.origin = projectile.origin;
				s_params = killstreaks::get_script_bundle("planemortar");
				killstreakid = self killstreakrules::killstreakstart("planemortar", self.team, 0, 1);
				if(killstreakid == -1)
				{
					self notify(#"planemortar_failed");
					return false;
				}
				self thread function_8f181838(s_params, s_location.origin);
			}
		}
	}
}

/*
	Name: function_66133f8b
	Namespace: planemortar
	Checksum: 0x75296B37
	Offset: 0xAD8
	Size: 0x21C
	Parameters: 1
	Flags: Linked
*/
function function_66133f8b(var_5b276012)
{
	self endon(#"disconnect");
	s_params = killstreaks::get_script_bundle("planemortar");
	var_2558cb51 = array("planemortar_complete" + var_5b276012, "planemortar_failed" + var_5b276012);
	self namespace_bf7415ae::function_890b3889("planemortar", s_params.var_1ab696c6, 2500, &function_142c133b, &function_f2cd26bf, var_2558cb51, 0);
	s_location = self namespace_bf7415ae::function_be6de952("planemortar", &function_c6fe946e);
	if(isdefined(s_location))
	{
		killstreak_id = self killstreakrules::killstreakstart("planemortar", self.team, 0, 1);
		if(killstreak_id == -1)
		{
			self notify("planemortar_failed" + var_5b276012);
			return false;
		}
		if((isdefined(self.var_fb18d24e) ? self.var_fb18d24e : 0) < gettime())
		{
			self namespace_f9b02f80::play_killstreak_start_dialog("planemortar", self.team, killstreak_id);
			self.var_fb18d24e = gettime() + (int(battlechatter::mpdialog_value("planeMortarCooldown", 7) * 1000));
		}
		self thread function_8f181838(var_5b276012, s_params, s_location.origin);
		return true;
	}
	return false;
}

/*
	Name: function_142c133b
	Namespace: planemortar
	Checksum: 0xA83F7686
	Offset: 0xD00
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_142c133b()
{
	self clientfield::set("planemortar_marker_on", 1);
}

/*
	Name: function_c6fe946e
	Namespace: planemortar
	Checksum: 0xDB74E506
	Offset: 0xD30
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c6fe946e()
{
	self clientfield::set("planemortar_marker_on", 2);
}

/*
	Name: function_f2cd26bf
	Namespace: planemortar
	Checksum: 0xDD007EAF
	Offset: 0xD60
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f2cd26bf()
{
	self clientfield::set("planemortar_marker_on", 0);
}

/*
	Name: function_5673c107
	Namespace: planemortar
	Checksum: 0x43B3B022
	Offset: 0xD90
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5673c107()
{
	self endon(#"death");
	wait(7);
	self delete();
}

/*
	Name: function_8f181838
	Namespace: planemortar
	Checksum: 0xACD1E999
	Offset: 0xDD0
	Size: 0x280
	Parameters: 3
	Flags: Linked, Private
*/
function private function_8f181838(var_5b276012, params, targetposition)
{
	self endon(#"disconnect");
	self.planemortarpilotindex = self namespace_f9b02f80::get_random_pilot_index("planemortar");
	self thread function_16f87e96(8);
	if(isdefined(params.var_675bebb2))
	{
		wait(params.var_675bebb2);
	}
	n_yaw = randomintrange(0, 360);
	for(i = 0; i < 8; i++)
	{
		if(i != 0)
		{
			n_interval = randomfloatrange(0.5, 2);
			wait(n_interval);
		}
		n_radius = 500 * randomfloat(1);
		n_angle = randomintrange(0, 360);
		v_position = targetposition + (n_radius * cos(n_angle), n_radius * sin(n_angle), 0);
		var_86f8b2c9 = (0, 0, getheliheightlockheight(v_position));
		a_trace = groundtrace(v_position + var_86f8b2c9, v_position - var_86f8b2c9, 1, undefined);
		var_5acfe25f = a_trace[#"position"];
		self thread function_83e61117(var_5acfe25f, n_yaw);
	}
	n_length = scene::function_12479eba(#"p9_fxanim_mp_planemortar_01_bundle");
	wait(n_length + 0.5);
	self notify("planemortar_complete" + var_5b276012);
}

/*
	Name: function_5e7e3e86
	Namespace: planemortar
	Checksum: 0x5594C05F
	Offset: 0x1058
	Size: 0x8C
	Parameters: 10
	Flags: Linked, Private
*/
function private function_5e7e3e86(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(shitloc === self && psoffsettime == getweapon("planemortar"))
	{
		return 50;
	}
	return -1;
}

