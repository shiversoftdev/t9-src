#using script_1d96ce237e3b4068;
#using scripts\core_common\util_shared.csc;
#using script_18b9d0e77614c97;
#using scripts\core_common\clientfield_shared.csc;

#namespace planemortar;

/*
	Name: init_shared
	Namespace: planemortar
	Checksum: 0x1629971E
	Offset: 0xF0
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	if(!isdefined(level.var_6ea2bb2e))
	{
		level.var_6ea2bb2e = {};
		clientfield::register("scriptmover", "planemortar_contrail", 1, 1, "int", &planemortar_contrail, 0, 0);
		clientfield::register_clientuimodel("hudItems.planeMortarShotsRemaining", #"hud_items", #"hash_569b707ceee60e2b", 1, 2, "int", undefined, 0, 0);
	}
}

/*
	Name: planemortar_contrail
	Namespace: planemortar
	Checksum: 0x24569CB2
	Offset: 0x1B0
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
	Name: codecallback_entityspawned
	Namespace: planemortar
	Checksum: 0x5A7CE686
	Offset: 0x2B0
	Size: 0x32
	Parameters: 1
	Flags: Event
*/
event codecallback_entityspawned(eventstruct)
{
	if(self.weapon.name !== #"planemortar")
	{
		return;
	}
}

/*
	Name: function_719342ff
	Namespace: planemortar
	Checksum: 0x44B39AE
	Offset: 0x2F0
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_719342ff()
{
	function_3385d776(#"hash_332122cbf3beacdf");
}

/*
	Name: function_611ebaf8
	Namespace: planemortar
	Checksum: 0x9249B33D
	Offset: 0x320
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_611ebaf8()
{
	function_c22a1ca2(#"hash_332122cbf3beacdf");
}

