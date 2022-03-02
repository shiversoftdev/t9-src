#using script_680dddbda86931fa;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_8f74625a;

/*
	Name: function_89f2df9
	Namespace: namespace_8f74625a
	Checksum: 0xEAC1D0FD
	Offset: 0x160
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_c70352f852fda84", &function_70a657d8, undefined, undefined, #"item_world");
}

/*
	Name: function_70a657d8
	Namespace: namespace_8f74625a
	Checksum: 0x855A3E7A
	Offset: 0x1B0
	Size: 0x134
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!namespace_ad5a0cd6::use_item_spawns())
	{
		return;
	}
	clientfield::register("scriptmover", "supply_drop_fx", 1, 1, "int", &supply_drop_fx, 0, 0);
	clientfield::register("scriptmover", "supply_drop_parachute_rob", 1, 1, "int", &function_6567bf42, 0, 0);
	clientfield::register("scriptmover", "supply_drop_portal_fx", 1, 1, "int", &supply_drop_portal_fx, 0, 0);
	clientfield::register("vehicle", "supply_drop_vehicle_landed", 1, 1, "counter", &supply_drop_vehicle_landed, 0, 0);
}

/*
	Name: function_6567bf42
	Namespace: namespace_8f74625a
	Checksum: 0xFE8CE03
	Offset: 0x2F0
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function function_6567bf42(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self function_bf9d3071(#"hash_336cece53ae2342f");
	}
	else
	{
		self function_5d482e78(#"hash_336cece53ae2342f");
	}
}

/*
	Name: function_81431153
	Namespace: namespace_8f74625a
	Checksum: 0x16F898E8
	Offset: 0x390
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_81431153(localclientnum)
{
	self waittill(#"death");
	if(isdefined(self.fxent))
	{
		if(isdefined(self.fxent.var_4a630a3f))
		{
			stopfx(localclientnum, self.fxent.var_4a630a3f);
		}
		self.fxent delete();
	}
}

/*
	Name: supply_drop_fx
	Namespace: namespace_8f74625a
	Checksum: 0x57FB2EF9
	Offset: 0x420
	Size: 0x16C
	Parameters: 7
	Flags: Linked
*/
function supply_drop_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		fxent = spawn(fieldname, self.origin, "script_model");
		fxent setmodel("tag_origin");
		fxent linkto(self);
		fxent.var_4a630a3f = function_239993de(fieldname, "killstreaks/fx9_carepkg_signal_smk_blue", fxent, "tag_origin");
		self.fxent = fxent;
		self.var_3a55f5cf = 1;
		self thread function_81431153(fieldname);
	}
	else if(isdefined(self.fxent))
	{
		if(isdefined(self.fxent.var_4a630a3f))
		{
			stopfx(fieldname, self.fxent.var_4a630a3f);
		}
		self.fxent delete();
	}
}

/*
	Name: supply_drop_portal_fx
	Namespace: namespace_8f74625a
	Checksum: 0x5027D061
	Offset: 0x598
	Size: 0x15A
	Parameters: 7
	Flags: Linked
*/
function supply_drop_portal_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		player = function_5c10bd79(fieldname);
		if(isdefined(self.var_227361c6))
		{
			stopfx(fieldname, self.var_227361c6);
		}
		self.startpos = self.origin;
		self.var_227361c6 = playfx(fieldname, #"hash_28b5c6ccaabb4afe", self.startpos);
	}
	else
	{
		if(isdefined(self.var_227361c6))
		{
			stopfx(fieldname, self.var_227361c6);
		}
		var_752d14c2 = self.origin;
		if(isdefined(self.startpos))
		{
			var_752d14c2 = self.startpos;
		}
		self.var_227361c6 = playfx(fieldname, #"hash_45086f1ffcabbf47", var_752d14c2);
	}
}

/*
	Name: supply_drop_vehicle_landed
	Namespace: namespace_8f74625a
	Checksum: 0x24FF4322
	Offset: 0x700
	Size: 0x84
	Parameters: 7
	Flags: Linked
*/
function supply_drop_vehicle_landed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self playrumbleonentity(bwastimejump, #"hash_6ee3e7be4dd47bed");
	self playsound(0, #"hash_531aa4857265e186");
}

