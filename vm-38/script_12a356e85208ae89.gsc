#using script_18910f59cc847b42;
#using script_30c7fb449869910;
#using script_3314b730521b9666;
#using script_38635d174016f682;
#using script_42cbbdcd1e160063;
#using script_64e5d3ad71ce8140;
#using script_67049b48b589d81;
#using script_6b71c9befed901f2;
#using script_71603a58e2da0698;
#using script_75c3996cce8959f7;
#using script_76abb7986de59601;
#using script_77163d5a569e2071;
#using script_771f5bff431d8d57;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\spawner_shared.csc;
#using scripts\core_common\spawning_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace doa_wild;

/*
	Name: function_9ee9aca9
	Namespace: doa_wild
	Checksum: 0x683FAFED
	Offset: 0x1C0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9ee9aca9()
{
	level notify(194746630);
}

/*
	Name: init
	Namespace: doa_wild
	Checksum: 0xE0EF36A9
	Offset: 0x1E0
	Size: 0x254
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "setWild", 1, 2, "int", &function_cb179d87, 0, 0);
	clientfield::register("world", "setWildTOD", 1, 3, "int", &settod, 0, 0);
	clientfield::register("world", "setWildSection", 1, 3, "int", &function_68800b79, 0, 0);
	clientfield::register("world", "wilddeactivated", 1, 1, "counter", &function_e961485f, 0, 0);
	var_581c8f9a = struct::get_array("doa_wild");
	level.doa.var_581c8f9a = [];
	foreach(wild in var_581c8f9a)
	{
		var_f784a248 = spawnstruct();
		var_f784a248.name = wild.script_noteworthy;
		var_f784a248.id = int(wild.script_int);
		level.doa.var_581c8f9a[level.doa.var_581c8f9a.size] = var_f784a248;
	}
	function_32d5e898();
}

/*
	Name: function_32d5e898
	Namespace: doa_wild
	Checksum: 0xE4E088C2
	Offset: 0x440
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function function_32d5e898(localclientnum)
{
	level.doa.var_47dcd1f = undefined;
	level.doa.var_f9d8fba5 = undefined;
	level.doa.var_7c19cda1 = undefined;
	if(isdefined(level.doa.var_e2a9584a))
	{
		stopradiantexploder(localclientnum, level.doa.var_e2a9584a);
		level.doa.var_e2a9584a = undefined;
	}
}

/*
	Name: function_e961485f
	Namespace: doa_wild
	Checksum: 0x47E5D4F
	Offset: 0x4D8
	Size: 0x54
	Parameters: 7
	Flags: Linked
*/
function function_e961485f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	function_32d5e898(bwastimejump);
}

/*
	Name: function_cb179d87
	Namespace: doa_wild
	Checksum: 0xE6EE4851
	Offset: 0x538
	Size: 0xF0
	Parameters: 7
	Flags: Linked
*/
function function_cb179d87(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level.doa.var_47dcd1f = undefined;
	foreach(wild in level.doa.var_581c8f9a)
	{
		if(wild.id == bwastimejump)
		{
			level.doa.var_47dcd1f = wild;
			return;
		}
	}
}

/*
	Name: function_68800b79
	Namespace: doa_wild
	Checksum: 0x57841D66
	Offset: 0x630
	Size: 0x56
	Parameters: 7
	Flags: Linked
*/
function function_68800b79(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level.doa.var_f9d8fba5 = bwastimejump + 1;
}

/*
	Name: settod
	Namespace: doa_wild
	Checksum: 0xC51A9DB
	Offset: 0x690
	Size: 0x35C
	Parameters: 7
	Flags: Linked
*/
function settod(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(level.doa.var_e2a9584a))
	{
		stopradiantexploder(fieldname, level.doa.var_e2a9584a);
		level.doa.var_e2a9584a = undefined;
	}
	if(!isdefined(level.doa.var_47dcd1f))
	{
		return;
	}
	level.doa.var_7c19cda1 = "morning";
	switch(bwastimejump)
	{
		case 0:
		{
			level.doa.var_7c19cda1 = "morning";
			setworldfogactivebank(fieldname, 1);
			break;
		}
		case 1:
		{
			level.doa.var_7c19cda1 = "noon";
			setworldfogactivebank(fieldname, 2);
			break;
		}
		case 2:
		{
			level.doa.var_7c19cda1 = "dusk";
			setworldfogactivebank(fieldname, 4);
			break;
		}
		case 3:
		{
			level.doa.var_7c19cda1 = "night";
			setworldfogactivebank(fieldname, 8);
			break;
		}
		default:
		{
			level.doa.var_7c19cda1 = "morning";
			setworldfogactivebank(fieldname, 1);
			break;
		}
	}
	/#
		namespace_1e25ad94::debugmsg((("" + level.doa.var_47dcd1f.name) + "") + level.doa.var_7c19cda1);
	#/
	level.doa.var_e2a9584a = (((("fxexp_" + level.doa.var_47dcd1f.name) + "_section_") + level.doa.var_f9d8fba5) + "_") + level.doa.var_7c19cda1;
	/#
		namespace_1e25ad94::debugmsg((("" + level.doa.var_e2a9584a) + "") + fieldname);
	#/
	playradiantexploder(fieldname, level.doa.var_e2a9584a);
}

