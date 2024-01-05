#using script_24c32478acf44108;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_attachments;

/*
	Name: __init__system__
	Namespace: zm_attachments
	Checksum: 0xCCC8B77A
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_attachments", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_attachments
	Checksum: 0xA6E0A2D7
	Offset: 0xD8
	Size: 0xBC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	namespace_9ff9f642::register_burn(#"hash_72a155025f3da562", 100, 3);
	namespace_9ff9f642::register_slowdown(#"hash_1c9af7bb427952d", 0.85, 1);
	namespace_9ff9f642::register_slowdown(#"hash_1d07249a2211a81d", 0.9, 1);
	namespace_9ff9f642::register_slowdown(#"hash_721bfbe781c0d680", 0.95, 1);
}

/*
	Name: function_9f8d8c38
	Namespace: zm_attachments
	Checksum: 0x1A83ACCC
	Offset: 0x1A0
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function function_9f8d8c38()
{
	if(isdefined(self.var_6f84b820))
	{
		switch(self.var_6f84b820)
		{
			case "normal":
			{
				var_3e5502b5 = #"hash_1c9af7bb427952d";
				break;
			}
			case "special":
			{
				var_3e5502b5 = #"hash_1d07249a2211a81d";
				break;
			}
			case "elite":
			{
				var_3e5502b5 = #"hash_721bfbe781c0d680";
				break;
			}
		}
		if(isdefined(var_3e5502b5))
		{
			self thread namespace_9ff9f642::slowdown(var_3e5502b5);
		}
	}
}

/*
	Name: dragons_breath
	Namespace: zm_attachments
	Checksum: 0x6FF3064
	Offset: 0x270
	Size: 0x1CC
	Parameters: 3
	Flags: None
*/
function dragons_breath(e_attacker, n_damage, weapon)
{
	if(!isdefined(self.var_f6291271))
	{
		self.var_f6291271 = [];
	}
	else if(!isarray(self.var_f6291271))
	{
		self.var_f6291271 = array(self.var_f6291271);
	}
	if(isinarray(self.var_f6291271, e_attacker))
	{
		if(self.archetype === #"zombie" && n_damage > self.health)
		{
			self.var_b364c165 = 1;
		}
		return n_damage;
	}
	if(!isdefined(self.var_f6291271))
	{
		self.var_f6291271 = [];
	}
	else if(!isarray(self.var_f6291271))
	{
		self.var_f6291271 = array(self.var_f6291271);
	}
	self.var_f6291271[self.var_f6291271.size] = e_attacker;
	self thread function_ddda26e(e_attacker);
	if(self.archetype === #"zombie")
	{
		n_damage = n_damage + 100;
		if(n_damage < self.health)
		{
			self namespace_9ff9f642::burn(#"hash_72a155025f3da562", e_attacker, weapon);
		}
		else
		{
			self.var_b364c165 = 1;
		}
	}
	else
	{
		n_damage = n_damage + 200;
	}
	return n_damage;
}

/*
	Name: function_ddda26e
	Namespace: zm_attachments
	Checksum: 0x891107A9
	Offset: 0x448
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ddda26e(e_attacker)
{
	self endon(#"death");
	waitframe(5);
	arrayremovevalue(self.var_f6291271, e_attacker);
}

/*
	Name: function_82bca1c7
	Namespace: zm_attachments
	Checksum: 0x1123B986
	Offset: 0x498
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_82bca1c7(e_attacker)
{
	if(e_attacker playerads() == 1)
	{
		if(self.var_6f84b820 === #"normal" && math::cointoss(10) && distancesquared(self.origin, e_attacker.origin) < 40000)
		{
			self ai::stun(2);
		}
	}
}

