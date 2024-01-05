#using script_396f7d71538c9677;
#using scripts\core_common\battlechatter.gsc;
#using scripts\weapons\weapon_utils.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_ad2a73d6;

/*
	Name: function_2e2e2507
	Namespace: namespace_ad2a73d6
	Checksum: 0x104D6030
	Offset: 0x188
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2e2e2507()
{
	level notify(-1285102097);
}

#namespace battlechatter;

/*
	Name: function_30146e82
	Namespace: battlechatter
	Checksum: 0x3933F6A3
	Offset: 0x1A8
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_30146e82(player)
{
	if(player hasperk(#"specialty_quieter"))
	{
		return;
	}
	playerbundle = function_58c93260(player);
	if(!isdefined(playerbundle))
	{
		return;
	}
	voiceprefix = playerbundle.voiceprefix;
	dialogkey = playerbundle.var_b12a1e12;
	if(!isdefined(voiceprefix) || !isdefined(dialogkey))
	{
		return;
	}
	dialogalias = voiceprefix + dialogkey;
	self.var_6765d33e = 1;
	self thread function_a48c33ff(dialogalias, 18);
}

/*
	Name: pain_vox
	Namespace: battlechatter
	Checksum: 0x85663264
	Offset: 0x288
	Size: 0x38E
	Parameters: 2
	Flags: Linked
*/
function pain_vox(meansofdeath, weapon)
{
	if(self.var_f16a71ae === 1)
	{
		return;
	}
	if(meansofdeath == "MOD_DEATH_CIRCLE" || meansofdeath == "MOD_BLED_OUT")
	{
		return;
	}
	playerbundle = function_58c93260(self, meansofdeath);
	if(!isdefined(playerbundle))
	{
		return;
	}
	voiceprefix = playerbundle.voiceprefix;
	if(!isdefined(voiceprefix))
	{
		return;
	}
	if(!dialog_chance("smallPainChance"))
	{
		return;
	}
	if(meansofdeath == "MOD_DROWN")
	{
		var_1f2bdb96 = playerbundle.exertpaindrowning;
		self.voxdrowning = 1;
	}
	else
	{
		if(meansofdeath == "MOD_DOT" || meansofdeath == "MOD_DOT_SELF")
		{
			if(!isdefined(self.var_dbffaa32))
			{
				return;
			}
			if(isdefined(weapon))
			{
				if(weapon.doesfiredamage)
				{
					var_1f2bdb96 = playerbundle.var_c3b67de0;
				}
			}
			else
			{
				var_1f2bdb96 = playerbundle.exertpaindamagetick;
			}
		}
		else
		{
			if(meansofdeath == "MOD_FALLING")
			{
				if(self hasperk(#"specialty_quieter"))
				{
					return;
				}
				var_1f2bdb96 = playerbundle.exertpainfalling;
			}
			else
			{
				if(meansofdeath == "MOD_BURNED")
				{
					var_1f2bdb96 = playerbundle.var_c3b67de0;
				}
				else
				{
					if(meansofdeath == "MOD_ELECTROCUTED")
					{
						var_1f2bdb96 = playerbundle.var_68bb30c1;
					}
					else
					{
						if(self isplayerunderwater())
						{
							var_1f2bdb96 = playerbundle.exertpainunderwater;
						}
						else
						{
							if(weapons::ismeleemod(meansofdeath))
							{
								var_1f2bdb96 = playerbundle.var_b801796c;
							}
							else
							{
								if(weapons::isexplosivedamage(meansofdeath))
								{
									if(weapon.name === #"eq_flash_grenade")
									{
										var_1f2bdb96 = playerbundle.var_af97fe9b;
									}
									else if(weapon.name === #"eq_slow_grenade")
									{
										var_1f2bdb96 = playerbundle.var_ed50283e;
									}
								}
								else
								{
									if(weapons::isbulletdamage(meansofdeath))
									{
										var_1f2bdb96 = playerbundle.var_a9b4dabb;
									}
									else
									{
										var_1f2bdb96 = playerbundle.exertpain;
									}
								}
							}
						}
					}
				}
			}
		}
	}
	if(!isdefined(var_1f2bdb96))
	{
		return;
	}
	exertbuffer = mpdialog_value("playerExertBuffer", 0);
	if(isdefined(self.var_1ba38d8b) && (gettime() - self.var_1ba38d8b) < (int(exertbuffer * 1000)))
	{
		return;
	}
	dialogkey = voiceprefix + var_1f2bdb96;
	self thread function_a48c33ff(dialogkey, 30, exertbuffer);
	self.var_6765d33e = 1;
	self.var_1ba38d8b = gettime();
}

/*
	Name: function_78c16252
	Namespace: battlechatter
	Checksum: 0x88B9621
	Offset: 0x620
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_78c16252()
{
	playerbundle = function_58c93260(self);
	if(!isdefined(playerbundle))
	{
		return;
	}
	voiceprefix = playerbundle.voiceprefix;
	if(!isdefined(voiceprefix))
	{
		return;
	}
	var_1f2bdb96 = playerbundle.exertfullyhealedbreath;
	if(isdefined(var_1f2bdb96))
	{
		dialogkey = voiceprefix + var_1f2bdb96;
		self thread function_a48c33ff(dialogkey, 16);
	}
}

/*
	Name: play_death_vox
	Namespace: battlechatter
	Checksum: 0x19E91D63
	Offset: 0x6C8
	Size: 0x184
	Parameters: 4
	Flags: None
*/
function play_death_vox(body, attacker, weapon, meansofdeath)
{
	playerbundle = function_58c93260(self, meansofdeath);
	if(!isdefined(playerbundle))
	{
		return;
	}
	voiceprefix = playerbundle.voiceprefix;
	if(!isdefined(voiceprefix))
	{
		return;
	}
	deathalias = self get_death_vox(weapon, playerbundle, meansofdeath);
	if(self function_8b1a219a())
	{
		if(isdefined(deathalias))
		{
			var_27e6026e = function_5d15920e(deathalias, playerbundle);
			entitynumber = self getentitynumber();
			attacker function_661a6cc1(var_27e6026e, entitynumber);
		}
	}
	else if(isdefined(deathalias))
	{
		if(attacker haspart("J_Head"))
		{
			attacker playsoundontag(voiceprefix + deathalias, "J_Head");
		}
		else
		{
			attacker playsoundontag(voiceprefix + deathalias, "tag_origin");
		}
	}
}

/*
	Name: get_death_vox
	Namespace: battlechatter
	Checksum: 0x47ADF42C
	Offset: 0x858
	Size: 0x3C0
	Parameters: 3
	Flags: Linked
*/
function get_death_vox(weapon, playerbundle, meansofdeath)
{
	if(self isplayerunderwater())
	{
		var_1f2bdb96 = playerbundle.exertdeathdrowned;
		return var_1f2bdb96;
	}
	if(self weapons::isexplosivedamage(meansofdeath))
	{
		var_1f2bdb96 = playerbundle.var_44d86dec;
	}
	if(isdefined(meansofdeath))
	{
		switch(meansofdeath)
		{
			case "mod_rifle_bullet":
			case "mod_pistol_bullet":
			{
				var_1f2bdb96 = playerbundle.exertdeath;
				break;
			}
			case "mod_burned":
			{
				var_1f2bdb96 = playerbundle.exertdeathburned;
				break;
			}
			case "mod_melee_weapon_butt":
			{
				var_1f2bdb96 = playerbundle.var_53f25688;
				break;
			}
			case "mod_head_shot":
			{
				var_1f2bdb96 = playerbundle.var_207908de;
				break;
			}
			case "mod_trigger_hurt":
			{
				if(self getvelocity()[2] < -100)
				{
					var_1f2bdb96 = playerbundle.var_1dfcabbd;
				}
				else
				{
					var_1f2bdb96 = playerbundle.exertdeath;
				}
				break;
			}
			case "mod_falling":
			{
				var_1f2bdb96 = playerbundle.var_1dfcabbd;
				break;
			}
			case "mod_drown":
			{
				var_1f2bdb96 = playerbundle.exertdeathdrowned;
				break;
			}
			case "mod_gas":
			{
				var_1f2bdb96 = playerbundle.var_7a45f37b;
				break;
			}
			case "mod_dot":
			{
				if(weapon == getweapon(#"gadget_radiation_field"))
				{
					if(is_true(self.suicide))
					{
						var_1f2bdb96 = playerbundle.var_48305ed9;
					}
					else
					{
						var_1f2bdb96 = playerbundle.var_f8b4bcc1;
					}
				}
				else if(weapon == getweapon(#"tear_gas"))
				{
					var_1f2bdb96 = playerbundle.var_7a45f37b;
				}
				if(weapon.doesfiredamage)
				{
					var_1f2bdb96 = playerbundle.exertdeathburned;
				}
				break;
			}
			case "mod_crush":
			{
				stance = self getstance();
				if(stance === "prone")
				{
					var_1f2bdb96 = playerbundle.var_61f04861;
				}
				else
				{
					var_1f2bdb96 = playerbundle.var_35f92256;
				}
				break;
			}
		}
	}
	if(!isdefined(var_1f2bdb96) && isdefined(weapon) && meansofdeath !== "MOD_MELEE_WEAPON_BUTT")
	{
		switch(weapon.rootweapon.name)
		{
			case "knife_loadout":
			case "hatchet":
			{
				var_1f2bdb96 = playerbundle.exertdeathstabbed;
				break;
			}
			case "melee_slaybell_t8":
			{
				var_1f2bdb96 = playerbundle.var_53f25688;
				break;
			}
			case "shock_rifle":
			{
				var_1f2bdb96 = playerbundle.exertdeathelectrocuted;
				break;
			}
		}
	}
	if(!isdefined(var_1f2bdb96))
	{
		return;
	}
	return var_1f2bdb96;
}

/*
	Name: function_90cedf5b
	Namespace: battlechatter
	Checksum: 0xD952E1D1
	Offset: 0xC20
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_90cedf5b()
{
	playerbundle = function_58c93260(self);
	if(!isdefined(playerbundle))
	{
		return;
	}
	voiceprefix = playerbundle.voiceprefix;
	if(!isdefined(voiceprefix) || !isdefined(playerbundle.var_1ca33ad4))
	{
		return;
	}
	dialogalias = voiceprefix + playerbundle.var_1ca33ad4;
	self thread function_a48c33ff(dialogalias, 22, mpdialog_value("playerExertBuffer", 0));
}

/*
	Name: function_624f04c6
	Namespace: battlechatter
	Checksum: 0x23605EFD
	Offset: 0xCE0
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_624f04c6(playerbundle)
{
	if(!isdefined(playerbundle.var_c1674108))
	{
		return;
	}
	dialogalias = playerbundle.voiceprefix + playerbundle.var_c1674108;
	self.var_6765d33e = 1;
	self thread function_a48c33ff(dialogalias, 22, mpdialog_value("playerExertBuffer", 0));
}

/*
	Name: function_e9f06034
	Namespace: battlechatter
	Checksum: 0xF7712550
	Offset: 0xD68
	Size: 0x154
	Parameters: 2
	Flags: Linked
*/
function function_e9f06034(player, playbreath)
{
	if(player hasperk(#"specialty_quieter"))
	{
		return;
	}
	playerbundle = function_58c93260(self);
	if(!isdefined(playerbundle))
	{
		return;
	}
	voiceprefix = playerbundle.voiceprefix;
	if(!isdefined(voiceprefix))
	{
		return;
	}
	if(playbreath && isdefined(playerbundle.exertemergegasp))
	{
		dialogalias = voiceprefix + playerbundle.exertemergegasp;
		self thread function_a48c33ff(dialogalias, 22, mpdialog_value("playerExertBuffer", 0));
	}
	else if(!playbreath && isdefined(playerbundle.exertemergebreath))
	{
		dialogalias = voiceprefix + playerbundle.exertemergebreath;
		self thread function_a48c33ff(dialogalias, 22, mpdialog_value("playerExertBuffer", 0));
	}
}

