#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace ir_strobe;

/*
	Name: init_shared
	Namespace: ir_strobe
	Checksum: 0x80D6114D
	Offset: 0x128
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
	Checksum: 0x989ACF2
	Offset: 0x1E8
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
	Checksum: 0x64DB91F9
	Offset: 0x340
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
		player notify(#"stop_previs");
	}
	if(isdefined(player.markerobj) && !player.markerobj hasdobj(fieldname))
	{
		return;
	}
}

/*
	Name: function_6f798989
	Namespace: ir_strobe
	Checksum: 0x2CD82909
	Offset: 0x478
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_6f798989(var_a27f7ab4)
{
	if(function_4e3684f2(self.localclientnum))
	{
		localclientnum = self.localclientnum;
	}
	else
	{
		localclientnum = self getlocalclientnumber();
	}
	if(isdefined(localclientnum) && isdefined(level.var_9c4cdb79[localclientnum]))
	{
		level.var_9c4cdb79[localclientnum] hide();
	}
}

/*
	Name: previs
	Namespace: ir_strobe
	Checksum: 0xE567F808
	Offset: 0x518
	Size: 0xCE
	Parameters: 2
	Flags: Linked
*/
function previs(localclientnum, invalid)
{
	self notify(#"stop_previs");
	self endoncallback(&function_6f798989, #"death", #"weapon_change", #"stop_previs");
	level.var_9c4cdb79[localclientnum] show();
	function_3e8d9b27(!invalid, localclientnum);
	while(true)
	{
		update_previs(localclientnum, invalid);
		waitframe(1);
	}
}

/*
	Name: spawn_previs
	Namespace: ir_strobe
	Checksum: 0x8422808C
	Offset: 0x5F0
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
	Name: update_previs
	Namespace: ir_strobe
	Checksum: 0xBD7A2866
	Offset: 0x668
	Size: 0x2E4
	Parameters: 2
	Flags: Linked
*/
function update_previs(localclientnum, invalid)
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
	Checksum: 0xDA0CA4C5
	Offset: 0x958
	Size: 0x174
	Parameters: 2
	Flags: Linked
*/
function function_3e8d9b27(validlocation, localclientnum)
{
	if(validlocation)
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

