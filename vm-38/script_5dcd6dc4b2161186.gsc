#using script_13114d8a31c6152a;
#using scripts\core_common\values_shared.gsc;
#using script_4937c6974f43bb71;
#using script_7d0013bbc05623b9;
#using script_35ae72be7b4fec10;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;

#namespace namespace_a9a79253;

/*
	Name: function_5e5a5e79
	Namespace: namespace_a9a79253
	Checksum: 0xD9D55CA8
	Offset: 0x158
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5e5a5e79()
{
	level notify(1951661987);
}

/*
	Name: function_97c69304
	Namespace: namespace_a9a79253
	Checksum: 0xE9DBE2F6
	Offset: 0x178
	Size: 0x414
	Parameters: 6
	Flags: None
*/
function function_97c69304(var_e1ab1198, var_ad825676, var_4d757ace, var_34c6a562, var_5d0591d, var_ec9a3f05)
{
	if(!isdefined(var_ad825676))
	{
		var_ad825676 = 1;
	}
	if(!isdefined(var_4d757ace))
	{
		var_4d757ace = 2;
	}
	if(!isdefined(var_ec9a3f05))
	{
		var_ec9a3f05 = 0;
	}
	if(!isdefined(var_34c6a562))
	{
		var_34c6a562 = #"hash_7cf7750cf3228d3f";
	}
	if(!isdefined(var_5d0591d))
	{
		var_5d0591d = #"hash_5f8dea2ec57cdca9";
	}
	if(!namespace_61e6d095::exists(#"hash_495fb25cf24868b4"))
	{
		namespace_61e6d095::create(#"hash_495fb25cf24868b4", #"hash_3ddadc19cc3c44ad");
	}
	self val::set(#"hash_495fb25cf24868b4", "show_crosshair", 0);
	self val::set(#"hash_495fb25cf24868b4", "freezecontrols_allowlook", 1);
	self val::set(#"hash_495fb25cf24868b4", "disable_weapon_cycling", 1);
	if(var_ad825676)
	{
		prompts::function_86eedc();
	}
	var_6fdd3a3a = getscriptbundle(var_e1ab1198);
	/#
		assert(isdefined(var_6fdd3a3a), "" + var_e1ab1198);
	#/
	len = var_6fdd3a3a.var_df2d0a90.size;
	namespace_61e6d095::function_9ade1d9b(#"hash_495fb25cf24868b4", "priority", 1);
	namespace_61e6d095::set_state(#"hash_495fb25cf24868b4", var_ec9a3f05);
	line_num = 0;
	for(i = line_num; i < len; i++)
	{
		line_num = i + 1;
		var_c1deb575 = var_6fdd3a3a.var_df2d0a90[i];
		namespace_61e6d095::function_f2a9266(#"hash_495fb25cf24868b4", line_num, "index", i);
		namespace_61e6d095::function_f2a9266(#"hash_495fb25cf24868b4", line_num, "translate", -1);
		namespace_61e6d095::function_f2a9266(#"hash_495fb25cf24868b4", line_num, "text_untranslated", var_c1deb575.var_f49bdf40);
		namespace_61e6d095::function_f2a9266(#"hash_495fb25cf24868b4", line_num, "text_translated", var_c1deb575.var_c9d25687);
	}
	namespace_82bfe441::fade(1, "FadeImmediate");
	namespace_61e6d095::function_9ade1d9b(#"hash_495fb25cf24868b4", "image", var_6fdd3a3a.var_85ca818b);
	self playsound(var_34c6a562);
	wait(var_4d757ace);
	self thread function_50f1b098(len);
	namespace_c8e236da::function_ebf737f8(#"hash_1aefb4de625039be");
	self thread function_f432e1fd(var_5d0591d);
}

/*
	Name: function_50f1b098
	Namespace: namespace_a9a79253
	Checksum: 0x1358158D
	Offset: 0x598
	Size: 0x8C
	Parameters: 1
	Flags: Private
*/
function private function_50f1b098(var_64de02b5)
{
	self endon(#"note_display_closed");
	linenum = 0;
	for(i = linenum; i < var_64de02b5; i++)
	{
		linenum = i + 1;
		namespace_61e6d095::function_f2a9266(#"hash_495fb25cf24868b4", linenum, "translate", 1);
	}
}

/*
	Name: function_f432e1fd
	Namespace: namespace_a9a79253
	Checksum: 0x4A636838
	Offset: 0x630
	Size: 0x5C
	Parameters: 1
	Flags: Private
*/
function private function_f432e1fd(var_5d0591d)
{
	self endon(#"note_display_closed");
	self namespace_61e6d095::function_b0bad5ff("note_display_closed", undefined, 1);
	function_62296e85(var_5d0591d);
}

/*
	Name: function_62296e85
	Namespace: namespace_a9a79253
	Checksum: 0xCAC54589
	Offset: 0x698
	Size: 0x116
	Parameters: 1
	Flags: None
*/
function function_62296e85(var_5d0591d)
{
	self playsound(var_5d0591d);
	prompts::function_d675f5a4();
	namespace_c8e236da::function_c27f93d5();
	namespace_61e6d095::function_9ade1d9b(#"hash_495fb25cf24868b4", "priority", 0);
	if(namespace_61e6d095::exists(#"hash_495fb25cf24868b4"))
	{
		namespace_61e6d095::remove(#"hash_495fb25cf24868b4");
	}
	namespace_82bfe441::fade(0, "FadeImmediate");
	val::reset_all(#"hash_495fb25cf24868b4");
	self function_e0c7d69(1);
	self notify(#"note_display_closed");
}

