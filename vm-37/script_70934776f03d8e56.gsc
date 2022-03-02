#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace antipersonnel_guidance;

/*
	Name: function_89f2df9
	Namespace: antipersonnel_guidance
	Checksum: 0xA0A15E43
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"multilockap_guidance", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: antipersonnel_guidance
	Checksum: 0xA49459E8
	Offset: 0xB8
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level thread player_init();
}

/*
	Name: player_init
	Namespace: antipersonnel_guidance
	Checksum: 0x62628ABB
	Offset: 0xE0
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function player_init()
{
	util::waitforclient(0);
	players = getlocalplayers();
	foreach(player in players)
	{
		player thread watch_lockon(0);
	}
}

/*
	Name: watch_lockon
	Namespace: antipersonnel_guidance
	Checksum: 0x65011E69
	Offset: 0x1A0
	Size: 0x12E
	Parameters: 1
	Flags: None
*/
function watch_lockon(localclientnum)
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"lockon_changed");
		state = waitresult.state;
		target = waitresult.target;
		if(isdefined(self.replay_lock) && (!isdefined(target) || self.replay_lock != target))
		{
			self.ap_lock = undefined;
		}
		switch(state)
		{
			case 0:
			case 1:
			case 3:
			{
				break;
			}
			case 2:
			case 4:
			{
				self.ap_lock = target;
				break;
			}
		}
	}
}

