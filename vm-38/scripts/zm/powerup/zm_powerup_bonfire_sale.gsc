#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_powerup_bonfire_sale;

/*
	Name: function_e1263c28
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x8E4A1E93
	Offset: 0x1A8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e1263c28()
{
	level notify(-693650125);
}

/*
	Name: __init__system__
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x8195C132
	Offset: 0x1C8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_bonfire_sale", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x868CBB46
	Offset: 0x220
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::register_powerup("bonfire_sale", &grab_bonfire_sale);
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("bonfire_sale", "p8_zm_power_up_bonfire_sale", #"hash_35f38d29d068c30d", &zm_powerups::func_should_never_drop, 0, 0, 0, undefined, "powerup_bon_fire", "zombie_powerup_bonfire_sale_time", "zombie_powerup_bonfire_sale_on");
	}
}

/*
	Name: function_8ac3bea9
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x80F724D1
	Offset: 0x2C8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: grab_bonfire_sale
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x51EE1DCB
	Offset: 0x2D8
	Size: 0x124
	Parameters: 1
	Flags: Linked
*/
function grab_bonfire_sale(player)
{
	players = getplayers();
	foreach(e_player in players)
	{
		if(isdefined(e_player) && isplayer(e_player) && isdefined(self.hint))
		{
			e_player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", self.hint);
		}
	}
	level thread start_bonfire_sale(self);
	player thread zm_powerups::powerup_vo("bonfiresale");
}

/*
	Name: start_bonfire_sale
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0xE0EE7F97
	Offset: 0x408
	Size: 0x26C
	Parameters: 1
	Flags: Linked
*/
function start_bonfire_sale(item)
{
	level notify(#"powerup bonfire sale");
	level endon(#"powerup bonfire sale");
	temp_ent = spawn("script_origin", (0, 0, 0));
	temp_ent playloopsound(#"zmb_double_point_loop");
	zombie_utility::set_zombie_var(#"zombie_powerup_bonfire_sale_on", 1);
	level thread toggle_bonfire_sale_on();
	zombie_utility::set_zombie_var(#"zombie_powerup_bonfire_sale_time", 30);
	if(bgb::is_team_enabled("zm_bgb_temporal_gift"))
	{
		zombie_utility::set_zombie_var(#"zombie_powerup_bonfire_sale_time", zombie_utility::function_d2dfacfd(#"zombie_powerup_bonfire_sale_time") + 30);
	}
	while(zombie_utility::function_d2dfacfd(#"zombie_powerup_bonfire_sale_time") > 0)
	{
		waitframe(1);
		zombie_utility::set_zombie_var(#"zombie_powerup_bonfire_sale_time", zombie_utility::function_d2dfacfd(#"zombie_powerup_bonfire_sale_time") - 0.05);
	}
	zombie_utility::set_zombie_var(#"zombie_powerup_bonfire_sale_on", 0);
	level notify(#"bonfire_sale_off");
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] playsound(#"zmb_points_loop_off");
	}
	temp_ent delete();
}

/*
	Name: toggle_bonfire_sale_on
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x2DCB01F8
	Offset: 0x680
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function toggle_bonfire_sale_on()
{
	level endon(#"powerup bonfire sale");
	if(!isdefined(zombie_utility::function_d2dfacfd(#"zombie_powerup_bonfire_sale_on")))
	{
		return;
	}
	if(zombie_utility::function_d2dfacfd(#"zombie_powerup_bonfire_sale_on"))
	{
		if(isdefined(level.bonfire_init_func))
		{
			level thread [[level.bonfire_init_func]]();
		}
		level waittill(#"bonfire_sale_off");
	}
}

/*
	Name: setup_bonfiresale_audio
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0xBA56E2
	Offset: 0x728
	Size: 0xFC
	Parameters: 0
	Flags: None
*/
function setup_bonfiresale_audio()
{
	wait(2);
	intercom = getentarray("intercom", "targetname");
	while(true)
	{
		while(zombie_utility::function_d2dfacfd(#"zombie_powerup_fire_sale_on") == 0)
		{
			wait(0.2);
		}
		for(i = 0; i < intercom.size; i++)
		{
			intercom[i] thread play_bonfiresale_audio();
		}
		while(zombie_utility::function_d2dfacfd(#"zombie_powerup_fire_sale_on") == 1)
		{
			wait(0.1);
		}
		level notify(#"firesale_over");
	}
}

/*
	Name: play_bonfiresale_audio
	Namespace: zm_powerup_bonfire_sale
	Checksum: 0x4BCD3F59
	Offset: 0x830
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function play_bonfiresale_audio()
{
	if(is_true(level.sndfiresalemusoff))
	{
		return;
	}
	if(is_true(level.sndannouncerisrich))
	{
		self playloopsound(#"mus_fire_sale_rich");
	}
	else
	{
		self playloopsound(#"mus_fire_sale");
	}
	level waittill(#"firesale_over");
	self stoploopsound();
}

