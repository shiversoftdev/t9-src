#using script_399c912938783695;
#using script_3f27a7b2232674db;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_characters;

/*
	Name: function_35570ff8
	Namespace: zm_characters
	Checksum: 0x172DDDF5
	Offset: 0x770
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_35570ff8()
{
	level notify(1773937921);
}

/*
	Name: function_89f2df9
	Namespace: zm_characters
	Checksum: 0xE08CC77A
	Offset: 0x790
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_characters", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_characters
	Checksum: 0x49670886
	Offset: 0x7D8
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
	Checksum: 0xFCDB592A
	Offset: 0x860
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
	Checksum: 0x56474FD7
	Offset: 0x900
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
	Offset: 0xA10
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
	Checksum: 0x27C88A1F
	Offset: 0xA20
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
	Checksum: 0x91EF621F
	Offset: 0xA50
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
	Checksum: 0xC8783F8B
	Offset: 0xAA0
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
		rf = function_fb05c532(i, currentsessionmode());
		if(isdefined(rf) && is_true(rf.var_7376c393))
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
	Checksum: 0x735DC5DF
	Offset: 0xCC0
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
	Checksum: 0x633F684E
	Offset: 0xF48
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
	Checksum: 0x3319A7DD
	Offset: 0x1840
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
	Checksum: 0x927232EF
	Offset: 0x1918
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
			fields = function_fb05c532(characterindex, currentsessionmode());
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
			fields = function_fb05c532(player_role::get(), currentsessionmode());
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
	Checksum: 0xE1EC835D
	Offset: 0x1A50
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
			fields = function_fb05c532(player_role::get(), currentsessionmode());
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
	Checksum: 0x9238E7
	Offset: 0x1B80
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

