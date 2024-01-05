#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace zombie_vortex;

/*
	Name: __init__system__
	Namespace: zombie_vortex
	Checksum: 0xE26DF67
	Offset: 0x1F0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"vortex", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zombie_vortex
	Checksum: 0x214B44A3
	Offset: 0x238
	Size: 0x114
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	visionset_mgr::register_visionset_info("zm_idgun_vortex" + "_visionset", 1, 30, undefined, "zm_idgun_vortex");
	visionset_mgr::register_overlay_info_style_speed_blur("zm_idgun_vortex" + "_blur", 1, 1, 0.08, 0.75, 0.9);
	clientfield::register("scriptmover", "vortex_start", 1, 2, "counter", &start_vortex, 0, 0);
	clientfield::register("allplayers", "vision_blur", 1, 1, "int", &vision_blur, 0, 0);
}

/*
	Name: start_vortex
	Namespace: zombie_vortex
	Checksum: 0x22FBEDA8
	Offset: 0x358
	Size: 0x1AC
	Parameters: 7
	Flags: Linked
*/
function start_vortex(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self endon(#"disconnect");
	if(!isdefined(bwastimejump) || bwastimejump == 0)
	{
		return;
	}
	e_player = function_5c10bd79(binitialsnap);
	vposition = self.origin;
	bwastimejump = bwastimejump - fieldname;
	if(bwastimejump == 2)
	{
		registerplayer_lift_clipbamfupdate = "zombie/fx_idgun_vortex_ug_zod_zmb";
		fx_vortex_explosion = "zombie/fx_idgun_vortex_explo_ug_zod_zmb";
		n_vortex_time = 10;
	}
	else
	{
		registerplayer_lift_clipbamfupdate = "zombie/fx_idgun_vortex_zod_zmb";
		fx_vortex_explosion = "zombie/fx_idgun_vortex_explo_zod_zmb";
		n_vortex_time = 5;
	}
	vortex_fx_handle = playfx(binitialsnap, registerplayer_lift_clipbamfupdate, vposition);
	setfxignorepause(binitialsnap, vortex_fx_handle, 1);
	audio::playloopat("evt_doa_pickup_vortex_active_lp", vposition);
	self thread vortex_shake_and_rumble(binitialsnap, vposition);
	self thread function_2dd3c5bc(binitialsnap, vortex_fx_handle, vposition, fx_vortex_explosion, n_vortex_time);
}

/*
	Name: vortex_shake_and_rumble
	Namespace: zombie_vortex
	Checksum: 0xD4C32BFE
	Offset: 0x510
	Size: 0x60
	Parameters: 2
	Flags: Linked
*/
function vortex_shake_and_rumble(localclientnum, v_vortex_origin)
{
	self endon(#"vortex_stop");
	while(true)
	{
		self playrumbleonentity(v_vortex_origin, "zod_idgun_vortex_interior");
		wait(0.075);
	}
}

/*
	Name: vision_blur
	Namespace: zombie_vortex
	Checksum: 0xFBE5EFDC
	Offset: 0x578
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function vision_blur(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		enablespeedblur(fieldname, 0.1, 0.5, 0.75);
	}
	else
	{
		disablespeedblur(fieldname);
	}
}

/*
	Name: function_2dd3c5bc
	Namespace: zombie_vortex
	Checksum: 0xD369F98B
	Offset: 0x610
	Size: 0x1FC
	Parameters: 5
	Flags: Linked
*/
function function_2dd3c5bc(localclientnum, vortex_fx_handle, vposition, fx_vortex_explosion, n_vortex_time)
{
	e_player = function_5c10bd79(localclientnum);
	n_starttime = e_player getclienttime();
	n_currtime = e_player getclienttime() - n_starttime;
	n_vortex_time = int(n_vortex_time * 1000);
	while(n_currtime < n_vortex_time)
	{
		waitframe(1);
		n_currtime = e_player getclienttime() - n_starttime;
	}
	stopfx(localclientnum, vortex_fx_handle);
	audio::stoploopat("evt_doa_pickup_vortex_active_lp", vposition);
	wait(0.15);
	self notify(#"vortex_stop");
	var_ad8208a9 = playfx(localclientnum, fx_vortex_explosion, vposition);
	setfxignorepause(localclientnum, var_ad8208a9, 1);
	playsound(0, #"evt_doa_pickup_vortex_explode", vposition);
	waitframe(1);
	self playrumbleonentity(localclientnum, "zod_idgun_vortex_shockwave");
	vision_blur(localclientnum, undefined, 1);
	wait(0.1);
	vision_blur(localclientnum, undefined, 0);
}

