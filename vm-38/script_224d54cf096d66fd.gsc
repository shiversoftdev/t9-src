#namespace scripted;

/*
	Name: function_1da0f3ab
	Namespace: scripted
	Checksum: 0xDDBF0D6E
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1da0f3ab()
{
	level notify(765076336);
}

/*
	Name: main
	Namespace: scripted
	Checksum: 0x5DD0FC07
	Offset: 0x98
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function main()
{
	self notify(#"killanimscript");
	self notify(#"clearsuppressionattack");
	self.codescripted[#"root"] = "body";
	self.a.script = "scripted";
}

/*
	Name: init
	Namespace: scripted
	Checksum: 0x5F60A820
	Offset: 0x100
	Size: 0x4C
	Parameters: 9
	Flags: None
*/
function init(notifyname, origin, angles, theanim, animmode, root, rate, goaltime, lerptime)
{
}

/*
	Name: end_script
	Namespace: scripted
	Checksum: 0xF96E2C7D
	Offset: 0x158
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function end_script()
{
	if(isdefined(self.___archetypeonbehavecallback))
	{
		[[self.___archetypeonbehavecallback]](self);
	}
}

