#using script_1478fbd17fe393cf;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\serverfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_9b5aa273;

/*
	Name: function_8e7afeb9
	Namespace: namespace_9b5aa273
	Checksum: 0xAF31DC20
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8e7afeb9()
{
	level notify(-1422224519);
}

/*
	Name: __init__system__
	Namespace: namespace_9b5aa273
	Checksum: 0x83AF60BE
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_2b0f887705d6f3e", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_9b5aa273
	Checksum: 0x3A94D599
	Offset: 0x130
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	serverfield::register("can_show_hold_breath_hint", 1, 1, "int", &function_b58b73b6);
	callback::function_c046382d(&function_93f6c83b);
}

/*
	Name: function_b58b73b6
	Namespace: namespace_9b5aa273
	Checksum: 0xC160BA3A
	Offset: 0x198
	Size: 0x1A4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b58b73b6(oldval, newval)
{
	if(oldval == newval)
	{
		return;
	}
	player = getplayers()[0];
	if(newval)
	{
		if(!isdefined(level.var_5f632232))
		{
			if(self function_82f2f066())
			{
				hint_tutorial::function_4c2d4fc4(#"hash_5b44c3504ac0a01e", #"", 0, #"", 2);
			}
			else
			{
				hint_tutorial::function_4c2d4fc4(#"hash_5b4b0dc5da9b211d", #"", 0, #"", 2);
			}
			player val::set(#"hold_breath", "disable_usability", 1);
		}
	}
	else
	{
		if(level.var_5f632232 === #"hash_5b4b0dc5da9b211d" || level.var_5f632232 === #"hash_5b44c3504ac0a01e")
		{
			hint_tutorial::function_9f427d88(0);
		}
		player val::reset_all(#"hold_breath");
	}
}

/*
	Name: function_d49b3ac5
	Namespace: namespace_9b5aa273
	Checksum: 0xF49A5825
	Offset: 0x348
	Size: 0x9C
	Parameters: 0
	Flags: Event
*/
event function_d49b3ac5()
{
	if(level.var_5f632232 === #"hash_5b4b0dc5da9b211d" || level.var_5f632232 === #"hash_5b44c3504ac0a01e")
	{
		hint_tutorial::function_9f427d88(0);
		player = getplayers()[0];
		player val::reset_all(#"hold_breath");
	}
}

/*
	Name: function_c6a7519f
	Namespace: namespace_9b5aa273
	Checksum: 0x8C1E662A
	Offset: 0x3F0
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
	Checksum: 0xA914FF74
	Offset: 0x440
	Size: 0x24
	Parameters: 0
	Flags: Event
*/
event function_255956d5()
{
	player = self;
	player function_9220f819();
}

/*
	Name: function_9220f819
	Namespace: namespace_9b5aa273
	Checksum: 0x2B95378F
	Offset: 0x470
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9220f819()
{
	player = self;
	if(is_true(player.holdingbreath))
	{
		player.holdingbreath = undefined;
		setslowmotion(0.2, 1, 0.1);
	}
}

/*
	Name: function_93f6c83b
	Namespace: namespace_9b5aa273
	Checksum: 0x9928A6AC
	Offset: 0x4E0
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_93f6c83b(s_params)
{
	self function_9220f819();
}

