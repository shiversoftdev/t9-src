#using scripts\core_common\math_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace drown;

/*
	Name: function_6a4f9f38
	Namespace: drown
	Checksum: 0x7459ADF6
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6a4f9f38()
{
	level notify(-659422732);
}

/*
	Name: __init__system__
	Namespace: drown
	Checksum: 0x70B952BB
	Offset: 0xD8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"drown", &function_70a657d8, undefined, undefined, #"visionset_mgr");
}

/*
	Name: function_70a657d8
	Namespace: drown
	Checksum: 0x31744EF7
	Offset: 0x128
	Size: 0xBC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "drown_stage", 1, 3, "int", &drown_stage_callback, 0, 0);
	callback::on_localplayer_spawned(&player_spawned);
	visionset_mgr::register_overlay_info_style_speed_blur("drown_blur", 1, 1, 0.04, 1, 1, 0, 0, 125, 125, 0);
	setup_radius_values();
}

/*
	Name: setup_radius_values
	Namespace: drown
	Checksum: 0xC9D627C
	Offset: 0x1F0
	Size: 0x4B6
	Parameters: 0
	Flags: Linked
*/
function setup_radius_values()
{
	level.drown_radius[#"inner"][#"begin"][1] = 0.8;
	level.drown_radius[#"inner"][#"begin"][2] = 0.6;
	level.drown_radius[#"inner"][#"begin"][3] = 0.6;
	level.drown_radius[#"inner"][#"begin"][4] = 0.5;
	level.drown_radius[#"inner"][#"end"][1] = 0.5;
	level.drown_radius[#"inner"][#"end"][2] = 0.3;
	level.drown_radius[#"inner"][#"end"][3] = 0.3;
	level.drown_radius[#"inner"][#"end"][4] = 0.2;
	level.drown_radius[#"outer"][#"begin"][1] = 1;
	level.drown_radius[#"outer"][#"begin"][2] = 0.8;
	level.drown_radius[#"outer"][#"begin"][3] = 0.8;
	level.drown_radius[#"outer"][#"begin"][4] = 0.7;
	level.drown_radius[#"outer"][#"end"][1] = 0.8;
	level.drown_radius[#"outer"][#"end"][2] = 0.6;
	level.drown_radius[#"outer"][#"end"][3] = 0.6;
	level.drown_radius[#"outer"][#"end"][4] = 0.5;
	level.opacity[#"begin"][1] = 0.4;
	level.opacity[#"begin"][2] = 0.5;
	level.opacity[#"begin"][3] = 0.6;
	level.opacity[#"begin"][4] = 0.6;
	level.opacity[#"end"][1] = 0.5;
	level.opacity[#"end"][2] = 0.6;
	level.opacity[#"end"][3] = 0.7;
	level.opacity[#"end"][4] = 0.7;
}

/*
	Name: player_spawned
	Namespace: drown
	Checksum: 0xF2905A47
	Offset: 0x6B0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function player_spawned(localclientnum)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	self player_init_drown_values();
	self thread player_watch_drown_shutdown(localclientnum);
}

/*
	Name: player_init_drown_values
	Namespace: drown
	Checksum: 0x154E4CDF
	Offset: 0x710
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function player_init_drown_values()
{
	if(!isdefined(self.drown_start_time))
	{
		self.drown_start_time = 0;
		self.drown_outerradius = 0;
		self.drown_innerradius = 0;
		self.drown_opacity = 0;
	}
}

/*
	Name: player_watch_drown_shutdown
	Namespace: drown
	Checksum: 0xF9867746
	Offset: 0x758
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function player_watch_drown_shutdown(localclientnum)
{
	self waittill(#"death");
	self disable_drown(localclientnum);
}

/*
	Name: function_1a9dc208
	Namespace: drown
	Checksum: 0xA1A15B66
	Offset: 0x7A0
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_1a9dc208()
{
	playerrole = self getrolefields();
	/#
		assert(isdefined(playerrole));
	#/
	if(isdefined(playerrole))
	{
		return int(playerrole.var_f0886300 * 1000);
	}
	return 2000;
}

/*
	Name: enable_drown
	Namespace: drown
	Checksum: 0xB4252D4F
	Offset: 0x828
	Size: 0x7A
	Parameters: 2
	Flags: Linked
*/
function enable_drown(localclientnum, stage)
{
	self.drown_start_time = getservertime(localclientnum) - (stage - 1) * self function_1a9dc208();
	self.drown_outerradius = 0;
	self.drown_innerradius = 0;
	self.drown_opacity = 0;
}

/*
	Name: disable_drown
	Namespace: drown
	Checksum: 0xFBE6DC0E
	Offset: 0x8B0
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function disable_drown(localclientnum)
{
}

/*
	Name: player_drown_fx
	Namespace: drown
	Checksum: 0x44AB4CEA
	Offset: 0x8C8
	Size: 0x2F4
	Parameters: 2
	Flags: Linked
*/
function player_drown_fx(localclientnum, stage)
{
	self endon(#"death");
	self endon(#"player_fade_out_drown_fx");
	self notify(#"player_drown_fx");
	self endon(#"player_drown_fx");
	self player_init_drown_values();
	var_f0886300 = self function_1a9dc208();
	lastoutwatertimestage = self.drown_start_time + ((stage - 1) * var_f0886300);
	stageduration = var_f0886300;
	if(stage == 1)
	{
		stageduration = 2000;
	}
	while(true)
	{
		currenttime = getservertime(localclientnum);
		elapsedtime = currenttime - self.drown_start_time;
		stageratio = math::clamp((currenttime - lastoutwatertimestage) / stageduration, 0, 1);
		if(!isdefined(stage))
		{
			stage = 1;
		}
		stage = math::clamp(stage, 1, 4);
		self.drown_outerradius = lerpfloat(level.drown_radius[#"outer"][#"begin"][stage], level.drown_radius[#"outer"][#"end"][stage], stageratio) * 1.41421;
		self.drown_innerradius = lerpfloat(level.drown_radius[#"inner"][#"begin"][stage], level.drown_radius[#"inner"][#"end"][stage], stageratio) * 1.41421;
		self.drown_opacity = lerpfloat(level.opacity[#"begin"][stage], level.opacity[#"end"][stage], stageratio);
		waitframe(1);
	}
}

/*
	Name: player_fade_out_drown_fx
	Namespace: drown
	Checksum: 0x54E9E718
	Offset: 0xBC8
	Size: 0x194
	Parameters: 1
	Flags: Linked
*/
function player_fade_out_drown_fx(localclientnum)
{
	self endon(#"death");
	self endon(#"player_drown_fx");
	self notify(#"player_fade_out_drown_fx");
	self endon(#"player_fade_out_drown_fx");
	self player_init_drown_values();
	fadestarttime = getservertime(localclientnum);
	currenttime = getservertime(localclientnum);
	while(currenttime - fadestarttime < 250)
	{
		ratio = (currenttime - fadestarttime) / 250;
		outerradius = lerpfloat(self.drown_outerradius, 1.41421, ratio);
		innerradius = lerpfloat(self.drown_innerradius, 1.41421, ratio);
		opacity = lerpfloat(self.drown_opacity, 0, ratio);
		waitframe(1);
		currenttime = getservertime(localclientnum);
	}
	self disable_drown(localclientnum);
}

/*
	Name: drown_stage_callback
	Namespace: drown
	Checksum: 0x8C4E4168
	Offset: 0xD68
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function drown_stage_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(fieldname > 0)
	{
		self enable_drown(binitialsnap, fieldname);
		self thread player_drown_fx(binitialsnap, fieldname);
	}
	else
	{
		if(!bwastimejump)
		{
			self thread player_fade_out_drown_fx(binitialsnap);
		}
		else
		{
			self disable_drown(binitialsnap);
		}
	}
}

