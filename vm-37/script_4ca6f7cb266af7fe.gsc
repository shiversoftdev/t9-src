#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace hacker_tool;

/*
	Name: init_shared
	Namespace: hacker_tool
	Checksum: 0x31A809A5
	Offset: 0xD8
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	clientfield::register("toplayer", "hacker_tool", 1, 2, "int", &player_hacking, 0, 0);
	level.hackingsoundid = [];
	level.hackingsweetspotid = [];
	level.friendlyhackingsoundid = [];
	callback::on_localplayer_spawned(&on_localplayer_spawned);
}

/*
	Name: on_localplayer_spawned
	Namespace: hacker_tool
	Checksum: 0x92291B55
	Offset: 0x178
	Size: 0x10C
	Parameters: 1
	Flags: None
*/
function on_localplayer_spawned(localclientnum)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	player = self;
	if(isdefined(level.hackingsoundid[localclientnum]))
	{
		player stoploopsound(level.hackingsoundid[localclientnum]);
		level.hackingsoundid[localclientnum] = undefined;
	}
	if(isdefined(level.hackingsweetspotid[localclientnum]))
	{
		player stoploopsound(level.hackingsweetspotid[localclientnum]);
		level.hackingsweetspotid[localclientnum] = undefined;
	}
	if(isdefined(level.friendlyhackingsoundid[localclientnum]))
	{
		player stoploopsound(level.friendlyhackingsoundid[localclientnum]);
		level.friendlyhackingsoundid[localclientnum] = undefined;
	}
}

/*
	Name: player_hacking
	Namespace: hacker_tool
	Checksum: 0x60972B6C
	Offset: 0x290
	Size: 0x464
	Parameters: 7
	Flags: None
*/
function player_hacking(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self notify(#"player_hacking_callback");
	player = self;
	if(isdefined(level.hackingsoundid[fieldname]))
	{
		player stoploopsound(level.hackingsoundid[fieldname]);
		level.hackingsoundid[fieldname] = undefined;
	}
	if(isdefined(level.hackingsweetspotid[fieldname]))
	{
		player stoploopsound(level.hackingsweetspotid[fieldname]);
		level.hackingsweetspotid[fieldname] = undefined;
	}
	if(isdefined(level.friendlyhackingsoundid[fieldname]))
	{
		player stoploopsound(level.friendlyhackingsoundid[fieldname]);
		level.friendlyhackingsoundid[fieldname] = undefined;
	}
	if(isdefined(player.targetent))
	{
		player.targetent.isbreachingfirewall = 0;
		player.targetent = undefined;
	}
	if(bwastimejump == 2)
	{
		player thread watchhackspeed(fieldname, 0);
		setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "status"), 2);
	}
	else
	{
		if(bwastimejump == 3)
		{
			player thread watchhackspeed(fieldname, 1);
			setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "status"), 1);
		}
		else
		{
			if(bwastimejump == 1)
			{
				setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "status"), 0);
				setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "perc"), 0);
				setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "offsetShaderValue"), "0 0 0 0");
				self thread watchforemp(fieldname);
			}
			else
			{
				setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "status"), 0);
				setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "perc"), 0);
				setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "offsetShaderValue"), "0 0 0 0");
			}
		}
	}
}

/*
	Name: watchhackspeed
	Namespace: hacker_tool
	Checksum: 0xD1923171
	Offset: 0x700
	Size: 0xB4
	Parameters: 2
	Flags: None
*/
function watchhackspeed(localclientnum, isbreachingfirewall)
{
	self endon(#"death");
	self endon(#"player_hacking_callback");
	player = self;
	for(;;)
	{
		targetentarray = self gettargetlockentityarray();
		if(targetentarray.size > 0)
		{
			targetent = targetentarray[0];
			break;
		}
		wait(0.02);
	}
	targetent watchtargethack(localclientnum, player, isbreachingfirewall);
}

/*
	Name: watchtargethack
	Namespace: hacker_tool
	Checksum: 0x131AF938
	Offset: 0x7C0
	Size: 0x428
	Parameters: 3
	Flags: None
*/
function watchtargethack(localclientnum, player, isbreachingfirewall)
{
	self endon(#"death");
	player endon(#"death");
	self endon(#"player_hacking_callback");
	targetent = self;
	player.targetent = targetent;
	if(isbreachingfirewall)
	{
		targetent.isbreachingfirewall = 1;
	}
	targetent thread watchhackerplayershutdown(localclientnum, player, targetent);
	for(;;)
	{
		distancefromcenter = targetent getdistancefromscreencenter(localclientnum);
		inverse = 40 - distancefromcenter;
		ratio = inverse / 40;
		heatval = getweaponhackratio(localclientnum);
		ratio = ((ratio * ratio) * ratio) * ratio;
		if(ratio > 1 || ratio < 0.001)
		{
			ratio = 0;
			horizontal = 0;
		}
		else
		{
			horizontal = targetent gethorizontaloffsetfromscreencenter(localclientnum, 40);
		}
		setuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"blackhat"), "offsetShaderValue"), ((horizontal + " ") + ratio) + " 0 0");
		setuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"blackhat"), "perc"), heatval);
		if(ratio > 0.8)
		{
			if(!isdefined(level.hackingsweetspotid[localclientnum]))
			{
				level.hackingsweetspotid[localclientnum] = player playloopsound(#"evt_hacker_hacking_sweet");
			}
		}
		else
		{
			if(isdefined(level.hackingsweetspotid[localclientnum]))
			{
				player stoploopsound(level.hackingsweetspotid[localclientnum]);
				level.hackingsweetspotid[localclientnum] = undefined;
			}
			if(!isdefined(level.hackingsoundid[localclientnum]))
			{
				level.hackingsoundid[localclientnum] = player playloopsound(#"evt_hacker_hacking_loop");
			}
			if(isdefined(level.hackingsoundid[localclientnum]))
			{
				setsoundpitch(level.hackingsoundid[localclientnum], ratio);
			}
		}
		if(!isbreachingfirewall)
		{
			friendlyhacking = weaponfriendlyhacking(localclientnum);
			if(friendlyhacking && !isdefined(level.friendlyhackingsoundid[localclientnum]))
			{
				level.friendlyhackingsoundid[localclientnum] = player playloopsound(#"evt_hacker_hacking_loop_mult");
			}
			else if(!friendlyhacking && isdefined(level.friendlyhackingsoundid[localclientnum]))
			{
				player stoploopsound(level.friendlyhackingsoundid[localclientnum]);
				level.friendlyhackingsoundid[localclientnum] = undefined;
			}
		}
		wait(0.1);
	}
}

/*
	Name: watchhackerplayershutdown
	Namespace: hacker_tool
	Checksum: 0x8552517A
	Offset: 0xBF0
	Size: 0x82
	Parameters: 3
	Flags: None
*/
function watchhackerplayershutdown(localclientnum, hackerplayer, targetent)
{
	self endon(#"death");
	killstreakentity = self;
	hackerplayer endon(#"player_hacking_callback");
	hackerplayer waittill(#"death");
	if(isdefined(targetent))
	{
		targetent.isbreachingfirewall = 1;
	}
}

/*
	Name: watchforemp
	Namespace: hacker_tool
	Checksum: 0x22425848
	Offset: 0xC80
	Size: 0xF8
	Parameters: 1
	Flags: None
*/
function watchforemp(localclientnum)
{
	self endon(#"death");
	self endon(#"player_hacking_callback");
	while(true)
	{
		if(self isempjammed())
		{
			setuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"blackhat"), "status"), 3);
		}
		else
		{
			setuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"blackhat"), "status"), 0);
		}
		wait(0.1);
	}
}

