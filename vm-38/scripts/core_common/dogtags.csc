#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace dogtags;

/*
	Name: function_f49043c9
	Namespace: dogtags
	Checksum: 0xB295B50
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f49043c9()
{
	level notify(-1186341104);
}

/*
	Name: init
	Namespace: dogtags
	Checksum: 0xE1D105E
	Offset: 0xE0
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function init()
{
	clientfield::register("scriptmover", "dogtag_flag", 1, 2, "int", &function_319c73b1, 0, 0);
	level.var_70e5d775 = getgametypesetting(#"hash_45b6991b1456a440");
}

/*
	Name: function_3e0d8ba2
	Namespace: dogtags
	Checksum: 0xC0DF9DB1
	Offset: 0x160
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function function_3e0d8ba2()
{
	if(isdefined(level.var_ba243d66))
	{
		return level.var_ba243d66;
	}
	if(level.var_70e5d775 === 1)
	{
		var_c2ad857a = [3:#"hash_214a1f87c6212231", 2:#"hash_214a2087c62123e4", 1:#"hash_214a2187c6212597", 0:#"hash_214a2287c621274a"];
		return var_c2ad857a[randomint(var_c2ad857a.size)];
	}
}

/*
	Name: function_319c73b1
	Namespace: dogtags
	Checksum: 0xCF6F43F9
	Offset: 0x228
	Size: 0x414
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
		if(level.var_70e5d775 === 1)
		{
			objective_setgamemodeflags(fieldname, self.objectiveid, 1);
		}
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
		fxtoplay = function_3e0d8ba2();
		if(!isdefined(fxtoplay))
		{
			characterindex = (isdefined(self function_ef9de5ae()) ? self function_ef9de5ae() : 0);
			fxtoplay = (isdefined(getcharacterfields(characterindex, currentsessionmode()).var_c7d6b0c1) ? getcharacterfields(characterindex, currentsessionmode()).var_c7d6b0c1 : #"hash_30f231c126644dc2");
		}
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
	Checksum: 0x4A2440C6
	Offset: 0x648
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
	Checksum: 0x466F4931
	Offset: 0x690
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
	Checksum: 0x6211E6D
	Offset: 0x6F8
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
	Checksum: 0x7C7EED05
	Offset: 0x788
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
	Checksum: 0x3A5A3706
	Offset: 0x888
	Size: 0x1A
	Parameters: 0
	Flags: Private
*/
function private function_ef9de5ae()
{
	return self function_9682ea07();
}

