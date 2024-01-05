#using scripts\abilities\gadgets\gadget_jammer_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace namespace_68a80213;

/*
	Name: __init__system__
	Namespace: namespace_68a80213
	Checksum: 0x24B9F027
	Offset: 0xD8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_512409f8a5de10e4", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_68a80213
	Checksum: 0xEA7516DF
	Offset: 0x130
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "" + #"hash_c5d06ae18fde4c0", 1, 1, "int", &function_870656e3, 0, 0);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_68a80213
	Checksum: 0x80F724D1
	Offset: 0x198
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: function_870656e3
	Namespace: namespace_68a80213
	Checksum: 0x888F3817
	Offset: 0x1A8
	Size: 0xF6
	Parameters: 7
	Flags: None
*/
function function_870656e3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump)
	{
		self.death_fx = function_239993de(fieldname, "zm_ai/fx9_hound_hell_dth_aoe", self, "j_spine4");
		self playsound(fieldname, #"hash_6a76932cce379c66");
	}
	else if(isdefined(self.death_fx))
	{
		stopfx(fieldname, self.death_fx);
		self.death_fx = undefined;
	}
}

