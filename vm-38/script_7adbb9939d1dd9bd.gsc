#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_8eb9bc0a;

/*
	Name: function_c57ce41d
	Namespace: namespace_8eb9bc0a
	Checksum: 0x40DAF852
	Offset: 0x218
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c57ce41d()
{
	level notify(-1451106814);
}

/*
	Name: __init__system__
	Namespace: namespace_8eb9bc0a
	Checksum: 0xF5EB05E5
	Offset: 0x238
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_6d3c5317001d4fc6", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_8eb9bc0a
	Checksum: 0x6CFCD2D4
	Offset: 0x280
	Size: 0x104
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	setdvar(#"hash_6d3c5317001d4fc6", 0);
	/#
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
	#/
	var_852d7a5c = isprofilebuild();
	/#
		var_852d7a5c = 1;
	#/
	if(var_852d7a5c)
	{
		level thread function_97346595();
		level thread devguithink();
	}
}

/*
	Name: zombie_open_sesame
	Namespace: namespace_8eb9bc0a
	Checksum: 0xDA06C17C
	Offset: 0x390
	Size: 0x394
	Parameters: 0
	Flags: Linked
*/
function zombie_open_sesame()
{
	setdvar(#"zombie_unlock_all", 1);
	level flag::set("power_on");
	level clientfield::set("zombie_power_on", 1);
	power_trigs = getentarray("use_elec_switch", "targetname");
	foreach(trig in power_trigs)
	{
		if(isdefined(trig.script_int))
		{
			level flag::set("power_on" + trig.script_int);
			level clientfield::set("zombie_power_on", trig.script_int + 1);
		}
	}
	players = getplayers();
	zombie_doors = getentarray("zombie_door", "targetname");
	for(i = 0; i < zombie_doors.size; i++)
	{
		if(!is_true(zombie_doors[i].has_been_opened))
		{
			zombie_doors[i] notify(#"trigger", {#activator:players[0]});
		}
		if(is_true(zombie_doors[i].power_door_ignore_flag_wait))
		{
			zombie_doors[i] notify(#"power_on");
		}
		waitframe(1);
	}
	zombie_airlock_doors = getentarray("zombie_airlock_buy", "targetname");
	for(i = 0; i < zombie_airlock_doors.size; i++)
	{
		zombie_airlock_doors[i] notify(#"trigger", {#activator:players[0]});
		waitframe(1);
	}
	zombie_debris = getentarray("zombie_debris", "targetname");
	for(i = 0; i < zombie_debris.size; i++)
	{
		if(isdefined(zombie_debris[i]))
		{
			zombie_debris[i] notify(#"trigger", {#activator:players[0]});
		}
		waitframe(1);
	}
	level notify(#"open_sesame");
	wait(1);
	setdvar(#"zombie_unlock_all", 0);
}

/*
	Name: function_97346595
	Namespace: namespace_8eb9bc0a
	Checksum: 0x5A7986B7
	Offset: 0x730
	Size: 0x302
	Parameters: 0
	Flags: Linked
*/
function function_97346595()
{
	var_2e0b8925 = getdvarint(#"hash_6d3c5317001d4fc6", 0);
	while(true)
	{
		new_value = getdvarint(#"hash_6d3c5317001d4fc6", 0);
		players = getplayers();
		if(new_value != var_2e0b8925)
		{
			/#
				if(!(var_2e0b8925 && new_value))
				{
					adddebugcommand("");
				}
			#/
			if(new_value != 0)
			{
				if(new_value == 2)
				{
					level thread zombie_open_sesame();
				}
				remainingplayers = 4 - players.size;
				callback::on_spawned(&function_c5342e8d);
				players = getplayers();
				foreach(player in players)
				{
					player val::set(#"hash_401e97eafd7ce04d", "takedamage", 0);
				}
				/#
					adddebugcommand("" + remainingplayers);
				#/
				waitframe(1);
				/#
					adddebugcommand("");
				#/
			}
			else
			{
				/#
					adddebugcommand("");
				#/
				callback::remove_on_spawned(&function_c5342e8d);
				players = getplayers();
				foreach(player in players)
				{
					player val::reset(#"hash_401e97eafd7ce04d", "takedamage");
				}
			}
		}
		var_2e0b8925 = new_value;
		waitframe(1);
	}
}

/*
	Name: function_c5342e8d
	Namespace: namespace_8eb9bc0a
	Checksum: 0x4F0B0B68
	Offset: 0xA40
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c5342e8d()
{
	self val::set(#"hash_401e97eafd7ce04d", "takedamage", 0);
}

/*
	Name: devguithink
	Namespace: namespace_8eb9bc0a
	Checksum: 0x3643A681
	Offset: 0xA78
	Size: 0xCA
	Parameters: 0
	Flags: Linked
*/
function devguithink()
{
	setdvar(#"hash_429bdf1368d1a22c", "");
	while(true)
	{
		if(getdvarint(#"hash_429bdf1368d1a22c", 0) > 0)
		{
			if(!is_true(level.var_a095060b))
			{
				level thread function_57bf0556();
			}
		}
		else if(is_true(level.var_a095060b))
		{
			level notify(#"hash_12d79bc0fed4ee5a");
		}
		waitframe(1);
	}
}

/*
	Name: function_57bf0556
	Namespace: namespace_8eb9bc0a
	Checksum: 0x75F8B7B4
	Offset: 0xB50
	Size: 0x310
	Parameters: 0
	Flags: Linked
*/
function function_57bf0556()
{
	self notify("2dcc3b759179c387");
	self endon("2dcc3b759179c387");
	level endon(#"hash_12d79bc0fed4ee5a");
	level.botcount = 0;
	level thread function_db3aef8f();
	level.var_a095060b = 1;
	setdvar(#"hash_2167ce61af5dc0b0", 0);
	setdvar(#"zm_instajoin", 1);
	debugmsg("Soak Test [ON]");
	level thread function_e5266c17();
	while(level.var_a095060b)
	{
		if(getdvarint(#"hash_2fe8fa3077b74221", 1) > 1)
		{
			wait(randomfloatrange(0.2, 0.6));
		}
		else
		{
			wait(randomintrange(2, 6));
		}
		if(level.botcount > 0 && randomint(100) > 70)
		{
			bot::remove_random_bot();
			level.botcount--;
			debugmsg("Bot is being removed.   Count=" + level.botcount);
		}
		else if(getdvarint(#"hash_4a501e2ed929dd5b", 1) && getplayers().size < 4 && randomint(100) < 30)
		{
			bot = bot::add_bot(#"allies", function_a161addf(), "ZM");
			if(isdefined(bot))
			{
				plr = getplayers()[0];
				bot setorigin(plr.origin);
				level.botcount++;
				debugmsg("Bot is being added.  Count=" + level.botcount);
			}
		}
	}
	level notify(#"hash_12d79bc0fed4ee5a");
}

/*
	Name: function_e5266c17
	Namespace: namespace_8eb9bc0a
	Checksum: 0xD023A883
	Offset: 0xE68
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_e5266c17()
{
	self notify("5e97b44b64593a01");
	self endon("5e97b44b64593a01");
	level waittill(#"hash_12d79bc0fed4ee5a");
	bot::remove_bots();
}

/*
	Name: function_db3aef8f
	Namespace: namespace_8eb9bc0a
	Checksum: 0x18F39B51
	Offset: 0xEB8
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_db3aef8f()
{
	self notify("6279a9a0d225fe67");
	self endon("6279a9a0d225fe67");
	level waittill(#"hash_12d79bc0fed4ee5a");
	level.var_a095060b = 0;
	debugmsg("DOA Soak Test [OFF]");
	setdvar(#"hash_2167ce61af5dc0b0", 1);
	setdvar(#"zm_instajoin", 0);
}

/*
	Name: debugmsg
	Namespace: namespace_8eb9bc0a
	Checksum: 0xBB9A586
	Offset: 0xF68
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function debugmsg(txt)
{
	/#
		println("" + txt);
	#/
}

/*
	Name: function_a161addf
	Namespace: namespace_8eb9bc0a
	Checksum: 0xE90B4DFA
	Offset: 0xFA8
	Size: 0x128
	Parameters: 0
	Flags: Linked
*/
function function_a161addf()
{
	colors = array("green", "blue", "red", "yellow");
	used = [];
	guys = getplayers();
	foreach(guy in guys)
	{
		used[used.size] = guy.doa.color;
	}
	valid = array::exclude(colors, used);
	return ("TEST MONKEY (" + valid[0]) + ")";
}

