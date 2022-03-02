#namespace gameobjects;

/*
	Name: function_e553e480
	Namespace: gameobjects
	Checksum: 0x994AF1CA
	Offset: 0x60
	Size: 0xA2
	Parameters: 0
	Flags: Linked
*/
function function_e553e480()
{
	if(!isdefined(self.users))
	{
		self.users = [];
	}
	self.var_a0ff5eb8 = 0;
	self.curprogress = 0;
	self.userate = 0;
	self.claimplayer = undefined;
	self.lastclaimtime = 0;
	self.claimgraceperiod = 0;
	self.mustmaintainclaim = 0;
	self.cancontestclaim = 0;
	self function_58901d83();
	self.var_5f35f19a = #"none";
}

/*
	Name: function_818d69ee
	Namespace: gameobjects
	Checksum: 0x4EAC7EDD
	Offset: 0x110
	Size: 0x92
	Parameters: 1
	Flags: Linked
*/
function function_818d69ee(user)
{
	if(!isdefined(self.users[user]))
	{
		self.users[user] = {};
	}
	if(!isdefined(self.users[user].touching))
	{
		self.users[user].touching = {#players:[], #rate:0, #num:0};
	}
}

/*
	Name: function_136c2270
	Namespace: gameobjects
	Checksum: 0x51E5EE9B
	Offset: 0x1B0
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function function_136c2270(user)
{
	if(!isdefined(self.users[user]))
	{
		self.users[user] = {};
	}
	if(!isdefined(self.users[user].var_5b307a20))
	{
		self.users[user].var_5b307a20 = [];
	}
}

/*
	Name: function_a1839d6b
	Namespace: gameobjects
	Checksum: 0x6C1A5B77
	Offset: 0x220
	Size: 0x134
	Parameters: 3
	Flags: Linked
*/
function function_a1839d6b(user, player, key)
{
	/#
		assert(isdefined(self.users[user]));
	#/
	/#
		assert(isdefined(self.users[user].var_5b307a20));
	#/
	if(!isdefined(self.users[user].var_5b307a20[key]))
	{
		contribution = {#contribution:0, #player:player};
		self.users[user].var_5b307a20[key] = contribution;
	}
	else
	{
		contribution = self.users[user].var_5b307a20[key];
	}
	if(!isdefined(contribution.player))
	{
		contribution.player = player;
	}
	contribution.starttime = gettime();
	contribution.var_e22ea52b = 1;
	return self.users[user].var_5b307a20[key];
}

/*
	Name: function_98aae7cf
	Namespace: gameobjects
	Checksum: 0x61CAAD3E
	Offset: 0x360
	Size: 0x7E
	Parameters: 0
	Flags: Linked
*/
function function_98aae7cf()
{
	foreach(user in self.users)
	{
		user.var_5b307a20 = undefined;
	}
}

/*
	Name: function_bd47b0c7
	Namespace: gameobjects
	Checksum: 0x6D830BB8
	Offset: 0x3E8
	Size: 0x14C
	Parameters: 0
	Flags: None
*/
function function_bd47b0c7()
{
	function_98aae7cf();
	foreach(user_name, user in self.users)
	{
		if(user.touching.num > 0)
		{
			function_136c2270(user_name);
			foreach(player in user.touching.players)
			{
				function_a1839d6b(user_name, player.player, var_5717fa0c);
			}
		}
	}
}

/*
	Name: function_f30290b
	Namespace: gameobjects
	Checksum: 0x37B592F9
	Offset: 0x540
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_f30290b(user, key)
{
	if(isdefined(self.users[user]) && isdefined(self.users[user].var_5b307a20))
	{
		self.users[user].var_5b307a20[key] = undefined;
	}
}

/*
	Name: function_339d0e91
	Namespace: gameobjects
	Checksum: 0xB8616D10
	Offset: 0x5A8
	Size: 0xA0
	Parameters: 0
	Flags: None
*/
function function_339d0e91()
{
	total = 0;
	foreach(var_b2dad138 in self.users)
	{
		total = total + var_b2dad138.touching.num;
	}
	return total;
}

/*
	Name: function_3a7a2963
	Namespace: gameobjects
	Checksum: 0x879262BC
	Offset: 0x650
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_3a7a2963(var_77efb18)
{
	total = 0;
	foreach(var_b2dad138 in self.users)
	{
		if(user_name == var_77efb18)
		{
			continue;
		}
		total = total + var_b2dad138.touching.num;
	}
	return total;
}

/*
	Name: function_3a29539b
	Namespace: gameobjects
	Checksum: 0x5194E218
	Offset: 0x710
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function function_3a29539b(var_77efb18)
{
	foreach(var_b2dad138 in self.users)
	{
		if(user_name == var_77efb18)
		{
			continue;
		}
		if(var_b2dad138.touching.num > 0)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: get_num_touching
	Namespace: gameobjects
	Checksum: 0xB917DBD1
	Offset: 0x7C0
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function get_num_touching(user)
{
	if(!isdefined(self.users[user]))
	{
		return 0;
	}
	return self.users[user].touching.num;
}

/*
	Name: function_e4cad37
	Namespace: gameobjects
	Checksum: 0x1ECA88E5
	Offset: 0x808
	Size: 0xEA
	Parameters: 0
	Flags: None
*/
function function_e4cad37()
{
	var_95e19dc6 = [];
	foreach(var_c4f3dc93 in self.users)
	{
		if(var_c4f3dc93.touching.num > 0)
		{
			if(!isdefined(var_95e19dc6))
			{
				var_95e19dc6 = [];
			}
			else if(!isarray(var_95e19dc6))
			{
				var_95e19dc6 = array(var_95e19dc6);
			}
			var_95e19dc6[var_95e19dc6.size] = user;
		}
	}
	return var_95e19dc6;
}

/*
	Name: function_4e3386a8
	Namespace: gameobjects
	Checksum: 0xAEBD0DBE
	Offset: 0x900
	Size: 0x10
	Parameters: 1
	Flags: Linked
*/
function function_4e3386a8(team)
{
	return team;
}

/*
	Name: function_167d3a40
	Namespace: gameobjects
	Checksum: 0xCA4D44D
	Offset: 0x918
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function function_167d3a40()
{
	return self.ownerteam;
}

/*
	Name: function_b64fb43d
	Namespace: gameobjects
	Checksum: 0x65C2626B
	Offset: 0x930
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function function_b64fb43d()
{
	user = self function_167d3a40();
	if(!isdefined(self.users[user]))
	{
		return 0;
	}
	return self.users[user].touching.num;
}

/*
	Name: function_22c9de38
	Namespace: gameobjects
	Checksum: 0x8260EEB9
	Offset: 0x998
	Size: 0xA6
	Parameters: 2
	Flags: Linked
*/
function function_22c9de38(user, count)
{
	if(!isdefined(count))
	{
		count = 1;
	}
	/#
		assert(isdefined(self.users[user]));
	#/
	/#
		assert(isdefined(self.users[user].touching));
	#/
	self.users[user].touching.num = self.users[user].touching.num + count;
}

/*
	Name: function_26237f3c
	Namespace: gameobjects
	Checksum: 0xE0937A3A
	Offset: 0xA48
	Size: 0xE6
	Parameters: 2
	Flags: Linked
*/
function function_26237f3c(user, count)
{
	if(!isdefined(count))
	{
		count = 1;
	}
	/#
		assert(isdefined(self.users[user]));
	#/
	/#
		assert(isdefined(self.users[user].touching));
	#/
	self.users[user].touching.num = self.users[user].touching.num - count;
	if(self.users[user].touching.num < 1)
	{
		self.users[user].touching.num = 0;
	}
}

/*
	Name: function_5ea37c7c
	Namespace: gameobjects
	Checksum: 0xCEA5B6A9
	Offset: 0xB38
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function function_5ea37c7c(func)
{
	self.var_270e1029 = func;
}

/*
	Name: function_83eda4c0
	Namespace: gameobjects
	Checksum: 0x6B4C9BB7
	Offset: 0xB60
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_83eda4c0(user)
{
	var_5b1365c0 = self.users[user].touching.num;
	return self function_ce47d61c(var_5b1365c0);
}

/*
	Name: function_ce47d61c
	Namespace: gameobjects
	Checksum: 0xF79CA564
	Offset: 0xBB8
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_ce47d61c(var_5b1365c0)
{
	if(!isdefined(var_5b1365c0))
	{
		var_5b1365c0 = 0;
	}
	/#
		assert(self.var_9288c4c0 <= self.usetime);
	#/
	if(self.var_2084ae03 > 0)
	{
		var_5b1365c0 = min(var_5b1365c0, self.var_2084ae03);
	}
	if(var_5b1365c0 > 1)
	{
		var_b13b89f5 = (var_5b1365c0 - 1) / (self.var_2084ae03 - 1);
		var_e2f3a95a = (1 / (self.var_9288c4c0 / self.usetime)) - 1;
		rate = 1 + (var_b13b89f5 * var_e2f3a95a);
		return rate;
	}
	return var_5b1365c0;
}

/*
	Name: function_9f894584
	Namespace: gameobjects
	Checksum: 0xCE4D31B4
	Offset: 0xCB8
	Size: 0x152
	Parameters: 1
	Flags: Linked
*/
function function_9f894584(user)
{
	if(!isdefined(self.users[user]))
	{
		return 0;
	}
	if(isdefined(self.var_270e1029))
	{
		return self [[self.var_270e1029]](user);
	}
	if(self.var_a0ff5eb8)
	{
		userate = 0;
		if(self.users[user].touching.players.size > 0)
		{
			foreach(var_142bcc32 in self.users[user].touching.players)
			{
				if(isdefined(var_142bcc32.rate) && var_142bcc32.rate > userate)
				{
					userate = var_142bcc32.rate;
				}
			}
		}
		return userate;
	}
	return self.users[user].touching.rate;
}

/*
	Name: function_a7dbb00b
	Namespace: gameobjects
	Checksum: 0x34069A1C
	Offset: 0xE18
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function function_a7dbb00b(var_77efb18)
{
	rate = 0;
	foreach(_ in self.users)
	{
		if(user_name == var_77efb18)
		{
			continue;
		}
		rate = rate + function_9f894584(user_name);
	}
	return rate;
}

/*
	Name: function_21db7d02
	Namespace: gameobjects
	Checksum: 0x334F6146
	Offset: 0xED8
	Size: 0x92
	Parameters: 2
	Flags: Linked
*/
function function_21db7d02(numclaimants, numother)
{
	if(!isdefined(numclaimants))
	{
		numclaimants = 0;
	}
	if(!isdefined(numother))
	{
		numother = 0;
	}
	if(numclaimants == numother || numclaimants < 0 || numother < 0)
	{
		return 0;
	}
	advantage = abs(numclaimants - numother);
	return self function_ce47d61c(advantage);
}

/*
	Name: function_f1342bb2
	Namespace: gameobjects
	Checksum: 0xB21EF04
	Offset: 0xF78
	Size: 0x96
	Parameters: 2
	Flags: Linked
*/
function function_f1342bb2(user, rate)
{
	/#
		assert(isdefined(self.users[user]));
	#/
	/#
		assert(isdefined(self.users[user].touching));
	#/
	self.users[user].touching.rate = self.users[user].touching.rate + rate;
}

/*
	Name: function_27b84c22
	Namespace: gameobjects
	Checksum: 0xA0D317E5
	Offset: 0x1018
	Size: 0xD6
	Parameters: 2
	Flags: Linked
*/
function function_27b84c22(user, rate)
{
	/#
		assert(isdefined(self.users[user]));
	#/
	/#
		assert(isdefined(self.users[user].touching));
	#/
	self.users[user].touching.rate = self.users[user].touching.rate - rate;
	if(self.users[user].touching.num < 1)
	{
		self.users[user].touching.rate = 0;
	}
}

/*
	Name: function_fdf87288
	Namespace: gameobjects
	Checksum: 0xB51E2350
	Offset: 0x10F8
	Size: 0xB8
	Parameters: 4
	Flags: Linked
*/
function function_fdf87288(user, player, var_8a3ae0a0, var_5717fa0c)
{
	/#
		assert(isdefined(self.users[user]));
	#/
	/#
		assert(isdefined(self.users[user].touching));
	#/
	self.users[user].touching.players[var_5717fa0c] = {#starttime:gettime(), #rate:var_8a3ae0a0, #player:player};
}

/*
	Name: function_472b3c15
	Namespace: gameobjects
	Checksum: 0xFFD112A0
	Offset: 0x11B8
	Size: 0x78
	Parameters: 2
	Flags: Linked
*/
function function_472b3c15(user, var_5717fa0c)
{
	/#
		assert(isdefined(self.users[user]));
	#/
	/#
		assert(isdefined(self.users[user].touching));
	#/
	self.users[user].touching.players[var_5717fa0c] = undefined;
}

/*
	Name: function_c299518b
	Namespace: gameobjects
	Checksum: 0xCF461814
	Offset: 0x1238
	Size: 0x9C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c299518b(var_9b6a15e9, player)
{
	foreach(touching_player in var_9b6a15e9)
	{
		if(touching_player.player == player)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_73944efe
	Namespace: gameobjects
	Checksum: 0xB7534939
	Offset: 0x12E0
	Size: 0xB6
	Parameters: 2
	Flags: None
*/
function function_73944efe(var_9b6a15e9, touch)
{
	if(!isdefined(touch.player))
	{
		return undefined;
	}
	if(!isplayer(touch.player))
	{
		owner = touch.player.owner;
		if(isdefined(owner) && isplayer(owner))
		{
			if(!function_c299518b(var_9b6a15e9, owner))
			{
				return owner;
			}
		}
	}
	else
	{
		return touch.player;
	}
	return undefined;
}

/*
	Name: function_ebffa9f6
	Namespace: gameobjects
	Checksum: 0xBCAE7AE0
	Offset: 0x13A0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function function_ebffa9f6(obj_id, team)
{
	objective_setteam(obj_id, team);
}

/*
	Name: function_33420053
	Namespace: gameobjects
	Checksum: 0xAB1CB10D
	Offset: 0x13D8
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_33420053(obj_id)
{
	function_6da98133(obj_id);
}

/*
	Name: function_311b7785
	Namespace: gameobjects
	Checksum: 0x27F1153A
	Offset: 0x1408
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_311b7785(obj_id)
{
	function_4339912c(obj_id);
}

/*
	Name: function_e3cc1e96
	Namespace: gameobjects
	Checksum: 0x91F3CF91
	Offset: 0x1438
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function function_e3cc1e96(obj_id, team)
{
	function_29ef32ee(obj_id, team);
}

/*
	Name: function_6c27e90c
	Namespace: gameobjects
	Checksum: 0x5F99F131
	Offset: 0x1470
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function function_6c27e90c(obj_id, team)
{
	function_c939fac4(obj_id, team);
}

/*
	Name: function_58901d83
	Namespace: gameobjects
	Checksum: 0xBC2D01BC
	Offset: 0x14A8
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function function_58901d83()
{
	self.var_5f35f19a = self.var_a4926509;
	self.var_a4926509 = #"none";
}

/*
	Name: function_7db44d1b
	Namespace: gameobjects
	Checksum: 0x22530549
	Offset: 0x14E0
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function function_7db44d1b(user)
{
	if(user != #"none")
	{
		return true;
	}
	return false;
}

/*
	Name: function_350d0352
	Namespace: gameobjects
	Checksum: 0xA3D45E8E
	Offset: 0x1510
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function function_350d0352()
{
	return function_7db44d1b(self.var_a4926509);
}

/*
	Name: function_3e092344
	Namespace: gameobjects
	Checksum: 0x1CCBF7A5
	Offset: 0x1538
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function function_3e092344()
{
	return function_7db44d1b(self.var_5f35f19a);
}

/*
	Name: function_14fccbd9
	Namespace: gameobjects
	Checksum: 0xFAC4779A
	Offset: 0x1560
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function function_14fccbd9()
{
	return self.var_a4926509;
}

/*
	Name: function_4b64b7fd
	Namespace: gameobjects
	Checksum: 0xEFBF70B2
	Offset: 0x1578
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_4b64b7fd(team)
{
	if(!isdefined(self.var_a4926509))
	{
		return false;
	}
	if(team == self.var_a4926509)
	{
		return true;
	}
	return false;
}

/*
	Name: function_abe3458c
	Namespace: gameobjects
	Checksum: 0x1FC1EA56
	Offset: 0x15B8
	Size: 0x30
	Parameters: 0
	Flags: Linked
*/
function function_abe3458c()
{
	if(!isdefined(self.var_a4926509))
	{
		return false;
	}
	if(self.ownerteam == self.var_a4926509)
	{
		return true;
	}
	return false;
}

/*
	Name: function_abb86400
	Namespace: gameobjects
	Checksum: 0x47376451
	Offset: 0x15F0
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function function_abb86400()
{
	if(self.ownerteam != #"neutral" && self.ownerteam != #"none")
	{
		return true;
	}
	return false;
}

