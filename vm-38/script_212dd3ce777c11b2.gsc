#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_d592c983;

/*
	Name: function_8498602e
	Namespace: namespace_d592c983
	Checksum: 0x3EA3DF8D
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8498602e()
{
	level notify(958308122);
}

/*
	Name: main
	Namespace: namespace_d592c983
	Checksum: 0xCC7E1676
	Offset: 0x100
	Size: 0xEC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	if(!is_true(getgametypesetting(#"hash_580b0e5930bebbd1")))
	{
		return;
	}
	if(!zm_utility::is_classic())
	{
		return;
	}
	clientfield::register("scriptmover", "zm_round_accelerant_fx", 15000, 2, "int", &function_bb1b5812, 0, 0);
	clientfield::function_5b7d846d("hud_items_rampage_inducer.rampage_state", #"hash_5c79bc8ee1ef9f4c", #"hash_19252472c38c39f6", 15000, 2, "int", undefined, 0, 0);
}

/*
	Name: function_bb1b5812
	Namespace: namespace_d592c983
	Checksum: 0x2A7B2002
	Offset: 0x1F8
	Size: 0x102
	Parameters: 7
	Flags: Linked
*/
function function_bb1b5812(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump >= 2)
	{
		if(isdefined(self.fxid))
		{
			stopfx(fieldname, self.fxid);
		}
		self.fxid = function_239993de(fieldname, #"hash_e53abb78895dec6", self, "tag_origin");
	}
	else
	{
		if(isdefined(self.fxid))
		{
			stopfx(fieldname, self.fxid);
		}
		self.fxid = function_239993de(fieldname, #"hash_72817177ffeaeafd", self, "tag_origin");
	}
}

