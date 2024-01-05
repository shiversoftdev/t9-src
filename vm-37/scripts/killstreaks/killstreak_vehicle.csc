#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\vehicles\driving_fx.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\killstreaks\killstreak_bundles.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace killstreak_vehicle;

/*
	Name: init
	Namespace: killstreak_vehicle
	Checksum: 0x8EBED116
	Offset: 0x100
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function init()
{
	level._effect[#"rcbomb_stunned"] = #"hash_622d3cdb93e01de5";
}

/*
	Name: init_killstreak
	Namespace: killstreak_vehicle
	Checksum: 0x2ADE0490
	Offset: 0x138
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function init_killstreak(bundle)
{
	if(isdefined(bundle.ksvehicle))
	{
		vehicle::add_vehicletype_callback(bundle.ksvehicle, &spawned, bundle);
	}
	if(isdefined(bundle.var_486124e6))
	{
		visionset_mgr::register_overlay_info_style_postfx_bundle(bundle.var_486124e6, 1, 1, bundle.var_486124e6);
	}
}

/*
	Name: spawned
	Namespace: killstreak_vehicle
	Checksum: 0x189C516D
	Offset: 0x1C0
	Size: 0xBC
	Parameters: 2
	Flags: Linked
*/
function spawned(localclientnum, bundle)
{
	self thread demo_think(localclientnum);
	self thread stunnedhandler(localclientnum);
	self thread boost_think(localclientnum);
	self thread shutdown_think(localclientnum);
	self.driving_fx_collision_override = &ondrivingfxcollision;
	self.driving_fx_jump_landing_override = &ondrivingfxjumplanding;
	self killstreak_bundles::spawned(localclientnum, bundle);
}

/*
	Name: demo_think
	Namespace: killstreak_vehicle
	Checksum: 0x7A079197
	Offset: 0x288
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function demo_think(localclientnum)
{
	self endon(#"death");
	if(!isdemoplaying())
	{
		return;
	}
	for(;;)
	{
		level waittill(#"demo_jump", #"demo_player_switch");
		self vehicle::lights_off(localclientnum);
	}
}

/*
	Name: boost_blur
	Namespace: killstreak_vehicle
	Checksum: 0xB0523C47
	Offset: 0x308
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function boost_blur(localclientnum)
{
	self endon(#"death");
	if(isdefined(self.owner) && self.owner function_21c0fa55())
	{
		enablespeedblur(localclientnum, getdvarfloat(#"scr_rcbomb_amount", 0.1), getdvarfloat(#"scr_rcbomb_inner_radius", 0.5), getdvarfloat(#"scr_rcbomb_outer_radius", 0.75), 0, 0);
		wait(getdvarfloat(#"scr_rcbomb_duration", 1));
		disablespeedblur(localclientnum);
	}
}

/*
	Name: boost_think
	Namespace: killstreak_vehicle
	Checksum: 0xECA1CFE4
	Offset: 0x428
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function boost_think(localclientnum)
{
	self endon(#"death");
	for(;;)
	{
		self waittill(#"veh_boost");
		self boost_blur(localclientnum);
	}
}

/*
	Name: shutdown_think
	Namespace: killstreak_vehicle
	Checksum: 0x35C4BB03
	Offset: 0x480
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function shutdown_think(localclientnum)
{
	self waittill(#"death");
	disablespeedblur(localclientnum);
}

/*
	Name: play_boost_fx
	Namespace: killstreak_vehicle
	Checksum: 0x9C152D07
	Offset: 0x4C0
	Size: 0xA0
	Parameters: 1
	Flags: None
*/
function play_boost_fx(localclientnum)
{
	self endon(#"death");
	while(true)
	{
		speed = self getspeed();
		if(speed > 400)
		{
			self playsound(localclientnum, #"mpl_veh_rc_boost");
			return;
		}
		util::server_wait(localclientnum, 0.1);
	}
}

/*
	Name: stunnedhandler
	Namespace: killstreak_vehicle
	Checksum: 0x4B003C
	Offset: 0x568
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function stunnedhandler(localclientnum)
{
	self endon(#"death");
	self thread enginestutterhandler(localclientnum);
	while(true)
	{
		self waittill(#"stunned");
		self setstunned(1);
		self thread notstunnedhandler(localclientnum);
		self thread play_stunned_fx_handler(localclientnum);
	}
}

/*
	Name: notstunnedhandler
	Namespace: killstreak_vehicle
	Checksum: 0x95C41849
	Offset: 0x610
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function notstunnedhandler(localclientnum)
{
	self endon(#"death");
	self endon(#"stunned");
	self waittill(#"not_stunned");
	self setstunned(0);
}

/*
	Name: play_stunned_fx_handler
	Namespace: killstreak_vehicle
	Checksum: 0x7B1D96CB
	Offset: 0x678
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function play_stunned_fx_handler(localclientnum)
{
	self endon(#"death");
	self endon(#"stunned");
	self endon(#"not_stunned");
	while(true)
	{
		util::playfxontag(localclientnum, level._effect[#"rcbomb_stunned"], self, "tag_origin");
		wait(0.5);
	}
}

/*
	Name: enginestutterhandler
	Namespace: killstreak_vehicle
	Checksum: 0xBFE8F6E
	Offset: 0x710
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function enginestutterhandler(localclientnum)
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"veh_engine_stutter");
		if(self function_4add50a7())
		{
			function_36e4ebd4(localclientnum, "rcbomb_engine_stutter");
		}
	}
}

/*
	Name: ondrivingfxcollision
	Namespace: killstreak_vehicle
	Checksum: 0x1DFB951E
	Offset: 0x788
	Size: 0x11C
	Parameters: 5
	Flags: Linked
*/
function ondrivingfxcollision(localclientnum, player, hip, hitn, hit_intensity)
{
	if(isdefined(hit_intensity) && hit_intensity > 15)
	{
		volume = driving_fx::get_impact_vol_from_speed();
		if(isdefined(self.sounddef))
		{
			alias = self.sounddef + "_suspension_lg_hd";
		}
		else
		{
			alias = "veh_default_suspension_lg_hd";
		}
		id = playsound(0, alias, self.origin, volume);
		earthquake(hip, 0.7, 0.25, hitn.origin, 1500);
		hitn playrumbleonentity(hip, "damage_heavy");
	}
}

/*
	Name: ondrivingfxjumplanding
	Namespace: killstreak_vehicle
	Checksum: 0x77EA4BD6
	Offset: 0x8B0
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function ondrivingfxjumplanding(localclientnum, player)
{
}

