#using script_2893c826e7922f28;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace planemortar;

/*
	Name: function_89f2df9
	Namespace: planemortar
	Checksum: 0x662F3E8F
	Offset: 0x120
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
	Checksum: 0x42390D6E
	Offset: 0x170
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	clientfield::register("scriptmover", "planemortar_contrail", 1, 1, "int", &planemortar_contrail, 0, 0);
	clientfield::register("scriptmover", "planemortar_marker_on", 1, 1, "int", &planemortar_marker_on, 0, 0);
}

/*
	Name: planemortar_contrail
	Namespace: planemortar
	Checksum: 0xF91FE0EE
	Offset: 0x220
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

/*
	Name: planemortar_marker_on
	Namespace: planemortar
	Checksum: 0x2017CF7C
	Offset: 0x320
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function planemortar_marker_on(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.var_c80d374a = util::playfxontag(fieldname, "zm_zc2/killstreaks/fx8_air_drop_marker_gold", self, "tag_origin");
	}
	else if(isdefined(self.var_c80d374a))
	{
		stopfx(fieldname, self.var_c80d374a);
	}
}

