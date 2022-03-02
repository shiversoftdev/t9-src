#using script_27c22e1d8df4d852;
#using script_3f9e0dc8454d98e1;
#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_ab88201b;

/*
	Name: function_cec386fd
	Namespace: namespace_ab88201b
	Checksum: 0x1CD370EE
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cec386fd()
{
	level notify(1463066335);
}

/*
	Name: function_89f2df9
	Namespace: namespace_ab88201b
	Checksum: 0xE6E5AC3E
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_77812dea54caab85", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ab88201b
	Checksum: 0x8A6CC97D
	Offset: 0x138
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_6840f605489bddc2", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_ab88201b
	Checksum: 0xA5F668F7
	Offset: 0x1A0
	Size: 0xB8
	Parameters: 1
	Flags: Private
*/
function private function_d1de6a85(var_c8a36f90)
{
	level.var_2bd4c60 = (isdefined(var_c8a36f90) ? var_c8a36f90 : "movement");
	foreach(player in getplayers())
	{
		player thread function_1633056a();
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_ab88201b
	Checksum: 0x86ACCD43
	Offset: 0x260
	Size: 0xB8
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	level.var_2bd4c60 = undefined;
	foreach(player in getplayers())
	{
		player val::reset(#"hash_10a425ccc9bbccad", "health_regen");
	}
}

/*
	Name: function_1633056a
	Namespace: namespace_ab88201b
	Checksum: 0x25CB17EA
	Offset: 0x320
	Size: 0xE6
	Parameters: 0
	Flags: Private
*/
function private function_1633056a()
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	while(true)
	{
		if(self function_26f124d8() && !self.heal.enabled)
		{
			self val::reset(#"hash_10a425ccc9bbccad", "health_regen");
		}
		else if(!self function_26f124d8() && self.heal.enabled)
		{
			self val::set(#"hash_10a425ccc9bbccad", "health_regen", 0);
		}
		waitframe(1);
	}
}

/*
	Name: function_26f124d8
	Namespace: namespace_ab88201b
	Checksum: 0x5CF10D4B
	Offset: 0x410
	Size: 0x1D4
	Parameters: 0
	Flags: Private
*/
function private function_26f124d8()
{
	switch(level.var_2bd4c60)
	{
		case "ads":
		{
			if(self playerads() == 1)
			{
				return true;
			}
			return false;
		}
		case "jump":
		{
			if(self zm_utility::is_jumping())
			{
				return true;
			}
			return false;
		}
		case "slide":
		{
			if(self issliding())
			{
				return true;
			}
			return false;
		}
		case "hash_6c6c8f6b349b8751":
		{
			if(self zm_utility::is_jumping() || self issliding())
			{
				return true;
			}
			return false;
		}
		case "crouch":
		{
			if(self getstance() === "crouch")
			{
				return true;
			}
			return false;
		}
		case "prone":
		{
			if(self getstance() === "prone")
			{
				return true;
			}
			return false;
		}
		case "movement":
		default:
		{
			v_velocity = self getvelocity();
			if(length(v_velocity) != 0)
			{
				return true;
			}
			return false;
		}
	}
	return false;
}

