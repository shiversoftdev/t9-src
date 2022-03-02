#using script_2893c826e7922f28;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace planemortar;

/*
	Name: function_ef0f40c9
	Namespace: planemortar
	Checksum: 0xF880481
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ef0f40c9()
{
	level notify(1625553828);
}

/*
	Name: function_89f2df9
	Namespace: planemortar
	Checksum: 0x30FFEC58
	Offset: 0xE8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"planemortar", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: planemortar
	Checksum: 0x98F1C0F8
	Offset: 0x138
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	clientfield::register("scriptmover", "planemortar_contrail", 1, 1, "int", &planemortar_contrail, 0, 0);
}

/*
	Name: planemortar_contrail
	Namespace: planemortar
	Checksum: 0x81A6B620
	Offset: 0x1A0
	Size: 0xF2
	Parameters: 7
	Flags: Linked
*/
function planemortar_contrail(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	params = getscriptbundle("killstreak_planemortar");
	util::waittill_dobj(fieldname);
	if(bwastimejump)
	{
		self.fx = util::playfxontag(fieldname, params.var_dcbb40c5, self, params.var_d678978c);
		self.fx = util::playfxontag(fieldname, params.var_2375a152, self, params.var_e5082065);
	}
}

