#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_trial_no_ads;

/*
	Name: function_8478c270
	Namespace: zm_trial_no_ads
	Checksum: 0x6D340A81
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8478c270()
{
	level notify(1585262323);
}

/*
	Name: __init__system__
	Namespace: zm_trial_no_ads
	Checksum: 0x66E46F78
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_no_ads", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_no_ads
	Checksum: 0x8B5E437A
	Offset: 0x120
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
	zm_trial::register_challenge(#"no_ads", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_no_ads
	Checksum: 0x4F0CDA8C
	Offset: 0x188
	Size: 0x29C
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
	callback::on_spawned(&function_dc856fd8);
	callback::on_ai_spawned(&on_ai_spawned);
	foreach(player in getplayers())
	{
		player zm_trial_util::function_8677ce00(1);
		player allowads(0);
		player._allow_ads = 0;
		player thread function_dc856fd8();
		player thread function_16824dc3();
		player thread function_2d961b95();
		player zm_trial_util::function_9bf8e274();
		foreach(w_equip in level.zombie_weapons)
		{
			if(zm_loadout::is_lethal_grenade(w_equip.weapon) || zm_loadout::is_melee_weapon(w_equip.weapon))
			{
				player function_28602a03(w_equip.weapon, 1, 1);
			}
		}
		player zm_trial_util::function_dc9ab223(1, 1);
	}
	callback::function_33f0ddd3(&function_33f0ddd3);
	level zm_trial::function_44200d07(1);
	level zm_trial::function_cd75b690(1);
}

/*
	Name: on_end
	Namespace: zm_trial_no_ads
	Checksum: 0x6051D3A7
	Offset: 0x430
	Size: 0x27C
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	callback::remove_on_spawned(&function_dc856fd8);
	callback::function_824d206(&function_33f0ddd3);
	callback::remove_on_ai_spawned(&on_ai_spawned);
	foreach(player in getplayers())
	{
		player notify(#"allow_ads");
		player._allow_ads = undefined;
		player allowads(1);
		player function_4488a530(0);
		player zm_trial_util::function_73ff0096();
		foreach(w_equip in level.zombie_weapons)
		{
			if(zm_loadout::is_lethal_grenade(w_equip.weapon) || zm_loadout::is_melee_weapon(w_equip.weapon))
			{
				player unlockweapon(w_equip.weapon);
			}
		}
		player zm_trial_util::function_dc9ab223(0, 1);
		player zm_trial_util::function_8677ce00(0);
	}
	level zm_trial::function_44200d07(0);
	level zm_trial::function_cd75b690(0);
}

/*
	Name: on_ai_spawned
	Namespace: zm_trial_no_ads
	Checksum: 0x9479D75B
	Offset: 0x6B8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function on_ai_spawned(params)
{
	self disableaimassist();
}

/*
	Name: function_dc856fd8
	Namespace: zm_trial_no_ads
	Checksum: 0x9DB12960
	Offset: 0x6E8
	Size: 0xC0
	Parameters: 0
	Flags: Private
*/
function private function_dc856fd8()
{
	self notify("7b8b17371dc9188f");
	self endon("7b8b17371dc9188f");
	self endon(#"disconnect", #"allow_ads");
	self allowads(0);
	while(true)
	{
		self waittill(#"crafting_fail", #"crafting_success", #"bgb_update");
		if(isalive(self))
		{
			self allowads(0);
		}
	}
}

/*
	Name: function_16824dc3
	Namespace: zm_trial_no_ads
	Checksum: 0x896174EA
	Offset: 0x7B0
	Size: 0xEA
	Parameters: 0
	Flags: Private
*/
function private function_16824dc3()
{
	self endon(#"disconnect", #"allow_ads");
	while(true)
	{
		w_curr = self getcurrentweapon();
		if(isalive(self) && self adsbuttonpressed() && (w_curr.dualwieldweapon === level.weaponnone || w_curr.isriotshield))
		{
			self zm_trial_util::function_97444b02();
			while(self adsbuttonpressed())
			{
				waitframe(1);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_33f0ddd3
	Namespace: zm_trial_no_ads
	Checksum: 0x7B57D3DB
	Offset: 0x8A8
	Size: 0xAC
	Parameters: 1
	Flags: Private
*/
function private function_33f0ddd3(s_event)
{
	if(s_event.event === "give_weapon")
	{
		self function_28602a03(s_event.weapon, 0, 1);
		if(zm_loadout::is_melee_weapon(s_event.weapon) || zm_loadout::is_lethal_grenade(s_event.weapon))
		{
			self function_28602a03(s_event.weapon, 1, 1);
		}
	}
}

/*
	Name: function_2d961b95
	Namespace: zm_trial_no_ads
	Checksum: 0xBC1C6884
	Offset: 0x960
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function function_2d961b95()
{
	self endon(#"disconnect", #"allow_ads");
	while(true)
	{
		s_waitresult = undefined;
		s_waitresult = self waittill(#"weapon_change");
		if(isalive(self))
		{
			if(s_waitresult.weapon.isriotshield)
			{
				self function_4488a530(1);
			}
			else
			{
				self function_4488a530(0);
			}
		}
	}
}

