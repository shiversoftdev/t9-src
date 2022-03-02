#using script_18bc13f07baf161a;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\flag_shared.csc;

#namespace namespace_21dd166c;

/*
	Name: function_ee83bc59
	Namespace: namespace_21dd166c
	Checksum: 0x84B8DF42
	Offset: 0x398
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function function_ee83bc59(&array)
{
	if(array.size > 0)
	{
		keys = getarraykeys(array);
		return keys[function_d59c2d03(keys.size)];
	}
}

/*
	Name: function_b5f93b3b
	Namespace: namespace_21dd166c
	Checksum: 0xD9FC0D21
	Offset: 0x3F0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_b5f93b3b(&array)
{
	if(array.size > 0)
	{
		keys = getarraykeys(array);
		return array[keys[function_d59c2d03(keys.size)]];
	}
}

/*
	Name: function_72c2ebdd
	Namespace: namespace_21dd166c
	Checksum: 0xDDC2F65B
	Offset: 0x450
	Size: 0x16A
	Parameters: 2
	Flags: Linked
*/
function function_72c2ebdd(array, weights)
{
	/#
		assert(array.size == weights.size);
	#/
	if(array.size > 0)
	{
		var_766a145f = 0;
		keys = getarraykeys(array);
		foreach(key in keys)
		{
			var_766a145f = var_766a145f + weights[key];
		}
		var_ca23d24f = function_7ae7bf61(0, var_766a145f);
		var_da00fb33 = keys[0];
		for(i = 0; i < keys.size && var_ca23d24f >= 0; i++)
		{
			var_da00fb33 = keys[i];
			var_ca23d24f = var_ca23d24f - weights[var_da00fb33];
		}
		return array[var_da00fb33];
	}
	return undefined;
}

/*
	Name: function_53808d89
	Namespace: namespace_21dd166c
	Checksum: 0x30FEFF24
	Offset: 0x5C8
	Size: 0x282
	Parameters: 4
	Flags: Private
*/
function private function_53808d89(n, grid, mins, maxs)
{
	var_f8c934d0 = [];
	foreach(row in grid)
	{
		foreach(gridnode in row)
		{
			if(gridnode.col >= mins.col && gridnode.col <= maxs.col && gridnode.col >= mins.row && gridnode.row <= maxs.row)
			{
				if(!isdefined(var_f8c934d0))
				{
					var_f8c934d0 = [];
				}
				else if(!isarray(var_f8c934d0))
				{
					var_f8c934d0 = array(var_f8c934d0);
				}
				var_f8c934d0[var_f8c934d0.size] = gridnode;
			}
		}
	}
	var_3ea568e1 = [];
	for(i = 0; i < n; i++)
	{
		if(var_f8c934d0.size > 0)
		{
			selected = function_ee83bc59(var_f8c934d0);
			if(!isdefined(var_3ea568e1))
			{
				var_3ea568e1 = [];
			}
			else if(!isarray(var_3ea568e1))
			{
				var_3ea568e1 = array(var_3ea568e1);
			}
			var_3ea568e1[var_3ea568e1.size] = var_f8c934d0[selected];
			var_f8c934d0 = array::remove_index(var_f8c934d0, selected);
		}
	}
	return var_3ea568e1;
}

/*
	Name: function_d5a0b1bc
	Namespace: namespace_21dd166c
	Checksum: 0x48605346
	Offset: 0x858
	Size: 0x9E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d5a0b1bc(&grid)
{
	if(!isdefined(grid))
	{
		return;
	}
	for(i = 0; i < 25; i++)
	{
		for(j = 0; j < 25; j++)
		{
			grid[i][j].mins = undefined;
			grid[i][j].maxs = undefined;
			grid[i][j] = undefined;
		}
		grid[i] = undefined;
	}
	grid = [];
}

/*
	Name: function_2679112e
	Namespace: namespace_21dd166c
	Checksum: 0xA7849AF8
	Offset: 0x900
	Size: 0xF6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2679112e()
{
	var_ae856577 = (0, 0, 0);
	grid = [];
	for(i = 0; i < 25; i++)
	{
		grid[i] = [];
		for(j = 0; j < 25; j++)
		{
			grid[i][j] = spawnstruct();
			grid[i][j].origin = (var_ae856577 + (((1, 0, 0) * 1024) * j)) - (((0, 1, 0) * 1024) * i);
			grid[i][j].row = i;
			grid[i][j].col = j;
		}
	}
	return grid;
}

/*
	Name: function_d5a0313a
	Namespace: namespace_21dd166c
	Checksum: 0x78A293F9
	Offset: 0xA00
	Size: 0x130
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d5a0313a()
{
	if(isdefined(level.var_84c76431))
	{
		return [[level.var_84c76431]]();
	}
	var_1b8ba6f5 = [];
	var_1b8ba6f5[0] = 1E-05;
	var_1b8ba6f5[1] = 0.001;
	var_1b8ba6f5[2] = 0.001;
	var_1b8ba6f5[3] = 1;
	var_1b8ba6f5[4] = 0.001;
	var_1b8ba6f5[5] = 1;
	var_1b8ba6f5[6] = 1;
	var_1b8ba6f5[7] = 0.5;
	var_1b8ba6f5[8] = 0.001;
	var_1b8ba6f5[9] = 1;
	var_1b8ba6f5[10] = 1;
	var_1b8ba6f5[11] = 0.5;
	var_1b8ba6f5[12] = 1;
	var_1b8ba6f5[13] = 0.5;
	var_1b8ba6f5[14] = 0.5;
	var_1b8ba6f5[15] = 0.25;
	return var_1b8ba6f5;
}

/*
	Name: function_c083433f
	Namespace: namespace_21dd166c
	Checksum: 0xB091C00A
	Offset: 0xB38
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_c083433f()
{
	flag::set("rg_generating");
	level thread function_3846f71f();
}

/*
	Name: function_f4ad1256
	Namespace: namespace_21dd166c
	Checksum: 0x8BE887FE
	Offset: 0xB78
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f4ad1256(var_ac850bbc)
{
	var_8363ebc0 = var_ac850bbc.var_8363ebc0;
	return var_8363ebc0 >= getdvarint(#"hash_4c2ff1f11662c879", 12);
}

/*
	Name: function_3846f71f
	Namespace: namespace_21dd166c
	Checksum: 0xED95B5AF
	Offset: 0xBD0
	Size: 0x380
	Parameters: 0
	Flags: Linked
*/
function function_3846f71f()
{
	self notify("2509726c959861cb");
	self endon("2509726c959861cb");
	level endon(#"hash_521118da55424987");
	if(!isdefined(level.var_5b193175))
	{
		level.var_5b193175 = &function_f4ad1256;
	}
	loops = 0;
	while(true)
	{
		namespace_95fdc800::function_f4b7f348("generate_level_internal loop:" + loops);
		if(isdefined(level.var_1c96bbc))
		{
			level.var_1c96bbc.center = undefined;
			level.var_1c96bbc.dest_nodes = [];
			for(i = 0; i < level.var_1c96bbc.var_4ca9cc3e.size; i++)
			{
				level.var_1c96bbc.var_4ca9cc3e[i] = undefined;
			}
			level.var_1c96bbc.var_4ca9cc3e = [];
			function_d5a0b1bc(level.var_1c96bbc.grid);
			level.var_1c96bbc.maxs = undefined;
			level.var_1c96bbc.mins = undefined;
			level.var_1c96bbc = undefined;
		}
		namespace_95fdc800::function_f4b7f348("generate_level_internal initialized");
		if(!getdvarint(#"hash_55c78475b1ebf3de", 1))
		{
			waitframe(1);
		}
		grid = function_2679112e();
		namespace_95fdc800::function_f4b7f348("generate_level_internal generate_grid called and finished");
		var_ac850bbc = function_a1b9e7c0(grid);
		namespace_95fdc800::function_f4b7f348("generate_level_internal expand_generate called and finished");
		function_9b4fd56b(var_ac850bbc);
		namespace_95fdc800::function_f4b7f348("generate_level_internal remove symbols called and finished");
		if([[level.var_5b193175]](var_ac850bbc))
		{
			namespace_95fdc800::function_f4b7f348("generate_level_internal rg_validate_generated_map called and passed");
			break;
		}
		namespace_95fdc800::function_f4b7f348("generate_level_internal rg_validate_generated_map called and FAILED");
		loops++;
	}
	level.var_1c96bbc = function_a91abf58(var_ac850bbc);
	namespace_95fdc800::function_f4b7f348("generate_level_internal generate_door_edges called and finished");
	function_d5a0b1bc(grid);
	namespace_95fdc800::function_f4b7f348("generate_level_internal free_grid called and finished");
	flag::clear("rg_generating");
	if(!getdvarint(#"hash_55c78475b1ebf3de", 1))
	{
		waitframe(1);
		level notify(#"hash_47a9ddfa0138bc29");
	}
	else
	{
		return level.var_1c96bbc;
	}
}

/*
	Name: function_f27dcbdb
	Namespace: namespace_21dd166c
	Checksum: 0x1265E68
	Offset: 0xF58
	Size: 0xA1A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f27dcbdb(var_ac850bbc)
{
	grid = var_ac850bbc.grid;
	mins = var_ac850bbc.mins;
	maxs = var_ac850bbc.maxs;
	var_6337f20 = [];
	var_e7bee289 = [];
	var_9f5b832e = [];
	var_45f39b76 = undefined;
	var_dab090bb = undefined;
	for(var_155fb1e0 = mins.col; ((var_155fb1e0 + 3) - 1) <= maxs.col; var_155fb1e0++)
	{
		for(var_8d2452c7 = mins.row; ((var_8d2452c7 + 3) - 1) <= maxs.row; var_8d2452c7++)
		{
			var_dab090bb = 3;
			var_45f39b76 = grid[var_8d2452c7 + 1][var_155fb1e0 + 2];
			/#
				assert(isdefined(var_45f39b76));
			#/
			if(!isdefined(var_45f39b76.exits) || (isdefined(var_45f39b76.var_4e8e65e4) && var_45f39b76.var_4e8e65e4 != 2))
			{
				continue;
			}
			if(var_45f39b76.exits != 3)
			{
				var_dab090bb = var_dab090bb & (~2);
			}
			if(var_45f39b76.exits != 9)
			{
				var_dab090bb = var_dab090bb & (~1);
			}
			var_45f39b76 = grid[var_8d2452c7 + 2][var_155fb1e0 + 1];
			if(var_dab090bb == 0 || !isdefined(var_45f39b76.exits) || (isdefined(var_45f39b76.var_4e8e65e4) && var_45f39b76.var_4e8e65e4 != 2))
			{
				continue;
			}
			if(var_dab090bb & 2 && var_45f39b76.exits != 9)
			{
				var_dab090bb = var_dab090bb & (~2);
			}
			else if(var_dab090bb & 1 && var_45f39b76.exits != 12)
			{
				var_dab090bb = var_dab090bb & (~1);
			}
			var_45f39b76 = grid[var_8d2452c7 + 1][var_155fb1e0];
			if(var_dab090bb == 0 || !isdefined(var_45f39b76.exits) || (isdefined(var_45f39b76.var_4e8e65e4) && var_45f39b76.var_4e8e65e4 != 2))
			{
				continue;
			}
			if(var_dab090bb & 2 && var_45f39b76.exits != 12)
			{
				var_dab090bb = var_dab090bb & (~2);
			}
			else if(var_dab090bb & 1 && var_45f39b76.exits != 6)
			{
				var_dab090bb = var_dab090bb & (~1);
			}
			var_45f39b76 = grid[var_8d2452c7][var_155fb1e0 + 1];
			if(var_dab090bb == 0 || !isdefined(var_45f39b76.exits) || (isdefined(var_45f39b76.var_4e8e65e4) && var_45f39b76.var_4e8e65e4 != 2))
			{
				continue;
			}
			if(var_dab090bb & 2 && var_45f39b76.exits != 6)
			{
				var_dab090bb = var_dab090bb & (~2);
			}
			else if(var_dab090bb & 1 && var_45f39b76.exits != 3)
			{
				var_dab090bb = var_dab090bb & (~1);
			}
			if(var_dab090bb == 0)
			{
				continue;
			}
			if(!isdefined(var_6337f20))
			{
				var_6337f20 = [];
			}
			else if(!isarray(var_6337f20))
			{
				var_6337f20 = array(var_6337f20);
			}
			var_6337f20[var_6337f20.size] = var_8d2452c7;
			if(!isdefined(var_e7bee289))
			{
				var_e7bee289 = [];
			}
			else if(!isarray(var_e7bee289))
			{
				var_e7bee289 = array(var_e7bee289);
			}
			var_e7bee289[var_e7bee289.size] = var_155fb1e0;
			if(!isdefined(var_9f5b832e))
			{
				var_9f5b832e = [];
			}
			else if(!isarray(var_9f5b832e))
			{
				var_9f5b832e = array(var_9f5b832e);
			}
			var_9f5b832e[var_9f5b832e.size] = var_dab090bb;
		}
	}
	/#
		if(var_6337f20.size > 0)
		{
			println(("" + var_6337f20.size) + "");
			function_50a302e0(var_ac850bbc.grid, var_ac850bbc.mins, var_ac850bbc.maxs);
		}
	#/
	for(i = 0; i < var_6337f20.size; i++)
	{
		if(var_9f5b832e[i] == 2)
		{
			grid[var_6337f20[i] + 1][var_e7bee289[i]].exits = (grid[var_6337f20[i] + 1][var_e7bee289[i]].exits) | 2;
			if(isdefined(grid[var_6337f20[i] + 2][var_e7bee289[i]].exits))
			{
				grid[var_6337f20[i] + 2][var_e7bee289[i]].exits = (grid[var_6337f20[i] + 2][var_e7bee289[i]].exits) | 8;
			}
			else
			{
				grid[var_6337f20[i] + 2][var_e7bee289[i]].exits = 8;
				grid[var_6337f20[i] + 2][var_e7bee289[i]].var_4e8e65e4 = 1;
				grid[var_6337f20[i] + 2][var_e7bee289[i]].height = (grid[var_6337f20[i] + 1][var_e7bee289[i]].height) + 1;
				if(!isdefined(var_ac850bbc.dest_nodes))
				{
					var_ac850bbc.dest_nodes = [];
				}
				else if(!isarray(var_ac850bbc.dest_nodes))
				{
					var_ac850bbc.dest_nodes = array(var_ac850bbc.dest_nodes);
				}
				var_ac850bbc.dest_nodes[var_ac850bbc.dest_nodes.size] = grid[var_6337f20[i] + 2][var_e7bee289[i]];
				var_ac850bbc.var_8363ebc0++;
			}
			continue;
		}
		grid[var_6337f20[i] + 1][var_e7bee289[i]].exits = (grid[var_6337f20[i] + 1][var_e7bee289[i]].exits) | 8;
		if(isdefined(grid[var_6337f20[i]][var_e7bee289[i]].exits))
		{
			grid[var_6337f20[i]][var_e7bee289[i]].exits = grid[var_6337f20[i]][var_e7bee289[i]].exits | 2;
			continue;
		}
		grid[var_6337f20[i]][var_e7bee289[i]].exits = 2;
		grid[var_6337f20[i]][var_e7bee289[i]].var_4e8e65e4 = 1;
		grid[var_6337f20[i]][var_e7bee289[i]].height = (grid[var_6337f20[i] + 1][var_e7bee289[i]].height) + 1;
		if(!isdefined(var_ac850bbc.dest_nodes))
		{
			var_ac850bbc.dest_nodes = [];
		}
		else if(!isarray(var_ac850bbc.dest_nodes))
		{
			var_ac850bbc.dest_nodes = array(var_ac850bbc.dest_nodes);
		}
		var_ac850bbc.dest_nodes[var_ac850bbc.dest_nodes.size] = grid[var_6337f20[i]][var_e7bee289[i]];
		var_ac850bbc.var_8363ebc0++;
	}
	/#
		if(var_6337f20.size > 0)
		{
			println(("" + var_6337f20.size) + "");
			function_50a302e0(var_ac850bbc.grid, var_ac850bbc.mins, var_ac850bbc.maxs);
		}
	#/
	return var_6337f20.size;
}

/*
	Name: function_9b4fd56b
	Namespace: namespace_21dd166c
	Checksum: 0xC4137F06
	Offset: 0x1980
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9b4fd56b(var_ac850bbc)
{
	var_1fb83feb = function_f27dcbdb(var_ac850bbc);
}

/*
	Name: function_a1b9e7c0
	Namespace: namespace_21dd166c
	Checksum: 0xFDB579EB
	Offset: 0x19B8
	Size: 0xF0C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a1b9e7c0(grid)
{
	center = grid[int(12.5)][int(12.5)];
	center.var_4e8e65e4 = 0;
	center.exits = 8;
	center.height = 0;
	mins = spawnstruct();
	mins.col = center.col - (int(getdvarint(#"hash_788fb3bfb03132f", 6) / 2));
	mins.row = center.row - (int(getdvarint(#"hash_788fb3bfb03132f", 6) / 2));
	maxs = spawnstruct();
	maxs.col = center.col + (int(getdvarint(#"hash_788fb3bfb03132f", 6) / 2));
	maxs.row = center.row + (int(getdvarint(#"hash_788fb3bfb03132f", 6) / 2));
	var_deb37465 = function_d5a0313a();
	var_8363ebc0 = 1;
	dest_nodes = [];
	var_7634e14a = [];
	center.children = [];
	if(!isdefined(center.children))
	{
		center.children = [];
	}
	else if(!isarray(center.children))
	{
		center.children = array(center.children);
	}
	center.children[center.children.size] = grid[center.row - 1][center.col];
	grid[center.row - 1][center.col].height = 1;
	array::push_front(var_7634e14a, grid[center.row - 1][center.col]);
	namespace_95fdc800::function_f4b7f348("expand_generate initialized");
	while(var_7634e14a.size > 0)
	{
		namespace_95fdc800::function_f4b7f348("expand_generate openNodes.size = " + var_7634e14a.size);
		currentnode = array::pop(var_7634e14a);
		var_cb3c1fa = 0;
		var_f00d8c2a = 0;
		if(currentnode.col > mins.col)
		{
			if(isdefined(grid[currentnode.row][currentnode.col - 1].exits))
			{
				var_cb3c1fa = var_cb3c1fa | 1;
				if((grid[currentnode.row][currentnode.col - 1].exits) & 4)
				{
					var_f00d8c2a = var_f00d8c2a | 1;
				}
			}
		}
		else
		{
			var_cb3c1fa = var_cb3c1fa | 1;
		}
		if(currentnode.col < maxs.col)
		{
			if(isdefined(grid[currentnode.row][currentnode.col + 1].exits))
			{
				var_cb3c1fa = var_cb3c1fa | 4;
				if((grid[currentnode.row][currentnode.col + 1].exits) & 1)
				{
					var_f00d8c2a = var_f00d8c2a | 4;
				}
			}
		}
		else
		{
			var_cb3c1fa = var_cb3c1fa | 4;
		}
		if(currentnode.row > mins.row)
		{
			if(isdefined(grid[currentnode.row - 1][currentnode.col].exits))
			{
				var_cb3c1fa = var_cb3c1fa | 8;
				if((grid[currentnode.row - 1][currentnode.col].exits) & 2)
				{
					var_f00d8c2a = var_f00d8c2a | 8;
				}
			}
		}
		else
		{
			var_cb3c1fa = var_cb3c1fa | 8;
		}
		if(currentnode.row < maxs.row)
		{
			if(isdefined(grid[currentnode.row + 1][currentnode.col].exits))
			{
				var_cb3c1fa = var_cb3c1fa | 2;
				if((grid[currentnode.row + 1][currentnode.col].exits) & 8)
				{
					var_f00d8c2a = var_f00d8c2a | 2;
				}
			}
		}
		else
		{
			var_cb3c1fa = var_cb3c1fa | 2;
		}
		var_d4239799 = [];
		for(i = 0; i <= 15; i++)
		{
			bits = int(i);
			var_14358e62 = ~(var_f00d8c2a ^ bits);
			var_bc8525a3 = var_14358e62 | (~var_cb3c1fa);
			if(!~var_bc8525a3)
			{
				if(!isdefined(var_d4239799))
				{
					var_d4239799 = [];
				}
				else if(!isarray(var_d4239799))
				{
					var_d4239799 = array(var_d4239799);
				}
				var_d4239799[var_d4239799.size] = bits;
			}
		}
		var_b39b2f6 = [];
		foreach(key in getarraykeys(var_d4239799))
		{
			var_b39b2f6[key] = var_deb37465[var_d4239799[key]];
		}
		currentnode.exits = function_72c2ebdd(var_d4239799, var_b39b2f6);
		var_8363ebc0++;
		currentnode.children = [];
		if(currentnode.exits & 2 && currentnode.row < maxs.row && !isdefined(grid[currentnode.row + 1][currentnode.col].height))
		{
			if(!isdefined(currentnode.children))
			{
				currentnode.children = [];
			}
			else if(!isarray(currentnode.children))
			{
				currentnode.children = array(currentnode.children);
			}
			currentnode.children[currentnode.children.size] = grid[currentnode.row + 1][currentnode.col];
			grid[currentnode.row + 1][currentnode.col].height = currentnode.height + 1;
			array::push_front(var_7634e14a, grid[currentnode.row + 1][currentnode.col]);
		}
		if(currentnode.exits & 8 && currentnode.row > mins.row && !isdefined(grid[currentnode.row - 1][currentnode.col].height))
		{
			if(!isdefined(currentnode.children))
			{
				currentnode.children = [];
			}
			else if(!isarray(currentnode.children))
			{
				currentnode.children = array(currentnode.children);
			}
			currentnode.children[currentnode.children.size] = grid[currentnode.row - 1][currentnode.col];
			grid[currentnode.row - 1][currentnode.col].height = currentnode.height + 1;
			array::push_front(var_7634e14a, grid[currentnode.row - 1][currentnode.col]);
		}
		if(currentnode.exits & 4 && currentnode.col < maxs.row && !isdefined(grid[currentnode.row][currentnode.col + 1].height))
		{
			if(!isdefined(currentnode.children))
			{
				currentnode.children = [];
			}
			else if(!isarray(currentnode.children))
			{
				currentnode.children = array(currentnode.children);
			}
			currentnode.children[currentnode.children.size] = grid[currentnode.row][currentnode.col + 1];
			grid[currentnode.row][currentnode.col + 1].height = currentnode.height + 1;
			array::push_front(var_7634e14a, grid[currentnode.row][currentnode.col + 1]);
		}
		if(currentnode.exits & 1 && currentnode.col > mins.col && !isdefined(grid[currentnode.row][currentnode.col - 1].height))
		{
			if(!isdefined(currentnode.children))
			{
				currentnode.children = [];
			}
			else if(!isarray(currentnode.children))
			{
				currentnode.children = array(currentnode.children);
			}
			currentnode.children[currentnode.children.size] = grid[currentnode.row][currentnode.col - 1];
			grid[currentnode.row][currentnode.col - 1].height = currentnode.height + 1;
			array::push_front(var_7634e14a, grid[currentnode.row][currentnode.col - 1]);
		}
		if(currentnode.exits == 1 || currentnode.exits == 2 || currentnode.exits == 4 || currentnode.exits == 8)
		{
			currentnode.var_4e8e65e4 = 1;
			if(!isdefined(dest_nodes))
			{
				dest_nodes = [];
			}
			else if(!isarray(dest_nodes))
			{
				dest_nodes = array(dest_nodes);
			}
			dest_nodes[dest_nodes.size] = currentnode;
		}
		else if(function_d59c2d03(99) < 20)
		{
			currentnode.var_4e8e65e4 = 1;
			if(!isdefined(dest_nodes))
			{
				dest_nodes = [];
			}
			else if(!isarray(dest_nodes))
			{
				dest_nodes = array(dest_nodes);
			}
			dest_nodes[dest_nodes.size] = currentnode;
		}
		if(!getdvarint(#"hash_55c78475b1ebf3de", 1))
		{
			waitframe(1);
		}
	}
	namespace_95fdc800::function_f4b7f348("expand_generate openNodes processing done");
	return {#dest_nodes:dest_nodes, #hash_8363ebc0:var_8363ebc0, #center:center, #maxs:maxs, #mins:mins, #grid:grid};
}

/*
	Name: function_7f9c08bb
	Namespace: namespace_21dd166c
	Checksum: 0x51A13F88
	Offset: 0x28D0
	Size: 0xA8
	Parameters: 3
	Flags: Linked
*/
function function_7f9c08bb(row, col, dir)
{
	if(dir == 8)
	{
		row = row - 1;
	}
	if(dir == 1)
	{
		col = col - 1;
	}
	var_820d981d = "v";
	if(dir == 1 || dir == 4)
	{
		var_820d981d = "h";
	}
	return ((row + ",") + col) + var_820d981d;
}

/*
	Name: function_1cbb1766
	Namespace: namespace_21dd166c
	Checksum: 0x30C4C152
	Offset: 0x2980
	Size: 0x96
	Parameters: 3
	Flags: Linked, Private
*/
function private function_1cbb1766(row, col, dir)
{
	edge = spawnstruct();
	if(dir == 8)
	{
		row = row - 1;
	}
	if(dir == 1)
	{
		col = col - 1;
	}
	edge.col = col;
	edge.row = row;
	edge.dir = dir;
	return edge;
}

/*
	Name: function_a91abf58
	Namespace: namespace_21dd166c
	Checksum: 0x80F8BA3B
	Offset: 0x2A20
	Size: 0x8A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a91abf58(var_ac850bbc)
{
	if(!getdvarint(#"hash_55c78475b1ebf3de", 1))
	{
		level thread function_6673d10c(var_ac850bbc);
		level waittill(#"hash_40227511a548bc20");
		return level.var_1c96bbc;
	}
	return function_6673d10c(var_ac850bbc);
}

/*
	Name: function_6673d10c
	Namespace: namespace_21dd166c
	Checksum: 0xB1B97855
	Offset: 0x2AB8
	Size: 0x518
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6673d10c(var_ac850bbc)
{
	grid = var_ac850bbc.grid;
	center = var_ac850bbc.center;
	dest_nodes = var_ac850bbc.dest_nodes;
	maxs = var_ac850bbc.maxs;
	mins = var_ac850bbc.mins;
	var_57873587 = [];
	namespace_95fdc800::function_f4b7f348("generate_door_edges_internal initialized;  dest_nodes.size = " + dest_nodes.size);
	foreach(dest_node in dest_nodes)
	{
		if(dest_node.exits & 2 && dest_node.row < maxs.row && isdefined(grid[dest_node.row + 1][dest_node.col].height))
		{
			var_5dba4756 = function_7f9c08bb(dest_node.row, dest_node.col, 2);
			edge = var_57873587[var_5dba4756];
			if(!isdefined(edge))
			{
				edge = function_1cbb1766(dest_node.row, dest_node.col, 2);
				var_57873587[var_5dba4756] = edge;
			}
			edge.connection_type = 1;
		}
		if(dest_node.exits & 8 && dest_node.row > mins.row && isdefined(grid[dest_node.row - 1][dest_node.col].height))
		{
			var_5dba4756 = function_7f9c08bb(dest_node.row, dest_node.col, 8);
			edge = var_57873587[var_5dba4756];
			if(!isdefined(edge))
			{
				edge = function_1cbb1766(dest_node.row, dest_node.col, 8);
				var_57873587[var_5dba4756] = edge;
			}
			edge.connection_type = 1;
		}
		if(dest_node.exits & 4 && dest_node.col < maxs.row && isdefined(grid[dest_node.row][dest_node.col + 1].height))
		{
			var_5dba4756 = function_7f9c08bb(dest_node.row, dest_node.col, 4);
			edge = var_57873587[var_5dba4756];
			if(!isdefined(edge))
			{
				edge = function_1cbb1766(dest_node.row, dest_node.col, 4);
				var_57873587[var_5dba4756] = edge;
			}
			edge.connection_type = 1;
		}
		if(dest_node.exits & 1 && dest_node.col > mins.col && isdefined(grid[dest_node.row][dest_node.col - 1].height))
		{
			var_5dba4756 = function_7f9c08bb(dest_node.row, dest_node.col, 1);
			edge = var_57873587[var_5dba4756];
			if(!isdefined(edge))
			{
				edge = function_1cbb1766(dest_node.row, dest_node.col, 1);
				var_57873587[var_5dba4756] = edge;
			}
			edge.connection_type = 1;
		}
		if(!getdvarint(#"hash_55c78475b1ebf3de", 1))
		{
			waitframe(1);
		}
	}
	namespace_95fdc800::function_f4b7f348("generate_door_edges_internal processed");
	var_ac850bbc.var_4ca9cc3e = var_57873587;
	level.var_1c96bbc = var_ac850bbc;
	if(!getdvarint(#"hash_55c78475b1ebf3de", 1))
	{
		waitframe(1);
		level notify(#"hash_40227511a548bc20");
	}
	else
	{
		return level.var_1c96bbc;
	}
}

/*
	Name: function_41cea16c
	Namespace: namespace_21dd166c
	Checksum: 0x7C874967
	Offset: 0x2FD8
	Size: 0x186
	Parameters: 1
	Flags: Private
*/
function private function_41cea16c(var_e5a03c2d)
{
	centroid = (0, 0, 0);
	foreach(node in var_e5a03c2d)
	{
		centroid = centroid + node.origin;
	}
	centroid = centroid / var_e5a03c2d.size;
	startnode = var_e5a03c2d[0];
	bestdist = distance2dsquared(centroid, startnode.origin);
	foreach(node in var_e5a03c2d)
	{
		dist = distance2dsquared(centroid, node.origin);
		if(dist < bestdist)
		{
			bestdist = dist;
			startnode = node;
		}
	}
	return startnode;
}

/*
	Name: function_ad3c4c28
	Namespace: namespace_21dd166c
	Checksum: 0xB4B8AD85
	Offset: 0x3168
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_ad3c4c28(left, right)
{
	return left.distsqr < right.distsqr;
}

/*
	Name: function_42d4c400
	Namespace: namespace_21dd166c
	Checksum: 0xCD7056B6
	Offset: 0x3198
	Size: 0xD4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_42d4c400(edge, var_b17324f2)
{
	var_10819d42 = spawnstruct();
	if(var_b17324f2.size == 0)
	{
		return var_10819d42;
	}
	for(i = 0; i < var_b17324f2.size; i++)
	{
		if(isdefined(var_b17324f2[i][edge.var_236fddd4]))
		{
			var_10819d42.start = i;
		}
		if(isdefined(var_b17324f2[i][edge.var_d5dc905]))
		{
			var_10819d42.end = i;
		}
		if(isdefined(var_10819d42.start) && isdefined(var_10819d42.end))
		{
			return var_10819d42;
		}
	}
	return var_10819d42;
}

/*
	Name: function_d10d1a39
	Namespace: namespace_21dd166c
	Checksum: 0x25EC3033
	Offset: 0x3278
	Size: 0x1E6
	Parameters: 3
	Flags: Linked, Private
*/
function private function_d10d1a39(var_10819d42, edge, var_b17324f2)
{
	if(isdefined(var_10819d42.start))
	{
		if(isdefined(var_10819d42.end))
		{
			keys = getarraykeys(var_b17324f2[var_10819d42.end]);
			foreach(key in keys)
			{
				var_b17324f2[var_10819d42.start][key] = 1;
			}
			var_b17324f2 = array::remove_index(var_b17324f2, var_10819d42.end);
		}
		else
		{
			var_b17324f2[var_10819d42.start][edge.var_d5dc905] = 1;
		}
	}
	else
	{
		if(isdefined(var_10819d42.end))
		{
			var_b17324f2[var_10819d42.end][edge.var_236fddd4] = 1;
		}
		else
		{
			var_a8af105 = [];
			var_a8af105[edge.var_236fddd4] = 1;
			var_a8af105[edge.var_d5dc905] = 1;
			if(!isdefined(var_b17324f2))
			{
				var_b17324f2 = [];
			}
			else if(!isarray(var_b17324f2))
			{
				var_b17324f2 = array(var_b17324f2);
			}
			var_b17324f2[var_b17324f2.size] = var_a8af105;
		}
	}
	return var_b17324f2;
}

/*
	Name: function_6544fed5
	Namespace: namespace_21dd166c
	Checksum: 0x55631A7F
	Offset: 0x3468
	Size: 0x276
	Parameters: 1
	Flags: Private
*/
function private function_6544fed5(var_e5a03c2d)
{
	var_bd794594 = [];
	var_b17324f2 = [];
	for(i = 0; i < var_e5a03c2d.size; i++)
	{
		for(j = i + 1; j < var_e5a03c2d.size; j++)
		{
			edge = spawnstruct();
			edge.start = var_e5a03c2d[i];
			edge.end = var_e5a03c2d[j];
			edge.var_236fddd4 = i;
			edge.var_d5dc905 = j;
			edge.distsqr = distance2dsquared(var_e5a03c2d[i].origin, var_e5a03c2d[j].origin);
			if(!isdefined(var_bd794594))
			{
				var_bd794594 = [];
			}
			else if(!isarray(var_bd794594))
			{
				var_bd794594 = array(var_bd794594);
			}
			var_bd794594[var_bd794594.size] = edge;
		}
	}
	var_b93b110a = array::quick_sort(var_bd794594, &function_ad3c4c28);
	var_d25551a8 = [];
	while(var_b93b110a.size > 0)
	{
		edge = array::pop_front(var_b93b110a);
		var_10819d42 = function_42d4c400(edge, var_b17324f2);
		if(!isdefined(var_10819d42.start) || !isdefined(var_10819d42.end) || var_10819d42.start != var_10819d42.end)
		{
			if(!isdefined(var_d25551a8))
			{
				var_d25551a8 = [];
			}
			else if(!isarray(var_d25551a8))
			{
				var_d25551a8 = array(var_d25551a8);
			}
			var_d25551a8[var_d25551a8.size] = edge;
			var_b17324f2 = function_d10d1a39(var_10819d42, edge, var_b17324f2);
		}
	}
	return var_d25551a8;
}

/*
	Name: function_edc68cbd
	Namespace: namespace_21dd166c
	Checksum: 0x54761245
	Offset: 0x36E8
	Size: 0x28E
	Parameters: 1
	Flags: Private
*/
function private function_edc68cbd(grid)
{
	/#
		var_9efeb213 = (1, 1, 1);
		while(true)
		{
			if(!isdefined(grid))
			{
				return;
			}
			for(i = 0; i < 25; i++)
			{
				line(grid[i][0].origin + (vectorscale((-1, 1, 0), 512)), grid[i][24].origin + vectorscale((1, 1, 0), 512), var_9efeb213);
			}
			line(grid[24][0].origin + (vectorscale((-1, -1, 0), 512)), grid[24][24].origin + (vectorscale((1, -1, 0), 512)), var_9efeb213);
			for(j = 0; j < 25; j++)
			{
				line(grid[0][j].origin + (vectorscale((-1, 1, 0), 512)), grid[24][j].origin + (vectorscale((-1, -1, 0), 512)), var_9efeb213);
			}
			line(grid[0][24].origin + vectorscale((1, 1, 0), 512), grid[24][24].origin + (vectorscale((1, -1, 0), 512)), var_9efeb213);
			for(i = 0; i < 25; i++)
			{
				for(j = 0; j < 25; j++)
				{
					print3d(grid[i][j].origin + vectorscale((0, 0, 1), 12), ((("" + i) + "") + j) + "", var_9efeb213, 1, 5);
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_50a302e0
	Namespace: namespace_21dd166c
	Checksum: 0x155B44A0
	Offset: 0x3980
	Size: 0x4FC
	Parameters: 3
	Flags: Private
*/
function private function_50a302e0(grid, mins, maxs)
{
	/#
		print("");
		for(j = mins.col; j <= maxs.col; j++)
		{
			print("");
		}
		println("");
		for(i = mins.row; i <= maxs.row; i++)
		{
			print("");
			for(j = mins.col; j <= maxs.col; j++)
			{
				if(isdefined(grid[i][j].exits))
				{
					if(grid[i][j].exits & 8)
					{
						var_9b9b1d8c = (grid[i][j].var_4e8e65e4 === 1 ? "" : "");
						print(("" + var_9b9b1d8c) + "");
					}
					else
					{
						print("");
					}
					continue;
				}
				print("");
			}
			println("");
			print("");
			for(j = mins.col; j <= maxs.col; j++)
			{
				if(isdefined(grid[i][j].exits))
				{
					var_9b9b1d8c = (grid[i][j].var_4e8e65e4 === 1 ? "" : "");
					print((grid[i][j].exits & 1 ? var_9b9b1d8c : ""));
					print(var_9b9b1d8c);
					print((grid[i][j].exits & 4 ? var_9b9b1d8c : ""));
					print("");
					continue;
				}
				print("");
			}
			println("");
			print("");
			for(j = mins.col; j <= maxs.col; j++)
			{
				if(isdefined(grid[i][j].exits))
				{
					if(grid[i][j].exits & 2)
					{
						var_9b9b1d8c = (grid[i][j].var_4e8e65e4 === 1 ? "" : "");
						print(("" + var_9b9b1d8c) + "");
					}
					else
					{
						print("");
					}
					continue;
				}
				print("");
			}
			println("");
			print("");
			for(j = mins.col; j <= maxs.col; j++)
			{
				print("");
			}
			println("");
		}
	#/
}

/*
	Name: function_94306783
	Namespace: namespace_21dd166c
	Checksum: 0xEC7155B1
	Offset: 0x3E88
	Size: 0x142
	Parameters: 2
	Flags: Private
*/
function private function_94306783(var_e5a03c2d, height)
{
	/#
		level endon(#"hash_186e943c1cd0db52", #"hash_521118da55424987");
		if(!isdefined(height))
		{
			height = 0;
		}
		var_fcf998ca = (1, 0, 0);
		startcolor = (1, 1, 0);
		while(true)
		{
			foreach(node in var_e5a03c2d)
			{
				color = var_fcf998ca;
				if(node.var_4e8e65e4 === 0)
				{
					color = startcolor;
				}
				circle(node.origin + ((0, 0, 1) * height), 256, color, 0);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_a38567b2
	Namespace: namespace_21dd166c
	Checksum: 0x4E94BAE1
	Offset: 0x3FD8
	Size: 0x12A
	Parameters: 2
	Flags: Private
*/
function private function_a38567b2(edges, height)
{
	/#
		level endon(#"hash_186e943c1cd0db52", #"hash_521118da55424987");
		if(!isdefined(height))
		{
			height = 0;
		}
		color = (0, 0, 1);
		while(true)
		{
			if(!isdefined(edges))
			{
				return;
			}
			foreach(edge in edges)
			{
				line(edge.start.origin + ((0, 0, 1) * height), edge.end.origin + ((0, 0, 1) * height), color);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_7c408b40
	Namespace: namespace_21dd166c
	Checksum: 0xAAD581EA
	Offset: 0x4110
	Size: 0x49E
	Parameters: 4
	Flags: Private
*/
function private function_7c408b40(grid, mins, maxs, height)
{
	/#
		level endon(#"hash_186e943c1cd0db52", #"hash_521118da55424987");
		if(!isdefined(height))
		{
			height = 0;
		}
		color = (0, 1, 1);
		while(true)
		{
			for(i = mins.row - 1; i <= maxs.row; i++)
			{
				for(j = mins.col - 1; j <= maxs.col; j++)
				{
					if(isdefined(grid[i][j].exits))
					{
						if(grid[i][j].exits & 1)
						{
							loc_0000425A:
							line((0, 0, 1) + (j * (((isdefined(grid[i][j].height) ? grid[i][j].height : 0) * 0) + height)), grid[i][j].origin, (0, 0, 1) + (j * (((isdefined(grid[i][j].height) ? grid[i][j].height : 0) * 0) + height)) - (((1, 0, 0) * 1024) / 2));
						}
						if(grid[i][j].exits & 2)
						{
							loc_0000433E:
							line((0, 0, 1) + (j * (((isdefined(grid[i][j].height) ? grid[i][j].height : 0) * 0) + height)), grid[i][j].origin, (0, 0, 1) + (j * (((isdefined(grid[i][j].height) ? grid[i][j].height : 0) * 0) + height)) - (((0, 1, 0) * 1024) / 2));
						}
						if(grid[i][j].exits & 4)
						{
							loc_00004426:
							line((0, 0, 1) + (j * (((isdefined(grid[i][j].height) ? grid[i][j].height : 0) * 0) + height)), grid[i][j].origin, (0, 0, 1) + (j * (((isdefined(grid[i][j].height) ? grid[i][j].height : 0) * 0) + height)) + (((1, 0, 0) * 1024) / 2));
						}
						if(grid[i][j].exits & 8)
						{
							loc_0000450E:
							line((0, 0, 1) + (j * (((isdefined(grid[i][j].height) ? grid[i][j].height : 0) * 0) + height)), grid[i][j].origin, (0, 0, 1) + (j * (((isdefined(grid[i][j].height) ? grid[i][j].height : 0) * 0) + height)) + (((0, 1, 0) * 1024) / 2));
						}
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_9a7586fd
	Namespace: namespace_21dd166c
	Checksum: 0x125A840C
	Offset: 0x45B8
	Size: 0x1CE
	Parameters: 2
	Flags: Private
*/
function private function_9a7586fd(center, height)
{
	/#
		level endon(#"hash_186e943c1cd0db52", #"hash_521118da55424987");
		if(!isdefined(height))
		{
			height = 0;
		}
		color = (1, 0, 1);
		while(true)
		{
			var_65e05a9d = [];
			array::push_front(var_65e05a9d, center);
			while(var_65e05a9d.size > 0)
			{
				cur = array::pop(var_65e05a9d);
				foreach(child in cur.children)
				{
					loc_000046F6:
					line(cur.origin + (0, 0, 1) * (((isdefined(cur.height) ? cur.height : 0) * 100) + height), child.origin + (0, 0, 1) * (((isdefined(child.height) ? child.height : 0) * 100) + height), color);
					array::push_front(var_65e05a9d, child);
				}
			}
			waitframe(1);
		}
	#/
}

