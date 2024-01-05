#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\player\player_stats.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\sound_shared.csc;

#namespace smokegrenade;

/*
	Name: function_170b4e56
	Namespace: smokegrenade
	Checksum: 0xEC1C5685
	Offset: 0x148
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_170b4e56()
{
	level notify(-2096128225);
}

/*
	Name: init_shared
	Namespace: smokegrenade
	Checksum: 0x8C54B887
	Offset: 0x168
	Size: 0x1FC
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	clientfield::register("allplayers", "inenemysmoke", 14000, 1, "int", &insmoke, 0, 0);
	clientfield::register("scriptmover", "smoke_state", 16000, 1, "int", &function_ffbaa2ce, 0, 0);
	clientfield::register("allplayers", "insmoke", 16000, 2, "int", &insmoke, 0, 0);
	clientfield::register("allplayers", "foggerpostfx", 9000, 1, "int", &function_f9dcc967, 0, 0);
	renderoverridebundle::function_f72f089c(#"hash_8120ecc0ceec5c6", "rob_mute_smoke_outline", &function_28db726, undefined, undefined, 1);
	renderoverridebundle::function_f72f089c(#"hash_224b6b4d7364dbb5", "rob_mute_smoke_outline_team", &function_62ec0142, undefined, undefined, 1);
	callback::on_localplayer_spawned(&on_local_player_spawned);
	callback::on_end_game(&on_end_game);
	level.var_7cc76271 = &vehicle_transition;
}

/*
	Name: on_local_player_spawned
	Namespace: smokegrenade
	Checksum: 0x8B02AB51
	Offset: 0x370
	Size: 0x108
	Parameters: 1
	Flags: None
*/
function on_local_player_spawned(local_client_num)
{
	thread function_e69d0e4d(local_client_num);
	thread track_grenades(local_client_num);
	players = getplayers(local_client_num);
	foreach(player in players)
	{
		if(isdefined(player) && isalive(player))
		{
			player function_4fc900e1(local_client_num);
		}
	}
}

/*
	Name: on_end_game
	Namespace: smokegrenade
	Checksum: 0xF0A66031
	Offset: 0x480
	Size: 0x4C
	Parameters: 1
	Flags: Private
*/
function private on_end_game(localclientnum)
{
	if(function_148ccc79(localclientnum, #"hash_30151d88bd3161d3"))
	{
		codestoppostfxbundlelocal(localclientnum, #"hash_30151d88bd3161d3");
	}
}

/*
	Name: track_grenades
	Namespace: smokegrenade
	Checksum: 0x16E3E7A2
	Offset: 0x4D8
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function track_grenades(local_client_num)
{
	self notify(#"track_grenades");
	self endon(#"track_grenades", #"death", #"disconnect");
	waitresult = undefined;
	waitresult = self waittill(#"grenade_fire");
	grenade = waitresult.projectile;
	weapon = waitresult.weapon;
}

/*
	Name: function_709fad19
	Namespace: smokegrenade
	Checksum: 0x25F7B2DE
	Offset: 0x580
	Size: 0xAE
	Parameters: 0
	Flags: None
*/
function function_709fad19()
{
	weapon = getweapon(#"eq_smoke");
	if(!isdefined(weapon) || weapon == level.weaponnone || !isdefined(weapon.customsettings))
	{
		return 128;
	}
	var_b0b958b3 = getscriptbundle(weapon.customsettings);
	return (isdefined(var_b0b958b3.var_40dfefd1) ? var_b0b958b3.var_40dfefd1 : 128);
}

/*
	Name: monitor_smoke
	Namespace: smokegrenade
	Checksum: 0xBC29FE50
	Offset: 0x638
	Size: 0x260
	Parameters: 1
	Flags: None
*/
function monitor_smoke(local_client_num)
{
	var_d3f60df1 = self;
	self notify(#"monitor_smoke");
	self endon(#"monitor_smoke", #"death", #"delete");
	localplayer = function_5c10bd79(local_client_num);
	if(isdefined(var_d3f60df1) && isdefined(var_d3f60df1.owner) && isdefined(localplayer) && var_d3f60df1.owner != localplayer)
	{
		return;
	}
	radius = function_709fad19();
	while(isdefined(var_d3f60df1))
	{
		waitresult = undefined;
		waitresult = var_d3f60df1 waittilltimeout(0.25, #"death");
		players = getplayers(local_client_num);
		foreach(player in players)
		{
			dist = distance2d(player.origin, var_d3f60df1.origin);
			if(dist < radius)
			{
				if(!isdefined(player.var_d3f60df1))
				{
					player.var_d3f60df1 = var_d3f60df1;
					player function_4fc900e1(local_client_num);
				}
				continue;
			}
			if(isdefined(player.var_d3f60df1))
			{
				player.var_d3f60df1 = undefined;
				player function_4fc900e1(local_client_num);
			}
		}
		if(waitresult._notify != "timeout")
		{
			break;
		}
	}
}

/*
	Name: function_ffbaa2ce
	Namespace: smokegrenade
	Checksum: 0xA672A974
	Offset: 0x8A0
	Size: 0x148
	Parameters: 7
	Flags: None
*/
function function_ffbaa2ce(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self thread monitor_smoke(fieldname);
	}
	else
	{
		self notify(#"monitor_smoke");
		players = getplayers(fieldname);
		foreach(player in players)
		{
			if(isdefined(player) && isalive(player))
			{
				player.var_d3f60df1 = undefined;
				player function_4fc900e1(fieldname);
			}
		}
	}
}

/*
	Name: function_e69d0e4d
	Namespace: smokegrenade
	Checksum: 0x371F34D9
	Offset: 0x9F0
	Size: 0x1DC
	Parameters: 1
	Flags: None
*/
function function_e69d0e4d(local_client_num)
{
	self notify(#"hash_2286178f49f4601d");
	self endon(#"hash_2286178f49f4601d", #"death", #"disconnect");
	var_e098466f = 0;
	while(true)
	{
		var_7bf0773f = function_7bf0773f(local_client_num);
		if(is_true(var_e098466f) && !var_7bf0773f || (!is_true(var_e098466f) && var_7bf0773f))
		{
			var_85098191 = function_5778f82(local_client_num, #"hash_410c46b5ff702c96");
			if(var_85098191)
			{
				players = getplayers(local_client_num);
				foreach(player in players)
				{
					if(isdefined(player) && isalive(player))
					{
						player function_4fc900e1(local_client_num);
					}
				}
			}
			var_e098466f = var_7bf0773f;
		}
		wait(0.25);
	}
}

/*
	Name: function_62ec0142
	Namespace: smokegrenade
	Checksum: 0xA74F67C3
	Offset: 0xBD8
	Size: 0x1F0
	Parameters: 2
	Flags: None
*/
function function_62ec0142(local_client_num, bundle)
{
	var_85098191 = function_5778f82(bundle, #"hash_410c46b5ff702c96");
	if(!var_85098191)
	{
		return false;
	}
	if(util::is_player_view_linked_to_entity(bundle))
	{
		return false;
	}
	if(!self function_ca024039())
	{
		return false;
	}
	if(function_7bf0773f(bundle))
	{
		return false;
	}
	if(!(isdefined(self.insmoke) && self.insmoke & 2))
	{
		return false;
	}
	localplayer = function_5c10bd79(bundle);
	if(self == localplayer)
	{
		curweapon = self function_d2c2b168();
		blade = getweapon(#"sig_blade");
		if(!isthirdperson(bundle) || curweapon != blade)
		{
			return false;
		}
	}
	weapon = getweapon("eq_smoke");
	if(isdefined(weapon.customsettings))
	{
		var_ed9e87ac = getscriptbundle(weapon.customsettings);
		/#
			assert(isdefined(var_ed9e87ac));
		#/
		if(!(isdefined(var_ed9e87ac.var_563d4859) ? var_ed9e87ac.var_563d4859 : 0))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_28db726
	Namespace: smokegrenade
	Checksum: 0xC8485E6A
	Offset: 0xDD0
	Size: 0x180
	Parameters: 2
	Flags: None
*/
function function_28db726(local_client_num, bundle)
{
	var_85098191 = function_5778f82(bundle, #"hash_410c46b5ff702c96");
	if(!var_85098191)
	{
		return false;
	}
	if(util::is_player_view_linked_to_entity(bundle))
	{
		return false;
	}
	if(self function_ca024039())
	{
		return false;
	}
	if(function_7bf0773f(bundle))
	{
		return false;
	}
	if(!(isdefined(self.insmoke) && self.insmoke & 1))
	{
		return false;
	}
	weapon = getweapon("eq_smoke");
	if(isdefined(weapon.customsettings))
	{
		var_ed9e87ac = getscriptbundle(weapon.customsettings);
		/#
			assert(isdefined(var_ed9e87ac));
		#/
		if((isdefined(var_ed9e87ac.var_ae2b2941) ? var_ed9e87ac.var_ae2b2941 : 0) && self function_6c32d092(bundle, #"talent_coldblooded"))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: vehicle_transition
	Namespace: smokegrenade
	Checksum: 0x90B857C7
	Offset: 0xF58
	Size: 0x128
	Parameters: 7
	Flags: None
*/
function vehicle_transition(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	players = getplayers(bwastimejump);
	foreach(player in players)
	{
		if(isalive(player))
		{
			var_85098191 = function_5778f82(bwastimejump, #"hash_410c46b5ff702c96");
			if(var_85098191)
			{
				player function_4fc900e1(bwastimejump);
			}
		}
	}
}

/*
	Name: function_4fc900e1
	Namespace: smokegrenade
	Checksum: 0xE6CF0916
	Offset: 0x1088
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_4fc900e1(local_client_num)
{
	self renderoverridebundle::function_c8d97b8e(local_client_num, #"friendly_smoke", #"hash_8120ecc0ceec5c6");
	self renderoverridebundle::function_c8d97b8e(local_client_num, #"enemy_smoke", #"hash_224b6b4d7364dbb5");
}

/*
	Name: insmoke
	Namespace: smokegrenade
	Checksum: 0xA2453F21
	Offset: 0x1110
	Size: 0x9C
	Parameters: 7
	Flags: None
*/
function insmoke(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	player = self;
	player.insmoke = bwastimejump;
	var_85098191 = function_5778f82(fieldname, #"hash_410c46b5ff702c96");
	if(var_85098191)
	{
		function_4fc900e1(fieldname);
	}
}

/*
	Name: function_f9dcc967
	Namespace: smokegrenade
	Checksum: 0x4F25B740
	Offset: 0x11B8
	Size: 0x11C
	Parameters: 7
	Flags: Private
*/
function private function_f9dcc967(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	player = self;
	player.var_9ebdc528 = bwastimejump;
	if(isdefined(player) && player function_21c0fa55())
	{
		var_a62ca6c4 = player postfx::function_556665f2(#"hash_30151d88bd3161d3");
		if(player.var_9ebdc528 && !var_a62ca6c4)
		{
			player postfx::playpostfxbundle(#"hash_30151d88bd3161d3");
		}
		else if(!player.var_9ebdc528 && var_a62ca6c4)
		{
			player postfx::exitpostfxbundle(#"hash_30151d88bd3161d3");
		}
	}
}

