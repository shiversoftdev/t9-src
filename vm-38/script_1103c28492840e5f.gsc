#using script_2bdd098a8215ac9f;
#using script_311c446e3df6c3fa;
#using script_4ed01237ecbd380f;
#using script_538e87197f25d67;
#using script_5665e7d917abc3fc;
#using script_62c72c96978f9b04;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_73df937d;

/*
	Name: function_d3bd8e0
	Namespace: namespace_73df937d
	Checksum: 0xE7E5FE0
	Offset: 0x138
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d3bd8e0()
{
	level notify(100820852);
}

/*
	Name: function_89f2df9
	Namespace: namespace_73df937d
	Checksum: 0xC43E2D53
	Offset: 0x158
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5ff56dba9074b0b4", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_73df937d
	Checksum: 0xA3C52749
	Offset: 0x1A0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	level clientfield::register("scriptmover", "safehouse_claim_fx", 1, 1, "int", &function_2a388744, 0, 0);
}

/*
	Name: function_2a388744
	Namespace: namespace_73df937d
	Checksum: 0x37097271
	Offset: 0x1F8
	Size: 0x15C
	Parameters: 7
	Flags: Linked
*/
function function_2a388744(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.fxid = function_239993de(fieldname, "sr/fx9_safehouse_orb_idle", self, "tag_origin");
		if(!isdefined(self.var_94ebeb0a))
		{
			self.var_94ebeb0a = self playloopsound(#"hash_53c30ccf24ec3701");
		}
	}
	else
	{
		if(isdefined(self.fxid))
		{
			killfx(fieldname, self.fxid);
		}
		if(isdefined(self.var_94ebeb0a))
		{
			self stoploopsound(self.var_94ebeb0a);
			self.var_94ebeb0a = undefined;
		}
		playfx(fieldname, "sr/fx9_safehouse_orb_activate", self.origin);
		playsound(fieldname, #"hash_71e3b0dd2c4a7490", self.origin);
	}
}

