#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using script_6ce38ab036223e6e;
#using script_6d813fcbc979603a;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_9b24ce43;

/*
	Name: function_d5f433fe
	Namespace: namespace_9b24ce43
	Checksum: 0x8C4DF381
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d5f433fe()
{
	level notify(789630584);
}

/*
	Name: function_89f2df9
	Namespace: namespace_9b24ce43
	Checksum: 0xC3555AC8
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_678d56e299d40621", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_9b24ce43
	Checksum: 0x5D05D9CC
	Offset: 0x108
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
	zm_trial::register_challenge(#"hash_32cdfeca4a793d78", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_9b24ce43
	Checksum: 0x2E265D34
	Offset: 0x170
	Size: 0x90
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
	foreach(player in getplayers())
	{
		player thread movement_watcher();
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_9b24ce43
	Checksum: 0x5F40407C
	Offset: 0x208
	Size: 0x94
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	foreach(player in getplayers())
	{
		player notify(#"hash_17c41292130032eb");
	}
}

/*
	Name: is_active
	Namespace: namespace_9b24ce43
	Checksum: 0x568AB3B0
	Offset: 0x2A8
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_32cdfeca4a793d78");
	return isdefined(challenge);
}

/*
	Name: movement_watcher
	Namespace: namespace_9b24ce43
	Checksum: 0xFBAC885E
	Offset: 0x2E8
	Size: 0x2C2
	Parameters: 0
	Flags: Private
*/
function private movement_watcher()
{
	self endon(#"disconnect", #"hash_17c41292130032eb");
	wait(namespace_a28acff3::get_delay_between_rounds() - 2);
	while(true)
	{
		var_89276ce9 = 0;
		var_197c85d1 = self getvelocity();
		n_speed = length(var_197c85d1);
		var_f77522bb = self getnormalizedmovement();
		if(isalive(self) && !self laststand::player_is_in_laststand() && n_speed > 0 && !self zm_utility::is_jumping() && var_f77522bb != (0, 0, 0))
		{
			if(isdefined(self.armor) && self.armor > 0)
			{
				if(!namespace_115c602a::is_active() || (namespace_115c602a::is_active() && is_true(self.var_ccee13fc)))
				{
					self playsoundtoplayer(#"hash_6df374d848ba6a60", self);
					self dodamage(11, self.origin);
					var_89276ce9 = 1;
				}
			}
			else if(!namespace_115c602a::is_active() || (namespace_115c602a::is_active() && is_true(self.var_ccee13fc)))
			{
				self playsoundtoplayer(#"hash_6df374d848ba6a60", self);
				self dodamage(6, self.origin);
				var_89276ce9 = 1;
			}
		}
		if(var_89276ce9)
		{
			if(namespace_115c602a::is_active() && is_true(self.var_ccee13fc))
			{
				wait(1);
			}
			else
			{
				wait(0.2);
			}
		}
		else
		{
			waitframe(1);
		}
	}
}

