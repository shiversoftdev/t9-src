#namespace path;

/*
	Name: function_a760f3bf
	Namespace: path
	Checksum: 0xF46870D3
	Offset: 0x60
	Size: 0x128
	Parameters: 5
	Flags: Private
*/
function private function_a760f3bf(path, var_bc114662, point_color, line_color, var_80bf7c44)
{
	/#
		/#
			assert(isdefined(path));
		#/
		for(i = 0; i < path.size; i++)
		{
			if(isdefined(path[i + 1]))
			{
				direction = vectornormalize((path[i + 1]) - path[i]);
				radius = (distance(path[i], path[i + 1])) / 2;
				center = path[i] + vectorscale(direction, radius);
				[[var_bc114662]](path[i], path[i + 1], center, radius, point_color, line_color, var_80bf7c44);
			}
		}
	#/
}

/*
	Name: function_d88e0349
	Namespace: path
	Checksum: 0xBC520002
	Offset: 0x190
	Size: 0xAC
	Parameters: 7
	Flags: Private
*/
function private function_d88e0349(path_1, path_2, center, radius, point_color, line_color, var_80bf7c44)
{
	/#
		recordline(path_1, path_2, line_color, "");
		recordsphere(path_1, 2, point_color, "");
		recordcircle(center, radius, var_80bf7c44, "");
	#/
}

/*
	Name: function_bb43c529
	Namespace: path
	Checksum: 0x3B77200D
	Offset: 0x248
	Size: 0xB4
	Parameters: 7
	Flags: Private
*/
function private function_bb43c529(path_1, path_2, center, radius, point_color, line_color, var_80bf7c44)
{
	/#
		line(path_1, path_2, point_color, 1, 1);
		sphere(path_1, 5, line_color, 1, 1);
		circle(center, radius, var_80bf7c44, 0, 1, 1);
	#/
}

/*
	Name: function_3c367117
	Namespace: path
	Checksum: 0xB0FFA782
	Offset: 0x308
	Size: 0x8C
	Parameters: 4
	Flags: None
*/
function function_3c367117(path_points, point_color, line_color, var_80bf7c44)
{
	/#
		if(!isdefined(point_color))
		{
			point_color = (0, 0, 1);
		}
		if(!isdefined(line_color))
		{
			line_color = (0, 1, 0);
		}
		if(!isdefined(var_80bf7c44))
		{
			var_80bf7c44 = (1, 0.5, 0);
		}
		function_a760f3bf(path_points, &function_d88e0349, point_color, line_color, var_80bf7c44);
	#/
}

/*
	Name: function_aa9bfd9d
	Namespace: path
	Checksum: 0x752CADEA
	Offset: 0x3A0
	Size: 0x8C
	Parameters: 4
	Flags: None
*/
function function_aa9bfd9d(path_points, point_color, line_color, var_80bf7c44)
{
	/#
		if(!isdefined(point_color))
		{
			point_color = (0, 0, 1);
		}
		if(!isdefined(line_color))
		{
			line_color = (0, 1, 0);
		}
		if(!isdefined(var_80bf7c44))
		{
			var_80bf7c44 = (1, 0.5, 0);
		}
		function_a760f3bf(path_points, &function_bb43c529, point_color, line_color, var_80bf7c44);
	#/
}

