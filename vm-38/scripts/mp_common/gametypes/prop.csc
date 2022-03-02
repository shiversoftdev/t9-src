#using script_640ee26e1d271011;
#using script_67b81035ebe2a4fe;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace prop;

/*
	Name: function_b7af5bea
	Namespace: prop
	Checksum: 0xD402907
	Offset: 0x230
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b7af5bea()
{
	level notify(623056366);
}

/*
	Name: main
	Namespace: prop
	Checksum: 0xA3232FD9
	Offset: 0x250
	Size: 0x40C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("allplayers", "hideTeamPlayer", 16000, 2, "int", &function_abaafe9a, 0, 0);
	clientfield::register("allplayers", "pingHighlight", 16000, 1, "int", &function_3c95ba87, 0, 0);
	clientfield::register("toplayer", "PROP.change_prop", 16000, 1, "int", &propchange, 0, 0);
	clientfield::register("toplayer", "PROP.cameraHeight", 16000, 8, "int", &function_c7691337, 0, 0);
	clientfield::register("toplayer", "PROP.cameraRange", 16000, 8, "int", &function_d8273603, 0, 0);
	clientfield::register("toplayer", "PROP.hide_prop", 16000, 1, "int", &function_65208afd, 0, 0);
	clientfield::function_5b7d846d("hudItems.war.attackingTeam", #"hash_11ea1e04b846f98e", #"attackingteam", 16000, 2, "int", undefined, 0, 1);
	clientfield::function_a8bbc967("hudItems.numPropsAlive", #"hud_items", #"hash_486f8ad98177fae8", 16000, 4, "int", undefined, 0, 1);
	clientfield::function_a8bbc967("hudItems.numPropConcusses", #"hud_items", #"hash_445bc773f16d2e44", 16000, 2, "int", undefined, 0, 1);
	clientfield::function_a8bbc967("hudItems.numPropChanges", #"hud_items", #"hash_7d362093bb553a7b", 16000, 2, "int", undefined, 0, 1);
	clientfield::function_a8bbc967("hudItems.numPropDecoys", #"hud_items", #"hash_30bdcde2ca8cdccf", 16000, 4, "int", undefined, 0, 1);
	clientfield::register("toplayer", "realtime_multiplay", 16000, 1, "int", &function_a1b40aa4, 0, 1);
	level.var_82e6af5d = mp_prop_timer::register();
	level.var_314165c4 = mp_prop_controls::register();
	callback::on_localplayer_spawned(&function_357207b9);
	level.var_20ece392 = &function_aa5f176f;
	thread function_2691bc1b();
}

/*
	Name: function_357207b9
	Namespace: prop
	Checksum: 0x83B93309
	Offset: 0x668
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function function_357207b9(localclientnum)
{
	level notify("localPlayerSpectatingEnd" + localclientnum);
	if(!self function_b9fceaaf(localclientnum))
	{
		function_da64790f(localclientnum);
		function_a5c395d2(localclientnum);
		function_b1cca54f(localclientnum);
	}
	if(function_65b9eb0f(localclientnum))
	{
		level thread function_29794d02(localclientnum);
	}
	level thread function_b5a6504c(localclientnum);
}

/*
	Name: function_29794d02
	Namespace: prop
	Checksum: 0x5E83EBBD
	Offset: 0x740
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_29794d02(localclientnum)
{
	level notify("localPlayerSpectating" + localclientnum);
	level endon("localPlayerSpectatingEnd" + localclientnum);
	var_22d4baff = playerbeingspectated(localclientnum);
	while(true)
	{
		player = playerbeingspectated(localclientnum);
		if(player != var_22d4baff)
		{
			level notify("localPlayerSpectating" + localclientnum);
		}
		wait(0.1);
	}
}

/*
	Name: function_2691bc1b
	Namespace: prop
	Checksum: 0xC2D14B3B
	Offset: 0x7F8
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function function_2691bc1b()
{
	while(true)
	{
		res = undefined;
		res = level waittill(#"team_changed");
		localclientnum = res.localclientnum;
		level notify("team_changed" + localclientnum);
	}
}

/*
	Name: function_43ad0547
	Namespace: prop
	Checksum: 0x5B8743F6
	Offset: 0x868
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_43ad0547(player)
{
	parent = self getlinkedent();
	while(isdefined(parent))
	{
		if(parent == player)
		{
			return true;
		}
		parent = parent getlinkedent();
	}
	return false;
}

/*
	Name: function_1d9539dd
	Namespace: prop
	Checksum: 0x55C8557B
	Offset: 0x8D8
	Size: 0x172
	Parameters: 2
	Flags: None
*/
function function_1d9539dd(localclientnum, player)
{
	if(isdefined(player.prop))
	{
		return player.prop;
	}
	playerparent = player getlinkedent();
	ents = getentarray(localclientnum);
	foreach(ent in ents)
	{
		if(isplayer(ent) || !isdefined(ent.owner) || ent.owner != player)
		{
			continue;
		}
		if(isdefined(playerparent) && ent function_43ad0547(playerparent))
		{
			return ent;
		}
		if(ent function_43ad0547(player))
		{
			return ent;
		}
	}
	return undefined;
}

/*
	Name: function_b5a6504c
	Namespace: prop
	Checksum: 0x3B02261F
	Offset: 0xA58
	Size: 0x254
	Parameters: 1
	Flags: None
*/
function function_b5a6504c(localclientnum)
{
	level notify("setupPropPlayerNames" + localclientnum);
	level endon("setupPropPlayerNames" + localclientnum);
	while(true)
	{
		localplayer = function_5c10bd79(localclientnum);
		spectating = function_65b9eb0f(localclientnum);
		players = getplayers(localclientnum);
		foreach(player in players)
		{
			if(player != localplayer || spectating && player ishidden() && isdefined(player.team) && player.team == localplayer.team)
			{
				player.prop = function_1d9539dd(localclientnum, player);
				if(isdefined(player.prop))
				{
					if(!is_true(player.var_776a1340))
					{
						player.prop setdrawownername(1, spectating);
						player.var_776a1340 = 1;
					}
				}
				continue;
			}
			if(is_true(player.var_776a1340))
			{
				player.prop = function_1d9539dd(localclientnum, player);
				if(isdefined(player.prop))
				{
					player.prop setdrawownername(0, spectating);
				}
				player.var_776a1340 = 0;
			}
		}
		wait(1);
	}
}

/*
	Name: function_aa5f176f
	Namespace: prop
	Checksum: 0x5E93A97C
	Offset: 0xCB8
	Size: 0x7C
	Parameters: 7
	Flags: None
*/
function function_aa5f176f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 0)
	{
		self notify(#"hash_3fe34dcd29fd6a0f");
	}
	else
	{
		self thread function_15e0dfb8(fieldname, bwastimejump);
	}
}

/*
	Name: function_15e0dfb8
	Namespace: prop
	Checksum: 0xA7C3814D
	Offset: 0xD40
	Size: 0x166
	Parameters: 2
	Flags: None
*/
function function_15e0dfb8(localclientnum, var_dc9f0c39)
{
	self endon(#"entityshutdown");
	level endon(#"disconnect");
	self notify(#"hash_3fe34dcd29fd6a0f");
	self endon(#"hash_3fe34dcd29fd6a0f");
	while(true)
	{
		localplayer = function_5c10bd79(localclientnum);
		spectating = function_65b9eb0f(localclientnum) && !function_1cbf351b(localclientnum);
		var_6955388c = !isdefined(self.owner) || self.owner != localplayer || spectating && isdefined(self.team) && isdefined(localplayer.team) && self.team == localplayer.team;
		if(var_dc9f0c39 == 1)
		{
		}
		level waittill("team_changed" + localclientnum, "localPlayerSpectating" + localclientnum);
	}
}

/*
	Name: function_3c95ba87
	Namespace: prop
	Checksum: 0x6D5416A0
	Offset: 0xEB0
	Size: 0x7C
	Parameters: 7
	Flags: None
*/
function function_3c95ba87(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 0)
	{
		self notify(#"hash_3fe34dcd29fd6a0f");
	}
	else
	{
		self thread function_29561f83(fieldname, bwastimejump);
	}
}

/*
	Name: function_29561f83
	Namespace: prop
	Checksum: 0xC0218A61
	Offset: 0xF38
	Size: 0x102
	Parameters: 2
	Flags: None
*/
function function_29561f83(localclientnum, var_dc9f0c39)
{
	self endon(#"entityshutdown");
	self notify(#"hash_3f606627f154954b");
	self endon(#"hash_3f606627f154954b");
	while(true)
	{
		localplayer = function_5c10bd79(var_dc9f0c39);
		if(!isdefined(self) || !isdefined(localplayer))
		{
			break;
		}
		var_6955388c = self != localplayer && isdefined(self.team) && isdefined(localplayer.team) && self.team == localplayer.team;
		level waittill("team_changed" + var_dc9f0c39, "localPlayerSpectating" + var_dc9f0c39);
	}
}

/*
	Name: function_65208afd
	Namespace: prop
	Checksum: 0xA4D88165
	Offset: 0x1048
	Size: 0xFC
	Parameters: 7
	Flags: None
*/
function function_65208afd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	localplayer = function_5c10bd79(fieldname);
	var_6955388c = bwastimejump && isdefined(self) && self == localplayer;
	if(var_6955388c)
	{
		if(isdefined(self.prop))
		{
			self.prop function_bf9d3071(#"hash_14be6378dfef6b7");
		}
	}
	else if(isdefined(self.prop))
	{
		self.prop function_5d482e78(#"hash_14be6378dfef6b7");
	}
}

/*
	Name: function_abaafe9a
	Namespace: prop
	Checksum: 0xC3650B93
	Offset: 0x1150
	Size: 0xAC
	Parameters: 7
	Flags: None
*/
function function_abaafe9a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 0)
	{
		self notify(#"hash_65350e9157e1e7fd");
		if(!self function_b9fceaaf(fieldname))
		{
			self show();
		}
	}
	else
	{
		self function_f6c0a66e(fieldname, bwastimejump);
	}
}

/*
	Name: propchange
	Namespace: prop
	Checksum: 0xBC0716AE
	Offset: 0x1208
	Size: 0x74
	Parameters: 7
	Flags: None
*/
function propchange(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(self function_b9fceaaf(bwastimejump))
	{
		self.prop function_415dc60b(bwastimejump);
	}
}

/*
	Name: function_c7691337
	Namespace: prop
	Checksum: 0xECD5818C
	Offset: 0x1288
	Size: 0x5C
	Parameters: 7
	Flags: None
*/
function function_c7691337(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	function_ac297091(fieldname, bwastimejump * 10);
}

/*
	Name: function_d8273603
	Namespace: prop
	Checksum: 0xB513F09
	Offset: 0x12F0
	Size: 0x5C
	Parameters: 7
	Flags: None
*/
function function_d8273603(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	function_d69242bb(fieldname, bwastimejump * 10);
}

/*
	Name: function_b9fceaaf
	Namespace: prop
	Checksum: 0x81755B88
	Offset: 0x1358
	Size: 0x60
	Parameters: 1
	Flags: None
*/
function function_b9fceaaf(localclientnum)
{
	if(isdefined(self.prop))
	{
		return 1;
	}
	if(isplayer(self))
	{
		self.prop = function_1d9539dd(localclientnum, self);
		return isdefined(self.prop);
	}
	return 0;
}

/*
	Name: function_f6c0a66e
	Namespace: prop
	Checksum: 0x6DFB9E5F
	Offset: 0x13C0
	Size: 0x176
	Parameters: 2
	Flags: None
*/
function function_f6c0a66e(localclientnum, var_b0a45a26)
{
	self endon(#"entityshutdown");
	self notify(#"hash_65350e9157e1e7fd");
	self endon(#"hash_65350e9157e1e7fd");
	/#
		assert(var_b0a45a26 == 1 || var_b0a45a26 == 2);
	#/
	team = "allies";
	if(var_b0a45a26 == 2)
	{
		team = "axis";
	}
	while(isdefined(self))
	{
		localplayer = function_5c10bd79(localclientnum);
		ishidden = isdefined(localplayer.team) && team == localplayer.team && !function_65b9eb0f(localclientnum);
		if(ishidden)
		{
			self hide();
		}
		else if(!self function_b9fceaaf(localclientnum))
		{
			self show();
		}
		level waittill("team_changed" + localclientnum);
	}
}

/*
	Name: function_a1b40aa4
	Namespace: prop
	Checksum: 0xC72666C
	Offset: 0x1540
	Size: 0x74
	Parameters: 7
	Flags: None
*/
function function_a1b40aa4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		function_9e9a0604(fieldname);
	}
	else
	{
		function_3f258626(fieldname);
	}
}

