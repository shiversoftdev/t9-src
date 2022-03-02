#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_207ea311;

/*
	Name: function_6fdeafc0
	Namespace: namespace_207ea311
	Checksum: 0x9320B80
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6fdeafc0()
{
	level notify(595985974);
}

/*
	Name: function_89f2df9
	Namespace: namespace_207ea311
	Checksum: 0xFD92F2F
	Offset: 0xE8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_684573a459d68beb", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_207ea311
	Checksum: 0x1AE69BFD
	Offset: 0x140
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("allplayers", "" + #"hash_63af42145e260fb5", 1, 2, "int", &function_4fd00e1f, 0, 0);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_207ea311
	Checksum: 0x80F724D1
	Offset: 0x1A8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: function_4fd00e1f
	Namespace: namespace_207ea311
	Checksum: 0xBB4958E3
	Offset: 0x1B8
	Size: 0x4D4
	Parameters: 7
	Flags: Linked
*/
function function_4fd00e1f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(!isdefined(level.var_3630f9c0))
	{
		level.var_3630f9c0 = [];
	}
	if(!isdefined(level.var_3630f9c0[fieldname]))
	{
		level.var_3630f9c0[fieldname] = [];
	}
	n_entity = self getentitynumber();
	var_e534cbe9 = 0;
	if(isdefined(level.var_3630f9c0[fieldname][n_entity]))
	{
		killfx(fieldname, level.var_3630f9c0[fieldname][n_entity]);
		level.var_3630f9c0[fieldname][n_entity] = undefined;
		var_e534cbe9 = 1;
	}
	if(bwastimejump > 0)
	{
		if(!var_e534cbe9)
		{
			self playsound(fieldname, #"hash_79a78504d4dbaf3f");
		}
		if(self zm_utility::function_f8796df3(fieldname))
		{
			switch(bwastimejump)
			{
				case 1:
				{
					str_fx = #"hash_679d39e5fd4eae19";
					break;
				}
				case 2:
				{
					str_fx = #"hash_462352157053fa4a";
					break;
				}
				case 3:
				{
					str_fx = #"hash_30b9d79f8b24fca";
					break;
				}
			}
			if(viewmodelhastag(fieldname, "tag_flashlight"))
			{
				level.var_3630f9c0[fieldname][n_entity] = playviewmodelfx(fieldname, str_fx, "tag_flashlight");
			}
			/#
				if(!isdefined(level.var_3630f9c0[fieldname][n_entity]))
				{
					level.var_3630f9c0[fieldname][n_entity] = playviewmodelfx(fieldname, str_fx, "");
				}
			#/
		}
		else
		{
			switch(bwastimejump)
			{
				case 1:
				{
					str_fx = #"hash_153f56ac9d13a399";
					break;
				}
				case 2:
				{
					str_fx = #"hash_64e79a7456f58dec";
					break;
				}
				case 3:
				{
					str_fx = #"hash_6d4cbc5e2d4daa6c";
					break;
				}
			}
			level.var_3630f9c0[fieldname][n_entity] = util::playfxontag(fieldname, str_fx, self, "tag_flashlight");
		}
		if(self == function_5c10bd79(fieldname) && !is_true(level.var_6663d08b))
		{
			util::function_8eb5d4b0((isdefined(level.var_59815895) ? level.var_59815895 : 3500), (isdefined(level.var_40753b66) ? level.var_40753b66 : 0));
		}
	}
	else
	{
		if(var_e534cbe9)
		{
			self playsound(fieldname, #"hash_13715035b161a0c3");
		}
		if(self == function_5c10bd79(fieldname) && !is_true(level.var_6663d08b))
		{
			util::function_8eb5d4b0((isdefined(level.var_49ba13b2) ? level.var_49ba13b2 : 3500), (isdefined(level.var_674a073f) ? level.var_674a073f : 2.5));
		}
	}
}

