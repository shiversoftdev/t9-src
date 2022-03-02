#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace aat_shared;

/*
	Name: function_e1f62707
	Namespace: aat_shared
	Checksum: 0xF07AE064
	Offset: 0x168
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e1f62707()
{
	level notify(833952125);
}

#namespace aat;

/*
	Name: function_89f2df9
	Namespace: aat
	Checksum: 0xE82F5C6
	Offset: 0x188
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"aat", &function_70a657d8, &finalize_clientfields, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: aat
	Checksum: 0x4198F73A
	Offset: 0x1E0
	Size: 0xE4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "rob_ammo_mod_ready", 1, 1, "int", &function_4f950d48, 0, 0);
	clientfield::function_a8bbc967("hud_items.gibDismembermentType", #"hud_items", #"hash_49b325aa4c9519d", 16000, 3, "int", undefined, 0, 0);
	level.aat_default_info_name = "none";
	level.aat_default_info_icon = "blacktransparent";
	register("none", level.aat_default_info_name, level.aat_default_info_icon);
}

/*
	Name: function_2b3bcce0
	Namespace: aat
	Checksum: 0xA0B2429
	Offset: 0x2D0
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function function_2b3bcce0()
{
	if(!isdefined(level.var_e44e90d6))
	{
		return;
	}
	foreach(call in level.var_e44e90d6)
	{
		[[call]]();
	}
}

/*
	Name: function_4f950d48
	Namespace: aat
	Checksum: 0x25340EA
	Offset: 0x368
	Size: 0x84
	Parameters: 7
	Flags: Linked
*/
function function_4f950d48(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self function_bf9d3071("rob_ammo_mod_ready_light");
	}
	else
	{
		self function_5d482e78("rob_ammo_mod_ready_light");
	}
}

/*
	Name: function_571fceb
	Namespace: aat
	Checksum: 0x5A517D37
	Offset: 0x3F8
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function function_571fceb(aat_name, main)
{
	if(!isdefined(level.var_e44e90d6))
	{
		level.var_e44e90d6 = [];
	}
	/#
		if(isdefined(level.var_e44e90d6[aat_name]))
		{
			println(("" + aat_name) + "");
		}
	#/
	level.var_e44e90d6[aat_name] = main;
}

/*
	Name: register
	Namespace: aat
	Checksum: 0x1C067AC2
	Offset: 0x488
	Size: 0x17A
	Parameters: 3
	Flags: Linked
*/
function register(name, localized_string, icon)
{
	if(!isdefined(level.aat))
	{
		level.aat = [];
	}
	/#
		assert(!is_false(level.aat_initializing), "");
	#/
	/#
		assert(isdefined(name), "");
	#/
	/#
		assert(!isdefined(level.aat[name]), ("" + name) + "");
	#/
	/#
		assert(isdefined(localized_string), "");
	#/
	/#
		assert(isdefined(icon), "");
	#/
	level.aat[name] = spawnstruct();
	level.aat[name].name = name;
	level.aat[name].localized_string = localized_string;
	level.aat[name].icon = icon;
}

/*
	Name: aat_hud_manager
	Namespace: aat
	Checksum: 0x7E2C1461
	Offset: 0x610
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function aat_hud_manager(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(level.update_aat_hud))
	{
		[[level.update_aat_hud]](localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	}
	else
	{
		update_aat_hud(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	}
}

/*
	Name: finalize_clientfields
	Namespace: aat
	Checksum: 0xA6C8604B
	Offset: 0x6B0
	Size: 0x188
	Parameters: 0
	Flags: Linked
*/
function finalize_clientfields()
{
	/#
		println("");
	#/
	if(level.aat.size > 1)
	{
		array::alphabetize(level.aat);
		i = 0;
		foreach(aat in level.aat)
		{
			aat.n_index = i;
			i++;
			/#
				println("" + aat.name);
			#/
		}
		n_bits = getminbitcountfornum(level.aat.size - 1);
		clientfield::register("toplayer", "aat_current", 1, n_bits, "int", &aat_hud_manager, 0, 1);
	}
	level.aat_initializing = 0;
}

/*
	Name: function_d1852e75
	Namespace: aat
	Checksum: 0x1ED0BB79
	Offset: 0x840
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function function_d1852e75(n_aat_index)
{
	foreach(aat in level.aat)
	{
		if(aat.n_index == n_aat_index)
		{
			return hash(aat.name);
		}
	}
	return #"none";
}

/*
	Name: get_string
	Namespace: aat
	Checksum: 0x8BB0C591
	Offset: 0x900
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function get_string(n_aat_index)
{
	foreach(aat in level.aat)
	{
		if(aat.n_index == n_aat_index)
		{
			return aat.localized_string;
		}
	}
	return level.aat_default_info_name;
}

/*
	Name: get_icon
	Namespace: aat
	Checksum: 0x7A942E87
	Offset: 0x9B0
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function get_icon(n_aat_index)
{
	foreach(aat in level.aat)
	{
		if(aat.n_index == n_aat_index)
		{
			return aat.icon;
		}
	}
	return level.aat_default_info_icon;
}

/*
	Name: function_467efa7b
	Namespace: aat
	Checksum: 0xEEBBFAB2
	Offset: 0xA60
	Size: 0x14E
	Parameters: 1
	Flags: Linked
*/
function function_467efa7b(var_9f3fb329)
{
	if(!isdefined(var_9f3fb329))
	{
		var_9f3fb329 = 0;
	}
	if(!isdefined(self.archetype))
	{
		return "tag_origin";
	}
	switch(self.archetype)
	{
		case "stoker":
		case "catalyst":
		case "gladiator":
		case "nova_crawler":
		case "zombie":
		case "ghost":
		case "brutus":
		{
			if(var_9f3fb329)
			{
				str_tag = "j_spine4";
			}
			else
			{
				str_tag = "j_spineupper";
			}
			break;
		}
		case "blight_father":
		case "tiger":
		case "elephant":
		{
			str_tag = "j_head";
			break;
		}
		default:
		{
			str_tag = "tag_origin";
			break;
		}
	}
	return str_tag;
}

/*
	Name: update_aat_hud
	Namespace: aat
	Checksum: 0xEF886075
	Offset: 0xBB8
	Size: 0x1A4
	Parameters: 7
	Flags: Linked
*/
function update_aat_hud(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_8aa9ab80 = function_d1852e75(bwastimejump);
	str_localized = get_string(bwastimejump);
	icon = get_icon(bwastimejump);
	if(str_localized == "none")
	{
		str_localized = #"";
	}
	var_ca2e17a3 = function_1df4c3b0(fieldname, #"zm_hud");
	var_2961e149 = createuimodel(var_ca2e17a3, "aatNameHash");
	setuimodelvalue(var_2961e149, var_8aa9ab80);
	aatmodel = createuimodel(var_ca2e17a3, "aat");
	setuimodelvalue(aatmodel, str_localized);
	aaticonmodel = createuimodel(var_ca2e17a3, "aatIcon");
	setuimodelvalue(aaticonmodel, icon);
}

