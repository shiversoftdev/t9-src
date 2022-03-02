#using script_4a04e1760d0523d3;
#using script_6741a9edbcf6c25e;
#using script_680dddbda86931fa;
#using script_6a72d858ff1942eb;
#using script_7222862da5baa189;
#using script_72587ba89a212e22;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace fireteam_dirty_bomb;

/*
	Name: function_23263984
	Namespace: fireteam_dirty_bomb
	Checksum: 0x24739991
	Offset: 0x328
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_23263984()
{
	level notify(1294906739);
}

/*
	Name: main
	Namespace: fireteam_dirty_bomb
	Checksum: 0x56DE212B
	Offset: 0x348
	Size: 0x3CC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	if(!namespace_681edb36::function_23dd41e7())
	{
		return;
	}
	namespace_2938acdc::init();
	dirtybomb_usebar::register(undefined, &function_866f5f2c);
	clientfield::register("toplayer", "using_bomb", 1, 2, "int", &function_18272d54, 0, 0);
	clientfield::function_a8bbc967("hudItems.uraniumCarryCount", #"hud_items", #"hash_556b3df8ae964e7c", 1, 4, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.uraniumMaxCarry", #"hud_items", #"hash_1879fbcae78c5417", 1, 4, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.uraniumFullCarry", #"hud_items", #"hash_451ab3abde68434a", 1, 1, "int", undefined, 0, 0);
	clientfield::register("allplayers", "carryingUranium", 1, 1, "int", &function_46afac0, 0, 1);
	clientfield::register("scriptmover", "bombsound", 1, 1, "int", &function_f20fb48, 0, 0);
	clientfield::function_5b7d846d("hud_items_dirty_bomb.bomb_respawn_disabled", #"hash_1115137708f64303", #"hash_611630c939ad1b67", 1, 1, "int", undefined, 0, 0);
	level.var_b637a0c0 = &function_e99f251a;
	level.var_75f7e612 = &function_218c0417;
	level.var_977ee0c2 = &function_a2807fc5;
	level.squadspawnactive = &function_f4f21a7f;
	level.var_6ed4a19b = &function_ba474e49;
	level.var_ef77c3e3 = struct::get_array("fireteam_dirty_bomb", "variantname");
	namespace_681edb36::function_dd83b835();
	namespace_b77e8eb1::init();
	level.var_696298a2 = getweapon(#"hash_46cc133cf4065ae0");
	level.var_184c9036 = [];
	level.var_5976039d = [];
	level.var_c21cfcdf = [];
	for(i = 0; i < 4; i++)
	{
		level.var_5976039d[i] = [];
	}
	callback::on_localclient_connect(&on_localclient_connect);
}

/*
	Name: on_localclient_connect
	Namespace: fireteam_dirty_bomb
	Checksum: 0x516B949D
	Offset: 0x720
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function on_localclient_connect(localclientnum)
{
	var_2612e01d = function_1df4c3b0(localclientnum, #"hash_950d3dccba39e08");
	var_1e885680 = getuimodel(var_2612e01d, "count");
	setuimodelvalue(var_1e885680, 4);
	level thread function_bb2f717e(localclientnum);
}

/*
	Name: function_bb2f717e
	Namespace: fireteam_dirty_bomb
	Checksum: 0x2C7589B0
	Offset: 0x7C0
	Size: 0x2F6
	Parameters: 1
	Flags: Private
*/
function private function_bb2f717e(localclientnum)
{
	self endon(#"shutdown");
	var_61efd7d9 = [];
	for(index = 0; index < 5; index++)
	{
		model = spawn(localclientnum, (0, 0, 0), "script_model");
		model setmodel(#"tag_origin");
		model hide();
		model notsolid();
		var_61efd7d9[var_61efd7d9.size] = model;
	}
	while(true)
	{
		if(!isdefined(level.var_5862f2ce))
		{
			wait(1);
			continue;
		}
		draworigin = getcamposbylocalclientnum(localclientnum);
		containers = arraysortclosest(level.var_5862f2ce, draworigin, 5, 0, 1500);
		var_7dcc7dd4 = [];
		for(index = 0; index < containers.size; index++)
		{
			if(!function_8a8a409b(containers[index]))
			{
				continue;
			}
			if(function_ffdbe8c2(containers[index]) != 2)
			{
				var_7dcc7dd4[var_7dcc7dd4.size] = containers[index];
			}
		}
		containers = var_7dcc7dd4;
		for(index = 0; index < containers.size; index++)
		{
			var_61efd7d9[index].origin = containers[index].origin;
			if(isdefined(var_61efd7d9[index].var_95f008e))
			{
				continue;
			}
			var_61efd7d9[index].var_95f008e = var_61efd7d9[index] playloopsound("amb_dirtybomb_container_amb", undefined, vectorscale((0, 0, 1), 25));
			var_61efd7d9[index] show();
		}
		for(index = containers.size; index < 5; index++)
		{
			if(!isdefined(var_61efd7d9[index].var_95f008e))
			{
				continue;
			}
			var_61efd7d9[index] stoploopsound(var_61efd7d9[index].var_95f008e);
			var_61efd7d9[index].var_95f008e = undefined;
			var_61efd7d9[index] hide();
		}
		wait(1);
	}
}

/*
	Name: function_e99f251a
	Namespace: fireteam_dirty_bomb
	Checksum: 0x8BEEC1A4
	Offset: 0xAC0
	Size: 0x148
	Parameters: 2
	Flags: Private
*/
function private function_e99f251a(localclientnum, var_a6762160)
{
	if(var_a6762160.itemtype == #"generic")
	{
		switch(var_a6762160.name)
		{
			case "armor_pouch_item_t9":
			{
				return self clientfield::get_player_uimodel("hudItems.armorPlateMaxCarry") != 10;
				break;
			}
			case "hash_b8b2580ac5556e1":
			{
				return self clientfield::get_player_uimodel("hud_items.selfReviveAvailable") == 0;
				break;
			}
			case "uranium_pouch_item_t9":
			{
				return self clientfield::get_player_uimodel("hudItems.uraniumMaxCarry") != 10;
				break;
			}
			case "hash_583f1687cefbd3f3":
			{
				return !namespace_234f0efc::function_d1aaf7a4();
				break;
			}
		}
		return 0;
	}
	if(var_a6762160.itemtype == #"hash_56d6621e6c4caf07")
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_218c0417
	Namespace: fireteam_dirty_bomb
	Checksum: 0x2B90350C
	Offset: 0xC10
	Size: 0xEE
	Parameters: 2
	Flags: Private
*/
function private function_218c0417(localclientnum, var_a6762160)
{
	if(var_a6762160.itemtype == #"generic")
	{
		if(var_a6762160.name == "uranium_item_t9")
		{
			var_e3483afe = self clientfield::get_player_uimodel("hudItems.uraniumCarryCount");
			if(var_e3483afe >= self clientfield::get_player_uimodel("hudItems.uraniumMaxCarry"))
			{
				return 0;
			}
		}
		return 0;
	}
	if(var_a6762160.itemtype == #"hash_56d6621e6c4caf07")
	{
		currentcount = self clientfield::get_player_uimodel("hudItems.armorPlateCount");
		return currentcount < 5;
	}
	return 1;
}

/*
	Name: function_a2807fc5
	Namespace: fireteam_dirty_bomb
	Checksum: 0x308DD0FE
	Offset: 0xD08
	Size: 0x12A
	Parameters: 2
	Flags: Private
*/
function private function_a2807fc5(localclientnum, var_a6762160)
{
	if(var_a6762160.itemtype == #"scorestreak")
	{
		weapons = self getweaponslist();
		foreach(weapon in weapons)
		{
			var_16f12c31 = namespace_ad5a0cd6::function_3531b9ba(weapon.name);
			if(!isdefined(var_16f12c31))
			{
				continue;
			}
			hasammo = self getweaponammostock(localclientnum, weapon) > 0;
			if(hasammo)
			{
				return true;
			}
		}
		return false;
	}
	return false;
}

/*
	Name: function_18272d54
	Namespace: fireteam_dirty_bomb
	Checksum: 0xDABDD839
	Offset: 0xE40
	Size: 0x16E
	Parameters: 7
	Flags: Private
*/
function private function_18272d54(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump > 0)
	{
		if(bwastimejump == 1)
		{
			self.var_a1aa992c = function_604c9983(fieldname, "fly_uranium_deposit_lp");
		}
		else if(bwastimejump == 2)
		{
			self.var_53f712e3 = function_604c9983(fieldname, "fly_uranium_priming_lp");
			self thread function_c24ee98c(fieldname);
		}
		self thread function_6e9e7ead(fieldname);
	}
	else
	{
		self notify(#"hash_470a1e2ae77ad9f2");
		if(isdefined(self.var_a1aa992c))
		{
			function_d48752e(fieldname, self.var_a1aa992c);
			self.var_a1aa992c = undefined;
		}
		if(isdefined(self.var_53f712e3))
		{
			function_d48752e(fieldname, self.var_53f712e3);
			self.var_53f712e3 = undefined;
		}
	}
}

/*
	Name: function_c24ee98c
	Namespace: fireteam_dirty_bomb
	Checksum: 0xDF90914
	Offset: 0xFB8
	Size: 0x2C4
	Parameters: 1
	Flags: Private
*/
function private function_c24ee98c(localclientnum)
{
	self endoncallback(&function_ea6da5f6, #"death", #"hash_470a1e2ae77ad9f2");
	level endon(#"game_ended");
	var_ede06f5d = gettime();
	while(true)
	{
		waitframe(1);
		if(getcurrentweapon(localclientnum) == level.var_696298a2)
		{
			level.var_c21cfcdf[localclientnum] = 1;
			activatorcount = level.var_184c9036[localclientnum];
			if(!isdefined(activatorcount))
			{
				continue;
			}
			for(i = 0; i < 4; i++)
			{
				if(activatorcount > i && !isdefined(level.var_5976039d[i][localclientnum]))
				{
					fxtag = "tag_fx";
					if(i < 3)
					{
						fxtag = fxtag + (string(3 - i));
					}
					level.var_5976039d[i][localclientnum] = playviewmodelfx(localclientnum, "weapon/fx9_equip_dirtybomb_detonator_light", fxtag);
					continue;
				}
				if(activatorcount <= i && isdefined(level.var_5976039d[i][localclientnum]))
				{
					killfx(localclientnum, level.var_5976039d[i][localclientnum]);
					level.var_5976039d[i][localclientnum] = undefined;
				}
			}
		}
		else if(is_true(level.var_c21cfcdf[localclientnum]) || gettime() > (var_ede06f5d + (int(1.5 * 1000))))
		{
			for(i = 0; i < 4; i++)
			{
				if(isdefined(level.var_5976039d[i][localclientnum]))
				{
					killfx(localclientnum, level.var_5976039d[i][localclientnum]);
					level.var_5976039d[i][localclientnum] = undefined;
				}
			}
			level.var_c21cfcdf[localclientnum] = undefined;
			break;
		}
	}
}

/*
	Name: function_ea6da5f6
	Namespace: fireteam_dirty_bomb
	Checksum: 0xC97307DC
	Offset: 0x1288
	Size: 0x130
	Parameters: 0
	Flags: Private
*/
function private function_ea6da5f6()
{
	var_236b121a = function_41bfa501();
	foreach(localclientnum in var_236b121a)
	{
		if(is_true(level.var_c21cfcdf[localclientnum]))
		{
			for(i = 0; i < 4; i++)
			{
				if(isdefined(level.var_5976039d[i][localclientnum]))
				{
					killfx(localclientnum, level.var_5976039d[i][localclientnum]);
					level.var_5976039d[i][localclientnum] = undefined;
				}
			}
			level.var_c21cfcdf[localclientnum] = undefined;
		}
	}
}

/*
	Name: function_866f5f2c
	Namespace: fireteam_dirty_bomb
	Checksum: 0xC8066718
	Offset: 0x13C0
	Size: 0x4C
	Parameters: 7
	Flags: Private
*/
function private function_866f5f2c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level.var_184c9036[fieldname] = bwastimejump;
}

/*
	Name: function_6e9e7ead
	Namespace: fireteam_dirty_bomb
	Checksum: 0x3DFEC195
	Offset: 0x1418
	Size: 0xC6
	Parameters: 1
	Flags: Private
*/
function private function_6e9e7ead(localclientnum)
{
	if(is_true(self.var_16778c9b))
	{
		return;
	}
	self.var_16778c9b = 1;
	self waittill(#"death");
	self.var_16778c9b = 0;
	if(isdefined(self.var_a1aa992c))
	{
		function_d48752e(localclientnum, self.var_a1aa992c);
		self.var_a1aa992c = undefined;
	}
	if(isdefined(self.var_53f712e3))
	{
		function_d48752e(localclientnum, self.var_53f712e3);
		self.var_53f712e3 = undefined;
	}
}

/*
	Name: function_46afac0
	Namespace: fireteam_dirty_bomb
	Checksum: 0x8F1DAEB2
	Offset: 0x14E8
	Size: 0xDE
	Parameters: 7
	Flags: Private
*/
function private function_46afac0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		localplayer = getlocalplayers()[fieldname];
		if(self.team != localplayer.team)
		{
			self.var_1ae360e = self playloopsound("fly_uranium_carry_3p");
		}
	}
	else if(isdefined(self.var_1ae360e))
	{
		self stoploopsound(self.var_1ae360e);
		self.var_1ae360e = undefined;
	}
}

/*
	Name: function_f4f21a7f
	Namespace: fireteam_dirty_bomb
	Checksum: 0xAB7CD70C
	Offset: 0x15D0
	Size: 0x158
	Parameters: 1
	Flags: Private
*/
function private function_f4f21a7f(localclientnum)
{
	if(!isdefined(level.var_53b9c763))
	{
		return;
	}
	var_53b9c763 = [];
	foreach(entity in level.var_53b9c763)
	{
		if(isdefined(entity) && isdefined(entity.zonefx))
		{
			deletefx(localclientnum, entity.zonefx, 1);
			entity.zonefx = playfx(localclientnum, "wz/fx9_dirtybomb_radiation_zone_spawn", entity.origin + vectorscale((0, 0, 1), 80));
			var_53b9c763[entity.zonefx] = entity;
			continue;
		}
		deletefx(localclientnum, fxid, 1);
	}
	level.var_53b9c763 = var_53b9c763;
}

/*
	Name: function_ba474e49
	Namespace: fireteam_dirty_bomb
	Checksum: 0xF385240A
	Offset: 0x1730
	Size: 0x158
	Parameters: 1
	Flags: Private
*/
function private function_ba474e49(localclientnum)
{
	if(!isdefined(level.var_53b9c763))
	{
		return;
	}
	var_53b9c763 = [];
	foreach(entity in level.var_53b9c763)
	{
		if(isdefined(entity) && isdefined(entity.zonefx))
		{
			deletefx(localclientnum, entity.zonefx, 1);
			entity.zonefx = playfx(localclientnum, "wz/fx9_dirtybomb_radiation_zone", entity.origin + vectorscale((0, 0, 1), 80));
			var_53b9c763[entity.zonefx] = entity;
			continue;
		}
		deletefx(localclientnum, fxid, 1);
	}
	level.var_53b9c763 = var_53b9c763;
}

/*
	Name: function_f20fb48
	Namespace: fireteam_dirty_bomb
	Checksum: 0x37064F08
	Offset: 0x1890
	Size: 0xAA
	Parameters: 7
	Flags: None
*/
function function_f20fb48(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.var_d4b5da49))
	{
		self stoploopsound(self.var_d4b5da49);
		self.var_d4b5da49 = undefined;
	}
	if(bwastimejump)
	{
		self.var_d4b5da49 = self playloopsound(#"hash_13167d6761dcda8b", undefined, vectorscale((0, 0, 1), 50));
	}
}

