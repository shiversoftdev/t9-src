#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace namespace_65320816;

/*
	Name: __init__system__
	Namespace: namespace_65320816
	Checksum: 0xA62887B7
	Offset: 0x118
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_2209575d9ead0b63", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_65320816
	Checksum: 0x781772D8
	Offset: 0x160
	Size: 0x164
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	zombie_utility::set_zombie_var(#"zombie_powerup_cranked_pause_on", 0, 0, 1);
	zombie_utility::set_zombie_var(#"zombie_powerup_cranked_pause_time", 10, 0, 1);
	zm_powerups::register_powerup("cranked_pause", &function_1202eaf8);
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("cranked_pause", #"p9_zm_powerup_clock", #"hash_4beb7d0e9dfb41f4", &zm_powerups::func_should_always_drop, 0, 0, 0, undefined, "powerup_cranked_pause", "zombie_powerup_cranked_pause_time", "zombie_powerup_cranked_pause_on");
		zm_vo::function_2cf4b07f(#"cranked_pause", #"hash_6f3de1197858ca4b");
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
	Checksum: 0xD13B3CBD
	Offset: 0x2D0
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
	Checksum: 0x333A671C
	Offset: 0x320
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

