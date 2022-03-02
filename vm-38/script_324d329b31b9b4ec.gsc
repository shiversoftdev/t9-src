#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_f0840611;

/*
	Name: function_5cd53df2
	Namespace: namespace_f0840611
	Checksum: 0x126DED6C
	Offset: 0x128
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5cd53df2()
{
	level notify(36060493);
}

#namespace ir_strobe;

/*
	Name: init_shared
	Namespace: ir_strobe
	Checksum: 0xEE2C0DD2
	Offset: 0x148
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	if(!isdefined(level.cin_gen_traversal_zipline_player_dismountrotor))
	{
		level.cin_gen_traversal_zipline_player_dismountrotor = {};
		clientfield::register("toplayer", "marker_state", 1, 2, "int", &marker_state_changed, 0, 0);
		level.var_9c4cdb79 = [];
	}
	forcestreamxmodel(#"wpn_t9_eqp_smoke_grenade_world_yellow");
	forcestreamxmodel(#"wpn_t9_eqp_smoke_grenade_world_red");
}

/*
	Name: updatemarkerthread
	Namespace: ir_strobe
	Checksum: 0x2EF176EF
	Offset: 0x208
	Size: 0x150
	Parameters: 1
	Flags: None
*/
function updatemarkerthread(localclientnum)
{
	self endon(#"death");
	player = self;
	localplayer = function_27673a7(localclientnum);
	if(player != localplayer)
	{
		return;
	}
	killstreakcorebundle = getscriptbundle("killstreak_core");
	while(isdefined(player.markerobj))
	{
		viewangles = getlocalclientangles(localclientnum);
		forwardvector = vectorscale(anglestoforward(viewangles), killstreakcorebundle.ksmaxairdroptargetrange);
		results = bullettrace(player geteye(), player geteye() + forwardvector, 0, player);
		player.markerobj.origin = results[#"position"];
		waitframe(1);
	}
}

/*
	Name: marker_state_changed
	Namespace: ir_strobe
	Checksum: 0x6E26D0C7
	Offset: 0x360
	Size: 0x12C
	Parameters: 7
	Flags: Linked
*/
function marker_state_changed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	player = self;
	killstreakcorebundle = getscriptbundle("killstreak_core");
	if(bwastimejump > 0)
	{
		if(!isdefined(level.var_9c4cdb79[fieldname]))
		{
			spawn_previs(fieldname);
		}
	}
	if(bwastimejump > 0)
	{
		player thread previs(fieldname, bwastimejump - 1);
	}
	else
	{
		player notify(#"hash_72e5eda620e4157");
	}
	if(isdefined(player.markerobj) && !player.markerobj hasdobj(fieldname))
	{
		return;
	}
}

/*
	Name: function_2b804e42
	Namespace: ir_strobe
	Checksum: 0x175E6C56
	Offset: 0x498
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_2b804e42(localclientnum)
{
	self waittill(#"death", #"weapon_change", #"hash_72e5eda620e4157");
	if(isdefined(level.var_9c4cdb79[localclientnum]))
	{
		level.var_9c4cdb79[localclientnum] hide();
	}
}

/*
	Name: previs
	Namespace: ir_strobe
	Checksum: 0xEEA725B0
	Offset: 0x518
	Size: 0xD6
	Parameters: 2
	Flags: Linked
*/
function previs(localclientnum, invalid)
{
	self notify(#"hash_72e5eda620e4157");
	self endon(#"death", #"weapon_change", #"hash_72e5eda620e4157");
	level.var_9c4cdb79[localclientnum] show();
	self thread function_2b804e42(localclientnum);
	function_3e8d9b27(!invalid, localclientnum);
	while(true)
	{
		function_82a8db78(localclientnum, invalid);
		waitframe(1);
	}
}

/*
	Name: spawn_previs
	Namespace: ir_strobe
	Checksum: 0x23F04176
	Offset: 0x5F8
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function spawn_previs(localclientnum)
{
	localplayer = function_5c10bd79(localclientnum);
	level.var_9c4cdb79[localclientnum] = spawn(localclientnum, (0, 0, 0), "script_model", localplayer getentitynumber());
}

/*
	Name: function_82a8db78
	Namespace: ir_strobe
	Checksum: 0xE81BF104
	Offset: 0x670
	Size: 0x2E4
	Parameters: 2
	Flags: Linked
*/
function function_82a8db78(localclientnum, invalid)
{
	player = self;
	facing_angles = getlocalclientangles(localclientnum);
	forward = anglestoforward(facing_angles);
	up = anglestoup(facing_angles);
	weapon = getweapon("ir_strobe");
	velocity = function_711c258(forward, up, weapon);
	eye_pos = getlocalclienteyepos(localclientnum);
	if(is_true(level.var_4970b0af))
	{
		radius = 10;
		trace1 = bullettrace(eye_pos, eye_pos + vectorscale(forward, 300), 0, player, 1);
		if(trace1[#"fraction"] >= 1)
		{
			trace1 = bullettrace(trace1[#"position"], trace1[#"position"] + (vectorscale((0, 0, -1), 1000)), 0, player, 1);
		}
	}
	else
	{
		trace1 = function_e6ba3ec9(eye_pos, velocity, 0, weapon);
	}
	level.var_9c4cdb79[localclientnum].origin = trace1[#"position"] + vectorscale(trace1[#"normal"], 7);
	level.var_9c4cdb79[localclientnum].angles = (0, vectortoangles(forward)[1] + 90, 0);
	level.var_9c4cdb79[localclientnum].hitent = trace1[#"entity"];
	if(invalid)
	{
		player function_bf191832(0, (0, 0, 0), (0, 0, 0));
	}
	else
	{
		player function_bf191832(1, level.var_9c4cdb79[localclientnum].origin, level.var_9c4cdb79[localclientnum].angles);
	}
}

/*
	Name: function_3e8d9b27
	Namespace: ir_strobe
	Checksum: 0xCD9EE2A8
	Offset: 0x960
	Size: 0x174
	Parameters: 2
	Flags: Linked
*/
function function_3e8d9b27(var_120d5014, localclientnum)
{
	if(var_120d5014)
	{
		level.var_9c4cdb79[localclientnum] setmodel(#"wpn_t9_eqp_smoke_grenade_world_yellow");
		if(isdefined(level.previs_fx))
		{
			stopfx(localclientnum, level.previs_fx);
		}
		level.previs_fx = function_239993de(localclientnum, "killstreaks/fx8_tankrobot_previs_valid", level.var_9c4cdb79[localclientnum], "tag_fx");
	}
	else
	{
		level.var_9c4cdb79[localclientnum] setmodel(#"wpn_t9_eqp_smoke_grenade_world_red");
		if(isdefined(level.previs_fx))
		{
			stopfx(localclientnum, level.previs_fx);
		}
		level.previs_fx = function_239993de(localclientnum, "killstreaks/fx8_tankrobot_previs_invalid", level.var_9c4cdb79[localclientnum], "tag_fx");
	}
	level.var_9c4cdb79[localclientnum] notsolid();
}

