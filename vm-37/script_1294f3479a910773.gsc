#using script_1568a517f901b845;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace napalm_strike;

/*
	Name: function_89f2df9
	Namespace: napalm_strike
	Checksum: 0xA45B71E0
	Offset: 0xE8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"napalm_strike", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: napalm_strike
	Checksum: 0xEDE61718
	Offset: 0x138
	Size: 0x74
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared("killstreak_napalm_strike" + "_zm");
	clientfield::register("scriptmover", "napalm_strike_marker_on", 1, 1, "int", &napalm_strike_marker_on, 0, 0);
}

/*
	Name: napalm_strike_marker_on
	Namespace: napalm_strike
	Checksum: 0x2F6D6E82
	Offset: 0x1B8
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function napalm_strike_marker_on(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.var_c80d374a = util::playfxontag(fieldname, #"zm_zc2/killstreaks/fx8_air_drop_marker_gold", self, "tag_origin");
	}
	else if(isdefined(self.var_c80d374a))
	{
		stopfx(fieldname, self.var_c80d374a);
	}
}

