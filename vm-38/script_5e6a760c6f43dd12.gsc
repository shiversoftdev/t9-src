#namespace namespace_94e44221;

/*
	Name: function_af549df2
	Namespace: namespace_94e44221
	Checksum: 0x44167218
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_af549df2()
{
	level notify(1639565952);
}

/*
	Name: update
	Namespace: namespace_94e44221
	Checksum: 0x649A7C29
	Offset: 0x80
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function update()
{
	if(self isplayerunderwater())
	{
		self bottapbutton(67);
	}
}

