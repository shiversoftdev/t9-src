#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace multilockapguidance;

/*
	Name: function_eb51d4a3
	Namespace: multilockapguidance
	Checksum: 0xE055BEF
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eb51d4a3()
{
	level notify(772839944);
}

#namespace antipersonnel_guidance;

/*
	Name: function_89f2df9
	Namespace: antipersonnel_guidance
	Checksum: 0xF8EF937
	Offset: 0x90
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
	Checksum: 0xBC1DE109
	Offset: 0xD8
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
	Checksum: 0x6D92BFF9
	Offset: 0x100
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
	Checksum: 0x669785E5
	Offset: 0x1C0
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

