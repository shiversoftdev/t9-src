#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace destructible;

/*
	Name: function_78177c3d
	Namespace: destructible
	Checksum: 0x7E8D7F7F
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_78177c3d()
{
	level notify(1041280591);
}

/*
	Name: function_89f2df9
	Namespace: destructible
	Checksum: 0x8C96576
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"destructible", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: destructible
	Checksum: 0x5FE614B5
	Offset: 0x120
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "start_destructible_explosion", 1, 10, "int", &doexplosion, 0, 0);
}

/*
	Name: playgrenaderumble
	Namespace: destructible
	Checksum: 0x8D52AB6A
	Offset: 0x178
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function playgrenaderumble(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	playrumbleonposition(bwastimejump, "grenade_rumble", self.origin);
	earthquake(bwastimejump, 0.5, 0.5, self.origin, 800);
}

/*
	Name: doexplosion
	Namespace: destructible
	Checksum: 0x5A725FCD
	Offset: 0x218
	Size: 0x104
	Parameters: 7
	Flags: Linked
*/
function doexplosion(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 0)
	{
		return;
	}
	physics_explosion = 0;
	if(bwastimejump & (1 << 9))
	{
		physics_explosion = 1;
		bwastimejump = bwastimejump - (1 << 9);
	}
	physics_force = 0.3;
	if(physics_explosion && bwastimejump > 0)
	{
		physicsexplosionsphere(fieldname, self.origin, bwastimejump, bwastimejump - 1, physics_force, 25, 400);
	}
	playgrenaderumble(fieldname, self.origin);
}

