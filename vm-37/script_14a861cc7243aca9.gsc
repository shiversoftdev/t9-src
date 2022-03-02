#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_7fe06af4;

/*
	Name: init
	Namespace: namespace_7fe06af4
	Checksum: 0x1B924B2A
	Offset: 0x140
	Size: 0x7C
	Parameters: 1
	Flags: Event
*/
event init(eventstruct)
{
	clientfield::register("world", "" + #"hash_5e7d02ead4a03f50", 1, 2, "int", &function_409efbe2, 0, 1);
	util::waitforclient(0);
}

/*
	Name: function_409efbe2
	Namespace: namespace_7fe06af4
	Checksum: 0xC4627CB
	Offset: 0x1C8
	Size: 0x32C
	Parameters: 7
	Flags: Linked
*/
function function_409efbe2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level.var_2a3e0e40 = bwastimejump;
	switch(level.var_2a3e0e40)
	{
		case 1:
		{
			var_5b93750e = "pstfx_tronworld";
			setsoundcontext("dark_aether", "active");
			playsound(fieldname, #"hash_2afe43c80293fb00", (0, 0, 0));
			var_1bb0b8aa = 1;
			level.var_d38af2b = var_5b93750e;
			break;
		}
		case 2:
		{
			var_5b93750e = "pstfx_tankworld";
			setsoundcontext("dark_aether", "active");
			playsound(fieldname, #"hash_2afe43c80293fb00", (0, 0, 0));
			var_1bb0b8aa = 1;
			level.var_d38af2b = var_5b93750e;
			break;
		}
		default:
		{
			setsoundcontext("dark_aether", "inactive");
			var_5b93750e = undefined;
			var_1bb0b8aa = 0;
			level.var_d38af2b = undefined;
		}
	}
	players = getlocalplayers();
	player = players[fieldname];
	if(isplayer(player))
	{
		player function_6456ec2c(fieldname, level.var_2a3e0e40);
	}
	function_d024972a(fieldname, var_1bb0b8aa);
	if(isdefined(level.var_d38af2b))
	{
		function_2cca7b47(fieldname, #"hash_1ecdcf251e36d7b2");
		callback::on_spawned(&on_player_spawned);
		callback::function_e9e16e2f(&function_e9e16e2f);
		callback::on_player_corpse(&on_player_corpse);
		return;
	}
	callback::remove_on_spawned(&on_player_spawned);
	callback::function_e9e16e2f(&function_e9e16e2f);
	callback::on_player_corpse(&on_player_corpse);
}

/*
	Name: on_player_spawned
	Namespace: namespace_7fe06af4
	Checksum: 0x16B987BE
	Offset: 0x500
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function on_player_spawned(localclientnum)
{
	self function_6456ec2c(localclientnum, level.var_2a3e0e40);
}

/*
	Name: function_e9e16e2f
	Namespace: namespace_7fe06af4
	Checksum: 0x295E4BF3
	Offset: 0x538
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_e9e16e2f(params)
{
	localclientnum = params.localclientnum;
	player = getlocalplayers()[localclientnum];
	if(isplayer(player))
	{
		player function_6456ec2c(localclientnum, level.var_2a3e0e40);
	}
}

/*
	Name: on_player_corpse
	Namespace: namespace_7fe06af4
	Checksum: 0x2AFBEC48
	Offset: 0x5C0
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function on_player_corpse(localclientnum, params)
{
	self function_6456ec2c(params, level.var_2a3e0e40);
}

/*
	Name: function_6456ec2c
	Namespace: namespace_7fe06af4
	Checksum: 0xB4B6DC0B
	Offset: 0x600
	Size: 0x1C4
	Parameters: 2
	Flags: Linked
*/
function function_6456ec2c(localclientnum, newval)
{
	player = self;
	if(level.var_d38af2b !== level.var_325b4fce)
	{
		player postfx::stoppostfxbundle("pstfx_scantron");
		player postfx::stoppostfxbundle("pstfx_tronsition");
		player postfx::stoppostfxbundle("pstfx_tronsportation");
		player postfx::stoppostfxbundle("pstfx_tankworld");
		player postfx::stoppostfxbundle("pstfx_tronworld");
		level.var_a2dc4819 = 0;
	}
	level.var_325b4fce = level.var_d38af2b;
	if(isdefined(level.var_325b4fce))
	{
		if(!is_true(level.var_a2dc4819))
		{
			player postfx::playpostfxbundle("pstfx_tronsition");
			player postfx::playpostfxbundle("pstfx_tronsportation");
		}
		level.var_a2dc4819 = 1;
		player postfx::playpostfxbundle(level.var_325b4fce);
		if(level.var_325b4fce === "pstfx_tronworld")
		{
			player postfx::playpostfxbundle("pstfx_scantron");
		}
	}
}

/*
	Name: function_d024972a
	Namespace: namespace_7fe06af4
	Checksum: 0x73EEADEB
	Offset: 0x7D0
	Size: 0xF8
	Parameters: 2
	Flags: Linked
*/
function function_d024972a(localclientnum, var_1bb0b8aa)
{
	if(!isdefined(var_1bb0b8aa))
	{
		var_1bb0b8aa = 0;
	}
	foreach(player in getplayers(localclientnum))
	{
		if(isplayer(player) && player.team !== function_73f4b33(localclientnum))
		{
			player renderoverridebundle::function_f4eab437(localclientnum, var_1bb0b8aa, "rob_sonar_set_enemy");
		}
	}
}

