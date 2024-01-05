#using script_7ca3324ffa5389e4;
#using scripts\core_common\character_customization.csc;
#using scripts\core_common\struct.csc;
#using scripts\mp_common\devgui.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\weapon_customization_icon.csc;
#using script_209c9c119ef6fc06;
#using scripts\core_common\math_shared.csc;
#using script_53cd49b939f89fd7;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\custom_class.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\battlechatter.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using script_474309807eb94f34;
#using scripts\core_common\activecamo_shared.csc;

#namespace frontend;

/*
	Name: function_186473ee
	Namespace: frontend
	Checksum: 0x59730B30
	Offset: 0xB00
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_186473ee()
{
	level notify(-17634552);
}

/*
	Name: function_9bfe9255
	Namespace: frontend
	Checksum: 0x919D6C5B
	Offset: 0xB20
	Size: 0x90
	Parameters: 2
	Flags: None
*/
function function_9bfe9255(var_f75a02ea, mode)
{
	var_a2865de6 = getplayerroletemplatecount(mode);
	for(i = 0; i < var_a2865de6; i++)
	{
		var_eb49090f = function_b14806c6(i, mode);
		if(isdefined(var_eb49090f) && var_eb49090f == var_f75a02ea)
		{
			return i;
		}
	}
}

/*
	Name: function_b9f8bbd9
	Namespace: frontend
	Checksum: 0xECB1BCA7
	Offset: 0xBB8
	Size: 0x7E
	Parameters: 3
	Flags: None
*/
function function_b9f8bbd9(character_index, session_mode, var_3f0e790b)
{
	if(var_3f0e790b == 4)
	{
		return false;
	}
	if(!function_f4bf7e3f(session_mode, var_3f0e790b))
	{
		return false;
	}
	fields = getcharacterfields(session_mode, var_3f0e790b);
	if(!isdefined(fields))
	{
		return false;
	}
	return true;
}

/*
	Name: function_8d1cae0b
	Namespace: frontend
	Checksum: 0x105EF3D9
	Offset: 0xC40
	Size: 0xEA
	Parameters: 3
	Flags: None
*/
function function_8d1cae0b(character_index, session_mode, var_3f0e790b)
{
	if(!function_b9f8bbd9(character_index, session_mode, var_3f0e790b))
	{
		return 0;
	}
	if(session_mode == 3)
	{
		fields = getplayerrolefields(character_index, session_mode);
		return is_true(fields.isdefaultcharacter);
	}
	characterfields = getcharacterfields(character_index, session_mode);
	if(isdefined(characterfields.var_b12a801f) && !getdvarint(characterfields.var_b12a801f, 0))
	{
		return 0;
	}
	return 1;
}

/*
	Name: function_b24ced2b
	Namespace: frontend
	Checksum: 0xDE645060
	Offset: 0xD38
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function function_b24ced2b(xuid)
{
	return ((xuid >> 32) & -1334837248) == -1334837248;
}

/*
	Name: function_e3efec59
	Namespace: frontend
	Checksum: 0x8BE371DA
	Offset: 0xD68
	Size: 0x2D6
	Parameters: 5
	Flags: None
*/
function function_e3efec59(localclientnum, xuid, session_mode, var_3f0e790b, var_6ddefc3d)
{
	if(!isdefined(var_6ddefc3d))
	{
		var_6ddefc3d = 0;
	}
	if(!isdefined(level.var_dd1c817))
	{
		level.var_dd1c817 = [];
	}
	if(!isdefined(level.var_dd1c817[session_mode]))
	{
		level.var_dd1c817[session_mode] = [];
	}
	character_index = undefined;
	if(var_6ddefc3d > 0)
	{
		character_index = var_6ddefc3d;
	}
	else
	{
		character_index = getequippedheroindex(localclientnum, session_mode);
		if(!function_8d1cae0b(character_index, session_mode, var_3f0e790b))
		{
			if(isdefined(level.var_dd1c817[session_mode][xuid]))
			{
				return level.var_dd1c817[session_mode][xuid];
			}
			playerroletemplatecount = getplayerroletemplatecount(session_mode);
			var_53b30724 = [];
			for(i = 0; i < playerroletemplatecount; i++)
			{
				if(function_8d1cae0b(i, session_mode, var_3f0e790b))
				{
					if(session_mode == 1 && function_b24ced2b(xuid))
					{
						rf = getplayerrolefields(i, session_mode);
						if(isdefined(rf) && is_true(rf.var_ae8ab113))
						{
							if(!isdefined(var_53b30724))
							{
								var_53b30724 = [];
							}
							else if(!isarray(var_53b30724))
							{
								var_53b30724 = array(var_53b30724);
							}
							var_53b30724[var_53b30724.size] = i;
						}
						continue;
					}
					if(!isdefined(var_53b30724))
					{
						var_53b30724 = [];
					}
					else if(!isarray(var_53b30724))
					{
						var_53b30724 = array(var_53b30724);
					}
					var_53b30724[var_53b30724.size] = i;
				}
			}
			if(var_53b30724.size > 0)
			{
				character_index = array::random(var_53b30724);
			}
			else
			{
				character_index = 0;
			}
		}
	}
	level.var_dd1c817[session_mode][xuid] = character_index;
	return level.var_dd1c817[session_mode][xuid];
}

/*
	Name: main
	Namespace: frontend
	Checksum: 0xB1D74F5F
	Offset: 0x1048
	Size: 0x30C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level.callbackentityspawned = &entityspawned;
	level.callbacklocalclientconnect = &localclientconnect;
	level.orbis = getdvarstring(#"orbisgame") == "true";
	level.durango = getdvarstring(#"durangogame") == "true";
	level.var_762a4ab = &function_79ac87ac;
	level.var_696537bb = &function_8567daf2;
	level.var_29369e8c = &function_d47a6728;
	level.var_1c6f63ee = &function_c91a9fae;
	level.var_6365df1f = &function_286efebf;
	level.var_633071d0 = 1;
	level.var_d508403d = findvolumedecalindexarray("decals_zm_lobby");
	level.var_8a620c67 = findstaticmodelindexarray("misc_models_zm_lobby");
	level.var_1a55d2dd = findvolumedecalindexarray("decals_mp_lobby");
	level.var_fec4a8fd = findstaticmodelindexarray("misc_models_mp_lobby");
	if(getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2)
	{
		scene::add_scene_func(#"hash_490f177701d6e0f2", &function_527d7706);
		scene::add_scene_func(#"hash_1fab786769273269", &function_527d7706);
		setdvar(#"hash_7b06b8037c26b99b", 200);
	}
	customclass::init();
	level thread blackscreen_watcher();
	setstreamerrequest(1, "core_frontend");
	util::function_21aef83c();
	util::function_5ff170ee();
	function_24ae4ffb();
}

/*
	Name: start
	Namespace: frontend
	Checksum: 0x17251B91
	Offset: 0x1360
	Size: 0x1C
	Parameters: 1
	Flags: Event
*/
event start(eventstruct)
{
	setupclientmenus();
}

/*
	Name: function_e843475e
	Namespace: frontend
	Checksum: 0x7D7D2E4F
	Offset: 0x1388
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_e843475e(menuname)
{
	namespace_d5a9ff55::function_f603fc4d(menuname, #"hash_7e0fa2bd8b44780b", #"hash_64fa56583c3b00bd");
	namespace_d5a9ff55::function_460e6001(menuname, 3, #"hash_7e0fa2bd8b44780b", #"hash_64fa56583c3b00bd");
}

/*
	Name: setupclientmenus
	Namespace: frontend
	Checksum: 0xA7437B69
	Offset: 0x1408
	Size: 0x164C
	Parameters: 0
	Flags: None
*/
function setupclientmenus()
{
	namespace_d5a9ff55::function_6425472c("PressStart");
	namespace_d5a9ff55::function_13b48f53("PressStart", &function_f2fffb6f);
	namespace_d5a9ff55::function_17384292("PressStart", &lobby_main);
	namespace_d5a9ff55::function_866692f8("PressStart", #"hash_7da890f2771b41af", #"scene_frontend_t9_cac", undefined, "idle");
	namespace_d5a9ff55::function_f852c52c("PressStart", #"hash_7da890f2771b41af", 1);
	namespace_d5a9ff55::function_866692f8("PressStart", #"scorestreaks", #"scene_frontend_t9_scorestreak", undefined, "idle");
	namespace_d5a9ff55::function_866692f8("PressStart", #"hash_1fddd14ae4b2b04a", #"scene_frontend_t9_cac_overview", undefined, "overview");
	namespace_d5a9ff55::function_f852c52c("PressStart", #"scorestreaks", 1);
	namespace_d5a9ff55::function_f852c52c("PressStart", #"hash_1fddd14ae4b2b04a", 1);
	namespace_d5a9ff55::function_866692f8("PressStart", #"armory", #"scene_frontend_t9_cac_overview", undefined, "overview");
	namespace_d5a9ff55::function_f852c52c("PressStart", #"armory", 1);
	namespace_d5a9ff55::function_866692f8("PressStart", #"accessories", #"scene_frontend_t9_cac_overview", undefined, "wrist_accessories");
	namespace_d5a9ff55::function_f852c52c("PressStart", #"accessories", 1);
	namespace_d5a9ff55::function_866692f8("PressStart", #"character_room", #"scene_frontend_t9_character_customization_camera", undefined, "select_idle");
	if(getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2)
	{
		str_start_scene = #"hash_1fab786769273269";
	}
	else
	{
		str_start_scene = #"hash_5f96faa5a4f393c7";
	}
	namespace_d5a9ff55::function_866692f8("PressStart", #"room1", str_start_scene, undefined, "start", undefined);
	namespace_d5a9ff55::function_866692f8("PressStart", #"room2", str_start_scene, undefined, "start", undefined);
	namespace_d5a9ff55::function_866692f8("PressStart", #"mode_select", str_start_scene, undefined, "main", undefined);
	namespace_d5a9ff55::function_866692f8("PressStart", #"cp_story", #"scene_frontend_t9_cp_mission_select", undefined, "idle");
	namespace_d5a9ff55::function_866692f8("PressStart", #"cp_evidence", #"scene_frontend_t9_cp_evidence", undefined, "idle");
	namespace_d5a9ff55::function_866692f8("PressStart", #"hash_3262189f972fcd0e", #"scene_frontend_t9_mtx_store", undefined, "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"character_room", #"hash_433990930cddc3f1", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"hash_7da890f2771b41af", #"hash_433990930cddc3f1", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"character_room", #"hash_433990930cddc3f1", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"hash_7da890f2771b41af", #"hash_433990930cddc3f1", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"character_room", #"hash_433990930cddc3f1", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"hash_7da890f2771b41af", #"hash_433990930cddc3f1", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"armory", #"hash_433990930cddc3f1", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"scorestreaks", #"hash_433990930cddc3f1", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"character_room", #"hash_6ffe554be39e00d", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"hash_7da890f2771b41af", #"hash_6ffe554be39e00d", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"character_room", #"hash_6ffe554be39e00d", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"hash_7da890f2771b41af", #"hash_6ffe554be39e00d", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"character_room", #"hash_6ffe554be39e00d", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"hash_7da890f2771b41af", #"hash_6ffe554be39e00d", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"armory", #"hash_6ffe554be39e00d", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"scorestreaks", #"hash_6ffe554be39e00d", "idle");
	namespace_d5a9ff55::function_8950260c("PressStart", #"hash_1fddd14ae4b2b04a", #"hash_6ffe554be39e00d", "idle");
	namespace_d5a9ff55::function_6425472c("Armory", #"scene_frontend_t9_cac_overview", undefined, "overview");
	namespace_d5a9ff55::function_866692f8("Armory", #"gunsmith", #"scene_frontend_t9_gunsmith", undefined, "overview");
	namespace_d5a9ff55::function_f852c52c("Armory", undefined, 1);
	namespace_d5a9ff55::function_969a2881("LobbyInspection", &handle_inspect_player, 0, &start_character_rotating_any, &end_character_rotating_any);
	namespace_d5a9ff55::function_1337c436("LobbyInspection", "inspection_character", 0);
	namespace_d5a9ff55::function_969a2881("SinglePlayerInspection", &handle_inspect_player, 0, &start_character_rotating_any, &end_character_rotating_any);
	namespace_d5a9ff55::function_1337c436("SinglePlayerInspection", "inspection_character", 0);
	namespace_d5a9ff55::function_969a2881("Paintshop", undefined, 0, undefined, undefined);
	namespace_d5a9ff55::function_969a2881("PaintjobWeaponSelect", undefined, 0, undefined, undefined);
	namespace_d5a9ff55::function_969a2881("Gunsmith", undefined);
	namespace_d5a9ff55::function_f852c52c("Gunsmith", undefined, 1);
	namespace_d5a9ff55::function_969a2881("GunsmithAttachmentSelect", undefined);
	namespace_d5a9ff55::function_f852c52c("GunsmithAttachmentSelect", undefined, 1);
	namespace_d5a9ff55::function_6425472c("GunsmithMTXPreview", #"scene_frontend_t9_gunsmith", undefined, "overview");
	namespace_d5a9ff55::function_866692f8("GunsmithMTXPreview", #"stickers_mtx", #"scene_frontend_t9_gunsmith", undefined, "stickers_mtx", undefined);
	namespace_d5a9ff55::function_866692f8("GunsmithMTXPreview", #"charms_mtx", #"scene_frontend_t9_gunsmith", undefined, "charms_mtx", undefined);
	namespace_d5a9ff55::function_f852c52c("GunsmithMTXPreview", undefined, 1);
	namespace_d5a9ff55::function_969a2881("WeaponInspect", undefined, 0);
	namespace_d5a9ff55::function_f852c52c("WeaponInspect", undefined, 1);
	namespace_d5a9ff55::function_969a2881("WristAccessoriesMTXPreview", undefined, 0);
	namespace_d5a9ff55::function_f852c52c("WristAccessoriesMTXPreview", undefined, 1, 0);
	namespace_d5a9ff55::function_6425472c("SupportSelection", #"scene_frontend_t9_scorestreak", undefined, "idle");
	namespace_d5a9ff55::function_6425472c("ZMUpgrades");
	namespace_d5a9ff55::function_6425472c("ZMFactionOverview", #"scene_frontend_t9_cp_evidence", undefined, "idle");
	namespace_d5a9ff55::function_6425472c("ZMIntelInspect", #"scene_frontend_t9_cp_evidence", undefined, "idle");
	namespace_d5a9ff55::function_969a2881("BubblegumBuffSelect", undefined, undefined, undefined, undefined);
	namespace_d5a9ff55::function_969a2881("Pregame_Main", &lobby_main, 1);
	namespace_d5a9ff55::function_969a2881("MPCustomizeClassMenu", undefined, 0, undefined, undefined);
	namespace_d5a9ff55::function_f852c52c("MPCustomizeClassMenu", undefined, 1);
	namespace_d5a9ff55::function_969a2881("ZMCustomizeClassMenu", undefined, 0, undefined, undefined);
	namespace_d5a9ff55::function_f852c52c("ZMCustomizeClassMenu", undefined, 1);
	namespace_d5a9ff55::function_6425472c("WeaponSelectFlyout", #"scene_frontend_t9_cac_overview", undefined, "overview");
	namespace_d5a9ff55::function_f852c52c("WeaponSelectFlyout", undefined, 1);
	namespace_d5a9ff55::function_969a2881("AAR_T8_MP", &function_73b8462a, 1, undefined, &function_48fb04a7);
	namespace_d5a9ff55::function_1337c436("AAR_T8_MP", "aar_character");
	namespace_d5a9ff55::function_969a2881("AAR_T8_ZM", &function_73b8462a, 1, undefined, &function_48fb04a7);
	namespace_d5a9ff55::function_1337c436("AAR_T8_ZM", "aar_character");
	namespace_d5a9ff55::function_969a2881("AAR_T8_WZ", &function_73b8462a, 1, undefined, &function_48fb04a7);
	namespace_d5a9ff55::function_1337c436("AAR_T8_WZ", "aar_character");
	namespace_d5a9ff55::function_969a2881("AAR_T8_ARENA", &function_73b8462a, 1, undefined, &function_48fb04a7);
	namespace_d5a9ff55::function_1337c436("AAR_T8_ARENA", "aar_character");
	namespace_d5a9ff55::function_969a2881("AARMissionRewardOverlay", &function_f8cec907, 1, undefined, &end_character_rotating);
	namespace_d5a9ff55::function_1337c436("AARMissionRewardOverlay", "specialist_customization");
	function_e843475e("EmblemSelect");
	function_e843475e("EmblemChooseIcon");
	function_e843475e("EmblemEditor");
	function_e843475e("Store");
	function_e843475e("Store_DLC");
	function_e843475e("DirectorFindGame");
	namespace_d5a9ff55::function_6425472c("CharacterSelectionMenu", #"scene_frontend_t9_character_customization_camera", undefined, "select_idle");
	namespace_d5a9ff55::function_de0ab("CharacterSelectionMenu", &function_5eb72c78);
	namespace_d5a9ff55::function_6425472c("CharacterSelection_OperatorPreview", #"hash_7c5353cf3c58576", undefined, "inspect_idle");
	namespace_d5a9ff55::function_17384292("CharacterSelection_OperatorPreview", &function_763f40c4);
	namespace_d5a9ff55::function_866692f8("CharacterSelection_OperatorPreview", #"hash_be671ade60002b", #"hash_7c5353cf3c58576", undefined, "inspect_idle");
	namespace_d5a9ff55::function_6425472c("OperatorMissionsOverview", #"hash_7c5353cf3c58576", undefined, "operator_missions");
	namespace_d5a9ff55::function_17384292("OperatorMissionsOverview", &function_763f40c4);
	namespace_d5a9ff55::function_866692f8("OperatorMissionsOverview", #"character", #"hash_7c5353cf3c58576", undefined, "operator_missions", undefined);
	namespace_d5a9ff55::function_6425472c("PersonalizeCharacter", #"scene_frontend_t9_character_customization_camera", undefined, "outfit_idle");
	namespace_d5a9ff55::function_17384292("PersonalizeCharacter", &function_763f40c4);
	namespace_d5a9ff55::function_866692f8("PersonalizeCharacter", #"character", #"scene_frontend_t9_character_customization_camera", undefined, "outfit_idle", undefined);
	namespace_d5a9ff55::function_866692f8("PersonalizeCharacter", #"face", #"scene_frontend_t9_character_customization_camera", undefined, "outfit_idle", undefined);
	namespace_d5a9ff55::function_8950260c("PersonalizeCharacter", #"character", #"face", "outfit_idle");
	namespace_d5a9ff55::function_8950260c("PersonalizeCharacter", #"face", #"character", "outfit_idle");
	namespace_d5a9ff55::function_969a2881("MPSpecialistHUBGestures", &function_9602c423, 1, &start_character_rotating, &end_character_rotating);
	namespace_d5a9ff55::function_1337c436("MPSpecialistHUBGestures", "specialist_customization");
	function_e843475e("MPSpecialistHUBTags");
	namespace_d5a9ff55::function_55d56772({#hash_dcfaf6c7:0.42}, "PressStart", #"scorestreaks", "PressStart", #"hash_7da890f2771b41af");
	namespace_d5a9ff55::function_55d56772({#hash_dcfaf6c7:0.42}, "PressStart", #"accessories", "PressStart", #"hash_7da890f2771b41af");
	namespace_d5a9ff55::function_55d56772({#hash_dcfaf6c7:0.42}, "PressStart", #"accessories", "PressStart", #"hash_1fddd14ae4b2b04a");
	namespace_d5a9ff55::function_55d56772({#hash_dcfaf6c7:0.42}, "PressStart", #"hash_1fddd14ae4b2b04a", "PressStart", #"hash_7da890f2771b41af");
	namespace_d5a9ff55::function_55d56772({#hash_dcfaf6c7:0.42}, "PersonalizeCharacter", undefined, "CharacterSelectionMenu", undefined);
	namespace_d5a9ff55::function_55d56772({#hash_dcfaf6c7:0}, "OperatorMissionsOverview", undefined, "PersonalizeCharacter", undefined);
	namespace_d5a9ff55::function_55d56772({#hash_dcfaf6c7:0}, "CharacterSelection_OperatorPreview", undefined, "PersonalizeCharacter", undefined);
	var_5ef5aa96 = "scene_frontend_arena_team";
	scene::add_scene_func(var_5ef5aa96, &function_fad4ce33, "init");
	scene::add_scene_func(var_5ef5aa96, &function_c5cbf7d6, "stop");
}

/*
	Name: function_527d7706
	Namespace: frontend
	Checksum: 0xB72C67D2
	Offset: 0x2A60
	Size: 0x164
	Parameters: 2
	Flags: None
*/
function function_527d7706(localclientnum, a_ents)
{
	e_probe = getent(localclientnum, "probe_lobby_s2", "targetname");
	if(!isdefined(level.var_1c6b904f))
	{
		level.var_1c6b904f = a_ents[#"s2_lobby_geo_1"];
	}
	if(!isdefined(level.var_9c4a1006))
	{
		level.var_9c4a1006 = a_ents[#"s2_lobby_geo_2"];
	}
	level.var_1c6b904f setdedicatedshadow(0);
	level.var_9c4a1006 setdedicatedshadow(0);
	if(isdefined(e_probe) && isdefined(level.var_1c6b904f) && isdefined(level.var_1c6b904f gettagorigin("fx_fog_022")))
	{
		e_probe unlink();
		e_probe linkto(level.var_1c6b904f, "fx_fog_022");
		/#
			e_probe thread function_ee181cbd();
		#/
	}
}

/*
	Name: function_b8922b79
	Namespace: frontend
	Checksum: 0x1468E7B0
	Offset: 0x2BD0
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function function_b8922b79(localclientnum)
{
}

/*
	Name: function_ee181cbd
	Namespace: frontend
	Checksum: 0x83246AB4
	Offset: 0x2D00
	Size: 0x8E
	Parameters: 0
	Flags: None
*/
function function_ee181cbd()
{
	/#
		self notify("");
		self endon("");
		self endon(#"death");
		while(true)
		{
			if(getdvarint(#"scr_show_shot_info_for_igcs", 0))
			{
				circle(self.origin, 10, (1, 0, 0));
			}
			waitframe(1);
		}
	#/
}

/*
	Name: blackscreen_watcher
	Namespace: frontend
	Checksum: 0x479D1CD
	Offset: 0x2D98
	Size: 0x168
	Parameters: 0
	Flags: None
*/
function blackscreen_watcher()
{
	blackscreenuimodel = getuimodel(function_5f72e972(#"hash_6067a54812de21c5"), "hideWorldForStreamer");
	setuimodelvalue(blackscreenuimodel, 1);
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"streamer_change");
		var_d0b01271 = waitresult.var_d0b01271;
		setuimodelvalue(blackscreenuimodel, 1);
		wait(0.1);
		while(true)
		{
			charready = 1;
			if(isdefined(var_d0b01271))
			{
				charready = [[ var_d0b01271 ]]->is_streamed();
			}
			sceneready = getstreamerrequestprogress(0) >= 100;
			if(charready && sceneready)
			{
				break;
			}
			wait(0.1);
		}
		setuimodelvalue(blackscreenuimodel, 0);
	}
}

/*
	Name: streamer_change
	Namespace: frontend
	Checksum: 0x198DF915
	Offset: 0x2F08
	Size: 0x78
	Parameters: 2
	Flags: None
*/
function streamer_change(hint, var_d0b01271)
{
	if(isdefined(hint))
	{
		setstreamerrequest(0, hint);
	}
	else
	{
		clearstreamerrequest(0);
	}
	level notify(#"streamer_change", {#hash_d0b01271:var_d0b01271});
}

/*
	Name: handle_inspect_player
	Namespace: frontend
	Checksum: 0x9D97C3B6
	Offset: 0x2F88
	Size: 0x128
	Parameters: 2
	Flags: None
*/
function handle_inspect_player(localclientnum, menu_name)
{
	level endon(#"disconnect");
	level endon(menu_name + "_closed");
	level thread scene::play("scene_frontend_inspection_camera", "inspection_full");
	level thread function_b885d47c(menu_name, localclientnum);
	level thread function_37304ace(localclientnum, menu_name);
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"inspect_player");
		/#
			assert(isdefined(waitresult.xuid));
		#/
		level childthread update_inspection_character(localclientnum, waitresult.xuid, menu_name);
	}
}

/*
	Name: function_b885d47c
	Namespace: frontend
	Checksum: 0xE086D0D5
	Offset: 0x30B8
	Size: 0x5C
	Parameters: 2
	Flags: None
*/
function function_b885d47c(menu_name, localclientnum)
{
	level waittill(localclientnum + "_closed");
	level thread scene::stop("scene_frontend_inspection_camera");
	level.var_44011752 hide();
}

/*
	Name: update_inspection_character
	Namespace: frontend
	Checksum: 0x2317F15F
	Offset: 0x3120
	Size: 0x4E0
	Parameters: 4
	Flags: None
*/
function update_inspection_character(localclientnum, xuid, menu_name, var_6ddefc3d)
{
	if(!isdefined(var_6ddefc3d))
	{
		var_6ddefc3d = 0;
	}
	self notify("47c861af90cacc75");
	self endon("47c861af90cacc75");
	var_d0b01271 = namespace_d5a9ff55::function_daadc836(menu_name, localclientnum);
	var_a708693a = isdefined(level.draftcharacters) && level.draftcharacters.size > 0;
	if(var_a708693a)
	{
		foreach(character in level.draftcharacters)
		{
			info = [[ character ]]->function_82e05d64();
			if(isdefined(info) && util::function_48e57e36(xuid) == info.xuid)
			{
				var_23904c1d = [[ character ]]->function_e599283f();
			}
		}
	}
	if(!isdefined(var_23904c1d))
	{
		var_23904c1d = getcharactercustomizationforxuid(localclientnum, util::function_48e57e36(xuid));
	}
	if(!isdefined(var_23904c1d))
	{
		[[ var_d0b01271 ]]->function_1ec9448d(1);
		[[ var_d0b01271 ]]->function_27945cb8(1);
		params = {#anim_name:[[ var_d0b01271 ]]->function_8144231c()};
		[[ var_d0b01271 ]]->update(params);
		for(iterations = 0; !isdefined(var_23904c1d) && iterations < 15; iterations++)
		{
			wait(1);
			var_23904c1d = getcharactercustomizationforxuid(localclientnum, xuid);
		}
		[[ var_d0b01271 ]]->function_1ec9448d(0);
		[[ var_d0b01271 ]]->function_27945cb8(0);
	}
	session_mode = currentsessionmode();
	if(!isdefined(var_23904c1d) || (!var_a708693a && !function_8d1cae0b(var_23904c1d.charactertype, var_23904c1d.charactermode, 4)) || (session_mode != 4 && var_23904c1d.charactermode != session_mode))
	{
		if(session_mode == 4 || session_mode == 2)
		{
			session_mode = 1;
			if(getplayerroletemplatecount(session_mode) == 0)
			{
				session_mode = 3;
			}
			if(getplayerroletemplatecount(session_mode) == 0)
			{
				session_mode = 0;
			}
		}
		character_index = function_e3efec59(localclientnum, xuid, session_mode, 4, var_6ddefc3d);
		if(isdefined(character_index))
		{
			level.var_dd1c817[xuid] = character_index;
			var_23904c1d = character_customization::function_3f5625f1(session_mode, character_index);
			fields = getcharacterfields(character_index, session_mode);
		}
	}
	else
	{
		fields = getcharacterfields(var_23904c1d.charactertype, var_23904c1d.charactermode);
	}
	new_scene_name = undefined;
	if(isdefined(fields))
	{
		new_scene_name = fields.var_2081b2ed;
	}
	if(isdefined(new_scene_name) && character_customization::function_aa5382ed([[ var_d0b01271 ]]->function_e599283f(), var_23904c1d))
	{
		[[ var_d0b01271 ]]->function_1ec9448d(0);
		params = {#scene:new_scene_name, #hash_c76f3e47:1, #hash_401d9a1:1};
		[[ var_d0b01271 ]]->function_15a8906a(var_23904c1d);
		[[ var_d0b01271 ]]->update(params);
	}
}

/*
	Name: function_37304ace
	Namespace: frontend
	Checksum: 0x414CE257
	Offset: 0x3608
	Size: 0x178
	Parameters: 2
	Flags: None
*/
function function_37304ace(localclientnum, menu_name)
{
	level endon(#"disconnect");
	level endon(menu_name + "_closed");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_6d381d5ecca233c6");
		if(is_true(waitresult.clear_weapon))
		{
			level.var_44011752 hide();
			level thread scene::stop(#"scene_frontend_inspection_weapon");
		}
		else
		{
			/#
				assert(isdefined(waitresult.weapon));
			#/
			/#
				assert(isdefined(waitresult.attachments));
			#/
			/#
				assert(isdefined(waitresult.camoindex));
			#/
			/#
				assert(isdefined(waitresult.paintjobslot));
			#/
			level childthread function_daa3f7d0(localclientnum, waitresult, 1);
		}
	}
}

/*
	Name: function_daa3f7d0
	Namespace: frontend
	Checksum: 0xCD489DFF
	Offset: 0x3788
	Size: 0x2D4
	Parameters: 3
	Flags: None
*/
function function_daa3f7d0(localclientnum, weaponinfo, should_update_weapon_options)
{
	newweaponstring = should_update_weapon_options.weapon;
	var_f020955 = should_update_weapon_options.attachments;
	current_weapon = getweapon(newweaponstring, strtok(var_f020955, "+"));
	if(isdefined(current_weapon) && isdefined(level.var_44011752))
	{
		if(level scene::is_playing(#"scene_frontend_inspection_weapon"))
		{
			level.var_44011752 show();
			level thread scene::stop(#"scene_frontend_inspection_weapon");
		}
		wait(0.1);
		s_info = customclass::function_5f70d1c8(current_weapon);
		render_options = function_6eff28b5(weaponinfo, should_update_weapon_options.camoindex, 0, 0);
		blueprint = 0;
		if(isdefined(should_update_weapon_options.blueprint))
		{
			blueprint = should_update_weapon_options.blueprint;
		}
		level.var_44011752 useweaponmodel(current_weapon, undefined, render_options, blueprint);
		level.var_44011752 setscale(s_info.scale);
		level.var_44011752.targetname = "customized_inspection_weapon";
		level.var_44011752 useanimtree("generic");
		position = struct::get(#"hash_551034d0d6c9e1f8");
		origin = position.origin + s_info.offset;
		angles = position.angles + s_info.angles;
		level.var_44011752 thread animation::play(#"hash_3689442490c2e5dd", origin, angles);
		level thread scene::play(#"scene_frontend_inspection_weapon", "inspection_weapon_full");
		level.var_44011752 show();
	}
}

/*
	Name: entityspawned
	Namespace: frontend
	Checksum: 0x123C1CCF
	Offset: 0x3A68
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function entityspawned(localclientnum)
{
}

/*
	Name: function_90646a7f
	Namespace: frontend
	Checksum: 0xEDDDBDB7
	Offset: 0x3A80
	Size: 0x208
	Parameters: 1
	Flags: None
*/
function function_90646a7f(localclientnum)
{
	/#
		while(true)
		{
			var_70eee44 = getdvarint(#"hash_52d9845c30e27ace", 0);
			if(var_70eee44 == 0)
			{
				wait(0.25);
				continue;
			}
			roommodel = getuimodel(function_5f72e972(#"hash_31e97ba41cad1834"), "");
			room = getuimodelvalue(roommodel);
			origin = getcamposbylocalclientnum(localclientnum);
			angles = getcamanglesbylocalclientnum(localclientnum);
			function_b3a6e564(localclientnum, #"hash_3130994c2d7cee8c", (((((int(origin[0]) + "") + int(origin[1]) + "") + int(origin[2]) + "") + int(angles[0]) + "") + int(angles[1]) + "") + int(angles[2]), 1);
			setdvar(#"hash_52d9845c30e27ace", 0);
		}
	#/
}

/*
	Name: function_da10fc8f
	Namespace: frontend
	Checksum: 0x437B3BD4
	Offset: 0x3C90
	Size: 0x182
	Parameters: 2
	Flags: None
*/
function function_da10fc8f(localclientnum, var_da239274)
{
	/#
		var_38b900c2 = getent(localclientnum, "", "");
		var_51a0f339 = getent(localclientnum, "", "");
		var_38b900c2 show();
		var_51a0f339 hide();
		function_45180840(localclientnum);
		do
		{
			waitframe(1);
		}
		while(function_6911e8d(localclientnum));
		var_38b900c2 hide();
		var_51a0f339 show();
		waitframe(1);
		function_c6df7fed(localclientnum);
		do
		{
			waitframe(1);
		}
		while(function_6911e8d(localclientnum));
		function_84469b54(var_da239274);
		var_38b900c2 show();
		var_51a0f339 hide();
		waitframe(1);
	#/
}

/*
	Name: function_93ccf33d
	Namespace: frontend
	Checksum: 0x6CD9DC10
	Offset: 0x3E20
	Size: 0x22E
	Parameters: 4
	Flags: None
*/
function function_93ccf33d(var_62d90151, var_71bac06, &var_37451b86, &var_7f0244ba)
{
	/#
		foreach(i, item in var_62d90151)
		{
			entry = {#item:item, #type:var_71bac06, #index:i};
			if(isdefined(var_37451b86[item.name]))
			{
				if(!isdefined(var_37451b86[item.name].options[var_71bac06]))
				{
					var_37451b86[item.name].options[var_71bac06] = [];
				}
				else if(!isarray(var_37451b86[item.name].options[var_71bac06]))
				{
					var_37451b86[item.name].options[var_71bac06] = array(var_37451b86[item.name].options[var_71bac06]);
				}
				var_37451b86[item.name].options[var_71bac06][var_37451b86[item.name].options[var_71bac06].size] = entry;
				continue;
			}
			if(i != 0)
			{
				if(!isdefined(var_7f0244ba))
				{
					var_7f0244ba = [];
				}
				else if(!isarray(var_7f0244ba))
				{
					var_7f0244ba = array(var_7f0244ba);
				}
				var_7f0244ba[var_7f0244ba.size] = entry;
			}
		}
	#/
}

/*
	Name: function_23bc6f08
	Namespace: frontend
	Checksum: 0xBABD32DB
	Offset: 0x4058
	Size: 0x31C
	Parameters: 7
	Flags: None
*/
function function_23bc6f08(localclientnum, var_d0b01271, itemtype, item_data, mode, character_index, var_b34f01f0)
{
	/#
		if(item_data.lootid == #"")
		{
			return;
		}
		switch(itemtype)
		{
			case 1:
			{
				return;
			}
			case 2:
			{
				shot_name = "";
				break;
			}
			case 3:
			{
				shot_name = "";
				break;
			}
			case 7:
			{
				shot_name = "";
				break;
			}
			case 6:
			{
				shot_name = "";
				break;
			}
			case 0:
			{
				shot_name = "";
				break;
			}
			case 4:
			{
				shot_name = "";
				break;
			}
			default:
			{
				shot_name = "";
				break;
			}
		}
		scene_name = #"scene_frontend_character_male_render";
		if(#"female" == getherogender(character_index, mode))
		{
			scene_name = #"scene_frontend_character_female_render";
		}
		[[ var_d0b01271 ]]->update({#scene_shot:shot_name, #scene:scene_name, #hash_13fb1841:8, #hash_5bd51249:8, #hash_c76f3e47:1});
		do
		{
			wait(0.5);
		}
		while(!([[ var_d0b01271 ]]->function_ea4ac9f8()));
		var_f75a02ea = function_9e72a96(function_b14806c6(character_index, mode));
		if(var_b34f01f0)
		{
			shot_name = (("" + var_f75a02ea) + "") + function_9e72a96(item_data.lootid) + "";
		}
		else
		{
			shot_name = (("" + var_f75a02ea) + "") + function_9e72a96(item_data.lootid) + "";
		}
		function_da10fc8f(localclientnum, shot_name);
	#/
}

/*
	Name: function_2351cba1
	Namespace: frontend
	Checksum: 0xFC77417
	Offset: 0x4380
	Size: 0xAE
	Parameters: 2
	Flags: None
*/
function function_2351cba1(itemtype, mode)
{
	/#
		switch(itemtype)
		{
			case 1:
			{
				return 0;
			}
			case 0:
			case 2:
			case 3:
			case 4:
			case 5:
			case 6:
			{
				return mode != 1;
			}
		}
		return 1;
	#/
}

/*
	Name: function_4920c25a
	Namespace: frontend
	Checksum: 0x851FC8B2
	Offset: 0x4438
	Size: 0x89C
	Parameters: 3
	Flags: None
*/
function function_4920c25a(localclientnum, menu_name, state)
{
	/#
		self notify("");
		self endon("");
		function_25485718();
		var_38b900c2 = getent(localclientnum, "", "");
		var_51a0f339 = getent(localclientnum, "", "");
		var_38b900c2 show();
		var_51a0f339 hide();
		args = strtok(state, "");
		mode = int(args[0]);
		character_index = int(args[1]);
		outfit_index = int(args[2]);
		var_7823b8b1 = int(args[3]);
		var_d0b01271 = namespace_d5a9ff55::function_daadc836(menu_name, localclientnum);
		[[ var_d0b01271 ]]->set_character_mode(mode);
		[[ var_d0b01271 ]]->set_character_index(character_index);
		[[ var_d0b01271 ]]->function_22039feb();
		var_13240050 = function_d299ef16(character_index, mode);
		var_f750af1d = (outfit_index == -1 ? 0 : outfit_index);
		var_f58d84ac = (outfit_index == -1 ? var_13240050 - 1 : outfit_index);
		for(outfitindex = var_f750af1d; outfitindex <= var_f58d84ac; outfitindex++)
		{
			var_9cf37283 = function_d7c3cf6c(character_index, outfitindex, mode);
			[[ var_d0b01271 ]]->set_character_outfit(outfitindex);
			[[ var_d0b01271 ]]->function_158505aa(outfitindex);
			if(mode == 1 && (var_7823b8b1 == -1 || var_7823b8b1 == 8))
			{
				foreach(preset in var_9cf37283.presets)
				{
					if(preset.isvalid && preset.lootid != #"")
					{
						[[ var_d0b01271 ]]->function_95779b72();
						foreach(option in preset.parts)
						{
							[[ var_d0b01271 ]]->set_character_outfit_item(option, type);
						}
						function_23bc6f08(localclientnum, var_d0b01271, 8, preset, mode, character_index, 0);
						foreach(var_bd469c67 in var_9cf37283.options[7])
						{
							if(var_bd469c67.name == preset.name)
							{
								[[ var_d0b01271 ]]->set_character_outfit_item(option, 7);
								break;
							}
						}
						foreach(var_bd469c67 in var_9cf37283.options[1])
						{
							if(var_bd469c67.name == preset.name)
							{
								[[ var_d0b01271 ]]->set_character_outfit_item(option, 7);
								break;
							}
						}
						function_23bc6f08(localclientnum, var_d0b01271, 8, preset, mode, character_index, 1);
					}
				}
			}
			foreach(type, options in var_9cf37283.options)
			{
				if(function_2351cba1(type, mode) && (var_7823b8b1 == -1 || var_7823b8b1 == type))
				{
					[[ var_d0b01271 ]]->set_character_outfit(outfitindex);
					[[ var_d0b01271 ]]->function_158505aa(outfitindex);
					foreach(option in options)
					{
						[[ var_d0b01271 ]]->function_95779b72();
						[[ var_d0b01271 ]]->set_character_outfit_item(i, type);
						if(type == 7 && mode == 1)
						{
							var_47e7e198 = undefined;
							foreach(j, palette in var_9cf37283.options[5])
							{
								if(palette.name == option.name)
								{
									var_47e7e198 = j;
									break;
								}
							}
							if(isdefined(var_47e7e198))
							{
								[[ var_d0b01271 ]]->set_character_outfit(outfitindex);
								[[ var_d0b01271 ]]->set_character_outfit_item(var_47e7e198, 5);
							}
							else
							{
								[[ var_d0b01271 ]]->set_character_outfit(0);
							}
						}
						function_23bc6f08(localclientnum, var_d0b01271, type, option, mode, character_index, 0);
					}
				}
			}
		}
		[[ var_d0b01271 ]]->function_39a68bf2();
		level notify("" + localclientnum, {#status:"", #menu:""});
		setdvar(#"hash_36ae76934a09e0ea", "");
		function_59013397();
	#/
}

/*
	Name: function_92087f1b
	Namespace: frontend
	Checksum: 0x6BAD49E6
	Offset: 0x4CE0
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function function_92087f1b(localclientnum)
{
	/#
		if(getdvarint(#"hash_af3e02adb15e8ec", 0) > 0)
		{
			level thread function_fb399a61(localclientnum);
			return;
		}
		util::add_devgui(localclientnum, "" + "", "");
		level thread function_622b5dc0(localclientnum);
	#/
}

/*
	Name: function_622b5dc0
	Namespace: frontend
	Checksum: 0x4DDB3CC0
	Offset: 0x4D88
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_622b5dc0(localclientnum)
{
	/#
		level endon(#"game_ended");
		while(true)
		{
			if(getdvarint(#"hash_af3e02adb15e8ec", 0) > 0)
			{
				util::remove_devgui(localclientnum, "" + "");
				level thread function_fb399a61(localclientnum);
				return;
			}
			wait(1);
		}
	#/
}

/*
	Name: function_fb399a61
	Namespace: frontend
	Checksum: 0x6EC00065
	Offset: 0x4E38
	Size: 0x72A
	Parameters: 1
	Flags: None
*/
function function_fb399a61(localclientnum)
{
	/#
		namespace_d5a9ff55::function_969a2881("", &function_4920c25a, 1, undefined, undefined, 0);
		namespace_d5a9ff55::function_1337c436("", "");
		target = struct::get(#"hash_4d207c140767b515");
		/#
			assert(isdefined(target));
		#/
		var_663588d = "";
		var_f4b452be = [0:"", 3:"", 1:""];
		var_8d6e963c = [7:"", 6:"", 5:"", 4:"", 3:"", 2:"", 0:""];
		foreach(mode, display_name in var_f4b452be)
		{
			var_82414930 = (var_663588d + display_name) + "";
			for(index = 0; index < getplayerroletemplatecount(mode); index++)
			{
				var_f75a02ea = function_9e72a96(function_b14806c6(index, mode));
				var_11f96a92 = (var_82414930 + var_f75a02ea) + "";
				adddebugcommand(localclientnum, (((((((((((((("" + var_11f96a92) + "") + "") + "") + "") + "") + mode) + "") + index) + "") + -1) + "") + -1) + "") + "");
				var_13240050 = function_d299ef16(index, mode);
				for(outfitindex = 0; outfitindex < var_13240050; outfitindex++)
				{
					var_9cf37283 = function_d7c3cf6c(index, outfitindex, mode);
					if(var_9cf37283.valid)
					{
						var_98cd234a = strtok(function_9e72a96(var_9cf37283.namehash), "");
						var_98cd234a = var_98cd234a[var_98cd234a.size - 1];
						var_b614b3ba = (var_11f96a92 + var_98cd234a) + "";
						adddebugcommand(localclientnum, (((((((((((((("" + var_b614b3ba) + "") + "") + "") + "") + "") + mode) + "") + index) + "") + outfitindex) + "") + -1) + "") + "");
						if(mode == 1)
						{
							adddebugcommand(localclientnum, (((((((((((((("" + var_b614b3ba) + "") + "") + "") + "") + "") + mode) + "") + index) + "") + outfitindex) + "") + 8) + "") + "");
						}
						foreach(type, name in var_8d6e963c)
						{
							if(function_2351cba1(type, mode))
							{
								adddebugcommand(localclientnum, (((((((((((((("" + var_b614b3ba) + name) + "") + "") + "") + "") + mode) + "") + index) + "") + outfitindex) + "") + type) + "") + "");
							}
						}
						waitframe(1);
					}
				}
			}
		}
		setdvar(#"hash_36ae76934a09e0ea", "");
		var_f7a528f2 = "";
		while(true)
		{
			wait(0.1);
			if(getdvarstring(#"hash_36ae76934a09e0ea", var_f7a528f2) != var_f7a528f2)
			{
				var_f7a528f2 = getdvarstring(#"hash_36ae76934a09e0ea");
				if(var_f7a528f2 != "")
				{
					level notify("" + localclientnum, {#state:var_f7a528f2, #status:"", #menu:""});
				}
			}
		}
	#/
}

/*
	Name: function_5d6480a0
	Namespace: frontend
	Checksum: 0x7C0BC2B5
	Offset: 0x5570
	Size: 0x384
	Parameters: 6
	Flags: None
*/
function function_5d6480a0(localclientnum, weapon, weapon_model, weapon_name, var_2d8a24a3, var_f879230e)
{
	/#
		if(ishash(var_2d8a24a3.name))
		{
			camo_index = (var_2d8a24a3.item_index == 0 ? 0 : function_8b51d9d1(var_2d8a24a3.name));
			var_9ce34e01 = function_9e72a96(var_2d8a24a3.name);
		}
		else
		{
			camo_index = (var_2d8a24a3.item_index == 0 ? 0 : function_8b51d9d1(hash(var_2d8a24a3.name)));
			var_9ce34e01 = var_2d8a24a3.name;
		}
		if(isdefined(camo_index))
		{
			activecamoinfo = activecamo::function_13e12ab1(camo_index);
			if(isdefined(activecamoinfo) && activecamoinfo.stages.size > 1)
			{
				var_3594168e = activecamoinfo.stages[2];
				if(!is_true(var_3594168e.disabled))
				{
					camo_index = function_8b51d9d1(var_3594168e.var_879c8798);
					var_9ce34e01 = function_9e72a96(var_3594168e.var_879c8798);
				}
				else
				{
					var_3594168e = undefined;
				}
			}
			if(isdefined(level.var_43aac701[localclientnum]))
			{
				weapon_model stoprenderoverridebundle(level.var_43aac701[localclientnum]);
				level.var_43aac701[localclientnum] = undefined;
			}
			render_options = function_6eff28b5(localclientnum, camo_index, 0, 0);
			weapon_model useweaponmodel(weapon, undefined, render_options, var_f879230e);
			if(isdefined(var_3594168e))
			{
				activecamo::function_6c9e0e1a(localclientnum, weapon_model, var_3594168e, level.var_43aac701);
			}
			iteration = 0;
			max_iterations = getdvarint(#"hash_16a421138c7e03f8", -1);
			do
			{
				wait(0.5);
				iteration++;
			}
			while(!weapon_model isstreamed(8, 1) || !weapon_model function_e56f5549(1) && (max_iterations == -1 || iteration < max_iterations));
			wait(0.1);
			function_da10fc8f(localclientnum, ((((("" + weapon_name) + "") + weapon_name) + "") + var_9ce34e01) + "");
		}
	#/
}

/*
	Name: function_f2c538de
	Namespace: frontend
	Checksum: 0x2F9CD6A8
	Offset: 0x5900
	Size: 0x644
	Parameters: 3
	Flags: None
*/
function function_f2c538de(localclientnum, menu_name, state)
{
	/#
		self notify("");
		self endon("");
		args = strtok(state, "");
		weapon_name = args[0];
		camo = int(args[1]);
		var_c58c03de = int(args[2]);
		filter = args[3];
		type = args[4];
		function_25485718();
		var_38b900c2 = getent(menu_name, "", "");
		var_51a0f339 = getent(menu_name, "", "");
		var_38b900c2 show();
		var_51a0f339 hide();
		weapon = getweapon(weapon_name);
		target = struct::get(#"weapon_icon_staging");
		weapon_model = spawn(menu_name, target.origin, "");
		weapon_model.targetname = "";
		weapon_model.angles = target.angles;
		weapon_model sethighdetail();
		weapon_model useweaponmodel(weapon);
		s_info = customclass::function_3bff05ba(weapon, #"primary");
		weapon_model setscale(s_info.scale);
		if(type === "")
		{
			shot = function_e2703c27(weapon);
			if(!scene::function_9730988a(#"scene_frontend_weapon_camo_render", shot))
			{
				shot = undefined;
			}
		}
		if(!isdefined(shot))
		{
			shot = "";
		}
		level thread scene::play(#"scene_frontend_weapon_camo_render", shot);
		if(camo != -2)
		{
			options = function_ea647602("");
			if(camo == -1)
			{
				start_index = 0;
				end_index = options.size - 1;
			}
			else
			{
				start_index = camo;
				end_index = camo;
			}
			for(i = start_index; i <= end_index; i++)
			{
				var_2d8a24a3 = options[i];
				if(filter != "")
				{
					category = function_57411076(function_9e72a96(var_2d8a24a3.name));
					if(filter == "")
					{
						if(category != "" && category != "" && category != "")
						{
							continue;
						}
					}
					else if(category != filter)
					{
						continue;
					}
				}
				function_5d6480a0(menu_name, weapon, weapon_model, weapon_name, var_2d8a24a3, 0);
			}
		}
		if(var_c58c03de != -2)
		{
			if(var_c58c03de == -1)
			{
				start_index = 0;
				end_index = weapon.var_2a2adea3;
			}
			else
			{
				start_index = var_c58c03de;
				end_index = var_c58c03de + 1;
			}
			for(i = start_index; i < end_index; i++)
			{
				var_d68c33d0 = function_f62a996b(weapon_name, i + 1);
				function_5d6480a0(menu_name, var_d68c33d0.weapon, weapon_model, weapon_name, {#name:"" + i, #item_index:0}, var_d68c33d0.var_fd90b0bb);
			}
		}
		level thread scene::stop(#"scene_frontend_weapon_camo_render");
		level notify("" + menu_name, {#status:"", #menu:""});
		weapon_model delete();
		setdvar(#"hash_7c6efad1ad1659ad", "");
		function_59013397();
	#/
}

/*
	Name: function_d583ca36
	Namespace: frontend
	Checksum: 0x8D94726A
	Offset: 0x5F50
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_d583ca36(weapon)
{
	/#
		return weapon.inventorytype == "";
	#/
}

/*
	Name: function_db3c4c69
	Namespace: frontend
	Checksum: 0x87089B7F
	Offset: 0x5F80
	Size: 0x99A
	Parameters: 1
	Flags: None
*/
function function_db3c4c69(localclientnum)
{
	/#
		namespace_d5a9ff55::function_969a2881("", &function_f2c538de, 1, undefined, undefined, 0);
		target = struct::get(#"weapon_icon_staging");
		/#
			assert(isdefined(target));
		#/
		level.var_43aac701 = [];
		var_663588d = "";
		root_weapon = var_663588d + "";
		a_weapons = enumerateweapons("");
		if(!isdefined(a_weapons))
		{
			a_weapons = [];
		}
		a_weapons = array::filter(a_weapons, 1, &function_d583ca36);
		foreach(weapon in a_weapons)
		{
			name = function_a16a090d(weapon);
			var_ee63b362 = (root_weapon + "") + name;
			adddebugcommand(localclientnum, ((((("" + var_ee63b362) + "") + "") + "") + name) + "");
		}
		setdvar(#"hash_1311d7636a782655", "");
		setdvar(#"hash_7c6efad1ad1659ad", "");
		var_c11ba901 = [6:"", 5:"", 4:"", 3:"", 2:"", 1:"", 0:""];
		var_ae05dc1b = [1:"", 0:""];
		weapon_name = "";
		var_f7a528f2 = "";
		while(true)
		{
			wait(0.1);
			if(getdvarstring(#"hash_1311d7636a782655", weapon_name) != weapon_name)
			{
				weapon_name = getdvarstring(#"hash_1311d7636a782655");
				if(weapon_name != "")
				{
					foreach(weapon in a_weapons)
					{
						name = function_a16a090d(weapon);
						if(name != weapon_name)
						{
							continue;
						}
						var_c001baa1 = (var_663588d + "") + name;
						adddebugcommand(localclientnum, (((((((((((("" + var_c001baa1) + "") + "") + "") + "") + name) + "") + -1) + "") + -1) + "") + "") + "");
						for(i = 0; i < var_c11ba901.size; i++)
						{
							type = var_c11ba901[i];
							adddebugcommand(localclientnum, (((((((((((((("" + var_c001baa1) + "") + type) + "") + (2 + i) + "") + "") + "") + name) + "") + -1) + "") + -1) + "") + type) + "");
						}
						options = function_ea647602("");
						foreach(i, option in options)
						{
							adddebugcommand(localclientnum, (((((((((((("" + var_c001baa1) + "") + function_9e72a96(option.name) + "") + "") + "") + name) + "") + i) + "") + -2) + "") + "") + "");
						}
						for(i = 0; i < weapon.var_2a2adea3; i++)
						{
							foreach(type in var_ae05dc1b)
							{
								adddebugcommand(localclientnum, ((((((((((((((((("" + var_c001baa1) + "") + i) + "") + type) + "") + "") + "") + name) + "") + -2) + "") + i) + "") + "") + "") + type) + "");
							}
						}
						foreach(type in var_ae05dc1b)
						{
							adddebugcommand(localclientnum, ((((((((((((((("" + var_c001baa1) + "") + type) + "") + "") + "") + name) + "") + -2) + "") + -1) + "") + "") + "") + type) + "");
						}
					}
				}
			}
			if(getdvarstring(#"hash_7c6efad1ad1659ad", var_f7a528f2) != var_f7a528f2)
			{
				var_f7a528f2 = getdvarstring(#"hash_7c6efad1ad1659ad");
				if(var_f7a528f2 != "")
				{
					level notify("" + localclientnum, {#state:var_f7a528f2, #status:"", #menu:""});
				}
			}
		}
	#/
}

/*
	Name: function_3d29f330
	Namespace: frontend
	Checksum: 0x33366DF4
	Offset: 0x6928
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_3d29f330(localclientnum)
{
	/#
		util::add_devgui(localclientnum, "" + "", "");
		while(getdvarint(#"hash_2a806885aa30e65b", 0) == 0)
		{
			wait(1);
		}
		util::remove_devgui(localclientnum, "" + "");
		function_ea9a5e69(localclientnum);
	#/
}

/*
	Name: function_671eb8fa
	Namespace: frontend
	Checksum: 0x1F3F3795
	Offset: 0x69F0
	Size: 0x18
	Parameters: 0
	Flags: None
*/
function function_671eb8fa()
{
	/#
		return [1:""];
	#/
}

/*
	Name: function_ea9a5e69
	Namespace: frontend
	Checksum: 0xF9E03629
	Offset: 0x6A18
	Size: 0x522
	Parameters: 1
	Flags: None
*/
function function_ea9a5e69(localclientnum)
{
	/#
		namespace_d5a9ff55::function_969a2881("", &function_4cd43ca2, 1, undefined, undefined, 0);
		var_2067e07 = function_671eb8fa();
		adddebugcommand(localclientnum, ((((((("" + "") + "") + "") + "") + -1) + "") + -1) + "");
		foreach(type, name in var_2067e07)
		{
			adddebugcommand(localclientnum, (((((((("" + "") + name) + "") + "") + "") + -1) + "") + type) + "");
		}
		/#
			assert(isdefined(getent(localclientnum, "", "")));
		#/
		/#
			assert(isdefined(struct::get(#"hash_4759fde09aee8d9f")));
		#/
		/#
			assert(isdefined(struct::get(#"hash_3cf76492cd93048a")));
		#/
		var_f51354c7 = namespace_eb06e24d::function_d0ac8d8();
		foreach(i, jumpkit in var_f51354c7)
		{
			name = function_9e72a96(jumpkit);
			var_c23e6a40 = ("" + name) + "";
			adddebugcommand(localclientnum, (((((((("" + var_c23e6a40) + "") + "") + "") + "") + i) + "") + -1) + "");
			foreach(type, name in var_2067e07)
			{
				adddebugcommand(localclientnum, (((((((("" + var_c23e6a40) + name) + "") + "") + "") + i) + "") + type) + "");
			}
			waitframe(1);
		}
		setdvar(#"hash_4243dd01393aa940", "");
		var_f7a528f2 = "";
		while(true)
		{
			wait(0.1);
			if(getdvarstring(#"hash_4243dd01393aa940", var_f7a528f2) != var_f7a528f2)
			{
				var_f7a528f2 = getdvarstring(#"hash_4243dd01393aa940");
				if(var_f7a528f2 != "")
				{
					level notify("" + localclientnum, {#state:var_f7a528f2, #status:"", #menu:""});
				}
			}
		}
	#/
}

/*
	Name: function_4cd43ca2
	Namespace: frontend
	Checksum: 0xF9394B3F
	Offset: 0x6F48
	Size: 0x64C
	Parameters: 3
	Flags: None
*/
function function_4cd43ca2(localclientnum, menu_name, state)
{
	/#
		self notify("");
		self endon("");
		args = strtok(state, "");
		jumpkit = int(args[0]);
		type = int(args[1]);
		function_25485718();
		var_38b900c2 = getent(menu_name, "", "");
		var_51a0f339 = getent(menu_name, "", "");
		var_38b900c2 show();
		var_51a0f339 hide();
		if(jumpkit == -1)
		{
			var_d4e4e3a8 = 0;
			var_dcb0ef67 = namespace_eb06e24d::function_3045dd71() - 1;
		}
		else
		{
			var_d4e4e3a8 = jumpkit;
			var_dcb0ef67 = jumpkit;
		}
		types = function_671eb8fa();
		if(type != -1)
		{
			type_data = types[type];
			types = [];
			types[type] = type_data;
		}
		var_351da865 = getent(menu_name, "", "");
		fx_start = struct::get(#"hash_4759fde09aee8d9f");
		var_b92b3cf9 = struct::get(#"hash_3cf76492cd93048a");
		foreach(type, type_name in types)
		{
			switch(type)
			{
				case 1:
				{
					level thread scene::play(#"scene_frontend_fxtrail_render");
					break;
				}
				default:
				{
					continue;
				}
			}
			for(i = var_d4e4e3a8; i <= var_dcb0ef67; i++)
			{
				var_4132246d = namespace_eb06e24d::function_d0ac8d8()[i];
				switch(type)
				{
					case 1:
					{
						trail = namespace_eb06e24d::function_6452f9c5(i);
						if(!isdefined(trail) || !isdefined(trail.body_trail))
						{
							continue;
						}
						var_351da865.origin = fx_start.origin;
						handle = util::playfxontag(menu_name, trail.body_trail, var_351da865, "");
						if(!isdefined(handle))
						{
							continue;
						}
						direction = var_b92b3cf9.origin - fx_start.origin;
						step_size = direction / getdvarint(#"hash_522e5987825dd16e", 100);
						for(var_d7f46807 = 0; var_d7f46807 <= getdvarint(#"hash_522e5987825dd16e", 100); var_d7f46807++)
						{
							waitframe(1);
							var_351da865.origin = var_351da865.origin + step_size;
						}
						function_da10fc8f(menu_name, (("" + function_9e72a96(var_4132246d)) + "") + function_9e72a96(trail.name) + "");
						killfx(menu_name, handle);
						break;
					}
					default:
					{
						continue;
					}
				}
				waitframe(1);
			}
			switch(type)
			{
				case 1:
				{
					level thread scene::stop(#"scene_frontend_fxtrail_render");
				}
				default:
				{
					break;
				}
			}
		}
		level notify("" + menu_name, {#status:"", #menu:""});
		setdvar(#"hash_4243dd01393aa940", "");
		function_59013397();
	#/
}

/*
	Name: function_6677a717
	Namespace: frontend
	Checksum: 0xE1E8C64F
	Offset: 0x75A0
	Size: 0x5A
	Parameters: 2
	Flags: None
*/
function function_6677a717(a, b)
{
	return a.weapon !== b.weapon || a.var_57fe74e5 !== b.var_57fe74e5 || a.var_fd90b0bb !== b.var_fd90b0bb;
}

/*
	Name: function_8d53d5b6
	Namespace: frontend
	Checksum: 0x27782627
	Offset: 0x7608
	Size: 0x1CC
	Parameters: 3
	Flags: None
*/
function function_8d53d5b6(localclientnum, var_302876c9, xuid)
{
	/#
		var_cd31cd6a = getdvarstring(#"hash_575aeb603638c901", "");
		if(var_cd31cd6a != "")
		{
			return {#weapon:getweapon(var_cd31cd6a)};
		}
	#/
	/#
		if(getdvarint(#"hash_181f432c0c22483d", 0))
		{
			var_302876c9 = 0;
		}
	#/
	if(var_302876c9 === 0)
	{
		var_bba3d6af = function_a699aed5(localclientnum);
	}
	else
	{
		if(!isdefined(xuid))
		{
			character = level.var_6f1da91a[function_f701ad2a()][var_302876c9].character;
			if(isdefined(character))
			{
				xuid = [[ character ]]->function_25725c05();
			}
		}
		if(isdefined(xuid))
		{
			var_bba3d6af = function_a1c1426a(localclientnum, xuid);
		}
	}
	if(isdefined(var_bba3d6af.weapon) && var_bba3d6af.weapon !== level.weaponnone)
	{
		return var_bba3d6af;
	}
	return {#weapon:getweapon(#"ar_accurate_t9")};
}

/*
	Name: function_8567daf2
	Namespace: frontend
	Checksum: 0x688501C3
	Offset: 0x77E0
	Size: 0x46
	Parameters: 3
	Flags: None
*/
function function_8567daf2(localclientnum, var_302876c9, xuid)
{
	weapon_data = function_8d53d5b6(localclientnum, var_302876c9, xuid);
	return weapon_data.weapon;
}

/*
	Name: function_1fa47915
	Namespace: frontend
	Checksum: 0x23E6684E
	Offset: 0x7830
	Size: 0x46
	Parameters: 3
	Flags: None
*/
function function_1fa47915(localclientnum, var_302876c9, xuid)
{
	weapon_data = function_8d53d5b6(localclientnum, var_302876c9, xuid);
	return weapon_data.var_57fe74e5;
}

/*
	Name: function_41f5d26d
	Namespace: frontend
	Checksum: 0x17A16F55
	Offset: 0x7880
	Size: 0x46
	Parameters: 3
	Flags: None
*/
function function_41f5d26d(localclientnum, var_302876c9, xuid)
{
	weapon_data = function_8d53d5b6(localclientnum, var_302876c9, xuid);
	return weapon_data.var_fd90b0bb;
}

/*
	Name: function_d47a6728
	Namespace: frontend
	Checksum: 0xAF0541B4
	Offset: 0x78D0
	Size: 0x112
	Parameters: 2
	Flags: None
*/
function function_d47a6728(localclientnum, var_302876c9)
{
	if(!isdefined(var_302876c9) || var_302876c9 == 0)
	{
		character = level.var_1c43dd3e;
	}
	else
	{
		character = level.var_6f1da91a[function_f701ad2a()][var_302876c9].character;
	}
	if(!isdefined(character) || !isclass(character))
	{
		return (randomint(2) > 0 ? "female" : "male");
	}
	n_character_index = [[ character ]]->function_9004475c();
	str_gender = getherogender(n_character_index, 1);
	return str_gender;
}

/*
	Name: function_c91a9fae
	Namespace: frontend
	Checksum: 0x7852208C
	Offset: 0x79F0
	Size: 0x4E
	Parameters: 2
	Flags: None
*/
function function_c91a9fae(localclientnum, var_302876c9)
{
	character = level.var_6f1da91a[function_f701ad2a()][var_302876c9].character;
	return character;
}

/*
	Name: function_65d7f2a7
	Namespace: frontend
	Checksum: 0xBB8DC3AC
	Offset: 0x7A48
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function function_65d7f2a7(localclientnum)
{
	target_name = "player_start";
	var_50896672 = getent(localclientnum, target_name, "targetname");
	if(!isdefined(var_50896672))
	{
		var_50896672 = util::spawn_model(localclientnum, "tag_origin");
		var_50896672.targetname = target_name;
	}
	var_50896672 useanimtree("all_player");
	level.var_1c43dd3e = character_customization::function_dd295310(var_50896672, localclientnum, 0);
	function_aba0885b(localclientnum);
}

/*
	Name: function_becded4f
	Namespace: frontend
	Checksum: 0x783B951D
	Offset: 0x7B20
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_becded4f(localclientnum)
{
	level.var_44011752 = util::spawn_model(localclientnum, #"wpn_t8_ar_accurate_prop_animate", (0, 0, 0), (0, 0, 0));
	level.var_44011752.targetname = "customized_inspection_weapon";
	level.var_44011752 hide();
}

/*
	Name: function_a588eb2e
	Namespace: frontend
	Checksum: 0x1E99F6D3
	Offset: 0x7B98
	Size: 0x90
	Parameters: 1
	Flags: None
*/
function function_a588eb2e(localclientnum)
{
	var_e6977977 = util::spawn_model(localclientnum, #"wpn_t8_ar_accurate_prop_animate", (0, 0, 0), (0, 0, 0));
	var_e6977977.targetname = "quartermaster_weapon";
	var_e6977977 hide();
	var_e6977977 sethighdetail(1, 1);
	level.var_324c3190 = [];
}

/*
	Name: localclientconnect
	Namespace: frontend
	Checksum: 0x2DF8C2A4
	Offset: 0x7C30
	Size: 0x3BC
	Parameters: 1
	Flags: None
*/
function localclientconnect(localclientnum)
{
	/#
		println("" + localclientnum);
	#/
	setexposureinstantsnap(localclientnum, 1);
	var_acd4d941 = util::spawn_model(localclientnum, "tag_origin", (0, 0, 0), (0, 0, 0));
	var_acd4d941.targetname = "__masked_char";
	var_22f20461 = character_customization::function_dd295310(var_acd4d941, localclientnum, 0);
	[[ var_22f20461 ]]->function_1ec9448d(1);
	[[ var_22f20461 ]]->update();
	function_becded4f(localclientnum);
	function_a588eb2e(localclientnum);
	function_65d7f2a7(localclientnum);
	level thread function_f00ff0c7(localclientnum);
	level thread function_45827126();
	if(isdefined(level.charactercustomizationsetup))
	{
		[[level.charactercustomizationsetup]](localclientnum);
	}
	if(isdefined(level.weaponcustomizationiconsetup))
	{
		[[level.weaponcustomizationiconsetup]](localclientnum);
	}
	callback::callback(#"on_localclient_connect", localclientnum);
	customclass::localclientconnect(localclientnum);
	roommodel = getuimodel(function_5f72e972(#"hash_31e97ba41cad1834"), "room");
	room = getuimodelvalue(roommodel);
	postfx::setfrontendstreamingoverlay(localclientnum, "frontend", 1);
	toggle_postfx(localclientnum, 1, #"hash_7538956e47d44e4f");
	if(getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2)
	{
		function_b8922b79(localclientnum);
	}
	level.frontendclientconnected = 1;
	level notify("menu_change" + localclientnum, {#state:room, #status:"opened", #menu:"PressStart"});
	/#
		level function_92087f1b(localclientnum);
		level thread function_db3c4c69(localclientnum);
		level thread function_3d29f330(localclientnum);
		level thread function_90646a7f(localclientnum);
	#/
}

/*
	Name: onprecachegametype
	Namespace: frontend
	Checksum: 0x80F724D1
	Offset: 0x7FF8
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function onprecachegametype()
{
}

/*
	Name: onstartgametype
	Namespace: frontend
	Checksum: 0x80F724D1
	Offset: 0x8008
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
}

/*
	Name: function_175db490
	Namespace: frontend
	Checksum: 0x20FC19E3
	Offset: 0x8018
	Size: 0x26A
	Parameters: 4
	Flags: None
*/
function function_175db490(localclientnum, var_d0b01271, waitresult, params)
{
	fields = [[ waitresult ]]->function_e8b0acef();
	if(isdefined(fields))
	{
		params.var_401d9a1 = 1;
		params.var_c76f3e47 = 1;
		str_current_scene = [[ waitresult ]]->function_782bdd96();
		if(isdefined(str_current_scene))
		{
			params.scene = str_current_scene;
		}
		else
		{
			params.scene = function_2ca65924(waitresult);
		}
		if(waitresult character_customization::function_f40eb809())
		{
			function_286efebf(var_d0b01271, waitresult, params);
		}
		else
		{
			var_814ef009 = [[ waitresult ]]->function_1f70adfe();
			if(isdefined(var_814ef009))
			{
				params.var_a68ab9c2 = var_814ef009;
				if(var_814ef009 == "turn_cw_idle" || var_814ef009 == "turn_ccw_idle")
				{
					model = [[ waitresult ]]->function_217b10ed();
					params.scene_target = {#angles:model.angles, #origin:model.origin};
					params.var_b1e821c5 = {#blend:0};
				}
			}
			else
			{
				params.var_a68ab9c2 = "change_skin_idle";
				params.scene_target = level;
			}
		}
		params.var_a34c858c = 1;
		params.var_f5332569 = [[ waitresult ]]->function_98d70bef();
		params.activeweapon = function_8567daf2(var_d0b01271, undefined, [[ waitresult ]]->function_25725c05());
		params.var_b8f20727 = function_1fa47915(var_d0b01271, undefined, [[ waitresult ]]->function_25725c05());
		params.var_452aa9c0 = function_41f5d26d(var_d0b01271, undefined, [[ waitresult ]]->function_25725c05());
	}
}

/*
	Name: function_286efebf
	Namespace: frontend
	Checksum: 0xF19F96EC
	Offset: 0x8290
	Size: 0x292
	Parameters: 3
	Flags: None
*/
function function_286efebf(localclientnum, var_d0b01271, params)
{
	if(!isdefined(params.scene))
	{
		params = spawnstruct();
		fields = [[ var_d0b01271 ]]->function_e8b0acef();
		str_current_scene = [[ var_d0b01271 ]]->function_782bdd96();
		if(isdefined(str_current_scene))
		{
			params.scene = str_current_scene;
		}
		else
		{
			params.scene = function_2ca65924(var_d0b01271);
		}
	}
	model = [[ var_d0b01271 ]]->function_217b10ed();
	loc_00008380:
	s_align = {#angles:(isdefined(var_d0b01271.var_aba63ea) ? var_d0b01271.var_aba63ea : model.angles), #origin:(isdefined(var_d0b01271.var_ae32b908) ? var_d0b01271.var_ae32b908 : model.origin)};
	params.var_401d9a1 = 1;
	params.var_c76f3e47 = 1;
	params.var_a34c858c = 1;
	params.scene_target = s_align;
	params.var_bfbc1f4f = 1;
	params.activeweapon = function_8567daf2(localclientnum, undefined, [[ var_d0b01271 ]]->function_25725c05());
	params.var_b8f20727 = function_1fa47915(localclientnum, undefined, [[ var_d0b01271 ]]->function_25725c05());
	params.var_452aa9c0 = function_41f5d26d(localclientnum, undefined, [[ var_d0b01271 ]]->function_25725c05());
	params.var_74741b75 = var_d0b01271.var_c492e538;
	if(params.var_74741b75 === "turn_cw_intro")
	{
		params.var_a68ab9c2 = "turn_cw_idle";
	}
	else
	{
		params.var_a68ab9c2 = "turn_ccw_idle";
	}
	var_b1e821c5 = {#hash_9e6d8a3d:0.5, #blend:0};
	params.var_b1e821c5 = var_b1e821c5;
	return params;
}

/*
	Name: function_5eb72c78
	Namespace: frontend
	Checksum: 0x2D2141C8
	Offset: 0x8530
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_5eb72c78(localclientnum, menu_data)
{
	level endon(menu_data.menu_name + "_closed");
	level childthread function_c5aa56cd(localclientnum);
}

/*
	Name: function_763f40c4
	Namespace: frontend
	Checksum: 0x3D8EB13
	Offset: 0x8588
	Size: 0x39C
	Parameters: 3
	Flags: None
*/
function function_763f40c4(localclientnum, menu_name, state)
{
	level endon(menu_name + "_closed");
	if(menu_name === #"hash_305a797b5ec346a5" || menu_name === #"hash_1293085d3a5fd5c5" || state === #"hash_be671ade60002b")
	{
		str_scene = #"hash_5fd8b8ecae660770";
		var_a68ab9c2 = "inspect_idle";
		toggle_postfx(localclientnum, 0, #"hash_7538956e47d44e4f");
	}
	else
	{
		str_scene = function_2ca65924(level.var_1c43dd3e);
		var_a68ab9c2 = "change_skin_idle";
		toggle_postfx(localclientnum, 1, #"hash_7538956e47d44e4f");
	}
	if(!isdefined(state) || state == #"hash_be671ade60002b")
	{
		params = {#hash_dcfaf6c7:0, #hash_452aa9c0:function_41f5d26d(localclientnum, undefined, [[ level.var_1c43dd3e ]]->function_25725c05()), #hash_b8f20727:function_1fa47915(localclientnum, undefined, [[ level.var_1c43dd3e ]]->function_25725c05()), #activeweapon:function_8567daf2(localclientnum, undefined, [[ level.var_1c43dd3e ]]->function_25725c05()), #hash_a34c858c:1, #hash_a68ab9c2:var_a68ab9c2, #hash_74741b75:undefined, #scene:str_scene};
		[[ level.var_1c43dd3e ]]->update(params);
		var_cd34be2e = {#hash_1aa99c8b:"turn_ccw_idle", #hash_3480dd47:"turn_ccw_intro", #hash_e982dc6b:"turn_ccw_idle", #hash_c76d5a0b:"turn_cw_intro", #str_scene:params.scene};
		level thread character_customization::rotation_thread_spawner(localclientnum, level.var_1c43dd3e, [1:menu_name + "_closed", 0:"end_character_rotating" + localclientnum], var_cd34be2e);
		level childthread character_customization::updateeventthread(localclientnum, level.var_1c43dd3e, "updateSpecialistCustomization", &function_175db490);
	}
}

/*
	Name: function_2ca65924
	Namespace: frontend
	Checksum: 0x5F89C180
	Offset: 0x8930
	Size: 0x32
	Parameters: 1
	Flags: None
*/
function function_2ca65924(var_d0b01271)
{
	return function_4b2dd0a6([[ var_d0b01271 ]]->get_character_mode(), [[ var_d0b01271 ]]->function_9004475c());
}

/*
	Name: function_4b2dd0a6
	Namespace: frontend
	Checksum: 0x646F001A
	Offset: 0x8970
	Size: 0xC2
	Parameters: 2
	Flags: None
*/
function function_4b2dd0a6(mode, index)
{
	fields = getcharacterfields(index, mode);
	if(isdefined(fields.var_bb70c379) && scene::function_9730988a(fields.var_bb70c379, "select_intro") && scene::function_9730988a(fields.var_bb70c379, "select_idle"))
	{
		var_dde940e7 = fields.var_bb70c379;
	}
	else
	{
		var_dde940e7 = #"scene_frontend_t9_character";
	}
	return var_dde940e7;
}

/*
	Name: function_84ba276
	Namespace: frontend
	Checksum: 0xC00FBCFD
	Offset: 0x8A40
	Size: 0xEC
	Parameters: 2
	Flags: None
*/
function function_84ba276(localclientnum, character_index)
{
	self notify("7a25d30226eb5d6e");
	self endon("7a25d30226eb5d6e");
	level endon(#"hash_cf870c6cd8a0798");
	level flag::set("waiting_for_character_change");
	wait(getdvarfloat(#"hash_720d4385f4e050c2", 0.5));
	level flag::clear("waiting_for_character_change");
	var_dd102759 = character_customization::function_7474681d(localclientnum, 1, character_index);
	level thread function_90cad834(localclientnum, 0, var_dd102759);
}

/*
	Name: function_c5aa56cd
	Namespace: frontend
	Checksum: 0x555D7974
	Offset: 0x8B38
	Size: 0x136
	Parameters: 1
	Flags: None
*/
function function_c5aa56cd(localclientnum)
{
	self notify("44fb4960f3a8f7cb");
	self endon("44fb4960f3a8f7cb");
	toggle_postfx(localclientnum, 1, #"hash_7538956e47d44e4f");
	function_90cad834(localclientnum, 0);
	while(true)
	{
		var_bec52aca = undefined;
		var_bec52aca = level waittill(#"hash_cf870c6cd8a0798");
		character_index = var_bec52aca.character_index;
		if(isdefined(character_index))
		{
			if(isdefined(level.var_1c43dd3e) && ([[ level.var_1c43dd3e ]]->function_9004475c()) != character_index)
			{
				level.var_45cf7171 = character_index;
				level thread function_84ba276(localclientnum, level.var_45cf7171);
			}
			else
			{
				level.var_45cf7171 = undefined;
			}
		}
		else
		{
			level.var_45cf7171 = undefined;
		}
	}
}

/*
	Name: start_character_rotating_any
	Namespace: frontend
	Checksum: 0x114DDFAD
	Offset: 0x8C78
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function start_character_rotating_any(localclientnum, menu_data)
{
	maxlocalclient = getmaxlocalclients();
	while(localclientnum < maxlocalclient)
	{
		start_character_rotating(localclientnum, menu_data);
		localclientnum++;
	}
}

/*
	Name: end_character_rotating_any
	Namespace: frontend
	Checksum: 0x3B7B1DD3
	Offset: 0x8CD8
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function end_character_rotating_any(localclientnum, menu_data)
{
	maxlocalclient = getmaxlocalclients();
	while(localclientnum < maxlocalclient)
	{
		end_character_rotating(localclientnum, menu_data);
		localclientnum++;
	}
}

/*
	Name: start_character_rotating
	Namespace: frontend
	Checksum: 0x4EAE5846
	Offset: 0x8D38
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function start_character_rotating(localclientnum, menu_data)
{
	level thread character_customization::rotation_thread_spawner(localclientnum, menu_data.custom_character, "end_character_rotating" + localclientnum);
}

/*
	Name: end_character_rotating
	Namespace: frontend
	Checksum: 0xCB36CD6B
	Offset: 0x8D88
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function end_character_rotating(localclientnum, menu_data)
{
	level notify("end_character_rotating" + menu_data);
}

/*
	Name: function_b0442428
	Namespace: frontend
	Checksum: 0xFB83774E
	Offset: 0x8DC0
	Size: 0x118
	Parameters: 2
	Flags: None
*/
function function_b0442428(var_ce754e62, var_3f0e790b)
{
	if(isdefined(var_ce754e62) && isdefined(var_ce754e62[var_3f0e790b]))
	{
		foreach(object in var_ce754e62[var_3f0e790b])
		{
			var_2d0192e5 = [[ object.character ]]->function_82e05d64();
			if(isdefined(var_2d0192e5) && isdefined(var_2d0192e5.var_90ba8f6f) && isdefined([[ object.character ]]->function_217b10ed()))
			{
				setuimodelvalue(var_2d0192e5.var_90ba8f6f, [[ object.character ]]->function_47cb6b19());
			}
		}
	}
}

/*
	Name: function_f5eca51d
	Namespace: frontend
	Checksum: 0x5B2E4AA3
	Offset: 0x8EE0
	Size: 0xF0
	Parameters: 2
	Flags: None
*/
function function_f5eca51d(var_ce754e62, var_3f0e790b)
{
	if(isdefined(var_ce754e62) && isdefined(var_ce754e62[var_3f0e790b]))
	{
		foreach(object in var_ce754e62[var_3f0e790b])
		{
			var_2d0192e5 = [[ object.character ]]->function_82e05d64();
			if(isdefined(var_2d0192e5) && isdefined(var_2d0192e5.var_90ba8f6f))
			{
				setuimodelvalue(var_2d0192e5.var_90ba8f6f, -1);
			}
		}
	}
}

/*
	Name: function_e1f85a64
	Namespace: frontend
	Checksum: 0x21B8E302
	Offset: 0x8FD8
	Size: 0x254
	Parameters: 3
	Flags: None
*/
function function_e1f85a64(var_87c045d1, index, var_3f0e790b)
{
	var_6b71abc1 = function_5f72e972(#"hash_4ac4903f18e9aa80");
	var_c4caf9dd = getuimodel(var_6b71abc1, string(index + 1));
	if(!isdefined(var_c4caf9dd))
	{
		return;
	}
	[[ var_87c045d1 ]]->function_82e05d64().var_90ba8f6f = createuimodel(var_c4caf9dd, "entNum");
	[[ var_87c045d1 ]]->function_82e05d64().var_3f0e790b = var_3f0e790b;
	[[ var_87c045d1 ]]->function_184a4d2e(&function_8be87802);
	entnum = getuimodelvalue([[ var_87c045d1 ]]->function_82e05d64().var_90ba8f6f);
	if(!isdefined(entnum))
	{
		setuimodelvalue([[ var_87c045d1 ]]->function_82e05d64().var_90ba8f6f, [[ var_87c045d1 ]]->function_47cb6b19());
	}
	[[ var_87c045d1 ]]->function_82e05d64().visible_model = getuimodel(var_c4caf9dd, "visible");
	setuimodelvalue([[ var_87c045d1 ]]->function_82e05d64().visible_model, [[ var_87c045d1 ]]->function_ea4ac9f8() && [[ var_87c045d1 ]]->is_visible());
	var_2097336a = createuimodel(var_c4caf9dd, "sprayGestureIndex");
	[[ var_87c045d1 ]]->function_82e05d64().var_5da50127 = var_2097336a;
	setuimodelvalue(var_2097336a, (isdefined(getuimodelvalue(var_2097336a)) ? getuimodelvalue(var_2097336a) : -1));
}

/*
	Name: function_f00765ad
	Namespace: frontend
	Checksum: 0x5A424769
	Offset: 0x9238
	Size: 0x434
	Parameters: 6
	Flags: None
*/
function function_f00765ad(localclientnum, xuid, var_87c045d1, index, var_3f0e790b, var_2451e8ac)
{
	var_87c045d1 notify("f0790a40476f203");
	var_87c045d1 endon("f0790a40476f203");
	level endon(#"hash_6b2a1282c45c59f4", #"disconnect");
	iterations = 0;
	var_a65df30 = [[ var_87c045d1 ]]->function_e599283f();
	current_index = [[ var_87c045d1 ]]->function_9004475c();
	var_23904c1d = getcharactercustomizationforxuid(localclientnum, xuid);
	while(!isdefined(var_23904c1d) && iterations < 15)
	{
		wait(1);
		var_23904c1d = getcharactercustomizationforxuid(localclientnum, xuid);
		iterations++;
	}
	[[ var_87c045d1 ]]->show_model();
	[[ var_87c045d1 ]]->set_xuid(xuid);
	[[ var_87c045d1 ]]->set_character_mode(1);
	var_136f48d7 = [[ var_87c045d1 ]]->function_8567daf2();
	if(index == 0 || (getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2))
	{
		showcase_weapon = function_8d53d5b6(localclientnum, index, xuid);
	}
	[[ var_87c045d1 ]]->set_showcase_weapon(showcase_weapon);
	if(!isdefined(var_23904c1d) || var_23904c1d.charactermode != currentsessionmode() || !function_b9f8bbd9(var_23904c1d.charactertype, var_23904c1d.charactermode))
	{
		var_23904c1d = undefined;
		character_index = function_e3efec59(localclientnum, xuid, 1, var_3f0e790b, undefined);
		if(isdefined(character_index))
		{
			[[ var_87c045d1 ]]->set_character_index(character_index);
		}
	}
	if(isdefined(var_23904c1d))
	{
		if(is_true([[ var_87c045d1 ]]->function_82e05d64().var_b5229bb9) || character_customization::function_aa5382ed(var_23904c1d, var_a65df30, 0) || function_6677a717(var_136f48d7, showcase_weapon) || (getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2 && function_b24ced2b(xuid)))
		{
			[[ var_87c045d1 ]]->function_82e05d64().var_b5229bb9 = 0;
			function_c033e4cc(localclientnum, var_2451e8ac, var_87c045d1, index, var_23904c1d, xuid);
		}
	}
	else
	{
		[[ var_87c045d1 ]]->set_character_index(character_index);
		[[ var_87c045d1 ]]->function_22039feb();
		function_c033e4cc(localclientnum, var_2451e8ac, var_87c045d1, index, undefined, xuid);
	}
	function_e1f85a64(var_87c045d1, index, var_3f0e790b);
}

/*
	Name: function_c033e4cc
	Namespace: frontend
	Checksum: 0xB1D30885
	Offset: 0x9678
	Size: 0x1A4
	Parameters: 6
	Flags: None
*/
function function_c033e4cc(localclientnum, var_2451e8ac, var_87c045d1, index, var_7f395102, xuid)
{
	if(isdefined(var_2451e8ac))
	{
		switch(var_2451e8ac)
		{
			case "hash_65ff867f8f1e4df5":
			{
				if(namespace_d5a9ff55::is_current_menu(localclientnum, "PressStart"))
				{
					level thread function_90cad834(localclientnum, 0, var_7f395102);
				}
				break;
			}
			case "hash_7a4c0afd7c1fdcd6":
			{
				if(isdefined(var_7f395102))
				{
					[[ var_87c045d1 ]]->function_15a8906a(var_7f395102);
				}
				level thread function_c47e078a(1, index, var_87c045d1, localclientnum, xuid);
				break;
			}
			case "hash_6694e35791dc104e":
			default:
			{
				if(isdefined(var_7f395102))
				{
					[[ var_87c045d1 ]]->function_15a8906a(var_7f395102);
				}
				level thread function_c47e078a(0, index, var_87c045d1, localclientnum, xuid);
				break;
			}
		}
	}
	else
	{
		params = {#hash_401d9a1:1, #hash_c76f3e47:1};
		[[ var_87c045d1 ]]->update(params);
	}
}

/*
	Name: function_7c77108d
	Namespace: frontend
	Checksum: 0x681AFA49
	Offset: 0x9828
	Size: 0x1CE
	Parameters: 3
	Flags: None
*/
function function_7c77108d(localclientnum, &var_13ef9467, var_63aea26e)
{
	i = 0;
	while(true)
	{
		target = struct::get(var_63aea26e + i);
		if(!isdefined(target))
		{
			break;
		}
		charactermodel = util::spawn_model(localclientnum, "tag_origin", target.origin, target.angles);
		charactermodel.targetname = (var_63aea26e + "character_") + i;
		if(is_true(level.var_633071d0) && i == 0 && isclass(level.var_1c43dd3e))
		{
			var_a4fe2697 = level.var_1c43dd3e;
		}
		else
		{
			var_a4fe2697 = character_customization::function_dd295310(charactermodel, localclientnum, 0);
		}
		var_ac2e02ac = {#scene_name:undefined, #character:var_a4fe2697, #target:target};
		if(!isdefined(var_13ef9467))
		{
			var_13ef9467 = [];
		}
		else if(!isarray(var_13ef9467))
		{
			var_13ef9467 = array(var_13ef9467);
		}
		var_13ef9467[var_13ef9467.size] = var_ac2e02ac;
		i++;
	}
	return i;
}

/*
	Name: function_8be87802
	Namespace: frontend
	Checksum: 0x3B1B3FFC
	Offset: 0x9A00
	Size: 0x114
	Parameters: 2
	Flags: None
*/
function function_8be87802(localclientnum, character)
{
	var_2d0192e5 = [[ character ]]->function_82e05d64();
	if(!(isdefined(var_2d0192e5) && isdefined(var_2d0192e5.var_90ba8f6f)))
	{
		return;
	}
	var_c2ab6c5b = function_f701ad2a();
	if(var_2d0192e5.var_3f0e790b === var_c2ab6c5b)
	{
		setuimodelvalue(var_2d0192e5.var_90ba8f6f, [[ character ]]->function_47cb6b19());
	}
	if(isdefined(var_2d0192e5.var_3f0e790b) && isdefined(var_c2ab6c5b) && var_2d0192e5.var_3f0e790b != var_c2ab6c5b)
	{
		character_customization::function_bee62aa1(character);
	}
	setuimodelvalue(var_2d0192e5.visible_model, [[ character ]]->function_ea4ac9f8() && [[ character ]]->is_visible());
}

/*
	Name: function_45827126
	Namespace: frontend
	Checksum: 0x7AFCE979
	Offset: 0x9B20
	Size: 0x100
	Parameters: 0
	Flags: None
*/
function function_45827126()
{
	level endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_6f2435126950e914");
		if(level.var_f7aea3ff != waitresult.characterindex)
		{
			level.var_f7aea3ff = waitresult.characterindex;
			battlechatter::function_ad01601e(waitresult.localclientnum, waitresult.characterindex);
			level notify(#"hash_cf870c6cd8a0798");
			var_4f8e8422 = character_customization::function_7474681d(waitresult.localclientnum, 1, waitresult.characterindex);
			level thread function_90cad834(waitresult.localclientnum, 0, var_4f8e8422, 1);
		}
	}
}

/*
	Name: function_f00ff0c7
	Namespace: frontend
	Checksum: 0x1C9A5529
	Offset: 0x9C28
	Size: 0xB3E
	Parameters: 1
	Flags: None
*/
function function_f00ff0c7(localclientnum)
{
	level endon(#"disconnect");
	var_11302f48 = function_5f72e972(#"hash_5573c0775fbf1bb1");
	level.var_6f1da91a = [3:[], 2:[], 1:[], 0:[]];
	var_6aeec2ad = getdvarstring(#"hash_52abdac1a234fa29", "");
	var_c7581878 = function_7c77108d(localclientnum, level.var_6f1da91a[0], ("lobby_player" + var_6aeec2ad) + "_");
	var_c7581878 = max(function_7c77108d(localclientnum, level.var_6f1da91a[1], ("lobby_player" + var_6aeec2ad) + "_"), var_c7581878);
	var_c7581878 = max(function_7c77108d(localclientnum, level.var_6f1da91a[2], ("lobby_player" + var_6aeec2ad) + "_"), var_c7581878);
	var_c7581878 = max(function_7c77108d(localclientnum, level.var_6f1da91a[3], ("lobby_player" + var_6aeec2ad) + "_"), var_c7581878);
	level.var_90fa1c3e = var_c7581878;
	var_68a9a63c = [];
	b_first_run = 1;
	while(true)
	{
		var_6b002e4d = var_68a9a63c.size;
		waitresult = undefined;
		waitresult = level waittill(#"hash_6b2a1282c45c59f4");
		function_63a85bfb(localclientnum);
		level thread function_d0597c2(localclientnum, b_first_run);
		var_7d79d4fb = (0, 0, 0);
		switch(currentsessionmode())
		{
			case 2:
			{
				var_7d79d4fb = (6234, 240, 814);
				break;
			}
			case 0:
			case 1:
			default:
			{
				if(getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2)
				{
					var_7d79d4fb = (-4023, -4615, 996);
					function_b8922b79(localclientnum);
				}
				else
				{
					var_7d79d4fb = (-98, -672, 797);
				}
				break;
			}
		}
		setdvar(#"hash_4a394f3fa0b6bca2", var_7d79d4fb);
		var_ca8c236b = undefined;
		if(level.lastlobbystate === #"matchmaking" || level.lastlobbystate === #"hash_7a434d05bda0d382" || level.lastlobbystate === #"hash_433990930cddc3f1")
		{
			var_68a9a63c = function_77ccb73(1);
			var_5924f8b2 = function_664bca26(localclientnum, 1, 0);
			foreach(xuid in var_5924f8b2)
			{
				if(!array::contains(var_68a9a63c, xuid))
				{
					array::add(var_68a9a63c, xuid);
				}
			}
			if(is_true(getgametypesetting(#"hash_5462586bdce0346e")))
			{
				var_ca8c236b = min(getgametypesetting(#"hash_3a4691a853585241"), var_68a9a63c.size);
			}
		}
		else
		{
			var_68a9a63c = function_77ccb73(1);
		}
		var_3d095a85 = var_68a9a63c.size;
		if(is_true(waitresult.var_a3325423) || is_true(waitresult.var_2c5ad26b))
		{
			for(i = 0; i < var_c7581878; i++)
			{
				if(isdefined(level.var_45cf7171) && i == 0)
				{
					continue;
				}
				if(i < (isdefined(var_ca8c236b) ? var_ca8c236b : var_68a9a63c.size))
				{
					setuimodelvalue(getuimodel(var_11302f48, string(i)), var_68a9a63c[i]);
					foreach(var_3a76595 in level.var_6f1da91a)
					{
						var_7d4d74d3 = (i < var_3a76595.size ? var_3a76595[i] : undefined);
						if(isdefined(var_7d4d74d3))
						{
							if(level.lastlobbystate === #"mode_select" || level.lastlobbystate === #"hash_5fcd2ccfa1bd57d9" || level.lastlobbystate === #"room1" || level.lastlobbystate === #"room2")
							{
								continue;
							}
							if(i == 0 && (namespace_d5a9ff55::is_current_menu(localclientnum, "PressStart", #"hash_7da890f2771b41af") || namespace_d5a9ff55::is_current_menu(localclientnum, "PressStart", #"armory") || namespace_d5a9ff55::is_current_menu(localclientnum, "PressStart", #"hash_3262189f972fcd0e") || namespace_d5a9ff55::is_current_menu(localclientnum, "OperatorMissionsOverview")))
							{
								continue;
							}
							if(i == 0 && function_7dd48d78(localclientnum))
							{
								var_2451e8ac = #"hash_65ff867f8f1e4df5";
							}
							else
							{
								if(function_50806385(i) && is_true(waitresult.var_a3325423) && var_3d095a85 > var_6b002e4d && i >= var_6b002e4d)
								{
									var_2451e8ac = #"hash_7a4c0afd7c1fdcd6";
								}
								else
								{
									if(function_50806385(i))
									{
										var_2451e8ac = #"hash_6694e35791dc104e";
									}
									else
									{
										var_2451e8ac = #"hash_6694e35791dc104e";
									}
								}
							}
							var_7d4d74d3.target thread function_f00765ad(localclientnum, var_68a9a63c[i], var_7d4d74d3.character, i, var_3f0e790b, var_2451e8ac);
						}
					}
					continue;
				}
				foreach(var_3a76595 in level.var_6f1da91a)
				{
					var_7d4d74d3 = (i < var_3a76595.size ? var_3a76595[i] : undefined);
					if(isclass(var_7d4d74d3.character) && isdefined([[ var_7d4d74d3.character ]]->function_217b10ed()))
					{
						[[ var_7d4d74d3.character ]]->hide_model();
					}
				}
			}
			forcenotifyuimodel(var_11302f48);
		}
		var_3a76595 = level.var_6f1da91a[function_f701ad2a()];
		if(isdefined(var_3a76595))
		{
			for(i = 0; i < var_c7581878; i++)
			{
				if(i < (isdefined(var_ca8c236b) ? var_ca8c236b : var_68a9a63c.size))
				{
					var_7d4d74d3 = (i < var_3a76595.size ? var_3a76595[i] : undefined);
					if(isdefined(var_7d4d74d3) && (function_34fbc01b() || function_4fd0d58e()))
					{
						function_8be87802(localclientnum, var_7d4d74d3.character);
					}
				}
			}
		}
		b_first_run = 0;
	}
}

/*
	Name: function_7dd48d78
	Namespace: frontend
	Checksum: 0x5166DD10
	Offset: 0xA770
	Size: 0xD8
	Parameters: 1
	Flags: None
*/
function function_7dd48d78(localclientnum)
{
	if(namespace_d5a9ff55::is_current_menu(localclientnum, #"personalizecharacter") || namespace_d5a9ff55::is_current_menu(localclientnum, #"hash_1293085d3a5fd5c5") || namespace_d5a9ff55::is_current_menu(localclientnum, #"hash_5c9daecef20e6ff1") || namespace_d5a9ff55::is_current_menu(localclientnum, "PressStart", #"character_room") || namespace_d5a9ff55::is_current_menu(localclientnum, #"hash_6d7490313f58cc98"))
	{
		return true;
	}
	return false;
}

/*
	Name: function_50806385
	Namespace: frontend
	Checksum: 0x9366C3B9
	Offset: 0xA850
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_50806385(n_index)
{
	if(level.lastlobbystate === #"hash_7da890f2771b41af" || level.lastlobbystate === #"character_room" || level.lastlobbystate === #"armory" && n_index != 0 || (level.lastlobbystate === #"hash_433990930cddc3f1" || level.lastlobbystate === #"hash_294e28f13efed216" || level.lastlobbystate === #"hash_6ffe554be39e00d"))
	{
		return true;
	}
	return false;
}

/*
	Name: function_34fbc01b
	Namespace: frontend
	Checksum: 0xC29B76C
	Offset: 0xA940
	Size: 0xAA
	Parameters: 0
	Flags: None
*/
function function_34fbc01b()
{
	if(level.lastlobbystate === #"hash_433990930cddc3f1" || level.lastlobbystate === #"hash_6ffe554be39e00d" || level.lastlobbystate === #"character_room" || level.lastlobbystate === #"armory" || level.lastlobbystate === #"hash_7da890f2771b41af")
	{
		return true;
	}
	return false;
}

/*
	Name: function_4fd0d58e
	Namespace: frontend
	Checksum: 0xF3AA302E
	Offset: 0xA9F8
	Size: 0x8A
	Parameters: 0
	Flags: None
*/
function function_4fd0d58e()
{
	if(level.lastlobbystate === #"hash_294e28f13efed216" || level.lastlobbystate === #"character_room" || level.lastlobbystate === #"armory" || level.lastlobbystate === #"hash_7da890f2771b41af")
	{
		return true;
	}
	return false;
}

/*
	Name: function_b1b8f767
	Namespace: frontend
	Checksum: 0x52A08B24
	Offset: 0xAA90
	Size: 0x270
	Parameters: 2
	Flags: None
*/
function function_b1b8f767(localclientnum, play)
{
	if(play)
	{
		function_b0442428(level.var_6f1da91a, 0);
		var_bf321a0c = !isdefined(level.lastlobbystate) || level.lastlobbystate == "room2" || level.lastlobbystate == "mode_select";
		var_f647c5b2 = (var_bf321a0c ? "intro" : undefined);
		function_aba0885b(localclientnum);
		level notify(#"hash_46855140938f532c");
		if(!var_bf321a0c)
		{
			function_ade16f90(localclientnum);
		}
		if(getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2)
		{
			function_77d02911();
		}
		function_c47e078a(var_bf321a0c, 0, undefined, localclientnum);
		var_9032876b = function_7104551f(localclientnum);
		if(var_9032876b == 1 && (!(getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2)))
		{
			level thread function_c336d245(localclientnum);
		}
	}
	else if(!play)
	{
		function_f5eca51d(level.var_6f1da91a, 0);
		[[ level.var_1c43dd3e ]]->show_model();
	}
}

/*
	Name: function_ade16f90
	Namespace: frontend
	Checksum: 0x247BFEA9
	Offset: 0xAD08
	Size: 0x12C
	Parameters: 1
	Flags: None
*/
function function_ade16f90(localclientnum)
{
	var_3d095a85 = function_7104551f(localclientnum);
	if(getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2)
	{
		if(!scene::is_playing(#"hash_490f177701d6e0f2"))
		{
			function_77d02911();
		}
	}
	else
	{
		if(var_3d095a85 == 1)
		{
			level thread scene::play(#"scene_frontend_t9_lobby_player1_initial", "idle");
		}
		else
		{
			level thread scene::play(#"scene_frontend_t9_lobby_player1", "idle");
		}
	}
}

/*
	Name: function_7104551f
	Namespace: frontend
	Checksum: 0x73A7FFC
	Offset: 0xAE40
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_7104551f(localclientnum)
{
	var_68a9a63c = [];
	if(level.lastlobbystate === #"matchmaking" || level.lastlobbystate === #"hash_7a434d05bda0d382" || level.lastlobbystate === #"hash_433990930cddc3f1")
	{
		var_68a9a63c = function_664bca26(localclientnum, 1, 0);
	}
	else
	{
		var_68a9a63c = function_77ccb73(1);
	}
	return var_68a9a63c.size;
}

/*
	Name: function_c336d245
	Namespace: frontend
	Checksum: 0xA49C7658
	Offset: 0xAF08
	Size: 0x182
	Parameters: 1
	Flags: None
*/
function function_c336d245(localclientnum)
{
	self notify("6b59286bf6aa7d84");
	self endon("6b59286bf6aa7d84");
	while(true)
	{
		s_waitresult = undefined;
		s_waitresult = level waittill(#"hash_6b2a1282c45c59f4");
		var_9032876b = function_7104551f(localclientnum);
		if(is_true(s_waitresult.var_a3325423) && var_9032876b >= 2)
		{
			if(function_50806385(0))
			{
				if(level scene::is_playing(#"scene_frontend_t9_lobby_player1_initial", "intro"))
				{
					level.var_1c43dd3e.var_72e4ebb3 = "scene_frontend_t9_lobby_player1";
					level.var_1c43dd3e.var_31ccd6da = "xanim_only_idle";
				}
				level scene::play(#"scene_frontend_t9_lobby_player1_initial", "xcam_only_intro");
			}
			if(function_50806385(0))
			{
				level thread scene::play(#"scene_frontend_t9_lobby_player1_initial", "xcam_only_idle");
			}
			return;
		}
	}
}

/*
	Name: function_c47e078a
	Namespace: frontend
	Checksum: 0x70915AE6
	Offset: 0xB098
	Size: 0x77C
	Parameters: 5
	Flags: None
*/
function function_c47e078a(var_bf321a0c, var_302876c9, character, localclientnum, xuid)
{
	if(!isdefined(var_302876c9))
	{
		var_302876c9 = 1;
	}
	level notify(#"hash_250179ae4bc30aef" + character);
	level endon(#"hash_250179ae4bc30aef" + character, #"hash_9a862f4c6d59905");
	var_dd5c339d = 1;
	if(!isdefined(localclientnum))
	{
		if(character == 0)
		{
			localclientnum = level.var_1c43dd3e;
			var_16be1107 = function_2ca65924(localclientnum);
			level scene::cancel(#"scene_frontend_t9_character");
			level scene::cancel(var_16be1107);
			level scene::cancel(#"scene_frontend_t9_character_customization_camera");
			level scene::cancel(#"scene_frontend_t9_cac");
			n_character_index = getequippedheroindex(xuid, 1);
			if(n_character_index != ([[ localclientnum ]]->function_9004475c()))
			{
				var_7f395102 = character_customization::function_7474681d(xuid, 1, n_character_index);
				[[ localclientnum ]]->function_15a8906a(var_7f395102);
			}
		}
		else
		{
			localclientnum = level.var_6f1da91a[function_f701ad2a()][character].character;
		}
	}
	if(namespace_d5a9ff55::is_current_menu(xuid, "PressStart"))
	{
		str_scene = function_cfb00e7d(character, xuid, localclientnum);
		if(getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2)
		{
			if(sessionmodeiscampaigngame())
			{
				return;
			}
			if(character == 0 && !(isdefined([[ localclientnum ]]->function_25725c05())))
			{
				[[ localclientnum ]]->set_xuid(function_9bed6a71(xuid));
			}
			a_str_shots = scene::get_all_shot_names(str_scene);
			var_559c5c3e = array::random(a_str_shots);
			var_66125429 = 1;
		}
		else
		{
			a_str_shots = scene::get_all_shot_names(str_scene);
			var_78651d54 = [];
			var_fc395698 = [];
			foreach(str_shot in a_str_shots)
			{
				if(strstartswith(tolower(str_shot), "intro"))
				{
					if(!isdefined(var_78651d54))
					{
						var_78651d54 = [];
					}
					else if(!isarray(var_78651d54))
					{
						var_78651d54 = array(var_78651d54);
					}
					var_78651d54[var_78651d54.size] = str_shot;
				}
				if(strstartswith(tolower(str_shot), "idle"))
				{
					if(!isdefined(var_fc395698))
					{
						var_fc395698 = [];
					}
					else if(!isarray(var_fc395698))
					{
						var_fc395698 = array(var_fc395698);
					}
					var_fc395698[var_fc395698.size] = str_shot;
				}
			}
			if(var_302876c9)
			{
				var_f647c5b2 = array::random(var_78651d54);
				var_559c5c3e = strreplace(var_f647c5b2, "intro", "idle");
				/#
					/#
						assert(isinarray(var_fc395698, var_559c5c3e), ((("" + var_559c5c3e) + "") + function_9e72a96(str_scene) + "") + var_f647c5b2);
					#/
				#/
				if(!isinarray(var_fc395698, var_559c5c3e))
				{
					var_559c5c3e = array::random(var_fc395698);
				}
				if(character == 0)
				{
					var_dd5c339d = 0;
				}
			}
			else
			{
				var_559c5c3e = array::random(var_fc395698);
			}
		}
		if(!var_302876c9 && level scene::is_playing(str_scene, var_559c5c3e))
		{
			var_b8f75d74 = [[ localclientnum ]]->function_98d70bef();
		}
	}
	else
	{
		[[ localclientnum ]]->function_82e05d64().var_b5229bb9 = 1;
	}
	weapon = [[ localclientnum ]]->function_8567daf2().weapon;
	var_5b38793b = [[ localclientnum ]]->function_8567daf2().var_57fe74e5;
	var_f7332085 = [[ localclientnum ]]->function_8567daf2().var_fd90b0bb;
	params = {#hash_66125429:var_66125429, #hash_452aa9c0:var_f7332085, #hash_b8f20727:var_5b38793b, #activeweapon:weapon, #hash_f5332569:var_b8f75d74, #hash_a34c858c:1, #hash_a68ab9c2:var_559c5c3e, #hash_74741b75:var_f647c5b2, #scene:str_scene, #hash_401d9a1:1, #hash_c76f3e47:var_dd5c339d};
	[[ localclientnum ]]->update(params);
}

/*
	Name: function_cfb00e7d
	Namespace: frontend
	Checksum: 0xDFDD298D
	Offset: 0xB820
	Size: 0x386
	Parameters: 3
	Flags: None
*/
function function_cfb00e7d(n_index, localclientnum, character)
{
	/#
		assert(isdefined(n_index), "");
	#/
	if(getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2)
	{
		switch(n_index)
		{
			case 0:
			{
				if(isdefined(character))
				{
					str_scene = [[ character ]]->function_e8b0acef().var_79e0bc6a;
				}
				str_scene = (isdefined(str_scene) ? str_scene : #"hash_70d521127d61223e");
				break;
			}
			case 1:
			{
				str_scene = #"hash_46959b0c1d7a2a65";
				break;
			}
			case 2:
			{
				str_scene = #"hash_6d2fe1047f840f58";
				break;
			}
			case 3:
			{
				str_scene = #"hash_24341b3c3811bdef";
				break;
			}
			case 4:
			{
				str_scene = #"hash_7673a935d530f75a";
				break;
			}
			case 5:
			{
				str_scene = #"hash_1f53232a8a682b81";
				break;
			}
			default:
			{
				/#
					assertmsg("" + n_index);
				#/
			}
		}
	}
	else
	{
		var_3d095a85 = function_7104551f(localclientnum);
		switch(n_index)
		{
			case 0:
			{
				if(var_3d095a85 == 1)
				{
					str_scene = #"scene_frontend_t9_lobby_player1_initial";
				}
				else
				{
					str_scene = #"scene_frontend_t9_lobby_player1";
				}
				break;
			}
			case 1:
			{
				str_scene = #"scene_frontend_t9_lobby_player5";
				break;
			}
			case 2:
			{
				str_scene = #"scene_frontend_t9_lobby_player6";
				break;
			}
			case 3:
			{
				str_scene = #"scene_frontend_t9_lobby_player3";
				break;
			}
			case 4:
			{
				str_scene = #"scene_frontend_t9_lobby_player2";
				break;
			}
			case 5:
			{
				str_scene = #"scene_frontend_t9_lobby_player4";
				break;
			}
			default:
			{
				/#
					assertmsg("" + n_index);
				#/
			}
		}
	}
	return str_scene;
}

/*
	Name: function_db9d479f
	Namespace: frontend
	Checksum: 0x94A44AEB
	Offset: 0xBBB0
	Size: 0x114
	Parameters: 2
	Flags: None
*/
function function_db9d479f(localclientnum, play)
{
	camera_struct = struct::get(#"arena_align_tag");
	if(isdefined(camera_struct))
	{
		if(play)
		{
			camera_struct.var_e8b5aff5 = 1;
			function_b0442428(level.var_6f1da91a, 1);
			camera_struct thread scene::play("scene_frontend_arena_team");
		}
		else if(!play && is_true(camera_struct.var_e8b5aff5))
		{
			camera_struct.var_e8b5aff5 = 0;
			function_f5eca51d(level.var_6f1da91a, 1);
			camera_struct thread scene::stop("scene_frontend_arena_team", 1);
		}
	}
}

/*
	Name: toggle_postfx
	Namespace: frontend
	Checksum: 0xE4915ACC
	Offset: 0xBCD0
	Size: 0xC4
	Parameters: 3
	Flags: None
*/
function toggle_postfx(localclientnum, on_off, postfx)
{
	player = function_5c10bd79(localclientnum);
	if(on_off && !player postfx::function_556665f2(postfx))
	{
		player codeplaypostfxbundle(postfx);
	}
	else if(!on_off && player postfx::function_556665f2(postfx))
	{
		player codestoppostfxbundle(postfx);
	}
}

/*
	Name: lobby_main
	Namespace: frontend
	Checksum: 0x59FAF602
	Offset: 0xBDA0
	Size: 0x594
	Parameters: 3
	Flags: None
*/
function lobby_main(localclientnum, menu_name, state)
{
	level endon(menu_name + "_closed");
	level childthread function_c5aa56cd(localclientnum);
	level thread function_49efdec6(localclientnum, menu_name, state);
	if(state == #"room1" || state == #"room2")
	{
		level function_4431001a(localclientnum, "start", menu_name);
	}
	else
	{
		if(state == #"mode_select" || state == #"hash_5fcd2ccfa1bd57d9")
		{
			level function_4431001a(localclientnum, "main", menu_name);
		}
		else
		{
			level function_4431001a(localclientnum);
		}
	}
	if(state == #"matchmaking" && level.lastlobbystate !== #"matchmaking")
	{
		level notify(#"hash_6b2a1282c45c59f4", {#hash_a3325423:1});
	}
	else
	{
		if(state == #"hash_433990930cddc3f1" || state == #"hash_6ffe554be39e00d" || state == #"hash_294e28f13efed216")
		{
			if(!sessionmodeiscampaigngame())
			{
				level notify(#"hash_6b2a1282c45c59f4", {#hash_a3325423:1});
				function_b1b8f767(localclientnum, 1);
			}
			else
			{
				level notify(#"hash_6b2a1282c45c59f4");
			}
		}
		else
		{
			if(state == #"character_room")
			{
				if(getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2)
				{
					function_22d732be();
				}
				function_90cad834(localclientnum, 0);
			}
			else
			{
				if(state == #"hash_2a07ef364d8668f9" && level.lastlobbystate !== #"hash_2a07ef364d8668f9")
				{
					waitframe(1);
					var_aa16ae79 = getuimodel(function_1df4c3b0(localclientnum, #"hash_3e045efc97005502"), "ChosenSpecialistID");
					character_index = getuimodelvalue(var_aa16ae79);
					while(!isdefined(character_index) || character_index == 0)
					{
						wait(0.1);
						character_index = getuimodelvalue(var_aa16ae79);
					}
					level notify("menu_change" + localclientnum, {#mode:1, #state:character_index, #status:"opened", #menu:"directorTraining"});
				}
				else
				{
					if(state == #"cp_story")
					{
						level notify(#"hash_6b50f726c9f6f9f");
						if(isdefined(level.var_1c43dd3e))
						{
							[[ level.var_1c43dd3e ]]->function_39a68bf2();
						}
					}
					else if(getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2)
					{
						function_22d732be();
					}
				}
			}
		}
	}
	if(!isdefined(state) || state != #"room1")
	{
		setallcontrollerslightbarcolor();
		level notify(#"end_controller_pulse");
	}
	level.lastlobbystate = state;
	level thread function_97b4eb2c(localclientnum, menu_name, state);
}

/*
	Name: function_77d02911
	Namespace: frontend
	Checksum: 0x8F9E6AC0
	Offset: 0xC340
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_77d02911()
{
	if(!scene::is_playing(#"hash_490f177701d6e0f2"))
	{
		n_start_time = randomfloatrange(0, 1);
		level thread scene::play_from_time(#"hash_490f177701d6e0f2", undefined, undefined, n_start_time);
	}
}

/*
	Name: function_22d732be
	Namespace: frontend
	Checksum: 0xDEFADE6F
	Offset: 0xC3B8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_22d732be()
{
	level scene::cancel(#"hash_490f177701d6e0f2");
}

/*
	Name: function_f2fffb6f
	Namespace: frontend
	Checksum: 0xB4295537
	Offset: 0xC3E8
	Size: 0xAC
	Parameters: 2
	Flags: None
*/
function function_f2fffb6f(local_client_num, var_a8080f41)
{
	if(isdefined(level.var_1c43dd3e))
	{
		[[ level.var_1c43dd3e ]]->function_39a68bf2();
	}
	if(getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2)
	{
		function_22d732be();
	}
}

/*
	Name: function_63a85bfb
	Namespace: frontend
	Checksum: 0x6547B199
	Offset: 0xC4A0
	Size: 0x6AC
	Parameters: 1
	Flags: None
*/
function function_63a85bfb(localclientnum)
{
	if(!isdefined(level.var_1938999e))
	{
		level.var_1938999e = getentarray(localclientnum, "script_models_zm_lobby", "targetname");
	}
	if(sessionmodeiszombiesgame() && level.var_1914c663 !== #"zm")
	{
		foreach(var_201e3ba3 in level.var_d508403d)
		{
			unhidevolumedecal(var_201e3ba3);
		}
		foreach(var_e9a37674 in level.var_8a620c67)
		{
			unhidestaticmodel(var_e9a37674);
		}
		foreach(var_9da4ca8e in level.var_1938999e)
		{
			var_9da4ca8e show();
			if(isdefined(var_9da4ca8e.renderoverridebundle) && !var_9da4ca8e function_d2503806(var_9da4ca8e.renderoverridebundle))
			{
				var_9da4ca8e playrenderoverridebundle(var_9da4ca8e.renderoverridebundle);
			}
		}
		foreach(var_5661a499 in level.var_1a55d2dd)
		{
			hidevolumedecal(var_5661a499);
		}
		foreach(var_c00eda0d in level.var_fec4a8fd)
		{
			hidestaticmodel(var_c00eda0d);
		}
		level.var_1914c663 = #"zm";
	}
	else if(!sessionmodeiszombiesgame() && level.var_1914c663 !== #"default")
	{
		foreach(var_201e3ba3 in level.var_d508403d)
		{
			hidevolumedecal(var_201e3ba3);
		}
		foreach(var_e9a37674 in level.var_8a620c67)
		{
			hidestaticmodel(var_e9a37674);
		}
		foreach(var_9da4ca8e in level.var_1938999e)
		{
			if(isdefined(var_9da4ca8e.renderoverridebundle) && var_9da4ca8e function_d2503806(var_9da4ca8e.renderoverridebundle))
			{
				var_9da4ca8e stoprenderoverridebundle(var_9da4ca8e.renderoverridebundle);
			}
			var_9da4ca8e hide();
		}
		foreach(var_5661a499 in level.var_1a55d2dd)
		{
			unhidevolumedecal(var_5661a499);
		}
		foreach(var_c00eda0d in level.var_fec4a8fd)
		{
			unhidestaticmodel(var_c00eda0d);
		}
		level.var_1914c663 = #"default";
	}
}

/*
	Name: function_d0597c2
	Namespace: frontend
	Checksum: 0xD575F313
	Offset: 0xCB58
	Size: 0x174
	Parameters: 2
	Flags: None
*/
function function_d0597c2(localclientnum, b_first_run)
{
	if(!isdefined(b_first_run))
	{
		b_first_run = 0;
	}
	if(b_first_run)
	{
		waitframe(1);
	}
	if(sessionmodeiszombiesgame() && level.var_80333dbc !== #"zm")
	{
		function_7070281c(localclientnum, 1);
		exploder::exploder(#"hash_5368b6f5ddf6c271");
		function_422ea367(localclientnum);
		level.var_80333dbc = #"zm";
	}
	else if(!sessionmodeiszombiesgame() && level.var_80333dbc !== #"default")
	{
		function_7070281c(localclientnum, 0);
		exploder::stop_exploder(#"hash_5368b6f5ddf6c271");
		function_422ea367(localclientnum);
		level.var_80333dbc = #"default";
	}
}

/*
	Name: function_422ea367
	Namespace: frontend
	Checksum: 0x9A14E42B
	Offset: 0xCCD8
	Size: 0x23A
	Parameters: 1
	Flags: None
*/
function function_422ea367(localclientnum)
{
	if(getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2)
	{
		if(sessionmodeiszombiesgame())
		{
			str_fx = #"hash_2785ae56ce958056";
		}
		else
		{
			str_fx = #"hash_2785ad56ce957ea3";
		}
		if(!isdefined(level.var_1c6b904f))
		{
			level.var_1c6b904f = getent(localclientnum, "s2_lobby_geo_1", "targetname");
		}
		if(!isdefined(level.var_9c4a1006))
		{
			level.var_9c4a1006 = getent(localclientnum, "s2_lobby_geo_2", "targetname");
		}
		if(isdefined(level.var_1c6b904f))
		{
			if(isdefined(level.var_1c6b904f.var_5c5f653d))
			{
				killfx(localclientnum, level.var_1c6b904f.var_5c5f653d);
			}
			level.var_1c6b904f.var_5c5f653d = util::playfxontag(localclientnum, str_fx, level.var_1c6b904f, "fx_fog_022");
		}
		if(isdefined(level.var_9c4a1006))
		{
			if(isdefined(level.var_9c4a1006.var_5c5f653d))
			{
				killfx(localclientnum, level.var_9c4a1006.var_5c5f653d);
			}
			level.var_9c4a1006.var_5c5f653d = util::playfxontag(localclientnum, str_fx, level.var_9c4a1006, "fx_fog_022");
		}
	}
}

/*
	Name: function_f701ad2a
	Namespace: frontend
	Checksum: 0x9416E0EB
	Offset: 0xCF20
	Size: 0x70
	Parameters: 0
	Flags: None
*/
function function_f701ad2a()
{
	if(sessionmodeiswarzonegame())
	{
		return 3;
	}
	if(sessionmodeiszombiesgame())
	{
		return 2;
	}
	if(function_34fbc01b())
	{
		return 0;
	}
	if(function_4fd0d58e())
	{
		return 1;
	}
	return -1;
}

/*
	Name: function_79ac87ac
	Namespace: frontend
	Checksum: 0xAC387E55
	Offset: 0xCF98
	Size: 0x21A
	Parameters: 1
	Flags: None
*/
function function_79ac87ac(clientnum)
{
	var_f33f3800 = self function_a5248552();
	if(isarray(level.var_6f1da91a) && var_f33f3800.size > 0)
	{
		var_91389554 = function_f701ad2a();
		if(!isdefined(var_91389554) || var_91389554 < 0)
		{
			var_91389554 = 0;
		}
		var_b2694f96 = level.var_6f1da91a[var_91389554];
		if(isdefined(self._s.var_1b22ecf4))
		{
			var_302876c9 = int(self._s.var_1b22ecf4);
			var_bf735535 = var_b2694f96[var_302876c9];
			if(isdefined(var_bf735535))
			{
				self._e_array[clientnum] = [[ var_bf735535.character ]]->function_217b10ed();
			}
			if(var_302876c9 != 0)
			{
				self.var_8bba7189 = 1;
			}
		}
		else
		{
			foreach(var_c1468bbf, s_obj in var_f33f3800)
			{
				var_bf735535 = var_b2694f96[var_c1468bbf];
				if(!isdefined(var_bf735535))
				{
					continue;
				}
				if(self == s_obj)
				{
					self._e_array[clientnum] = [[ var_bf735535.character ]]->function_217b10ed();
					if(var_c1468bbf != 0)
					{
						self.var_8bba7189 = 1;
					}
					break;
				}
			}
		}
	}
}

/*
	Name: function_a5248552
	Namespace: frontend
	Checksum: 0x96914E8E
	Offset: 0xD1C0
	Size: 0xFA
	Parameters: 0
	Flags: None
*/
function function_a5248552()
{
	var_f33f3800 = [];
	foreach(s_obj in self._o_scene._a_objects)
	{
		if(s_obj._s.type === #"player")
		{
			if(!isdefined(var_f33f3800))
			{
				var_f33f3800 = [];
			}
			else if(!isarray(var_f33f3800))
			{
				var_f33f3800 = array(var_f33f3800);
			}
			var_f33f3800[var_f33f3800.size] = s_obj;
		}
	}
	return var_f33f3800;
}

/*
	Name: function_97b4eb2c
	Namespace: frontend
	Checksum: 0x1B0AC88F
	Offset: 0xD2C8
	Size: 0x328
	Parameters: 3
	Flags: None
*/
function function_97b4eb2c(localclientnum, var_2a4208a4, str_state)
{
	if(!isdefined(str_state))
	{
		str_state = #"hash_433990930cddc3f1";
	}
	self notify("4f7cbc577391ade7");
	self endon("4f7cbc577391ade7");
	level endon(#"disconnect");
	switch(str_state)
	{
		case "mode_select":
		case "hash_5fcd2ccfa1bd57d9":
		{
			return;
		}
		case "hash_6ffe554be39e00d":
		case "hash_294e28f13efed216":
		case "hash_433990930cddc3f1":
		default:
		{
			str_rumble = #"hash_795b2f3495784147";
			var_58b22097 = 2;
			var_685248c4 = 7;
			n_delay_min = 45;
			n_delay_max = 60;
			str_fxanim = #"hash_2fcf0a8a728e2785";
			var_df4e70cd = "";
			break;
		}
		case "hash_7da890f2771b41af":
		{
			str_rumble = #"hash_4830baac0547b450";
			var_58b22097 = 15;
			var_685248c4 = 20;
			n_delay_min = 120;
			n_delay_max = 180;
			str_fxanim = #"hash_18f39e031336d60c";
			var_df4e70cd = #"hash_20e4410e7a619aab";
			break;
		}
		case "character_room":
		{
			str_rumble = #"hash_4a7c098220c7b9be";
			var_58b22097 = 10;
			var_685248c4 = 15;
			n_delay_min = 60;
			n_delay_max = 75;
			str_fxanim = #"hash_47b1fa847fee9018";
			var_df4e70cd = #"hash_4332c2e140d253";
			break;
		}
	}
	v_source = struct::get(str_fxanim, "scriptbundlename").origin;
	b_first_time = 1;
	while(true)
	{
		if(b_first_time)
		{
			n_timeout = randomfloatrange(var_58b22097, var_685248c4);
			level scene::stop(str_fxanim);
		}
		else
		{
			n_timeout = randomfloatrange(n_delay_min, n_delay_max);
		}
		wait(n_timeout);
		b_first_time = 0;
		playsound(var_2a4208a4, var_df4e70cd, (0, 0, 0));
		playrumbleonposition(var_2a4208a4, str_rumble, v_source);
		level thread scene::play(str_fxanim);
	}
}

/*
	Name: function_24ae4ffb
	Namespace: frontend
	Checksum: 0x70B01904
	Offset: 0xD5F8
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function function_24ae4ffb()
{
	forceambientroom("");
	setsoundcontext("frontend", "active");
	audio::function_d3790fe();
	function_5ea2c6e3("ui_frontend_mute_movies");
	audio::function_a022576e();
}

/*
	Name: function_4ff471c2
	Namespace: frontend
	Checksum: 0xBF358195
	Offset: 0xD678
	Size: 0x120
	Parameters: 0
	Flags: None
*/
function function_4ff471c2()
{
	level endon(#"disconnect");
	while(true)
	{
		wait(randomintrange(7, 20));
		if(math::cointoss())
		{
			n_amount = randomfloatrange(0, 1);
			n_fade_time = randomintrange(4, 11);
			function_5ea2c6e3("amb_frontend_planerattle_flux", n_fade_time, n_amount);
		}
		if(math::cointoss())
		{
			n_amount = randomfloatrange(0, 1);
			n_fade_time = randomintrange(4, 11);
			function_5ea2c6e3("amb_frontend_planedrone_flux", n_fade_time, n_amount);
		}
	}
}

/*
	Name: function_49efdec6
	Namespace: frontend
	Checksum: 0x28CDA84B
	Offset: 0xD7A0
	Size: 0x4C2
	Parameters: 3
	Flags: None
*/
function function_49efdec6(localclientnum, menu_name, str_state)
{
	self notify("69ddd56088b74973");
	self endon("69ddd56088b74973");
	level endon(#"disconnect");
	if(!is_true(level.var_bc580f2))
	{
		level function_2524bdd7();
		level.var_bc580f2 = 1;
	}
	var_4e9b78d2 = 0;
	session_mode = currentsessionmode();
	if(session_mode === 0)
	{
		var_4e9b78d2 = 1;
	}
	else
	{
		function_672403ca("amb_frontend_zmb", 0.25, 1);
	}
	switch(str_state)
	{
		case "room2":
		case "room1":
		case "mode_select":
		case "hash_5fcd2ccfa1bd57d9":
		default:
		{
			function_672403ca("amb_frontend_armory", 0.25, 1);
			function_672403ca("amb_frontend_lobby", 0.25, 1);
			function_672403ca("amb_frontend_mtx", 0.25, 1);
			if(var_4e9b78d2)
			{
				function_672403ca("amb_frontend_zmb", 0.25, 1);
			}
			break;
		}
		case "armory":
		case "hash_1aed7f95cf841dfc":
		case "scorestreaks":
		case "hash_1fddd14ae4b2b04a":
		case "character_room":
		case "hash_7da890f2771b41af":
		case "accessories":
		{
			function_672403ca("amb_frontend_armory", 0.25, 0);
			function_672403ca("amb_frontend_lobby", 0.25, 1);
			function_672403ca("amb_frontend_mtx", 0.25, 1);
			if(var_4e9b78d2)
			{
				function_672403ca("amb_frontend_zmb", 0.25, 1);
			}
			break;
		}
		case "hash_6ffe554be39e00d":
		case "hash_294e28f13efed216":
		case "hash_433990930cddc3f1":
		{
			function_672403ca("amb_frontend_armory", 0.25, 1);
			function_672403ca("amb_frontend_lobby", 0.25, 0);
			function_672403ca("amb_frontend_mtx", 0.25, 1);
			if(var_4e9b78d2)
			{
				function_672403ca("amb_frontend_zmb", 0.25, 0);
			}
			break;
		}
		case "cp_story":
		case "cp_evidence":
		case "hash_3262189f972fcd0e":
		case "hash_56527b57d58c2c6a":
		{
			function_672403ca("amb_frontend_armory", 0.25, 1);
			function_672403ca("amb_frontend_lobby", 0.25, 1);
			function_672403ca("amb_frontend_mtx", 0.25, 0);
			if(var_4e9b78d2)
			{
				function_672403ca("amb_frontend_zmb", 0.25, 1);
			}
			break;
		}
	}
}

/*
	Name: function_2524bdd7
	Namespace: frontend
	Checksum: 0x98EC6491
	Offset: 0xDC70
	Size: 0x1A4
	Parameters: 0
	Flags: None
*/
function function_2524bdd7()
{
	audio::playloopat(#"hash_43dce4b6881f080e", (0, 0, 0));
	audio::playloopat(#"hash_de38571d2fc4b55", (1, 1, 1));
	audio::playloopat(#"hash_6f0c673b09011cbf", vectorscale((1, 1, 1), 2));
	audio::playloopat(#"hash_2a68070c66c3b1c6", vectorscale((1, 1, 1), 3));
	audio::playloopat(#"hash_75b184dc67754c7e", vectorscale((1, 1, 1), 4));
	function_5ea2c6e3("amb_frontend_drone", 0.5, 0);
	function_5ea2c6e3("amb_frontend_armory", 0.5, 1);
	function_5ea2c6e3("amb_frontend_lobby", 0.5, 1);
	function_5ea2c6e3("amb_frontend_mtx", 0.5, 1);
	function_5ea2c6e3("amb_frontend_zmb", 0.5, 1);
}

/*
	Name: function_b8a526ac
	Namespace: frontend
	Checksum: 0x8FD95F0F
	Offset: 0xDE20
	Size: 0xD0
	Parameters: 2
	Flags: None
*/
function function_b8a526ac(var_f9d98743, var_ac30bc43)
{
	if(!isdefined(var_f9d98743))
	{
		var_f9d98743 = 0;
	}
	var_9b317d6b = level.var_96d63e5f;
	var_cd20722b = var_9b317d6b.var_2788b16c;
	foreach(id in var_ac30bc43)
	{
		setsoundvolume(var_cd20722b[id], var_f9d98743);
	}
}

/*
	Name: update_room2_devgui
	Namespace: frontend
	Checksum: 0xA2A9A04
	Offset: 0xDEF8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function update_room2_devgui(localclientnum)
{
	/#
		level thread mp_devgui::remove_mp_contracts_devgui(localclientnum);
	#/
}

/*
	Name: update_mp_lobby_room_devgui
	Namespace: frontend
	Checksum: 0xEDED9798
	Offset: 0xDF30
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function update_mp_lobby_room_devgui(localclientnum, state)
{
	/#
		if(state == "" || state == "")
		{
			level thread mp_devgui::create_mp_contracts_devgui(localclientnum);
		}
		else
		{
			level mp_devgui::remove_mp_contracts_devgui(localclientnum);
		}
	#/
}

/*
	Name: pulse_controller_color
	Namespace: frontend
	Checksum: 0xD4452F60
	Offset: 0xDFB0
	Size: 0xC6
	Parameters: 0
	Flags: None
*/
function pulse_controller_color()
{
	level endon(#"end_controller_pulse");
	delta_t = -0.01;
	t = 1;
	while(true)
	{
		setallcontrollerslightbarcolor((1 * t, 0.2 * t, 0));
		t = t + delta_t;
		if(t < 0.2 || t > 0.99)
		{
			delta_t = delta_t * -1;
		}
		waitframe(1);
	}
}

/*
	Name: function_74e1ca20
	Namespace: frontend
	Checksum: 0xF33A9B61
	Offset: 0xE080
	Size: 0x7A
	Parameters: 1
	Flags: None
*/
function function_74e1ca20(str_notify)
{
	if(level.lastlobbystate === #"character_room" && str_notify === #"hash_248ca22abc6b78ed" && isdefined(level.var_debe8147))
	{
		[[ level.var_1c43dd3e ]]->function_15a8906a(level.var_debe8147);
		level.var_debe8147 = undefined;
	}
}

/*
	Name: function_90cad834
	Namespace: frontend
	Checksum: 0xE6D0762F
	Offset: 0xE108
	Size: 0x564
	Parameters: 4
	Flags: None
*/
function function_90cad834(localclientnum, var_3449052c, var_7f395102, var_e6db60fc)
{
	if(!isdefined(var_3449052c))
	{
		var_3449052c = 0;
	}
	if(!isdefined(var_e6db60fc))
	{
		var_e6db60fc = 0;
	}
	level notify(#"hash_53d7a69385304e8");
	level notify(#"end_character_rotating" + localclientnum);
	level endoncallback(&function_74e1ca20, #"hash_53d7a69385304e8", #"hash_248ca22abc6b78ed", #"disconnect");
	weapon = function_8567daf2(localclientnum, undefined, [[ level.var_1c43dd3e ]]->function_25725c05());
	var_5b38793b = function_1fa47915(localclientnum, undefined, [[ level.var_1c43dd3e ]]->function_25725c05());
	var_f7332085 = function_41f5d26d(localclientnum, undefined, [[ level.var_1c43dd3e ]]->function_25725c05());
	var_b1e821c5 = spawnstruct();
	if(isdefined(var_7f395102))
	{
		var_16be1107 = function_4b2dd0a6(var_7f395102.charactermode, var_7f395102.charactertype);
	}
	else
	{
		var_16be1107 = function_2ca65924(level.var_1c43dd3e);
	}
	if(var_3449052c)
	{
		if(isdefined(level.var_debe8147))
		{
			var_b8f75d74 = [[ level.var_1c43dd3e ]]->function_98d70bef();
		}
		level.var_debe8147 = var_7f395102;
		params = {#hash_452aa9c0:var_f7332085, #hash_b8f20727:var_5b38793b, #activeweapon:weapon, #hash_f5332569:var_b8f75d74, #hash_99a89f83:1, #hash_74741b75:"select_outro", #scene:var_16be1107, #hash_a34c858c:1};
		[[ level.var_1c43dd3e ]]->update(params);
		var_c74251a4 = scene::function_8582657c(var_16be1107, "select_outro");
		if(isdefined(var_b8f75d74))
		{
			n_wait_time = var_c74251a4 - (var_b8f75d74 * var_c74251a4);
			wait(n_wait_time);
		}
		else
		{
			wait(var_c74251a4);
		}
		if(isdefined(var_7f395102))
		{
			[[ level.var_1c43dd3e ]]->function_15a8906a(var_7f395102);
		}
	}
	else if(isdefined(var_7f395102))
	{
		[[ level.var_1c43dd3e ]]->function_15a8906a(var_7f395102);
	}
	level.var_debe8147 = undefined;
	if(var_e6db60fc)
	{
		var_f647c5b2 = "select_intro";
		if(!level flag::get("waiting_for_character_change") && [[ level.var_1c43dd3e ]]->function_ea4ac9f8() && [[ level.var_1c43dd3e ]]->is_visible())
		{
			var_b1e821c5.blend = 0.5;
			var_b1e821c5.var_dcfaf6c7 = 0.5;
		}
		else
		{
			var_b1e821c5.blend = 0;
			var_b1e821c5.var_9e6d8a3d = 0.5;
			var_b1e821c5.var_dcfaf6c7 = 0.5;
		}
	}
	else
	{
		var_b8f75d74 = [[ level.var_1c43dd3e ]]->function_98d70bef();
		var_b1e821c5.blend = 0;
		var_b1e821c5.var_dcfaf6c7 = 0.5;
	}
	params = {#hash_452aa9c0:var_f7332085, #hash_b8f20727:var_5b38793b, #activeweapon:weapon, #hash_99a89f83:1, #hash_a68ab9c2:"select_idle", #hash_74741b75:var_f647c5b2, #scene:var_16be1107, #hash_b1e821c5:var_b1e821c5, #hash_f5332569:var_b8f75d74, #hash_401d9a1:1, #hash_c76f3e47:1, #hash_a34c858c:1};
	[[ level.var_1c43dd3e ]]->update(params);
	level flag::clear("waiting_for_character_change");
}

/*
	Name: function_92136eb2
	Namespace: frontend
	Checksum: 0x4D0B9F6C
	Offset: 0xE678
	Size: 0x2F4
	Parameters: 7
	Flags: None
*/
function function_92136eb2(localclientnum, menu_name, str_scene, var_f647c5b2, var_559c5c3e, var_77e970fa, var_dd5c339d)
{
	if(!isdefined(var_77e970fa))
	{
		var_77e970fa = 1;
	}
	if(!isdefined(var_dd5c339d))
	{
		var_dd5c339d = 1;
	}
	level notify(#"hash_6b50f726c9f6f9f");
	level endon(#"hash_6b50f726c9f6f9f", #"disconnect");
	if(isdefined(menu_name))
	{
		level endon(menu_name + "_closed");
	}
	b_force_update = 1;
	while(true)
	{
		var_211dbb67 = function_25f808c9(localclientnum, 1);
		if(!isdefined(var_211dbb67))
		{
			var_211dbb67 = character_customization::function_3f5625f1(1, 2);
		}
		var_c0a8925e = var_211dbb67.charactertype;
		if(isdefined(var_c0a8925e) && (var_c0a8925e !== level.var_f7aea3ff || b_force_update))
		{
			b_force_update = 0;
			var_9c34f0a = function_9bed6a71(localclientnum, 1);
			[[ level.var_1c43dd3e ]]->function_15a8906a(var_211dbb67);
			params = {#hash_452aa9c0:function_41f5d26d(localclientnum, undefined, [[ level.var_1c43dd3e ]]->function_25725c05()), #hash_b8f20727:function_1fa47915(localclientnum, undefined, [[ level.var_1c43dd3e ]]->function_25725c05()), #activeweapon:function_8567daf2(localclientnum, undefined, [[ level.var_1c43dd3e ]]->function_25725c05()), #hash_a68ab9c2:var_559c5c3e, #hash_74741b75:var_f647c5b2, #scene:str_scene, #hash_c76f3e47:var_dd5c339d, #hash_401d9a1:var_77e970fa, #hash_a34c858c:1};
			[[ level.var_1c43dd3e ]]->update(params);
			level.var_f7aea3ff = var_c0a8925e;
		}
		wait(0.1);
	}
}

/*
	Name: function_aba0885b
	Namespace: frontend
	Checksum: 0x5484596
	Offset: 0xE978
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_aba0885b(localclientnum)
{
	var_211dbb67 = function_25f808c9(localclientnum, 1);
	if(!isdefined(var_211dbb67))
	{
		var_211dbb67 = character_customization::function_3f5625f1(1, 2);
	}
	var_c0a8925e = var_211dbb67.charactertype;
	if(isdefined(var_c0a8925e) && var_c0a8925e !== level.var_f7aea3ff)
	{
		[[ level.var_1c43dd3e ]]->function_15a8906a(var_211dbb67);
		level.var_f7aea3ff = var_c0a8925e;
	}
}

/*
	Name: function_4431001a
	Namespace: frontend
	Checksum: 0x465CC81
	Offset: 0xEA30
	Size: 0x114
	Parameters: 3
	Flags: None
*/
function function_4431001a(localclientnum, scene_shot, menu_name)
{
	if(getdvarint(#"hash_60d812bef0f782fb", 1) == 2 || getdvarint(#"hash_7f0099222a51b5f6", 2) == 2)
	{
		str_start_scene = #"hash_1fab786769273269";
	}
	else
	{
		str_start_scene = #"hash_5f96faa5a4f393c7";
	}
	if(isdefined(scene_shot))
	{
		level childthread function_92136eb2(localclientnum, menu_name, str_start_scene, undefined, scene_shot);
	}
	else
	{
		level notify(#"hash_6b50f726c9f6f9f");
		level scene::cancel(str_start_scene);
	}
}

/*
	Name: function_9602c423
	Namespace: frontend
	Checksum: 0xC0AE2F01
	Offset: 0xEB50
	Size: 0x136
	Parameters: 3
	Flags: None
*/
function function_9602c423(localclientnum, menu_name, state)
{
	var_d0b01271 = namespace_d5a9ff55::function_daadc836(menu_name, localclientnum);
	[[ var_d0b01271 ]]->show_model();
	camera_ent = struct::get(#"hash_434d5a5ec5b33e52");
	playmaincamxcam(localclientnum, #"hash_76063cbfea101a2f", 0, "", "", camera_ent.origin, camera_ent.angles);
	if(isdefined(state))
	{
		[[ var_d0b01271 ]]->set_character_index(state);
		level notify("updateSpecialistCustomization" + localclientnum, {#mode:currentsessionmode(), #character_index:state, #event_name:"changeHero"});
	}
}

/*
	Name: function_25b060af
	Namespace: frontend
	Checksum: 0x74CC2A7E
	Offset: 0xEC90
	Size: 0x126
	Parameters: 3
	Flags: None
*/
function function_25b060af(localclientnum, menu_name, state)
{
	var_d0b01271 = namespace_d5a9ff55::function_daadc836(menu_name, localclientnum);
	[[ var_d0b01271 ]]->show_model();
	camera_ent = struct::get(#"hash_434d5a5ec5b33e52");
	playmaincamxcam(localclientnum, #"hash_42064e95d20cee44", 0, "", "", camera_ent.origin, camera_ent.angles);
	if(isdefined(state))
	{
		[[ var_d0b01271 ]]->set_character_index(state);
		level notify("updateSpecialistCustomization" + localclientnum, {#mode:1, #character_index:state, #event_name:"changeHero"});
	}
}

/*
	Name: function_f8cec907
	Namespace: frontend
	Checksum: 0xD86488B5
	Offset: 0xEDC0
	Size: 0x1C6
	Parameters: 3
	Flags: None
*/
function function_f8cec907(localclientnum, menu_name, state)
{
	var_d0b01271 = namespace_d5a9ff55::function_daadc836(menu_name, localclientnum);
	[[ var_d0b01271 ]]->show_model();
	camera_ent = struct::get(#"hash_dd8a67627ed7326");
	playmaincamxcam(localclientnum, #"hash_29ce5a87ce25b761", 0, "", "", camera_ent.origin, camera_ent.angles);
	if(isdefined(state))
	{
		args = strtok(state, ";");
		char_index = int((isdefined(args[0]) ? args[0] : 0));
		outfit_index = int((isdefined(args[1]) ? args[1] : 0));
		[[ var_d0b01271 ]]->set_character_mode(3);
		[[ var_d0b01271 ]]->set_character_index(char_index);
		level notify("updateSpecialistCustomization" + localclientnum, {#outfit_index:outfit_index, #event_name:"changeOutfit"});
	}
}

/*
	Name: function_36962bc4
	Namespace: frontend
	Checksum: 0x50083B57
	Offset: 0xEF90
	Size: 0xDC
	Parameters: 3
	Flags: None
*/
function function_36962bc4(localclientnum, menu_name, state)
{
	self notify("6b8c56d6c74e8b49");
	self endon("6b8c56d6c74e8b49");
	var_d0b01271 = namespace_d5a9ff55::function_daadc836(state, menu_name);
	[[ var_d0b01271 ]]->show_model();
	camera_ent = struct::get(#"hash_434d5a5ec5b33e52");
	playmaincamxcam(menu_name, #"hash_a60d420d12bab09", 0, "", "", camera_ent.origin, camera_ent.angles);
}

/*
	Name: function_8ad37038
	Namespace: frontend
	Checksum: 0x33A8902
	Offset: 0xF078
	Size: 0x144
	Parameters: 3
	Flags: None
*/
function function_8ad37038(localclientnum, menu_name, state)
{
	self notify("70dffbae268c4e6");
	self endon("70dffbae268c4e6");
	var_d0b01271 = namespace_d5a9ff55::function_daadc836(menu_name, localclientnum);
	if(isdefined(state))
	{
		[[ var_d0b01271 ]]->set_character_index(state);
		level notify("updateSpecialistCustomization" + localclientnum, {#mode:3, #character_index:state, #event_name:"changeHero"});
	}
	[[ var_d0b01271 ]]->show_model();
	camera_ent = struct::get(#"hash_434d5a5ec5b33e52");
	playmaincamxcam(localclientnum, #"hash_42064e95d20cee44", 0, "", "", camera_ent.origin, camera_ent.angles);
}

/*
	Name: function_bc98f036
	Namespace: frontend
	Checksum: 0xE767B6A8
	Offset: 0xF1C8
	Size: 0x8C
	Parameters: 3
	Flags: None
*/
function function_bc98f036(localclientnum, menu_name, state)
{
	camera_ent = struct::get(#"hash_434d5a5ec5b33e52");
	playmaincamxcam(state, #"hash_a60d420d12bab09", 0, "", "", camera_ent.origin, camera_ent.angles);
}

/*
	Name: function_73b8462a
	Namespace: frontend
	Checksum: 0x8DBE8D29
	Offset: 0xF260
	Size: 0x234
	Parameters: 3
	Flags: None
*/
function function_73b8462a(localclientnum, menu_name, state)
{
	var_d0b01271 = namespace_d5a9ff55::function_daadc836(menu_name, localclientnum);
	if(state === "character")
	{
		[[ var_d0b01271 ]]->show_model();
	}
	else
	{
		[[ var_d0b01271 ]]->hide_model();
	}
	session_mode = currentsessionmode();
	if(session_mode == 4)
	{
		return;
	}
	character_index = getequippedheroindex(localclientnum, session_mode);
	if(isdefined(character_index))
	{
		fields = getcharacterfields(character_index, session_mode);
	}
	if(isdefined(fields) && isdefined(fields.var_47c73c9d))
	{
		level.var_c8fac6ea = fields.var_47c73c9d;
	}
	else
	{
		if(currentsessionmode() == 0)
		{
			level.var_c8fac6ea = "scene_frontend_aar";
		}
		else
		{
			if(currentsessionmode() == 3)
			{
				level.var_c8fac6ea = "scene_frontend_aar";
			}
			else
			{
				if(util::is_arena_lobby())
				{
					level.var_c8fac6ea = "scene_frontend_aar";
				}
				else
				{
					level.var_c8fac6ea = "scene_frontend_aar";
				}
			}
		}
	}
	if(!level scene::is_playing(level.var_c8fac6ea))
	{
		[[ var_d0b01271 ]]->set_character_mode(session_mode);
		[[ var_d0b01271 ]]->set_character_index(character_index);
		[[ var_d0b01271 ]]->function_77e3be08();
		[[ var_d0b01271 ]]->update(undefined);
		level thread scene::play(level.var_c8fac6ea);
	}
}

/*
	Name: function_48fb04a7
	Namespace: frontend
	Checksum: 0x9F28E617
	Offset: 0xF4A0
	Size: 0x4E
	Parameters: 2
	Flags: None
*/
function function_48fb04a7(localclientnum, menu_name)
{
	if(isdefined(level.var_c8fac6ea))
	{
		level thread scene::stop(level.var_c8fac6ea);
		level.var_c8fac6ea = undefined;
	}
}

/*
	Name: function_3dde055b
	Namespace: frontend
	Checksum: 0x6CDDD084
	Offset: 0xF4F8
	Size: 0x36
	Parameters: 2
	Flags: None
*/
function function_3dde055b(localclientnum, new_menu)
{
	var_d0b01271 = namespace_d5a9ff55::function_daadc836("MPSpecialistHUBPreviewMoment", new_menu);
}

/*
	Name: function_c4db2740
	Namespace: frontend
	Checksum: 0xF78BADE4
	Offset: 0xF538
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function function_c4db2740(localclientnum, var_ba5302c4)
{
}

/*
	Name: function_fad4ce33
	Namespace: frontend
	Checksum: 0xF7C70A3E
	Offset: 0xF558
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function function_fad4ce33(localclientnum, entities)
{
}

/*
	Name: function_c5cbf7d6
	Namespace: frontend
	Checksum: 0x2B641485
	Offset: 0xF578
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function function_c5cbf7d6(localclientnum, entities)
{
}

