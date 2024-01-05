#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_ab88201b;

/*
	Name: __init__system__
	Namespace: namespace_ab88201b
	Checksum: 0xE4AF3328
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_77812dea54caab85", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ab88201b
	Checksum: 0x59FB2EEB
	Offset: 0x118
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_6840f605489bddc2", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_ab88201b
	Checksum: 0x580E7393
	Offset: 0x180
	Size: 0xB8
	Parameters: 1
	Flags: Private
*/
function private on_begin(var_c8a36f90)
{
	level.var_2bd4c60 = (isdefined(var_c8a36f90) ? var_c8a36f90 : "movement");
	foreach(player in getplayers())
	{
		player thread function_1633056a();
	}
}

/*
	Name: on_end
	Namespace: namespace_ab88201b
	Checksum: 0x7C41B661
	Offset: 0x240
	Size: 0xB8
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
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
	Checksum: 0x9C601112
	Offset: 0x300
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
	Checksum: 0x76B01795
	Offset: 0x3F0
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

