#namespace status_effect_wound;

/*
	Name: function_ea37c549
	Namespace: status_effect_wound
	Checksum: 0xD76B9ED4
	Offset: 0x60
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
	Namespace: status_effect_wound
	Checksum: 0x80F724D1
	Offset: 0xE0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_9b4598a4()
{
}

/*
	Name: function_94ce9f97
	Namespace: status_effect_wound
	Checksum: 0x80F724D1
	Offset: 0xF0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_94ce9f97()
{
}

