#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace trapd;

/*
	Name: __init__system__
	Namespace: trapd
	Checksum: 0x7C067EAB
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"trapd", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: trapd
	Checksum: 0xDB200463
	Offset: 0xF8
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::add_weapon_type(#"mine_trapd", &function_9f6d38cf);
	callback::add_weapon_type(#"claymore_trapd", &function_9f6d38cf);
}

/*
	Name: function_9f6d38cf
	Namespace: trapd
	Checksum: 0xC5DEC744
	Offset: 0x168
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_9f6d38cf(localclientnum)
{
	self thread fx_think(localclientnum);
}

/*
	Name: fx_think
	Namespace: trapd
	Checksum: 0xB7D61410
	Offset: 0x198
	Size: 0xF8
	Parameters: 1
	Flags: None
*/
function fx_think(localclientnum)
{
	self notify(#"light_disable");
	self endon(#"light_disable");
	self endon(#"death");
	self util::waittill_dobj(localclientnum);
	for(;;)
	{
		self stop_light_fx(localclientnum);
		localplayer = function_5c10bd79(localclientnum);
		self start_light_fx(localclientnum);
		util::server_wait(localclientnum, 0.3, 0.01, "player_switch");
		self util::waittill_dobj(localclientnum);
	}
}

/*
	Name: start_light_fx
	Namespace: trapd
	Checksum: 0x5D1F34F7
	Offset: 0x298
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function start_light_fx(localclientnum)
{
	self.fx = util::playfxontag(localclientnum, "weapon/fx8_equip_light_os", self, "tag_fx");
}

/*
	Name: stop_light_fx
	Namespace: trapd
	Checksum: 0x9A2967C8
	Offset: 0x2E0
	Size: 0x4E
	Parameters: 1
	Flags: None
*/
function stop_light_fx(localclientnum)
{
	if(isdefined(self.fx) && self.fx != 0)
	{
		stopfx(localclientnum, self.fx);
		self.fx = undefined;
	}
}

