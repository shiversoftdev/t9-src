#using script_35ae72be7b4fec10;
#using script_72016c9e6b96ab18;
#using script_32399001bdb550da;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_70eba6e6;

/*
	Name: __init__system__
	Namespace: namespace_70eba6e6
	Checksum: 0xBD1C61FF
	Offset: 0x3C8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7f07ebed7e062c01", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_70eba6e6
	Checksum: 0x5BBCF88E
	Offset: 0x410
	Size: 0x38C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_connect(&function_af62abd5);
	/#
		function_5ac4dc99("", 0);
		function_cd140ee9("", &function_1f275908);
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		function_5ac4dc99("", 0);
		function_5ac4dc99("", -1);
		function_5ac4dc99("", -1);
		function_5ac4dc99("", -1);
		function_5ac4dc99("", "");
		function_5ac4dc99("", "");
		level.var_698302a = {#hash_3b8c60fd:"", #hash_a47d91bd:"", #hash_73c7789b:-1, #hash_8ef81ab9:-1, #hash_3f25d9dc:-1, #hash_6d4f5e7d:-1, #hash_dc2904c0:"", #hash_86c1b5e2:"", #hash_fec76b21:[3:3, 2:2, 1:1, 0:0], #hash_4751b3ae:[8:8, 7:7, 6:6, 5:5, 4:4, 3:3, 2:2, 1:1, 0:0], #hash_b24c705f:[3:4, 2:2, 1:1, 0:0]};
		function_5ac4dc99("", 0);
		function_cd140ee9("", &function_5db7f789);
		adddebugcommand("");
	#/
}

/*
	Name: function_1f275908
	Namespace: namespace_70eba6e6
	Checksum: 0x539108B5
	Offset: 0x7A8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_1f275908(params)
{
	/#
		level thread function_d9bd950c(params);
	#/
}

/*
	Name: function_d9bd950c
	Namespace: namespace_70eba6e6
	Checksum: 0x1C9FE0FF
	Offset: 0x7E0
	Size: 0x174
	Parameters: 1
	Flags: None
*/
function function_d9bd950c(params)
{
	/#
		level endon(#"game_ended");
		waitframe(1);
		player = getplayers()[0];
		/#
			assert(params.name == "");
		#/
		var_443e3ea5 = params.value;
		setdvar(#"hash_6e0caf373bd4af27", 0);
		if(function_ba0491ff())
		{
			return;
		}
		if(var_443e3ea5 == 1)
		{
			player function_f8bd1258();
		}
		else
		{
			if(var_443e3ea5 == 2)
			{
				player function_5a4cb86d(0, 1);
			}
			else
			{
				if(var_443e3ea5 == 3)
				{
					player function_5a4cb86d(1);
				}
				else if(var_443e3ea5 == 4)
				{
					player function_e6558603("");
				}
			}
		}
	#/
}

/*
	Name: function_ba0491ff
	Namespace: namespace_70eba6e6
	Checksum: 0xF24D0775
	Offset: 0x960
	Size: 0x2A
	Parameters: 0
	Flags: None
*/
function function_ba0491ff()
{
	/#
		return namespace_61e6d095::exists(#"hash_7f07ebed7e062c01");
	#/
}

/*
	Name: function_690435a2
	Namespace: namespace_70eba6e6
	Checksum: 0x15AC6FB7
	Offset: 0x998
	Size: 0xB6
	Parameters: 0
	Flags: Private
*/
function private function_690435a2()
{
	/#
		level.var_698302a.var_86c1b5e2 = "";
		level.var_698302a.var_dc2904c0 = "";
		level.var_698302a.var_6d4f5e7d = -1;
		level.var_698302a.var_3f25d9dc = -1;
		level.var_698302a.var_8ef81ab9 = -1;
		level.var_698302a.var_73c7789b = -1;
		level.var_698302a.var_a47d91bd = "";
		level.var_698302a.var_3b8c60fd = "";
	#/
}

/*
	Name: function_5db7f789
	Namespace: namespace_70eba6e6
	Checksum: 0x17BA76A0
	Offset: 0xA58
	Size: 0xE0
	Parameters: 1
	Flags: Private
*/
function private function_5db7f789(params)
{
	/#
		player = getplayers()[0];
		/#
			assert(params.name == "");
		#/
		if(params.value)
		{
			setdvar(#"hash_2832abd8d28063d5", 1);
			player thread function_64892fd7();
		}
		else
		{
			setdvar(#"hash_2832abd8d28063d5", 0);
			player notify(#"hash_2988c621f7fe6406");
		}
	#/
}

/*
	Name: function_64892fd7
	Namespace: namespace_70eba6e6
	Checksum: 0xA39CFD0E
	Offset: 0xB40
	Size: 0x620
	Parameters: 0
	Flags: Private
*/
function private function_64892fd7()
{
	/#
		player = self;
		player endoncallback(&function_9e5a1627, #"hash_2988c621f7fe6406");
		var_d29ad73d = 8;
		player.var_b9da7d3 = [];
		for(i = 0; i < var_d29ad73d; i++)
		{
			hudelem = newdebughudelem(player);
			hudelem.alignx = "";
			hudelem.aligny = "";
			hudelem.x = 400;
			hudelem.y = 60 + (i * 14);
			hudelem.foreground = 1;
			hudelem.fontscale = 1;
			hudelem settext("");
			hudelem.var_75b1e6b7 = "";
			hudelem.color = vectorscale((1, 1, 1), 0.75);
			player.var_b9da7d3[i] = hudelem;
		}
		player.var_b9da7d3[0] settext("");
		while(true)
		{
			wait(0.5);
			var_e462aa74 = "" + player savegame::get_player_data(#"hash_6077f719ce58d931", 0);
			var_812674f1 = player.var_b9da7d3[2];
			if(var_e462aa74 != var_812674f1.var_75b1e6b7)
			{
				var_812674f1.var_75b1e6b7 = var_e462aa74;
				var_812674f1 settext(("" + var_e462aa74) + "");
			}
			skintone = function_e86cb765(1);
			var_913a3f00 = "" + player savegame::get_player_data(#"hash_69e7b14384f0405b", 0);
			var_94bd8e48 = player.var_b9da7d3[3];
			if((skintone + var_913a3f00) != var_94bd8e48.var_75b1e6b7)
			{
				var_94bd8e48.var_75b1e6b7 = skintone + var_913a3f00;
				var_94bd8e48 settext(((("" + skintone) + "") + var_913a3f00) + "");
			}
			gender = function_33bf99f8(0);
			var_9ef6c180 = "" + player savegame::get_player_data(#"hash_57be239af33ccdc3", 0);
			var_46e7de58 = player.var_b9da7d3[4];
			if((gender + var_9ef6c180) != var_46e7de58.var_75b1e6b7)
			{
				var_46e7de58.var_75b1e6b7 = gender + var_9ef6c180;
				var_46e7de58 settext(((("" + gender) + "") + var_9ef6c180) + "");
			}
			var_41d928c1 = function_b6a02677();
			var_3a4e7e97 = "" + player savegame::get_player_data(#"hash_353e9f2516585cdc", 0);
			var_ffd421b = player.var_b9da7d3[5];
			if((var_41d928c1 + var_3a4e7e97) != var_ffd421b.var_75b1e6b7)
			{
				var_ffd421b.var_75b1e6b7 = var_41d928c1 + var_3a4e7e97;
				var_ffd421b settext(((("" + var_41d928c1) + "") + var_3a4e7e97) + "");
			}
			var_3f2d7dac = function_c005cf32();
			var_5a4c49ae = player savegame::get_player_data(#"hash_25264c7bd6d77125", "");
			var_9ed75cd6 = player.var_b9da7d3[6];
			if((var_3f2d7dac + var_5a4c49ae) != var_9ed75cd6.var_75b1e6b7)
			{
				var_9ed75cd6.var_75b1e6b7 = var_3f2d7dac + var_5a4c49ae;
				var_9ed75cd6 settext(((("" + var_3f2d7dac) + "") + var_5a4c49ae) + "");
			}
			var_2c7fd851 = function_a24493b0();
			var_8d21fbc2 = player savegame::get_player_data(#"hash_2526497bd6d76c0c", "");
			var_52f46486 = player.var_b9da7d3[7];
			if((var_2c7fd851 + var_8d21fbc2) != var_52f46486.var_75b1e6b7)
			{
				var_52f46486.var_75b1e6b7 = var_2c7fd851 + var_8d21fbc2;
				var_52f46486 settext(((("" + var_2c7fd851) + "") + var_8d21fbc2) + "");
			}
		}
	#/
}

/*
	Name: function_9e5a1627
	Namespace: namespace_70eba6e6
	Checksum: 0xB61B234D
	Offset: 0x1168
	Size: 0xB2
	Parameters: 0
	Flags: Private
*/
function private function_9e5a1627()
{
	/#
		player = self;
		if(isdefined(player.var_b9da7d3))
		{
			foreach(elem in player.var_b9da7d3)
			{
				elem destroy();
			}
			player.var_b9da7d3 = undefined;
		}
	#/
}

/*
	Name: function_310e0ec3
	Namespace: namespace_70eba6e6
	Checksum: 0x7D990704
	Offset: 0x1228
	Size: 0x22C
	Parameters: 1
	Flags: Private
*/
function private function_310e0ec3(var_5ecaff57)
{
	/#
		player = self;
		println(("" + var_5ecaff57) + "");
		println(("" + player function_9ef5c585()) + "");
		println(("" + player function_50bca807()) + "");
		println(("" + player function_d0ce814()) + "");
		println(("" + player function_e86cb765()) + "");
		println(("" + player function_33bf99f8()) + "");
		println(("" + player function_b6a02677()) + "");
		println(("" + player function_c005cf32()) + "");
		println(("" + player function_a24493b0()) + "");
		println(("" + var_5ecaff57) + "");
	#/
}

/*
	Name: function_af62abd5
	Namespace: namespace_70eba6e6
	Checksum: 0x77997E6A
	Offset: 0x1460
	Size: 0x8AC
	Parameters: 0
	Flags: Private
*/
function private function_af62abd5()
{
	player = self;
	if(!player function_d4a8b603())
	{
		player function_ba2aba1();
	}
	player profile_traits::function_56266435();
	/#
		var_27a3190b = getdvarint(#"hash_562b6e46f7c0d74", 0);
		if(var_27a3190b)
		{
			var_f5e40a02 = [9:"", 8:"", 7:"", 6:"", 5:"", 4:"", 3:"", 2:"", 1:"", 0:""];
			var_d2e296c = [9:"", 8:"", 7:"", 6:"", 5:"", 4:"", 3:"", 2:"", 1:"", 0:""];
			level.var_698302a.var_86c1b5e2 = "";
			level.var_698302a.var_dc2904c0 = "";
			var_91fbf14a = getscriptbundle("");
			var_d3a0f3dc = var_91fbf14a.var_bb7dcd09;
			placeofbirthchoice = int(var_d3a0f3dc[randomint(var_d3a0f3dc.size)].identifier);
			level.var_698302a.var_6d4f5e7d = placeofbirthchoice;
			var_748079da = level.var_698302a.var_b24c705f;
			genderchoice = var_748079da[randomint(var_748079da.size)];
			level.var_698302a.var_3f25d9dc = genderchoice;
			if(genderchoice == 1)
			{
				level.var_698302a.var_86c1b5e2 = var_d2e296c[randomint(var_d2e296c.size)];
			}
			else
			{
				level.var_698302a.var_86c1b5e2 = var_f5e40a02[randomint(var_f5e40a02.size)];
			}
			var_8fc144 = level.var_698302a.var_4751b3ae;
			skintonechoice = var_8fc144[randomint(var_8fc144.size)];
			level.var_698302a.var_8ef81ab9 = skintonechoice;
			var_55800dbc = level.var_698302a.var_fec76b21;
			militarybackgroundchoice = var_55800dbc[randomint(var_55800dbc.size)];
			level.var_698302a.var_73c7789b = militarybackgroundchoice;
			var_8145cfce = [];
			var_4b60cd28 = profile_traits::function_979631fd();
			foreach(var_7ada56b4 in var_4b60cd28)
			{
				var_8145cfce[var_8145cfce.size] = var_7ada56b4.ref_name;
			}
			var_8145cfce[var_8145cfce.size] = "";
			var_f7b0ce98 = randomint(var_8145cfce.size);
			var_dbbfc950 = var_8145cfce[var_f7b0ce98];
			level.var_698302a.var_a47d91bd = var_dbbfc950;
			arrayremoveindex(var_8145cfce, var_f7b0ce98);
			var_8145cfce[var_8145cfce.size] = "";
			var_ef4a31df = randomint(var_8145cfce.size);
			var_b22f761b = var_8145cfce[var_ef4a31df];
			level.var_698302a.var_3b8c60fd = var_b22f761b;
		}
		var_3f25d9dc = getdvarint(#"hash_40e128cba78bd107", -1);
		if(var_3f25d9dc != -1)
		{
			/#
				assert(array::contains(level.var_698302a.var_b24c705f, var_3f25d9dc));
			#/
			level.var_698302a.var_3f25d9dc = var_3f25d9dc;
			if(var_27a3190b)
			{
				if(var_3f25d9dc == 1)
				{
					level.var_698302a.var_86c1b5e2 = var_d2e296c[randomint(var_d2e296c.size)];
				}
				else
				{
					level.var_698302a.var_86c1b5e2 = var_f5e40a02[randomint(var_f5e40a02.size)];
				}
			}
		}
		var_8ef81ab9 = getdvarint(#"hash_4a2288c2d7004347", -1);
		if(var_8ef81ab9 != -1)
		{
			/#
				assert(array::contains(level.var_698302a.var_4751b3ae, var_8ef81ab9));
			#/
			level.var_698302a.var_8ef81ab9 = var_8ef81ab9;
		}
		var_73c7789b = getdvarint(#"hash_500850d9ea77cbbe", -1);
		if(var_73c7789b != -1)
		{
			/#
				assert(array::contains(level.var_698302a.var_fec76b21, var_73c7789b));
			#/
			level.var_698302a.var_73c7789b = var_73c7789b;
		}
		var_a47d91bd = getdvarstring(#"hash_6d7c31e00d2b9c5d", "");
		if(var_a47d91bd != "")
		{
			if(var_a47d91bd == "")
			{
				var_a47d91bd = "";
			}
			level.var_698302a.var_a47d91bd = var_a47d91bd;
		}
		var_3b8c60fd = getdvarstring(#"hash_9513d0258b2a742", "");
		if(var_3b8c60fd != "")
		{
			if(var_3b8c60fd == "")
			{
				var_3b8c60fd = "";
			}
			level.var_698302a.var_3b8c60fd = var_3b8c60fd;
		}
		player function_310e0ec3("");
	#/
	player thread function_7f5a55bb();
}

/*
	Name: function_7f5a55bb
	Namespace: namespace_70eba6e6
	Checksum: 0xA26CBCE6
	Offset: 0x1D18
	Size: 0x114
	Parameters: 0
	Flags: Private
*/
function private function_7f5a55bb()
{
	self notify("74ba0adde5a1f3df");
	self endon("74ba0adde5a1f3df");
	player = self;
	globallogic_ui::function_9ed5232e("playerProfileChoices." + "firstName", player function_9ef5c585());
	globallogic_ui::function_9ed5232e("playerProfileChoices." + "lastName", player function_50bca807());
	globallogic_ui::function_9ed5232e("playerProfileChoices." + "militaryBackground", player function_b6a02677());
	player function_a2fd5d34();
	waitframe(1);
	level flag::set(#"hash_60361de05624e591");
}

/*
	Name: function_a2fd5d34
	Namespace: namespace_70eba6e6
	Checksum: 0xE583E68F
	Offset: 0x1E38
	Size: 0x274
	Parameters: 0
	Flags: Private
*/
function private function_a2fd5d34()
{
	player = self;
	traits = profile_traits::function_979631fd();
	var_8651d525 = profile_traits::function_3937b542();
	var_75177bd7 = [1:player function_a24493b0(), 0:player function_c005cf32()];
	for(var_f368f4c7 = 0; var_f368f4c7 < var_75177bd7.size; var_f368f4c7++)
	{
		var_fb7d23d9 = var_8651d525;
		if(level flag::get("cp_profile_perks_activated"))
		{
			foreach(var_7ada56b4 in traits)
			{
				if(var_75177bd7[var_f368f4c7] == var_7ada56b4.ref_name)
				{
					var_fb7d23d9 = var_7ada56b4;
					break;
				}
			}
		}
		globallogic_ui::function_9ed5232e((("playerProfileChoices." + "traitsList.") + var_f368f4c7) + ".displayName", var_fb7d23d9.display_name);
		globallogic_ui::function_9ed5232e((("playerProfileChoices." + "traitsList.") + var_f368f4c7) + ".effect", var_fb7d23d9.var_50d366ef);
		globallogic_ui::function_9ed5232e((("playerProfileChoices." + "traitsList.") + var_f368f4c7) + ".displayIcon", var_fb7d23d9.var_55c1d6d9);
		globallogic_ui::function_9ed5232e((("playerProfileChoices." + "traitsList.") + var_f368f4c7) + ".displayIcon", var_fb7d23d9.var_af4176bc);
	}
}

/*
	Name: function_d4a8b603
	Namespace: namespace_70eba6e6
	Checksum: 0xF057A42B
	Offset: 0x20B8
	Size: 0x32
	Parameters: 0
	Flags: Private
*/
function private function_d4a8b603()
{
	player = self;
	return player savegame::get_player_data(#"hash_36948672f773e98c", 0);
}

/*
	Name: function_ba2aba1
	Namespace: namespace_70eba6e6
	Checksum: 0xAC3E1F65
	Offset: 0x20F8
	Size: 0x24C
	Parameters: 0
	Flags: Private
*/
function private function_ba2aba1()
{
	player = self;
	player savegame::set_player_data(#"hash_36948672f773e98c", 1);
	player savegame::set_player_data(#"hash_2895afd5f948f51", 0);
	player savegame::set_player_data(#"hash_3d3a5e4595ae72e3", "");
	player savegame::set_player_data(#"hash_3c708f964c0cdc7d", "");
	player savegame::set_player_data(#"hash_6077f719ce58d931", 0);
	player savegame::set_player_data(#"hash_57be239af33ccdc3", 0);
	player savegame::set_player_data(#"hash_69e7b14384f0405b", 0);
	player savegame::set_player_data(#"hash_353e9f2516585cdc", 0);
	player savegame::set_player_data(#"hash_25264c7bd6d77125", "");
	player savegame::set_player_data(#"hash_2526497bd6d76c0c", "");
	player stats::set_stat(#"hash_56496a50c42322a9", "");
	player stats::set_stat(#"hash_47f2aa02a53a0d57", "");
	player stats::set_stat(#"hash_37a113cbd02390eb", "");
	player stats::set_stat(#"hash_37a114cbd023929e", "");
	player stats::set_stat(#"hash_5a9ce7cd1e0428d8", 0);
	player profile_traits::function_56266435();
}

/*
	Name: function_cd5334d6
	Namespace: namespace_70eba6e6
	Checksum: 0x7A3148FC
	Offset: 0x2350
	Size: 0x28C
	Parameters: 2
	Flags: Private
*/
function private function_cd5334d6(var_8f977acb, profilesubject)
{
	if(!isdefined(profilesubject))
	{
		profilesubject = "player";
	}
	player = self;
	if(namespace_61e6d095::exists(#"hash_7f07ebed7e062c01"))
	{
		/#
			assertmsg("");
		#/
		return;
	}
	if(var_8f977acb == 0)
	{
		player function_ba2aba1();
		/#
			function_690435a2();
		#/
	}
	player val::set(#"playerprofile", "freezecontrols", 1);
	namespace_61e6d095::create(#"hash_7f07ebed7e062c01", #"hash_50b31cab180e98b9");
	namespace_61e6d095::function_28027c42(#"hash_7f07ebed7e062c01", #"hash_7f07ebed7e062c01");
	player function_c7410540(var_8f977acb, profilesubject);
	confirmresponse = undefined;
	confirmresponse = level waittill(#"personnel_profile_closed");
	if(is_true(confirmresponse.isconfirmed))
	{
		var_b91e212a = var_8f977acb == 0 || var_8f977acb == 2;
		if(var_b91e212a)
		{
			player function_e4376e3f();
			/#
				function_690435a2();
				player function_310e0ec3("");
			#/
			player thread function_7f5a55bb();
		}
	}
	namespace_61e6d095::remove(#"hash_7f07ebed7e062c01");
	namespace_61e6d095::function_4279fd02(#"hash_7f07ebed7e062c01");
	player val::reset_all(#"playerprofile");
}

/*
	Name: function_c7410540
	Namespace: namespace_70eba6e6
	Checksum: 0x7F6B7186
	Offset: 0x25E8
	Size: 0xD8C
	Parameters: 2
	Flags: Private
*/
function private function_c7410540(var_8f977acb, profilesubject)
{
	player = self;
	namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "isFormReadOnly", var_8f977acb == 1 || var_8f977acb == 3 || var_8f977acb == 4);
	namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "doWorldBlur", var_8f977acb != 0);
	namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "profileSubject", profilesubject);
	namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "allowUserCancel", var_8f977acb == 1 || var_8f977acb == 3);
	if(profilesubject == "player")
	{
		var_395259b3 = function_9ef5c585();
		var_eab7d1bb = function_50bca807();
		var_e3f597b4 = function_d0ce814();
		var_ce0a1f88 = function_33bf99f8(0);
		var_bafffbdb = function_e86cb765(1);
		var_11a94e50 = function_b6a02677();
		var_27c3f84b = function_c005cf32();
		var_2ec808b9 = function_a24493b0();
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "firstName", var_395259b3);
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "lastName", var_eab7d1bb);
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "alias", #"hash_38ced75fbdff9271");
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "occupation", #"hash_326ac1d12fe3e93a");
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "placeOfBirth", "");
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "gender", "");
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "skinTone", "");
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "militaryBackground", "");
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "militaryBackgroundDesc", "");
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "psychProfile1", #"");
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "psychProfile1Desc", #"");
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "psychProfile1Effect", #"");
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "psychProfile2", #"");
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "psychProfile2Desc", #"");
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "psychProfile2Effect", #"");
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "psychProfile1Icon", #"hash_43c3c6d2b05b79b5");
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "psychProfile2Icon", #"hash_43c3c6d2b05b79b5");
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "placeOfBirthChoice", var_e3f597b4);
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "genderChoice", var_ce0a1f88);
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "skinToneChoice", var_bafffbdb);
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "militaryBackgroundChoice", var_11a94e50);
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "psychProfile1Choice", var_27c3f84b);
		namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "psychProfile2Choice", var_2ec808b9);
		namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", 0, "Identifier", 0);
		namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", 0, "reference", "");
		namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", 0, "displayName", #"hash_14fd8d48e25f79ce");
		namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", 0, "description", #"hash_14fd8d48e25f79ce");
		namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", 0, "effect", #"hash_14fd8d48e25f79ce");
		namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", 0, "type", 1);
		namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", 0, "displayIcon", #"");
		namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", 0, "displayIconBorder", #"");
		traits = profile_traits::function_979631fd();
		for(i = 0; i < traits.size; i++)
		{
			listindex = i + 1;
			namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", listindex, "Identifier", i + 1);
			namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", listindex, "reference", traits[i].ref_name);
			namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", listindex, "displayName", traits[i].display_name);
			namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", listindex, "description", traits[i].var_e473fa1e);
			namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", listindex, "effect", traits[i].var_50d366ef);
			namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", listindex, "type", 0);
			namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", listindex, "displayIcon", traits[i].var_55c1d6d9);
			namespace_61e6d095::function_f2a9266(#"hash_7f07ebed7e062c01", listindex, "displayIconBorder", traits[i].var_af4176bc);
		}
	}
	else
	{
		var_1659d59a = 0;
		var_1856af9d = getscriptbundle(#"hash_7dc9096275da99d4");
		foreach(var_fdf21313 in var_1856af9d.var_a00897d)
		{
			if(var_fdf21313.ref_name == profilesubject)
			{
				var_1659d59a = 1;
				namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "firstName", var_fdf21313.var_34d094eb);
				namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "lastName", var_fdf21313.var_705af76d);
				namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "alias", var_fdf21313.alias);
				namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "placeOfBirth", var_fdf21313.var_d4beb13);
				namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "occupation", var_fdf21313.occupation);
				namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "gender", var_fdf21313.gender);
				namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "skinTone", var_fdf21313.var_ff3aefaf);
				namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "militaryBackground", var_fdf21313.var_bc8da67d);
				namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "militaryBackgroundDesc", var_fdf21313.var_bf761850);
				namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "psychProfile1", var_fdf21313.var_755218ae);
				namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "psychProfile1Desc", var_fdf21313.var_e47799ef);
				namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "psychProfile2", var_fdf21313.var_a06feee9);
				namespace_61e6d095::function_9ade1d9b(#"hash_7f07ebed7e062c01", "psychProfile2Desc", var_fdf21313.var_9c7eba22);
				break;
			}
		}
		/#
			assert(var_1659d59a, ("" + profilesubject) + "");
		#/
	}
}

/*
	Name: function_e4376e3f
	Namespace: namespace_70eba6e6
	Checksum: 0xDD800A39
	Offset: 0x3380
	Size: 0x3FC
	Parameters: 0
	Flags: Private
*/
function private function_e4376e3f()
{
	player = self;
	var_b5987294 = namespace_61e6d095::function_82e355ff(#"hash_7f07ebed7e062c01", "firstName");
	var_6b5bdb53 = namespace_61e6d095::function_82e355ff(#"hash_7f07ebed7e062c01", "lastName");
	placeofbirthchoice = int(namespace_61e6d095::function_82e355ff(#"hash_7f07ebed7e062c01", "placeOfBirthChoice"));
	genderchoice = int(namespace_61e6d095::function_82e355ff(#"hash_7f07ebed7e062c01", "genderChoice"));
	skintonechoice = int(namespace_61e6d095::function_82e355ff(#"hash_7f07ebed7e062c01", "skinToneChoice"));
	militarybackgroundchoice = int(namespace_61e6d095::function_82e355ff(#"hash_7f07ebed7e062c01", "militaryBackgroundChoice"));
	var_dbbfc950 = namespace_61e6d095::function_82e355ff(#"hash_7f07ebed7e062c01", "psychProfile1Choice");
	var_b22f761b = namespace_61e6d095::function_82e355ff(#"hash_7f07ebed7e062c01", "psychProfile2Choice");
	player savegame::set_player_data(#"hash_36948672f773e98c", 1);
	player savegame::set_player_data(#"hash_2895afd5f948f51", 1);
	player savegame::set_player_data(#"hash_3d3a5e4595ae72e3", var_b5987294);
	player savegame::set_player_data(#"hash_3c708f964c0cdc7d", var_6b5bdb53);
	player savegame::set_player_data(#"hash_6077f719ce58d931", placeofbirthchoice);
	player savegame::set_player_data(#"hash_57be239af33ccdc3", genderchoice);
	player savegame::set_player_data(#"hash_69e7b14384f0405b", skintonechoice);
	player savegame::set_player_data(#"hash_353e9f2516585cdc", militarybackgroundchoice);
	player savegame::set_player_data(#"hash_25264c7bd6d77125", var_dbbfc950);
	player savegame::set_player_data(#"hash_2526497bd6d76c0c", var_b22f761b);
	player stats::set_stat(#"hash_56496a50c42322a9", var_b5987294);
	player stats::set_stat(#"hash_47f2aa02a53a0d57", var_6b5bdb53);
	player stats::set_stat(#"hash_37a113cbd02390eb", var_dbbfc950);
	player stats::set_stat(#"hash_37a114cbd023929e", var_b22f761b);
	player stats::set_stat(#"hash_5a9ce7cd1e0428d8", militarybackgroundchoice);
	player function_516d14be();
}

/*
	Name: function_9ef5c585
	Namespace: namespace_70eba6e6
	Checksum: 0xE9037ADB
	Offset: 0x3788
	Size: 0x9A
	Parameters: 0
	Flags: Private
*/
function private function_9ef5c585()
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	/#
		if(level.var_698302a.var_86c1b5e2 != "")
		{
			return level.var_698302a.var_86c1b5e2;
		}
	#/
	return player savegame::get_player_data(#"hash_3d3a5e4595ae72e3", "");
}

/*
	Name: function_50bca807
	Namespace: namespace_70eba6e6
	Checksum: 0x264D8CB8
	Offset: 0x3830
	Size: 0x9A
	Parameters: 0
	Flags: Private
*/
function private function_50bca807()
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	/#
		if(level.var_698302a.var_dc2904c0 != "")
		{
			return level.var_698302a.var_dc2904c0;
		}
	#/
	return player savegame::get_player_data(#"hash_3c708f964c0cdc7d", "");
}

/*
	Name: function_d0ce814
	Namespace: namespace_70eba6e6
	Checksum: 0x6B22B57
	Offset: 0x38D8
	Size: 0xA2
	Parameters: 0
	Flags: Private
*/
function private function_d0ce814()
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	/#
		if(level.var_698302a.var_6d4f5e7d != -1)
		{
			return level.var_698302a.var_6d4f5e7d;
		}
	#/
	return int(player savegame::get_player_data(#"hash_6077f719ce58d931", 0));
}

/*
	Name: function_c005cf32
	Namespace: namespace_70eba6e6
	Checksum: 0xA4E404A6
	Offset: 0x3988
	Size: 0x9A
	Parameters: 0
	Flags: Private
*/
function private function_c005cf32()
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	/#
		if(level.var_698302a.var_a47d91bd != "")
		{
			return level.var_698302a.var_a47d91bd;
		}
	#/
	return savegame::get_player_data(#"hash_25264c7bd6d77125", "");
}

/*
	Name: function_a24493b0
	Namespace: namespace_70eba6e6
	Checksum: 0xE64031DF
	Offset: 0x3A30
	Size: 0x9A
	Parameters: 0
	Flags: Private
*/
function private function_a24493b0()
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	/#
		if(level.var_698302a.var_3b8c60fd != "")
		{
			return level.var_698302a.var_3b8c60fd;
		}
	#/
	return savegame::get_player_data(#"hash_2526497bd6d76c0c", "");
}

/*
	Name: function_f8bd1258
	Namespace: namespace_70eba6e6
	Checksum: 0x42870567
	Offset: 0x3AD8
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_f8bd1258()
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	player function_cd5334d6(0);
}

/*
	Name: function_5a4cb86d
	Namespace: namespace_70eba6e6
	Checksum: 0x7198B2E7
	Offset: 0x3B38
	Size: 0xD4
	Parameters: 2
	Flags: None
*/
function function_5a4cb86d(editable, allowusercancel)
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	if(is_true(editable))
	{
		player function_cd5334d6(2);
	}
	else
	{
		if(is_true(allowusercancel))
		{
			player function_cd5334d6(1);
		}
		else
		{
			player function_cd5334d6(4);
		}
	}
}

/*
	Name: function_e6558603
	Namespace: namespace_70eba6e6
	Checksum: 0x4433EFE3
	Offset: 0x3C18
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_e6558603(profilesubject)
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	player function_cd5334d6(3, profilesubject);
}

/*
	Name: function_516d14be
	Namespace: namespace_70eba6e6
	Checksum: 0xF65FE93B
	Offset: 0x3C80
	Size: 0x16C
	Parameters: 0
	Flags: None
*/
function function_516d14be()
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	player profile_traits::function_56266435();
	var_dbbfc950 = player function_c005cf32();
	if(var_dbbfc950 != "" && var_dbbfc950 != "classified")
	{
		var_6976a186 = profile_traits::function_d9b59414(var_dbbfc950);
		player profile_traits::function_18198dfb(var_6976a186);
	}
	var_b22f761b = player function_a24493b0();
	if(var_b22f761b != "" && var_b22f761b != "classified")
	{
		var_6976a186 = profile_traits::function_d9b59414(var_b22f761b);
		player profile_traits::function_18198dfb(var_6976a186);
	}
	level flag::set("cp_profile_perks_activated");
	player function_a2fd5d34();
}

/*
	Name: function_33bf99f8
	Namespace: namespace_70eba6e6
	Checksum: 0xB0537DCC
	Offset: 0x3DF8
	Size: 0x178
	Parameters: 1
	Flags: None
*/
function function_33bf99f8(var_cd6e620)
{
	if(!isdefined(var_cd6e620))
	{
		var_cd6e620 = 0;
	}
	/#
		assert(isplayer(self));
	#/
	player = self;
	var_ce0a1f88 = int(player savegame::get_player_data(#"hash_57be239af33ccdc3", 0));
	/#
		if(level.var_698302a.var_3f25d9dc != -1)
		{
			var_ce0a1f88 = level.var_698302a.var_3f25d9dc;
		}
		var_2c1ecd1d = level.var_698302a.var_b24c705f;
		if(!array::contains(var_2c1ecd1d, var_ce0a1f88))
		{
			/#
				assertmsg("" + var_ce0a1f88);
			#/
		}
	#/
	if(var_cd6e620 == 2)
	{
		if(var_ce0a1f88 == 0 || var_ce0a1f88 == 4)
		{
			var_ce0a1f88 = 1;
		}
	}
	else if(var_cd6e620 == 1)
	{
		if(var_ce0a1f88 == 4)
		{
			var_ce0a1f88 = 0;
		}
	}
	return var_ce0a1f88;
}

/*
	Name: function_e86cb765
	Namespace: namespace_70eba6e6
	Checksum: 0xC77E56FF
	Offset: 0x3F78
	Size: 0x150
	Parameters: 1
	Flags: None
*/
function function_e86cb765(var_5ab66aa)
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	var_20ba2c34 = 0;
	var_bafffbdb = int(player savegame::get_player_data(#"hash_69e7b14384f0405b", var_20ba2c34));
	/#
		if(level.var_698302a.var_8ef81ab9 != -1)
		{
			var_bafffbdb = level.var_698302a.var_8ef81ab9;
		}
		var_2c1ecd1d = level.var_698302a.var_4751b3ae;
		if(!array::contains(var_2c1ecd1d, var_bafffbdb))
		{
			/#
				assertmsg("" + var_bafffbdb);
			#/
		}
	#/
	if(!is_true(var_5ab66aa) && var_bafffbdb == var_20ba2c34)
	{
		var_bafffbdb = 1;
	}
	return var_bafffbdb;
}

/*
	Name: function_b6a02677
	Namespace: namespace_70eba6e6
	Checksum: 0xDB839584
	Offset: 0x40D0
	Size: 0x108
	Parameters: 0
	Flags: None
*/
function function_b6a02677()
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	var_8e656c74 = int(player savegame::get_player_data(#"hash_353e9f2516585cdc", 0));
	/#
		if(level.var_698302a.var_73c7789b != -1)
		{
			var_8e656c74 = level.var_698302a.var_73c7789b;
		}
		var_2c1ecd1d = level.var_698302a.var_fec76b21;
		if(!array::contains(var_2c1ecd1d, var_8e656c74))
		{
			/#
				assertmsg("" + var_8e656c74);
			#/
		}
	#/
	return var_8e656c74;
}

