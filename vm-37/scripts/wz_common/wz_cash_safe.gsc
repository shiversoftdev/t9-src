#using scripts\core_common\player\player_stats.gsc;
#using script_4108035fe400ce67;
#using scripts\core_common\item_inventory.gsc;
#using script_7bacb32f8222fa3e;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using script_1cd491b1807da8f7;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace wz_cash_safe;

/*
	Name: __init__system__
	Namespace: wz_cash_safe
	Checksum: 0x25893F7A
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"wz_cash_safe", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: wz_cash_safe
	Checksum: 0xDA3F016D
	Offset: 0x128
	Size: 0xC4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.var_a6a3e12a = [];
	if(getdvarint(#"hash_7074ed0f04816b75", 0))
	{
		clientfield::register("allplayers", "wz_cash_carrying", 13000, 1, "int");
	}
	level thread setup_safes();
	callback::on_player_killed(&on_player_killed);
	/#
		callback::on_game_playing(&function_a6eac3b7);
	#/
}

/*
	Name: on_player_killed
	Namespace: wz_cash_safe
	Checksum: 0x96F4090B
	Offset: 0x1F8
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private on_player_killed(var_a2f12b49)
{
}

/*
	Name: function_ed66923
	Namespace: wz_cash_safe
	Checksum: 0x506A295F
	Offset: 0x210
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_ed66923(targetname, count)
{
	if(isdefined(level.var_a6a3e12a[targetname]))
	{
		return;
	}
	level.var_a6a3e12a[targetname] = count;
}

/*
	Name: setup_safes
	Namespace: wz_cash_safe
	Checksum: 0xF8DA1D63
	Offset: 0x258
	Size: 0x170
	Parameters: 0
	Flags: Private
*/
function private setup_safes()
{
	item_world::function_1b11e73c();
	if(getdvarint(#"hash_7074ed0f04816b75", 0))
	{
		item_drop::function_f3f9788a(#"cash_item_500", 1);
		level.var_590e0497 = [];
		foreach(targetname, count in level.var_a6a3e12a)
		{
			activate_safes(targetname, count);
		}
		level thread function_fb346efb();
	}
	else
	{
		foreach(count in level.var_a6a3e12a)
		{
			function_189f45d2(targetname);
		}
	}
}

/*
	Name: function_189f45d2
	Namespace: wz_cash_safe
	Checksum: 0x6ACEB143
	Offset: 0x3D0
	Size: 0xB8
	Parameters: 1
	Flags: Private
*/
function private function_189f45d2(targetname)
{
	safes = getdynentarray(targetname);
	foreach(safe in safes)
	{
		function_e2a06860(safe, 1);
	}
}

/*
	Name: activate_safes
	Namespace: wz_cash_safe
	Checksum: 0xE539A1D
	Offset: 0x490
	Size: 0x118
	Parameters: 2
	Flags: Private
*/
function private activate_safes(targetname, count)
{
	safes = getdynentarray(targetname);
	while(safes.size > count)
	{
		i = randomint(safes.size);
		safes[i] hide_safe();
		arrayremoveindex(safes, i);
	}
	foreach(safe in safes)
	{
		safe activate_safe();
	}
}

/*
	Name: function_fb346efb
	Namespace: wz_cash_safe
	Checksum: 0x709CE71B
	Offset: 0x5B0
	Size: 0x120
	Parameters: 0
	Flags: Private
*/
function private function_fb346efb()
{
	level flag::wait_till(#"hash_405e46788e83af41");
	var_c88d9756 = level.deathcircles.size - 1;
	while(level.deathcircleindex < var_c88d9756)
	{
		wait(1);
	}
	var_8e3c3c5b = level.deathcircles[level.deathcircleindex];
	level.var_590e0497 = [];
	foreach(targetname, count in level.var_a6a3e12a)
	{
		function_3387f756(targetname, var_8e3c3c5b.origin, var_8e3c3c5b.radius);
	}
}

/*
	Name: function_3387f756
	Namespace: wz_cash_safe
	Checksum: 0x40E725DF
	Offset: 0x6D8
	Size: 0x110
	Parameters: 3
	Flags: Private
*/
function private function_3387f756(targetname, origin, radius)
{
	safes = getdynentarray(targetname);
	radiussq = radius * radius;
	foreach(safe in safes)
	{
		if(distance2dsquared(origin, safe.origin) <= radiussq)
		{
			safe activate_safe();
			continue;
		}
		safe hide_safe();
	}
}

/*
	Name: activate_safe
	Namespace: wz_cash_safe
	Checksum: 0xF2A7A3FF
	Offset: 0x7F0
	Size: 0xBC
	Parameters: 0
	Flags: Private
*/
function private activate_safe()
{
	function_e2a06860(self, 0);
	self.var_e7823894 = 1;
	self.canuse = &function_c92a5584;
	self.onbeginuse = &function_97eb71f0;
	self.var_263c4ded = &function_3d49217f;
	self.onuse = &function_7c5a1e82;
	self.onusecancel = &function_368adf4f;
	level.var_590e0497[level.var_590e0497.size] = self;
}

/*
	Name: hide_safe
	Namespace: wz_cash_safe
	Checksum: 0x3B67B0BD
	Offset: 0x8B8
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private hide_safe()
{
	function_e2a06860(self, 2);
}

/*
	Name: function_c92a5584
	Namespace: wz_cash_safe
	Checksum: 0x4E35D51B
	Offset: 0x8E0
	Size: 0x13A
	Parameters: 1
	Flags: Private
*/
function private function_c92a5584(activator)
{
	if(!isdefined(activator) || !isstruct(activator.inventory) || !isarray(activator.inventory.items))
	{
		return false;
	}
	foreach(item in activator.inventory.items)
	{
		if(!isdefined(item) || !isstruct(item.var_a6762160) || item.var_a6762160.itemtype !== #"cash")
		{
			continue;
		}
		return true;
	}
	return false;
}

/*
	Name: function_97eb71f0
	Namespace: wz_cash_safe
	Checksum: 0xF4E79B5F
	Offset: 0xA28
	Size: 0x44
	Parameters: 1
	Flags: Private
*/
function private function_97eb71f0(activator)
{
	if(isdefined(activator.var_8a022726))
	{
		activator.var_8a022726 sethintstring(#"");
	}
}

/*
	Name: function_3d49217f
	Namespace: wz_cash_safe
	Checksum: 0x8D710756
	Offset: 0xA78
	Size: 0x4A
	Parameters: 1
	Flags: Private
*/
function private function_3d49217f(activator)
{
	var_22aec194 = activator function_2cef7d98();
	if(isdefined(var_22aec194))
	{
		return var_22aec194.var_a6762160.casttime;
	}
	return undefined;
}

/*
	Name: function_7c5a1e82
	Namespace: wz_cash_safe
	Checksum: 0x50CB803C
	Offset: 0xAD0
	Size: 0x1DC
	Parameters: 3
	Flags: Private
*/
function private function_7c5a1e82(activator, stateindex, var_9bdcfcd8)
{
	self clear_prompts(var_9bdcfcd8);
	if(!isdefined(var_9bdcfcd8) || !isstruct(var_9bdcfcd8.inventory) || !isarray(var_9bdcfcd8.inventory.items))
	{
		return false;
	}
	var_22aec194 = var_9bdcfcd8 function_2cef7d98();
	if(isdefined(var_22aec194))
	{
		scoreamount = var_22aec194.var_a6762160.amount;
		var_3e67196f = var_22aec194.count;
		var_9bdcfcd8 item_inventory::use_inventory_item(var_22aec194.var_bd027dd9, 1);
		if(var_22aec194.count < var_3e67196f)
		{
			[[level._setteamscore]](var_9bdcfcd8.team, [[level._getteamscore]](var_9bdcfcd8.team) + scoreamount);
			playsoundatposition(#"hash_2b58f77dbea4ade1", self.origin);
			globallogic_score::function_889ed975(var_9bdcfcd8, scoreamount, 0, 0);
			var_9bdcfcd8 stats::function_bb7eedf0(#"score", scoreamount);
			var_9bdcfcd8 stats::function_b7f80d87(#"score", scoreamount);
			return true;
		}
	}
	return false;
}

/*
	Name: function_2cef7d98
	Namespace: wz_cash_safe
	Checksum: 0xF5632524
	Offset: 0xCB8
	Size: 0x122
	Parameters: 0
	Flags: Private
*/
function private function_2cef7d98()
{
	var_22aec194 = undefined;
	foreach(item in self.inventory.items)
	{
		if(!isdefined(item) || !isstruct(item.var_a6762160) || item.var_a6762160.itemtype !== #"cash")
		{
			continue;
		}
		if(!isdefined(var_22aec194) || var_22aec194.var_a6762160.amount < item.var_a6762160.amount)
		{
			var_22aec194 = item;
		}
	}
	return var_22aec194;
}

/*
	Name: function_368adf4f
	Namespace: wz_cash_safe
	Checksum: 0x855BB1A9
	Offset: 0xDE8
	Size: 0x24
	Parameters: 1
	Flags: Private
*/
function private function_368adf4f(activator)
{
	self clear_prompts(activator);
}

/*
	Name: clear_prompts
	Namespace: wz_cash_safe
	Checksum: 0x972441E1
	Offset: 0xE18
	Size: 0x6C
	Parameters: 1
	Flags: Private
*/
function private clear_prompts(activator)
{
	bundle = function_489009c1(self);
	state = function_ffdbe8c2(self);
	activator.var_8a022726 dynent_use::function_836af3b3(bundle, state);
}

/*
	Name: function_a6eac3b7
	Namespace: wz_cash_safe
	Checksum: 0xDB0F1FBA
	Offset: 0xE90
	Size: 0x168
	Parameters: 0
	Flags: Private
*/
function private function_a6eac3b7()
{
	/#
		while(true)
		{
			wait(0.25);
			dvarstr = getdvarstring(#"scr_give_player_score", "");
			if(dvarstr == "")
			{
				continue;
			}
			setdvar(#"devgui_deathcircle", "");
			args = strtok(dvarstr, "");
			if(args.size == 2)
			{
				player = getentbynum(int(args[0]));
				if(isplayer(player))
				{
					[[level._setteamscore]](player.team, [[level._getteamscore]](player.team) + int(args[1]));
				}
			}
		}
	#/
}

