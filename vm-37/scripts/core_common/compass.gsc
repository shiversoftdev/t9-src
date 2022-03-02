#using script_d9b5c8b1ad38ef5;
#using scripts\core_common\match_record.gsc;

#namespace compass;

/*
	Name: setupminimap
	Namespace: compass
	Checksum: 0x79AAD490
	Offset: 0xE0
	Size: 0x14C
	Parameters: 2
	Flags: None
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
	Checksum: 0x9F939D89
	Offset: 0x238
	Size: 0x2A4
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
	match_record::function_7a93acec("compass_map_upper_left", corner0);
	match_record::function_7a93acec("compass_map_lower_right", corner1);
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
	setminimap(material, northwest[0], northwest[1], southeast[0], southeast[1]);
	setminimapzone(northwest[0], northwest[1], southeast[0], southeast[1]);
}

/*
	Name: setupminimapzone
	Namespace: compass
	Checksum: 0x9FEA16F
	Offset: 0x4E8
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
	Checksum: 0xC7C4850C
	Offset: 0x7A8
	Size: 0x3E
	Parameters: 2
	Flags: Linked
*/
function vecscale(vec, scalar)
{
	return (vec[0] * scalar, vec[1] * scalar, vec[2] * scalar);
}

