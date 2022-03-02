#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_350cffecd05ef6cf;
#using script_3bbf85ab4cb9f3c2;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_47fb62300ac0bd60;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_6b6510e124bad778;
#using script_74a56359b7d02ab6;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_eccff4fb;

/*
	Name: function_dd55f495
	Namespace: namespace_eccff4fb
	Checksum: 0xD3D42130
	Offset: 0x1E0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_dd55f495()
{
	level notify(134765913);
}

/*
	Name: init
	Namespace: namespace_eccff4fb
	Checksum: 0x22B190CF
	Offset: 0x200
	Size: 0x1D4
	Parameters: 0
	Flags: None
*/
function init()
{
	level.doa.var_aeb69827 = array(0, 0, 22, 40, 80, 160, 350, 850, 1500, 2800, 4800);
	level.doa.var_88be0b68 = 0;
	foreach(item in level.doa.var_aeb69827)
	{
		level.doa.var_88be0b68 = level.doa.var_88be0b68 + item;
	}
	level.doa.var_c3842d93 = array(0);
	total = 0;
	for(i = 1; i <= 9; i++)
	{
		next = level.doa.var_aeb69827[i + 1];
		level.doa.var_c3842d93[level.doa.var_c3842d93.size] = total + next;
		total = total + next;
	}
	callback::on_ai_killed(&function_41ce2473);
}

/*
	Name: function_4c9d8712
	Namespace: namespace_eccff4fb
	Checksum: 0x9004B64C
	Offset: 0x3E0
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_4c9d8712(var_49838c63)
{
	/#
		assert(var_49838c63 < level.doa.var_c3842d93.size);
	#/
	return level.doa.var_c3842d93[var_49838c63];
}

/*
	Name: initplayer
	Namespace: namespace_eccff4fb
	Checksum: 0x44D4D4F1
	Offset: 0x440
	Size: 0x58
	Parameters: 0
	Flags: None
*/
function initplayer()
{
	self.doa.score = spawnstruct();
	self function_c05eb7e6();
	self.doa.score.var_4e33830e = 1;
}

/*
	Name: function_c05eb7e6
	Namespace: namespace_eccff4fb
	Checksum: 0x8A86212D
	Offset: 0x4A0
	Size: 0x20E
	Parameters: 0
	Flags: None
*/
function function_c05eb7e6()
{
	self.doa.score.points = 0;
	self.doa.score.var_1397c196 = 0;
	self.doa.score.var_96798a01 = 0;
	self.doa.score.kills = 0;
	self.doa.score.killstotal = 0;
	self.doa.score.var_194c59ae = 1;
	self.doa.score.var_33ae24 = 0;
	self.doa.score.var_c31799a1 = 0;
	self.doa.score.gems = 0;
	self.doa.score.var_a928c52e = 0;
	self.doa.score.var_e49e3de7 = function_4c9d8712(self.doa.score.var_194c59ae);
	self.doa.score.var_6ec1ad9d = 0;
	self.doa.score.deaths = 0;
	self.doa.score.var_267d0586 = 0;
	self.doa.score.keys = 0;
	self.doa.score.bombs = 1;
	self.doa.score.var_7a3c00a0 = 2;
	self.doa.score.lives = 3;
	self.doa.score.var_5eac81d0 = 200000;
}

/*
	Name: function_4ae6488b
	Namespace: namespace_eccff4fb
	Checksum: 0x5CC550A2
	Offset: 0x6B8
	Size: 0x45E
	Parameters: 0
	Flags: None
*/
function function_4ae6488b()
{
	self notify("56ed635d8597ee64");
	self endon("56ed635d8597ee64");
	self endon(#"disconnect");
	level endon(#"game_over");
	self.doa.score.var_b5acb7a2 = 0;
	self.doa.score.var_14b9da0e = 0;
	self.doa.score.var_a4105a25 = 0;
	for(i = 0; i < 60; i++)
	{
		var_49787e19[i] = 0;
	}
	self.doa.score.var_8bd11e9c = 0;
	self.doa.score.var_2b624d62 = 0;
	self.doa.score.var_ccfd3a86 = 0;
	for(i = 0; i < 60; i++)
	{
		var_bf384b50[i] = 0;
	}
	idx = 0;
	var_18f7f8fe = idx + 1;
	loops = 0;
	var_6399b44b = 0;
	var_9225fc4e = 0;
	var_fd869b30 = 0;
	var_cd4c12da = 0;
	samples = 0;
	var_e7a7a8d9 = self.doa.score.points;
	var_86cc83fe = self.doa.score.killstotal;
	while(true)
	{
		wait(1);
		var_d7ab2705 = self.doa.score.points - var_e7a7a8d9;
		var_e7a7a8d9 = self.doa.score.points;
		var_ebf015ab = self.doa.score.killstotal - var_86cc83fe;
		var_86cc83fe = self.doa.score.killstotal;
		if(level.doa.world_state != 0)
		{
			continue;
		}
		if(isdefined(level.doa.var_6f3d327))
		{
			continue;
		}
		if(level flag::get("doa_round_spawning") == 0)
		{
			continue;
		}
		var_49787e19[idx] = var_d7ab2705;
		var_6399b44b = var_6399b44b - var_49787e19[var_18f7f8fe];
		var_6399b44b = var_6399b44b + var_49787e19[idx];
		var_bf384b50[idx] = var_ebf015ab;
		var_9225fc4e = var_9225fc4e - var_bf384b50[var_18f7f8fe];
		var_9225fc4e = var_9225fc4e + var_bf384b50[idx];
		idx = (idx + 1) % 60;
		var_18f7f8fe = (idx + 1) % 60;
		samples++;
		if(var_6399b44b > self.doa.score.var_a4105a25)
		{
			self.doa.score.var_a4105a25 = var_6399b44b;
		}
		if(var_9225fc4e > self.doa.score.var_ccfd3a86)
		{
			self.doa.score.var_ccfd3a86 = var_9225fc4e;
		}
		self.doa.score.var_b5acb7a2 = var_6399b44b;
		self.doa.score.var_8bd11e9c = var_9225fc4e;
		var_fd869b30 = var_fd869b30 + var_6399b44b;
		var_cd4c12da = var_cd4c12da + var_9225fc4e;
		self.doa.score.var_14b9da0e = var_fd869b30 / samples;
		self.doa.score.var_2b624d62 = var_cd4c12da / samples;
	}
}

/*
	Name: function_6c15a74e
	Namespace: namespace_eccff4fb
	Checksum: 0x74D3F57A
	Offset: 0xB20
	Size: 0xC4
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
	self.doa.score.keys = self.doa.score.keys + amount;
	/#
		assert(self.doa.score.keys <= self function_9d6bf0a9(), "");
	#/
	namespace_d2efac9a::function_6c15a74e(amount, commit);
}

/*
	Name: function_849a9028
	Namespace: namespace_eccff4fb
	Checksum: 0x8BFCBCF0
	Offset: 0xBF0
	Size: 0xB4
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
	self.doa.score.keys = self.doa.score.keys - amount;
	/#
		assert(self.doa.score.keys >= 0, "");
	#/
	namespace_d2efac9a::function_849a9028(amount, commit);
}

/*
	Name: enemykill
	Namespace: namespace_eccff4fb
	Checksum: 0x2ED4534B
	Offset: 0xCB0
	Size: 0x1A2
	Parameters: 2
	Flags: None
*/
function enemykill(type, score)
{
	if(!isdefined(score))
	{
		score = 100;
	}
	if(!isdefined(self.doa.score))
	{
		return;
	}
	var_194c59ae = self.doa.score.var_194c59ae;
	if(is_true(self.doa.var_3e81d24c) && level.doa.world_state == 0 && !is_true(level.doa.var_318aa67a))
	{
		if(var_194c59ae < 4)
		{
			var_194c59ae = 4;
		}
	}
	self.doa.score.var_1397c196 = self.doa.score.var_1397c196 + (score * var_194c59ae);
	if(self.doa.score.var_1397c196 > 115115115)
	{
		self.doa.score.var_1397c196 = 115115115;
	}
	self.doa.score.var_96798a01 = self.doa.score.var_96798a01 + (score * self.doa.score.var_194c59ae);
}

/*
	Name: function_9e8690e0
	Namespace: namespace_eccff4fb
	Checksum: 0x2D83E70E
	Offset: 0xE60
	Size: 0x386
	Parameters: 2
	Flags: None
*/
function function_9e8690e0(item, type)
{
	if(!isdefined(self.doa.score))
	{
		return;
	}
	score = 0;
	gems = 0.2;
	switch(type)
	{
		case 1:
		{
			score = 500;
			gems = 1;
			break;
		}
		case 2:
		{
			score = 250;
			break;
		}
		case 3:
		{
			score = 150;
			break;
		}
		case 5:
		{
			score = 100;
			break;
		}
		case 4:
		{
			score = 75;
			break;
		}
		case 7:
		{
			score = 50;
			break;
		}
		case 6:
		{
			score = 25;
			break;
		}
		case 8:
		{
			var_6cec06ef = int(math::clamp(item.scale, 1, 10));
			score = 250 * var_6cec06ef;
			gems = item.var_d34e5888;
			self.headshots++;
			self.doa.score.var_c31799a1++;
			self.doa.score.var_33ae24++;
			if(item.scale > 8.5)
			{
				self thread namespace_6e90e490::function_47e11416(4);
			}
			break;
		}
	}
	var_194c59ae = self.doa.score.var_194c59ae;
	if(is_true(self.doa.var_3e81d24c) && level.doa.world_state == 0 && !is_true(level.doa.var_318aa67a))
	{
		if(var_194c59ae < 4)
		{
			var_194c59ae = 4;
		}
	}
	self.doa.score.var_1397c196 = self.doa.score.var_1397c196 + (score * var_194c59ae);
	self.doa.score.var_96798a01 = self.doa.score.var_96798a01 + (score * var_194c59ae);
	if(self.doa.score.var_1397c196 > 115115115)
	{
		self.doa.score.var_1397c196 = 115115115;
	}
	self.doa.score.var_a928c52e = self.doa.score.var_a928c52e + gems;
}

/*
	Name: function_f6ac4585
	Namespace: namespace_eccff4fb
	Checksum: 0xF0C4B3F7
	Offset: 0x11F0
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_f6ac4585()
{
	self.doa.score.deaths++;
	self.doa.score.var_267d0586++;
	if(!is_true(level.var_40d076a7))
	{
		self thread function_1dd66aa1();
	}
}

/*
	Name: function_1dd66aa1
	Namespace: namespace_eccff4fb
	Checksum: 0x959A0903
	Offset: 0x1260
	Size: 0x566
	Parameters: 0
	Flags: None
*/
function function_1dd66aa1()
{
	self notify("ccc50b6453d60a9");
	self endon("ccc50b6453d60a9");
	self endon(#"disconnect");
	self.doa.var_ecfd5bbd = 1;
	self.doa.score.var_a928c52e = 0;
	deathorigin = self.origin;
	var_8508d81d = math::clamp(int(self.doa.score.gems / 5), 0, 40);
	var_84128236 = 2;
	if(var_8508d81d > 0)
	{
		var_70c7d050 = int(self.doa.score.gems / var_8508d81d);
		var_817e0b00 = function_4c9d8712(self.doa.score.var_194c59ae - 1);
		var_6f324de4 = var_70c7d050;
		while(self.doa.score.gems > 0 && is_true(self.laststand))
		{
			decrement = (int((self.doa.score.var_194c59ae * self.doa.score.var_194c59ae) * (self.doa.score.var_194c59ae / 9))) + self.doa.score.var_194c59ae;
			self.doa.score.gems = self.doa.score.gems - decrement;
			if(self.doa.score.gems < 0)
			{
				self.doa.score.gems = 0;
			}
			var_6f324de4 = var_6f324de4 - decrement;
			if(var_6f324de4 <= 0)
			{
				var_6f324de4 = var_70c7d050;
				level doa_pickups::function_b8f6a8cd(undefined, deathorigin, 1, undefined, 1);
			}
			if(self.doa.score.gems <= var_817e0b00)
			{
				self.doa.score.var_194c59ae--;
				if(self.doa.score.var_194c59ae < 1)
				{
					self.doa.score.var_194c59ae = 1;
				}
				if(self doa_fate::function_d438e371() && self.doa.score.var_194c59ae < 2)
				{
					break;
				}
				self.doa.score.var_e49e3de7 = function_4c9d8712(self.doa.score.var_194c59ae);
				var_817e0b00 = function_4c9d8712(self.doa.score.var_194c59ae - 1);
				self.doa.score.var_6ec1ad9d = var_817e0b00;
			}
			waitframe(1);
		}
	}
	if(self.doa.score.gems <= 0)
	{
		self.doa.score.gems = 0;
		self.doa.score.var_194c59ae = (self doa_fate::function_d438e371() ? 2 : 1);
		self.doa.score.var_6ec1ad9d = 0;
	}
	self.doa.score.var_e49e3de7 = function_4c9d8712(self.doa.score.var_194c59ae);
	if(self.doa.score.var_6ec1ad9d == self.doa.score.var_e49e3de7)
	{
		self.doa.score.var_6ec1ad9d = self.doa.score.var_e49e3de7 - 1;
	}
	self.doa.var_ecfd5bbd = undefined;
	self notify(#"hash_4e4e55afb99d1a6b");
}

/*
	Name: function_41ce2473
	Namespace: namespace_eccff4fb
	Checksum: 0xB4E53E98
	Offset: 0x17D0
	Size: 0xAE
	Parameters: 1
	Flags: None
*/
function function_41ce2473(parms)
{
	if(isdefined(parms.eattacker) && isplayer(parms.eattacker))
	{
		parms.eattacker.doa.score.kills++;
		parms.eattacker.doa.score.killstotal++;
		parms.eattacker.kills++;
		parms.eattacker.doa.var_a8b7e1f4 = gettime();
	}
}

/*
	Name: function_5ce79923
	Namespace: namespace_eccff4fb
	Checksum: 0xEC8ADE2A
	Offset: 0x1888
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function function_5ce79923()
{
	return self.doa.score.points;
}

/*
	Name: function_f3b382da
	Namespace: namespace_eccff4fb
	Checksum: 0xE475AF92
	Offset: 0x18B0
	Size: 0x144
	Parameters: 1
	Flags: None
*/
function function_f3b382da(me)
{
	players = namespace_7f5aeb59::function_23e1f90f();
	if(players.size == 1)
	{
		return false;
	}
	if(me.doa.score.points == 0)
	{
		return false;
	}
	if(me.doa.score.points == 115115115)
	{
		return true;
	}
	foreach(guy in players)
	{
		if(guy == me)
		{
			continue;
		}
		if(guy.doa.score.points >= me.doa.score.points)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_7752515d
	Namespace: namespace_eccff4fb
	Checksum: 0x650A0679
	Offset: 0x1A00
	Size: 0x74A
	Parameters: 0
	Flags: None
*/
function function_7752515d()
{
	if(!isdefined(self.doa) || !isdefined(self.doa.score))
	{
		return;
	}
	if(!is_true(self.doa.var_ecfd5bbd) && self.doa.score.gems < self.doa.score.var_a928c52e)
	{
		delta = self.doa.score.var_a928c52e - self.doa.score.gems;
		if(delta >= self.doa.score.var_194c59ae)
		{
			increment = self.doa.score.var_194c59ae;
		}
		else
		{
			increment = 0.05;
		}
		self.doa.score.gems = self.doa.score.gems + increment;
		if(self.doa.score.gems > level.doa.var_88be0b68)
		{
			self.doa.score.gems = level.doa.var_88be0b68;
			if(!is_true(self.doa.score.var_f283899e))
			{
				self.doa.score.var_f283899e = 1;
				self thread doa_fate::function_42755584();
			}
		}
		if(self.doa.score.gems > self.doa.score.var_e49e3de7)
		{
			if(self.doa.score.var_194c59ae <= 9)
			{
				self.doa.score.var_6ec1ad9d = self.doa.score.var_e49e3de7;
				self.doa.score.var_e49e3de7 = function_4c9d8712(self.doa.score.var_194c59ae + 1);
			}
			self.doa.score.var_194c59ae++;
			if(self.doa.score.var_194c59ae >= 9)
			{
				self.doa.score.var_194c59ae = 9;
			}
			self namespace_d2efac9a::function_a9f863ca(self.doa.score.var_194c59ae);
		}
	}
	if(self.doa.score.points < self.doa.score.var_1397c196)
	{
		delta = self.doa.score.var_1397c196 - self.doa.score.points;
		frac = int(0.025 * delta);
		frac = (int(frac / 25)) * 25;
		if(frac < 25)
		{
			frac = 25;
		}
		self.doa.score.points = self.doa.score.points + frac;
		if(self.doa.score.points > self.doa.score.var_1397c196)
		{
			self.doa.score.points = self.doa.score.var_1397c196;
		}
		if(self.doa.score.points > self.doa.score.var_5eac81d0)
		{
			if(self.doa.score.lives < self function_77cbfb85())
			{
				level doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_extra_life"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
			}
			else
			{
				roll = randomint(100);
				if(roll < 30)
				{
					level doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_skeleton_fb"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
				}
				else
				{
					if(roll < 60)
					{
						level doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_boxing_glove"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
					}
					else
					{
						level doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_coat_of_arms"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
					}
				}
			}
			if(self doa_fate::function_b01c3b20())
			{
				self.doa.score.var_5eac81d0 = self.doa.score.var_5eac81d0 + 125000;
			}
			else
			{
				self.doa.score.var_5eac81d0 = self.doa.score.var_5eac81d0 + 200000;
			}
		}
	}
	if(self.doa.score.points > 115115115)
	{
		self.doa.score.points = 115115115;
	}
	self.score = int(self.doa.score.points / 25);
}

/*
	Name: function_77cbfb85
	Namespace: namespace_eccff4fb
	Checksum: 0x32B0834F
	Offset: 0x2158
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function function_77cbfb85()
{
	if(self doa_fate::function_b01c3b20())
	{
		return 10;
	}
	return 9;
}

/*
	Name: function_4091beb5
	Namespace: namespace_eccff4fb
	Checksum: 0x3E6491C2
	Offset: 0x2188
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function function_4091beb5()
{
	if(self doa_fate::function_8a19ece())
	{
		return 10;
	}
	return 9;
}

/*
	Name: function_9d6bf0a9
	Namespace: namespace_eccff4fb
	Checksum: 0x2492063A
	Offset: 0x21B8
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function function_9d6bf0a9()
{
	if(self doa_fate::function_d438e371())
	{
		return 10;
	}
	return 9;
}

/*
	Name: function_fd3d9ee0
	Namespace: namespace_eccff4fb
	Checksum: 0x131AC190
	Offset: 0x21E8
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function function_fd3d9ee0()
{
	if(self doa_fate::function_d17f9bcb())
	{
		return 10;
	}
	return 9;
}

