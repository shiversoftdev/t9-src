#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace claymore;

/*
	Name: function_db498246
	Namespace: claymore
	Checksum: 0xF8F53B8E
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_db498246()
{
	level notify(-1651612511);
}

/*
	Name: __init__system__
	Namespace: claymore
	Checksum: 0x2F9A9279
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"claymore", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: claymore
	Checksum: 0xE92A9DA4
	Offset: 0xE0
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
	Checksum: 0x5443B12C
	Offset: 0x120
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

