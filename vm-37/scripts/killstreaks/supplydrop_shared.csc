#using script_324d329b31b9b4ec;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace supplydrop;

/*
	Name: init_shared
	Namespace: supplydrop
	Checksum: 0x2EC9336
	Offset: 0x1D8
	Size: 0x25C
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	if(!isdefined(level.var_ba8d5308))
	{
		level.var_ba8d5308 = {};
		ir_strobe::init_shared();
		params = getscriptbundle("killstreak_helicopter_guard");
		level._effect[#"heli_guard_light"][#"friendly"] = params.var_667eb0de;
		level._effect[#"heli_guard_light"][#"enemy"] = params.var_1d8c24a8;
		clientfield::register("vehicle", "supplydrop_care_package_state", 1, 1, "int", &supplydrop_care_package_state, 0, 0);
		clientfield::register("vehicle", "supplydrop_ai_tank_state", 1, 1, "int", &supplydrop_ai_tank_state, 0, 0);
		clientfield::register("vehicle", "" + #"hash_e4eb5c0853abab8", 6000, 1, "int", &function_feeeb71b, 0, 0);
		clientfield::register("scriptmover", "crate_landed", 1, 1, "int", &function_4559c532, 0, 0);
		if(sessionmodeismultiplayergame())
		{
			clientfield::register("scriptmover", "supply_drop_parachute_rob", 1, 1, "int", &supply_drop_parachute, 0, 0);
		}
		level.var_835198ed = getscriptbundle("killstreak_supply_drop");
	}
}

/*
	Name: function_4559c532
	Namespace: supplydrop
	Checksum: 0xA1366C41
	Offset: 0x440
	Size: 0x16C
	Parameters: 7
	Flags: Linked
*/
function function_4559c532(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		localplayer = function_5c10bd79(fieldname);
		if(localplayer !== self.owner)
		{
			self function_1f0c7136(2);
		}
		if(localplayer hasperk(fieldname, #"specialty_showscorestreakicons") || self.team == localplayer.team)
		{
			self setcompassicon(level.var_835198ed.var_cb98fbf7);
			self function_5e00861((isdefined(level.var_835198ed.var_c3e4af00) ? level.var_835198ed.var_c3e4af00 : 0));
			var_b13727dd = getgametypesetting("compassAnchorScorestreakIcons");
			self function_dce2238(var_b13727dd);
		}
	}
}

/*
	Name: function_724944f0
	Namespace: supplydrop
	Checksum: 0x129AA2CE
	Offset: 0x5B8
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function function_724944f0(localclientnum)
{
	player = self;
	player.markerfx = undefined;
	if(isdefined(player.markerobj))
	{
		player.markerobj delete();
	}
	if(isdefined(player.markerfxhandle))
	{
		killfx(localclientnum, player.markerfxhandle);
		player.markerfxhandle = undefined;
	}
}

/*
	Name: setupanimtree
	Namespace: supplydrop
	Checksum: 0xE7F77CB1
	Offset: 0x648
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function setupanimtree()
{
	if(self hasanimtree() == 0)
	{
		self useanimtree("generic");
	}
}

/*
	Name: supplydrop_care_package_state
	Namespace: supplydrop
	Checksum: 0x49E8F4BA
	Offset: 0x690
	Size: 0x62
	Parameters: 7
	Flags: Linked
*/
function supplydrop_care_package_state(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	if(bwastimejump == 1)
	{
	}
}

/*
	Name: supplydrop_ai_tank_state
	Namespace: supplydrop
	Checksum: 0x69324272
	Offset: 0x700
	Size: 0x76
	Parameters: 7
	Flags: Linked
*/
function supplydrop_ai_tank_state(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self setupanimtree();
	if(bwastimejump == 1)
	{
	}
}

/*
	Name: updatemarkerthread
	Namespace: supplydrop
	Checksum: 0x2ED1652F
	Offset: 0x780
	Size: 0x130
	Parameters: 1
	Flags: Linked
*/
function updatemarkerthread(localclientnum)
{
	self endoncallback(&function_724944f0, #"death");
	player = self;
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
	Name: stopcrateeffects
	Namespace: supplydrop
	Checksum: 0x68199158
	Offset: 0x8B8
	Size: 0x102
	Parameters: 1
	Flags: Linked
*/
function stopcrateeffects(localclientnum)
{
	crate = self;
	if(isdefined(crate.thrusterfxhandle0))
	{
		stopfx(localclientnum, crate.thrusterfxhandle0);
	}
	if(isdefined(crate.thrusterfxhandle1))
	{
		stopfx(localclientnum, crate.thrusterfxhandle1);
	}
	if(isdefined(crate.thrusterfxhandle2))
	{
		stopfx(localclientnum, crate.thrusterfxhandle2);
	}
	if(isdefined(crate.thrusterfxhandle3))
	{
		stopfx(localclientnum, crate.thrusterfxhandle3);
	}
	crate.thrusterfxhandle0 = undefined;
	crate.thrusterfxhandle1 = undefined;
	crate.thrusterfxhandle2 = undefined;
	crate.thrusterfxhandle3 = undefined;
}

/*
	Name: cleanupthrustersthread
	Namespace: supplydrop
	Checksum: 0x6F6EA7F3
	Offset: 0x9C8
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function cleanupthrustersthread(localclientnum)
{
	crate = self;
	crate notify(#"cleanupthrustersthread_singleton");
	crate endon(#"cleanupthrustersthread_singleton");
	crate waittill(#"death");
	crate stopcrateeffects(localclientnum);
}

/*
	Name: supply_drop_parachute
	Namespace: supplydrop
	Checksum: 0x1FD937E2
	Offset: 0xA48
	Size: 0x12C
	Parameters: 7
	Flags: Linked
*/
function supply_drop_parachute(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self playrenderoverridebundle(#"hash_336cece53ae2342f");
	}
	else
	{
		self stoprenderoverridebundle(#"hash_336cece53ae2342f");
		localplayer = function_5c10bd79(fieldname);
		owner = self getowner(fieldname);
		if(localplayer hasperk(fieldname, #"specialty_showscorestreakicons") || self.team == localplayer.team)
		{
			self setcompassicon("compass_supply_drop_white");
		}
	}
}

/*
	Name: marker_state_changed
	Namespace: supplydrop
	Checksum: 0x5F5ABB50
	Offset: 0xB80
	Size: 0x264
	Parameters: 7
	Flags: None
*/
function marker_state_changed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	player = self;
	killstreakcorebundle = getscriptbundle("killstreak_core");
	if(bwastimejump == 1)
	{
		player.markerfx = killstreakcorebundle.fxvalidlocation;
	}
	else
	{
		if(bwastimejump == 2)
		{
			player.markerfx = killstreakcorebundle.fxinvalidlocation;
		}
		else
		{
			player.markerfx = undefined;
		}
	}
	if(isdefined(player.markerobj) && !player.markerobj hasdobj(fieldname))
	{
		return;
	}
	if(isdefined(player.markerfxhandle))
	{
		killfx(fieldname, player.markerfxhandle);
		player.markerfxhandle = undefined;
	}
	if(isdefined(player.markerfx))
	{
		if(!isdefined(player.markerobj))
		{
			player.markerobj = spawn(fieldname, (0, 0, 0), "script_model");
			player.markerobj.angles = vectorscale((1, 0, 0), 270);
			player.markerobj setmodel(#"wpn_t7_none_world");
			player.markerobj util::waittill_dobj(fieldname);
			player thread updatemarkerthread(fieldname);
		}
		player.markerfxhandle = util::playfxontag(fieldname, player.markerfx, player.markerobj, "tag_origin");
	}
	else if(isdefined(player.markerobj))
	{
		player.markerobj delete();
	}
}

/*
	Name: function_feeeb71b
	Namespace: supplydrop
	Checksum: 0x5E3800BD
	Offset: 0xDF0
	Size: 0xAE
	Parameters: 7
	Flags: Linked
*/
function function_feeeb71b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.var_7246dab7 = util::playfxontag(fieldname, #"hash_47b44b1c6df28172", self, "tag_body");
	}
	else if(isdefined(self.var_7246dab7))
	{
		killfx(fieldname, self.var_7246dab7);
		self.var_7246dab7 = undefined;
	}
}

