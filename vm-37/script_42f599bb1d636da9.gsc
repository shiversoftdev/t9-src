#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace sticky_grenade;

/*
	Name: function_89f2df9
	Namespace: sticky_grenade
	Checksum: 0xB9BC3AB9
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"sticky_grenade", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: sticky_grenade
	Checksum: 0x8C676CDE
	Offset: 0x128
	Size: 0x2A4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::add_weapon_type(#"sticky_grenade", &spawned);
	callback::add_weapon_type(#"eq_sticky_grenade", &spawned);
	callback::add_weapon_type(#"hash_4b92b1a2aa3037f5", &spawned);
	callback::add_weapon_type(#"eq_cluster_semtex_grenade", &spawned);
	callback::add_weapon_type(#"hash_66401df7cd6bf292", &function_6054cc1e);
	callback::add_weapon_type(#"hash_18c353e6053566bd", &function_117f61b8);
	callback::add_weapon_type(#"hash_494e1edad9bd44fd", &function_117f61b8);
	callback::add_weapon_type(#"hash_494e1ddad9bd434a", &function_117f61b8);
	callback::add_weapon_type(#"hash_494e18dad9bd3acb", &function_117f61b8);
	callback::add_weapon_type(#"hash_40380537847df901", &function_78bd4311);
	callback::add_weapon_type(#"hash_1d2a1056220e71a9", &function_78bd4311);
	callback::add_weapon_type(#"hash_1d2a0f56220e6ff6", &function_78bd4311);
	callback::add_weapon_type(#"hash_1d2a1256220e750f", &function_78bd4311);
	callback::add_weapon_type(#"hash_1d2a1156220e735c", &function_78bd4311);
}

/*
	Name: spawned
	Namespace: sticky_grenade
	Checksum: 0xAC8AD456
	Offset: 0x3D8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function spawned(localclientnum)
{
	if(self isgrenadedud())
	{
		return;
	}
	self thread fx_think(localclientnum, 1);
}

/*
	Name: function_78bd4311
	Namespace: sticky_grenade
	Checksum: 0xF7495C36
	Offset: 0x428
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_78bd4311(localclientnum)
{
	if(self isgrenadedud())
	{
		return;
	}
	self thread fx_think(localclientnum, 2);
}

/*
	Name: function_6054cc1e
	Namespace: sticky_grenade
	Checksum: 0x15C0997
	Offset: 0x478
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_6054cc1e(localclientnum)
{
	if(self isgrenadedud())
	{
		return;
	}
	self thread function_c879d0fd(localclientnum);
}

/*
	Name: function_117f61b8
	Namespace: sticky_grenade
	Checksum: 0xDC994F77
	Offset: 0x4C0
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_117f61b8(localclientnum)
{
	if(self isgrenadedud())
	{
		return;
	}
	handle = self playsound(localclientnum, #"wpn_semtex_countdown");
	self thread stop_sound_on_ent_shutdown(handle);
}

/*
	Name: stop_sound_on_ent_shutdown
	Namespace: sticky_grenade
	Checksum: 0x3FCFDA89
	Offset: 0x540
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function stop_sound_on_ent_shutdown(handle)
{
	self waittill(#"death");
	stopsound(handle);
}

/*
	Name: fx_think
	Namespace: sticky_grenade
	Checksum: 0xB8EF1262
	Offset: 0x580
	Size: 0x29A
	Parameters: 2
	Flags: Linked
*/
function fx_think(localclientnum, var_1e60ee48)
{
	self notify(#"light_disable");
	self endon(#"light_disable");
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	handle = self playsound(localclientnum, #"wpn_semtex_countdown");
	self thread stop_sound_on_ent_shutdown(handle);
	interval = 0.3;
	while(isdefined(self))
	{
		self stop_light_fx(localclientnum);
		localplayer = function_5c10bd79(localclientnum);
		if(!isdefined(localplayer))
		{
			continue;
		}
		if(!localplayer isentitylinkedtotag(self, "j_head") && !localplayer isentitylinkedtotag(self, "j_elbow_le") && !localplayer isentitylinkedtotag(self, "j_spineupper"))
		{
			if(isdefined(self.weapon.var_4dd46f8a))
			{
				var_e6fbac16 = getscriptbundle(self.weapon.var_4dd46f8a);
				if(isdefined(var_e6fbac16.var_b941081f) && isdefined(var_e6fbac16.var_40772cbe))
				{
					self start_light_fx(localclientnum, var_e6fbac16.var_b941081f, var_e6fbac16.var_40772cbe);
				}
			}
		}
		self fullscreen_fx(localclientnum, var_1e60ee48);
		util::server_wait(localclientnum, interval, 0.01, "player_switch");
		self util::waittill_dobj(localclientnum);
		interval = math::clamp(interval / 1.2, 0.08, 0.3);
	}
}

/*
	Name: start_light_fx
	Namespace: sticky_grenade
	Checksum: 0xCDD50E3
	Offset: 0x828
	Size: 0x52
	Parameters: 3
	Flags: Linked
*/
function start_light_fx(localclientnum, fx, tag)
{
	self stop_light_fx(localclientnum);
	self.fx = util::playfxontag(localclientnum, fx, self, tag);
}

/*
	Name: stop_light_fx
	Namespace: sticky_grenade
	Checksum: 0xC5D6D62C
	Offset: 0x888
	Size: 0x4E
	Parameters: 1
	Flags: Linked
*/
function stop_light_fx(localclientnum)
{
	if(isdefined(self.fx) && self.fx != 0)
	{
		stopfx(localclientnum, self.fx);
		self.fx = undefined;
	}
}

/*
	Name: function_c879d0fd
	Namespace: sticky_grenade
	Checksum: 0x7DE95260
	Offset: 0x8E0
	Size: 0x17A
	Parameters: 1
	Flags: Linked
*/
function function_c879d0fd(localclientnum)
{
	self notify(#"light_disable");
	self endon(#"light_disable");
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	interval = 0.3;
	if(isdefined(self.weapon.var_4dd46f8a))
	{
		var_e6fbac16 = getscriptbundle(self.weapon.var_4dd46f8a);
		if(isdefined(var_e6fbac16.var_b941081f) && isdefined(var_e6fbac16.var_40772cbe))
		{
			for(;;)
			{
				self stop_light_fx(localclientnum);
				self start_light_fx(localclientnum, var_e6fbac16.var_b941081f, var_e6fbac16.var_40772cbe);
				util::server_wait(localclientnum, interval, 0.01, "player_switch");
				self util::waittill_dobj(localclientnum);
				interval = math::clamp(interval / 1.2, 0.08, 0.3);
			}
		}
	}
}

/*
	Name: sticky_indicator
	Namespace: sticky_grenade
	Checksum: 0x5417D890
	Offset: 0xA68
	Size: 0xD8
	Parameters: 2
	Flags: Linked
*/
function sticky_indicator(localclientnum, indicator)
{
	stickyimagemodel = createuimodel(function_1df4c3b0(localclientnum, #"hud_items"), "stuckImageIndex");
	setuimodelvalue(stickyimagemodel, indicator);
	player = function_5c10bd79(localclientnum);
	while(isdefined(self))
	{
		waitframe(1);
	}
	setuimodelvalue(stickyimagemodel, 0);
	if(isdefined(player))
	{
		player notify(#"sticky_shutdown");
	}
}

/*
	Name: fullscreen_fx
	Namespace: sticky_grenade
	Checksum: 0x5222A908
	Offset: 0xB48
	Size: 0x124
	Parameters: 2
	Flags: Linked
*/
function fullscreen_fx(localclientnum, indicator)
{
	if(function_1cbf351b(localclientnum))
	{
		return;
	}
	if(util::is_player_view_linked_to_entity(localclientnum))
	{
		return;
	}
	if(self function_ca024039())
	{
		return;
	}
	parent = self getparententity();
	if(isdefined(parent) && parent function_21c0fa55())
	{
		parent playrumbleonentity(localclientnum, "buzz_high");
		self playsound(localclientnum, #"wpn_semtex_alert");
		if(getdvarint(#"ui_hud_hardcore", 0) == 0)
		{
			self thread sticky_indicator(localclientnum, indicator);
		}
	}
}

