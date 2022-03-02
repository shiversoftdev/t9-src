#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_b77e8eb1;

/*
	Name: init
	Namespace: namespace_b77e8eb1
	Checksum: 0x526B2CD3
	Offset: 0xD0
	Size: 0x3B0
	Parameters: 2
	Flags: None
*/
function init(var_551ace8a, var_94aa053c)
{
	level.var_2c9f7c6b = (isdefined(getgametypesetting(#"hash_1cf5e61c49992dc3")) ? getgametypesetting(#"hash_1cf5e61c49992dc3") : 0);
	level.var_cd139dc0 = (isdefined(getgametypesetting(#"hash_7f837b709840950")) ? getgametypesetting(#"hash_7f837b709840950") : 1) * 100;
	level.var_67432513 = (isdefined(getgametypesetting(#"hash_6cd4374035db175e")) ? getgametypesetting(#"hash_6cd4374035db175e") : 0) * 100;
	level.var_d18d7655 = (isdefined(getgametypesetting(#"hash_786ee581eedabff0")) ? getgametypesetting(#"hash_786ee581eedabff0") : 0) * 100;
	level.var_7108bd31 = (isdefined(getgametypesetting(#"hash_eff3a2f99071600")) ? getgametypesetting(#"hash_eff3a2f99071600") : 0);
	level.var_c0839e43 = (isdefined(getgametypesetting(#"hash_162ebc3912b68841")) ? getgametypesetting(#"hash_162ebc3912b68841") : 0);
	level.var_de7aa071 = (isdefined(getgametypesetting(#"hash_570912155889089e")) ? getgametypesetting(#"hash_570912155889089e") : 0);
	level.var_aa6b51f5 = (isdefined(getgametypesetting(#"hash_5d04a19b625d7300")) ? getgametypesetting(#"hash_5d04a19b625d7300") : 0);
	level.var_35b75d82 = (isdefined(getgametypesetting(#"hash_371e83f096bf0548")) ? getgametypesetting(#"hash_371e83f096bf0548") : 0);
	level.var_380f7d22 = 200;
	clientfield::register("scriptmover", "ftdb_zoneCircle", 1, 3, "int");
	level.var_551ace8a = var_551ace8a;
	level.var_94aa053c = var_94aa053c;
	level.var_ac7be286 = [];
}

/*
	Name: onstartgametype
	Namespace: namespace_b77e8eb1
	Checksum: 0xD7A635AC
	Offset: 0x488
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	/#
		if(getdvarint(#"hash_26399e7b3c887ffb", 0))
		{
			level thread function_64d94faa();
		}
	#/
}

/*
	Name: function_8e4e3bb2
	Namespace: namespace_b77e8eb1
	Checksum: 0xAF7575A0
	Offset: 0x4D8
	Size: 0x21A
	Parameters: 0
	Flags: None
*/
function function_8e4e3bb2()
{
	foreach(var_9bbce2cd in level.var_ac7be286)
	{
		var_8e392e0f = var_9bbce2cd.var_8e392e0f;
		if(distance2dsquared(self.origin, var_9bbce2cd.origin) < var_8e392e0f * var_8e392e0f)
		{
			return true;
		}
		var_d9612d9 = var_9bbce2cd.var_261dd536;
		for(var_1fa72977 = var_d9612d9 + 1; distance2dsquared(self.origin, var_9bbce2cd.origin) < ((var_1fa72977 * 1000) + 1000) * ((var_1fa72977 * 1000) + 1000) && var_1fa72977 > 0; var_1fa72977--)
		{
		}
		if(var_1fa72977 > var_d9612d9)
		{
			continue;
		}
		if(var_9bbce2cd.var_e17ae8be.size > (var_1fa72977 - 1) && var_1fa72977 > 0)
		{
			if(self function_c7c0cee2(var_9bbce2cd, var_1fa72977 - 1))
			{
				return true;
			}
		}
		if(var_9bbce2cd.var_e17ae8be.size > var_1fa72977)
		{
			if(self function_c7c0cee2(var_9bbce2cd, var_1fa72977))
			{
				return true;
			}
		}
		if(var_9bbce2cd.var_e17ae8be.size > var_1fa72977 + 1)
		{
			if(self function_c7c0cee2(var_9bbce2cd, var_1fa72977 + 1))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_c7c0cee2
	Namespace: namespace_b77e8eb1
	Checksum: 0x264C086B
	Offset: 0x700
	Size: 0xE8
	Parameters: 2
	Flags: Private
*/
function private function_c7c0cee2(var_9bbce2cd, var_d9612d9)
{
	/#
		assert(isplayer(self));
	#/
	for(i = 0; i < var_9bbce2cd.var_e17ae8be[var_d9612d9].size; i++)
	{
		var_ac287808 = var_9bbce2cd.var_e17ae8be[var_d9612d9][i];
		if(!isdefined(var_ac287808.model.var_301e0bf7))
		{
			continue;
		}
		if(distance2dsquared(self.origin, var_ac287808.origin) < var_ac287808.model.var_301e0bf7 * var_ac287808.model.var_301e0bf7)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_1cb7e339
	Namespace: namespace_b77e8eb1
	Checksum: 0x174F0CA8
	Offset: 0x7F0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_1cb7e339()
{
	self clientfield::set("ftdb_zoneCircle", 3);
}

/*
	Name: function_a5caaee0
	Namespace: namespace_b77e8eb1
	Checksum: 0xDCB4F871
	Offset: 0x820
	Size: 0x8C
	Parameters: 0
	Flags: None
*/
function function_a5caaee0()
{
	level.var_ac7be286[level.var_ac7be286.size] = self;
	self function_6a583613();
	/#
		if(getdvarint(#"hash_1216cbfbf11758ce", 0))
		{
			self thread function_3d8141ab();
		}
	#/
	self thread function_57172b7();
}

/*
	Name: function_57172b7
	Namespace: namespace_b77e8eb1
	Checksum: 0x683B2303
	Offset: 0x8B8
	Size: 0x1B8
	Parameters: 0
	Flags: Private
*/
function private function_57172b7()
{
	level endon(#"game_ended");
	if(isdefined(level.var_551ace8a))
	{
		[[level.var_551ace8a]](self.origin);
	}
	self.var_261dd536++;
	while(self.var_261dd536 < self.var_bf5103a8)
	{
		self function_87a78a13();
		self.var_261dd536++;
	}
	wait(level.var_c0839e43);
	if(isdefined(level.var_94aa053c))
	{
		[[level.var_94aa053c]](self.origin);
	}
	self.var_261dd536--;
	while(self.var_261dd536 >= 0)
	{
		self function_5c839f44();
		self.var_261dd536--;
	}
	var_a8c6fd3b = level.var_de7aa071 / (self.var_bf5103a8 + 1);
	wait(var_a8c6fd3b);
	self function_ea7ab3a9();
	for(i = 0; i < level.var_ac7be286.size; i++)
	{
		if(self == level.var_ac7be286[i])
		{
			level.var_ac7be286[i] = level.var_ac7be286[level.var_ac7be286.size - 1];
			level.var_ac7be286[level.var_ac7be286.size - 1] = undefined;
		}
	}
}

/*
	Name: function_6a583613
	Namespace: namespace_b77e8eb1
	Checksum: 0xBE7BFFA0
	Offset: 0xA78
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_6a583613()
{
	self.var_8e392e0f = level.var_cd139dc0;
	self.var_261dd536 = 0;
	self function_218080fb();
	self function_cd602d73();
}

/*
	Name: function_218080fb
	Namespace: namespace_b77e8eb1
	Checksum: 0x8FB232FA
	Offset: 0xAD0
	Size: 0x2DA
	Parameters: 0
	Flags: Private
*/
function private function_218080fb()
{
	self.var_fa06c0e = [];
	self.var_e17ae8be = [];
	self.var_3401d807 = [];
	var_c255bde9 = level.var_cd139dc0;
	maxradius = randomintrange(level.var_d18d7655, level.var_67432513);
	self.var_bf5103a8 = int(((maxradius - var_c255bde9) / 800) + 0.5);
	var_92d713c7 = level.var_aa6b51f5;
	self.var_91017512 = (maxradius - var_c255bde9) / (self.var_bf5103a8 - 1);
	self.circleradius = 800;
	for(i = 0; i < self.var_bf5103a8; i++)
	{
		self.var_fa06c0e[i] = [];
		self.var_e17ae8be[i] = [];
		self.var_3401d807[i] = [];
		var_4fc3d1c0 = var_c255bde9 + (self.var_91017512 * i);
		var_f79106a4 = int(((var_4fc3d1c0 * 2) * 3.14159) / (self.circleradius / (1 / (1 + var_92d713c7))) + 0.5);
		angledelta = 360 / var_f79106a4;
		for(j = 0; j < var_f79106a4; j++)
		{
			angle = angledelta * j;
			vector = (cos(angle), sin(angle), 0);
			origin = self.origin + vectorscale(vector, var_4fc3d1c0);
			if(level.var_380f7d22 > 0)
			{
				offsetangle = randomint(360);
				var_c31c90fd = (cos(offsetangle), sin(offsetangle), 0);
				var_3413960f = randomint(level.var_380f7d22);
				origin = origin + vectorscale(var_c31c90fd, var_3413960f);
			}
			self.var_fa06c0e[i][j] = origin;
		}
	}
}

/*
	Name: function_cd602d73
	Namespace: namespace_b77e8eb1
	Checksum: 0x95011AAE
	Offset: 0xDB8
	Size: 0x114
	Parameters: 0
	Flags: Private
*/
function private function_cd602d73()
{
	self.var_b06ed2fa = spawn("script_model", self.origin);
	self.var_b06ed2fa.team = #"neutral";
	self.var_b06ed2fa setmodel("tag_origin");
	self.var_b06ed2fa clientfield::set("ftdb_zoneCircle", 2);
	self.var_b06ed2fa.var_bf5103a8 = self.var_bf5103a8;
	self.var_b06ed2fa.var_2c8491dd = self;
	self.var_b06ed2fa setforcenocull();
	if(self function_2020d6b0())
	{
		self.var_b06ed2fa clientfield::set("zoneNearOOB", 1);
	}
}

/*
	Name: function_2020d6b0
	Namespace: namespace_b77e8eb1
	Checksum: 0xA538B478
	Offset: 0xED8
	Size: 0x1AA
	Parameters: 0
	Flags: Private
*/
function private function_2020d6b0()
{
	if(!isdefined(self))
	{
		/#
			assert(0);
		#/
		return false;
	}
	checkdistance = level.var_67432513;
	checks = [3:(checkdistance * -1, 0, self.origin[2]), 2:(checkdistance, 0, self.origin[2]), 1:(0, checkdistance * -1, self.origin[2]), 0:(0, checkdistance, self.origin[2])];
	foreach(check in checks)
	{
		var_3a1904d3 = function_9cc082d2(self.origin + check, 10000);
		if(!isdefined(var_3a1904d3))
		{
			return true;
		}
		if(oob::chr_party(var_3a1904d3[#"point"]))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_87a78a13
	Namespace: namespace_b77e8eb1
	Checksum: 0xEB7B8104
	Offset: 0x1090
	Size: 0x2B4
	Parameters: 0
	Flags: Private
*/
function private function_87a78a13()
{
	var_b75abae3 = level.var_7108bd31 / self.var_bf5103a8;
	if(self.var_261dd536 >= 2)
	{
		nextradius = self.var_8e392e0f + self.var_91017512;
		currentscale = self.var_8e392e0f / level.var_cd139dc0;
		var_ac2ef1c2 = nextradius / level.var_cd139dc0;
		self thread function_6941b393(currentscale, var_ac2ef1c2, var_b75abae3);
	}
	maxindex = 0;
	for(i = 0; i < self.var_261dd536; i++)
	{
		maxindex = maxindex + self.var_fa06c0e[i].size;
	}
	var_806fff0a = int(maxindex * level.var_35b75d82);
	var_1082b7c4 = var_b75abae3 / var_806fff0a;
	for(i = 0; i < var_806fff0a; i++)
	{
		wait(var_1082b7c4);
		index = randomint(maxindex);
		maxindex--;
		for(j = 0; j < self.var_261dd536; j++)
		{
			if(index < self.var_fa06c0e[j].size)
			{
				origin = self.var_fa06c0e[j][index];
				self.var_fa06c0e[j][index] = self.var_fa06c0e[j][self.var_fa06c0e[j].size - 1];
				self.var_fa06c0e[j][self.var_fa06c0e[j].size - 1] = undefined;
				var_5162de87 = self function_2be7a212(j, origin);
				var_5162de87 thread function_60c3117b(0.1, 1, 5, 0);
				break;
				continue;
			}
			index = index - self.var_fa06c0e[j].size;
		}
	}
	if(self.var_261dd536 >= 2)
	{
		self thread function_f8afee63(self.var_261dd536 - 2);
	}
}

/*
	Name: function_5c839f44
	Namespace: namespace_b77e8eb1
	Checksum: 0x93D9F6C0
	Offset: 0x1350
	Size: 0x204
	Parameters: 0
	Flags: Private
*/
function private function_5c839f44()
{
	var_b75abae3 = level.var_de7aa071 / (self.var_bf5103a8 + 1);
	if(self.var_261dd536 + 1 < self.var_bf5103a8)
	{
		nextradius = self.var_8e392e0f - self.var_91017512;
		currentscale = self.var_8e392e0f / level.var_cd139dc0;
		var_ac2ef1c2 = nextradius / level.var_cd139dc0;
		if(self.var_261dd536 > 0)
		{
			self thread function_6941b393(currentscale, var_ac2ef1c2, var_b75abae3);
		}
		else
		{
			self thread function_6941b393(currentscale, var_ac2ef1c2, var_b75abae3 * 2);
		}
	}
	maxindex = self.var_e17ae8be[self.var_261dd536].size;
	var_7a62ca2 = self.var_261dd536 - 1;
	if(var_7a62ca2 >= 0)
	{
		for(i = 0; i < self.var_3401d807[var_7a62ca2].size; i++)
		{
			var_5162de87 = self function_2be7a212(var_7a62ca2, self.var_3401d807[var_7a62ca2][i]);
		}
	}
	if(maxindex == 0)
	{
		wait(var_b75abae3);
	}
	else
	{
		var_7158f69 = maxindex - 1;
		var_1082b7c4 = var_b75abae3 / maxindex;
		for(i = var_7158f69; i >= 0; i--)
		{
			wait(var_1082b7c4);
			self thread function_40c81ea4(self.var_261dd536, i);
		}
	}
}

/*
	Name: function_f8afee63
	Namespace: namespace_b77e8eb1
	Checksum: 0xFBE5D38C
	Offset: 0x1560
	Size: 0x16E
	Parameters: 1
	Flags: Private
*/
function private function_f8afee63(var_d9612d9)
{
	self endon(#"death");
	level endon(#"game_ended");
	for(i = self.var_fa06c0e[var_d9612d9].size - 1; i >= 0; i--)
	{
		self.var_fa06c0e[var_d9612d9][i] = undefined;
	}
	for(i = self.var_e17ae8be[var_d9612d9].size - 1; i >= 0; i--)
	{
		self.var_e17ae8be[var_d9612d9][i].model clientfield::set("ftdb_zoneCircle", 4);
		self.var_3401d807[var_d9612d9][self.var_3401d807[var_d9612d9].size] = self.var_e17ae8be[var_d9612d9][i].model.origin;
		util::wait_network_frame(1);
		self.var_e17ae8be[var_d9612d9][i].model delete();
		self.var_e17ae8be[var_d9612d9][i] = undefined;
	}
}

/*
	Name: function_2be7a212
	Namespace: namespace_b77e8eb1
	Checksum: 0x89E5626F
	Offset: 0x16D8
	Size: 0x1B2
	Parameters: 2
	Flags: Private
*/
function private function_2be7a212(var_d9612d9, origin)
{
	origin = function_b4c74561(origin + vectorscale((0, 0, 1), 16));
	var_70a055ba = self.var_e17ae8be[var_d9612d9].size;
	self.var_e17ae8be[var_d9612d9][var_70a055ba] = {};
	self.var_e17ae8be[var_d9612d9][var_70a055ba].origin = origin;
	self.var_e17ae8be[var_d9612d9][var_70a055ba].model = spawn("script_model", origin);
	self.var_e17ae8be[var_d9612d9][var_70a055ba].model.team = #"neutral";
	self.var_e17ae8be[var_d9612d9][var_70a055ba].model setmodel("tag_origin");
	self.var_e17ae8be[var_d9612d9][var_70a055ba].model clientfield::set("ftdb_zoneCircle", 1);
	self.var_e17ae8be[var_d9612d9][var_70a055ba].model.var_2c8491dd = self;
	self.var_e17ae8be[var_d9612d9][var_70a055ba].model setforcenocull();
	return self.var_e17ae8be[var_d9612d9][var_70a055ba].model;
}

/*
	Name: function_b4c74561
	Namespace: namespace_b77e8eb1
	Checksum: 0xFD74416C
	Offset: 0x1898
	Size: 0x196
	Parameters: 1
	Flags: Private
*/
function private function_b4c74561(origin)
{
	var_9912c765 = vectorscale((0, 0, 1), 200);
	attempts = 1;
	var_a468ec72 = bullettrace(origin + var_9912c765, origin, 0, self);
	var_68011b79 = bullettrace(origin, origin - var_9912c765, 0, self);
	while(var_68011b79[#"fraction"] == 1 && var_a468ec72[#"fraction"] == 1 && attempts < 10)
	{
		var_a468ec72 = bullettrace(origin + (var_9912c765 * (attempts + 1)), origin + (var_9912c765 * attempts), 0, self);
		var_68011b79 = bullettrace(origin - (var_9912c765 * attempts), origin - (var_9912c765 * (attempts + 1)), 0, self);
		attempts++;
	}
	if(var_68011b79[#"fraction"] <= var_a468ec72[#"fraction"])
	{
		origin = var_68011b79[#"position"];
	}
	else
	{
		origin = var_a468ec72[#"position"];
	}
	return origin;
}

/*
	Name: function_60c3117b
	Namespace: namespace_b77e8eb1
	Checksum: 0xD1F8E1C
	Offset: 0x1A38
	Size: 0x1AC
	Parameters: 4
	Flags: Private
*/
function private function_60c3117b(startscale, var_5ad0dc76, duration, iscore)
{
	self endon(#"death");
	level endon(#"game_ended");
	starttime = gettime();
	if(startscale < 0.1)
	{
		startscale = 0.1;
	}
	self setscale(startscale);
	waitframe(1);
	while(gettime() < starttime + (int(duration * 1000)))
	{
		timefrac = (gettime() - starttime) / (int(duration * 1000));
		scale = startscale + (timefrac * (var_5ad0dc76 - startscale));
		if(scale < 0.1)
		{
			self setscale(0.1);
			return;
		}
		self setscale(scale);
		if(iscore)
		{
			self.var_2c8491dd.var_8e392e0f = level.var_cd139dc0 * scale;
		}
		else
		{
			self.var_301e0bf7 = scale * self.var_2c8491dd.circleradius;
		}
		waitframe(1);
	}
	self setscale(var_5ad0dc76);
}

/*
	Name: function_6941b393
	Namespace: namespace_b77e8eb1
	Checksum: 0xF0B4D499
	Offset: 0x1BF0
	Size: 0x84
	Parameters: 3
	Flags: Private
*/
function private function_6941b393(startscale, var_4dad59c0, duration)
{
	self endon(#"death");
	level endon(#"game_ended");
	var_65bcb0ae = duration / 2;
	wait(var_65bcb0ae);
	self.var_b06ed2fa function_60c3117b(startscale, var_4dad59c0, var_65bcb0ae, 1);
}

/*
	Name: function_40c81ea4
	Namespace: namespace_b77e8eb1
	Checksum: 0x84C823D5
	Offset: 0x1C80
	Size: 0xAC
	Parameters: 2
	Flags: Private
*/
function private function_40c81ea4(var_d9612d9, circleindex)
{
	self endon(#"death");
	level endon(#"game_ended");
	var_867cdc1a = self.var_e17ae8be[var_d9612d9][circleindex];
	if(!isdefined(var_867cdc1a.model))
	{
		return;
	}
	var_867cdc1a.model function_60c3117b(1, 0.1, 5, 0);
	self function_7886d66d(var_d9612d9, var_867cdc1a);
}

/*
	Name: function_7886d66d
	Namespace: namespace_b77e8eb1
	Checksum: 0x2EEBF8E0
	Offset: 0x1D38
	Size: 0x92
	Parameters: 2
	Flags: Private
*/
function private function_7886d66d(var_d9612d9, var_867cdc1a)
{
	var_867cdc1a.model clientfield::set("ftdb_zoneCircle", 4);
	util::wait_network_frame(1);
	var_867cdc1a.model delete();
	self.var_e17ae8be[var_d9612d9][self.var_e17ae8be[var_d9612d9].size - 1] = undefined;
}

/*
	Name: function_ea7ab3a9
	Namespace: namespace_b77e8eb1
	Checksum: 0x745D95BC
	Offset: 0x1DD8
	Size: 0x6E
	Parameters: 0
	Flags: Private
*/
function private function_ea7ab3a9()
{
	if(isdefined(self.var_b06ed2fa))
	{
		self.var_b06ed2fa clientfield::set("ftdb_zoneCircle", 4);
		util::wait_network_frame(1);
		self.var_b06ed2fa delete();
		self.var_b06ed2fa = undefined;
	}
}

/*
	Name: function_64d94faa
	Namespace: namespace_b77e8eb1
	Checksum: 0x414811C3
	Offset: 0x1E50
	Size: 0x4D4
	Parameters: 0
	Flags: Private
*/
function private function_64d94faa()
{
	/#
		level endon(#"game_ended");
		level.var_8c48fd1 = 0;
		level.var_a0cb7a38 = [];
		while(true)
		{
			waitframe(1);
			level.var_2c9f7c6b = (isdefined(getgametypesetting(#"hash_1cf5e61c49992dc3")) ? getgametypesetting(#"hash_1cf5e61c49992dc3") : 0);
			level.var_cd139dc0 = (isdefined(getgametypesetting(#"hash_7f837b709840950")) ? getgametypesetting(#"hash_7f837b709840950") : 0) * 100;
			level.var_67432513 = (isdefined(getgametypesetting(#"hash_6cd4374035db175e")) ? getgametypesetting(#"hash_6cd4374035db175e") : 0) * 100;
			level.var_d18d7655 = (isdefined(getgametypesetting(#"hash_786ee581eedabff0")) ? getgametypesetting(#"hash_786ee581eedabff0") : 0) * 100;
			level.var_7108bd31 = (isdefined(getgametypesetting(#"hash_eff3a2f99071600")) ? getgametypesetting(#"hash_eff3a2f99071600") : 0);
			level.var_c0839e43 = (isdefined(getgametypesetting(#"hash_162ebc3912b68841")) ? getgametypesetting(#"hash_162ebc3912b68841") : 0);
			level.var_de7aa071 = (isdefined(getgametypesetting(#"hash_570912155889089e")) ? getgametypesetting(#"hash_570912155889089e") : 0);
			level.var_aa6b51f5 = (isdefined(getgametypesetting(#"hash_5d04a19b625d7300")) ? getgametypesetting(#"hash_5d04a19b625d7300") : 0);
			level.var_35b75d82 = (isdefined(getgametypesetting(#"hash_371e83f096bf0548")) ? getgametypesetting(#"hash_371e83f096bf0548") : 0);
			level.var_380f7d22 = getdvarint(#"hash_59bc959721744fcb", 200);
			players = getplayers();
			foreach(player in players)
			{
				if(player usebuttonpressed() && !is_true(level.var_a0cb7a38[level.var_8c48fd1]))
				{
					level.var_2f418a15[level.var_8c48fd1] thread function_33e28605(level.var_8c48fd1);
					level.var_8c48fd1++;
					level.var_8c48fd1 = level.var_8c48fd1 % 3;
					wait(0.5);
				}
			}
		}
	#/
}

/*
	Name: function_33e28605
	Namespace: namespace_b77e8eb1
	Checksum: 0x8B5C4EAF
	Offset: 0x2330
	Size: 0xB4
	Parameters: 1
	Flags: Private
*/
function private function_33e28605(var_f07efec7)
{
	/#
		level.var_a0cb7a38[var_f07efec7] = 1;
		level.var_ac7be286[level.var_ac7be286.size] = self;
		self function_6a583613();
		if(getdvarint(#"hash_1216cbfbf11758ce", 0))
		{
			self thread function_3d8141ab();
		}
		self function_57172b7();
		level.var_a0cb7a38[var_f07efec7] = 0;
	#/
}

/*
	Name: function_3d8141ab
	Namespace: namespace_b77e8eb1
	Checksum: 0x620AC223
	Offset: 0x23F0
	Size: 0x1FE
	Parameters: 0
	Flags: Private
*/
function private function_3d8141ab()
{
	/#
		level endon(#"game_ended");
		while(!isdefined(self.var_b06ed2fa))
		{
			waitframe(1);
		}
		while(isdefined(self.var_b06ed2fa))
		{
			var_1b8f1752 = self.var_b06ed2fa getscale();
			sphere(self.var_b06ed2fa.origin, level.var_cd139dc0 * var_1b8f1752, (0, 1, 0), 0.5, 1, 100, 1);
			foreach(ring in self.var_e17ae8be)
			{
				foreach(circle in ring)
				{
					var_a13932b6 = circle.model getscale();
					sphere(circle.model.origin, self.circleradius * var_a13932b6, (0, 1, 0), 0.5, 1, 100, 1);
				}
			}
			waitframe(1);
		}
	#/
}

