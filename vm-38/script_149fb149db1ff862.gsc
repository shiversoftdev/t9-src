#using script_4b8e80d5d6c93ae1;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace zm_weap_black_hole_bomb;

/*
	Name: function_e1f75bec
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0xB1453C83
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e1f75bec()
{
	level notify(1875574179);
}

/*
	Name: function_89f2df9
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x1395F28B
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_weap_black_hole_bomb", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0xC1D14E9C
	Offset: 0x140
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "" + #"hash_399ab6541d717dc7", 1, 1, "int", &function_9c02e124, 0, 0);
}

/*
	Name: function_9c02e124
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x859F77B2
	Offset: 0x1A8
	Size: 0x11A
	Parameters: 7
	Flags: Linked, Private
*/
function private function_9c02e124(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	if(!is_true(bwastimejump) && isdefined(self.var_937df95))
	{
		stopfx(fieldname, self.var_937df95);
		return;
	}
	self util::waittill_dobj(fieldname);
	tag = (self haspart(fieldname, "j_spine4") ? "j_spine4" : "tag_origin");
	self.var_937df95 = self util::playfxontag(fieldname, "sr/fx9_obj_secure_soul_trail", self, tag);
}

