#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_cd4d78f1;

/*
	Name: function_2774d13
	Namespace: namespace_cd4d78f1
	Checksum: 0xF604FE1B
	Offset: 0x1B0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2774d13()
{
	level notify(2063520770);
}

#namespace squad_spawn;

/*
	Name: function_89f2df9
	Namespace: squad_spawn
	Checksum: 0x5FD12434
	Offset: 0x1D0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"squad_spawning", &init, undefined, undefined, undefined);
}

/*
	Name: init
	Namespace: squad_spawn
	Checksum: 0x522A695F
	Offset: 0x218
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.var_d0252074 = (isdefined(getgametypesetting(#"hash_2b1f40bc711c41f3")) ? getgametypesetting(#"hash_2b1f40bc711c41f3") : 0) && !util::function_3f165ee8();
	if(!level.var_d0252074)
	{
		return;
	}
	setupclientfields();
	level callback::on_end_game(&function_31a1aa18);
}

/*
	Name: setupclientfields
	Namespace: squad_spawn
	Checksum: 0xBFFDA7C0
	Offset: 0x2D8
	Size: 0x204
	Parameters: 0
	Flags: Linked
*/
function setupclientfields()
{
	clientfield::function_a8bbc967("hudItems.squadSpawnOnStatus", #"hud_items", #"hash_7105404fe72ff3f", 1, 3, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.squadSpawnActive", #"hud_items", #"squadspawnactive", 1, 1, "int", &function_cc03b772, 0, 0);
	clientfield::function_a8bbc967("hudItems.squadSpawnRespawnStatus", #"hud_items", #"hash_6b8b915fbdeaa722", 1, 2, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.squadSpawnViewType", #"hud_items", #"hash_2d210ef59c073abd", 1, 1, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.squadAutoSpawnPromptActive", #"hud_items", #"hash_4b3a0953a67ca151", 1, 1, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.squadSpawnSquadWipe", #"hud_items", #"hash_241b5d6ff260de2d", 1, 1, "int", &function_a58f32b0, 0, 0);
}

/*
	Name: function_21b773d5
	Namespace: squad_spawn
	Checksum: 0x2E19F0D5
	Offset: 0x4E8
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function function_21b773d5(localclientnum)
{
	if(!is_true(level.var_d0252074))
	{
		return 0;
	}
	player = function_27673a7(localclientnum);
	if(!isdefined(player))
	{
		return 0;
	}
	return player clientfield::get_player_uimodel("hudItems.squadSpawnActive") == 1;
}

/*
	Name: function_cc03b772
	Namespace: squad_spawn
	Checksum: 0xD8F0B29
	Offset: 0x560
	Size: 0x1C8
	Parameters: 7
	Flags: Linked
*/
function function_cc03b772(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level thread function_58710bd2(fieldname);
		level thread function_cbcbd56d(fieldname);
		setsoundcontext("spawn_select_screen", "true");
		function_5ea2c6e3("uin_overhead_map", 0.1, 1);
		soundloopemitter(#"hash_5ef60d86d79dc9a1", (0, 0, 0));
		if(isdefined(level.squadspawnactive))
		{
			[[level.squadspawnactive]](fieldname);
		}
	}
	else
	{
		level thread function_c97b609d(fieldname);
		level thread function_48811bf4(fieldname);
		setsoundcontext("spawn_select_screen", "");
		function_ed62c9c2("uin_overhead_map", 2);
		soundstoploopemitter(#"hash_5ef60d86d79dc9a1", (0, 0, 0));
		if(isdefined(level.var_6ed4a19b))
		{
			[[level.var_6ed4a19b]](fieldname);
		}
	}
}

/*
	Name: function_cbcbd56d
	Namespace: squad_spawn
	Checksum: 0x3C538315
	Offset: 0x730
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_cbcbd56d(localclientnum)
{
	if(game.state != #"playing")
	{
		return;
	}
	if(!is_true(level.var_acf54eb7))
	{
		soundsetmusicstate("squad_spawn");
	}
}

/*
	Name: function_48811bf4
	Namespace: squad_spawn
	Checksum: 0x7AC2F951
	Offset: 0x798
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_48811bf4(localclientnum)
{
	if(game.state != #"playing")
	{
		return;
	}
	if(!is_true(level.var_acf54eb7))
	{
		soundsetmusicstate("squad_spawn_exit");
	}
}

/*
	Name: function_a58f32b0
	Namespace: squad_spawn
	Checksum: 0x78B25CA5
	Offset: 0x800
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function function_a58f32b0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		playsound(fieldname, #"hash_5d2e54389286b7f8");
	}
}

/*
	Name: function_429c452
	Namespace: squad_spawn
	Checksum: 0xA4C97583
	Offset: 0x870
	Size: 0xEE
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
	if(self hasperk(localclientnum, #"specialty_immunenvthermal"))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_31a1aa18
	Namespace: squad_spawn
	Checksum: 0x6192EA2D
	Offset: 0x968
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_31a1aa18(localclientnum)
{
	setsoundcontext("spawn_select_screen", "");
	function_ed62c9c2("uin_overhead_map", 0.5);
	soundstoploopemitter(#"hash_5ef60d86d79dc9a1", (0, 0, 0));
	function_c97b609d(localclientnum);
}

/*
	Name: function_ac750979
	Namespace: squad_spawn
	Checksum: 0xA953A105
	Offset: 0xA00
	Size: 0xB2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ac750979(localclientnum, array)
{
	if(isarray(array))
	{
		for(index = 0; index < array.size; index++)
		{
			var_35c5cfb6 = array[index];
			if(!isdefined(var_35c5cfb6))
			{
				continue;
			}
			var_35c5cfb6 renderoverridebundle::function_f4eab437(localclientnum, 1, #"hash_c37f4f4d19191cb", undefined);
			if(((index + 1) % 3) == 0)
			{
				waitframe(1);
			}
		}
	}
}

/*
	Name: function_bebd8395
	Namespace: squad_spawn
	Checksum: 0x6B2B998C
	Offset: 0xAC0
	Size: 0x94
	Parameters: 2
	Flags: Linked, Private
*/
function private function_bebd8395(localclientnum, array)
{
	if(isarray(array))
	{
		for(index = 0; index < array.size; index++)
		{
			var_35c5cfb6 = array[index];
			if(!isdefined(var_35c5cfb6))
			{
				continue;
			}
			var_35c5cfb6 renderoverridebundle::function_f4eab437(localclientnum, 0, #"hash_c37f4f4d19191cb", undefined);
		}
	}
}

/*
	Name: function_58710bd2
	Namespace: squad_spawn
	Checksum: 0x740F37C9
	Offset: 0xB60
	Size: 0x2F6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_58710bd2(localclientnum)
{
	self endon(#"game_ended", #"disconnect", #"hash_6843c6f6d0e53fd");
	while(true)
	{
		players = getplayers(localclientnum);
		for(index = 0; index < players.size; index++)
		{
			player = players[index];
			if(!isdefined(player))
			{
				continue;
			}
			player renderoverridebundle::function_f4eab437(localclientnum, 1, #"hash_c37f4f4d19191cb", &function_429c452);
			corpse = player getplayercorpse();
			if(!isdefined(corpse) || corpse == player)
			{
				continue;
			}
			corpse renderoverridebundle::function_f4eab437(localclientnum, 0, #"hash_c37f4f4d19191cb", &function_429c452);
			if(((index + 1) % 3) == 0)
			{
				waitframe(1);
			}
		}
		if(isarray(level.allvehicles))
		{
			for(index = 0; index < level.allvehicles.size; index++)
			{
				vehicle = level.allvehicles[index];
				if(!isdefined(vehicle))
				{
					continue;
				}
				occupants = vehicle getvehoccupants(localclientnum);
				var_c5dfdae0 = occupants.size > 0 || is_false(vehicle.var_46439e18);
				vehicle renderoverridebundle::function_f4eab437(localclientnum, var_c5dfdae0, #"hash_c37f4f4d19191cb", &function_429c452);
				if(((index + 1) % 3) == 0)
				{
					waitframe(1);
				}
			}
		}
		function_ac750979(localclientnum, level.uavs);
		function_ac750979(localclientnum, level.counteruavs);
		function_ac750979(localclientnum, level.var_a25fd5e1);
		waitframe(1);
	}
}

/*
	Name: function_c97b609d
	Namespace: squad_spawn
	Checksum: 0x50AF5DD6
	Offset: 0xE60
	Size: 0x244
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c97b609d(localclientnum)
{
	level notify(#"hash_6843c6f6d0e53fd");
	players = getplayers(localclientnum);
	foreach(player in players)
	{
		if(!isdefined(player))
		{
			continue;
		}
		player renderoverridebundle::function_f4eab437(localclientnum, 0, #"hash_c37f4f4d19191cb", undefined);
		corpse = player getplayercorpse();
		if(!isdefined(corpse) || corpse == player)
		{
			continue;
		}
		corpse renderoverridebundle::function_f4eab437(localclientnum, 0, #"hash_c37f4f4d19191cb", undefined);
	}
	if(isarray(level.allvehicles))
	{
		for(index = 0; index < level.allvehicles.size; index++)
		{
			vehicle = level.allvehicles[index];
			if(!isdefined(vehicle))
			{
				continue;
			}
			vehicle renderoverridebundle::function_f4eab437(localclientnum, 0, #"hash_c37f4f4d19191cb", undefined);
		}
	}
	function_bebd8395(localclientnum, level.uavs);
	function_bebd8395(localclientnum, level.counteruavs);
	function_bebd8395(localclientnum, level.var_a25fd5e1);
}

