#using script_324d329b31b9b4ec;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_1cc16eda;

/*
	Name: function_75e5f8c
	Namespace: namespace_1cc16eda
	Checksum: 0x5A807C2E
	Offset: 0x1D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_75e5f8c()
{
	level notify(1966147710);
}

#namespace supplydrop;

/*
	Name: init_shared
	Namespace: supplydrop
	Checksum: 0xA026FB1D
	Offset: 0x1F8
	Size: 0x294
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
		if(sessionmodeismultiplayergame() && is_false(getgametypesetting(#"useitemspawns")))
		{
			clientfield::register("scriptmover", "supply_drop_parachute_rob", 1, 1, "int", &function_6567bf42, 0, 0);
		}
		level.var_835198ed = getscriptbundle("killstreak_supply_drop");
	}
}

/*
	Name: function_4559c532
	Namespace: supplydrop
	Checksum: 0x13FA4FF2
	Offset: 0x498
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
	Checksum: 0x2875F502
	Offset: 0x610
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
	Checksum: 0xC35168DB
	Offset: 0x6A0
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
	Checksum: 0xFCC2AFA5
	Offset: 0x6E8
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
	Checksum: 0xA45C3548
	Offset: 0x758
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
	Checksum: 0x8C5ADDDA
	Offset: 0x7D8
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
	Checksum: 0x6703F2EB
	Offset: 0x910
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
	Checksum: 0x763C1570
	Offset: 0xA20
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
	Name: function_6567bf42
	Namespace: supplydrop
	Checksum: 0x5B082488
	Offset: 0xAA0
	Size: 0x12C
	Parameters: 7
	Flags: Linked
*/
function function_6567bf42(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self function_bf9d3071(#"hash_336cece53ae2342f");
	}
	else
	{
		self function_5d482e78(#"hash_336cece53ae2342f");
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
	Checksum: 0x5E537EF4
	Offset: 0xBD8
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
	Checksum: 0xB2351A19
	Offset: 0xE48
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

