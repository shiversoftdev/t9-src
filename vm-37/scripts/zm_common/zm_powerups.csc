#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_powerups;

/*
	Name: init
	Namespace: zm_powerups
	Checksum: 0x793E59EA
	Offset: 0x210
	Size: 0x224
	Parameters: 0
	Flags: Linked
*/
function init()
{
	if(!isdefined(level.zombie_powerups))
	{
		level.zombie_powerups = [];
	}
	add_zombie_powerup("insta_kill_ug", "powerup_instant_kill_ug", 1);
	level._effect[#"powerup_on_caution"] = #"zombie/fx_powerup_on_caution_zmb";
	level._effect[#"hash_216d76ce6f19d51c"] = #"hash_2e09347c65fb17c1";
	level._effect[#"powerup_grabbed_caution"] = #"zombie/fx_powerup_grab_caution_zmb";
	if(is_true(level.using_zombie_powerups))
	{
		level._effect[#"powerup_on_red"] = #"zombie/fx_powerup_on_red_zmb";
		level._effect[#"hash_68ab4922f64db792"] = #"hash_62b15f4f400643ab";
		level._effect[#"powerup_grabbed_red"] = #"zombie/fx_powerup_grab_red_zmb";
	}
	clientfield::register("scriptmover", "powerup_fx", 1, 3, "int", &powerup_fx_callback, 0, 0);
	clientfield::register("scriptmover", "powerup_intro_fx", 1, 3, "int", &function_618b5680, 0, 0);
	clientfield::register("scriptmover", "powerup_grabbed_fx", 1, 3, "int", &function_9f7265fd, 0, 0);
}

/*
	Name: add_zombie_powerup
	Namespace: zm_powerups
	Checksum: 0x5B431501
	Offset: 0x440
	Size: 0x396
	Parameters: 3
	Flags: Linked
*/
function add_zombie_powerup(powerup_name, client_field_name, clientfield_version)
{
	if(!isdefined(clientfield_version))
	{
		clientfield_version = 1;
	}
	if(isdefined(level.zombie_include_powerups) && !isdefined(level.zombie_include_powerups[powerup_name]))
	{
		return;
	}
	switch(powerup_name)
	{
		case "full_ammo":
		{
			var_f530d747 = "zmPowerupMaxAmmo";
			break;
		}
		case "fire_sale":
		{
			var_f530d747 = "zmPowerupFireSale";
			break;
		}
		case "bonus_points_player_shared":
		case "bonus_points_player":
		case "bonus_points_team":
		{
			var_f530d747 = "zmPowerupChaosPoints";
			break;
		}
		case "free_perk":
		{
			var_f530d747 = "zmPowerupFreePerk";
			break;
		}
		case "nuke":
		{
			var_f530d747 = "zmPowerupNuke";
			break;
		}
		case "hero_weapon_power":
		{
			var_f530d747 = "zmPowerupSpecialWeapon";
			break;
		}
		case "insta_kill":
		{
			var_f530d747 = "zmPowerupInstakill";
			break;
		}
		case "double_points":
		{
			var_f530d747 = "zmPowerupDouble";
			break;
		}
		case "carpenter":
		{
			var_f530d747 = "zmPowerupCarpenter";
			break;
		}
		default:
		{
			var_f530d747 = "";
		}
	}
	if(var_f530d747 != "" && !is_true(getgametypesetting(var_f530d747)))
	{
		return;
	}
	struct = spawnstruct();
	struct.powerup_name = powerup_name;
	level.zombie_powerups[powerup_name] = struct;
	if(isdefined(client_field_name))
	{
		var_4e6e65fa = ("hudItems.zmPowerUps." + client_field_name) + ".state";
		var_d75767cb = ("hudItems.zmPowerUps." + client_field_name) + ".timeRemaining";
		clientfield::register_clientuimodel(var_4e6e65fa, #"hash_6bba1b88c856cfdf", [1:#"state", 0:hash(client_field_name)], clientfield_version, 2, "int", &powerup_state_callback, 0, 1);
		clientfield::register_clientuimodel(var_d75767cb, #"hash_6bba1b88c856cfdf", [1:#"timeremaining", 0:hash(client_field_name)], clientfield_version, 8, "int", undefined, 0, 1);
		struct.client_field_name = var_4e6e65fa;
		struct.var_b79536ad = var_d75767cb;
	}
}

/*
	Name: include_zombie_powerup
	Namespace: zm_powerups
	Checksum: 0x12A5DAC5
	Offset: 0x7E0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function include_zombie_powerup(powerup_name)
{
	if(!isdefined(level.zombie_include_powerups))
	{
		level.zombie_include_powerups = [];
	}
	level.zombie_include_powerups[powerup_name] = 1;
}

/*
	Name: powerup_state_callback
	Namespace: zm_powerups
	Checksum: 0x8B9301A3
	Offset: 0x828
	Size: 0x76
	Parameters: 7
	Flags: Linked
*/
function powerup_state_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self notify(#"powerup", {#state:fieldname, #powerup:bwastimejump});
}

/*
	Name: powerup_fx_callback
	Namespace: zm_powerups
	Checksum: 0x1924B8DC
	Offset: 0x8A8
	Size: 0x14C
	Parameters: 7
	Flags: Linked
*/
function powerup_fx_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self function_d6070ac5(fieldname);
	switch(bwastimejump)
	{
		case 1:
		{
			str_fx = #"hash_5e119c0907721bc6";
			break;
		}
		case 2:
		{
			str_fx = #"hash_159f72c30fdda87b";
			break;
		}
		case 3:
		{
			str_fx = level._effect[#"powerup_on_red"];
			break;
		}
		case 4:
		{
			str_fx = level._effect[#"powerup_on_caution"];
			break;
		}
		default:
		{
			return;
		}
	}
	self play_powerup_fx(fieldname, str_fx);
}

/*
	Name: function_618b5680
	Namespace: zm_powerups
	Checksum: 0xA2F35B15
	Offset: 0xA00
	Size: 0x144
	Parameters: 7
	Flags: Linked
*/
function function_618b5680(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self function_d6070ac5(fieldname);
	switch(bwastimejump)
	{
		case 1:
		{
			str_fx = #"hash_511f70cb60957320";
			break;
		}
		case 2:
		{
			str_fx = #"hash_394b4cd00458a48b";
			break;
		}
		case 3:
		{
			str_fx = level._effect[#"hash_68ab4922f64db792"];
			break;
		}
		case 4:
		{
			str_fx = level._effect[#"hash_216d76ce6f19d51c"];
		}
		return;
	}
	self play_powerup_fx(fieldname, str_fx, 1);
}

/*
	Name: function_9f7265fd
	Namespace: zm_powerups
	Checksum: 0xAD1BD7DD
	Offset: 0xB50
	Size: 0x14C
	Parameters: 7
	Flags: Linked
*/
function function_9f7265fd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 1:
		{
			str_fx = #"hash_77e0a146edca56f1";
			break;
		}
		case 2:
		{
			str_fx = #"hash_51d73f69b757027e";
			break;
		}
		case 3:
		{
			str_fx = level._effect[#"powerup_grabbed_red"];
			break;
		}
		case 4:
		{
			str_fx = level._effect[#"powerup_grabbed_caution"];
			break;
		}
		default:
		{
			return;
		}
	}
	playfx(fieldname, str_fx, self.origin);
	self function_3c61c865();
}

/*
	Name: function_d6070ac5
	Namespace: zm_powerups
	Checksum: 0xC1231C09
	Offset: 0xCA8
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d6070ac5(localclientnum)
{
	if(isdefined(self.n_powerup_fx))
	{
		stopfx(localclientnum, self.n_powerup_fx);
		self.n_powerup_fx = undefined;
	}
	if(isdefined(self.var_71e06c56))
	{
		self stoploopsound(self.var_71e06c56);
		self.var_71e06c56 = undefined;
	}
	self function_3c61c865();
}

/*
	Name: function_64c47bbc
	Namespace: zm_powerups
	Checksum: 0x46464E87
	Offset: 0xD40
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_64c47bbc(localclientnum)
{
	var_4972e475 = util::spawn_model(localclientnum, #"hash_2505908c10168826", self.origin);
	var_4972e475 function_619a5c20();
	var_4972e475.var_fc558e74 = (isdefined(level.var_a0b1f787[self.model]) ? level.var_a0b1f787[self.model] : undefined);
	self.var_4972e475 = var_4972e475;
	callback::on_shutdown(&function_3c61c865);
}

/*
	Name: function_3c61c865
	Namespace: zm_powerups
	Checksum: 0x4C6A737B
	Offset: 0xE00
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3c61c865(localclientnum)
{
	if(isdefined(self.var_4972e475))
	{
		self.var_4972e475 delete();
	}
}

/*
	Name: play_powerup_fx
	Namespace: zm_powerups
	Checksum: 0x537EB602
	Offset: 0xE40
	Size: 0x162
	Parameters: 3
	Flags: Linked, Private
*/
function private play_powerup_fx(localclientnum, str_fx, var_6df65756)
{
	if(!isdefined(var_6df65756))
	{
		var_6df65756 = 0;
	}
	if(self.model !== #"tag_origin")
	{
		forcestreamxmodel(self.model);
		util::delay(1, undefined, &stopforcestreamingxmodel, self.model);
		self function_64c47bbc(localclientnum);
	}
	self util::waittill_dobj(localclientnum);
	if(!isdefined(self))
	{
		return;
	}
	if(var_6df65756 && !isdefined(self.var_71e06c56))
	{
		self playsound(localclientnum, #"hash_2b64fe9035ff0dda");
		self.var_71e06c56 = self playloopsound(#"hash_53c07a5f8f84189b");
	}
	self.n_powerup_fx = util::playfxontag(localclientnum, str_fx, self, "tag_origin");
}

/*
	Name: function_cc33adc8
	Namespace: zm_powerups
	Checksum: 0x89E21BFA
	Offset: 0xFB0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_cc33adc8()
{
	return util::get_game_type() != "zcleansed";
}

