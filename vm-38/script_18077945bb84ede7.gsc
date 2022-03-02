#using script_113dd7f0ea2a1d4f;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace sr_scrap;

/*
	Name: function_5f09c3ff
	Namespace: sr_scrap
	Checksum: 0xD0FAE38F
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5f09c3ff()
{
	level notify(1749189941);
}

/*
	Name: init
	Namespace: sr_scrap
	Checksum: 0xE2967E82
	Offset: 0xD8
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	callback::on_connect(&on_player_connect);
	callback::function_10a4dd0a(&function_10a4dd0a);
	/#
		level thread function_e2e9d901();
	#/
}

/*
	Name: on_player_connect
	Namespace: sr_scrap
	Checksum: 0x7DC362ED
	Offset: 0x140
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self.var_595a11bc = 0;
	self.var_72d64cfd = 0;
}

/*
	Name: function_10a4dd0a
	Namespace: sr_scrap
	Checksum: 0x199E6103
	Offset: 0x168
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_10a4dd0a(s_params)
{
	var_a6762160 = s_params.item.var_a6762160;
	if(var_a6762160.itemtype === #"hash_3a094c949a87214d")
	{
		if(isplayer(self))
		{
			e_player = self;
		}
		else
		{
			e_player = s_params.player;
		}
		rarity = var_a6762160.rarity;
		if(rarity === #"rare")
		{
			var_595a11bc = 10 * var_a6762160.amount;
			e_player function_a6d4221f(var_595a11bc);
		}
		else
		{
			if(var_a6762160.name === #"hash_4a604970e6ceeee")
			{
				e_player function_afab250a(200);
			}
			else
			{
				var_595a11bc = 50 * var_a6762160.amount;
				e_player function_afab250a(var_595a11bc);
			}
		}
	}
}

/*
	Name: function_efd1d093
	Namespace: sr_scrap
	Checksum: 0x3280AB9E
	Offset: 0x2C0
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function function_efd1d093()
{
	return self.var_72d64cfd;
}

/*
	Name: function_6f3fd157
	Namespace: sr_scrap
	Checksum: 0x8409CAA6
	Offset: 0x2D8
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function function_6f3fd157()
{
	return self.var_595a11bc;
}

/*
	Name: function_afab250a
	Namespace: sr_scrap
	Checksum: 0x38958D55
	Offset: 0x2F0
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function function_afab250a(var_595a11bc, var_60460256)
{
	if(!isdefined(var_60460256))
	{
		var_60460256 = 0;
	}
	if(isdefined(self.var_595a11bc))
	{
		self.var_595a11bc = int(self.var_595a11bc + var_595a11bc);
		self function_b802c7fc(0, 0, var_60460256);
	}
}

/*
	Name: function_a6d4221f
	Namespace: sr_scrap
	Checksum: 0x60D7A567
	Offset: 0x370
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function function_a6d4221f(var_72d64cfd, var_60460256)
{
	if(!isdefined(var_60460256))
	{
		var_60460256 = 0;
	}
	if(isdefined(self.var_72d64cfd))
	{
		self.var_72d64cfd = int(self.var_72d64cfd + var_72d64cfd);
		self function_b802c7fc(1, 0, var_60460256);
	}
}

/*
	Name: function_3610299b
	Namespace: sr_scrap
	Checksum: 0xE5D4A1A8
	Offset: 0x3F0
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_3610299b(var_595a11bc)
{
	var_595a11bc = self.var_595a11bc - var_595a11bc;
	var_595a11bc = max(var_595a11bc, 0);
	self.var_595a11bc = int(var_595a11bc);
	self function_b802c7fc(0, 1);
}

/*
	Name: function_8bfa3267
	Namespace: sr_scrap
	Checksum: 0xF3BA409C
	Offset: 0x468
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_8bfa3267(var_72d64cfd)
{
	var_72d64cfd = self.var_72d64cfd - var_72d64cfd;
	var_72d64cfd = max(var_72d64cfd, 0);
	self.var_72d64cfd = int(var_72d64cfd);
	self function_b802c7fc(1, 1);
}

/*
	Name: function_30398155
	Namespace: sr_scrap
	Checksum: 0xA2BA2303
	Offset: 0x4E0
	Size: 0x146
	Parameters: 1
	Flags: None
*/
function function_30398155(var_595a11bc)
{
	var_f791b58e = int(var_595a11bc);
	switch(var_f791b58e)
	{
		case 10:
		{
			id = 1;
			break;
		}
		case 20:
		{
			id = 2;
			break;
		}
		case 50:
		{
			id = 3;
			break;
		}
		case 100:
		{
			id = 4;
			break;
		}
		case 250:
		{
			id = 5;
			break;
		}
		case 500:
		{
			id = 6;
			break;
		}
		case 1000:
		{
			id = 7;
			break;
		}
		case 5000:
		{
			id = 8;
			break;
		}
		default:
		{
			id = 0;
			break;
		}
	}
	return id;
}

/*
	Name: function_c29a8aa1
	Namespace: sr_scrap
	Checksum: 0xD5B2AEDA
	Offset: 0x630
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_c29a8aa1(cost)
{
	var_88daa75e = self function_6f3fd157();
	leftover = var_88daa75e - cost;
	if(leftover >= 0)
	{
		return true;
	}
	return false;
}

/*
	Name: function_415b1e
	Namespace: sr_scrap
	Checksum: 0xBC6A2D64
	Offset: 0x690
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_415b1e(cost)
{
	var_88daa75e = self function_efd1d093();
	leftover = var_88daa75e - cost;
	if(leftover >= 0)
	{
		return true;
	}
	return false;
}

/*
	Name: function_b802c7fc
	Namespace: sr_scrap
	Checksum: 0x27593207
	Offset: 0x6F0
	Size: 0x134
	Parameters: 3
	Flags: Linked
*/
function function_b802c7fc(var_af05f9a2, take, var_60460256)
{
	if(!isdefined(var_af05f9a2))
	{
		var_af05f9a2 = 0;
	}
	if(!isdefined(take))
	{
		take = 0;
	}
	if(!isdefined(var_60460256))
	{
		var_60460256 = 0;
	}
	if(!isalive(self))
	{
		return;
	}
	self clientfield::set_player_uimodel("hudItems.scrap", (isdefined(self.var_595a11bc) ? self.var_595a11bc : 0));
	self clientfield::set_player_uimodel("hudItems.rareScrap", (isdefined(self.var_72d64cfd) ? self.var_72d64cfd : 0));
	self.killsconfirmed = self.var_595a11bc;
	self.killsdenied = self.var_72d64cfd;
	if(!take && !var_60460256)
	{
		if(var_af05f9a2)
		{
			self hud::function_32de5fc7();
		}
		else
		{
			self hud::function_8577b83e();
		}
	}
}

/*
	Name: function_e2e9d901
	Namespace: sr_scrap
	Checksum: 0x68A6B4D2
	Offset: 0x830
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_e2e9d901()
{
	/#
		util::waittill_can_add_debug_command();
		level thread function_27fca01f();
		cmd = "";
		adddebugcommand(cmd);
	#/
}

/*
	Name: function_27fca01f
	Namespace: sr_scrap
	Checksum: 0x7A69AE43
	Offset: 0x898
	Size: 0xE0
	Parameters: 0
	Flags: None
*/
function function_27fca01f()
{
	/#
		while(true)
		{
			if(getdvarint(#"hash_5499eefe1f37aa95", 0))
			{
				setdvar(#"hash_5499eefe1f37aa95", 0);
				array::thread_all(function_a1ef346b(), &function_afab250a, 5000);
				array::thread_all(function_a1ef346b(), &function_a6d4221f, 5000);
			}
			wait(0.1);
		}
	#/
}

