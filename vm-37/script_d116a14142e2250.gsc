#using script_13da4e6b98ca81a1;
#using script_3d0f36632dad12df;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\vehicle_shared.csc;

#namespace killstreaks;

/*
	Name: init_shared
	Namespace: killstreaks
	Checksum: 0xBE8416A9
	Offset: 0x250
	Size: 0x474
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	clientfield::function_a8bbc967("locSel.commandMode", #"hash_5bbe0cd6740ab2b6", #"hash_59184771800cc1f9", 1, 1, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("locSel.snapTo", #"hash_5bbe0cd6740ab2b6", #"hash_4f706dc5af7c4cec", 1, 1, "int", undefined, 0, 0);
	clientfield::register("vehicle", "timeout_beep", 1, 2, "int", &timeout_beep, 0, 0);
	clientfield::register("toplayer", "thermal_glow", 1, 1, "int", &function_6d265b7f, 0, 1);
	clientfield::register("toplayer", "thermal_glow_enemies_only", 12000, 1, "int", &function_c66f053, 0, 1);
	clientfield::register("allplayers", "killstreak_spawn_protection", 1, 1, "int", &function_77515127, 0, 0);
	clientfield::register("vehicle", "timeout_beep", 1, 2, "int", &timeout_beep, 0, 0);
	clientfield::register("vehicle", "standardTagFxSet", 1, 1, "int", &function_eef48704, 0, 0);
	clientfield::register("scriptmover", "standardTagFxSet", 1, 1, "int", &function_eef48704, 0, 0);
	clientfield::register("scriptmover", "lowHealthTagFxSet", 1, 1, "int", &function_11044e2b, 0, 0);
	clientfield::register("scriptmover", "deathTagFxSet", 1, 1, "int", &function_d440313, 0, 0);
	clientfield::register("toplayer", "" + #"hash_524d30f5676b2070", 1, 1, "int", &function_ce367b0c, 0, 0);
	clientfield::register("vehicle", "scorestreakActive", 1, 1, "int", &function_5ec060c4, 0, 0);
	clientfield::register("scriptmover", "scorestreakActive", 1, 1, "int", &function_5ec060c4, 0, 0);
	callback::on_spawned(&on_player_spawned);
	callback::function_74f5faf8(&function_74f5faf8);
	level.killstreakcorebundle = getscriptbundle("killstreak_core");
}

/*
	Name: function_5ec060c4
	Namespace: killstreaks
	Checksum: 0xDD4125E5
	Offset: 0x6D0
	Size: 0xD4
	Parameters: 7
	Flags: Linked, Private
*/
function private function_5ec060c4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(self.weapon == getweapon(#"uav") || self.weapon == getweapon(#"counteruav"))
		{
			if(self function_e9fc6a64())
			{
				return;
			}
		}
		self function_1f0c7136(2);
	}
}

/*
	Name: timeout_beep
	Namespace: killstreaks
	Checksum: 0x5AA8920F
	Offset: 0x7B0
	Size: 0x27A
	Parameters: 7
	Flags: Linked
*/
function timeout_beep(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self notify(#"timeout_beep");
	if(!bwastimejump)
	{
		return;
	}
	if(isdefined(self.killstreakbundle))
	{
		beepalias = self.killstreakbundle.kstimeoutbeepalias;
	}
	else if(isdefined(self.var_51d5c26f))
	{
		beepalias = self.var_51d5c26f.kstimeoutbeepalias;
		var_4f5f9e46 = self.var_51d5c26f.var_90af4f48;
	}
	self endon(#"death");
	self endon(#"timeout_beep");
	interval = 1;
	if(bwastimejump == 2)
	{
		interval = 0.133;
	}
	while(true)
	{
		if(isdefined(beepalias))
		{
			var_91e09a3a = 1;
			if(var_4f5f9e46 === 1)
			{
				driver = self getlocalclientdriver();
				if(!isdefined(driver))
				{
					var_91e09a3a = 0;
				}
			}
			if(var_91e09a3a)
			{
				offset = (0, 0, (isdefined(self.killstreakbundle.var_19d5e80a) ? self.killstreakbundle.var_19d5e80a : 0));
				self playsound(fieldname, beepalias, self.origin + offset);
			}
		}
		if(self.timeoutlightsoff === 1)
		{
			self vehicle::lights_on(fieldname);
			self.timeoutlightsoff = 0;
		}
		else
		{
			self vehicle::lights_off(fieldname);
			self.timeoutlightsoff = 1;
		}
		util::server_wait(fieldname, interval);
		interval = math::clamp(interval / 1.17, 0.1, 1);
	}
}

/*
	Name: function_6d265b7f
	Namespace: killstreaks
	Checksum: 0x50036108
	Offset: 0xA38
	Size: 0x110
	Parameters: 7
	Flags: Linked
*/
function function_6d265b7f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	players = getplayers(fieldname);
	foreach(player in players)
	{
		if(!isdefined(player))
		{
			continue;
		}
		player renderoverridebundle::function_f4eab437(fieldname, bwastimejump, #"hash_2c6fce4151016478", &function_429c452);
	}
}

/*
	Name: function_c66f053
	Namespace: killstreaks
	Checksum: 0xC0260C4C
	Offset: 0xB50
	Size: 0x148
	Parameters: 7
	Flags: Linked
*/
function function_c66f053(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	local_player = self;
	var_c86e6ba8 = self.team;
	players = getplayers(fieldname);
	var_657eb40b = bwastimejump == 1;
	foreach(player in players)
	{
		if(!isdefined(player))
		{
			continue;
		}
		player renderoverridebundle::function_f4eab437(fieldname, var_657eb40b, #"hash_53798044d9a468d7", &function_e56218ab);
	}
}

/*
	Name: function_429c452
	Namespace: killstreaks
	Checksum: 0x78E0A23E
	Offset: 0xCA0
	Size: 0x126
	Parameters: 2
	Flags: Linked
*/
function function_429c452(localclientnum, var_657eb40b)
{
	if(!var_657eb40b)
	{
		return 0;
	}
	if(!isdefined(self))
	{
		return 0;
	}
	if(!isplayer(self))
	{
		return var_657eb40b;
	}
	localplayer = function_5c10bd79(localclientnum);
	if(isdefined(localplayer) && !localplayer util::isenemyteam(self.team))
	{
		return 0;
	}
	if(!function_266be0d4(localclientnum))
	{
		return 0;
	}
	if(self hasperk(localclientnum, #"specialty_nokillstreakreticle"))
	{
		return 0;
	}
	if(self clientfield::get("killstreak_spawn_protection"))
	{
		return 0;
	}
	if(codcaster::function_c955fbd1(localclientnum))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_e56218ab
	Namespace: killstreaks
	Checksum: 0x34BB72D
	Offset: 0xDD0
	Size: 0x116
	Parameters: 2
	Flags: Linked
*/
function function_e56218ab(localclientnum, var_657eb40b)
{
	if(!var_657eb40b)
	{
		return 0;
	}
	if(!isdefined(self))
	{
		return 0;
	}
	if(!isplayer(self))
	{
		return var_657eb40b;
	}
	localplayer = function_5c10bd79(localclientnum);
	if(isdefined(localplayer) && localplayer.team == self.team)
	{
		return 0;
	}
	if(!function_266be0d4(localclientnum))
	{
		return 0;
	}
	if(self hasperk(localclientnum, #"specialty_nokillstreakreticle"))
	{
		return 0;
	}
	if(self clientfield::get("killstreak_spawn_protection"))
	{
		return 0;
	}
	if(codcaster::function_c955fbd1(localclientnum))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_77515127
	Namespace: killstreaks
	Checksum: 0x5801ADBA
	Offset: 0xEF0
	Size: 0xBC
	Parameters: 7
	Flags: Linked
*/
function function_77515127(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self thread renderoverridebundle::function_ee77bff9(bwastimejump, "thermal_glow", #"hash_2c6fce4151016478", &function_429c452);
	self thread renderoverridebundle::function_ee77bff9(bwastimejump, "thermal_glow_enemies_only", #"hash_53798044d9a468d7", &function_e56218ab);
}

/*
	Name: on_player_spawned
	Namespace: killstreaks
	Checksum: 0xA5F277C2
	Offset: 0xFB8
	Size: 0xCE
	Parameters: 1
	Flags: Linked
*/
function on_player_spawned(localclientnum)
{
	self renderoverridebundle::function_f4eab437(localclientnum, 0, #"hash_2c6fce4151016478");
	self renderoverridebundle::function_f4eab437(localclientnum, 0, #"hash_53798044d9a468d7");
	if(self function_da43934d())
	{
		if(isdefined(self.var_29806c31) && self function_d2cb869e(self.var_29806c31))
		{
			self codestoppostfxbundle(self.var_29806c31);
			self.var_29806c31 = undefined;
		}
	}
}

/*
	Name: function_74f5faf8
	Namespace: killstreaks
	Checksum: 0x3B8BEDCD
	Offset: 0x1090
	Size: 0x1E4
	Parameters: 1
	Flags: Linked
*/
function function_74f5faf8(var_aa127355)
{
	localclientnum = var_aa127355.localclientnum;
	var_dc39bd32 = function_5c10bd79(localclientnum);
	if(codcaster::function_c955fbd1(localclientnum))
	{
		if(isdefined(var_dc39bd32.var_29806c31) && var_dc39bd32 function_d2cb869e(var_dc39bd32.var_29806c31))
		{
			var_dc39bd32 codestoppostfxbundle(var_dc39bd32.var_29806c31);
		}
		foreach(player in getplayers(localclientnum))
		{
			if(isdefined(player) && !function_3132f113(player))
			{
				player renderoverridebundle::function_f4eab437(localclientnum, 0, #"hash_2c6fce4151016478");
			}
		}
	}
	else if(codcaster::function_b8fe9b52(localclientnum))
	{
		if(isdefined(var_dc39bd32.var_29806c31) && !var_dc39bd32 function_d2cb869e(var_dc39bd32.var_29806c31))
		{
			var_dc39bd32 codeplaypostfxbundle(var_dc39bd32.var_29806c31);
		}
	}
}

/*
	Name: function_eef48704
	Namespace: killstreaks
	Checksum: 0x4EA365D0
	Offset: 0x1280
	Size: 0x118
	Parameters: 7
	Flags: Linked
*/
function function_eef48704(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	entnum = self getentitynumber();
	function_fb18ebcc(fieldname, entnum);
	if(bwastimejump == 1)
	{
		self util::waittill_dobj(fieldname);
		waittillframeend();
		if(!isentity(self))
		{
			return;
		}
		if(!isdefined(self.killstreakbundle.var_d81025a))
		{
			return;
		}
		if(!isdefined(level.var_da32fba8))
		{
			level.var_da32fba8 = [];
		}
		level.var_da32fba8[entnum] = playtagfxset(fieldname, self.killstreakbundle.var_d81025a, self);
	}
}

/*
	Name: function_fb18ebcc
	Namespace: killstreaks
	Checksum: 0x6D6A0104
	Offset: 0x13A0
	Size: 0xE8
	Parameters: 2
	Flags: Linked
*/
function function_fb18ebcc(localclientnum, entnum)
{
	if(!isdefined(entnum))
	{
		return;
	}
	if(!isdefined(level.var_da32fba8[entnum]))
	{
		return;
	}
	fxarray = level.var_da32fba8[entnum];
	foreach(fx_id in fxarray)
	{
		stopfx(localclientnum, fx_id);
	}
	level.var_da32fba8[entnum] = undefined;
}

/*
	Name: function_11044e2b
	Namespace: killstreaks
	Checksum: 0xC9592044
	Offset: 0x1490
	Size: 0xD4
	Parameters: 7
	Flags: Linked
*/
function function_11044e2b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 0)
	{
		return;
	}
	if(!isdefined(self.killstreakbundle.var_7021eaaa))
	{
		return;
	}
	self util::waittill_dobj(fieldname);
	if(!isentity(self))
	{
		return;
	}
	if(!isdefined(self.killstreakbundle.var_7021eaaa))
	{
		return;
	}
	playtagfxset(fieldname, self.killstreakbundle.var_7021eaaa, self);
}

/*
	Name: function_d440313
	Namespace: killstreaks
	Checksum: 0x63ED66D0
	Offset: 0x1570
	Size: 0xD4
	Parameters: 7
	Flags: Linked
*/
function function_d440313(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 0)
	{
		return;
	}
	if(!isdefined(self.killstreakbundle.var_349c25fe))
	{
		return;
	}
	self util::waittill_dobj(fieldname);
	if(!isentity(self))
	{
		return;
	}
	if(!isdefined(self.killstreakbundle.var_349c25fe))
	{
		return;
	}
	playtagfxset(fieldname, self.killstreakbundle.var_349c25fe, self);
}

/*
	Name: function_ce367b0c
	Namespace: killstreaks
	Checksum: 0x367CA0A9
	Offset: 0x1650
	Size: 0x1EC
	Parameters: 7
	Flags: Linked
*/
function function_ce367b0c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"disconnect");
	if(isdefined(self.var_29806c31))
	{
		if(self function_d2cb869e(self.var_29806c31))
		{
			self codestoppostfxbundle(self.var_29806c31);
		}
		self.var_29806c31 = undefined;
	}
	if(squad_spawn::function_21b773d5(fieldname))
	{
		return;
	}
	if(bwastimejump)
	{
		killstreakbundle = function_bd2d5a8e(self.weapon.name);
		postfxbundle = killstreakbundle.var_bda68f72;
		if(!isdefined(postfxbundle))
		{
			return;
		}
		if(!codcaster::function_c955fbd1(fieldname))
		{
			self codeplaypostfxbundle(postfxbundle);
		}
		self.var_29806c31 = postfxbundle;
		if(isdefined(killstreakbundle.var_d80ce136))
		{
			self playsound(fieldname, killstreakbundle.var_d80ce136);
		}
		if(function_1cbf351b(fieldname))
		{
			self thread function_2dab81c1(postfxbundle);
		}
		if(codcaster::function_b8fe9b52(fieldname))
		{
			thread function_712a3516(fieldname, self, postfxbundle);
		}
	}
}

/*
	Name: function_bd2d5a8e
	Namespace: killstreaks
	Checksum: 0xA52F3B09
	Offset: 0x1848
	Size: 0x14E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bd2d5a8e(killstreakweaponname)
{
	if(!isdefined(killstreakweaponname))
	{
		return;
	}
	switch(killstreakweaponname)
	{
		case "hash_459c0007ec5e2470":
		case "ac130":
		{
			bundle = getscriptbundle("killstreak_ac130");
			break;
		}
		case "hash_1bf811fa5d684607":
		case "chopper_gunner":
		{
			bundle = getscriptbundle("killstreak_chopper_gunner");
			break;
		}
		case "recon_car":
		case "inventory_recon_car":
		{
			bundle = getscriptbundle("killstreak_recon_car");
			break;
		}
		case "remote_missile":
		case "inventory_remote_missile":
		{
			bundle = getscriptbundle("killstreak_remote_missile");
			break;
		}
		default:
		{
			break;
		}
	}
	return bundle;
}

/*
	Name: function_2dab81c1
	Namespace: killstreaks
	Checksum: 0x9397CFA4
	Offset: 0x19A0
	Size: 0xAE
	Parameters: 1
	Flags: Linked
*/
function function_2dab81c1(bundlename)
{
	var_17b7891d = "18bfe48c89c5e499" + bundlename;
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	localclientnum = self.localclientnum;
	self waittill(#"death");
	if(function_148ccc79(localclientnum, bundlename))
	{
		codestoppostfxbundlelocal(localclientnum, bundlename);
		if(self.var_29806c31 === bundlename)
		{
			self.var_29806c31 = undefined;
		}
	}
}

/*
	Name: function_712a3516
	Namespace: killstreaks
	Checksum: 0xFAAE35E3
	Offset: 0x1A58
	Size: 0x10A
	Parameters: 3
	Flags: Linked
*/
function function_712a3516(localclientnum, var_38d5ac93, bundlename)
{
	level endon(#"disconnect", #"game_ended");
	if(isdefined(var_38d5ac93) && isdefined(bundlename))
	{
		playerentnum = var_38d5ac93 getentitynumber();
		while(true)
		{
			waitframe(1);
			if(!isdefined(var_38d5ac93) || !isdefined(var_38d5ac93.var_29806c31))
			{
				player = getentbynum(localclientnum, playerentnum);
				if(isdefined(player) && player function_d2cb869e(bundlename))
				{
					player codestoppostfxbundle(bundlename);
				}
				return;
			}
		}
	}
}

