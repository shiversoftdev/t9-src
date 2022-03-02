#using script_1cc417743d7c262d;
#using script_383a3b1bb18ba876;
#using script_396f7d71538c9677;
#using script_3b334409f11762b8;
#using script_4721de209091b1a6;
#using script_4a81c26d2ddde9c;
#using script_6c8abe14025b47c4;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_player.gsc;

#namespace planemortar;

/*
	Name: function_89f2df9
	Namespace: planemortar
	Checksum: 0x662F3E8F
	Offset: 0x220
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
	Checksum: 0x16E80CC0
	Offset: 0x270
	Size: 0xD4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	clientfield::register("scriptmover", "planemortar_marker_on", 1, 1, "int");
	bundlename = "killstreak_planemortar" + "_zm";
	killstreaks::function_e4ef8390(bundlename, &function_d022334c);
	level.plane_mortar_bda_dialog = &plane_mortar_bda_dialog;
	level.var_269fec2 = &function_269fec2;
	zm_player::register_player_damage_callback(&function_5e7e3e86);
}

/*
	Name: function_269fec2
	Namespace: planemortar
	Checksum: 0x1AF01DE9
	Offset: 0x350
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
	Checksum: 0x4E91291A
	Offset: 0x380
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
	Name: function_d022334c
	Namespace: planemortar
	Checksum: 0x2A59CD75
	Offset: 0x568
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function function_d022334c(hardpointtype)
{
	if(self killstreakrules::iskillstreakallowed(hardpointtype, self.team) == 0)
	{
		return 0;
	}
	result = self function_9480de5f();
	return is_true(result);
}

/*
	Name: function_9480de5f
	Namespace: planemortar
	Checksum: 0x47D88554
	Offset: 0x5E0
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function function_9480de5f()
{
	self endon(#"disconnect");
	s_params = killstreaks::get_script_bundle("planemortar");
	var_2558cb51 = array("planemortar_complete", "planemortar_failed");
	self namespace_bf7415ae::function_890b3889(s_params.var_fc0c8eae, 2500, &function_92c6373d, &function_ccf02f24, var_2558cb51);
	s_location = self namespace_bf7415ae::function_be6de952();
	if(isdefined(s_location))
	{
		killstreak_id = self killstreakrules::killstreakstart("planemortar", self.team, 0, 1);
		if(killstreak_id == -1)
		{
			self notify(#"planemortar_failed");
			return false;
		}
		self thread function_9dea13ff(killstreak_id);
		self thread function_8f181838(s_params, s_location.origin);
		return true;
	}
	return false;
}

/*
	Name: function_92c6373d
	Namespace: planemortar
	Checksum: 0xF2FF3E0E
	Offset: 0x760
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_92c6373d()
{
	self clientfield::set("planemortar_marker_on", 1);
}

/*
	Name: function_ccf02f24
	Namespace: planemortar
	Checksum: 0x817D40B1
	Offset: 0x790
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ccf02f24()
{
	self clientfield::set("planemortar_marker_on", 0);
}

/*
	Name: function_9dea13ff
	Namespace: planemortar
	Checksum: 0xA40F31F2
	Offset: 0x7C0
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9dea13ff(killstreakid)
{
	self waittill(#"disconnect", #"planemortar_complete");
	self killstreakrules::killstreakstop("planemortar", self.team, killstreakid);
}

/*
	Name: function_8f181838
	Namespace: planemortar
	Checksum: 0x192F3FCD
	Offset: 0x828
	Size: 0x236
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8f181838(params, targetposition)
{
	self endon(#"disconnect");
	if(isdefined(params.var_675bebb2))
	{
		wait(params.var_675bebb2);
	}
	n_yaw = randomintrange(0, 360);
	for(i = 0; i < 15; i++)
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
	self notify(#"planemortar_complete");
}

/*
	Name: function_5e7e3e86
	Namespace: planemortar
	Checksum: 0xF870DDE7
	Offset: 0xA68
	Size: 0x8C
	Parameters: 10
	Flags: Linked, Private
*/
function private function_5e7e3e86(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(shitloc === self && psoffsettime == getweapon("planemortar"))
	{
		return 20;
	}
	return -1;
}

