#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_2c949ef8;

/*
	Name: function_afbca2dd
	Namespace: namespace_2c949ef8
	Checksum: 0xE09B9CB8
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_afbca2dd()
{
	level notify(869636470);
}

/*
	Name: init
	Namespace: namespace_2c949ef8
	Checksum: 0x80F724D1
	Offset: 0xA0
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function init()
{
}

/*
	Name: function_ac525f72
	Namespace: namespace_2c949ef8
	Checksum: 0xF5D27417
	Offset: 0xB0
	Size: 0xAC
	Parameters: 7
	Flags: None
*/
function function_ac525f72(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump)
{
	self endon(#"death", #"disconnect");
	self postfx::playpostfxbundle(#"hash_66a9fee7028a1e13");
	wait(8);
	self postfx::exitpostfxbundle(#"hash_66a9fee7028a1e13");
}

