#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_780aaec4;

/*
	Name: function_894a5a3
	Namespace: namespace_780aaec4
	Checksum: 0x1F523C34
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_894a5a3()
{
	level notify(493608640);
}

/*
	Name: __init__system__
	Namespace: namespace_780aaec4
	Checksum: 0x67D1C8A1
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_4d08eeea0f720e8d", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_780aaec4
	Checksum: 0x84946A17
	Offset: 0x158
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_24d18e3942c82edb")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	clientfield::register("scriptmover", "sr_demented_echo_fx", 1, 2, "int", &function_4b233039, 0, 0);
}

/*
	Name: function_4b233039
	Namespace: namespace_780aaec4
	Checksum: 0x3156E433
	Offset: 0x228
	Size: 0x234
	Parameters: 7
	Flags: Linked
*/
function function_4b233039(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.var_4b6f13c8))
	{
		stopfx(fieldname, self.var_4b6f13c8);
	}
	if(bwastimejump == 1)
	{
		var_1e7f4865 = getscriptbundle("fxd9_zm_char_ndu_ghoul");
		if(isdefined(var_1e7f4865.effectcount))
		{
			for(index = 1; index <= var_1e7f4865.effectcount; index++)
			{
				str_fx = var_1e7f4865.(("effect" + index) + "_fx");
				str_tag = var_1e7f4865.(("effect" + index) + "_attachtag");
				if(isdefined(str_fx) && isdefined(str_tag))
				{
					function_239993de(fieldname, str_fx, self, str_tag);
				}
			}
		}
	}
	else
	{
		if(bwastimejump == 2)
		{
			self.var_4b6f13c8 = function_239993de(fieldname, #"hash_7a8b6775d3a2329d", self, "j_spine4");
		}
		else
		{
			if(bwastimejump == 3)
			{
				self.var_4b6f13c8 = function_239993de(fieldname, #"hash_2b2859b61c0b8a31", self, "j_spine4");
			}
			else
			{
				v_tag = self gettagorigin("j_spine4");
				if(!isdefined(v_tag))
				{
					v_tag = self.origin + vectorscale((0, 0, 1), 48);
				}
				playfx(fieldname, #"hash_5bbf453f2140d55f", v_tag);
			}
		}
	}
}

