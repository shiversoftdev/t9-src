#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_2a67e53;

/*
	Name: function_e502ef38
	Namespace: namespace_2a67e53
	Checksum: 0x8742FE2A
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e502ef38()
{
	level notify(-291562555);
}

/*
	Name: init
	Namespace: namespace_2a67e53
	Checksum: 0x9655A7E
	Offset: 0xF0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "" + #"hash_4545e81f76244b", 16000, 1, "int", &function_2810997c, 0, 0);
	clientfield::register("world", "" + #"hash_5c8a1cf9b543c223", 16000, getminbitcountfornum(5), "int", &function_114cfee9, 0, 0);
}

/*
	Name: function_114cfee9
	Namespace: namespace_2a67e53
	Checksum: 0x11424122
	Offset: 0x1C0
	Size: 0x1B4
	Parameters: 7
	Flags: Linked
*/
function function_114cfee9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(level.var_47807d96))
	{
		/#
			assert(isint(level.var_47807d96));
		#/
		stopforcestreamingxmodel(#"hash_3bc4ed2f30d82d31" + level.var_47807d96);
	}
	if(bwasdemojump)
	{
		level.var_47807d96 = bwasdemojump;
		forcestreamxmodel(#"hash_3bc4ed2f30d82d31" + level.var_47807d96);
		forcestreamxmodel(#"hash_104dd148b019e861");
		forcestreamxmodel(#"hash_104dce48b019e348");
		forcestreamxmodel(#"hash_104dcf48b019e4fb");
	}
	else
	{
		level.var_47807d96 = undefined;
		stopforcestreamingxmodel(#"hash_104dd148b019e861");
		stopforcestreamingxmodel(#"hash_104dce48b019e348");
		stopforcestreamingxmodel(#"hash_104dcf48b019e4fb");
	}
}

/*
	Name: function_2810997c
	Namespace: namespace_2a67e53
	Checksum: 0x475E4B07
	Offset: 0x380
	Size: 0x1A6
	Parameters: 7
	Flags: Linked
*/
function function_2810997c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		var_8edcbb0e = struct::get("computer_cursor", "targetname");
		if(!isdefined(level.var_3c9f8e0b))
		{
			level.var_3c9f8e0b = var_8edcbb0e.origin;
		}
		if(!isdefined(self.cursor))
		{
			self.cursor = util::spawn_model(fieldname, "tag_origin", level.var_3c9f8e0b);
			self.cursor.fx = util::playfxontag(fieldname, #"hash_1be599238c15bbdf", self.cursor, "tag_origin");
		}
		self thread function_718ef5ea(self.cursor, var_8edcbb0e.origin);
	}
	else if(isdefined(self.cursor))
	{
		level.var_3c9f8e0b = self.cursor.origin;
		killfx(fieldname, self.cursor.fx);
		self.cursor delete();
		self.cursor = undefined;
	}
}

/*
	Name: function_718ef5ea
	Namespace: namespace_2a67e53
	Checksum: 0xFC8BB3F8
	Offset: 0x530
	Size: 0x230
	Parameters: 2
	Flags: Linked
*/
function function_718ef5ea(var_a7dcc4c7, v_center)
{
	self endon(#"death");
	var_a7dcc4c7 endon(#"death");
	while(true)
	{
		v_target = var_a7dcc4c7.origin;
		if(self.origin[2] == 1)
		{
			v_target = (v_center + (0, 60, -20)) + (self.origin[0] / 10000) * (0, cos(self.angles[0]) * -1, sin(self.angles[0]));
		}
		else if(self.origin[2] == 2)
		{
			v_target = (v_center + (0, -40, -80)) + (self.origin[1] / 10000) * (0, sin(self.angles[1]), cos(self.angles[1]));
		}
		if(var_a7dcc4c7.origin != v_target)
		{
			if(!isdefined(var_a7dcc4c7.var_28cc73f6))
			{
				var_a7dcc4c7.var_28cc73f6 = var_a7dcc4c7 playloopsound(#"hash_7f519f5efb38d2ba");
			}
			var_a7dcc4c7 moveto(v_target, 0.05);
			var_a7dcc4c7 waittill(#"movedone");
		}
		else
		{
			if(isdefined(var_a7dcc4c7.var_28cc73f6))
			{
				var_a7dcc4c7 stoploopsound(var_a7dcc4c7.var_28cc73f6);
				var_a7dcc4c7.var_28cc73f6 = undefined;
			}
			waitframe(1);
		}
	}
}

