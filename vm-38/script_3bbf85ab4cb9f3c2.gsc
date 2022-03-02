#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_350cffecd05ef6cf;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_47fb62300ac0bd60;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_68cdf0ca5df5e;
#using script_6b6510e124bad778;
#using script_74a56359b7d02ab6;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\persistence_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\gametypes\globallogic_score.gsc;

#namespace namespace_d2efac9a;

/*
	Name: function_acb80119
	Namespace: namespace_d2efac9a
	Checksum: 0xEC9F775B
	Offset: 0x268
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_acb80119()
{
	level notify(1129406820);
}

/*
	Name: init
	Namespace: namespace_d2efac9a
	Checksum: 0x80F724D1
	Offset: 0x288
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function init()
{
}

/*
	Name: main
	Namespace: namespace_d2efac9a
	Checksum: 0x589052E
	Offset: 0x298
	Size: 0x90
	Parameters: 0
	Flags: None
*/
function main()
{
	foreach(player in getplayers())
	{
		player initplayer();
	}
}

/*
	Name: initplayer
	Namespace: namespace_d2efac9a
	Checksum: 0x5C77B66
	Offset: 0x330
	Size: 0x2E4
	Parameters: 0
	Flags: None
*/
function initplayer()
{
	/#
		assert(isdefined(self.doa));
	#/
	self.score = 0;
	self.kills = 0;
	self.deaths = 0;
	self.headshots = 0;
	self.revives = 0;
	self.downs = 0;
	if(getdvarint(#"hash_4c52528eb82f5d56", 0))
	{
		keys = self stats::get_stat(#"hash_64fd75a9ce18b89f", #"keys");
		if(keys)
		{
			if(keys > 9)
			{
				keys = 9;
			}
			self.doa.score.keys = keys;
		}
	}
	self.doa.var_bcfd90a5 = #"hash_7eb2e5e9d5a52fbe";
	if(is_true(level.doa.var_318aa67a))
	{
		self.doa.var_bcfd90a5 = #"hash_4c137caaf669154f";
	}
	self.doa.var_f240d1a5 = self stats::get_stat(#"hash_64fd75a9ce18b89f", #"hash_72018b7229672430");
	var_220d700c = self stats::function_441050ca(#"hash_2b71f0bb19aa0c6f");
	if(var_220d700c !== level.doa.var_4eb7c3f0)
	{
		self.doa.var_9c66788e = &function_9cbd5b89;
	}
	self.doa.var_984d40cb = 0;
	var_18909aca = self stats::function_441050ca(#"hash_60d916826ca6a779");
	if(!is_true(var_18909aca))
	{
		self.doa.var_7d46d3b9 = &function_33d5de6e;
	}
	self.doa.var_7873e24e = 0;
	var_728d3ebf = self stats::function_441050ca(#"hash_739a48fafddd915c");
	if(!is_true(var_728d3ebf))
	{
		self.doa.var_fe639705 = &function_ae14e580;
	}
}

/*
	Name: function_ae14e580
	Namespace: namespace_d2efac9a
	Checksum: 0xBF7F0C6E
	Offset: 0x620
	Size: 0x11C
	Parameters: 1
	Flags: None
*/
function function_ae14e580(type)
{
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	if(type == -1)
	{
		return;
	}
	self.doa.var_7873e24e = self.doa.var_7873e24e | (1 << type);
	if(self.doa.var_7873e24e == level.doa.var_dfcf49f8)
	{
		self.doa.var_fe639705 = undefined;
		val = stats::function_441050ca(#"hash_739a48fafddd915c");
		if(val == 0)
		{
			self stats::function_dad108fa(#"hash_739a48fafddd915c", 1);
		}
		self function_4ac57fbe();
	}
}

/*
	Name: function_cb7b5503
	Namespace: namespace_d2efac9a
	Checksum: 0xF32A253
	Offset: 0x748
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function function_cb7b5503(commit)
{
	if(!isdefined(commit))
	{
		commit = 1;
	}
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	self stats::inc_stat(#"hash_64fd75a9ce18b89f", #"hash_2ee36cbdfb5f4bc1", 1);
	self stats::inc_stat(self.doa.var_bcfd90a5, getplayers().size - 1, #"hash_293184ce9f1b2938", 1);
	if(commit)
	{
		self function_4ac57fbe();
	}
}

/*
	Name: function_33d5de6e
	Namespace: namespace_d2efac9a
	Checksum: 0xF8D2F285
	Offset: 0x848
	Size: 0x10C
	Parameters: 1
	Flags: None
*/
function function_33d5de6e(type)
{
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	self.doa.var_984d40cb = self.doa.var_984d40cb | (1 << type);
	if(self.doa.var_984d40cb == ((((((1 | 2) | 4) | 8) | 16) | 32) | 64))
	{
		self.doa.var_7d46d3b9 = undefined;
		val = stats::function_441050ca(#"hash_60d916826ca6a779");
		if(val == 0)
		{
			self stats::function_dad108fa(#"hash_60d916826ca6a779", 1);
		}
	}
}

/*
	Name: function_9cbd5b89
	Namespace: namespace_d2efac9a
	Checksum: 0xDF4ED348
	Offset: 0x960
	Size: 0x186
	Parameters: 1
	Flags: None
*/
function function_9cbd5b89(var_5159caf4)
{
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	if((self.doa.var_f240d1a5 & var_5159caf4) == 0)
	{
		self.doa.var_f240d1a5 = self.doa.var_f240d1a5 | var_5159caf4;
		self stats::function_dad108fa(#"hash_2b71f0bb19aa0c6f", 1);
		/#
			num = self stats::function_441050ca(#"hash_2b71f0bb19aa0c6f");
			namespace_1e25ad94::debugmsg("");
			namespace_1e25ad94::debugmsg((((("" + self.name) + "") + num) + "") + level.doa.var_4eb7c3f0);
			namespace_1e25ad94::debugmsg("");
		#/
	}
	if(self.doa.var_f240d1a5 == level.doa.var_695258a5)
	{
		self.doa.var_9c66788e = undefined;
	}
}

/*
	Name: function_3f112727
	Namespace: namespace_d2efac9a
	Checksum: 0xF042C1AC
	Offset: 0xAF0
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function function_3f112727(commit)
{
	if(!isdefined(commit))
	{
		commit = 1;
	}
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	self.doa.var_90e186f2++;
	val = stats::function_441050ca(#"hash_77660914e8c70a14");
	if(val == 0)
	{
		self stats::function_dad108fa(#"hash_77660914e8c70a14", 1);
	}
	if(commit)
	{
		self function_4ac57fbe();
	}
}

/*
	Name: function_1bcac64f
	Namespace: namespace_d2efac9a
	Checksum: 0x280DE536
	Offset: 0xBD8
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_1bcac64f(commit)
{
	if(!isdefined(commit))
	{
		commit = 0;
	}
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	self stats::function_dad108fa(#"hash_730fd5daf2821481", 1);
	if(commit)
	{
		self function_4ac57fbe();
	}
}

/*
	Name: function_dc4e1885
	Namespace: namespace_d2efac9a
	Checksum: 0xCF506513
	Offset: 0xC78
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_dc4e1885(commit)
{
	if(!isdefined(commit))
	{
		commit = 0;
	}
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	self stats::function_dad108fa(#"hash_52ead07d6d583a9a", 1);
	if(commit)
	{
		self function_4ac57fbe();
	}
}

/*
	Name: function_dd188769
	Namespace: namespace_d2efac9a
	Checksum: 0xEC4B0C49
	Offset: 0xD18
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_dd188769(commit)
{
	if(!isdefined(commit))
	{
		commit = 0;
	}
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	self stats::function_dad108fa(#"hash_1c3294f143668662", 1);
	if(commit)
	{
		self function_4ac57fbe();
	}
}

/*
	Name: function_6753bc5e
	Namespace: namespace_d2efac9a
	Checksum: 0x25753E1E
	Offset: 0xDB8
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_6753bc5e(commit)
{
	if(!isdefined(commit))
	{
		commit = 0;
	}
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	self stats::function_dad108fa(#"hash_26686e13063f6b52", 1);
	if(commit)
	{
		self function_4ac57fbe();
	}
}

/*
	Name: function_a9f863ca
	Namespace: namespace_d2efac9a
	Checksum: 0xD0FEABE3
	Offset: 0xE58
	Size: 0xDC
	Parameters: 2
	Flags: None
*/
function function_a9f863ca(value, commit)
{
	if(!isdefined(commit))
	{
		commit = 0;
	}
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(value !== 7)
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	val = stats::function_441050ca(#"hash_5bbe74ea4f5afcf2");
	if(val > 0)
	{
		return;
	}
	self stats::function_dad108fa(#"hash_5bbe74ea4f5afcf2", 1);
	if(commit)
	{
		self function_4ac57fbe();
	}
}

/*
	Name: function_9a8fff78
	Namespace: namespace_d2efac9a
	Checksum: 0xDD923601
	Offset: 0xF40
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_9a8fff78(commit)
{
	if(!isdefined(commit))
	{
		commit = 0;
	}
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	self stats::function_dad108fa(#"hash_57e965d0cd558b43", 1);
	if(commit)
	{
		self function_4ac57fbe();
	}
}

/*
	Name: function_d7ee01df
	Namespace: namespace_d2efac9a
	Checksum: 0x49CBE38F
	Offset: 0xFE0
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_d7ee01df(commit)
{
	if(!isdefined(commit))
	{
		commit = 0;
	}
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	self stats::function_dad108fa(#"hash_72b0fc7205732661", 1);
	if(commit)
	{
		self function_4ac57fbe();
	}
}

/*
	Name: function_9d3fe107
	Namespace: namespace_d2efac9a
	Checksum: 0xDF38BB64
	Offset: 0x1080
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_9d3fe107(commit)
{
	if(!isdefined(commit))
	{
		commit = 0;
	}
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	self stats::function_dad108fa(#"hash_36df4a3528961605", 1);
	if(commit)
	{
		self function_4ac57fbe();
	}
}

/*
	Name: function_267c2183
	Namespace: namespace_d2efac9a
	Checksum: 0x4328554C
	Offset: 0x1120
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function function_267c2183(commit)
{
	if(!isdefined(commit))
	{
		commit = 1;
	}
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	val = stats::function_441050ca(#"hash_7a72e4b09f5dc89b");
	if(val > 0)
	{
		return;
	}
	self stats::function_dad108fa(#"hash_7a72e4b09f5dc89b", 1);
	if(commit)
	{
		self function_4ac57fbe();
	}
}

/*
	Name: function_6c15a74e
	Namespace: namespace_d2efac9a
	Checksum: 0x2D11907
	Offset: 0x11F0
	Size: 0xE4
	Parameters: 2
	Flags: None
*/
function function_6c15a74e(amount, commit)
{
	if(!isdefined(amount))
	{
		amount = 1;
	}
	if(!isdefined(commit))
	{
		commit = 1;
	}
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	if(getdvarint(#"hash_4c52528eb82f5d56", 0))
	{
		self stats::inc_stat(#"hash_64fd75a9ce18b89f", #"keys", amount);
		if(commit)
		{
			self function_4ac57fbe();
		}
	}
}

/*
	Name: function_849a9028
	Namespace: namespace_d2efac9a
	Checksum: 0xFD91D239
	Offset: 0x12E0
	Size: 0xFC
	Parameters: 2
	Flags: None
*/
function function_849a9028(amount, commit)
{
	if(!isdefined(amount))
	{
		amount = 1;
	}
	if(!isdefined(commit))
	{
		commit = 1;
	}
	if(is_true(level.doa.var_a87ecf08))
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	self.downs = self.downs + amount;
	if(getdvarint(#"hash_4c52528eb82f5d56", 0))
	{
		self stats::inc_stat(#"hash_64fd75a9ce18b89f", #"keys", amount * -1);
		if(commit)
		{
			self function_4ac57fbe();
		}
	}
}

/*
	Name: function_b4dfdc63
	Namespace: namespace_d2efac9a
	Checksum: 0xDED408AE
	Offset: 0x13E8
	Size: 0x71C
	Parameters: 1
	Flags: None
*/
function function_b4dfdc63(idx)
{
	if(getdvarint(#"hash_54b8de6da110d19e", 1) == 0)
	{
		return;
	}
	var_44880184 = self stats::get_stat(#"hash_64fd75a9ce18b89f", #"version");
	var_1c817c65 = self stats::get_stat(self.doa.var_bcfd90a5, idx, #"version");
	var_8ba5929 = undefined;
	if(var_44880184 != 3)
	{
		switch(var_44880184)
		{
			case 0:
			case 1:
			{
				self stats::set_stat(#"hash_64fd75a9ce18b89f", #"hash_30c3377dea0ec672", 0);
				self stats::set_stat(#"hash_64fd75a9ce18b89f", #"hash_783086b558e2dc6d", 0);
				self stats::set_stat(#"hash_64fd75a9ce18b89f", #"hash_264b2ce1e929e63", 0);
				break;
			}
			case 2:
			{
				var_11708556 = self stats::get_stat(#"hash_64fd75a9ce18b89f", #"hash_783086b558e2dc6d");
				var_6d27ced9 = self stats::get_stat(#"hash_64fd75a9ce18b89f", #"hash_264b2ce1e929e63");
				self stats::set_stat(#"hash_64fd75a9ce18b89f", #"hash_783086b558e2dc6d", 0);
				self stats::set_stat(#"hash_64fd75a9ce18b89f", #"hash_264b2ce1e929e63", 0);
				self stats::set_stat(#"hash_4e2b235aab294a3a", #"version", var_44880184);
				self stats::set_stat(#"hash_4e2b235aab294a3a", #"generic", 0, var_11708556);
				self stats::set_stat(#"hash_4e2b235aab294a3a", #"generic", 1, var_6d27ced9);
				var_8ba5929 = 2;
				break;
			}
		}
	}
	if(var_1c817c65 != 3)
	{
		switch(var_1c817c65)
		{
			case 0:
			case 1:
			case 2:
			{
				for(i = 0; i < 4; i++)
				{
					if(isdefined(var_8ba5929))
					{
						var_d2753f39 = self stats::get_stat(self.doa.var_bcfd90a5, i, #"highest_score");
						var_f0ac2041 = self stats::get_stat(self.doa.var_bcfd90a5, i, #"hash_1ba322b9218ca4e8");
						var_5598fe58 = self stats::get_stat(self.doa.var_bcfd90a5, i, #"hash_16bf05d4f1efc4eb");
						gems = self stats::get_stat(self.doa.var_bcfd90a5, i, #"gems");
						var_7d9324c = (var_f0ac2041 << 16) + var_5598fe58;
						self stats::set_stat(#"hash_4e2b235aab294a3a", #"generic", var_8ba5929, var_7d9324c);
						var_8ba5929++;
						self stats::set_stat(#"hash_4e2b235aab294a3a", #"generic", var_8ba5929, var_d2753f39);
						var_8ba5929++;
						self stats::set_stat(#"hash_4e2b235aab294a3a", #"generic", var_8ba5929, gems);
						var_8ba5929++;
					}
					self stats::set_stat(self.doa.var_bcfd90a5, i, #"hash_1ba322b9218ca4e8", 0);
					self stats::set_stat(self.doa.var_bcfd90a5, i, #"highest_score", 0);
					self stats::set_stat(self.doa.var_bcfd90a5, i, #"hash_16bf05d4f1efc4eb", 0);
					self stats::set_stat(self.doa.var_bcfd90a5, i, #"gems", 0);
					self stats::set_stat(self.doa.var_bcfd90a5, i, #"version", 3);
				}
				break;
			}
		}
	}
	self stats::set_stat(#"hash_64fd75a9ce18b89f", #"version", 3);
	self stats::set_stat(self.doa.var_bcfd90a5, idx, #"version", 3);
}

/*
	Name: function_9daadcaa
	Namespace: namespace_d2efac9a
	Checksum: 0xE12FABAC
	Offset: 0x1B10
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_9daadcaa(stat_name, value)
{
	self stats::set_stat(#"afteractionreportstats", stat_name, value);
}

/*
	Name: function_4ac57fbe
	Namespace: namespace_d2efac9a
	Checksum: 0xA898099A
	Offset: 0x1B58
	Size: 0x11DE
	Parameters: 1
	Flags: None
*/
function function_4ac57fbe(var_977f0d07)
{
	if(!isdefined(var_977f0d07))
	{
		var_977f0d07 = 0;
	}
	if(isbot(self) || self istestclient())
	{
		return;
	}
	if(!isdefined(self.doa))
	{
		return;
	}
	if(!sessionmodeisonlinegame())
	{
		return;
	}
	if(is_true(level.var_87d7c3ab))
	{
		return;
	}
	if(is_true(level.doa.var_98e0f258))
	{
		var_376f59e0 = namespace_8c04284b::function_ef369bae();
		if(var_376f59e0 < 1.03)
		{
			var_f0ac2041 = self stats::get_stat(#"hash_64fd75a9ce18b89f", #"hash_5a6bd78423046ffb");
			if(level.doa.roundnumber > var_f0ac2041)
			{
				self stats::set_stat(#"hash_64fd75a9ce18b89f", #"hash_5a6bd78423046ffb", level.doa.roundnumber);
			}
		}
	}
	if(!is_true(level.doa.var_a87ecf08))
	{
		idx = getplayers().size - 1;
		var_376f59e0 = namespace_8c04284b::function_ef369bae();
		playercount = int(var_376f59e0 + 0.95);
		var_a3a73430 = math::clamp(playercount - 1, 0, 3);
		idx = var_a3a73430;
		if(is_true(level.var_96f7e84e))
		{
			idx = 0;
		}
		self function_b4dfdc63(idx);
		self stats::set_stat(#"hash_728e8b5a7105e67b", #"lastround", level.doa.roundnumber);
		self stats::set_stat(#"hash_728e8b5a7105e67b", #"lastscore", self.doa.score.points);
		self stats::set_stat(#"hash_728e8b5a7105e67b", #"hash_200d869fc17e4b89", self.doa.score.var_33ae24);
		self stats::set_stat(#"hash_728e8b5a7105e67b", #"hash_3ad474827eac07ba", self.doa.score.killstotal);
		self stats::set_stat(#"hash_728e8b5a7105e67b", #"hash_37ba624819b13566", self.doa.score.var_267d0586);
		self function_9daadcaa(#"total_points", self.doa.score.points);
		self function_9daadcaa(#"kills", self.doa.score.killstotal);
		self.pers[#"deaths"] = self.doa.score.var_267d0586;
		self function_9daadcaa(#"deaths", self.doa.score.var_267d0586);
		if(!is_true(self.disconnecting))
		{
			self globallogic_score::incpersstat(#"deaths", self.doa.score.deaths, 1, 1);
		}
		if(!isdefined(self.pers[#"damagedone"]))
		{
			self.pers[#"damagedone"] = 0;
		}
		self persistence::set_recent_stat(0, 0, #"damage", int(self.pers[#"damagedone"] / 10));
		gamelength = int((gettime() - level.doa.gamestarttime) / 1000);
		self persistence::set_recent_stat(0, 0, #"timeplayed", gamelength);
		self function_9daadcaa(#"timeplayed", gamelength);
		self persistence::set_recent_stat(0, 0, #"timeplayed", int(gamelength));
		self stats::inc_stat(#"hash_64fd75a9ce18b89f", #"hash_662517d93580ed90", self.doa.score.var_c31799a1);
		self stats::inc_stat(self.doa.var_bcfd90a5, idx, #"gems", self.doa.score.var_c31799a1);
		self.doa.score.var_c31799a1 = 0;
		self stats::inc_stat(#"hash_64fd75a9ce18b89f", #"hash_33c5bfbb26aa533d", self.doa.score.kills);
		self stats::inc_stat(self.doa.var_bcfd90a5, idx, #"kills", self.doa.score.kills);
		self.doa.score.kills = 0;
		self stats::inc_stat(#"hash_64fd75a9ce18b89f", #"hash_2c68b416438cca27", self.doa.score.deaths);
		self stats::inc_stat(self.doa.var_bcfd90a5, idx, #"deaths", self.doa.score.deaths);
		self.doa.score.deaths = 0;
		self stats::inc_stat(#"hash_64fd75a9ce18b89f", #"hash_37fcc31e34bbeb9e", self.doa.score.var_4e33830e);
		self stats::inc_stat(self.doa.var_bcfd90a5, idx, #"hash_556f3c8bf3274ed4", self.doa.score.var_4e33830e);
		self.doa.score.var_4e33830e = 0;
		self stats::inc_stat(#"hash_64fd75a9ce18b89f", #"hash_1328d5cabc7889be", self.doa.var_7e445455);
		self.doa.var_7e445455 = 0;
		self stats::set_stat(#"hash_64fd75a9ce18b89f", #"hash_191ee9b05c5a28d0", self.doa.var_25f4de97);
		self stats::set_stat(#"hash_64fd75a9ce18b89f", #"hash_72018b7229672430", self.doa.var_f240d1a5);
		if(isdefined(self.var_90b81208) && self.var_90b81208 <= 4)
		{
			self stats::inc_stat(#"hash_64fd75a9ce18b89f", #"hash_30c3377dea0ec672", self.doa.var_90e186f2);
			self stats::inc_stat(self.doa.var_bcfd90a5, idx, #"hash_16bf05d4f1efc4eb", self.doa.var_90e186f2);
			self.doa.var_90e186f2 = 0;
			var_f0ac2041 = self stats::get_stat(#"hash_64fd75a9ce18b89f", #"hash_264b2ce1e929e63");
			if(level.doa.roundnumber > var_f0ac2041)
			{
				self stats::set_stat(#"hash_64fd75a9ce18b89f", #"hash_264b2ce1e929e63", level.doa.roundnumber);
			}
			highscore = self stats::get_stat(#"hash_64fd75a9ce18b89f", #"hash_783086b558e2dc6d");
			if(self.doa.score.points > highscore)
			{
				self stats::set_stat(#"hash_64fd75a9ce18b89f", #"hash_783086b558e2dc6d", self.doa.score.points);
			}
			var_f0ac2041 = self stats::get_stat(self.doa.var_bcfd90a5, idx, #"hash_1ba322b9218ca4e8");
			if(level.doa.roundnumber > var_f0ac2041)
			{
				self stats::set_stat(self.doa.var_bcfd90a5, idx, #"hash_1ba322b9218ca4e8", level.doa.roundnumber);
			}
			highscore = self stats::get_stat(self.doa.var_bcfd90a5, idx, #"highest_score");
			if(self.doa.score.points > highscore)
			{
				self stats::set_stat(self.doa.var_bcfd90a5, idx, #"highest_score", self.doa.score.points);
			}
		}
		var_c35ec960 = self stats::get_stat(#"hash_64fd75a9ce18b89f", #"hash_38521164875979cf");
		var_c35ec960 = var_c35ec960 + self.doa.score.var_96798a01;
		if(var_c35ec960 >= 999999999)
		{
			val = stats::function_441050ca(#"hash_40b4e16c1b39585");
			if(val == 0)
			{
				self stats::function_dad108fa(#"hash_40b4e16c1b39585", 1);
			}
		}
		self stats::set_stat(#"hash_64fd75a9ce18b89f", #"hash_38521164875979cf", var_c35ec960);
		self.doa.score.var_96798a01 = 0;
		namespace_1e25ad94::debugmsg("Progress towards doa_darkops_score = " + var_c35ec960);
	}
	if(var_977f0d07)
	{
		if(isdefined(self.doa.var_d362196a) && self.doa.var_d362196a > 0 && getdvarint(#"hash_262e5087a510a8dc", 0))
		{
			var_f406f7e3 = getdvarstring(#"hash_34643bedf53971b2", "");
			total_time = int(self.doa.var_d362196a * getdvarfloat(#"hash_351b291e47172d46", 1));
			self.doa.var_d362196a = 0;
			if(var_f406f7e3 != "")
			{
				currxp = self rank::getrankxp();
				xpearned = 0;
				if(isdefined(self.pers[#"hash_43ad5d1b08145b1f"]))
				{
					xpearned = currxp - self.pers[#"hash_43ad5d1b08145b1f"];
				}
				self.pers[#"hash_43ad5d1b08145b1f"] = currxp;
				var_90f98f51 = int(self function_c52bcf79() * 100);
				var_d0a27bc3 = int(self getxpscale() * 100);
				var_524ab934 = self function_d40f1a0e();
				var_68441d6f = self function_325dc923();
				namespace_1e25ad94::debugmsg("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
				namespace_1e25ad94::debugmsg((((((("DOA Battle Pass XP (" + self.name) + "): reported time played: ") + total_time) + ", XP Modifier: ") + var_90f98f51) + ", Xp Earned: ") + xpearned);
				namespace_1e25ad94::debugmsg("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
				var_ae857992 = getdvarint(#"hash_60d812bef0f782fb", 0);
				self function_cce105c8(hash(var_f406f7e3), 1, int(var_ae857992), 2, total_time, 3, var_90f98f51, 4, xpearned, 5, var_d0a27bc3, 6, var_524ab934, 7, var_68441d6f);
			}
		}
	}
	uploadstats(self);
	self function_4835d26a();
}

/*
	Name: function_47498d07
	Namespace: namespace_d2efac9a
	Checksum: 0xBB14CFEF
	Offset: 0x2D40
	Size: 0xE8
	Parameters: 1
	Flags: None
*/
function function_47498d07(gameover)
{
	if(!isdefined(gameover))
	{
		gameover = 0;
	}
	players = getplayers();
	foreach(player in players)
	{
		player function_4ac57fbe(getdvarint(#"hash_73899531201aebda", 0) && gameover);
	}
}

/*
	Name: function_ca76d4a
	Namespace: namespace_d2efac9a
	Checksum: 0x671A7C8A
	Offset: 0x2E30
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_ca76d4a()
{
	function_f4f6d8a1();
	stats::function_ca76d4a();
}

