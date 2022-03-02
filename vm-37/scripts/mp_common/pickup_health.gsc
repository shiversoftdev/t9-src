#using script_256b8879317373de;
#using script_2dc48f46bfeac894;
#using script_4663ec59d864e437;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace pickup_health;

/*
	Name: function_89f2df9
	Namespace: pickup_health
	Checksum: 0x6E8C11E5
	Offset: 0x110
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"pickup_health", &function_70a657d8, undefined, undefined, #"weapons");
}

/*
	Name: function_70a657d8
	Namespace: pickup_health
	Checksum: 0x541D2CD4
	Offset: 0x160
	Size: 0x12C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_connect(&onconnect);
	callback::on_spawned(&function_590c4630);
	ability_player::register_gadget_activation_callbacks(23, &function_368c92b1, &function_6dd64ede);
	level.var_ad24980b = &function_6dd64ede;
	level.var_99a34951 = getgametypesetting(#"hash_712f4c2a96bca56e");
	level.var_33a3ef40 = getgametypesetting(#"hash_647310a2fe3554f7");
	level.var_aff59367 = getgametypesetting(#"hash_44533f4f290c5e77");
	level.var_ca2fc68c = getgametypesetting(#"hash_6a2434c947c86b9b");
}

/*
	Name: function_e963e37d
	Namespace: pickup_health
	Checksum: 0xB726021B
	Offset: 0x298
	Size: 0x22E
	Parameters: 0
	Flags: None
*/
function function_e963e37d()
{
	var_7a23c03b = getentarray("pickup_health", "targetname");
	foreach(pickup in var_7a23c03b)
	{
		pickup.trigger = spawn("trigger_radius_use", pickup.origin + vectorscale((0, 0, 1), 15), 0, 120, 100);
		pickup.trigger setcursorhint("HINT_INTERACTIVE_PROMPT");
		pickup.trigger triggerignoreteam();
		pickup.gameobject = gameobjects::create_use_object(#"neutral", pickup.trigger, [], (0, 0, 0), "pickup_health");
		pickup.gameobject gameobjects::set_objective_entity(pickup.gameobject);
		pickup.gameobject gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
		pickup.gameobject gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
		pickup.gameobject gameobjects::set_use_time(0);
		pickup.gameobject.usecount = 0;
		pickup.gameobject.var_5ecd70 = pickup;
		pickup.gameobject.onuse = &function_5bb13b48;
	}
}

/*
	Name: function_dd4bf8ac
	Namespace: pickup_health
	Checksum: 0x5F9DEF3F
	Offset: 0x4D0
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_dd4bf8ac(num)
{
	if(self.pers[#"pickup_health"] < level.var_99a34951)
	{
		self.pers[#"pickup_health"] = self.pers[#"pickup_health"] + num;
		self function_2bcfabea();
		return true;
	}
	return false;
}

/*
	Name: onconnect
	Namespace: pickup_health
	Checksum: 0xE33DDC63
	Offset: 0x568
	Size: 0x3C
	Parameters: 0
	Flags: Private
*/
function private onconnect()
{
	if(!isdefined(self.pers[#"pickup_health"]))
	{
		self.pers[#"pickup_health"] = 0;
	}
}

/*
	Name: function_590c4630
	Namespace: pickup_health
	Checksum: 0xE0913266
	Offset: 0x5B0
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private function_590c4630()
{
	self function_3fbb0e22();
}

/*
	Name: function_3fbb0e22
	Namespace: pickup_health
	Checksum: 0xC96A2B77
	Offset: 0x5D8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_3fbb0e22()
{
	waitframe(1);
	self function_2bcfabea();
}

/*
	Name: function_368c92b1
	Namespace: pickup_health
	Checksum: 0xF56F1901
	Offset: 0x600
	Size: 0x2E
	Parameters: 2
	Flags: Private
*/
function private function_368c92b1(slot, weapon)
{
	self.pers[#"pickup_health"]--;
}

/*
	Name: function_6dd64ede
	Namespace: pickup_health
	Checksum: 0x9B0ACE75
	Offset: 0x638
	Size: 0x4C
	Parameters: 2
	Flags: Private
*/
function private function_6dd64ede(slot, weapon)
{
	self gadgetdeactivate(self.gadget_health_regen_slot, self.gadget_health_regen_weapon);
	thread function_a01a8a21();
}

/*
	Name: function_a01a8a21
	Namespace: pickup_health
	Checksum: 0x362D752E
	Offset: 0x690
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_a01a8a21()
{
	wait(0.5);
	self function_2bcfabea();
}

/*
	Name: function_5bb13b48
	Namespace: pickup_health
	Checksum: 0xAB9EAE91
	Offset: 0x6C0
	Size: 0x1CC
	Parameters: 1
	Flags: Private
*/
function private function_5bb13b48(player)
{
	if(isdefined(player) && isplayer(player))
	{
		if(player function_dd4bf8ac(1))
		{
			if(isdefined(self.objectiveid))
			{
				objective_setinvisibletoplayer(self.objectiveid, player);
			}
			self.var_5ecd70 setinvisibletoplayer(player);
			self.trigger setinvisibletoplayer(player);
			player playsoundtoplayer(#"hash_8a4d3f134fa94d7", player);
			self.usecount++;
			player gestures::function_56e00fbf(#"gestable_grab", undefined, 0);
			if(is_true(level.var_aff59367))
			{
				self thread function_7a80944d(player);
			}
		}
		else
		{
			player iprintlnbold(#"hash_5a11b7ef0cd7e33b");
			player playsoundtoplayer(#"uin_default_action_denied", player);
		}
	}
	if(!is_true(level.var_aff59367) && self.usecount >= level.var_ad9d03e7)
	{
		self.var_5ecd70 delete();
		self gameobjects::disable_object(1);
	}
}

/*
	Name: function_7a80944d
	Namespace: pickup_health
	Checksum: 0x67318AF
	Offset: 0x898
	Size: 0xC4
	Parameters: 1
	Flags: Private
*/
function private function_7a80944d(player)
{
	level endon(#"game_ended");
	self endon(#"death");
	player endon(#"disconnect");
	wait((isdefined(level.var_ca2fc68c) ? level.var_ca2fc68c : 0));
	if(isdefined(self.objectiveid))
	{
		objective_setvisibletoplayer(self.objectiveid, player);
	}
	self.var_5ecd70 setvisibletoplayer(player);
	self.trigger setvisibletoplayer(player);
}

/*
	Name: function_2bcfabea
	Namespace: pickup_health
	Checksum: 0xECC46576
	Offset: 0x968
	Size: 0x15C
	Parameters: 0
	Flags: Private
*/
function private function_2bcfabea()
{
	if(!isdefined(self) || !isdefined(self.pers[#"pickup_health"]))
	{
		return;
	}
	if(self.pers[#"pickup_health"] <= 0)
	{
		self gadget_health_regen::power_off();
		if(isdefined(self.gadget_health_regen_slot))
		{
			self function_19ed70ca(self.gadget_health_regen_slot, 1);
		}
		if(self.pers[#"pickup_health"] < 0)
		{
			self.pers[#"pickup_health"] = 0;
		}
	}
	else
	{
		self gadget_health_regen::power_on();
		if(self.pers[#"pickup_health"] > level.var_99a34951)
		{
			self.pers[#"pickup_health"] = level.var_99a34951;
		}
	}
	self clientfield::set_player_uimodel("hudItems.numHealthPickups", self.pers[#"pickup_health"]);
}

