#namespace scripted;

/*
	Name: main
	Namespace: scripted
	Checksum: 0x1FFC029F
	Offset: 0x78
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
	Checksum: 0xB55AE9E2
	Offset: 0xE0
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
	Checksum: 0xA889C338
	Offset: 0x138
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

