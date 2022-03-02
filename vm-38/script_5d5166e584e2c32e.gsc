#using script_11cc3a9267cf7ac7;
#using script_1f8c0f3565e1f647;
#using script_27ba6748d83412fd;
#using script_4212f52fcf0da3e3;
#using script_44c87b4589ee1f93;
#using script_557089630e09eb03;
#using script_60793766a26de8df;
#using script_6243781aa5394e62;
#using script_62c40d9a3acec9b1;
#using script_646dfe47676cb0d8;
#using script_67b98aa634d9decc;
#using script_6c9ef96253ac7e85;
#using script_7a861548d6552f46;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\oob.csc;
#using scripts\core_common\util_shared.csc;

#namespace zonslaught;

/*
	Name: function_baa6522d
	Namespace: zonslaught
	Checksum: 0x51AA3ACE
	Offset: 0x210
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_baa6522d()
{
	level notify(2056708277);
}

/*
	Name: main
	Namespace: zonslaught
	Checksum: 0xE9DE0CD1
	Offset: 0x230
	Size: 0xC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
}

/*
	Name: on_player_spawned
	Namespace: zonslaught
	Checksum: 0x3CDEDC4
	Offset: 0x248
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function on_player_spawned(localclientnum)
{
	self function_36b630a3(1);
	if(util::function_53bbf9d2() === #"hash_7665a0b476d1b735")
	{
		function_f58e42ae(localclientnum, 1);
	}
}

/*
	Name: onprecachegametype
	Namespace: zonslaught
	Checksum: 0xF421DE0B
	Offset: 0x2B8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onprecachegametype()
{
	/#
		println("");
	#/
}

/*
	Name: onstartgametype
	Namespace: zonslaught
	Checksum: 0x684DBAF7
	Offset: 0x2E8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	/#
		println("");
	#/
}

/*
	Name: enemy_on_radar
	Namespace: zonslaught
	Checksum: 0x791179CA
	Offset: 0x318
	Size: 0x74
	Parameters: 7
	Flags: None
*/
function enemy_on_radar(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self enableonradar();
	}
	else
	{
		self disableonradar();
	}
}

/*
	Name: boss_zone_on_radar
	Namespace: zonslaught
	Checksum: 0x9354B6AC
	Offset: 0x398
	Size: 0x1F6
	Parameters: 7
	Flags: None
*/
function boss_zone_on_radar(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self setcompassicon("icon_minimap_onslaught_boss");
		self enableonradar();
		self function_811196d1(0);
	}
	else
	{
		if(bwastimejump == 2)
		{
			self.spawn_cloud = playfx(fieldname, level._effect[#"hash_d7a655f41aa4b03"], self.origin - vectorscale((0, 0, 1), 68));
			playsound(fieldname, #"hash_5e9e10059b1e505c", self.origin - vectorscale((0, 0, 1), 68));
		}
		else
		{
			if(bwastimejump == 3)
			{
				if(isdefined(self.spawn_cloud))
				{
					stopfx(fieldname, self.spawn_cloud);
					self.spawn_cloud = undefined;
				}
			}
			else
			{
				self setcompassicon("icon_minimap_onslaught_boss");
				self disableonradar();
				self function_811196d1(1);
				if(isdefined(self.spawn_cloud))
				{
					stopfx(fieldname, self.spawn_cloud);
					self.spawn_cloud = undefined;
				}
			}
		}
	}
}

/*
	Name: orb_spawn
	Namespace: zonslaught
	Checksum: 0xC2CA4F2C
	Offset: 0x598
	Size: 0x6C
	Parameters: 7
	Flags: None
*/
function orb_spawn(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self))
	{
		level.var_df7b46d1 = self;
		level.var_df7b46d1 thread function_40deac72(bwastimejump);
	}
}

/*
	Name: bot_claim_fx
	Namespace: zonslaught
	Checksum: 0xFD774FB6
	Offset: 0x610
	Size: 0x1D4
	Parameters: 7
	Flags: None
*/
function bot_claim_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.fxid = function_239993de(fieldname, "zombie/fx9_onslaught_orb_trail", self, "tag_origin");
		if(!isdefined(self.var_94ebeb0a))
		{
			self.var_94ebeb0a = self playloopsound(#"hash_6d2c4c09332d861b");
		}
		self.var_58e905a8 = playfx(fieldname, "sr/fx9_safehouse_orb_activate", self.origin);
	}
	else
	{
		if(bwastimejump == 2)
		{
			self.var_58e905a8 = playfx(fieldname, "sr/fx9_safehouse_orb_activate", self.origin);
		}
		else
		{
			if(isdefined(self.fxid))
			{
				killfx(fieldname, self.fxid);
			}
			if(isdefined(self.var_94ebeb0a))
			{
				self stoploopsound(self.var_94ebeb0a);
				self.var_94ebeb0a = undefined;
			}
			if(isdefined(self.var_58e905a8))
			{
				killfx(fieldname, self.var_58e905a8);
				self.var_58e905a8 = undefined;
			}
			playfx(fieldname, "sr/fx9_safehouse_orb_activate", self.origin);
		}
	}
}

/*
	Name: fake_physicslaunch
	Namespace: zonslaught
	Checksum: 0xDD45921
	Offset: 0x7F0
	Size: 0x130
	Parameters: 3
	Flags: None
*/
function fake_physicslaunch(target_pos, power, var_4862f668)
{
	start_pos = self.origin;
	gravity = getdvarint(#"bg_gravity", 0) * -1;
	gravity = gravity * var_4862f668;
	dist = distance(start_pos, target_pos);
	time = dist / power;
	delta = target_pos - start_pos;
	drop = (0.5 * gravity) * (time * time);
	velocity = (delta[0] / time, delta[1] / time, (delta[2] - drop) / time);
	self movegravity(velocity, time);
	return time;
}

/*
	Name: orb_soul_capture_fx
	Namespace: zonslaught
	Checksum: 0x27C4BE9B
	Offset: 0x928
	Size: 0x214
	Parameters: 7
	Flags: None
*/
function orb_soul_capture_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump && isdefined(level.var_df7b46d1))
	{
		e_fx = util::spawn_model(fieldname, "tag_origin", self.origin);
		e_fx playsound(fieldname, "zmb_onslaught_zsouls_start");
		e_fx.sfx_id = e_fx playloopsound(#"hash_58d856545ecf5e28");
		util::playfxontag(fieldname, "zombie/fx9_onslaught_orb_soul", e_fx, "tag_origin");
		wait(0.3);
		power = distance(e_fx.origin, level.var_df7b46d1.origin);
		n_time = e_fx fake_physicslaunch(level.var_df7b46d1.origin + vectorscale((0, 0, 1), 68), power, 0.85);
		wait(n_time);
		playsound(fieldname, "zmb_onslaught_zsouls_end", level.var_df7b46d1.origin);
		e_fx stoploopsound(e_fx.sfx_id);
		util::playfxontag(fieldname, "maps/zm_red/fx8_soul_charge_purple", e_fx, "tag_origin");
		wait(0.3);
		e_fx delete();
	}
}

/*
	Name: function_ace38635
	Namespace: zonslaught
	Checksum: 0x16A43CB3
	Offset: 0xB48
	Size: 0xF4
	Parameters: 7
	Flags: None
*/
function function_ace38635(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	self endon(#"death");
	if(bwasdemojump)
	{
		spawn_fx = playfx(fieldname, "zombie/fx9_onslaught_spawn_sm", self.origin);
		playsound(fieldname, #"hash_1a0e3429a5f96df3", self.origin);
		wait(1.5);
		playsound(fieldname, #"hash_441ebe442c5946b2", self.origin);
		stopfx(fieldname, spawn_fx);
	}
}

/*
	Name: function_40deac72
	Namespace: zonslaught
	Checksum: 0xF9E3E8D0
	Offset: 0xC48
	Size: 0x160
	Parameters: 1
	Flags: None
*/
function function_40deac72(localclientnum)
{
	level endon(#"end_game");
	e_player = function_5c10bd79(localclientnum);
	e_player endon(#"death");
	while(true)
	{
		n_dist = distancesquared(self.origin, e_player.origin);
		var_e71fa578 = 16384;
		if(var_e71fa578 > 0)
		{
			n_scale = n_dist / var_e71fa578;
		}
		else
		{
			continue;
		}
		waitframe(1);
		if(n_scale > 1 || n_scale <= 0)
		{
			continue;
		}
		earthquake_scale = (1 - n_scale) * 0.05;
		if(earthquake_scale > 0.01)
		{
			earthquake(localclientnum, earthquake_scale, 0.1, self.origin, 128);
		}
		e_player playrumbleonentity(localclientnum, "onslaught_orb");
		wait(0.3);
	}
}

