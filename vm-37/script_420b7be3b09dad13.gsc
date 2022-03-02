#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace claymore;

/*
	Name: function_89f2df9
	Namespace: claymore
	Checksum: 0x80B5350D
	Offset: 0x78
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"claymore", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: claymore
	Checksum: 0x42F6EF56
	Offset: 0xC0
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::add_weapon_type(#"claymore", &claymore_spawned);
}

/*
	Name: claymore_spawned
	Namespace: claymore
	Checksum: 0xF32E112B
	Offset: 0x100
	Size: 0x90
	Parameters: 1
	Flags: None
*/
function claymore_spawned(localclientnum)
{
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	while(true)
	{
		if(isdefined(self.stunned) && self.stunned)
		{
			wait(0.1);
			continue;
		}
		self waittill(#"stunned");
		stopfx(localclientnum, self.claymorelaserfxid);
	}
}

