#namespace behave;

/*
	Name: function_2fa94010
	Namespace: behave
	Checksum: 0x51F10BB6
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2fa94010()
{
	level notify(701784346);
}

/*
	Name: main
	Namespace: behave
	Checksum: 0x431754B9
	Offset: 0x80
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function main()
{
	if(isdefined(self.var_7401c936))
	{
		[[self.var_7401c936]](self);
	}
}

/*
	Name: end_script
	Namespace: behave
	Checksum: 0x37140FB4
	Offset: 0xA8
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function end_script()
{
	if(isdefined(self.___archetypeonanimscriptedcallback))
	{
		[[self.___archetypeonanimscriptedcallback]](self);
	}
}

