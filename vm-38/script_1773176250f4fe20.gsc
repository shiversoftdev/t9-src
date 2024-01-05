#using scripts\zm_common\zm_utility.csc;
#using script_d67878983e3d7c;
#using script_4e53735256f112ac;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_bf2d4e77;

/*
	Name: function_aab2e9d7
	Namespace: namespace_bf2d4e77
	Checksum: 0xFD61BEC3
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_aab2e9d7()
{
	level notify(-1218435308);
}

/*
	Name: __init__system__
	Namespace: namespace_bf2d4e77
	Checksum: 0xD931B2DD
	Offset: 0x100
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_6be63b3e08b5ceb9", &function_70a657d8, undefined, undefined, #"hash_13a43d760497b54d");
}

/*
	Name: function_70a657d8
	Namespace: namespace_bf2d4e77
	Checksum: 0xA96FB2A8
	Offset: 0x150
	Size: 0xC0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "" + #"hash_6a9eb737488c81c7", 11000, 1, "counter", &function_77972a15, 0, 0);
	clientfield::register("actor", "" + #"hash_13a6ddf6358f814", 11000, 1, "int", &function_7431f6cc, 0, 0);
	level.var_1765ad79 = 0;
}

/*
	Name: function_77972a15
	Namespace: namespace_bf2d4e77
	Checksum: 0x8A8FEC2E
	Offset: 0x218
	Size: 0x134
	Parameters: 7
	Flags: Linked
*/
function function_77972a15(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(bwastimejump);
	if(!isdefined(self.model) || self.model == #"")
	{
		return;
	}
	if(self haspart(bwastimejump, "j_spine4"))
	{
		str_tag = "j_spine4";
	}
	else
	{
		str_tag = "tag_origin";
	}
	util::playfxontag(bwastimejump, #"hash_75b91d12ce404b81", self, str_tag);
	playsound(bwastimejump, #"hash_5ab58aab70a35c94", self.origin + vectorscale((0, 0, 1), 35));
}

/*
	Name: function_7431f6cc
	Namespace: namespace_bf2d4e77
	Checksum: 0xCFDC5C4
	Offset: 0x358
	Size: 0x454
	Parameters: 7
	Flags: Linked
*/
function function_7431f6cc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(!isdefined(self.model) || self.model == #"")
	{
		return;
	}
	if(self haspart(fieldname, "j_spine4"))
	{
		str_tag = "j_spine4";
	}
	else
	{
		str_tag = "tag_origin";
	}
	if(bwastimejump)
	{
		if(!isdefined(self.var_47d4e598))
		{
			str_fx = #"hash_1f8f75941d481d68";
			if(isdefined(self.archetype))
			{
				switch(self.archetype)
				{
					case "mechz":
					case "hash_7c0d83ac1e845ac2":
					{
						str_fx = #"hash_1f5c7f941d1cd4cd";
						break;
					}
					case "raz":
					case "mimic":
					case "zombie_dog":
					{
						str_fx = #"hash_1f5f62941d1ed95d";
						break;
					}
					case "zombie":
					case "avogadro":
					{
						str_fx = #"hash_1f8f75941d481d68";
						break;
					}
					default:
					{
						str_fx = #"hash_1f8f75941d481d68";
						break;
					}
				}
			}
			self.var_47d4e598 = util::playfxontag(fieldname, str_fx, self, str_tag);
		}
		if(!isdefined(self.var_9dc86d3e))
		{
			self playsound(fieldname, #"hash_45c4b084d38f5afe");
			self.var_9dc86d3e = self playloopsound(#"hash_5b2010d2b4f171ba", undefined, vectorscale((0, 0, 1), 35));
		}
	}
	else
	{
		if(isdefined(self.var_47d4e598))
		{
			stopfx(fieldname, self.var_47d4e598);
			self.var_47d4e598 = undefined;
		}
		if(isdefined(self.var_9dc86d3e))
		{
			self stoploopsound(self.var_9dc86d3e);
			self.var_9dc86d3e = undefined;
		}
		var_37cec89a = #"hash_1f8f75941d481d68";
		if(isdefined(self.archetype))
		{
			switch(self.archetype)
			{
				case "mechz":
				case "hash_7c0d83ac1e845ac2":
				{
					var_37cec89a = #"hash_d17ba387ed58333";
					break;
				}
				case "raz":
				case "mimic":
				case "zombie_dog":
				{
					var_37cec89a = #"hash_704b1e9eda987ea3";
					break;
				}
				case "soa":
				case "zombie":
				case "avogadro":
				{
					var_37cec89a = #"hash_787176da22ad853a";
					break;
				}
				default:
				{
					var_37cec89a = #"hash_787176da22ad853a";
					break;
				}
			}
		}
		util::playfxontag(fieldname, var_37cec89a, self, str_tag);
	}
}

