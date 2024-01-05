#using scripts\core_common\water_surface.csc;
#using scripts\core_common\trigger_shared.csc;
#using scripts\core_common\postfx_shared.csc;

#namespace waterfall;

/*
	Name: waterfalloverlay
	Namespace: waterfall
	Checksum: 0x713D678A
	Offset: 0xF0
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
	Checksum: 0xE60FBA63
	Offset: 0x1B8
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
	Checksum: 0xA85A972A
	Offset: 0x280
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
	Checksum: 0xDD309970
	Offset: 0x2C8
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
	Checksum: 0x1C7001DC
	Offset: 0x3E8
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
	Checksum: 0x8E70B95A
	Offset: 0x530
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
	Checksum: 0xE8FC9031
	Offset: 0x5F0
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
	Checksum: 0x2D03462A
	Offset: 0x678
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
	Checksum: 0x75B90EFE
	Offset: 0x778
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

