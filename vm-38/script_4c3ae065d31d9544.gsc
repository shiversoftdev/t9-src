#using script_64ba9fcabd6381a1;
#using script_2c5f2d4e7aa698c4;
#using scripts\zm_common\zm_fasttravel.csc;
#using scripts\zm_common\zm_weapons.csc;
#using scripts\zm_common\zm_wallbuy.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_ui_inventory.csc;
#using scripts\zm_common\zm_pack_a_punch.csc;
#using scripts\zm_common\zm.csc;
#using scripts\core_common\load_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_c4d353e7;

/*
	Name: function_c97f46ee
	Namespace: namespace_c4d353e7
	Checksum: 0xC71A75FA
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c97f46ee()
{
	level notify(-1447466954);
}

/*
	Name: init
	Namespace: namespace_c4d353e7
	Checksum: 0xD3FBA861
	Offset: 0x130
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "" + #"hide_scene_models", 1, getminbitcountfornum(2), "int", &hide_scene_models, 0, 0);
	clientfield::register("world", "" + #"hash_763dd8035e80f7c", 1, 1, "int", &function_44dc8dc9, 0, 0);
}

/*
	Name: hide_scene_models
	Namespace: namespace_c4d353e7
	Checksum: 0x515F7C71
	Offset: 0x200
	Size: 0x238
	Parameters: 7
	Flags: Linked
*/
function hide_scene_models(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_94a3aa7c = findstaticmodelindexarray("hide_scene_models");
	var_fc98dc98 = findstaticmodelindexarray("hide_mid_scene_models");
	var_ab243151 = arraycombine(var_94a3aa7c, var_fc98dc98);
	if(bwastimejump == 1)
	{
		foreach(n_index in var_ab243151)
		{
			hidestaticmodel(n_index);
		}
	}
	else
	{
		if(bwastimejump == 2)
		{
			foreach(n_index in var_fc98dc98)
			{
				unhidestaticmodel(n_index);
			}
		}
		else
		{
			foreach(n_index in var_ab243151)
			{
				unhidestaticmodel(n_index);
			}
		}
	}
}

/*
	Name: function_44dc8dc9
	Namespace: namespace_c4d353e7
	Checksum: 0x9C5A267C
	Offset: 0x440
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function function_44dc8dc9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!function_148ccc79(fieldname, #"hash_5e358762e4678906"))
		{
			function_a837926b(fieldname, #"hash_5e358762e4678906");
		}
	}
	else if(function_148ccc79(fieldname, #"hash_5e358762e4678906"))
	{
		codestoppostfxbundlelocal(fieldname, #"hash_5e358762e4678906");
	}
}

