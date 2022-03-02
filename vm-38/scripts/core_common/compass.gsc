#using script_d9b5c8b1ad38ef5;
#using scripts\core_common\match_record.gsc;

#namespace compass;

/*
	Name: function_2485be87
	Namespace: compass
	Checksum: 0xFACC3752
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2485be87()
{
	level notify(1209356582);
}

/*
	Name: setupminimap
	Namespace: compass
	Checksum: 0xA6A93201
	Offset: 0x100
	Size: 0x14C
	Parameters: 2
	Flags: Linked
*/
function setupminimap(material, zone)
{
	if(!isdefined(zone))
	{
		zone = "";
	}
	requiredmapaspectratio = getdvarfloat(#"scr_requiredmapaspectratio", 0);
	corners = territory::get_ent_array("minimap_corner", "targetname");
	if(corners.size == 0)
	{
		corners = territory::function_1deaf019("minimap_corner", "targetname", "");
	}
	if(corners.size != 2)
	{
		/#
			println("");
		#/
		return;
	}
	function_d6cba2e9(zone, corners[0].origin[0], corners[0].origin[1], corners[1].origin[0], corners[1].origin[1]);
}

/*
	Name: function_d6cba2e9
	Namespace: compass
	Checksum: 0xC8F4FA3
	Offset: 0x258
	Size: 0x33C
	Parameters: 5
	Flags: Linked
*/
function function_d6cba2e9(material, var_56a8cb79, var_47612cea, var_49fcbf2c, var_9815db69)
{
	if(!isdefined(material))
	{
		material = "";
	}
	corner0 = (var_56a8cb79, var_47612cea, 0);
	corner1 = (var_49fcbf2c, var_9815db69, 0);
	if(!isplayer(self))
	{
		match_record::function_7a93acec("compass_map_upper_left", corner0);
		match_record::function_7a93acec("compass_map_lower_right", corner1);
	}
	cornerdiff = corner1 - corner0;
	north = (cos(getnorthyaw()), sin(getnorthyaw()), 0);
	west = (0 - north[1], north[0], 0);
	if(vectordot(cornerdiff, west) > 0)
	{
		if(vectordot(cornerdiff, north) > 0)
		{
			northwest = corner1;
			southeast = corner0;
		}
		else
		{
			side = vecscale(north, vectordot(cornerdiff, north));
			northwest = corner1 - side;
			southeast = corner0 + side;
		}
	}
	else
	{
		if(vectordot(cornerdiff, north) > 0)
		{
			side = vecscale(north, vectordot(cornerdiff, north));
			northwest = corner0 + side;
			southeast = corner1 - side;
		}
		else
		{
			northwest = corner0;
			southeast = corner1;
		}
	}
	if(isplayer(self))
	{
		self function_fbb89d0b(material, northwest[0], northwest[1], southeast[0], southeast[1]);
		self function_813fd4e7(northwest[0], northwest[1], southeast[0], southeast[1]);
	}
	else
	{
		setminimap(material, northwest[0], northwest[1], southeast[0], southeast[1]);
		setminimapzone(northwest[0], northwest[1], southeast[0], southeast[1]);
	}
}

/*
	Name: setupminimapzone
	Namespace: compass
	Checksum: 0x4EF8D1C1
	Offset: 0x5A0
	Size: 0x2B4
	Parameters: 1
	Flags: None
*/
function setupminimapzone(zone)
{
	corners = getentarray(("zone_0" + zone) + "_corner", "targetname");
	if(corners.size != 2)
	{
		/#
			println("");
		#/
		return;
	}
	corner0 = (corners[0].origin[0], corners[0].origin[1], 0);
	corner1 = (corners[1].origin[0], corners[1].origin[1], 0);
	cornerdiff = corner1 - corner0;
	north = (cos(getnorthyaw()), sin(getnorthyaw()), 0);
	west = (0 - north[1], north[0], 0);
	if(vectordot(cornerdiff, west) > 0)
	{
		if(vectordot(cornerdiff, north) > 0)
		{
			northwest = corner1;
			southeast = corner0;
		}
		else
		{
			side = vecscale(north, vectordot(cornerdiff, north));
			northwest = corner1 - side;
			southeast = corner0 + side;
		}
	}
	else
	{
		if(vectordot(cornerdiff, north) > 0)
		{
			side = vecscale(north, vectordot(cornerdiff, north));
			northwest = corner0 + side;
			southeast = corner1 - side;
		}
		else
		{
			northwest = corner0;
			southeast = corner1;
		}
	}
	setminimapzone(northwest[0], northwest[1], southeast[0], southeast[1]);
}

/*
	Name: vecscale
	Namespace: compass
	Checksum: 0xE353B544
	Offset: 0x860
	Size: 0x3E
	Parameters: 2
	Flags: Linked
*/
function vecscale(vec, scalar)
{
	return (vec[0] * scalar, vec[1] * scalar, vec[2] * scalar);
}

