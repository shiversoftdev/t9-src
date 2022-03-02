#using script_7ca3324ffa5389e4;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_4b76712;

/*
	Name: function_e64616c6
	Namespace: namespace_4b76712
	Checksum: 0xF4ED0E96
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e64616c6()
{
	level notify(2117170692);
}

/*
	Name: function_89f2df9
	Namespace: namespace_4b76712
	Checksum: 0x71B93CB4
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_698dcdb18ce4f995", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_4b76712
	Checksum: 0x80F724D1
	Offset: 0x100
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_c9a18304
	Namespace: namespace_4b76712
	Checksum: 0x976B2AEC
	Offset: 0x110
	Size: 0x56
	Parameters: 1
	Flags: Private
*/
function private function_c9a18304(eventstruct)
{
	if(!(isplayer(self) || self isplayercorpse()))
	{
		return;
	}
}

/*
	Name: function_26d46af3
	Namespace: namespace_4b76712
	Checksum: 0x732EB14A
	Offset: 0x170
	Size: 0x56
	Parameters: 1
	Flags: Private
*/
function private function_26d46af3(eventstruct)
{
	if(!(isplayer(self) || self isplayercorpse()))
	{
		return;
	}
}

/*
	Name: function_f99c2453
	Namespace: namespace_4b76712
	Checksum: 0xAAF5EBB4
	Offset: 0x1D0
	Size: 0x3E
	Parameters: 1
	Flags: Private
*/
function private function_f99c2453(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
}

