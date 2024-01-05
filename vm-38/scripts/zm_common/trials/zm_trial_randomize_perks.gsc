#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_bgb_pack.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_randomize_perks;

/*
	Name: function_89f75cdc
	Namespace: zm_trial_randomize_perks
	Checksum: 0x22382751
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_89f75cdc()
{
	level notify(1679219105);
}

/*
	Name: __init__system__
	Namespace: zm_trial_randomize_perks
	Checksum: 0xD8A2D11A
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_randomize_perks", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_randomize_perks
	Checksum: 0x23DE8FE1
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
	zm_trial::register_challenge(#"randomize_perks", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_randomize_perks
	Checksum: 0xDADE7CC
	Offset: 0x180
	Size: 0xA0
	Parameters: 0
	Flags: Linked, Private
*/
function private on_begin()
{
	zm_trial_util::function_8036c103();
	foreach(player in getplayers())
	{
		player thread function_83fa47e8();
	}
}

/*
	Name: on_end
	Namespace: zm_trial_randomize_perks
	Checksum: 0xE142DBB4
	Offset: 0x228
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private on_end(round_reset)
{
	foreach(player in getplayers())
	{
		player thread function_50b92441();
	}
	level util::delay(1, "end_game", &zm_trial_util::function_302c6014);
}

/*
	Name: function_83fa47e8
	Namespace: zm_trial_randomize_perks
	Checksum: 0x8647CE2C
	Offset: 0x300
	Size: 0x2D4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_83fa47e8()
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	self bgb_pack::function_59004002(#"zm_bgb_perk_up", 1);
	self bgb_pack::function_59004002(#"zm_bgb_perkaholic", 1);
	wait(8);
	if(isdefined(self.var_2a62e678))
	{
		self.var_cdc2b986 = self zm_weapons::get_player_weapondata(self.var_2a62e678);
	}
	var_45a6b64a = arraycopy(self.var_cd5d9345);
	self.var_5046ea5e = self zm_trial_util::function_3f8a4145(0);
	self.var_5046ea5e.var_cd5d9345 = var_45a6b64a;
	wait(1);
	self.var_cd5d9345 = [];
	for(n_slot = 0; n_slot < 4; n_slot++)
	{
		var_67017da5 = self.var_5046ea5e.var_8f0c164f[n_slot];
		if(!isdefined(var_67017da5))
		{
			continue;
		}
		var_52bb1366 = arraycopy(self.var_5046ea5e.var_8f0c164f);
		if(isarray(self.var_5046ea5e.var_724d826b))
		{
			var_52bb1366 = arraycombine(var_52bb1366, self.var_5046ea5e.var_724d826b, 0, 0);
		}
		var_de5c852b = zm_perks::function_5ea0c6cf(var_52bb1366);
		self.var_c27f1e90[n_slot] = var_de5c852b;
		self zm_perks::function_81bc6765(n_slot, level._custom_perks[var_de5c852b].alias);
		self zm_perks::function_9bdf581f(var_de5c852b, n_slot, 0);
	}
	if(isarray(self.var_5046ea5e.var_724d826b))
	{
		for(i = 0; i < self.var_5046ea5e.var_724d826b.size; i++)
		{
			var_16c042b8 = self zm_perks::function_b2cba45a();
			if(!isdefined(var_16c042b8))
			{
				break;
			}
		}
	}
	self function_3a95c571();
}

/*
	Name: function_50b92441
	Namespace: zm_trial_randomize_perks
	Checksum: 0x1DED006E
	Offset: 0x5E0
	Size: 0x23C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_50b92441()
{
	self endon(#"disconnect");
	for(n_slot = 0; n_slot <= 4; n_slot++)
	{
		var_f2e579a1 = self.var_c27f1e90[n_slot];
		if(isdefined(var_f2e579a1) && isinarray(self.var_466b927f, var_f2e579a1))
		{
			self notify(var_f2e579a1 + "_stop", {#hash_613b7621:1});
			util::wait_network_frame();
		}
	}
	if(isarray(self.var_67ba1237))
	{
		foreach(var_16c042b8 in self.var_67ba1237)
		{
			self notify(var_16c042b8 + "_stop", {#hash_613b7621:1});
			util::wait_network_frame();
		}
	}
	self zm_trial_util::function_d37a769(self.var_5046ea5e);
	self function_3a95c571();
	if(isarray(self.var_5046ea5e.var_cd5d9345))
	{
		self.var_cd5d9345 = arraycopy(self.var_5046ea5e.var_cd5d9345);
	}
	self.var_5046ea5e = undefined;
	self.var_cdc2b986 = undefined;
	self bgb_pack::function_59004002(#"zm_bgb_perk_up", 0);
	self bgb_pack::function_59004002(#"zm_bgb_perkaholic", 0);
}

/*
	Name: is_active
	Namespace: zm_trial_randomize_perks
	Checksum: 0x11161645
	Offset: 0x828
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function is_active()
{
	s_challenge = zm_trial::function_a36e8c38(#"randomize_perks");
	return isdefined(s_challenge);
}

/*
	Name: function_3a95c571
	Namespace: zm_trial_randomize_perks
	Checksum: 0x3058BE34
	Offset: 0x868
	Size: 0x10C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3a95c571()
{
	if(isinarray(self.var_67ba1237, #"specialty_additionalprimaryweapon") && isdefined(self.var_cdc2b986) && !self hasweapon(self.var_5046ea5e.additional_primary_weapon))
	{
		self zm_weapons::weapondata_give(self.var_cdc2b986);
	}
	else if(isinarray(self.var_466b927f, #"specialty_additionalprimaryweapon") && isdefined(self.var_cdc2b986) && !self hasweapon(self.var_5046ea5e.additional_primary_weapon))
	{
		self zm_weapons::weapondata_give(self.var_cdc2b986);
	}
}

