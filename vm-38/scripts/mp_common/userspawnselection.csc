#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace userspawnselection;

/*
	Name: function_e421708c
	Namespace: userspawnselection
	Checksum: 0x6CEB4E5C
	Offset: 0x178
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e421708c()
{
	level notify(-2073698939);
}

/*
	Name: __init__system__
	Namespace: userspawnselection
	Checksum: 0xD923DD3A
	Offset: 0x198
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"userspawnselection", &function_70a657d8, undefined, &setupspawngroups, undefined);
}

/*
	Name: function_70a657d8
	Namespace: userspawnselection
	Checksum: 0x48F76181
	Offset: 0x1E8
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.next_spawngroup_index = 0;
	level.spawngroups = [];
	level.useteamspecificforwardspawns = getgametypesetting(#"forwardspawnteamspecificspawns");
	setupclientfields();
}

/*
	Name: setupclientfields
	Namespace: userspawnselection
	Checksum: 0x8781C65A
	Offset: 0x248
	Size: 0x304
	Parameters: 0
	Flags: Linked
*/
function setupclientfields()
{
	for(index = 0; index < 20; index++)
	{
		basename = ("spawngroupStatus_" + index) + "_";
		clientfield::function_5b7d846d(basename + "visStatus", #"hash_5e10ae8c08eeb04b", [1:#"visstatus", 0:hash((isdefined(index) ? "" + index : ""))], 1, 1, "int", undefined, 0, 1);
		clientfield::function_5b7d846d(basename + "useStatus", #"hash_5e10ae8c08eeb04b", [1:#"usestatus", 0:hash((isdefined(index) ? "" + index : ""))], 1, 1, "int", undefined, 0, 1);
		clientfield::function_5b7d846d(basename + "team", #"hash_5e10ae8c08eeb04b", [1:#"team", 0:hash((isdefined(index) ? "" + index : ""))], 1, 2, "int", undefined, 0, 1);
	}
	clientfield::register_clientuimodel("hudItems.showSpawnSelect", #"hud_items", #"showspawnselect", 1, 1, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.killcamActive", #"hud_items", #"hash_2f977a17b0f526fa", 1, 1, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hideautospawnoption", #"hash_5e10ae8c08eeb04b", #"hideautospawnoption", 1, 1, "int", undefined, 0, 0);
}

/*
	Name: setupstaticmodelfieldsforspawngroup
	Namespace: userspawnselection
	Checksum: 0x6C00F114
	Offset: 0x558
	Size: 0x1EC
	Parameters: 1
	Flags: Linked, Private
*/
function private setupstaticmodelfieldsforspawngroup(spawngroup)
{
	var_1585eabf = getuimodel(function_5f72e972(#"hash_5e10ae8c08eeb04b"), (isdefined(spawngroup.uiindex) ? "" + spawngroup.uiindex : ""));
	spawngroupname = "";
	if(isdefined(spawngroup.ui_label))
	{
		spawngroupname = spawngroup.ui_label;
	}
	setuimodelvalue(getuimodel(var_1585eabf, "regionName"), spawngroupname);
	setuimodelvalue(getuimodel(var_1585eabf, "team"), spawngroup.script_team);
	var_1de19812 = getuimodel(var_1585eabf, "origin");
	setuimodelvalue(getuimodel(var_1de19812, "x"), spawngroup.origin[0]);
	setuimodelvalue(getuimodel(var_1de19812, "y"), spawngroup.origin[1]);
	setuimodelvalue(getuimodel(var_1de19812, "z"), spawngroup.origin[2]);
}

/*
	Name: function_bc7ec9a1
	Namespace: userspawnselection
	Checksum: 0x91CD5EA6
	Offset: 0x750
	Size: 0x128
	Parameters: 1
	Flags: Linked
*/
function function_bc7ec9a1(spawngroup)
{
	spawns = struct::get_array(spawngroup.target, "groupname");
	var_164af2a6 = 0;
	var_98dd92c = 0;
	var_fbc43d99 = 0;
	var_4f210458 = 0;
	foreach(spawn in spawns)
	{
		var_164af2a6 = var_164af2a6 + spawn.origin.x;
		var_98dd92c = var_98dd92c + spawn.origin.y;
		var_fbc43d99 = var_fbc43d99 + spawn.origin.z;
	}
	return var_98dd92c;
}

/*
	Name: setupspawngroup
	Namespace: userspawnselection
	Checksum: 0xD278A38D
	Offset: 0x880
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function setupspawngroup(spawngroup)
{
	spawngroup.uiindex = level.next_spawngroup_index;
	level.next_spawngroup_index++;
	level.spawngroups[spawngroup.uiindex] = spawngroup;
	function_bc7ec9a1(spawngroup);
	setupstaticmodelfieldsforspawngroup(spawngroup);
}

/*
	Name: setupspawngroups
	Namespace: userspawnselection
	Checksum: 0x314B29A9
	Offset: 0x8F8
	Size: 0xE8
	Parameters: 1
	Flags: Linked
*/
function setupspawngroups(localclientnum)
{
	spawngroups = struct::get_array("spawn_group_marker", "targetname");
	if(!isdefined(spawngroups))
	{
		return;
	}
	spawngroupssorted = array::get_all_closest((0, 0, 0), spawngroups);
	foreach(spawngroup in spawngroupssorted)
	{
		setupspawngroup(spawngroup);
	}
}

