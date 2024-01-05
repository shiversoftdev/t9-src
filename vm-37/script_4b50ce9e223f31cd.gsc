#using scripts\killstreaks\killstreaks_shared.gsc;
#using script_67ce8e728d8f37ba;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace mp_tundra;

/*
	Name: function_7defddbd
	Namespace: mp_tundra
	Checksum: 0xA2DA586E
	Offset: 0x240
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_7defddbd()
{
	if(util::get_game_type() === #"vip")
	{
		setgametypesetting(#"hash_3a15393c2e90e121", 1);
	}
}

/*
	Name: codecallback_preinitialization
	Namespace: mp_tundra
	Checksum: 0xF046FDB1
	Offset: 0x298
	Size: 0x34
	Parameters: 1
	Flags: Event
*/
event codecallback_preinitialization(eventstruct)
{
	killstreaks::function_8c83a621("straferun", #"hash_32c02123dd00c261");
}

/*
	Name: main
	Namespace: mp_tundra
	Checksum: 0x8AEB4568
	Offset: 0x2D8
	Size: 0x23C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level.levelkothdisable = [];
	level.levelkothdisable[level.levelkothdisable.size] = spawn("trigger_radius", (-898, 2710, 180), 0, 50, 150);
	level.levelwardisable = [];
	level.levelwardisable[level.levelwardisable.size] = spawn("trigger_radius", (-898, 2710, 180), 0, 50, 150);
	str_gametype = util::get_game_type();
	if(!function_559de4b9(str_gametype))
	{
		hidemiscmodels("5v5_asset_boundary");
	}
	else
	{
		level.var_633063a5 = 1;
	}
	function_8993980();
	namespace_66d6aa44::function_3f3466c9();
	killstreaks::function_257a5f13("straferun", 60);
	killstreaks::function_257a5f13("helicopter_comlink", 75);
	callback::on_game_playing(&on_game_playing);
	callback::on_end_game(&on_end_game);
	load::main();
	compass::setupminimap("");
	setdvar(#"hash_7b06b8037c26b99b", 150);
	level flag::wait_till("first_player_spawned");
	level thread function_e33449fd();
}

/*
	Name: function_8993980
	Namespace: mp_tundra
	Checksum: 0x12C9FDAF
	Offset: 0x520
	Size: 0x108
	Parameters: 0
	Flags: None
*/
function function_8993980()
{
	str_gametype = util::get_game_type();
	if(str_gametype == "vip")
	{
		var_87e54151 = getentarray("script_vehicle", "classname");
		foreach(var_59cf64fa in var_87e54151)
		{
			if(!isdefined(var_59cf64fa.scriptvehicletype) || var_59cf64fa.scriptvehicletype == "player_tank")
			{
				var_59cf64fa delete();
			}
		}
	}
}

/*
	Name: on_game_playing
	Namespace: mp_tundra
	Checksum: 0x1F0ABFB5
	Offset: 0x630
	Size: 0x224
	Parameters: 0
	Flags: None
*/
function on_game_playing()
{
	str_gametype = util::get_game_type();
	if(function_559de4b9(str_gametype))
	{
		hidemiscmodels("turret_model");
		exploder::exploder("fxexp_tundra_6v6");
	}
	else
	{
		var_5b84b22c = getentarray("tundra_oob_clip", "targetname");
		foreach(var_ec7dad0 in var_5b84b22c)
		{
			if(isdefined(var_ec7dad0))
			{
				var_ec7dad0 delete();
			}
		}
		var_3359f998 = arraycombine(getentarray("5v5_asset_boundary", "targetname"), getentarray("5v5_asset_boundary", "script_noteworthy"), 0, 0);
		foreach(var_8da7cb3 in var_3359f998)
		{
			if(isdefined(var_8da7cb3))
			{
				var_8da7cb3 delete();
			}
		}
		exploder::exploder("exp_lgt_12v12");
	}
}

/*
	Name: function_559de4b9
	Namespace: mp_tundra
	Checksum: 0x9F51963A
	Offset: 0x860
	Size: 0x10E
	Parameters: 1
	Flags: None
*/
function function_559de4b9(str_gametype)
{
	a_tokens = strtok(str_gametype, "_");
	switch(a_tokens[0])
	{
		case "koth":
		case "prop":
		case "control":
		case "dm":
		case "sd":
		case "conf":
		case "dom":
		case "dropkick":
		case "tdm":
		{
			var_f710be30 = 1;
			break;
		}
		default:
		{
			var_f710be30 = 0;
			break;
		}
	}
	return var_f710be30;
}

/*
	Name: on_end_game
	Namespace: mp_tundra
	Checksum: 0x57EEA3E1
	Offset: 0x978
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function on_end_game()
{
	if(getdvarint(#"hash_5cfa659178399dc6", 0))
	{
		level scene::function_1e327c20(array("cin_mp_tundra_outro_cia", "cin_mp_tundra_outro_kgb"));
	}
}

/*
	Name: function_e33449fd
	Namespace: mp_tundra
	Checksum: 0xAEBF698
	Offset: 0x9E0
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_e33449fd()
{
	rope_bridge_trig = getent("rope_bridge_trig", "targetname");
	rope_bridge_trig callback::on_trigger(&function_95ec9598);
}

/*
	Name: function_95ec9598
	Namespace: mp_tundra
	Checksum: 0x407FA5DD
	Offset: 0xA38
	Size: 0x1F6
	Parameters: 1
	Flags: None
*/
function function_95ec9598(var_3a72e7b7)
{
	player = var_3a72e7b7.activator;
	if(isdefined(self) && isalive(player) && !is_true(self.activated) && player function_64fefea())
	{
		level endon(#"game_ended");
		scene = struct::get(#"hash_2467352290a052f7", "scriptbundlename");
		bridge = scene.scene_ents[#"prop 1"];
		self.activated = 1;
		level thread scene::play(#"hash_2467352290a052f7", "Shot 2");
		while(self function_86072b19())
		{
			waitframe(1);
		}
		bridge waittill(#"hash_3a86066a301e90fc", #"death");
		if(function_acf0ca42() && !function_86072b19())
		{
			level thread scene::stop(#"hash_2467352290a052f7");
		}
		else if(!function_acf0ca42())
		{
			level thread scene::play(#"hash_2467352290a052f7", "Shot 1");
		}
		self.activated = 0;
	}
}

/*
	Name: function_86072b19
	Namespace: mp_tundra
	Checksum: 0xF78C18D2
	Offset: 0xC38
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function function_86072b19()
{
	foreach(player in getplayers())
	{
		if(isalive(player) && isdefined(self) && player istouching(self) && player function_64fefea())
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_acf0ca42
	Namespace: mp_tundra
	Checksum: 0xF866FE8A
	Offset: 0xD20
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_acf0ca42()
{
	foreach(player in getplayers())
	{
		if(isalive(player) && isdefined(self) && player istouching(self))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_64fefea
	Namespace: mp_tundra
	Checksum: 0x39D82DAC
	Offset: 0xDF0
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_64fefea()
{
	if(self getvelocity() === (0, 0, 0))
	{
		return false;
	}
	return true;
}

