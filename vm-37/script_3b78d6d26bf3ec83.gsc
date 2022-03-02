#using script_13da4e6b98ca81a1;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace jammer;

/*
	Name: function_89f2df9
	Namespace: jammer
	Checksum: 0x929F8713
	Offset: 0x1C0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"gadget_jammer", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: jammer
	Checksum: 0x9DAAD88B
	Offset: 0x208
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

/*
	Name: init_shared
	Namespace: jammer
	Checksum: 0xF227CE36
	Offset: 0x228
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	if(!isdefined(level.var_578f7c6d))
	{
		level.var_578f7c6d = spawnstruct();
	}
	level.var_578f7c6d.weapon = getweapon(#"gadget_jammer");
	level.var_c20391e9 = getdvarint(#"hash_7f7f1118da837313", level.var_578f7c6d.weapon.explosionradius);
	if(!isdefined(level.var_6d8e6535))
	{
		level.var_6d8e6535 = [];
	}
	registerclientfields();
	callback::on_localclient_connect(&on_localplayer_connect);
}

/*
	Name: register
	Namespace: jammer
	Checksum: 0xCA4C1381
	Offset: 0x320
	Size: 0x22
	Parameters: 2
	Flags: None
*/
function register(entity, var_b89c18)
{
	entity.var_a19988fc = var_b89c18;
}

/*
	Name: registerclientfields
	Namespace: jammer
	Checksum: 0x88962D75
	Offset: 0x350
	Size: 0x244
	Parameters: 0
	Flags: Linked, Private
*/
function private registerclientfields()
{
	clientfield::register("scriptmover", "isJammed", 1, 1, "int", &function_43a5b68a, 0, 0);
	clientfield::register("missile", "isJammed", 1, 1, "int", &function_43a5b68a, 0, 0);
	clientfield::register("vehicle", "isJammed", 1, 1, "int", &function_43a5b68a, 0, 0);
	clientfield::register("toplayer", "isJammed", 1, 1, "int", &player_isjammed, 0, 1);
	clientfield::register("allplayers", "isHiddenByFriendlyJammer", 1, 1, "int", &function_b53badf6, 0, 1);
	clientfield::register("missile", "jammer_active", 1, 1, "int", &function_d28eb2e, 0, 0);
	clientfield::register("missile", "jammer_hacked", 1, 1, "counter", &jammerhacked, 0, 0);
	clientfield::register("toplayer", "jammedvehpostfx", 1, 1, "int", &function_4a82368f, 0, 1);
}

/*
	Name: on_localplayer_connect
	Namespace: jammer
	Checksum: 0xD8220487
	Offset: 0x5A0
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function on_localplayer_connect(localclientnum)
{
	setuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"hud_items"), "jammedStrength"), 0);
}

/*
	Name: function_d28eb2e
	Namespace: jammer
	Checksum: 0x4116C1CD
	Offset: 0x608
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function function_d28eb2e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(fieldname == 1)
	{
		self function_2560e153(binitialsnap, bwastimejump);
		self thread function_5e3d8fe(binitialsnap);
	}
}

/*
	Name: jammerhacked
	Namespace: jammer
	Checksum: 0xD0DE454F
	Offset: 0x690
	Size: 0xE4
	Parameters: 7
	Flags: Linked
*/
function jammerhacked(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	localplayer = function_5c10bd79(bwastimejump);
	if(util::function_fbce7263(localplayer.team, self.team) && !codcaster::function_b8fe9b52(bwastimejump))
	{
		self.var_7ec0e2d1 setcompassicon("ui_hud_minimap_shroud_flipbook");
	}
	else
	{
		self.var_7ec0e2d1 setcompassicon("ui_hud_minimap_shroud_friendly");
	}
}

/*
	Name: function_43a5b68a
	Namespace: jammer
	Checksum: 0xF352B4A3
	Offset: 0x780
	Size: 0x1E0
	Parameters: 7
	Flags: Linked
*/
function function_43a5b68a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.isjammed = undefined;
	if(newval == 1)
	{
		self.isjammed = 1;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.var_a19988fc))
	{
		self thread [[self.var_a19988fc]](localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	}
	weapon = (isdefined(self.identifier_weapon) ? self.identifier_weapon : self.weapon);
	if(!isdefined(weapon.var_96850284))
	{
		return;
	}
	self util::waittill_dobj(localclientnum);
	if(!isdefined(self))
	{
		return;
	}
	if(newval == 1)
	{
		self.var_4dc44ba4 = playtagfxset(localclientnum, weapon.var_96850284, self);
	}
	else if(newval == 0 && oldval == 1 && isdefined(self.var_4dc44ba4))
	{
		foreach(fx in self.var_4dc44ba4)
		{
			stopfx(localclientnum, fx);
		}
	}
}

/*
	Name: function_b53badf6
	Namespace: jammer
	Checksum: 0x790F1CE9
	Offset: 0x968
	Size: 0x11C
	Parameters: 7
	Flags: Linked
*/
function function_b53badf6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self) || !isplayer(self))
	{
		return;
	}
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	localplayer = function_5c10bd79(fieldname);
	if(self == localplayer || self.team == localplayer.team)
	{
		return;
	}
	if(bwastimejump == 1)
	{
		self function_811196d1(1);
	}
	else if(bwastimejump == 0)
	{
		self function_811196d1(0);
	}
}

/*
	Name: player_isjammed
	Namespace: jammer
	Checksum: 0x89F23A82
	Offset: 0xA90
	Size: 0x266
	Parameters: 7
	Flags: Linked
*/
function player_isjammed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self) || !isplayer(self))
	{
		return;
	}
	self util::waittill_dobj(bnewent);
	if(!isdefined(self))
	{
		return;
	}
	var_da91b79d = getuimodel(function_1df4c3b0(bnewent, #"hud_items"), "jammedStrength");
	if(fieldname == 1)
	{
		self notify(#"stop_sounds");
		playsound(bnewent, #"hash_4a43757dd4b02977");
		level.var_6d8e6535[bnewent] = function_604c9983(bnewent, #"hash_3330b85ee1abeb2b");
		self thread function_e9e14905(bnewent);
		setuimodelvalue(var_da91b79d, 1);
		self notify(#"hash_55123a0e484012d5");
	}
	else if(fieldname == 0)
	{
		if(isdefined(level.var_6d8e6535[bnewent]) && !bwastimejump)
		{
			playsound(bnewent, #"hash_112352517abf5b11");
		}
		self notify(#"stop_sounds");
		if(binitialsnap == 1 && isalive(self) && self function_da43934d())
		{
			self thread function_b47f94f(bnewent, var_da91b79d);
		}
		else
		{
			setuimodelvalue(var_da91b79d, 0);
			self notify(#"hash_55123a0e484012d5");
		}
	}
}

/*
	Name: function_b47f94f
	Namespace: jammer
	Checksum: 0xC1765FAE
	Offset: 0xD00
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function function_b47f94f(localclientnum, var_da91b79d)
{
	self endon(#"hash_55123a0e484012d5");
	endtime = 0.25;
	progress = 0;
	while(progress < endtime)
	{
		percent = 1 - (min(1, progress / endtime));
		setuimodelvalue(var_da91b79d, percent);
		wait(0.15);
		progress = progress + 0.1;
	}
	setuimodelvalue(var_da91b79d, 0);
}

/*
	Name: function_2560e153
	Namespace: jammer
	Checksum: 0xB6EACD2C
	Offset: 0xDE0
	Size: 0x264
	Parameters: 2
	Flags: Linked
*/
function function_2560e153(localclientnum, bwastimejump)
{
	localplayer = function_5c10bd79(localclientnum);
	if(bwastimejump === 1)
	{
		if(isdefined(self.var_7ec0e2d1))
		{
			return;
		}
	}
	else if(isdefined(self.var_7ec0e2d1))
	{
		self.var_7ec0e2d1 delete();
	}
	self.var_7ec0e2d1 = spawn(localclientnum, self.origin, "script_model", localplayer getentitynumber(), self.team);
	self.var_7ec0e2d1 setmodel(#"tag_origin");
	self.var_7ec0e2d1 linkto(self);
	self.var_7ec0e2d1 setcompassicon("ui_hud_minimap_shroud_flipbook");
	self.var_7ec0e2d1 function_a5edb367(#"neutral");
	self.var_7ec0e2d1 enableonradar();
	if(localplayer.team == self.team || codcaster::function_b8fe9b52(localclientnum))
	{
		self.var_7ec0e2d1 setcompassicon("ui_hud_minimap_shroud_friendly");
	}
	else
	{
		self.var_7ec0e2d1 setcompassicon("ui_hud_minimap_shroud_flipbook");
	}
	diameter = getdvarint(#"hash_7f7f1118da837313", level.var_578f7c6d.weapon.explosionradius) * 2;
	self.var_7ec0e2d1 function_5e00861(diameter, 1);
	self thread function_fc59d60e(localclientnum);
}

/*
	Name: function_5e3d8fe
	Namespace: jammer
	Checksum: 0x1128985D
	Offset: 0x1050
	Size: 0x14E
	Parameters: 1
	Flags: Linked
*/
function function_5e3d8fe(localclientnum)
{
	self notify("21360f4d8cf0bfc2");
	self endon("21360f4d8cf0bfc2");
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	var_df1b3b55 = 0.6;
	var_8288805c = 0.2;
	if(isdefined(self.weapon.var_4dd46f8a))
	{
		var_966a1350 = getscriptbundle(self.weapon.var_4dd46f8a);
		if(isdefined(var_966a1350.var_b941081f) && isdefined(var_966a1350.var_40772cbe))
		{
			while(isdefined(self))
			{
				self.fx = util::playfxontag(localclientnum, var_966a1350.var_b941081f, self, var_966a1350.var_40772cbe);
				wait(var_8288805c);
				if(isdefined(self.fx))
				{
					stopfx(localclientnum, self.fx);
				}
				wait(var_df1b3b55);
			}
		}
	}
}

/*
	Name: function_e9e14905
	Namespace: jammer
	Checksum: 0xE2F7973A
	Offset: 0x11A8
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_e9e14905(localclientnum)
{
	self waittill(#"death", #"stop_sounds");
	if(isdefined(level.var_6d8e6535[localclientnum]))
	{
		function_d48752e(localclientnum, level.var_6d8e6535[localclientnum]);
		level.var_6d8e6535[localclientnum] = undefined;
	}
}

/*
	Name: function_4a82368f
	Namespace: jammer
	Checksum: 0x32BA9E86
	Offset: 0x1230
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function function_4a82368f(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self postfx::playpostfxbundle(#"hash_68b6dee9bf4fbfbe");
	}
	else if(bwastimejump == 0 && self postfx::function_556665f2(#"hash_68b6dee9bf4fbfbe"))
	{
		self postfx::stoppostfxbundle(#"hash_68b6dee9bf4fbfbe");
	}
}

/*
	Name: function_fc59d60e
	Namespace: jammer
	Checksum: 0xF1C07A9C
	Offset: 0x1308
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fc59d60e(localclientnum)
{
	self waittill(#"death");
	if(isdefined(self.var_7ec0e2d1))
	{
		self.var_7ec0e2d1 delete();
	}
}

