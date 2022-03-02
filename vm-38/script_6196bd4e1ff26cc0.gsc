#using script_3f9e0dc8454d98e1;
#using script_5bb072c3abf4652c;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_65320816;

/*
	Name: function_c1c07d50
	Namespace: namespace_65320816
	Checksum: 0x4F98E49C
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c1c07d50()
{
	level notify(1905465086);
}

/*
	Name: function_89f2df9
	Namespace: namespace_65320816
	Checksum: 0xDE1A89BA
	Offset: 0x138
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2209575d9ead0b63", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_65320816
	Checksum: 0xC8C00DB1
	Offset: 0x180
	Size: 0x164
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	zombie_utility::set_zombie_var(#"hash_5926aba6d2b11cc", 0, 0, 1);
	zombie_utility::set_zombie_var(#"hash_5eb5d53a58400df8", 10, 0, 1);
	zm_powerups::register_powerup("cranked_pause", &function_1202eaf8);
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("cranked_pause", #"p9_zm_powerup_clock", #"hash_4beb7d0e9dfb41f4", &zm_powerups::func_should_always_drop, 0, 0, 0, undefined, "powerup_cranked_pause", "zombie_powerup_cranked_pause_time", "zombie_powerup_cranked_pause_on");
		zm_vo::function_2cf4b07f(#"hash_20c057e44a67cf98", #"hash_6f3de1197858ca4b");
		/#
			adddebugcommand("");
		#/
		/#
			adddebugcommand("");
		#/
	}
}

/*
	Name: function_1202eaf8
	Namespace: namespace_65320816
	Checksum: 0x66E19832
	Offset: 0x2F0
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_1202eaf8(player)
{
	if(!isplayer(player))
	{
		return;
	}
	level thread function_4ee6dbc3(self, player);
}

/*
	Name: function_4ee6dbc3
	Namespace: namespace_65320816
	Checksum: 0xF4A33E31
	Offset: 0x340
	Size: 0x1EC
	Parameters: 2
	Flags: Private
*/
function private function_4ee6dbc3(drop_item, player)
{
	self notify("72f8f7c4edceaa36");
	self endon("72f8f7c4edceaa36");
	level endon(#"end_game");
	team = player.team;
	level thread zm_powerups::show_on_hud(team, "cranked_pause", 10);
	players = getplayers();
	foreach(e_player in players)
	{
		if(isdefined(e_player) && isplayer(e_player) && isdefined(drop_item.hint))
		{
			e_player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", drop_item.hint);
		}
	}
	level flag::set("cranked_pause");
	playsoundatposition(#"hash_6add4f54cc6f196a", (0, 0, 0));
	wait(10);
	level flag::clear("cranked_pause");
	playsoundatposition(#"hash_54a9a9f2c8be8a9d", (0, 0, 0));
}

