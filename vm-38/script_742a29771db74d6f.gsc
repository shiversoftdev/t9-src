#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class czm_arcade_timer : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: czm_arcade_timer
		Checksum: 0xF3FC2445
		Offset: 0x838
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: czm_arcade_timer
		Checksum: 0xFB1DBB61
		Offset: 0xAD8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: czm_arcade_timer
		Checksum: 0x64022167
		Offset: 0x920
		Size: 0x3C
		Parameters: 2
		Flags: None
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_minutes
		Namespace: czm_arcade_timer
		Checksum: 0x2DDF93AA
		Offset: 0xA38
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_minutes(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "minutes", value);
	}

	/*
		Name: set_title
		Namespace: czm_arcade_timer
		Checksum: 0x55583BA4
		Offset: 0xA88
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_title(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "title", value);
	}

	/*
		Name: close
		Namespace: czm_arcade_timer
		Checksum: 0x1ABE138B
		Offset: 0x968
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_showzero
		Namespace: czm_arcade_timer
		Checksum: 0x87C7680
		Offset: 0x998
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_showzero(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showzero", value);
	}

	/*
		Name: setup_clientfields
		Namespace: czm_arcade_timer
		Checksum: 0x41ED147F
		Offset: 0x858
		Size: 0xBC
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("zm_arcade_timer");
		cluielem::add_clientfield("showzero", 1, 1, "int");
		cluielem::add_clientfield("seconds", 1, 6, "int");
		cluielem::add_clientfield("minutes", 1, 4, "int");
		cluielem::function_dcb34c80("string", "title", 1);
	}

	/*
		Name: set_seconds
		Namespace: czm_arcade_timer
		Checksum: 0xDEEB2D09
		Offset: 0x9E8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_seconds(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "seconds", value);
	}

}

#namespace zm_arcade_timer;

/*
	Name: function_448a4d63
	Namespace: zm_arcade_timer
	Checksum: 0xE4C77F4C
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_448a4d63()
{
	level notify(-1616720831);
}

/*
	Name: set_timer
	Namespace: zm_arcade_timer
	Checksum: 0x728EA3E7
	Offset: 0x110
	Size: 0x134
	Parameters: 3
	Flags: None
*/
function set_timer(player, var_c895e25d, var_b1100790)
{
	self open_timer(player);
	n_minutes = int(floor(var_c895e25d / 60));
	n_seconds = int(var_c895e25d - (n_minutes * 60));
	self set_minutes(player, n_minutes);
	self set_seconds(player, n_seconds);
	if(n_seconds < 10)
	{
		self set_showzero(player, 1);
	}
	else
	{
		self set_showzero(player, 0);
	}
	if(isdefined(var_b1100790))
	{
		self set_title(player, var_b1100790);
	}
}

/*
	Name: function_e7a1c8a4
	Namespace: zm_arcade_timer
	Checksum: 0xA5AEF17B
	Offset: 0x250
	Size: 0xC8
	Parameters: 1
	Flags: None
*/
function function_e7a1c8a4(str_notify)
{
	foreach(player in level.players)
	{
		if(isdefined(level.var_f5682bb8) && level.var_f5682bb8 is_open(player))
		{
			level.var_f5682bb8 close(player);
		}
	}
}

/*
	Name: function_88df772a
	Namespace: zm_arcade_timer
	Checksum: 0xC38DB2A9
	Offset: 0x320
	Size: 0x18C
	Parameters: 4
	Flags: None
*/
function function_88df772a(player, var_c895e25d, var_b1100790, var_f0996295)
{
	if(!isdefined(var_f0996295))
	{
		var_f0996295 = 0;
	}
	player endon(#"disconnect", #"hash_660dedc4af5b4336");
	level endoncallback(&function_e7a1c8a4, #"end_game");
	if(!var_f0996295)
	{
		player endoncallback(&function_57490fd5, #"hash_2a4a6c3c411261d8");
	}
	self function_ecffd525(player);
	if(var_f0996295 || !isdefined(player.var_26b0547b))
	{
		player.var_26b0547b = var_b1100790;
	}
	while(var_c895e25d >= 0)
	{
		if(player.var_26b0547b === var_b1100790)
		{
			self set_timer(player, var_c895e25d, var_b1100790);
		}
		wait(1);
		var_c895e25d--;
		if(!isdefined(player.var_26b0547b))
		{
			player.var_26b0547b = var_b1100790;
		}
	}
	if(player.var_26b0547b === var_b1100790)
	{
		player.var_26b0547b = undefined;
	}
	self function_9bab3960(player, 0, var_b1100790);
}

/*
	Name: function_57490fd5
	Namespace: zm_arcade_timer
	Checksum: 0x8731D100
	Offset: 0x4B8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_57490fd5(str_notify)
{
	if(!isdefined(self.var_e325b124))
	{
		self.var_e325b124 = 0;
	}
	if(self.var_e325b124 > 0)
	{
		self.var_e325b124--;
	}
}

/*
	Name: function_ecffd525
	Namespace: zm_arcade_timer
	Checksum: 0x54112A9D
	Offset: 0x500
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_ecffd525(player)
{
	if(!isdefined(player.var_e325b124))
	{
		player.var_e325b124 = 0;
	}
	player.var_e325b124++;
	self open_timer(player);
}

/*
	Name: open_timer
	Namespace: zm_arcade_timer
	Checksum: 0xE32E2A48
	Offset: 0x550
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function open_timer(player)
{
	if(!self is_open(player))
	{
		self open(player, 1);
	}
}

/*
	Name: function_9bab3960
	Namespace: zm_arcade_timer
	Checksum: 0x1840ACEB
	Offset: 0x5A0
	Size: 0x100
	Parameters: 3
	Flags: None
*/
function function_9bab3960(player, b_force_close, var_b1100790)
{
	if(!isdefined(b_force_close))
	{
		b_force_close = 0;
	}
	if(!isdefined(player.var_e325b124))
	{
		player.var_e325b124 = 0;
	}
	player.var_e325b124--;
	if(player.var_26b0547b === var_b1100790)
	{
		player.var_26b0547b = undefined;
	}
	if(self is_open(player) && (player.var_e325b124 <= 0 || b_force_close))
	{
		player.var_e325b124 = 0;
		self close(player);
		player notify(#"hash_2a4a6c3c411261d8");
		player.var_26b0547b = undefined;
		if(b_force_close)
		{
			player notify(#"hash_660dedc4af5b4336");
		}
	}
}

/*
	Name: register
	Namespace: zm_arcade_timer
	Checksum: 0xA8DD65E9
	Offset: 0x6A8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new czm_arcade_timer();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_arcade_timer
	Checksum: 0xF24EDB05
	Offset: 0x6E8
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function open(player, flags)
{
	if(!isdefined(flags))
	{
		flags = 0;
	}
	[[ self ]]->open(player, flags);
}

/*
	Name: close
	Namespace: zm_arcade_timer
	Checksum: 0xABE31A25
	Offset: 0x728
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: zm_arcade_timer
	Checksum: 0x97887C37
	Offset: 0x750
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_showzero
	Namespace: zm_arcade_timer
	Checksum: 0x4A75530B
	Offset: 0x778
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showzero(player, value)
{
	[[ self ]]->set_showzero(player, value);
}

/*
	Name: set_seconds
	Namespace: zm_arcade_timer
	Checksum: 0xD74DAA7E
	Offset: 0x7A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_seconds(player, value)
{
	[[ self ]]->set_seconds(player, value);
}

/*
	Name: set_minutes
	Namespace: zm_arcade_timer
	Checksum: 0x36F827E
	Offset: 0x7D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_minutes(player, value)
{
	[[ self ]]->set_minutes(player, value);
}

/*
	Name: set_title
	Namespace: zm_arcade_timer
	Checksum: 0x20E63CC0
	Offset: 0x808
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_title(player, value)
{
	[[ self ]]->set_title(player, value);
}

