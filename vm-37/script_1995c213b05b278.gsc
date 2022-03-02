#using script_1478fbd17fe393cf;
#using scripts\core_common\serverfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_9b5aa273;

/*
	Name: function_89f2df9
	Namespace: namespace_9b5aa273
	Checksum: 0x29A09578
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2b0f887705d6f3e", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_9b5aa273
	Checksum: 0xA41809BE
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	serverfield::register("can_show_hold_breath_hint", 1, 1, "int", &function_b58b73b6);
}

/*
	Name: function_b58b73b6
	Namespace: namespace_9b5aa273
	Checksum: 0xA0FC199A
	Offset: 0x130
	Size: 0xB4
	Parameters: 2
	Flags: Private
*/
function private function_b58b73b6(oldval, newval)
{
	if(oldval == newval)
	{
		return;
	}
	if(newval)
	{
		if(!isdefined(level.var_5f632232))
		{
			namespace_fe8e9929::function_4c2d4fc4(#"hash_5b4b0dc5da9b211d", #"", 0, #"", 2);
		}
	}
	else if(level.var_5f632232 === #"hash_5b4b0dc5da9b211d")
	{
		namespace_fe8e9929::function_9f427d88(0);
	}
}

/*
	Name: function_c6a7519f
	Namespace: namespace_9b5aa273
	Checksum: 0x32E6C667
	Offset: 0x1F0
	Size: 0x44
	Parameters: 0
	Flags: Event
*/
event function_c6a7519f()
{
	player = self;
	player.holdingbreath = 1;
	setslowmotion(1, 0.2, 0.5);
}

/*
	Name: function_255956d5
	Namespace: namespace_9b5aa273
	Checksum: 0x89673D5D
	Offset: 0x240
	Size: 0x64
	Parameters: 0
	Flags: Event
*/
event function_255956d5()
{
	player = self;
	if(is_true(player.holdingbreath))
	{
		player.holdingbreath = undefined;
		setslowmotion(0.2, 1, 0.1);
	}
}

