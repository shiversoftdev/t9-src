#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_disable_perks;

/*
	Name: function_673ace34
	Namespace: zm_trial_disable_perks
	Checksum: 0x46855E29
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_673ace34()
{
	level notify(-1860513180);
}

/*
	Name: __init__system__
	Namespace: zm_trial_disable_perks
	Checksum: 0xE70F088
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_disable_perks", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_disable_perks
	Checksum: 0x13D5C902
	Offset: 0x118
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"disable_perks", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_disable_perks
	Checksum: 0x778F07D4
	Offset: 0x180
	Size: 0x15C
	Parameters: 0
	Flags: Linked, Private
*/
function private on_begin()
{
	level zm_trial::function_2b3a3307(1);
	/#
		assert(isdefined(level.var_b8be892e));
	#/
	foreach(player in getplayers())
	{
		player function_f0b698a7();
		if(!isdefined(player.var_7864a0f6))
		{
			player.var_7864a0f6 = player zm_trial_util::function_3f8a4145(0);
			player function_85611c27();
		}
	}
	callback::on_revived(&function_776fbeaf);
	callback::on_laststand(&function_551412f6);
	zm_trial_util::function_8036c103();
}

/*
	Name: on_end
	Namespace: zm_trial_disable_perks
	Checksum: 0xA70EF71E
	Offset: 0x2E8
	Size: 0x15C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_end(round_reset)
{
	level zm_trial::function_2b3a3307(0);
	if(!round_reset)
	{
		foreach(player in getplayers())
		{
			/#
				assert(isdefined(player.var_7864a0f6));
			#/
			player zm_trial_util::function_d37a769(player.var_7864a0f6);
			player function_2c0ae6d1();
			player.var_7864a0f6 = undefined;
		}
	}
	callback::remove_on_revived(&function_776fbeaf);
	callback::remove_on_laststand(&function_551412f6);
	zm_trial_util::function_302c6014();
}

/*
	Name: is_active
	Namespace: zm_trial_disable_perks
	Checksum: 0x26265F5D
	Offset: 0x450
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function is_active(var_34f09024)
{
	if(!isdefined(var_34f09024))
	{
		var_34f09024 = 0;
	}
	if(var_34f09024 && zm_trial::function_48736df9(#"disable_perks"))
	{
		return 1;
	}
	challenge = zm_trial::function_a36e8c38(#"disable_perks");
	return isdefined(challenge);
}

/*
	Name: lose_perk
	Namespace: zm_trial_disable_perks
	Checksum: 0xEB3FB6B8
	Offset: 0x4D8
	Size: 0x188
	Parameters: 1
	Flags: None
*/
function lose_perk(perk)
{
	if(!is_active())
	{
		return false;
	}
	slot = self zm_perks::function_c1efcc57(perk);
	if(slot != -1 && isdefined(self.var_7864a0f6) && is_true(self.var_7864a0f6.var_149ec45c[slot]) && !self zm_perks::function_e56d8ef4(perk))
	{
		arrayremovevalue(self.var_cd5d9345, perk, 0);
		self.var_7864a0f6.var_149ec45c[slot] = 0;
		if(!isdefined(self.var_7864a0f6.var_6fdc9c9c))
		{
			self.var_7864a0f6.var_6fdc9c9c = [];
		}
		else if(!isarray(self.var_7864a0f6.var_6fdc9c9c))
		{
			self.var_7864a0f6.var_6fdc9c9c = array(self.var_7864a0f6.var_6fdc9c9c);
		}
		self.var_7864a0f6.var_6fdc9c9c[self.var_7864a0f6.var_6fdc9c9c.size] = slot;
		return true;
	}
	return false;
}

/*
	Name: function_776fbeaf
	Namespace: zm_trial_disable_perks
	Checksum: 0x67162470
	Offset: 0x668
	Size: 0x11E
	Parameters: 1
	Flags: Linked
*/
function function_776fbeaf(s_params)
{
	if(is_true(self.var_fbc66a96) && isdefined(self.var_7864a0f6) && isarray(self.var_7864a0f6.var_149ec45c) && isarray(self.var_7864a0f6.var_6fdc9c9c))
	{
		foreach(var_224c0c9c in self.var_7864a0f6.var_6fdc9c9c)
		{
			self.var_7864a0f6.var_149ec45c[var_224c0c9c] = 1;
		}
		self.var_7864a0f6.var_6fdc9c9c = undefined;
	}
}

/*
	Name: function_551412f6
	Namespace: zm_trial_disable_perks
	Checksum: 0x4FA96D11
	Offset: 0x790
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function function_551412f6()
{
	if(isdefined(self.var_7864a0f6))
	{
		self.var_7864a0f6.var_724d826b = undefined;
		self.var_7864a0f6.var_8dee79a9 = undefined;
		self.var_7864a0f6.var_d3f0257d = undefined;
	}
}

/*
	Name: function_f0b698a7
	Namespace: zm_trial_disable_perks
	Checksum: 0x4308438B
	Offset: 0x7D8
	Size: 0x3A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f0b698a7()
{
	self player::generate_weapon_data();
	self.var_4a17c2cb = self._generated_weapons;
	self._generated_current_weapon = undefined;
	self._generated_weapons = undefined;
}

/*
	Name: function_85611c27
	Namespace: zm_trial_disable_perks
	Checksum: 0xCE15EFA2
	Offset: 0x820
	Size: 0xD4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_85611c27()
{
	if(isdefined(self.var_7864a0f6.additional_primary_weapon))
	{
		foreach(weapondata in self.var_4a17c2cb)
		{
			weapon = weapondata[#"weapon"];
			if(weapon === self.var_7864a0f6.additional_primary_weapon)
			{
				self.var_7864a0f6.var_dd9bd473 = weapondata;
				return;
			}
		}
	}
}

/*
	Name: function_2c0ae6d1
	Namespace: zm_trial_disable_perks
	Checksum: 0x9A90AEC4
	Offset: 0x900
	Size: 0x15E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2c0ae6d1()
{
	/#
		assert(isdefined(self.var_4a17c2cb));
	#/
	var_4493e3e1 = isarray(self.var_7864a0f6.var_724d826b) && isinarray(self.var_7864a0f6.var_724d826b, #"specialty_additionalprimaryweapon");
	if(var_4493e3e1 || isinarray(self.var_466b927f, #"specialty_additionalprimaryweapon") && isdefined(self.var_7864a0f6.additional_primary_weapon) && isdefined(self.var_7864a0f6.var_dd9bd473) && !self hasweapon(self.var_7864a0f6.additional_primary_weapon))
	{
		self player::weapondata_give(self.var_7864a0f6.var_dd9bd473);
		self zm_trial_util::function_7f999aa0(self.var_7864a0f6);
	}
	self.var_4a17c2cb = undefined;
}

