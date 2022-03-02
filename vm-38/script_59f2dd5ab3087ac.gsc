#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace weapon_cache;

/*
	Name: function_322519ef
	Namespace: weapon_cache
	Checksum: 0xA3056E32
	Offset: 0x158
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_322519ef()
{
	level notify(912195607);
}

/*
	Name: function_89f2df9
	Namespace: weapon_cache
	Checksum: 0xB1D67853
	Offset: 0x178
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"weapon_cache", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: weapon_cache
	Checksum: 0x463F6420
	Offset: 0x1C0
	Size: 0x17C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(getgametypesetting(#"hash_6143c4e1e18f08fd")))
	{
		return;
	}
	clientfield::register("scriptmover", "register_weapon_cache", 1, 1, "int", &register_weapon_cache, 0, 0);
	clientfield::register("toplayer", "weapon_cache_ammo_cooldown", 1, 1, "int", &function_ce75a340, 0, 0);
	clientfield::register("toplayer", "weapon_cache_cac_cooldown", 1, 1, "int", &weapon_cache_cac_cooldown, 0, 0);
	callback::on_localplayer_spawned(&on_localplayer_spawned);
	callback::on_localclient_connect(&function_86c5661a);
	level.var_745f6ccb = [];
	level.var_2e44d000 = [];
	level.var_a979e61b = &function_a979e61b;
}

/*
	Name: function_86c5661a
	Namespace: weapon_cache
	Checksum: 0xB5DFFA62
	Offset: 0x348
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_86c5661a(localclientnum)
{
	level.var_745f6ccb[localclientnum] = 0;
	level.var_2e44d000[localclientnum] = 0;
	setuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"hud_items"), "weaponCachePromptState"), 1);
}

/*
	Name: on_localplayer_spawned
	Namespace: weapon_cache
	Checksum: 0xA83318FC
	Offset: 0x3D0
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_localplayer_spawned(localclientnum)
{
	if(self function_da43934d())
	{
		self thread function_e18d0975(localclientnum);
	}
}

/*
	Name: register_weapon_cache
	Namespace: weapon_cache
	Checksum: 0x8DEF42E6
	Offset: 0x418
	Size: 0x8C
	Parameters: 7
	Flags: Linked, Private
*/
function private register_weapon_cache(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.var_b5f67dff))
	{
		level.var_b5f67dff = [];
	}
	arrayremovevalue(level.var_b5f67dff, undefined, 0);
	level.var_b5f67dff[level.var_b5f67dff.size] = self;
}

/*
	Name: function_ce75a340
	Namespace: weapon_cache
	Checksum: 0xE4622382
	Offset: 0x4B0
	Size: 0x298
	Parameters: 7
	Flags: Linked, Private
*/
function private function_ce75a340(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self))
	{
		return;
	}
	self util::waittill_dobj(fieldname);
	if(!isdefined(self) || !self isplayer() || !self function_da43934d() || !isdefined(level.var_b5f67dff))
	{
		return;
	}
	arrayremovevalue(level.var_b5f67dff, undefined, 0);
	foreach(weapon_cache in level.var_b5f67dff)
	{
		level.var_2e44d000[fieldname] = bwastimejump;
		function_f3b7c879(fieldname);
		if(bwastimejump == 1)
		{
			if(!isdefined(weapon_cache.var_1563bf09))
			{
				weapon_cache.var_1563bf09 = util::getnextobjid(fieldname);
				objective_add(fieldname, weapon_cache.var_1563bf09, "active", #"hash_60b265ded94ea645", weapon_cache.origin, self.team, self);
			}
			else
			{
				objective_setstate(fieldname, weapon_cache.var_1563bf09, "active");
			}
			weapon_cache thread function_366dfc57(fieldname, weapon_cache.var_1563bf09, 60);
			continue;
		}
		if(isdefined(weapon_cache.var_1563bf09))
		{
			weapon_cache notify(#"hash_21d2c3e2020a95a3");
			objective_setprogress(fieldname, weapon_cache.var_1563bf09, 1);
			objective_setstate(fieldname, weapon_cache.var_1563bf09, "invisible");
		}
	}
}

/*
	Name: function_366dfc57
	Namespace: weapon_cache
	Checksum: 0x86EBC60
	Offset: 0x750
	Size: 0xFC
	Parameters: 3
	Flags: Linked
*/
function function_366dfc57(localclientnum, obj_id, cooldowntime)
{
	self endon(#"hash_21d2c3e2020a95a3");
	level endon(#"disconnect", #"game_ended");
	endtime = cooldowntime - 4;
	progress = 0;
	while(progress < endtime)
	{
		percent = min(1, progress / endtime);
		objective_setprogress(localclientnum, obj_id, percent);
		wait(0.15);
		progress = progress + 0.15;
	}
	if(!isdefined(self))
	{
		objective_delete(localclientnum, obj_id);
	}
}

/*
	Name: weapon_cache_cac_cooldown
	Namespace: weapon_cache
	Checksum: 0x32DCDEA8
	Offset: 0x858
	Size: 0x298
	Parameters: 7
	Flags: Linked, Private
*/
function private weapon_cache_cac_cooldown(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self))
	{
		return;
	}
	self util::waittill_dobj(fieldname);
	if(!isdefined(self) || !self isplayer() || !self function_da43934d() || !isdefined(level.var_b5f67dff))
	{
		return;
	}
	arrayremovevalue(level.var_b5f67dff, undefined, 0);
	foreach(weapon_cache in level.var_b5f67dff)
	{
		level.var_745f6ccb[fieldname] = bwastimejump;
		function_f3b7c879(fieldname);
		if(bwastimejump == 1)
		{
			if(!isdefined(weapon_cache.var_decd4745))
			{
				weapon_cache.var_decd4745 = util::getnextobjid(fieldname);
				objective_add(fieldname, weapon_cache.var_decd4745, "active", #"hash_53b2e93d1661a0a4", weapon_cache.origin, self.team, self);
			}
			else
			{
				objective_setstate(fieldname, weapon_cache.var_decd4745, "active");
			}
			weapon_cache thread function_366dfc57(fieldname, weapon_cache.var_decd4745, 120);
			continue;
		}
		if(isdefined(weapon_cache.var_decd4745))
		{
			weapon_cache notify(#"hash_21d2c3e2020a95a3");
			objective_setprogress(fieldname, weapon_cache.var_decd4745, 1);
			objective_setstate(fieldname, weapon_cache.var_decd4745, "invisible");
		}
	}
}

/*
	Name: function_a979e61b
	Namespace: weapon_cache
	Checksum: 0x616BA8FA
	Offset: 0xAF8
	Size: 0xD4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a979e61b(localclientnum)
{
	if(getdvarint(#"hash_48fb7bd68329f4e1", 0) == 0)
	{
		return;
	}
	if(!isalive(self))
	{
		return;
	}
	if(self.weapon.statname === #"ultimate_turret")
	{
		return false;
	}
	weapon_cache = function_2cf636b5(localclientnum);
	if(!isdefined(weapon_cache))
	{
		return false;
	}
	if(level.var_745f6ccb[localclientnum] == 0)
	{
		function_cfade99b(localclientnum);
		return true;
	}
	return false;
}

/*
	Name: function_e18d0975
	Namespace: weapon_cache
	Checksum: 0xF9FDE161
	Offset: 0xBD8
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function function_e18d0975(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("5fa89c4a37364797");
	self endon("5fa89c4a37364797");
	var_bd0cdac3 = "weapon_cache_cac_request";
	var_b784f644 = var_bd0cdac3 + localclientnum;
	while(true)
	{
		util::waittill_any_ents(self, var_bd0cdac3, level, var_b784f644);
		self function_a979e61b(localclientnum);
	}
}

/*
	Name: function_2cf636b5
	Namespace: weapon_cache
	Checksum: 0x8130765C
	Offset: 0xC90
	Size: 0x134
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2cf636b5(localclientnum)
{
	if(!isdefined(level.var_b5f67dff))
	{
		return undefined;
	}
	playerorigin = getlocalclienteyepos(localclientnum);
	foreach(weapon_cache in level.var_b5f67dff)
	{
		if(!isdefined(weapon_cache))
		{
			continue;
		}
		if(distance2dsquared(playerorigin, weapon_cache.origin) > sqr(96) || (abs(playerorigin[2] - weapon_cache.origin[2])) > 96)
		{
			continue;
		}
		return weapon_cache;
	}
}

/*
	Name: function_f3b7c879
	Namespace: weapon_cache
	Checksum: 0x20E08C16
	Offset: 0xDD0
	Size: 0x14C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f3b7c879(localclientnum)
{
	var_acc39f5a = function_1df4c3b0(localclientnum, #"hud_items");
	var_56436909 = getuimodel(var_acc39f5a, "weaponCachePromptState");
	var_559f3f0d = is_true(level.var_2e44d000[localclientnum]);
	var_1d992cd3 = is_true(level.var_745f6ccb[localclientnum]);
	if(var_559f3f0d && var_1d992cd3)
	{
		setuimodelvalue(var_56436909, 0);
	}
	else
	{
		if(var_559f3f0d)
		{
			setuimodelvalue(var_56436909, 1);
		}
		else
		{
			if(var_1d992cd3)
			{
				setuimodelvalue(var_56436909, 1);
			}
			else
			{
				setuimodelvalue(var_56436909, 1);
			}
		}
	}
}

