#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\callings\zm_callings_devgui.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;

#namespace zm_callings;

/*
	Name: __init__system__
	Namespace: zm_callings
	Checksum: 0x1C29E91A
	Offset: 0xA0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_callings", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_callings
	Checksum: 0xA97C3879
	Offset: 0xF8
	Size: 0x18A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_314051a1 = getscriptbundle(#"hash_7258efc12235efc9");
	if(isdefined(level.var_314051a1.var_2e61f0ce))
	{
		for(i = 0; i < level.var_314051a1.var_2e61f0ce.size; i++)
		{
			for(j = 0; j < level.var_314051a1.var_2e61f0ce[i].factionlist.size; j++)
			{
				level.var_314051a1.var_2e61f0ce[i].var_ecb4fc1[hash(level.var_314051a1.var_2e61f0ce[i].factionlist[j].var_b3bfb429)] = level.var_314051a1.var_2e61f0ce[i].factionlist[j];
				level.var_314051a1.var_2e61f0ce[i].var_ecb4fc1[hash(level.var_314051a1.var_2e61f0ce[i].factionlist[j].var_b3bfb429)].index = j;
			}
		}
	}
}

/*
	Name: function_8ac3bea9
	Namespace: zm_callings
	Checksum: 0x6599FCC3
	Offset: 0x290
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	/#
		level thread zm_callings_devgui::function_9f47471();
	#/
}

/*
	Name: function_c3be3572
	Namespace: zm_callings
	Checksum: 0x903159D7
	Offset: 0x2B8
	Size: 0x22C
	Parameters: 6
	Flags: Linked, Private
*/
function private function_c3be3572(var_9c939fff, var_27426b47, target, xp, var_b68d50cb, var_7b2027fe)
{
	if(!isdefined(var_b68d50cb))
	{
		var_b68d50cb = 1;
	}
	if(!isdefined(var_7b2027fe))
	{
		var_7b2027fe = 1;
	}
	var_1eb89301 = getscriptbundle(var_9c939fff);
	if(isdefined(var_1eb89301.callingtask))
	{
		var_341c004b = undefined;
		for(i = 0; i < level.var_314051a1.tasklist.size; i++)
		{
			if(level.var_314051a1.tasklist[i].task == var_9c939fff)
			{
				var_341c004b = i;
				break;
			}
		}
		if(isdefined(var_341c004b))
		{
			if(!isdefined(self.var_96d6f6d1))
			{
				self.var_96d6f6d1 = array();
			}
			var_d1017f27 = {#hash_949f9254:var_7b2027fe, #hash_52ac6e9c:var_b68d50cb, #hash_4a01cb77:self.var_96d6f6d1.size, #hash_30c47a21:var_27426b47, #hash_de86e878:var_341c004b, #n_xp:xp, #hash_ad971622:var_1eb89301.callingtask, #hash_e226ec4f:target};
			if(!isdefined(self.var_96d6f6d1))
			{
				self.var_96d6f6d1 = [];
			}
			else if(!isarray(self.var_96d6f6d1))
			{
				self.var_96d6f6d1 = array(self.var_96d6f6d1);
			}
			self.var_96d6f6d1[self.var_96d6f6d1.size] = var_d1017f27;
		}
	}
}

/*
	Name: function_f3393d6a
	Namespace: zm_callings
	Checksum: 0x6FA87823
	Offset: 0x4F0
	Size: 0x544
	Parameters: 0
	Flags: Linked
*/
function function_f3393d6a()
{
	var_ef74f2da = self stats::get_stat(#"playercalling", #"hash_5bf1ebbfa7b16c64");
	if(!var_ef74f2da)
	{
		return;
	}
	self.var_e06cb519 = self stats::get_stat(#"playercalling", #"currentseason");
	self.var_bf6f8ec3 = self stats::get_stat(#"playercalling", #"hash_3a5ab6fb11258ebf");
	if(zm_utility::is_classic() || zm_utility::is_standard())
	{
		self.var_d0b65bbe = hash(self stats::get_stat(#"playercalling", #"currentfaction"));
		var_3afde5e2 = hash(self stats::get_stat(#"playercalling", #"seasons", self.var_e06cb519, #"hash_7e597fbe41270a4d"));
		var_51fe014e = level.var_314051a1.var_2e61f0ce[self.var_e06cb519].var_ecb4fc1[var_3afde5e2].var_642e4919 - 1;
		var_51fe014e = var_51fe014e + self.var_bf6f8ec3;
		var_51fe014e = var_51fe014e % level.var_314051a1.var_742e4106.size;
		if(zm_utility::is_classic())
		{
			var_98a2d658 = level.var_314051a1.var_742e4106[var_51fe014e].var_effda190;
			foreach(task in var_98a2d658)
			{
				self function_c3be3572(task.task, #"hash_20deab97abbf7b12", task.target, task.xp);
			}
		}
		else if(zm_utility::is_standard())
		{
			var_c53e054e = level.var_314051a1.var_742e4106[var_51fe014e].var_ebb6275a;
			foreach(task in var_c53e054e)
			{
				self function_c3be3572(task.task, #"hash_764a5fc3ba8820d2", task.target, task.xp);
			}
		}
	}
	else
	{
		self.var_eb15d3ac = level.var_314051a1.var_2e61f0ce[self.var_e06cb519].var_203c6468[self.var_bf6f8ec3].var_4e49f678;
		str_gametype = util::get_game_type();
		if(self.var_eb15d3ac == str_gametype)
		{
			s_tcm = level.var_314051a1.var_2e61f0ce[self.var_e06cb519].var_203c6468[self.var_bf6f8ec3];
			foreach(task in s_tcm.var_272b4041)
			{
				self function_c3be3572(task.task, #"hash_647ebc7d24425fee", task.target, task.xp);
			}
			self function_c3be3572(s_tcm.tcmgoal, #"tcmgoal", s_tcm.var_baa2833f, s_tcm.var_b7150b6, 0, 0);
		}
	}
}

/*
	Name: function_10a1ac3c
	Namespace: zm_callings
	Checksum: 0xAA60D4CB
	Offset: 0xA40
	Size: 0x13A
	Parameters: 3
	Flags: Linked, Private
*/
function private function_10a1ac3c(var_d1017f27, var_e06cb519, var_bf6f8ec3)
{
	if(is_true(var_d1017f27.var_949f9254))
	{
		if(is_true(var_d1017f27.var_52ac6e9c))
		{
			return self stats::get_stat(#"playercalling", #"seasons", var_e06cb519, #"callings", var_bf6f8ec3, var_d1017f27.var_30c47a21, var_d1017f27.var_4a01cb77, #"progress");
		}
		return self stats::get_stat(#"playercalling", #"seasons", var_e06cb519, #"callings", var_bf6f8ec3, var_d1017f27.var_30c47a21, #"progress");
	}
	if(!isdefined(var_d1017f27.var_1020847d))
	{
		var_d1017f27.var_1020847d = 0;
	}
	return var_d1017f27.var_1020847d;
}

/*
	Name: function_66714869
	Namespace: zm_callings
	Checksum: 0xAD5C47CB
	Offset: 0xB88
	Size: 0x15A
	Parameters: 4
	Flags: Linked, Private
*/
function private function_66714869(var_d1017f27, var_e06cb519, var_bf6f8ec3, n_inc)
{
	if(is_true(var_d1017f27.var_949f9254))
	{
		if(is_true(var_d1017f27.var_52ac6e9c))
		{
			self stats::inc_stat(#"playercalling", #"seasons", var_e06cb519, #"callings", var_bf6f8ec3, var_d1017f27.var_30c47a21, var_d1017f27.var_4a01cb77, #"progress", n_inc);
		}
		else
		{
			self stats::inc_stat(#"playercalling", #"seasons", var_e06cb519, #"callings", var_bf6f8ec3, var_d1017f27.var_30c47a21, #"progress", n_inc);
		}
	}
	else
	{
		if(!isdefined(var_d1017f27.var_1020847d))
		{
			var_d1017f27.var_1020847d = 0;
		}
		var_d1017f27.var_1020847d = var_d1017f27.var_1020847d + n_inc;
	}
}

/*
	Name: function_a6a40735
	Namespace: zm_callings
	Checksum: 0xE923A55D
	Offset: 0xCF0
	Size: 0x16C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_a6a40735(var_d1017f27, var_e06cb519, var_bf6f8ec3, n_value, var_32a60884)
{
	if(!isdefined(var_32a60884))
	{
		var_32a60884 = 0;
	}
	if(!is_true(var_d1017f27.var_949f9254))
	{
		var_d1017f27.var_1020847d = n_value;
	}
	if(is_true(var_d1017f27.var_949f9254) || var_32a60884)
	{
		if(is_true(var_d1017f27.var_52ac6e9c))
		{
			self stats::set_stat(#"playercalling", #"seasons", var_e06cb519, #"callings", var_bf6f8ec3, var_d1017f27.var_30c47a21, var_d1017f27.var_4a01cb77, #"progress", n_value);
		}
		else
		{
			self stats::set_stat(#"playercalling", #"seasons", var_e06cb519, #"callings", var_bf6f8ec3, var_d1017f27.var_30c47a21, #"progress", n_value);
		}
	}
}

/*
	Name: function_7b01d125
	Namespace: zm_callings
	Checksum: 0x6DE35785
	Offset: 0xE68
	Size: 0x3A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_7b01d125(var_a0639b8c, var_f65a9845)
{
	return level.var_314051a1.var_2e61f0ce[var_a0639b8c].var_ecb4fc1[var_f65a9845].index;
}

/*
	Name: function_104c5d35
	Namespace: zm_callings
	Checksum: 0x8F0B757D
	Offset: 0xEB0
	Size: 0x358
	Parameters: 0
	Flags: Linked, Private
*/
function private function_104c5d35()
{
	var_94237d8 = array(#"hash_20deab97abbf7b12", #"hash_764a5fc3ba8820d2", #"hash_647ebc7d24425fee", #"tcmgoal");
	foreach(var_acbd7392 in var_94237d8)
	{
		var_1e9f2834 = 1;
		var_ed9fe2be = 0;
		foreach(var_d1017f27 in self.var_96d6f6d1)
		{
			if(var_d1017f27.var_30c47a21 == var_acbd7392)
			{
				var_e4edaaf0 = self function_10a1ac3c(var_d1017f27, self.var_e06cb519, self.var_bf6f8ec3);
				n_target = var_d1017f27.var_e226ec4f;
				if(var_e4edaaf0 < n_target)
				{
					var_1e9f2834 = 0;
					break;
				}
				if(!var_ed9fe2be && is_true(var_d1017f27.var_89ed7b39))
				{
					var_d1017f27.var_89ed7b39 = 0;
					var_ed9fe2be = 1;
				}
			}
		}
		if(is_true(var_1e9f2834) && is_true(var_ed9fe2be))
		{
			self luinotifyevent(#"zombie_callings_notification", 4, 3, function_7b01d125(self.var_e06cb519, self.var_d0b65bbe) + 1, self.var_e06cb519 + 1, self getentitynumber());
			self stats::inc_stat(#"playercalling", #"seasons", self.var_e06cb519, #"factions", self.var_d0b65bbe, #"hash_7a54171ce10db54f", 1);
			/#
				iprintln((("" + function_9e72a96(var_acbd7392)) + "") + function_9e72a96(self.var_d0b65bbe));
			#/
		}
	}
}

/*
	Name: function_4368582a
	Namespace: zm_callings
	Checksum: 0xCACF3F1A
	Offset: 0x1210
	Size: 0x28C
	Parameters: 2
	Flags: Linked
*/
function function_4368582a(var_d1017f27, n_value)
{
	if(!isdefined(n_value))
	{
		n_value = 1;
	}
	var_e4edaaf0 = self function_10a1ac3c(var_d1017f27, self.var_e06cb519, self.var_bf6f8ec3);
	n_target = var_d1017f27.var_e226ec4f;
	if(var_e4edaaf0 < n_target)
	{
		if((var_e4edaaf0 + n_value) >= n_target)
		{
			var_d1017f27.var_89ed7b39 = 1;
			self function_a6a40735(var_d1017f27, self.var_e06cb519, self.var_bf6f8ec3, n_target, 1);
			self luinotifyevent(#"zombie_callings_notification", 3, 2, var_d1017f27.var_de86e878, self getentitynumber());
			/#
				iprintln((((self.name + "") + function_9e72a96(var_d1017f27.var_ad971622) + "") + var_d1017f27.n_xp) + "");
			#/
			self function_104c5d35();
			uploadstats(self);
			self function_4835d26a();
		}
		else
		{
			/#
				progress = var_e4edaaf0 + n_value;
				target = n_target;
				iprintln(((((self.name + "") + function_9e72a96(var_d1017f27.var_ad971622) + "") + progress) + "") + target);
			#/
			self function_66714869(var_d1017f27, self.var_e06cb519, self.var_bf6f8ec3, n_value);
		}
	}
	else
	{
		/#
			return self function_10a1ac3c(var_d1017f27, self.var_e06cb519, self.var_bf6f8ec3);
		#/
	}
}

