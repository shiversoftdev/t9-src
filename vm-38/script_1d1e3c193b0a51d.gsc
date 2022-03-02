#using script_27c22e1d8df4d852;
#using script_3f9e0dc8454d98e1;
#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_c1466447;

/*
	Name: function_9824c540
	Namespace: namespace_c1466447
	Checksum: 0xBEEFB4AE
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9824c540()
{
	level notify(1413685093);
}

/*
	Name: function_89f2df9
	Namespace: namespace_c1466447
	Checksum: 0x788998AD
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2f326252a6b5175", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_c1466447
	Checksum: 0x567BD08
	Offset: 0x120
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
	zm_trial::register_challenge(#"hash_322751dde777c910", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_c1466447
	Checksum: 0x443C0C85
	Offset: 0x188
	Size: 0xE0
	Parameters: 2
	Flags: Private
*/
function private function_d1de6a85(var_c8a36f90, var_16e6b8ea)
{
	level.var_a96e21f8 = (isdefined(var_c8a36f90) ? var_c8a36f90 : "movement");
	var_16e6b8ea = zm_trial::function_5769f26a(var_16e6b8ea);
	foreach(player in getplayers())
	{
		player thread function_1633056a(var_16e6b8ea);
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_c1466447
	Checksum: 0x897895B3
	Offset: 0x270
	Size: 0x16
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	level.var_a96e21f8 = undefined;
}

/*
	Name: function_1633056a
	Namespace: namespace_c1466447
	Checksum: 0xCF154912
	Offset: 0x290
	Size: 0xE4
	Parameters: 1
	Flags: Private
*/
function private function_1633056a(var_16e6b8ea)
{
	if(!isdefined(var_16e6b8ea))
	{
		var_16e6b8ea = 10;
	}
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	while(true)
	{
		if(isalive(self) && !self laststand::player_is_in_laststand() && self function_c81cdba2())
		{
			self playsoundtoplayer(#"hash_6df374d848ba6a60", self);
			self dodamage(var_16e6b8ea, self.origin);
			wait(1);
		}
		waitframe(1);
	}
}

/*
	Name: function_c81cdba2
	Namespace: namespace_c1466447
	Checksum: 0x7AD46F03
	Offset: 0x380
	Size: 0x1AC
	Parameters: 0
	Flags: Private
*/
function private function_c81cdba2()
{
	switch(level.var_a96e21f8)
	{
		case "ads":
		{
			var_389b3ef1 = self playerads();
			if(self adsbuttonpressed() && var_389b3ef1 > 0)
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
		case "crouch":
		{
			if(self getstance() === "crouch")
			{
				return true;
			}
			return false;
		}
		case "sprint":
		{
			if(self issprinting())
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

