#using script_3d5821d793ed4c6;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\callbacks.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace zm_trial;

/*
	Name: function_124cfef1
	Namespace: zm_trial
	Checksum: 0x208A024F
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_124cfef1()
{
	level notify(1280261974);
}

/*
	Name: function_89f2df9
	Namespace: zm_trial
	Checksum: 0x9D098E4B
	Offset: 0x100
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_trial", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial
	Checksum: 0xB92EF6DA
	Offset: 0x148
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!function_b47f6aba())
	{
		return;
	}
	level.var_c556bb2e = [];
	function_4dbf2663();
}

/*
	Name: function_d02ffd
	Namespace: zm_trial
	Checksum: 0x831CEAEB
	Offset: 0x188
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
	Checksum: 0x40723DE4
	Offset: 0x228
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
	Name: function_b47f6aba
	Namespace: zm_trial
	Checksum: 0xAF4949A1
	Offset: 0x278
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function function_b47f6aba()
{
	return zm_utility::is_trials();
}

/*
	Name: register_challenge
	Namespace: zm_trial
	Checksum: 0xB995DF4
	Offset: 0x298
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
	Checksum: 0x1F63F900
	Offset: 0x358
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_a36e8c38(name)
{
	if(function_b47f6aba() && isdefined(level.var_1420e3f6))
	{
		foreach(var_789f05d3 in level.var_1420e3f6.challenges)
		{
			if(var_789f05d3.name == name)
			{
				return var_789f05d3;
			}
		}
	}
	return undefined;
}

/*
	Name: function_4dbf2663
	Namespace: zm_trial
	Checksum: 0x315CD8F6
	Offset: 0x420
	Size: 0x44C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4dbf2663()
{
	var_3b363b7a = getgametypesetting(#"zmtrialsvariant");
	if(isdefined(var_3b363b7a) && var_3b363b7a > 0)
	{
		table = hash(((("gamedata/tables/zm/") + util::function_53bbf9d2() + "_trials_variant_") + var_3b363b7a) + ".csv");
	}
	else
	{
		table = hash(("gamedata/tables/zm/") + util::function_53bbf9d2() + "_trials.csv");
	}
	var_a183f42b = tablelookupcolumncount(table);
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
				var_ef0a371f = round - 1;
				if(!isdefined(var_6d87ac05.rounds[var_ef0a371f]))
				{
					var_6d87ac05.rounds[var_ef0a371f] = {};
					var_48c6ec2e = var_6d87ac05.rounds[var_ef0a371f];
					var_48c6ec2e.name = tablelookupcolumnforrow(table, row, 1);
					var_48c6ec2e.round = round;
					var_48c6ec2e.name_str = tablelookupcolumnforrow(table, row, 2);
					var_48c6ec2e.var_695d8fd1 = tablelookupcolumnforrow(table, row, 3);
					var_48c6ec2e.challenges = [];
				}
				/#
					assert(isdefined(var_6d87ac05.rounds[var_ef0a371f]));
				#/
				var_48c6ec2e = var_6d87ac05.rounds[var_ef0a371f];
				challenge_name = tablelookupcolumnforrow(table, row, 5);
				var_10a28798 = [];
				array::add(var_48c6ec2e.challenges, {#params:var_10a28798, #row:row, #name:challenge_name});
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

