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
	Name: init
	Namespace: namespace_eccff4fb
	Checksum: 0x3F02335F
	Offset: 0x1B8
	Size: 0x1D4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.doa.var_aeb69827 = array(0, 0, 22, 40, 80, 160, 350, 850, 1500, 3000, 5000);
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
	Checksum: 0x86570F9D
	Offset: 0x398
	Size: 0x54
	Parameters: 1
	Flags: Linked
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
	Checksum: 0xE4CAD397
	Offset: 0x3F8
	Size: 0x58
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xB3A2D9AF
	Offset: 0x458
	Size: 0x20E
	Parameters: 0
	Flags: Linked
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
	Name: function_6c15a74e
	Namespace: namespace_eccff4fb
	Checksum: 0x79729C28
	Offset: 0x670
	Size: 0xC4
	Parameters: 2
	Flags: Linked
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
	Checksum: 0x91A0B5F1
	Offset: 0x740
	Size: 0xB4
	Parameters: 2
	Flags: Linked
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
	Checksum: 0x348B6CDA
	Offset: 0x800
	Size: 0x1A2
	Parameters: 2
	Flags: Linked
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
	Checksum: 0xBB5A2594
	Offset: 0x9B0
	Size: 0x386
	Parameters: 2
	Flags: Linked
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
	Checksum: 0x2433B09D
	Offset: 0xD40
	Size: 0x64
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x2C6539A3
	Offset: 0xDB0
	Size: 0x4B6
	Parameters: 0
	Flags: Linked
*/
function function_1dd66aa1()
{
	self notify("60a65082f3f03e43");
	self endon("60a65082f3f03e43");
	self endon(#"disconnect");
	self.doa.var_ecfd5bbd = 1;
	self.doa.score.var_a928c52e = 0;
	deathorigin = self.origin;
	var_8508d81d = math::clamp(int(self.doa.score.gems / 5), 0, 25);
	var_84128236 = 2;
	if(var_8508d81d > 0)
	{
		var_70c7d050 = int(self.doa.score.gems / var_8508d81d);
		var_817e0b00 = function_4c9d8712(self.doa.score.var_194c59ae - 1);
		var_6f324de4 = var_70c7d050;
		while(self.doa.score.gems > 0)
		{
			decrement = (int((self.doa.score.var_194c59ae * self.doa.score.var_194c59ae) * (self.doa.score.var_194c59ae / 9))) + 1;
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
	self.doa.score.gems = 0;
	self.doa.score.var_194c59ae = (self doa_fate::function_d438e371() ? 2 : 1);
	self.doa.score.var_e49e3de7 = function_4c9d8712(self.doa.score.var_194c59ae);
	self.doa.score.var_6ec1ad9d = 0;
	self.doa.var_ecfd5bbd = undefined;
	self notify(#"hash_4e4e55afb99d1a6b");
}

/*
	Name: function_41ce2473
	Namespace: namespace_eccff4fb
	Checksum: 0x2BD6588D
	Offset: 0x1270
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_41ce2473(parms)
{
	if(isdefined(parms.eattacker) && isplayer(parms.eattacker))
	{
		parms.eattacker.doa.score.kills++;
		parms.eattacker.doa.score.killstotal++;
		parms.eattacker.kills++;
	}
}

/*
	Name: function_5ce79923
	Namespace: namespace_eccff4fb
	Checksum: 0x8092E6A0
	Offset: 0x1310
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function function_5ce79923()
{
	return self.doa.score.points;
}

/*
	Name: function_f3b382da
	Namespace: namespace_eccff4fb
	Checksum: 0x48BE3C7C
	Offset: 0x1338
	Size: 0x144
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x1CAC9163
	Offset: 0x1488
	Size: 0x6A2
	Parameters: 0
	Flags: Linked
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
			self.doa.score.var_5eac81d0 = self.doa.score.points + 200000;
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
	Checksum: 0xDC1E6C85
	Offset: 0x1B38
	Size: 0x28
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xC06D4A31
	Offset: 0x1B68
	Size: 0x28
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x17BD708
	Offset: 0x1B98
	Size: 0x28
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xCF31BB18
	Offset: 0x1BC8
	Size: 0x28
	Parameters: 0
	Flags: Linked
*/
function function_fd3d9ee0()
{
	if(self doa_fate::function_d17f9bcb())
	{
		return 10;
	}
	return 9;
}

