#namespace shaderanim_shared;

/*
	Name: function_3e669627
	Namespace: shaderanim_shared
	Checksum: 0x62BE9863
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3e669627()
{
	level notify(-218527805);
}

#namespace shaderanim;

/*
	Name: animate_crack
	Namespace: shaderanim
	Checksum: 0x344E2A5F
	Offset: 0x98
	Size: 0x1AC
	Parameters: 6
	Flags: Linked
*/
function animate_crack(localclientnum, vectorname, delay, duration, start, end)
{
	self endon(#"death");
	delayseconds = delay / 60;
	wait(delayseconds);
	direction = 1;
	if(start > end)
	{
		direction = -1;
	}
	durationseconds = duration / 60;
	valstep = 0;
	if(durationseconds > 0)
	{
		valstep = (end - start) / (durationseconds / 0.01);
	}
	timestep = 0.01 * direction;
	value = start;
	self mapshaderconstant(localclientnum, 0, vectorname, value, 0, 0, 0);
	i = 0;
	while(i < durationseconds)
	{
		value = value + valstep;
		wait(0.01);
		self mapshaderconstant(localclientnum, 0, vectorname, value, 0, 0, 0);
		i = i + timestep;
	}
	self mapshaderconstant(localclientnum, 0, vectorname, end, 0, 0, 0);
}

/*
	Name: shaderanim_update_opacity
	Namespace: shaderanim
	Checksum: 0xBB8389B7
	Offset: 0x250
	Size: 0x44
	Parameters: 3
	Flags: None
*/
function shaderanim_update_opacity(entity, localclientnum, opacity)
{
	entity mapshaderconstant(localclientnum, 0, "scriptVector0", opacity, 0, 0, 0);
}

