#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace destructible;

/*
	Name: function_89f2df9
	Namespace: destructible
	Checksum: 0xA7E6C202
	Offset: 0xB8
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
	Checksum: 0xFA480CCF
	Offset: 0x100
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
	Checksum: 0x278E1E5F
	Offset: 0x158
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
	Checksum: 0x7D2E2B7A
	Offset: 0x1F8
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

