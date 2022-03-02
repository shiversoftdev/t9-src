#namespace shaderanim;

/*
	Name: animate_crack
	Namespace: shaderanim
	Checksum: 0x9C216B1C
	Offset: 0x78
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
	Checksum: 0xD30F068C
	Offset: 0x230
	Size: 0x44
	Parameters: 3
	Flags: None
*/
function shaderanim_update_opacity(entity, localclientnum, opacity)
{
	entity mapshaderconstant(localclientnum, 0, "scriptVector0", opacity, 0, 0, 0);
}

