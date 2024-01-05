#using script_7ca3324ffa5389e4;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\animation_shared.csc;

#namespace player_free_fall;

/*
	Name: function_e64616c6
	Namespace: player_free_fall
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
	Name: __init__system__
	Namespace: player_free_fall
	Checksum: 0x71B93CB4
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"player_free_fall", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: player_free_fall
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
	Namespace: player_free_fall
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
	Namespace: player_free_fall
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
	Namespace: player_free_fall
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

