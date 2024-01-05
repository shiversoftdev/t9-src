#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_net.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using script_35598499769dbb3d;

#namespace zm_armor;

/*
	Name: __init__system__
	Namespace: zm_armor
	Checksum: 0xD0A41F9
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_armor", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_armor
	Checksum: 0x6F3590EC
	Offset: 0x128
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_connect(&on_connect);
}

/*
	Name: on_connect
	Namespace: zm_armor
	Checksum: 0x9C974F4E
	Offset: 0x158
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function on_connect()
{
	callback::function_d8abfc3d("equip_armor", &function_83fbb13c);
}

/*
	Name: function_83fbb13c
	Namespace: zm_armor
	Checksum: 0x7CAC90EA
	Offset: 0x190
	Size: 0xDC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_83fbb13c(params)
{
	if(!isdefined(params.tier))
	{
		return;
	}
	switch(params.tier)
	{
		case 1:
		{
			var_ee3c60e = #"hash_3f4dec20d8ee78d3";
			break;
		}
		case 2:
		{
			var_ee3c60e = #"hash_3f4ded20d8ee7a86";
			break;
		}
		case 3:
		{
			var_ee3c60e = #"hash_3f4dee20d8ee7c39";
			break;
		}
	}
	if(isdefined(var_ee3c60e))
	{
		level thread popups::displayteammessagetoteam(var_ee3c60e, self, self.team);
	}
}

/*
	Name: register
	Namespace: zm_armor
	Checksum: 0x86869747
	Offset: 0x278
	Size: 0x94
	Parameters: 2
	Flags: None
*/
function register(var_7c8fcded, is_permanent)
{
	if(!isdefined(is_permanent))
	{
		is_permanent = 1;
	}
	if(!isdefined(level.var_9555ebfb))
	{
		level.var_9555ebfb = [];
	}
	else if(!isarray(level.var_9555ebfb))
	{
		level.var_9555ebfb = array(level.var_9555ebfb);
	}
	level.var_9555ebfb[var_7c8fcded] = is_permanent;
}

/*
	Name: function_49f4b6ee
	Namespace: zm_armor
	Checksum: 0xC8AB0611
	Offset: 0x318
	Size: 0x15C
	Parameters: 0
	Flags: None
*/
function function_49f4b6ee()
{
	self.var_9555ebfb = [];
	if(!isdefined(level.var_9555ebfb))
	{
		return;
	}
	a_keys = getarraykeys(level.var_9555ebfb);
	foreach(key in a_keys)
	{
		if(level.var_9555ebfb[key])
		{
			self.var_9555ebfb[key] = 0;
		}
	}
	foreach(key in a_keys)
	{
		if(!level.var_9555ebfb[key])
		{
			self.var_9555ebfb[key] = 0;
		}
	}
}

/*
	Name: add
	Namespace: zm_armor
	Checksum: 0x155953F0
	Offset: 0x480
	Size: 0x138
	Parameters: 4
	Flags: None
*/
function add(var_7c8fcded, var_3ed63752, var_28066539, var_df7ee5d1)
{
	if(!isdefined(var_df7ee5d1))
	{
		var_df7ee5d1 = #"hash_2082da6662372184";
	}
	var_4812bba2 = 0;
	if(isdefined(var_28066539))
	{
		var_d7de78d3 = var_28066539 - self get(var_7c8fcded);
		if(var_3ed63752 <= var_d7de78d3)
		{
			self.armor = self.armor + var_3ed63752;
			var_4812bba2 = var_3ed63752;
		}
		else
		{
			self.armor = self.armor + var_d7de78d3;
			var_4812bba2 = var_d7de78d3;
		}
	}
	else
	{
		self.armor = self.armor + var_3ed63752;
		var_4812bba2 = var_3ed63752;
	}
	if(var_4812bba2 > 0)
	{
		self playsound(var_df7ee5d1);
	}
	var_4812bba2 = var_4812bba2 + self get(var_7c8fcded);
	self.var_9555ebfb[var_7c8fcded] = var_4812bba2;
}

/*
	Name: remove
	Namespace: zm_armor
	Checksum: 0xC5ECBA4A
	Offset: 0x5C0
	Size: 0x1B4
	Parameters: 2
	Flags: Linked
*/
function remove(var_7c8fcded, var_2cd89ceb)
{
	if(!isdefined(var_2cd89ceb))
	{
		var_2cd89ceb = 0;
	}
	if(isdefined(self.var_9555ebfb[var_7c8fcded]) && self.var_9555ebfb[var_7c8fcded] > 0)
	{
		if(var_2cd89ceb)
		{
			self.armor = self.armor - self.var_9555ebfb[var_7c8fcded];
			a_keys = getarraykeys(level.var_9555ebfb);
			var_d42adc5 = 0;
			foreach(key in a_keys)
			{
				if(key !== var_7c8fcded && level.var_9555ebfb[key])
				{
					var_d42adc5 = var_d42adc5 + get(key);
				}
			}
			var_d42adc5 = min(var_d42adc5, 100);
			self.armor = int(max(var_d42adc5, self.armor));
		}
		self.var_9555ebfb[var_7c8fcded] = 0;
	}
}

/*
	Name: get
	Namespace: zm_armor
	Checksum: 0xBD0134C
	Offset: 0x780
	Size: 0x30
	Parameters: 1
	Flags: Linked
*/
function get(var_7c8fcded)
{
	if(isdefined(self.var_9555ebfb[var_7c8fcded]))
	{
		return self.var_9555ebfb[var_7c8fcded];
	}
	return 0;
}

/*
	Name: damage
	Namespace: zm_armor
	Checksum: 0xB99D05B0
	Offset: 0x7B8
	Size: 0x2F8
	Parameters: 3
	Flags: None
*/
function damage(n_damage, mod_type, e_attacker)
{
	if(self.armor <= 0)
	{
		return n_damage;
	}
	var_ee47fd1b = int(self.armor * 2);
	a_keys = getarraykeys(self.var_9555ebfb);
	if(n_damage > var_ee47fd1b)
	{
		foreach(key in a_keys)
		{
			self remove(key, 1);
		}
		self.armor = 0;
		self playsound(#"hash_2817ca3f96127e62");
		return n_damage - var_ee47fd1b;
	}
	if(n_damage > 0)
	{
		var_ee47fd1b = int(max(1, n_damage / 2));
	}
	else
	{
		var_ee47fd1b = 0;
	}
	self.armor = self.armor - var_ee47fd1b;
	var_c5aebd9f = 0;
	n_index = 0;
	while(var_c5aebd9f < var_ee47fd1b && n_index < a_keys.size)
	{
		var_b12ac727 = a_keys[n_index];
		var_2a0d4230 = self get(var_b12ac727);
		if(var_2a0d4230 > var_ee47fd1b)
		{
			var_34ada56f = var_2a0d4230 - (var_ee47fd1b - var_c5aebd9f);
			self.var_9555ebfb[var_b12ac727] = var_34ada56f;
			var_c5aebd9f = var_c5aebd9f + var_ee47fd1b;
			n_index++;
		}
		else
		{
			if(var_2a0d4230 > 0)
			{
				var_c5aebd9f = var_c5aebd9f + var_2a0d4230;
				self remove(var_b12ac727);
				if(self.armor <= 0)
				{
					self playsound(#"hash_2817ca3f96127e62");
				}
				n_index++;
			}
			else
			{
				n_index++;
			}
		}
	}
	self notify(#"damage_armor", {#attacker:e_attacker, #mod:mod_type});
	return 0;
}

