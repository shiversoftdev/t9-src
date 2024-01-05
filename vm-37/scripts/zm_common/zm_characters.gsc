#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_maptable.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_characters;

/*
	Name: __init__system__
	Namespace: zm_characters
	Checksum: 0x698D22CA
	Offset: 0x770
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_characters", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_characters
	Checksum: 0xF621BD5
	Offset: 0x7B8
	Size: 0x7C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.var_e52a681))
	{
		level.var_e52a681 = 0;
	}
	level.var_e824f826 = 1;
	level.precachecustomcharacters = &precachecustomcharacters;
	initcharacterstartindex();
	/#
		zm_devgui::add_custom_devgui_callback(&function_9436b105);
	#/
}

/*
	Name: zombie_force_char
	Namespace: zm_characters
	Checksum: 0x8A374BA3
	Offset: 0x840
	Size: 0x94
	Parameters: 1
	Flags: Private
*/
function private zombie_force_char(n_char)
{
	/#
		/#
			assert(isdefined(self));
		#/
		/#
			assert(isplayer(self));
		#/
		/#
			assert(isalive(self));
		#/
		set_character(n_char);
	#/
}

/*
	Name: function_9436b105
	Namespace: zm_characters
	Checksum: 0x91C5C96E
	Offset: 0x8E0
	Size: 0x104
	Parameters: 1
	Flags: Private
*/
function private function_9436b105(cmd)
{
	/#
		if(issubstr(cmd, ""))
		{
			tokens = strtok(cmd, "");
			player = int(getsubstr(tokens[0], "".size));
			character = int(tokens[tokens.size - 1]);
			players = getplayers();
			players[player - 1] thread zombie_force_char(character);
		}
	#/
}

/*
	Name: precachecustomcharacters
	Namespace: zm_characters
	Checksum: 0x80F724D1
	Offset: 0x9F0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function precachecustomcharacters()
{
}

/*
	Name: initcharacterstartindex
	Namespace: zm_characters
	Checksum: 0xAE46FDD4
	Offset: 0xA00
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function initcharacterstartindex()
{
	level.characterstartindex = randomint(4);
}

/*
	Name: selectcharacterindextouse
	Namespace: zm_characters
	Checksum: 0x2B3828CF
	Offset: 0xA30
	Size: 0x46
	Parameters: 0
	Flags: None
*/
function selectcharacterindextouse()
{
	if(level.characterstartindex >= 4)
	{
		level.characterstartindex = 0;
	}
	self.characterindex = level.characterstartindex;
	level.characterstartindex++;
	return self.characterindex;
}

/*
	Name: function_b04c6f1f
	Namespace: zm_characters
	Checksum: 0x83126801
	Offset: 0xA80
	Size: 0x212
	Parameters: 0
	Flags: Linked
*/
function function_b04c6f1f()
{
	playerroletemplatecount = getplayerroletemplatecount(currentsessionmode());
	var_36918d27 = [];
	var_e7d30c12 = undefined;
	for(i = 0; i < playerroletemplatecount; i++)
	{
		/#
			if(isbot(self))
			{
				if(function_f4bf7e3f(i, currentsessionmode()))
				{
					if(!isdefined(var_36918d27))
					{
						var_36918d27 = [];
					}
					else if(!isarray(var_36918d27))
					{
						var_36918d27 = array(var_36918d27);
					}
					var_36918d27[var_36918d27.size] = i;
				}
				continue;
			}
		#/
		rf = getplayerrolefields(i, currentsessionmode());
		if(isdefined(rf) && is_true(rf.isdefaultcharacter))
		{
			if(!isdefined(var_36918d27))
			{
				var_36918d27 = [];
			}
			else if(!isarray(var_36918d27))
			{
				var_36918d27 = array(var_36918d27);
			}
			var_36918d27[var_36918d27.size] = i;
		}
		if(isdefined(rf))
		{
			if(!isdefined(var_e7d30c12))
			{
				var_e7d30c12 = i;
			}
		}
	}
	var_72964a59 = (isdefined(array::random(var_36918d27)) ? array::random(var_36918d27) : 0);
	if(var_72964a59 == 0)
	{
		return var_e7d30c12;
	}
	return var_72964a59;
}

/*
	Name: set_character
	Namespace: zm_characters
	Checksum: 0x43B79088
	Offset: 0xCA0
	Size: 0x27C
	Parameters: 1
	Flags: Linked
*/
function set_character(character)
{
	self detachall();
	if(isdefined(character))
	{
		if(isarray(character))
		{
			self.characterindex = function_9004475c(character);
		}
		else
		{
			self.characterindex = character;
		}
	}
	if(!isdefined(self.characterindex) || !player_role::is_valid(self.characterindex))
	{
		self.characterindex = self player_role::function_2a911680();
		/#
			if(self ishost() && getdvarstring(#"force_char") != "")
			{
				self.characterindex = getdvarint(#"force_char", 0);
			}
		#/
		if(self.characterindex == 0)
		{
			self.characterindex = function_b04c6f1f();
		}
		self.pers[#"characterindex"] = self.characterindex;
	}
	player_role::set(self.characterindex);
	self.favorite_wall_weapons_list = [];
	self.talks_in_danger = 0;
	if(!isdefined(level.var_6f14e9e1))
	{
		level.var_6f14e9e1 = [];
	}
	else if(!isarray(level.var_6f14e9e1))
	{
		level.var_6f14e9e1 = array(level.var_6f14e9e1);
	}
	if(!isinarray(level.var_6f14e9e1, self))
	{
		level.var_6f14e9e1[level.var_6f14e9e1.size] = self;
	}
	characterindex = function_dc232a80();
	if(isdefined(characterindex))
	{
		zm_audio::setexertvoice(characterindex);
	}
}

/*
	Name: setup_personality_character_exerts
	Namespace: zm_characters
	Checksum: 0xFCE9212F
	Offset: 0xF28
	Size: 0x8EC
	Parameters: 0
	Flags: None
*/
function setup_personality_character_exerts()
{
	level.exert_sounds[1][#"burp"][0] = "vox_plr_0_exert_burp_0";
	level.exert_sounds[1][#"burp"][1] = "vox_plr_0_exert_burp_1";
	level.exert_sounds[1][#"burp"][2] = "vox_plr_0_exert_burp_2";
	level.exert_sounds[1][#"burp"][3] = "vox_plr_0_exert_burp_3";
	level.exert_sounds[1][#"burp"][4] = "vox_plr_0_exert_burp_4";
	level.exert_sounds[1][#"burp"][5] = "vox_plr_0_exert_burp_5";
	level.exert_sounds[1][#"burp"][6] = "vox_plr_0_exert_burp_6";
	level.exert_sounds[2][#"burp"][0] = "vox_plr_1_exert_burp_0";
	level.exert_sounds[2][#"burp"][1] = "vox_plr_1_exert_burp_1";
	level.exert_sounds[2][#"burp"][2] = "vox_plr_1_exert_burp_2";
	level.exert_sounds[2][#"burp"][3] = "vox_plr_1_exert_burp_3";
	level.exert_sounds[3][#"burp"][0] = "vox_plr_2_exert_burp_0";
	level.exert_sounds[3][#"burp"][1] = "vox_plr_2_exert_burp_1";
	level.exert_sounds[3][#"burp"][2] = "vox_plr_2_exert_burp_2";
	level.exert_sounds[3][#"burp"][3] = "vox_plr_2_exert_burp_3";
	level.exert_sounds[3][#"burp"][4] = "vox_plr_2_exert_burp_4";
	level.exert_sounds[3][#"burp"][5] = "vox_plr_2_exert_burp_5";
	level.exert_sounds[3][#"burp"][6] = "vox_plr_2_exert_burp_6";
	level.exert_sounds[4][#"burp"][0] = "vox_plr_3_exert_burp_0";
	level.exert_sounds[4][#"burp"][1] = "vox_plr_3_exert_burp_1";
	level.exert_sounds[4][#"burp"][2] = "vox_plr_3_exert_burp_2";
	level.exert_sounds[4][#"burp"][3] = "vox_plr_3_exert_burp_3";
	level.exert_sounds[4][#"burp"][4] = "vox_plr_3_exert_burp_4";
	level.exert_sounds[4][#"burp"][5] = "vox_plr_3_exert_burp_5";
	level.exert_sounds[4][#"burp"][6] = "vox_plr_3_exert_burp_6";
	level.exert_sounds[1][#"hitmed"][0] = "vox_plr_0_exert_pain_medium_0";
	level.exert_sounds[1][#"hitmed"][1] = "vox_plr_0_exert_pain_medium_1";
	level.exert_sounds[1][#"hitmed"][2] = "vox_plr_0_exert_pain_medium_2";
	level.exert_sounds[1][#"hitmed"][3] = "vox_plr_0_exert_pain_medium_3";
	level.exert_sounds[2][#"hitmed"][0] = "vox_plr_1_exert_pain_medium_0";
	level.exert_sounds[2][#"hitmed"][1] = "vox_plr_1_exert_pain_medium_1";
	level.exert_sounds[2][#"hitmed"][2] = "vox_plr_1_exert_pain_medium_2";
	level.exert_sounds[2][#"hitmed"][3] = "vox_plr_1_exert_pain_medium_3";
	level.exert_sounds[3][#"hitmed"][0] = "vox_plr_2_exert_pain_medium_0";
	level.exert_sounds[3][#"hitmed"][1] = "vox_plr_2_exert_pain_medium_1";
	level.exert_sounds[3][#"hitmed"][2] = "vox_plr_2_exert_pain_medium_2";
	level.exert_sounds[3][#"hitmed"][3] = "vox_plr_2_exert_pain_medium_3";
	level.exert_sounds[4][#"hitmed"][0] = "vox_plr_3_exert_pain_medium_0";
	level.exert_sounds[4][#"hitmed"][1] = "vox_plr_3_exert_pain_medium_1";
	level.exert_sounds[4][#"hitmed"][2] = "vox_plr_3_exert_pain_medium_2";
	level.exert_sounds[4][#"hitmed"][3] = "vox_plr_3_exert_pain_medium_3";
	level.exert_sounds[1][#"hitlrg"][0] = "vox_plr_0_exert_pain_high_0";
	level.exert_sounds[1][#"hitlrg"][1] = "vox_plr_0_exert_pain_high_1";
	level.exert_sounds[1][#"hitlrg"][2] = "vox_plr_0_exert_pain_high_2";
	level.exert_sounds[1][#"hitlrg"][3] = "vox_plr_0_exert_pain_high_3";
	level.exert_sounds[2][#"hitlrg"][0] = "vox_plr_1_exert_pain_high_0";
	level.exert_sounds[2][#"hitlrg"][1] = "vox_plr_1_exert_pain_high_1";
	level.exert_sounds[2][#"hitlrg"][2] = "vox_plr_1_exert_pain_high_2";
	level.exert_sounds[2][#"hitlrg"][3] = "vox_plr_1_exert_pain_high_3";
	level.exert_sounds[3][#"hitlrg"][0] = "vox_plr_2_exert_pain_high_0";
	level.exert_sounds[3][#"hitlrg"][1] = "vox_plr_2_exert_pain_high_1";
	level.exert_sounds[3][#"hitlrg"][2] = "vox_plr_2_exert_pain_high_2";
	level.exert_sounds[3][#"hitlrg"][3] = "vox_plr_2_exert_pain_high_3";
	level.exert_sounds[4][#"hitlrg"][0] = "vox_plr_3_exert_pain_high_0";
	level.exert_sounds[4][#"hitlrg"][1] = "vox_plr_3_exert_pain_high_1";
	level.exert_sounds[4][#"hitlrg"][2] = "vox_plr_3_exert_pain_high_2";
	level.exert_sounds[4][#"hitlrg"][3] = "vox_plr_3_exert_pain_high_3";
}

/*
	Name: function_9004475c
	Namespace: zm_characters
	Checksum: 0x223DE5ED
	Offset: 0x1820
	Size: 0xCE
	Parameters: 1
	Flags: Linked
*/
function function_9004475c(character)
{
	var_ba015ed = getplayerroletemplatecount(currentsessionmode());
	for(i = 0; i < var_ba015ed; i++)
	{
		name = function_ac0419ac(i, currentsessionmode());
		if(isinarray(character, name))
		{
			return i;
		}
	}
	/#
		assertmsg("");
	#/
	return 0;
}

/*
	Name: function_d35e4c92
	Namespace: zm_characters
	Checksum: 0x91FDBA69
	Offset: 0x18F8
	Size: 0x12A
	Parameters: 2
	Flags: None
*/
function function_d35e4c92(characterindex, var_fdf0f13d)
{
	if(!isdefined(var_fdf0f13d))
	{
		var_fdf0f13d = 0;
	}
	if(isdefined(characterindex))
	{
		if(var_fdf0f13d || player_role::is_valid(characterindex))
		{
			fields = getplayerrolefields(characterindex, currentsessionmode());
			if(isdefined(fields))
			{
				return fields.var_2a42c5e0;
			}
		}
	}
	else if(isdefined(self) && isplayer(self))
	{
		characterindex = player_role::get();
		if(player_role::is_valid(characterindex))
		{
			fields = getplayerrolefields(player_role::get(), currentsessionmode());
			if(isdefined(fields))
			{
				return fields.var_2a42c5e0;
			}
		}
	}
	return 0;
}

/*
	Name: function_dc232a80
	Namespace: zm_characters
	Checksum: 0x44E076A8
	Offset: 0x1A30
	Size: 0x126
	Parameters: 1
	Flags: Linked
*/
function function_dc232a80(character)
{
	if(isdefined(self) && isplayer(self))
	{
		characterindex = player_role::get();
	}
	else if(isarray(character))
	{
		characterindex = function_9004475c(character);
	}
	if(isdefined(characterindex))
	{
		if(player_role::is_valid(characterindex))
		{
			fields = getplayerrolefields(player_role::get(), currentsessionmode());
			if(isdefined(fields.var_3e570307))
			{
				return fields.var_3e570307;
			}
			return 0;
		}
		/#
			assertmsg("" + characterindex);
		#/
	}
	return 0;
}

/*
	Name: is_character
	Namespace: zm_characters
	Checksum: 0xED50D47F
	Offset: 0x1B60
	Size: 0xE6
	Parameters: 1
	Flags: None
*/
function is_character(character)
{
	/#
		assert(isplayer(self));
	#/
	if(isdefined(self) && isplayer(self))
	{
		characterindex = player_role::get();
		if(player_role::is_valid(characterindex))
		{
			name = function_b14806c6(player_role::get(), currentsessionmode());
			return isinarray(character, name);
		}
	}
	return 0;
}

