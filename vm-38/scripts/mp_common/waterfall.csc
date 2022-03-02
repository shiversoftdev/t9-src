#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\trigger_shared.csc;
#using scripts\core_common\water_surface.csc;

#namespace waterfall;

/*
	Name: function_7c8932f1
	Namespace: waterfall
	Checksum: 0x424F0B01
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7c8932f1()
{
	level notify(859378219);
}

/*
	Name: waterfalloverlay
	Namespace: waterfall
	Checksum: 0xB68EEC9D
	Offset: 0x110
	Size: 0xC0
	Parameters: 1
	Flags: None
*/
function waterfalloverlay(localclientnum)
{
	triggers = getentarray(localclientnum, "waterfall", "targetname");
	foreach(trigger in triggers)
	{
		trigger thread setupwaterfall(localclientnum);
	}
}

/*
	Name: waterfallmistoverlay
	Namespace: waterfall
	Checksum: 0xA3100985
	Offset: 0x1D8
	Size: 0xC0
	Parameters: 1
	Flags: None
*/
function waterfallmistoverlay(localclientnum)
{
	triggers = getentarray(localclientnum, "waterfall_mist", "targetname");
	foreach(trigger in triggers)
	{
		trigger thread setupwaterfallmist(localclientnum);
	}
}

/*
	Name: waterfallmistoverlayreset
	Namespace: waterfall
	Checksum: 0xA4D55F2C
	Offset: 0x2A0
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function waterfallmistoverlayreset(localclientnum)
{
	localplayer = function_5c10bd79(localclientnum);
	localplayer.rainopacity = 0;
}

/*
	Name: setupwaterfallmist
	Namespace: waterfall
	Checksum: 0xC3DB292D
	Offset: 0x2E8
	Size: 0x118
	Parameters: 1
	Flags: None
*/
function setupwaterfallmist(localclientnum)
{
	level notify("setupWaterfallmist_waterfall_csc" + localclientnum);
	level endon("setupWaterfallmist_waterfall_csc" + localclientnum);
	trigger = self;
	for(;;)
	{
		waitresult = undefined;
		waitresult = trigger waittill(#"trigger");
		trigplayer = waitresult.activator;
		if(!trigplayer function_21c0fa55())
		{
			continue;
		}
		localclientnum = trigplayer getlocalclientnumber();
		if(isdefined(localclientnum))
		{
			localplayer = function_5c10bd79(localclientnum);
		}
		else
		{
			localplayer = trigplayer;
		}
		trigger thread trigger::function_521edc64(localplayer, &trig_enter_waterfall_mist, &trig_leave_waterfall_mist);
	}
}

/*
	Name: setupwaterfall
	Namespace: waterfall
	Checksum: 0x2ED1E15F
	Offset: 0x408
	Size: 0x140
	Parameters: 2
	Flags: None
*/
function setupwaterfall(localclientnum, localowner)
{
	level notify(#"setupwaterfall_waterfall_csc" + string(localowner));
	level endon(#"setupwaterfall_waterfall_csc" + string(localowner));
	trigger = self;
	for(;;)
	{
		waitresult = undefined;
		waitresult = trigger waittill(#"trigger");
		trigplayer = waitresult.activator;
		if(!trigplayer function_21c0fa55())
		{
			continue;
		}
		localowner = trigplayer getlocalclientnumber();
		if(isdefined(localowner))
		{
			localplayer = function_5c10bd79(localowner);
		}
		else
		{
			localplayer = trigplayer;
		}
		trigger thread trigger::function_521edc64(localplayer, &trig_enter_waterfall, &trig_leave_waterfall);
	}
}

/*
	Name: trig_enter_waterfall
	Namespace: waterfall
	Checksum: 0x665374F0
	Offset: 0x550
	Size: 0xB8
	Parameters: 1
	Flags: None
*/
function trig_enter_waterfall(localplayer)
{
	trigger = self;
	localclientnum = localplayer.localclientnum;
	localplayer thread postfx::playpostfxbundle(#"pstfx_waterfall");
	playsound(0, #"amb_waterfall_hit", (0, 0, 0));
	while(trigger istouching(localplayer))
	{
		localplayer playrumbleonentity(localclientnum, "waterfall_rumble");
		wait(0.1);
	}
}

/*
	Name: trig_leave_waterfall
	Namespace: waterfall
	Checksum: 0xE5C1BE98
	Offset: 0x610
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function trig_leave_waterfall(localplayer)
{
	trigger = self;
	localclientnum = localplayer.localclientnum;
	localplayer postfx::stoppostfxbundle("pstfx_waterfall");
	if(isunderwater(localclientnum) == 0)
	{
		localplayer thread water_surface::startwatersheeting();
	}
}

/*
	Name: trig_enter_waterfall_mist
	Namespace: waterfall
	Checksum: 0xB95BB637
	Offset: 0x698
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function trig_enter_waterfall_mist(localplayer)
{
	localplayer endon(#"death");
	trigger = self;
	if(!isdefined(localplayer.rainopacity))
	{
		localplayer.rainopacity = 0;
	}
	while(trigger istouching(localplayer))
	{
		localclientnum = trigger.localclientnum;
		if(!isdefined(localclientnum))
		{
			localclientnum = localplayer getlocalclientnumber();
		}
		if(isunderwater(localclientnum))
		{
			break;
		}
		localplayer.rainopacity = localplayer.rainopacity + 0.003;
		if(localplayer.rainopacity > 1)
		{
			localplayer.rainopacity = 1;
		}
		waitframe(1);
	}
}

/*
	Name: trig_leave_waterfall_mist
	Namespace: waterfall
	Checksum: 0xC9F7C8ED
	Offset: 0x798
	Size: 0xDA
	Parameters: 1
	Flags: None
*/
function trig_leave_waterfall_mist(localplayer)
{
	localplayer endon(#"death");
	trigger = self;
	if(isdefined(localplayer.rainopacity))
	{
		while(!trigger istouching(localplayer) && localplayer.rainopacity > 0)
		{
			localclientnum = trigger.localclientnum;
			if(isunderwater(localclientnum))
			{
				break;
			}
			localplayer.rainopacity = localplayer.rainopacity - 0.005;
			waitframe(1);
		}
	}
	localplayer.rainopacity = 0;
}

