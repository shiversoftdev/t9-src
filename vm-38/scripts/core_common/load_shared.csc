#using script_158d50d476435605;
#using script_18b9d0e77614c97;
#using scripts\core_common\delete.csc;
#using scripts\core_common\dev_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace load_shared;

/*
	Name: function_1c6cf0de
	Namespace: load_shared
	Checksum: 0xA8237F0F
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1c6cf0de()
{
	level notify(186489250);
}

#namespace load;

/*
	Name: function_89f2df9
	Namespace: load
	Checksum: 0x8781CE26
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"load", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: main
	Namespace: load
	Checksum: 0x291E7F35
	Offset: 0x120
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function main()
{
	/#
		assert(isdefined(level.var_f18a6bd6));
	#/
	[[level.var_f18a6bd6]]();
}

/*
	Name: function_70a657d8
	Namespace: load
	Checksum: 0xC69033F6
	Offset: 0x160
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(sessionmodeiscampaigngame())
	{
		level.game_mode_suffix = "_cp";
	}
	else
	{
		if(sessionmodeiszombiesgame())
		{
			level.game_mode_suffix = "_zm";
		}
		else
		{
			level.game_mode_suffix = "_mp";
		}
	}
	/#
		level thread first_frame();
	#/
	apply_mature_filter();
}

/*
	Name: first_frame
	Namespace: load
	Checksum: 0x2989AD46
	Offset: 0x1F8
	Size: 0x38
	Parameters: 0
	Flags: None
*/
function first_frame()
{
	/#
		level.first_frame = 1;
		waitframe(1);
		level.first_frame = undefined;
		level.var_22944a63 = 1;
	#/
}

/*
	Name: apply_mature_filter
	Namespace: load
	Checksum: 0xB2F16B99
	Offset: 0x238
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function apply_mature_filter()
{
	if(!util::is_mature())
	{
		a_mature_models = findstaticmodelindexarray("mature_content");
		foreach(model in a_mature_models)
		{
			hidestaticmodel(model);
		}
	}
}

/*
	Name: art_review
	Namespace: load
	Checksum: 0x3A6DEC54
	Offset: 0x2F8
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function art_review()
{
	if(getdvarint(#"art_review", 0))
	{
		level waittill(#"forever");
	}
}

