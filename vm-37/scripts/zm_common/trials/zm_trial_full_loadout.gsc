#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_full_loadout;

/*
	Name: __init__system__
	Namespace: zm_trial_full_loadout
	Checksum: 0xF8CAE165
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_full_loadout", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_full_loadout
	Checksum: 0x52829909
	Offset: 0xC8
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
	zm_trial::register_challenge(#"full_loadout", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_full_loadout
	Checksum: 0x460F9F45
	Offset: 0x130
	Size: 0x90
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
	foreach(player in getplayers())
	{
		player thread monitor_loadout();
	}
}

/*
	Name: on_end
	Namespace: zm_trial_full_loadout
	Checksum: 0xF79A45BF
	Offset: 0x1C8
	Size: 0x1B2
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	if(!round_reset)
	{
		var_696c3b4 = [];
		foreach(player in getplayers())
		{
			if(!player.var_53531c80)
			{
				if(!isdefined(var_696c3b4))
				{
					var_696c3b4 = [];
				}
				else if(!isarray(var_696c3b4))
				{
					var_696c3b4 = array(var_696c3b4);
				}
				var_696c3b4[var_696c3b4.size] = player;
			}
		}
		if(var_696c3b4.size)
		{
			zm_trial::fail(#"hash_6a7d01641de1f5c3", var_696c3b4);
		}
	}
	foreach(player in getplayers())
	{
		player zm_trial_util::function_f3aacffb();
		player.var_53531c80 = undefined;
	}
}

/*
	Name: monitor_loadout
	Namespace: zm_trial_full_loadout
	Checksum: 0x278E337C
	Offset: 0x388
	Size: 0x266
	Parameters: 0
	Flags: Private
*/
function private monitor_loadout()
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656", #"end_game");
	self.var_53531c80 = 0;
	self zm_trial_util::function_63060af4(0);
	while(true)
	{
		a_weapons = self getweaponslistprimaries();
		weapon_equipment = self zm_loadout::get_player_lethal_grenade();
		if(!isdefined(a_weapons))
		{
			a_weapons = [];
		}
		else if(!isarray(a_weapons))
		{
			a_weapons = array(a_weapons);
		}
		a_weapons[a_weapons.size] = weapon_equipment;
		var_94020d2 = 1;
		foreach(weapon in a_weapons)
		{
			n_clip_size = self getweaponammoclipsize(weapon);
			var_2cf11630 = self getweaponammoclip(weapon);
			var_45193587 = self getweaponammostock(weapon);
			n_stock_size = min(weapon.maxammo, weapon.startammo);
			if(var_2cf11630 < n_clip_size || var_45193587 < n_stock_size)
			{
				var_94020d2 = 0;
				break;
			}
		}
		if(self.var_53531c80 != var_94020d2)
		{
			self.var_53531c80 = var_94020d2;
			self zm_trial_util::function_63060af4(self.var_53531c80);
		}
		waitframe(1);
	}
}

