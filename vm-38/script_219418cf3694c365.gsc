#namespace namespace_8fe9f293;

/*
	Name: function_e4efa034
	Namespace: namespace_8fe9f293
	Checksum: 0xAD8215FE
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e4efa034()
{
	level notify(1931357535);
}

/*
	Name: function_ea37c549
	Namespace: namespace_8fe9f293
	Checksum: 0xA363BF2E
	Offset: 0x80
	Size: 0x74
	Parameters: 7
	Flags: None
*/
function function_ea37c549(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump != 0)
	{
		self thread function_9b4598a4();
	}
	else
	{
		self thread function_94ce9f97();
	}
}

/*
	Name: function_9b4598a4
	Namespace: namespace_8fe9f293
	Checksum: 0x80F724D1
	Offset: 0x100
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_9b4598a4()
{
}

/*
	Name: function_94ce9f97
	Namespace: namespace_8fe9f293
	Checksum: 0x80F724D1
	Offset: 0x110
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_94ce9f97()
{
}

