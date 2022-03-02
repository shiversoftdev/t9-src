#using script_6167e26342be354b;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace hud_message_shared;

/*
	Name: function_d3ba9c7f
	Namespace: hud_message_shared
	Checksum: 0x692316CD
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d3ba9c7f()
{
	level notify(1859269274);
}

#namespace hud_message;

/*
	Name: function_89f2df9
	Namespace: hud_message
	Checksum: 0xC1DFF94
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hud_message", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: hud_message
	Checksum: 0x5946675C
	Offset: 0xF8
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
}

/*
	Name: init
	Namespace: hud_message
	Checksum: 0x80F724D1
	Offset: 0x128
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init()
{
}

/*
	Name: playnotifyloop
	Namespace: hud_message
	Checksum: 0xD2F13D60
	Offset: 0x138
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function playnotifyloop(duration)
{
	playnotifyloop = spawn("script_origin", (0, 0, 0));
	playnotifyloop playloopsound(#"uin_notify_data_loop");
	duration = duration - 4;
	if(duration < 1)
	{
		duration = 1;
	}
	wait(duration);
	playnotifyloop delete();
}

/*
	Name: setlowermessage
	Namespace: hud_message
	Checksum: 0xB70C82DD
	Offset: 0x1D8
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function setlowermessage(text, time)
{
	self notify(#"hash_6ceeeb477ece797b");
	if(isdefined(time) && time > 0)
	{
		self luinotifyevent(#"hash_424b9c54c8bf7a82", 2, text, int(time));
	}
	else
	{
		self luinotifyevent(#"hash_424b9c54c8bf7a82", 1, text);
	}
}

/*
	Name: clearlowermessage
	Namespace: hud_message
	Checksum: 0x3E8F0D9
	Offset: 0x288
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function clearlowermessage()
{
	self endon(#"hash_6ceeeb477ece797b");
	if(!isplayer(self))
	{
		return;
	}
	self luinotifyevent(#"hash_6b9a1c6794314120");
}

/*
	Name: isintop
	Namespace: hud_message
	Checksum: 0xBA0D4B32
	Offset: 0x2E8
	Size: 0x56
	Parameters: 2
	Flags: None
*/
function isintop(players, topn)
{
	for(i = 0; i < topn; i++)
	{
		if(isdefined(players[i]) && self == players[i])
		{
			return true;
		}
	}
	return false;
}

