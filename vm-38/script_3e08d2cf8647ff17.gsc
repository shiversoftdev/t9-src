#using script_35e940bfe99f96cd;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_be2ae534;

/*
	Name: function_4e661345
	Namespace: namespace_be2ae534
	Checksum: 0xEC00F669
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4e661345()
{
	level notify(1185361328);
}

/*
	Name: init
	Namespace: namespace_be2ae534
	Checksum: 0xC0B8895B
	Offset: 0x120
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function init()
{
	function_cae618b4("spawner_zombietron_demon");
	clientfield::register("actor", "nfrtu_move_dash", 8000, 1, "int", &function_87acfe6f, 0, 0);
}

/*
	Name: function_87acfe6f
	Namespace: namespace_be2ae534
	Checksum: 0xF166CF5F
	Offset: 0x190
	Size: 0xA4
	Parameters: 7
	Flags: Linked, Private
*/
function private function_87acfe6f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_b8cc5182 = util::playfxontag(fieldname, "zm_ai/fx8_nosferatu_dash_eyes", self, "tag_eye");
	}
	else if(isdefined(self.var_b8cc5182))
	{
		stopfx(fieldname, self.var_b8cc5182);
	}
}

