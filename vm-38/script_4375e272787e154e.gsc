#using script_84f5590d2ac48f8;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\music_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\map.csc;

#namespace namespace_66d6aa44;

/*
	Name: function_1b1bcd7e
	Namespace: namespace_66d6aa44
	Checksum: 0xA21F2837
	Offset: 0x128
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1b1bcd7e()
{
	level notify(-1706699686);
}

/*
	Name: codecallback_preinitialization
	Namespace: namespace_66d6aa44
	Checksum: 0xE1806C8D
	Offset: 0x148
	Size: 0xE0
	Parameters: 1
	Flags: Event
*/
event codecallback_preinitialization(eventstruct)
{
	clientfield::register("world", "hide_intro_models", 1, 1, "int", &hide_intro_models, 0, 0);
	clientfield::register_clientuimodel("closeLoadingMovie", #"hash_414f1dabe0f0c1a5", #"closeloadingmovie", 1, 1, "int", undefined, 0, 0);
	var_43a36c6f = function_6681bbf6();
	function_e526b83(var_43a36c6f);
	level.var_5337a48a = [];
}

/*
	Name: function_9347830c
	Namespace: namespace_66d6aa44
	Checksum: 0xEF5CCCA6
	Offset: 0x230
	Size: 0x24
	Parameters: 1
	Flags: Event
*/
event function_9347830c(eventstruct)
{
	full_screen_movie::register("full_screen_movie");
}

/*
	Name: function_6681bbf6
	Namespace: namespace_66d6aa44
	Checksum: 0x5CF22620
	Offset: 0x260
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function function_6681bbf6()
{
	var_65792f8b = map::get_script_bundle();
	if(!isdefined(var_65792f8b) || !isdefined(var_65792f8b.var_f9631c9d))
	{
		return undefined;
	}
	return getscriptbundle(var_65792f8b.var_f9631c9d);
}

/*
	Name: function_b69a4f47
	Namespace: namespace_66d6aa44
	Checksum: 0xC1A591AA
	Offset: 0x2C8
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function function_b69a4f47(var_2f252ea4)
{
	clientfield::register("toplayer", var_2f252ea4.uniqueid, 1, 1, "int", &function_e7722af4, 1, 0);
	level.var_5337a48a[var_2f252ea4.uniqueid] = var_2f252ea4;
}

/*
	Name: function_e7722af4
	Namespace: namespace_66d6aa44
	Checksum: 0x28E654A6
	Offset: 0x338
	Size: 0x17C
	Parameters: 7
	Flags: Linked
*/
function function_e7722af4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	/#
		println("" + bwastimejump);
	#/
	postfxbundle = getscriptbundle(bwastimejump);
	if(!isdefined(postfxbundle))
	{
		return;
	}
	if(!isdefined(postfxbundle.var_aaf5aae7))
	{
		return;
	}
	if(fieldname > 0)
	{
		if(!function_148ccc79(binitialsnap, postfxbundle.var_aaf5aae7))
		{
			/#
				println("" + postfxbundle.var_aaf5aae7);
			#/
			function_a837926b(binitialsnap, postfxbundle.var_aaf5aae7);
		}
	}
	else if(function_148ccc79(binitialsnap, postfxbundle.var_aaf5aae7))
	{
		/#
			println("" + postfxbundle.var_aaf5aae7);
		#/
		codestoppostfxbundlelocal(binitialsnap, postfxbundle.var_aaf5aae7);
	}
}

/*
	Name: function_e526b83
	Namespace: namespace_66d6aa44
	Checksum: 0x1F2659A
	Offset: 0x4C0
	Size: 0xF0
	Parameters: 1
	Flags: Linked
*/
function function_e526b83(var_43a36c6f)
{
	if(!isdefined(var_43a36c6f.var_96c3f045))
	{
		return;
	}
	var_20314119 = getscriptbundlelist(var_43a36c6f.var_96c3f045);
	if(!isdefined(var_20314119))
	{
		return;
	}
	foreach(var_39796f0f in var_20314119)
	{
		var_c5470032 = getscriptbundle(var_39796f0f);
		function_b69a4f47(var_c5470032);
	}
}

/*
	Name: hide_intro_models
	Namespace: namespace_66d6aa44
	Checksum: 0x221A52E1
	Offset: 0x5B8
	Size: 0x1E4
	Parameters: 7
	Flags: Linked
*/
function hide_intro_models(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_6d963dbf = findstaticmodelindexarray("intro_scene_models");
	if(bwastimejump)
	{
		if(sessionmodeismultiplayergame())
		{
			audio::snd_set_snapshot("mpl_intro_igc");
		}
		foreach(n_index in var_6d963dbf)
		{
			hidestaticmodel(n_index);
		}
	}
	else
	{
		foreach(n_index in var_6d963dbf)
		{
			unhidestaticmodel(n_index);
		}
		if(sessionmodeismultiplayergame())
		{
			setpbgactivebank(fieldname, 1);
			setexposureactivebank(fieldname, 1);
		}
	}
}

