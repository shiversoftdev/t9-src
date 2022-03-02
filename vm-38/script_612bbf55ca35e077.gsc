#namespace namespace_deb2afd6;

/*
	Name: function_defdf5a3
	Namespace: namespace_deb2afd6
	Checksum: 0xDD9B1E0
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_defdf5a3()
{
	level notify(1935543601);
}

#namespace namespace_1b041925;

/*
	Name: function_70a657d8
	Namespace: namespace_1b041925
	Checksum: 0x80F724D1
	Offset: 0x80
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_815076cb
	Namespace: namespace_1b041925
	Checksum: 0x883E6F60
	Offset: 0x90
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function function_815076cb(var_fa8995f4, color)
{
	foreach(key in var_fa8995f4)
	{
		function_b4c6383f(key, 1, color);
	}
}

/*
	Name: function_ed8d6d5e
	Namespace: namespace_1b041925
	Checksum: 0x582A5C58
	Offset: 0x138
	Size: 0xB0
	Parameters: 4
	Flags: Linked
*/
function function_ed8d6d5e(var_fa8995f4, startcolor, var_fce18bda, fadetime)
{
	foreach(key in var_fa8995f4)
	{
		function_b4c6383f(key, 2, startcolor, var_fce18bda, fadetime);
	}
}

/*
	Name: function_119b3b6b
	Namespace: namespace_1b041925
	Checksum: 0xF9A22C41
	Offset: 0x1F0
	Size: 0xC8
	Parameters: 6
	Flags: Linked
*/
function function_119b3b6b(var_fa8995f4, color, var_276aa694, fadetime, var_109ec056, offset)
{
	foreach(key in var_fa8995f4)
	{
		function_b4c6383f(key, 4, color, var_276aa694, fadetime, var_109ec056, offset);
	}
}

/*
	Name: function_6f501c4
	Namespace: namespace_1b041925
	Checksum: 0x23582945
	Offset: 0x2C0
	Size: 0x90
	Parameters: 1
	Flags: None
*/
function function_6f501c4(var_fa8995f4)
{
	foreach(key in var_fa8995f4)
	{
		function_5e0ffde3(key);
	}
}

