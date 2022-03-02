#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_4f449f4a;

/*
	Name: function_89f2df9
	Namespace: namespace_4f449f4a
	Checksum: 0x42BCC992
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_73305c73e19c1e8f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_4f449f4a
	Checksum: 0x505B0B51
	Offset: 0x108
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "molotov_zm_fire_fx", 1, 1, "int", &molotov_zm_fire_fx, 0, 0);
}

/*
	Name: molotov_zm_fire_fx
	Namespace: namespace_4f449f4a
	Checksum: 0x8C23FD99
	Offset: 0x160
	Size: 0x128
	Parameters: 7
	Flags: Linked
*/
function molotov_zm_fire_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(bwastimejump)
	{
		self.var_e9d782a8 = playtagfxset(fieldname, "weapon_hero_molotov_fire_3p", self);
	}
	else if(isdefined(self.var_e9d782a8))
	{
		foreach(fx_id in self.var_e9d782a8)
		{
			stopfx(fieldname, fx_id);
		}
	}
}

