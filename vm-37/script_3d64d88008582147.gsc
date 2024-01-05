#using script_ab862743b3070a;
#using script_340a2e805e35f7a2;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_34ab99a4ca1a43d;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace namespace_f0a1fe5c;

/*
	Name: __init__system__
	Namespace: namespace_f0a1fe5c
	Checksum: 0x9778EAF5
	Offset: 0x210
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_520d565ef38560b8", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_f0a1fe5c
	Checksum: 0x53455528
	Offset: 0x258
	Size: 0x2AC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(is_true(getgametypesetting(#"hash_7e8e34cc69a77e0b")) || getdvarint(#"hash_40bd34b35079cf2e", 0) > 0)
	{
		zombie_utility::set_zombie_var(#"hash_176c7387fb0b8e84", 0, 0, 1);
		zombie_utility::set_zombie_var(#"zombie_powerup_naughty_or_nice_on", 0, 0, 1);
		zombie_utility::set_zombie_var(#"zombie_powerup_naughty_or_nice_time", 30, 0, 1);
		zm_powerups::register_powerup("naughty_or_nice", &function_a19d471a);
		if(zm_powerups::function_cc33adc8())
		{
			clientfield::register("scriptmover", "powerup_pickup_sequence", 1, 4, "int");
			zm_powerups::add_zombie_powerup("naughty_or_nice", #"hash_218ac2126792ad24", #"hash_c63a666160e5343", &zm_powerups::func_should_always_drop, 0, 0, 0, undefined, "powerup_naughty_or_nice", "zombie_powerup_naughty_or_nice_time", "zombie_powerup_naughty_or_nice_on");
			zm_vo::function_2cf4b07f(#"hash_488f781c3365038d", #"hash_1d3bccd799efe9e7");
			zm_vo::function_2cf4b07f(#"hash_1f61ea56f88705b0", #"hash_1d3bcbd799efe834");
			zm_vo::function_2cf4b07f(#"naughty_or_nice", #"hash_1d3bced799efed4d");
			zm_vo::function_2cf4b07f(#"hash_5832fe620991fcd1", #"hash_1d3bcdd799efeb9a");
			/#
				adddebugcommand("");
			#/
			/#
				adddebugcommand("");
			#/
		}
	}
}

/*
	Name: function_a19d471a
	Namespace: namespace_f0a1fe5c
	Checksum: 0x7AC1B95C
	Offset: 0x510
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_a19d471a(player)
{
	if(!isplayer(player))
	{
		return;
	}
	level thread function_feb491ef(player, self.origin, self.hint);
}

/*
	Name: function_feb491ef
	Namespace: namespace_f0a1fe5c
	Checksum: 0x7F3B93D1
	Offset: 0x570
	Size: 0x3EC
	Parameters: 3
	Flags: Linked
*/
function function_feb491ef(player, origin, hint)
{
	var_203c496d = randomint(100);
	pickup_time = gettime();
	var_55bc7ca1 = 1;
	temp_ent = util::spawn_model("tag_origin", origin);
	temp_ent clientfield::set("powerup_pickup_sequence", 1);
	temp_ent playloopsound("zmb_powerup_stocking_cycle");
	while(pickup_time > gettime() - 3000)
	{
		if(var_55bc7ca1 === 1)
		{
			temp_ent clientfield::set("powerup_pickup_sequence", 1);
			var_55bc7ca1 = 0;
		}
		else
		{
			temp_ent clientfield::set("powerup_pickup_sequence", 2);
			var_55bc7ca1 = 1;
		}
		wait(0.3);
	}
	temp_ent stoploopsound(0.2);
	temp_ent clientfield::set("powerup_pickup_sequence", 0);
	if(var_203c496d >= 65)
	{
		team = player.team;
		level thread zm_powerups::show_on_hud(team, "naughty_or_nice");
	}
	players = getplayers();
	foreach(e_player in players)
	{
		if(isdefined(e_player) && isplayer(e_player) && isdefined(hint))
		{
			if(var_203c496d < 65)
			{
				temp_ent playsound("zmb_powerup_stocking_nice");
				temp_ent clientfield::set("powerup_pickup_sequence", 3);
				e_player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", #"hash_2555e03c457dc083");
				continue;
			}
			temp_ent playsound("zmb_powerup_stocking_naughty");
			temp_ent clientfield::set("powerup_pickup_sequence", 4);
			e_player thread zm_powerups::function_5091b029("naughty_or_nice");
			e_player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", #"hash_2555e13c457dc236");
		}
	}
	if(var_203c496d < 65)
	{
		player function_c15a5f44(temp_ent);
	}
	else
	{
		if(level.var_4be193f5 === 1)
		{
			level.var_d51e0708 = gettime();
		}
		else
		{
			level thread function_5928d77d();
		}
	}
	wait(2);
	temp_ent delete();
}

/*
	Name: function_c15a5f44
	Namespace: namespace_f0a1fe5c
	Checksum: 0xEEDCE874
	Offset: 0x968
	Size: 0xAC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c15a5f44(var_d13d4980)
{
	self notify("3df22d237ca0a586");
	self endon("3df22d237ca0a586");
	level endon(#"end_game");
	self function_b1c6ca30(var_d13d4980);
	if(math::cointoss())
	{
		level thread zm_vo::function_8abe0568(#"hash_488f781c3365038d");
	}
	else
	{
		level thread zm_vo::function_8abe0568(#"hash_5832fe620991fcd1");
	}
}

/*
	Name: function_5928d77d
	Namespace: namespace_f0a1fe5c
	Checksum: 0x569E877B
	Offset: 0xA20
	Size: 0x208
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5928d77d()
{
	self notify("33e482bf3e7c3ca1");
	self endon("33e482bf3e7c3ca1");
	level endon(#"end_game");
	level.var_4be193f5 = 1;
	level thread zm_vo::function_8abe0568(#"hash_1f61ea56f88705b0");
	level.var_d51e0708 = gettime();
	dog_array = [];
	if(!isdefined(level.var_a5ab9bfb))
	{
		level.var_a5ab9bfb = [];
	}
	players = getplayers();
	var_ef5ad4eb = players.size + 1;
	while(level.var_d51e0708 > gettime() - 30000)
	{
		if(zm_utility::function_c200446c())
		{
			function_1eaaceab(level.var_a5ab9bfb);
			if(level.var_a5ab9bfb.size < var_ef5ad4eb)
			{
				level callback::callback(#"hash_4ad847c8f6c6405f");
			}
		}
		else
		{
			function_1eaaceab(dog_array);
			if(dog_array.size < var_ef5ad4eb)
			{
				ai = zombie_dog_util::function_62db7b1c();
				if(!isdefined(dog_array))
				{
					dog_array = [];
				}
				else if(!isarray(dog_array))
				{
					dog_array = array(dog_array);
				}
				if(!isinarray(dog_array, ai))
				{
					dog_array[dog_array.size] = ai;
				}
			}
		}
		wait(2);
	}
	level.var_4be193f5 = 0;
}

/*
	Name: function_b1c6ca30
	Namespace: namespace_f0a1fe5c
	Checksum: 0x17721EBD
	Offset: 0xC30
	Size: 0x234
	Parameters: 1
	Flags: Linked
*/
function function_b1c6ca30(var_d13d4980)
{
	var_7580ce3e = spawnstruct();
	var_7580ce3e.angles = var_d13d4980.angles;
	var_7580ce3e.scriptmodel = self;
	var_a7bd1c53 = getclosestpointonnavmesh(var_d13d4980.origin, 32, 8);
	if(isdefined(var_a7bd1c53))
	{
		var_7580ce3e.origin = var_a7bd1c53;
	}
	else
	{
		var_7580ce3e.origin = var_d13d4980.origin - vectorscale((0, 0, 1), 42);
	}
	scriptmodel = var_7580ce3e.scriptmodel;
	reward_origin = var_7580ce3e.origin;
	n_count = 1;
	players = getplayers();
	switch(players.size)
	{
		case 2:
		{
			n_count = 2;
			break;
		}
		case 3:
		case 4:
		{
			n_count = 3;
			break;
		}
	}
	dropstruct = {#hash_738dfc81:n_count, #angles:scriptmodel.angles, #origin:reward_origin};
	a_items = dropstruct namespace_65181344::function_fd87c780(#"hash_6fc406cb725710ed", n_count, 2);
	if(a_items.size > 1)
	{
		var_b7d0c0a8 = randomint(a_items.size);
	}
	else
	{
		var_b7d0c0a8 = 0;
	}
	a_items[var_b7d0c0a8].var_7b02ac6a = 1;
	var_7580ce3e struct::delete();
}

