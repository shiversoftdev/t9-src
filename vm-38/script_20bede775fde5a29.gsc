#using scripts\core_common\util_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\character_customization.csc;
#using scripts\core_common\array_shared.csc;

#namespace display_transition;

/*
	Name: function_83c029c4
	Namespace: display_transition
	Checksum: 0x5353928E
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_83c029c4()
{
	level notify(-1633640491);
}

/*
	Name: init_shared
	Namespace: display_transition
	Checksum: 0x315F3D6A
	Offset: 0x150
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	registerclientfields();
	level thread function_57e7e78e();
}

/*
	Name: registerclientfields
	Namespace: display_transition
	Checksum: 0xE82319B2
	Offset: 0x188
	Size: 0xB4
	Parameters: 0
	Flags: Private
*/
function private registerclientfields()
{
	if(sessionmodeiswarzonegame())
	{
		clientfield::register("toplayer", "eliminated_postfx", 12000, 1, "int", &function_c73ec9a, 0, 0);
	}
	if(sessionmodeismultiplayergame())
	{
		clientfield::register("world", "top_squad_begin", 1, 1, "int", &function_7adce590, 0, 0);
	}
}

/*
	Name: function_c73ec9a
	Namespace: display_transition
	Checksum: 0xC8D6C65A
	Offset: 0x248
	Size: 0xD4
	Parameters: 7
	Flags: None
*/
function function_c73ec9a(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	isplaying = postfx::function_556665f2(#"hash_1e4c3120a3e08628");
	if(bwastimejump == 1)
	{
		if(!isplaying)
		{
			self codeplaypostfxbundle(#"hash_1e4c3120a3e08628");
		}
	}
	else if(bwastimejump == 0)
	{
		if(isplaying)
		{
			self postfx::stoppostfxbundle(#"hash_1e4c3120a3e08628");
		}
	}
}

/*
	Name: function_57e7e78e
	Namespace: display_transition
	Checksum: 0x9A07A0EB
	Offset: 0x328
	Size: 0x1AC
	Parameters: 0
	Flags: None
*/
function function_57e7e78e()
{
	level endon(#"disconnect", #"game_ended");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_15feb9f40beffb1");
		xuids = associativearray();
		xuids[#"hash_71fa255feba2b605"] = util::function_48e57e36(waitresult.var_e278dfff);
		xuids[#"hash_71fa225feba2b0ec"] = util::function_48e57e36(waitresult.var_849e244b);
		xuids[#"hash_71fa235feba2b29f"] = util::function_48e57e36(waitresult.var_76e408d7);
		xuids[#"hash_71fa205feba2ad86"] = util::function_48e57e36(waitresult.var_a926ed5c);
		xuids[#"hash_71fa215feba2af39"] = util::function_48e57e36(waitresult.var_6f687a0c);
		xuids[#"hash_71fa1e5feba2aa20"] = util::function_48e57e36(waitresult.var_61a2de81);
		level.var_3e8dfeeb = xuids;
	}
}

/*
	Name: function_d4f9edc8
	Namespace: display_transition
	Checksum: 0x8D419C2F
	Offset: 0x4E0
	Size: 0x9A
	Parameters: 2
	Flags: Private
*/
function private function_d4f9edc8(character_index, session_mode)
{
	if(!function_f4bf7e3f(character_index, session_mode))
	{
		return false;
	}
	var_4fa755f8 = getcharacterfields(character_index, session_mode);
	if(isdefined(var_4fa755f8) && isdefined(var_4fa755f8.var_b12a801f) && !getdvarint(var_4fa755f8.var_b12a801f, 0))
	{
		return false;
	}
	return true;
}

/*
	Name: function_707c958c
	Namespace: display_transition
	Checksum: 0x7A308503
	Offset: 0x588
	Size: 0xB8
	Parameters: 3
	Flags: Private
*/
function private function_707c958c(local_client_num, var_23904c1d, target_name)
{
	if(isdefined(var_23904c1d))
	{
		model = util::spawn_model(local_client_num, "tag_origin");
		model.targetname = target_name;
		var_d0b01271 = character_customization::function_dd295310(model, local_client_num, 0);
		[[ var_d0b01271 ]]->function_15a8906a(var_23904c1d);
		[[ var_d0b01271 ]]->update();
		[[ var_d0b01271 ]]->show_model();
		return var_d0b01271;
	}
	return undefined;
}

/*
	Name: function_c4ede3a8
	Namespace: display_transition
	Checksum: 0xD42CE63F
	Offset: 0x648
	Size: 0x102
	Parameters: 3
	Flags: Private
*/
function private function_c4ede3a8(local_client_num, target_name, session_mode)
{
	var_a2865de6 = getplayerroletemplatecount(session_mode);
	character_index = randomint(var_a2865de6);
	var_f8bfe003 = function_d4f9edc8(character_index, session_mode);
	while(!var_f8bfe003)
	{
		character_index = randomint(var_a2865de6);
		var_f8bfe003 = function_d4f9edc8(character_index, session_mode);
	}
	var_23904c1d = character_customization::function_3f5625f1(session_mode, character_index);
	custom_character = function_707c958c(local_client_num, var_23904c1d, target_name);
	return custom_character;
}

/*
	Name: function_1b0611e0
	Namespace: display_transition
	Checksum: 0xAF0C17CA
	Offset: 0x758
	Size: 0x62
	Parameters: 3
	Flags: Private
*/
function private function_1b0611e0(local_client_num, xuid, target_name)
{
	var_23904c1d = getcharactercustomizationforxuid(local_client_num, xuid);
	custom_character = function_707c958c(local_client_num, var_23904c1d, target_name);
	return custom_character;
}

/*
	Name: function_4259f9f8
	Namespace: display_transition
	Checksum: 0x6CC01F22
	Offset: 0x7C8
	Size: 0x68
	Parameters: 2
	Flags: Private
*/
function private function_4259f9f8(local_client_num, target_name)
{
	model = util::spawn_model(local_client_num, "tag_origin");
	model.targetname = target_name;
	model useanimtree("all_player");
	return model;
}

/*
	Name: function_7adce590
	Namespace: display_transition
	Checksum: 0xDF36E7E9
	Offset: 0x838
	Size: 0x25C
	Parameters: 7
	Flags: None
*/
function function_7adce590(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_ec067cd3 = array();
	if(isdefined(level.var_3e8dfeeb))
	{
		foreach(key, xuid in level.var_3e8dfeeb)
		{
			if(xuid != 0)
			{
				custom_character = function_1b0611e0(bwastimejump, xuid, "top_squad_" + key);
				array::add(var_ec067cd3, [[ custom_character ]]->function_217b10ed());
				continue;
			}
			if(getdvarint(#"hash_6d98441d0465c104", 0))
			{
				/#
					custom_character = function_c4ede3a8(bwastimejump, "" + key, 1);
					array::add(var_ec067cd3, [[ custom_character ]]->function_217b10ed());
				#/
				continue;
			}
			fake_model = function_4259f9f8(bwastimejump, "top_squad_ " + key);
			array::add(var_ec067cd3, fake_model);
		}
		cam_model = function_4259f9f8(bwastimejump, "top_squad_cam");
		array::add(var_ec067cd3, cam_model);
	}
	level scene::play("cin_mp_outro", var_ec067cd3);
}

