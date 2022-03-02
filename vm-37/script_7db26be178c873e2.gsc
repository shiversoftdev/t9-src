#using script_240ef62ff60b2694;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\sound_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace smokegrenade;

/*
	Name: init_shared
	Namespace: smokegrenade
	Checksum: 0xE96617F4
	Offset: 0x130
	Size: 0x194
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	clientfield::register("allplayers", "inenemysmoke", 14000, 1, "int", &insmoke, 0, 0);
	clientfield::register("scriptmover", "smoke_state", 16000, 1, "int", &function_ffbaa2ce, 0, 0);
	clientfield::register("allplayers", "insmoke", 16000, 2, "int", &insmoke, 0, 0);
	renderoverridebundle::function_f72f089c(#"hash_8120ecc0ceec5c6", "rob_mute_smoke_outline", &function_28db726, undefined, undefined, 1);
	renderoverridebundle::function_f72f089c(#"hash_224b6b4d7364dbb5", "rob_mute_smoke_outline_team", &function_62ec0142, undefined, undefined, 1);
	callback::on_localplayer_spawned(&on_local_player_spawned);
	level.var_7cc76271 = &vehicle_transition;
}

/*
	Name: on_local_player_spawned
	Namespace: smokegrenade
	Checksum: 0x26D06FEC
	Offset: 0x2D0
	Size: 0x108
	Parameters: 1
	Flags: None
*/
function on_local_player_spawned(local_client_num)
{
	thread function_e69d0e4d(local_client_num);
	thread function_16e642d6(local_client_num);
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
	Name: function_16e642d6
	Namespace: smokegrenade
	Checksum: 0xDDF7FDAF
	Offset: 0x3E0
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function function_16e642d6(local_client_num)
{
	self notify(#"hash_69c8c6c8ba675506");
	self endon(#"hash_69c8c6c8ba675506", #"death", #"disconnect");
	waitresult = undefined;
	waitresult = self waittill(#"grenade_fire");
	grenade = waitresult.projectile;
	weapon = waitresult.weapon;
}

/*
	Name: function_709fad19
	Namespace: smokegrenade
	Checksum: 0x287EB205
	Offset: 0x488
	Size: 0xAE
	Parameters: 0
	Flags: None
*/
function function_709fad19()
{
	weapon = getweapon(#"eq_smoke");
	if(!isdefined(weapon) || weapon == level.weaponnone || !isdefined(weapon.var_4dd46f8a))
	{
		return 128;
	}
	var_b0b958b3 = getscriptbundle(weapon.var_4dd46f8a);
	return (isdefined(var_b0b958b3.var_40dfefd1) ? var_b0b958b3.var_40dfefd1 : 128);
}

/*
	Name: monitor_smoke
	Namespace: smokegrenade
	Checksum: 0x675B911C
	Offset: 0x540
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
	Checksum: 0xEFEB0A4F
	Offset: 0x7A8
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
	Checksum: 0xABBE2B2E
	Offset: 0x8F8
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
	Checksum: 0x1759F211
	Offset: 0xAE0
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
	if(isdefined(weapon.var_4dd46f8a))
	{
		var_ed9e87ac = getscriptbundle(weapon.var_4dd46f8a);
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
	Checksum: 0xBD3A22E7
	Offset: 0xCD8
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
	if(isdefined(weapon.var_4dd46f8a))
	{
		var_ed9e87ac = getscriptbundle(weapon.var_4dd46f8a);
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
	Checksum: 0xAE425CFB
	Offset: 0xE60
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
	Checksum: 0x103DE5E
	Offset: 0xF90
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_4fc900e1(local_client_num)
{
	self renderoverridebundle::function_c8d97b8e(local_client_num, #"hash_2b9d344f3679c3d4", #"hash_8120ecc0ceec5c6");
	self renderoverridebundle::function_c8d97b8e(local_client_num, #"hash_148067bf5c254455", #"hash_224b6b4d7364dbb5");
}

/*
	Name: insmoke
	Namespace: smokegrenade
	Checksum: 0x2A20378B
	Offset: 0x1018
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

