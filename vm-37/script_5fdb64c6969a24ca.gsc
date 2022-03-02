#using script_65fbfb5ecb1f899e;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\load_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\cp_common\util.csc;

#namespace dialog_tree;

/*
	Name: function_89f2df9
	Namespace: dialog_tree
	Checksum: 0xBBFAE6D7
	Offset: 0x108
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register("dialog_tree", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: dialog_tree
	Checksum: 0xEC3E8DE4
	Offset: 0x148
	Size: 0xDC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "dt_set_fov", 1, 3, "int", &set_fov, 0, 0);
	clientfield::register("toplayer", "dt_set_dof", 1, 3, "int", &function_3564ce29, 0, 0);
	clientfield::register("toplayer", "dt_set_hide_reticle_dot", 1, 1, "int", &function_356192f3, 0, 0);
}

/*
	Name: set_fov
	Namespace: dialog_tree
	Checksum: 0x3DD424F5
	Offset: 0x230
	Size: 0x192
	Parameters: 7
	Flags: Linked
*/
function set_fov(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	n_time = 2;
	switch(bwastimejump)
	{
		case 1:
		{
			self function_9298adaf(1);
			break;
		}
		case 2:
		{
			self easing::function_f95cb457(undefined, 17, n_time, #"linear");
			break;
		}
		case 3:
		{
			self easing::function_f95cb457(undefined, 20, n_time, #"linear");
			break;
		}
		case 4:
		{
			self easing::function_f95cb457(undefined, 25, n_time, #"linear");
			break;
		}
		case 5:
		{
			self easing::function_f95cb457(undefined, 30, n_time, #"linear");
			break;
		}
	}
}

/*
	Name: function_356192f3
	Namespace: dialog_tree
	Checksum: 0xA509A81E
	Offset: 0x3D0
	Size: 0xAC
	Parameters: 7
	Flags: Linked, Private
*/
function private function_356192f3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_baa65467 = function_1df4c3b0(fieldname, #"hash_7b72ad35b5202ebd");
	var_b3a126ea = getuimodel(var_baa65467, "hideNoReticleDot");
	if(isdefined(var_b3a126ea))
	{
		setuimodelvalue(var_b3a126ea, bwastimejump);
	}
}

/*
	Name: function_3564ce29
	Namespace: dialog_tree
	Checksum: 0x3584E2D6
	Offset: 0x488
	Size: 0x192
	Parameters: 7
	Flags: Linked
*/
function function_3564ce29(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	n_time = 2;
	switch(bwastimejump)
	{
		case 1:
		{
			self function_9e574055(0);
			self function_3c54e2b8(n_time);
			self function_9ea7b4eb(n_time);
			break;
		}
		case 2:
		{
			self function_9e574055(2);
			self function_1816c600(1.5, n_time);
			self function_d7be9a9f(50, n_time);
			break;
		}
		case 3:
		{
			self function_9e574055(2);
			self function_1816c600(1.5, n_time);
			self function_d7be9a9f(90, n_time);
			break;
		}
	}
}

