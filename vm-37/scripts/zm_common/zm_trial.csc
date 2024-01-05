#using scripts\zm_common\callbacks.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_trial_util.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_trial;

/*
	Name: __init__system__
	Namespace: zm_trial
	Checksum: 0x14086BFB
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial
	Checksum: 0x12E8B85C
	Offset: 0x128
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_trial_mode())
	{
		return;
	}
	level.var_c556bb2e = [];
	function_4dbf2663();
}

/*
	Name: function_d02ffd
	Namespace: zm_trial
	Checksum: 0xAB5DAED8
	Offset: 0x168
	Size: 0x98
	Parameters: 1
	Flags: None
*/
function function_d02ffd(name)
{
	foreach(var_6d87ac05 in level.var_c556bb2e)
	{
		if(var_6d87ac05.name == name)
		{
			return var_6d87ac05;
		}
	}
	return undefined;
}

/*
	Name: function_ce2fdd3b
	Namespace: zm_trial
	Checksum: 0x8E8AB6C3
	Offset: 0x208
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function function_ce2fdd3b(index)
{
	if(isdefined(level.var_c556bb2e) && isdefined(level.var_c556bb2e[index]))
	{
		return level.var_c556bb2e[index];
	}
	return undefined;
}

/*
	Name: is_trial_mode
	Namespace: zm_trial
	Checksum: 0x4256D801
	Offset: 0x258
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function is_trial_mode()
{
	return zm_utility::is_trials();
}

/*
	Name: register_challenge
	Namespace: zm_trial
	Checksum: 0x8611641A
	Offset: 0x278
	Size: 0xB8
	Parameters: 3
	Flags: Linked
*/
function register_challenge(name, var_c5dd8620, var_bbcdbff5)
{
	if(!isdefined(level.var_75e93a54))
	{
		level.var_75e93a54 = [];
	}
	/#
		assert(!isdefined(level.var_75e93a54[name]));
	#/
	info = {#hash_bbcdbff5:var_bbcdbff5, #hash_c5dd8620:var_c5dd8620, #name:name};
	level.var_75e93a54[name] = info;
}

/*
	Name: function_a36e8c38
	Namespace: zm_trial
	Checksum: 0xEE07D28E
	Offset: 0x338
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_a36e8c38(name)
{
	if(is_trial_mode() && isdefined(level.var_1420e3f6))
	{
		foreach(active_challenge in level.var_1420e3f6.challenges)
		{
			if(active_challenge.name == name)
			{
				return active_challenge;
			}
		}
	}
	return undefined;
}

/*
	Name: function_4dbf2663
	Namespace: zm_trial
	Checksum: 0xE20D17B9
	Offset: 0x400
	Size: 0x44C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4dbf2663()
{
	var_3b363b7a = getgametypesetting(#"zmtrialsvariant");
	if(isdefined(var_3b363b7a) && var_3b363b7a > 0)
	{
		table = hash(((("gamedata/tables/zm/") + util::get_map_name() + "_trials_variant_") + var_3b363b7a) + ".csv");
	}
	else
	{
		table = hash(("gamedata/tables/zm/") + util::get_map_name() + "_trials.csv");
	}
	column_count = tablelookupcolumncount(table);
	var_e1617d73 = tablelookuprowcount(table);
	row = 0;
	while(row < var_e1617d73)
	{
		var_189d26ca = tablelookupcolumnforrow(table, row, 1);
		/#
			assert(!isdefined(function_d02ffd(var_189d26ca)));
		#/
		var_6d87ac05 = {#index:level.var_c556bb2e.size, #rounds:[], #name:var_189d26ca};
		level.var_c556bb2e[level.var_c556bb2e.size] = var_6d87ac05;
		do
		{
			row++;
			round = tablelookupcolumnforrow(table, row, 0);
			if(row < var_e1617d73 && round != 0)
			{
				round_index = round - 1;
				if(!isdefined(var_6d87ac05.rounds[round_index]))
				{
					var_6d87ac05.rounds[round_index] = {};
					round_info = var_6d87ac05.rounds[round_index];
					round_info.name = tablelookupcolumnforrow(table, row, 1);
					round_info.round = round;
					round_info.name_str = tablelookupcolumnforrow(table, row, 2);
					round_info.var_695d8fd1 = tablelookupcolumnforrow(table, row, 3);
					round_info.challenges = [];
				}
				/#
					assert(isdefined(var_6d87ac05.rounds[round_index]));
				#/
				round_info = var_6d87ac05.rounds[round_index];
				challenge_name = tablelookupcolumnforrow(table, row, 5);
				var_10a28798 = [];
				array::add(round_info.challenges, {#params:var_10a28798, #row:row, #name:challenge_name});
				for(i = 0; i < 8; i++)
				{
					param = tablelookupcolumnforrow(table, row, 6 + i);
					if(isdefined(param) && param != #"")
					{
						var_10a28798[var_10a28798.size] = param;
					}
				}
			}
		}
		while(row < var_e1617d73 && round != 0);
	}
	level.var_6d87ac05 = level.var_c556bb2e[0];
}

