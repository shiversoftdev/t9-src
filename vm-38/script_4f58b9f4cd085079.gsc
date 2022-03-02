#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace trophy_system;

/*
	Name: function_2701f404
	Namespace: trophy_system
	Checksum: 0x1912AEC1
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2701f404()
{
	level notify(1136458042);
}

/*
	Name: init_shared
	Namespace: trophy_system
	Checksum: 0x18B582BE
	Offset: 0xC0
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	clientfield::register("missile", "" + #"trophy_system_deploy", 1, 1, "int", &function_a485f3cf, 0, 0);
	clientfield::register("missile", "" + #"hash_78a094001c919359", 1, 7, "float", &function_799a68b6, 0, 0);
}

/*
	Name: function_a485f3cf
	Namespace: trophy_system
	Checksum: 0x91BAD479
	Offset: 0x180
	Size: 0xA2
	Parameters: 7
	Flags: None
*/
function function_a485f3cf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 1:
		{
			self thread function_82dd67c1(fieldname);
			break;
		}
		case 0:
		{
			self thread function_ce24311a(fieldname);
			break;
		}
	}
}

/*
	Name: function_82dd67c1
	Namespace: trophy_system
	Checksum: 0xFAC43D19
	Offset: 0x230
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_82dd67c1(localclientnum)
{
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	self useanimtree("generic");
	self setanim(#"hash_70b2041b1f6ad89", 1, 0, 0);
}

/*
	Name: function_ce24311a
	Namespace: trophy_system
	Checksum: 0x792D0BBF
	Offset: 0x2B8
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_ce24311a(localclientnum)
{
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	self useanimtree("generic");
	self setanim(#"hash_70b2041b1f6ad89");
	wait(getanimlength(#"hash_70b2041b1f6ad89"));
	if(!self hasanimtree())
	{
		return;
	}
	self clearanim(#"hash_70b2041b1f6ad89", 0);
	self setanim(#"hash_3c4ee18df7d43dc7", 1, 0, 2);
}

/*
	Name: function_799a68b6
	Namespace: trophy_system
	Checksum: 0xEE1473C9
	Offset: 0x3C0
	Size: 0x3C
	Parameters: 7
	Flags: None
*/
function function_799a68b6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
}

