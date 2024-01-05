#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_df233b8a;

/*
	Name: function_c4c63fe7
	Namespace: namespace_df233b8a
	Checksum: 0x98EC6614
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c4c63fe7()
{
	level notify(1618246897);
}

#namespace awareness;

/*
	Name: __init__system__
	Namespace: awareness
	Checksum: 0x930E637F
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"awareness", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: awareness
	Checksum: 0x8B1FA4C0
	Offset: 0x100
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "sndAwarenessChange", 1, 2, "int", &function_d83b47c4, 0, 0);
}

/*
	Name: function_d83b47c4
	Namespace: awareness
	Checksum: 0x5B8FFB00
	Offset: 0x158
	Size: 0x20A
	Parameters: 7
	Flags: Linked
*/
function function_d83b47c4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump)
{
	self endon(#"death");
	self notify(#"hash_4c0620b64b0af0e");
	self endon(#"hash_4c0620b64b0af0e");
	if(isdefined(self.var_35e2a4c0))
	{
		self stoploopsound(self.var_35e2a4c0);
	}
	var_8faf8279 = function_3b0ca643(self);
	if(!isdefined(var_8faf8279))
	{
		return;
	}
	if(wasdemojump)
	{
		switch(wasdemojump)
		{
			case 1:
			{
				var_e5404960 = var_8faf8279.var_1510a94a;
				var_9c464736 = var_8faf8279.var_4ec57c29;
				break;
			}
			case 2:
			{
				var_e5404960 = var_8faf8279.var_e31a323c;
				var_9c464736 = var_8faf8279.var_f6b3e5dd;
				break;
			}
			case 3:
			{
				var_e5404960 = var_8faf8279.var_fd89f5fb;
				var_9c464736 = var_8faf8279.var_6e38d21c;
				break;
			}
			default:
			{
				var_e5404960 = var_8faf8279.var_1510a94a;
				var_9c464736 = var_8faf8279.var_4ec57c29;
				break;
			}
		}
		self playsound(fieldname, var_e5404960, self.origin + var_8faf8279.v_offset);
		wait(0.75);
		self.var_35e2a4c0 = self playloopsound(var_9c464736, 1.5, var_8faf8279.v_offset);
	}
}

/*
	Name: function_3b0ca643
	Namespace: awareness
	Checksum: 0xED148D9A
	Offset: 0x370
	Size: 0x2A0
	Parameters: 1
	Flags: Linked
*/
function function_3b0ca643(e_ai)
{
	e_ai endon(#"death");
	if(isdefined(e_ai.archetype))
	{
		switch(e_ai.archetype)
		{
			case "avogadro":
			{
				var_1510a94a = #"hash_33e62839d84aaec7";
				var_e31a323c = #"hash_621285559daed3af";
				var_fd89f5fb = #"hash_123425d677b928fa";
				var_4ec57c29 = #"hash_729db72e5e196219";
				var_f6b3e5dd = #"hash_1d2437fd7fe38d19";
				var_6e38d21c = #"hash_39c41891747dabba";
				v_offset = vectorscale((0, 0, 1), 45);
				break;
			}
			case "zombie_dog":
			{
				if(self.var_9fde8624 === #"hash_2a5479b83161cb35")
				{
					var_1510a94a = #"hash_2991459f20df3789";
					var_e31a323c = #"hash_2daacd7b15881d1d";
					var_fd89f5fb = #"hash_16838de4eb2b7f00";
					var_4ec57c29 = #"hash_50a34ea4add0897";
					var_f6b3e5dd = #"hash_58176fa004d16f13";
					var_6e38d21c = #"hash_219cfeed2cbf8adc";
				}
				else
				{
					var_1510a94a = #"hash_30094147649a2ce8";
					var_e31a323c = #"hash_7e0d7ce34dcb51e8";
					var_fd89f5fb = #"hash_324d41aa84a6a925";
					var_4ec57c29 = #"hash_7650d07efcd13f86";
					var_f6b3e5dd = #"hash_6c87cdcb89dd8aa2";
					var_6e38d21c = #"hash_6e0e18e77c0f28c1";
				}
				v_offset = (20, 0, 30);
				break;
			}
			default:
			{
				return undefined;
				break;
			}
		}
		return {#v_offset:v_offset, #hash_6e38d21c:var_6e38d21c, #hash_f6b3e5dd:var_f6b3e5dd, #hash_4ec57c29:var_4ec57c29, #hash_fd89f5fb:var_fd89f5fb, #hash_e31a323c:var_e31a323c, #hash_1510a94a:var_1510a94a};
	}
	return undefined;
}

