#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_pack_a_punch.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_47a807c3;

/*
	Name: __init__system__
	Namespace: namespace_47a807c3
	Checksum: 0x7FB29ACC
	Offset: 0x118
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7587f8ddd6b0d47a", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_47a807c3
	Checksum: 0x80F724D1
	Offset: 0x160
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_8d37256a
	Namespace: namespace_47a807c3
	Checksum: 0xDFC000B7
	Offset: 0x170
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_8d37256a(e_player)
{
	foreach(player in function_a1ef346b())
	{
		level thread function_81eaae89(player);
	}
	level thread zm_powerups::show_on_hud(e_player.team, "pack_a_punch");
}

/*
	Name: function_ad31c153
	Namespace: namespace_47a807c3
	Checksum: 0xA503F71F
	Offset: 0x238
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_ad31c153()
{
	self endon(#"death", #"bled_out");
	if(self laststand::player_is_in_laststand())
	{
		self waittill(#"player_revived");
		wait(0.5);
	}
}

/*
	Name: function_81eaae89
	Namespace: namespace_47a807c3
	Checksum: 0xE0F6E8C4
	Offset: 0x2A0
	Size: 0x24C
	Parameters: 1
	Flags: Linked
*/
function function_81eaae89(e_player)
{
	e_player endon(#"death", #"bled_out");
	e_player function_ad31c153();
	var_e8145621 = e_player getweaponslistprimaries();
	w_current_weapon = e_player getcurrentweapon();
	foreach(weapon in var_e8145621)
	{
		if(e_player zm_weapons::can_upgrade_weapon(weapon))
		{
			var_5198244f = zm_weapons::get_upgrade_weapon(weapon, 1);
		}
		else
		{
			continue;
		}
		n_clip = var_5198244f.clipsize;
		n_stock = e_player getweaponammostock(weapon);
		if(w_current_weapon == weapon)
		{
			var_147bd2 = var_5198244f;
		}
		e_player zm_weapons::weapon_take(weapon);
		e_player zm_weapons::weapon_give(var_5198244f, 1, 1);
		e_player setweaponammoclip(var_5198244f, n_clip);
		e_player setweaponammostock(var_5198244f, n_stock);
	}
	if(isdefined(var_147bd2))
	{
		e_player shoulddoinitialweaponraise(var_147bd2, 0);
		e_player switchtoweaponimmediate(var_147bd2);
	}
	e_player thread function_40935801();
}

/*
	Name: function_40935801
	Namespace: namespace_47a807c3
	Checksum: 0x3ACE53CA
	Offset: 0x4F8
	Size: 0x22C
	Parameters: 0
	Flags: Linked
*/
function function_40935801()
{
	self notify(#"picked_up_pap");
	self endon(#"picked_up_pap", #"death", #"bled_out");
	wait(30);
	self function_ad31c153();
	var_e8145621 = self getweaponslistprimaries();
	w_current_weapon = self getcurrentweapon();
	foreach(w_upgraded in var_e8145621)
	{
		var_2af07147 = self zm_weapons::get_base_weapon(w_upgraded);
		n_clip = self getweaponammoclip(w_upgraded);
		n_stock = self getweaponammostock(w_upgraded);
		if(w_current_weapon == w_upgraded)
		{
			var_147bd2 = var_2af07147;
		}
		self zm_weapons::weapon_take(w_upgraded);
		self zm_weapons::weapon_give(var_2af07147, 1, 0);
		self setweaponammoclip(var_2af07147, n_clip);
		self setweaponammostock(var_2af07147, n_stock);
	}
	if(isdefined(var_147bd2))
	{
		self shoulddoinitialweaponraise(var_147bd2, 0);
		self switchtoweaponimmediate(var_147bd2);
	}
}

/*
	Name: function_35ae342e
	Namespace: namespace_47a807c3
	Checksum: 0xBD3F31AC
	Offset: 0x730
	Size: 0x1F4
	Parameters: 1
	Flags: None
*/
function function_35ae342e(e_player)
{
	if(e_player isthrowinggrenade())
	{
		while(e_player getcurrentweapon() == getweapon(#"none"))
		{
			wait(0.1);
		}
	}
	w_current_weapon = e_player getcurrentweapon();
	e_player.current_weapon = w_current_weapon;
	var_a56ad7fa = w_current_weapon;
	if(e_player zm_weapons::can_upgrade_weapon(w_current_weapon))
	{
		var_5198244f = zm_weapons::get_upgrade_weapon(w_current_weapon, 1);
	}
	if(!isdefined(var_5198244f))
	{
		e_player thread function_d0ea0364(w_current_weapon);
		return;
	}
	n_clip = var_5198244f.clipsize;
	n_stock = e_player getweaponammostock(w_current_weapon);
	e_player zm_weapons::weapon_take(w_current_weapon);
	e_player zm_weapons::weapon_give(var_5198244f, 1, 1);
	e_player shoulddoinitialweaponraise(var_5198244f, 0);
	e_player switchtoweaponimmediate(var_5198244f);
	e_player setweaponammoclip(var_5198244f, n_clip);
	e_player setweaponammostock(var_5198244f, n_stock);
	e_player thread function_d0ea0364(var_5198244f);
}

/*
	Name: function_d0ea0364
	Namespace: namespace_47a807c3
	Checksum: 0x4E10C23F
	Offset: 0x930
	Size: 0x204
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d0ea0364(var_5198244f)
{
	self notify("picked_up_pap_" + var_5198244f.name);
	self endon("picked_up_pap_" + var_5198244f.name);
	wait(30);
	var_75c77fa = self zm_weapons::get_base_weapon(var_5198244f);
	a_w_weapons = self getweaponslist();
	foreach(w_weapon in a_w_weapons)
	{
		var_2af07147 = self zm_weapons::get_base_weapon(w_weapon);
		if(var_2af07147 == var_75c77fa)
		{
			var_2af07147 = self zm_weapons::get_base_weapon(var_5198244f);
			n_clip = self getweaponammoclip(var_5198244f);
			n_stock = self getweaponammostock(var_5198244f);
			self zm_weapons::weapon_take(var_5198244f);
			self zm_weapons::weapon_give(var_2af07147, 1, 0);
			self shoulddoinitialweaponraise(var_2af07147, 0);
			self switchtoweaponimmediate(var_2af07147);
			self setweaponammoclip(var_2af07147, n_clip);
			self setweaponammostock(var_2af07147, n_stock);
			break;
		}
	}
}

