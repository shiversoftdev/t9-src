#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace dogtags;

/*
	Name: init
	Namespace: dogtags
	Checksum: 0xBB146B6D
	Offset: 0xC0
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function init()
{
	clientfield::register("scriptmover", "dogtag_flag", 1, 2, "int", &function_319c73b1, 0, 0);
}

/*
	Name: function_319c73b1
	Namespace: dogtags
	Checksum: 0x6A41551A
	Offset: 0x118
	Size: 0x3BC
	Parameters: 7
	Flags: None
*/
function function_319c73b1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self notify(#"stopbounce");
	if(isdefined(self.var_47b256ef))
	{
		self.var_47b256ef unlink();
		self.var_47b256ef.origin = self.origin;
	}
	if(bwastimejump == 0)
	{
		self function_81431153(fieldname);
		self delete_objective(fieldname);
		return;
	}
	if(!isdefined(self.objectiveid))
	{
		objectivename = (isdefined(level.var_febab1ea) ? level.var_febab1ea : #"conf_dogtags");
		self.objectiveid = util::getnextobjid(fieldname);
		objective_add(fieldname, self.objectiveid, "active", objectivename, self.origin, self.team);
		objective_onentity(fieldname, self.objectiveid, self, 1, 1, 0);
	}
	if(!isdefined(self.var_47b256ef))
	{
		self.var_47b256ef = spawn(fieldname, self.origin, "script_model");
		self.var_47b256ef.angles = (0, 0, 0);
		self.var_47b256ef setmodel(#"tag_origin");
		self thread function_bcb88fb7(fieldname);
	}
	if(!isdefined(self.var_c7d6b0c1) || !isfxplaying(fieldname, self.var_c7d6b0c1))
	{
		characterindex = (isdefined(self function_ef9de5ae()) ? self function_ef9de5ae() : 0);
		fxtoplay = (isdefined(getcharacterfields(characterindex, currentsessionmode()).var_c7d6b0c1) ? getcharacterfields(characterindex, currentsessionmode()).var_c7d6b0c1 : #"hash_30f231c126644dc2");
		self.var_c7d6b0c1 = util::playfxontag(fieldname, fxtoplay, self.var_47b256ef, "tag_origin");
		setfxteam(fieldname, self.var_c7d6b0c1, self.team);
	}
	if(bwastimejump == 1)
	{
		self.var_47b256ef.origin = self.origin;
		self.var_47b256ef linkto(self);
	}
	else if(bwastimejump == 2 || bwastimejump == 3)
	{
		self thread function_2eee13af();
	}
}

/*
	Name: function_81431153
	Namespace: dogtags
	Checksum: 0xC94440D7
	Offset: 0x4E0
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function function_81431153(localclientnum)
{
	if(isdefined(self.var_c7d6b0c1))
	{
		killfx(localclientnum, self.var_c7d6b0c1);
		self.var_c7d6b0c1 = undefined;
	}
}

/*
	Name: delete_objective
	Namespace: dogtags
	Checksum: 0x484C36DC
	Offset: 0x528
	Size: 0x5E
	Parameters: 1
	Flags: None
*/
function delete_objective(localclientnum)
{
	if(isdefined(self.objectiveid))
	{
		objective_delete(localclientnum, self.objectiveid);
		util::releaseobjid(localclientnum, self.objectiveid);
		self.objectiveid = undefined;
	}
}

/*
	Name: function_bcb88fb7
	Namespace: dogtags
	Checksum: 0xB290AB6
	Offset: 0x590
	Size: 0x86
	Parameters: 1
	Flags: None
*/
function function_bcb88fb7(localclientnum)
{
	self waittill(#"death");
	self function_81431153(localclientnum);
	self delete_objective(localclientnum);
	if(isdefined(self.var_47b256ef))
	{
		self.var_47b256ef delete();
		self.var_47b256ef = undefined;
	}
}

/*
	Name: function_2eee13af
	Namespace: dogtags
	Checksum: 0xAE219492
	Offset: 0x620
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function function_2eee13af()
{
	self endon(#"stopbounce");
	self endon(#"death");
	while(true)
	{
		toppos = self.origin + vectorscale((0, 0, 1), 12);
		self.var_47b256ef moveto(toppos, 0.5, 0, 0);
		self.var_47b256ef waittill(#"movedone");
		bottompos = self.origin;
		self.var_47b256ef moveto(bottompos, 0.5, 0, 0);
		self.var_47b256ef waittill(#"movedone");
	}
}

/*
	Name: function_ef9de5ae
	Namespace: dogtags
	Checksum: 0x62AF1C7A
	Offset: 0x720
	Size: 0x1A
	Parameters: 0
	Flags: Private
*/
function private function_ef9de5ae()
{
	return self function_9682ea07();
}

