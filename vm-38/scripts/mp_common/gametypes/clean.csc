#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace clean;

/*
	Name: function_ccb5520
	Namespace: clean
	Checksum: 0x6F531B1E
	Offset: 0x150
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ccb5520()
{
	level notify(1599049221);
}

/*
	Name: main
	Namespace: clean
	Checksum: 0xAD93B8E3
	Offset: 0x170
	Size: 0x294
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::function_a8bbc967("hudItems.cleanCarryCount", #"hud_items", #"cleancarrycount", 14000, 4, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.cleanCarryFull", #"hud_items", #"cleancarryfull", 14000, 1, "int", undefined, 0, 0);
	clientfield::register("scriptmover", "taco_flag", 14000, 2, "int", &function_11abf5b2, 0, 0);
	clientfield::register("allplayers", "taco_carry", 14000, 1, "int", &function_aa7bb941, 0, 0);
	clientfield::register("scriptmover", "taco_waypoint", 14000, 1, "int", &function_a4a5d612, 0, 0);
	level.var_aaaae0b = #"hash_206afab0af20880d";
	level.var_5844252c = #"hash_672b6ef826294e77";
	level.var_ce64ea3e = #"hash_77d505035209b8d6";
	if(is_true(getgametypesetting(#"hash_5cc4c3042b7d4935")))
	{
		level.var_aaaae0b = #"hash_464eae7df8ee284a";
		level.var_5844252c = #"hash_2b379a7d7b261710";
		level.var_ce64ea3e = #"hash_3a64e972390f43aa";
		setsoundcontext("ltm", "paddy");
		function_52ee8599();
	}
	callback::on_localclient_connect(&on_localclient_connect);
}

/*
	Name: function_52ee8599
	Namespace: clean
	Checksum: 0x8D0F975A
	Offset: 0x410
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_52ee8599()
{
	function_3385d776(#"ui/fx8_fracture_deposit_point_end_ire");
	forcestreamxmodel(#"hash_4e3eff45df49869e");
}

/*
	Name: on_localclient_connect
	Namespace: clean
	Checksum: 0xF833D849
	Offset: 0x460
	Size: 0x24
	Parameters: 1
	Flags: Private
*/
function private on_localclient_connect(localclientnum)
{
	function_d91ca1f1(localclientnum);
}

/*
	Name: function_11abf5b2
	Namespace: clean
	Checksum: 0x527A97BC
	Offset: 0x490
	Size: 0x20C
	Parameters: 7
	Flags: None
*/
function function_11abf5b2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self notify(#"hash_7117a0f5c62d8c3d");
	if(isdefined(self.var_47b256ef))
	{
		self.var_47b256ef unlink();
		self.var_47b256ef.origin = self.origin;
	}
	self function_81431153(fieldname);
	if(bwastimejump != 0)
	{
		if(!isdefined(self.var_47b256ef))
		{
			self.var_47b256ef = spawn(fieldname, self.origin, "script_model");
			self.var_47b256ef setmodel(#"tag_origin");
			self thread function_bcb88fb7(fieldname);
		}
		self.var_5844252c = util::playfxontag(fieldname, level.var_5844252c, self.var_47b256ef, "tag_origin");
		self function_1f0c7136(5);
		self function_dfbd048b(25);
		setfxteam(fieldname, self.var_5844252c, self.team);
	}
	if(bwastimejump == 1)
	{
		self.var_47b256ef linkto(self);
	}
	else if(bwastimejump == 2)
	{
		self thread function_d1834e16(fieldname);
	}
}

/*
	Name: function_bcb88fb7
	Namespace: clean
	Checksum: 0x84CD3D37
	Offset: 0x6A8
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_bcb88fb7(localclientnum)
{
	self waittill(#"death");
	self function_81431153(localclientnum);
	self.var_47b256ef delete();
	self.var_47b256ef = undefined;
	objid = function_53576950(localclientnum, self getentitynumber());
	if(isdefined(objid))
	{
		objective_setstate(localclientnum, objid, "invisible");
	}
}

/*
	Name: function_81431153
	Namespace: clean
	Checksum: 0xDBD61CF6
	Offset: 0x768
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function function_81431153(localclientnum)
{
	if(isdefined(self.var_5844252c))
	{
		killfx(localclientnum, self.var_5844252c);
		self.var_5844252c = undefined;
	}
}

/*
	Name: function_d1834e16
	Namespace: clean
	Checksum: 0x34B1BED3
	Offset: 0x7B0
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_d1834e16(localclientnum)
{
	self endon(#"hash_7117a0f5c62d8c3d");
	self endon(#"death");
	toppos = self.origin + vectorscale((0, 0, 1), 12);
	bottompos = self.origin;
	while(true)
	{
		self.var_47b256ef moveto(toppos, 0.5, 0, 0);
		self.var_47b256ef waittill(#"movedone");
		self.var_47b256ef moveto(bottompos, 0.5, 0, 0);
		self.var_47b256ef waittill(#"movedone");
	}
}

/*
	Name: function_aa7bb941
	Namespace: clean
	Checksum: 0x6023AAAD
	Offset: 0x8B8
	Size: 0xEC
	Parameters: 7
	Flags: None
*/
function function_aa7bb941(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self function_cd6915b7(fieldname);
	if(bwastimejump && function_5c10bd79(fieldname) != self)
	{
		self util::waittill_dobj(fieldname);
		if(!isdefined(self))
		{
			return;
		}
		self.var_aaaae0b = util::playfxontag(fieldname, level.var_aaaae0b, self, "j_neck");
		setfxteam(fieldname, self.var_aaaae0b, self.team);
	}
}

/*
	Name: function_5cf5b566
	Namespace: clean
	Checksum: 0xB6B177EE
	Offset: 0x9B0
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_5cf5b566(localclientnum)
{
	self waittill(#"death");
	self function_cd6915b7(localclientnum);
}

/*
	Name: function_cd6915b7
	Namespace: clean
	Checksum: 0x4F96D3D5
	Offset: 0x9F8
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function function_cd6915b7(localclientnum)
{
	if(isdefined(self.var_aaaae0b))
	{
		killfx(localclientnum, self.var_aaaae0b);
		self.var_aaaae0b = undefined;
	}
}

/*
	Name: function_d91ca1f1
	Namespace: clean
	Checksum: 0x23936AB5
	Offset: 0xA40
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function function_d91ca1f1(localclientnum)
{
	level.var_67485c05[localclientnum] = [];
	for(i = 0; i < 26; i++)
	{
		level.var_ccb8d7fb[localclientnum][i] = spawnstruct();
		objid = util::getnextobjid(localclientnum);
		level.var_ccb8d7fb[localclientnum][i].id = objid;
		level.var_ccb8d7fb[localclientnum][i].var_336f0669 = undefined;
		objective_add(localclientnum, objid, "invisible", level.var_ce64ea3e);
	}
}

/*
	Name: function_5d02c098
	Namespace: clean
	Checksum: 0xD4529473
	Offset: 0xB28
	Size: 0x8E
	Parameters: 2
	Flags: None
*/
function function_5d02c098(localclientnum, var_336f0669)
{
	for(i = 0; i < 26; i++)
	{
		if(!isdefined(level.var_ccb8d7fb[localclientnum][i].var_336f0669))
		{
			level.var_ccb8d7fb[localclientnum][i].var_336f0669 = var_336f0669;
			return level.var_ccb8d7fb[localclientnum][i].id;
		}
	}
	return undefined;
}

/*
	Name: function_53576950
	Namespace: clean
	Checksum: 0x59266390
	Offset: 0xBC0
	Size: 0x8E
	Parameters: 2
	Flags: None
*/
function function_53576950(localclientnum, var_336f0669)
{
	for(i = 0; i < 26; i++)
	{
		if(level.var_ccb8d7fb[localclientnum][i].var_336f0669 === var_336f0669)
		{
			level.var_ccb8d7fb[localclientnum][i].var_336f0669 = undefined;
			return level.var_ccb8d7fb[localclientnum][i].id;
		}
	}
	return undefined;
}

/*
	Name: function_a4a5d612
	Namespace: clean
	Checksum: 0x655A41B3
	Offset: 0xC58
	Size: 0x144
	Parameters: 7
	Flags: None
*/
function function_a4a5d612(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(function_1cbf351b(fieldname))
	{
		return;
	}
	if(bwastimejump)
	{
		objid = function_5d02c098(fieldname, self getentitynumber());
		if(isdefined(objid))
		{
			objective_setstate(fieldname, objid, "active");
			objective_setposition(fieldname, objid, self.origin);
			objective_setteam(fieldname, objid, self.team);
		}
	}
	else
	{
		objid = function_53576950(fieldname, self getentitynumber());
		if(isdefined(objid))
		{
			objective_setstate(fieldname, objid, "invisible");
		}
	}
}

