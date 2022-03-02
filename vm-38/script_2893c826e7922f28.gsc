#using script_18b9d0e77614c97;
#using script_1d96ce237e3b4068;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_6df120d9;

/*
	Name: function_2c43c537
	Namespace: namespace_6df120d9
	Checksum: 0xA942C492
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2c43c537()
{
	level notify(708105824);
}

#namespace planemortar;

/*
	Name: init_shared
	Namespace: planemortar
	Checksum: 0xC7BB9693
	Offset: 0x110
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
		clientfield::function_a8bbc967("hudItems.planeMortarShotsRemaining", #"hud_items", #"hash_569b707ceee60e2b", 1, 2, "int", undefined, 0, 0);
	}
}

/*
	Name: planemortar_contrail
	Namespace: planemortar
	Checksum: 0x52BBBCC0
	Offset: 0x1D0
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
	Checksum: 0x58AB33CA
	Offset: 0x2D0
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
	Checksum: 0xDAFCEFF0
	Offset: 0x310
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
	Checksum: 0x308A6305
	Offset: 0x340
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_611ebaf8()
{
	function_c22a1ca2(#"hash_332122cbf3beacdf");
}

