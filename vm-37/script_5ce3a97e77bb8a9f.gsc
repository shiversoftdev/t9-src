#using script_13da4e6b98ca81a1;
#using script_3d0f36632dad12df;
#using script_5520b91a8aa516ab;
#using script_6ad3fda349f49bf9;
#using script_7bee869df82e0445;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace remotemissile;

/*
	Name: init_shared
	Namespace: remotemissile
	Checksum: 0xB8EE2E4F
	Offset: 0x2C8
	Size: 0x448
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	if(!is_true(level.var_e3049e92) && !isdefined(level.var_2a02828c))
	{
		level.var_2a02828c = {};
		killstreak_detect::init_shared();
		remote_missile_targets::register();
		for(ti = 0; ti < 6; ti++)
		{
			level.remote_missile_targets[ti] = spawnstruct();
			remote_missile_target_lockon::register("remote_missile_target_lockon" + ti, &function_1de73512, &function_fd0c759c);
		}
		clientfield::register("missile", "remote_missile_brakes", 1, 1, "int", &function_3e76ad59, 0, 0);
		clientfield::register("missile", "remote_missile_bomblet_fired", 1, 1, "int", &bomblets_deployed, 0, 0);
		clientfield::register("missile", "remote_missile_fired", 1, 2, "int", &missile_fired, 0, 0);
		clientfield::register("missile", "remote_missile_phase2", 1, 1, "int", undefined, 0, 0);
		clientfield::register("toplayer", "remote_missile_piloting", 1, 1, "int", &remote_missile_piloting, 0, 1);
		clientfield::function_a8bbc967("hudItems.remoteMissilePhase2", #"hud_items", #"hash_7a6190d936bc200e", 1, 1, "int", undefined, 0, 0);
		clientfield::register("scriptmover", "hellstorm_camera", 1, 1, "int", &function_6d66e75a, 0, 0);
		clientfield::register("scriptmover", "hellstorm_deploy", 1, 1, "int", &hellstorm_deploy, 0, 0);
		clientfield::register("scriptmover", "remote_missile_child_rocket_fx", 1, 1, "int", &remote_missile_child_rocket_fx, 0, 0);
		callback::function_74f5faf8(&function_74f5faf8);
		callback::on_spawned(&on_player_spawned);
		bundlename = "killstreak_remote_missile";
		if(function_f99d2668())
		{
			bundlename = bundlename + "_wz";
		}
		level.var_bb1f7e1e = getscriptbundle(bundlename);
		if(!getdvarint(#"hash_4aad305a4a7f93db", 0))
		{
			level thread function_f7599440();
		}
		level.var_9ca75ca3 = [];
	}
}

/*
	Name: function_f7599440
	Namespace: remotemissile
	Checksum: 0x905CC72B
	Offset: 0x718
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_f7599440()
{
	level endon(#"game_ended");
	wait(20);
	forcestreamxmodel(#"veh_t9_mil_air_flogger_body_attach", 8, 1);
	forcestreamxmodel(#"veh_t9_mil_remote_missile", 8, 1);
}

/*
	Name: function_74f5faf8
	Namespace: remotemissile
	Checksum: 0xC4905F83
	Offset: 0x798
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_74f5faf8(var_aa127355)
{
	localclientnum = var_aa127355.localclientnum;
	if(isdefined(self))
	{
		function_d260edc9(localclientnum, !var_aa127355.enabled);
	}
}

/*
	Name: on_player_spawned
	Namespace: remotemissile
	Checksum: 0xE795B8AB
	Offset: 0x7F0
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function on_player_spawned(localclientnum)
{
	self endon(#"death", #"disconnect");
	level endon(#"game_ended");
	if(function_65b9eb0f(localclientnum))
	{
		return;
	}
	waitframe(1);
	postfxbundle = level.var_bb1f7e1e.var_19f55f0;
	if(function_148ccc79(localclientnum, postfxbundle))
	{
		codestoppostfxbundlelocal(localclientnum, postfxbundle);
	}
}

/*
	Name: function_fd0c759c
	Namespace: remotemissile
	Checksum: 0xC24D9BF7
	Offset: 0x8A8
	Size: 0x64
	Parameters: 7
	Flags: None
*/
function function_fd0c759c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(level.var_e656f88a))
	{
		[[level.var_e656f88a]](binitialsnap, fieldname, bwastimejump);
	}
}

/*
	Name: function_1de73512
	Namespace: remotemissile
	Checksum: 0x5CFFBF74
	Offset: 0x918
	Size: 0x64
	Parameters: 7
	Flags: None
*/
function function_1de73512(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(level.var_70a07f6f))
	{
		[[level.var_70a07f6f]](binitialsnap, fieldname, bwastimejump);
	}
}

/*
	Name: hellstorm_deploy
	Namespace: remotemissile
	Checksum: 0x274767E6
	Offset: 0x988
	Size: 0x196
	Parameters: 7
	Flags: None
*/
function hellstorm_deploy(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(bwastimejump)
	{
		player = function_5c10bd79(fieldname);
		if(isdefined(player) && isdefined(self) && self.owner === player)
		{
			self useanimtree("generic");
			self setanim(#"hash_21fa3a72d877f87a", 1);
			if(isdefined(level.var_bb1f7e1e.var_1050ff32))
			{
				self.cloudfx = util::playfxontag(fieldname, #"hash_75b6b7edc8c8900", self, "tag_origin");
			}
		}
		else
		{
			self hide();
		}
	}
	else if(isdefined(self.cloudfx))
	{
		stopfx(fieldname, self.cloudfx);
		self.cloudfx = undefined;
	}
}

/*
	Name: function_6d66e75a
	Namespace: remotemissile
	Checksum: 0x302C5321
	Offset: 0xB28
	Size: 0x54
	Parameters: 7
	Flags: None
*/
function function_6d66e75a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self thread function_90b75549(bwastimejump);
}

/*
	Name: function_90b75549
	Namespace: remotemissile
	Checksum: 0xD93292D2
	Offset: 0xB88
	Size: 0xDE
	Parameters: 1
	Flags: None
*/
function function_90b75549(localclientnum)
{
	self notify(#"hash_3f127346d8e9769f");
	self endon(#"hash_3f127346d8e9769f", #"death");
	player = function_5c10bd79(localclientnum);
	self util::waittill_dobj(localclientnum);
	while(isdefined(player) && isdefined(self) && self.owner === player)
	{
		player camerasetposition(self.origin);
		player camerasetlookat(self.angles);
		waitframe(1);
	}
}

/*
	Name: function_3e76ad59
	Namespace: remotemissile
	Checksum: 0x7B2C9E05
	Offset: 0xC70
	Size: 0x84
	Parameters: 7
	Flags: None
*/
function function_3e76ad59(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self function_d309e55a("tag_brake_control_animate", 1);
	}
	else
	{
		self function_d309e55a("tag_brake_control_animate", 0);
	}
}

/*
	Name: missile_fired
	Namespace: remotemissile
	Checksum: 0x4B7DED7B
	Offset: 0xD00
	Size: 0x2D4
	Parameters: 7
	Flags: None
*/
function missile_fired(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self function_d309e55a("tag_fin_control_animate", 1);
		self function_1f0c7136(2);
		localplayer = function_5c10bd79(fieldname);
		owner = self getowner(fieldname);
		if(localplayer hasperk(fieldname, #"specialty_showscorestreakicons") || self.team == localplayer.team)
		{
			self.var_7ec0e2d1 = spawn(fieldname, self.origin, "script_model", localplayer getentitynumber(), self.team);
			self.var_7ec0e2d1 setcompassicon(level.var_bb1f7e1e.var_cb98fbf7);
			var_b13727dd = getgametypesetting("compassAnchorScorestreakIcons");
			self.var_7ec0e2d1 function_dce2238(var_b13727dd);
			self.var_7ec0e2d1 setmodel(#"tag_origin");
			self.var_7ec0e2d1 linkto(self);
			self.var_7ec0e2d1 function_5e00861(level.var_bb1f7e1e.var_792e8590);
			self thread function_20fff7ed(level.var_bb1f7e1e.var_792e8590, level.var_bb1f7e1e.var_f99969f1, gettime(), level.var_bb1f7e1e.var_6b2f302f * 1000);
		}
		self thread hud_update(fieldname);
		self thread function_298565db();
	}
	else
	{
		if(bwastimejump == 2)
		{
			self.var_7ec0e2d1 delete();
		}
		else
		{
			self function_fd73ab50();
		}
	}
}

/*
	Name: function_298565db
	Namespace: remotemissile
	Checksum: 0xA1CD1E23
	Offset: 0xFE0
	Size: 0x3C
	Parameters: 0
	Flags: Private
*/
function private function_298565db()
{
	self waittill(#"death", #"disconnect");
	self function_fd73ab50();
}

/*
	Name: function_20fff7ed
	Namespace: remotemissile
	Checksum: 0x79FB3E8
	Offset: 0x1028
	Size: 0xD4
	Parameters: 4
	Flags: None
*/
function function_20fff7ed(startscale, var_4dad59c0, starttime, duration)
{
	self endon(#"death");
	while(gettime() < starttime + duration)
	{
		currtime = gettime();
		ratio = (currtime - starttime) / duration;
		scale = lerpfloat(startscale, var_4dad59c0, ratio);
		self.var_7ec0e2d1 function_5e00861(scale);
		wait(0.1);
	}
	self.var_7ec0e2d1 function_5e00861(var_4dad59c0);
}

/*
	Name: bomblets_deployed
	Namespace: remotemissile
	Checksum: 0x54091C1F
	Offset: 0x1108
	Size: 0x254
	Parameters: 7
	Flags: None
*/
function bomblets_deployed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump && binitialsnap == fieldname)
	{
		return;
	}
	if(fieldname == 1)
	{
		localplayer = function_5c10bd79(bnewent);
		owner = self getowner(bnewent);
		if(localplayer hasperk(bnewent, #"specialty_showscorestreakicons") || self.team == localplayer.team)
		{
			self function_fd73ab50();
			self.var_7ec0e2d1 = spawn(bnewent, self.origin, "script_model", localplayer getentitynumber(), self.team);
			self.var_7ec0e2d1 setcompassicon(level.var_bb1f7e1e.var_cb98fbf7);
			var_b13727dd = getgametypesetting("compassAnchorScorestreakIcons");
			self.var_7ec0e2d1 function_dce2238(var_b13727dd);
			self.var_7ec0e2d1 function_5e00861(level.var_bb1f7e1e.var_c3e4af00);
			self.var_7ec0e2d1 linkto(self);
		}
	}
	else
	{
		self function_fd73ab50();
	}
	ammo_ui_data_model = getuimodel(function_1df4c3b0(bnewent, #"vehicle_info"), "rocketAmmo");
	if(isdefined(ammo_ui_data_model))
	{
		setuimodelvalue(ammo_ui_data_model, 0);
	}
}

/*
	Name: function_fd73ab50
	Namespace: remotemissile
	Checksum: 0x9D7BEE53
	Offset: 0x1368
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_fd73ab50()
{
	if(isdefined(self.var_7ec0e2d1))
	{
		self.var_7ec0e2d1 delete();
	}
}

/*
	Name: hud_update
	Namespace: remotemissile
	Checksum: 0x19718DC9
	Offset: 0x13A0
	Size: 0x2AE
	Parameters: 1
	Flags: None
*/
function hud_update(localclientnum)
{
	self endon(#"death");
	self notify(#"remote_missile_singeton");
	self endon(#"remote_missile_singeton");
	missile = self;
	altitude_ui_data_model = getuimodel(function_1df4c3b0(localclientnum, #"vehicle_info"), "altitude");
	speed_ui_data_model = getuimodel(function_1df4c3b0(localclientnum, #"vehicle_info"), "speed");
	var_2c36f843 = getuimodel(function_1df4c3b0(localclientnum, #"vehicle_info"), "remainingTime");
	if(!isdefined(altitude_ui_data_model) || !isdefined(speed_ui_data_model) || !isdefined(var_2c36f843))
	{
		return;
	}
	birthtime = gettime();
	lifetime = (isdefined(missile.weapon.lifetime) ? missile.weapon.lifetime : 20) * 1000;
	prev_z = missile.origin[2];
	fps = 20;
	delay = 1 / fps;
	while(isdefined(lifetime) && lifetime > 0)
	{
		cur_z = missile.origin[2];
		setuimodelvalue(altitude_ui_data_model, cur_z);
		dist = (prev_z - cur_z) * fps;
		val = dist / 17.6;
		setuimodelvalue(speed_ui_data_model, val);
		prev_z = cur_z;
		remainingtime = 1 - ((gettime() - birthtime) / lifetime);
		setuimodelvalue(var_2c36f843, remainingtime);
		wait(delay);
	}
}

/*
	Name: function_f9af4fc2
	Namespace: remotemissile
	Checksum: 0x70371B41
	Offset: 0x1658
	Size: 0x56
	Parameters: 1
	Flags: None
*/
function function_f9af4fc2(localclientnum)
{
	ent = function_93e0f729(localclientnum);
	if(!isdefined(ent))
	{
		return false;
	}
	if(ent function_da43934d())
	{
		return true;
	}
	return false;
}

/*
	Name: function_d260edc9
	Namespace: remotemissile
	Checksum: 0xE8BC7930
	Offset: 0x16B8
	Size: 0x14C
	Parameters: 2
	Flags: None
*/
function function_d260edc9(localclientnum, enabled)
{
	player = function_5c10bd79(localclientnum);
	postfxbundle = level.var_bb1f7e1e.var_19f55f0;
	if(!isdefined(postfxbundle))
	{
		return;
	}
	if(enabled && !function_148ccc79(localclientnum, postfxbundle) && (!function_1cbf351b(localclientnum) || function_f9af4fc2(localclientnum)) && !codcaster::function_c955fbd1(localclientnum))
	{
		if(isdefined(self.weapon) && self.weapon.statname == #"remote_missile")
		{
			function_a837926b(localclientnum, postfxbundle);
		}
	}
	else if(function_148ccc79(localclientnum, postfxbundle))
	{
		codestoppostfxbundlelocal(localclientnum, postfxbundle);
	}
}

/*
	Name: remote_missile_piloting
	Namespace: remotemissile
	Checksum: 0x8AEBFE1D
	Offset: 0x1810
	Size: 0x1FC
	Parameters: 7
	Flags: None
*/
function remote_missile_piloting(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	postfxbundle = level.var_bb1f7e1e.var_19f55f0;
	rumble = level.var_bb1f7e1e.var_f0728ef;
	self util::function_6d0694af();
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump)
	{
		if(isdefined(postfxbundle) && !function_148ccc79(fieldname, postfxbundle))
		{
			if(!codcaster::function_c955fbd1(fieldname) && !squad_spawn::function_21b773d5(fieldname))
			{
				if(function_1cbf351b(fieldname))
				{
					level.var_9ca75ca3[fieldname] = 1;
				}
				function_a837926b(fieldname, postfxbundle);
			}
		}
		if(isdefined(rumble))
		{
			self playrumblelooponentity(fieldname, rumble);
		}
	}
	else
	{
		if(isdefined(postfxbundle) && function_148ccc79(fieldname, postfxbundle))
		{
			if(isdefined(level.var_9ca75ca3[fieldname]))
			{
				codestoppostfxbundlelocal(fieldname, postfxbundle);
				level.var_9ca75ca3[fieldname] = undefined;
			}
			else
			{
				function_24cd4cfb(fieldname, postfxbundle);
			}
		}
		if(isdefined(rumble))
		{
			self stoprumble(fieldname, rumble);
		}
	}
}

/*
	Name: remote_missile_child_rocket_fx
	Namespace: remotemissile
	Checksum: 0x3D2938BD
	Offset: 0x1A18
	Size: 0x74
	Parameters: 7
	Flags: None
*/
function remote_missile_child_rocket_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		util::playfxontag(fieldname, level.var_bb1f7e1e.var_96312ae9, self, "tag_fx");
	}
}

