#using script_7ca3324ffa5389e4;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_4b76712;

/*
	Name: function_89f2df9
	Namespace: namespace_4b76712
	Checksum: 0xDE969BC0
	Offset: 0x98
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
	Offset: 0xE0
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
	Checksum: 0x124C2D0C
	Offset: 0xF0
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
	Checksum: 0x9774B75C
	Offset: 0x150
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
	Checksum: 0x4CA0192
	Offset: 0x1B0
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

