#using script_ac6a30f1991e105;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_2303c104;

/*
	Name: function_7b65a23e
	Namespace: namespace_2303c104
	Checksum: 0x22CF6A49
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7b65a23e()
{
	level notify(1452141537);
}

/*
	Name: function_89f2df9
	Namespace: namespace_2303c104
	Checksum: 0xE8DB73C6
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_1e60252f388011fb", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_2303c104
	Checksum: 0xACD23841
	Offset: 0x138
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_7029ea8551fb906f")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	clientfield::register("actor", "sr_horde_hunt_fx", 1, 1, "int", &function_4d144c6a, 0, 0);
}

/*
	Name: function_4d144c6a
	Namespace: namespace_2303c104
	Checksum: 0x57487872
	Offset: 0x208
	Size: 0x11C
	Parameters: 7
	Flags: Linked
*/
function function_4d144c6a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		function_239993de(fieldname, #"hash_6258a90cdd74e1e0", self, "tag_origin");
		if(self.headlamp_on === 1 && isdefined(self.headlight_fx))
		{
			stopfx(fieldname, self.headlight_fx);
			self.headlight_fx = util::playfxontag(fieldname, #"hash_28ca36ca6183d621", self, "tag_headlamp_FX");
			fxclientutils::stopfxbundle(fieldname, self, self.fxdef);
			fxclientutils::playfxbundle(fieldname, self, self.fxdef);
		}
	}
}

