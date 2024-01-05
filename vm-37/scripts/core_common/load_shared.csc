#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using script_18b9d0e77614c97;
#using scripts\core_common\dev_shared.csc;
#using scripts\core_common\activecamo_shared.csc;
#using scripts\core_common\delete.csc;

#namespace load;

/*
	Name: __init__system__
	Namespace: load
	Checksum: 0x85CB5130
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"load", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: main
	Namespace: load
	Checksum: 0xCDB3BC7
	Offset: 0x100
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
	Checksum: 0xC4A992A3
	Offset: 0x140
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
	Checksum: 0x27BC1A4A
	Offset: 0x1D8
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
	Checksum: 0x1E97B5CA
	Offset: 0x218
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
	Checksum: 0x16E4BFEB
	Offset: 0x2D8
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

