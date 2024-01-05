#using scripts\core_common\math_shared.csc;

#namespace gfx_shared;

/*
	Name: function_b8a17f4f
	Namespace: gfx_shared
	Checksum: 0x26D0DEC1
	Offset: 0x128
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b8a17f4f()
{
	level notify(-730002095);
}

#namespace gfx;

/*
	Name: setstage
	Namespace: gfx
	Checksum: 0x494B3B95
	Offset: 0x148
	Size: 0x578
	Parameters: 8
	Flags: None
*/
function setstage(localclientnum, bundle, filterid, stageprefix, stagelength, accumtime, totalaccumtime, setconstants)
{
	num_consts = getstructfieldorzero(bundle, stageprefix + "num_consts");
	for(constidx = 0; constidx < num_consts; constidx++)
	{
		constprefix = stageprefix + "c";
		if(constidx < 10)
		{
			constprefix = constprefix + "0";
		}
		constprefix = constprefix + (constidx + "_");
		startvalue = getshaderconstantvalue(bundle, constprefix, "start", 0);
		endvalue = getshaderconstantvalue(bundle, constprefix, "end", 0);
		delays = getshaderconstantvalue(bundle, constprefix, "delay", 1);
		channels = bundle.(constprefix + "channels");
		iscolor = isstring(channels) && (channels == "color" || channels == ("color+alpha"));
		animname = bundle.(constprefix + "anm");
		values = [];
		for(i = 0; i < 4; i++)
		{
			values[i] = 0;
		}
		for(chanidx = 0; chanidx < startvalue.size; chanidx++)
		{
			delaytime = int(delays[(iscolor ? 0 : chanidx)] * 1000);
			if(accumtime > delaytime && stagelength > delaytime)
			{
				timeratio = (accumtime - delaytime) / (stagelength - delaytime);
				timeratio = math::clamp(timeratio, 0, 1);
				lerpratio = 0;
				delta = endvalue[chanidx] - startvalue[chanidx];
				switch(animname)
				{
					case "linear":
					{
						lerpratio = timeratio;
						break;
					}
					case "step":
					{
						lerpratio = 1;
						break;
					}
					case "ease in":
					{
						lerpratio = timeratio * timeratio;
						break;
					}
					case "ease out":
					{
						lerpratio = (timeratio * -1) * (timeratio - 2);
						break;
					}
					case "ease inout":
					{
						timeratio = timeratio * 2;
						if(timeratio < 1)
						{
							lerpratio = (0.5 * lerpratio) * lerpratio;
						}
						else
						{
							timeratio = timeratio - 1;
							lerpratio = -0.5 * ((lerpratio * (lerpratio - 2)) - 1);
						}
						break;
					}
					case "linear repeat":
					{
						lerpratio = timeratio;
						break;
					}
					case "linear mirror":
					{
						if(timeratio > 0.5)
						{
							lerpratio = 1 - timeratio;
						}
						else
						{
							lerpratio = timeratio;
						}
						break;
					}
					case "sin":
					{
						lerpratio = 0.5 - (0.5 * (cos(360 * timeratio)));
						break;
					}
					default:
					{
						break;
					}
				}
				lerpratio = math::clamp(lerpratio, 0, 1);
				values[chanidx] = startvalue[chanidx] + (lerpratio * delta);
				continue;
			}
			values[chanidx] = startvalue[chanidx];
		}
		[[setconstants]](localclientnum, bundle.(constprefix + "name"), filterid, values);
	}
	stageconstants = [];
	stageconstants[0] = totalaccumtime;
	stageconstants[1] = accumtime;
	stageconstants[2] = stagelength;
	stageconstants[3] = 0;
	[[setconstants]](localclientnum, "scriptvector7", filterid, stageconstants);
}

/*
	Name: getshaderconstantvalue
	Namespace: gfx
	Checksum: 0x7E3D2565
	Offset: 0x6C8
	Size: 0x4AE
	Parameters: 4
	Flags: None
*/
function getshaderconstantvalue(bundle, constprefix, constname, delay)
{
	channels = bundle.(constprefix + "channels");
	if(delay && isstring(channels) && (channels == "color" || channels == ("color+alpha")))
	{
		channels = 1;
	}
	vals = [];
	switch(channels)
	{
		case 1:
		case "1":
		{
			vals[0] = getstructfieldorzero(bundle, (constprefix + constname) + "_x");
			break;
		}
		case 2:
		case "2":
		{
			vals[0] = getstructfieldorzero(bundle, (constprefix + constname) + "_x");
			vals[1] = getstructfieldorzero(bundle, (constprefix + constname) + "_y");
			break;
		}
		case 3:
		case "3":
		{
			vals[0] = getstructfieldorzero(bundle, (constprefix + constname) + "_x");
			vals[1] = getstructfieldorzero(bundle, (constprefix + constname) + "_y");
			vals[2] = getstructfieldorzero(bundle, (constprefix + constname) + "_z");
			break;
		}
		case 4:
		case "4":
		{
			vals[0] = getstructfieldorzero(bundle, (constprefix + constname) + "_x");
			vals[1] = getstructfieldorzero(bundle, (constprefix + constname) + "_y");
			vals[2] = getstructfieldorzero(bundle, (constprefix + constname) + "_z");
			vals[3] = getstructfieldorzero(bundle, (constprefix + constname) + "_w");
			break;
		}
		case "color":
		{
			vals[0] = getstructfieldorzero(bundle, (constprefix + constname) + "_clr_r");
			vals[1] = getstructfieldorzero(bundle, (constprefix + constname) + "_clr_g");
			vals[2] = getstructfieldorzero(bundle, (constprefix + constname) + "_clr_b");
			break;
		}
		case "color+alpha":
		{
			vals[0] = getstructfieldorzero(bundle, (constprefix + constname) + "_clr_r");
			vals[1] = getstructfieldorzero(bundle, (constprefix + constname) + "_clr_g");
			vals[2] = getstructfieldorzero(bundle, (constprefix + constname) + "_clr_b");
			vals[3] = getstructfieldorzero(bundle, (constprefix + constname) + "_clr_a");
			break;
		}
	}
	return vals;
}

/*
	Name: getstructfieldorzero
	Namespace: gfx
	Checksum: 0x73626937
	Offset: 0xB80
	Size: 0x3E
	Parameters: 2
	Flags: None
*/
function getstructfieldorzero(bundle, field)
{
	ret = bundle.(field);
	if(!isdefined(ret))
	{
		ret = 0;
	}
	return ret;
}

/*
	Name: getshaderconstantindex
	Namespace: gfx
	Checksum: 0x80A37398
	Offset: 0xBC8
	Size: 0xCE
	Parameters: 1
	Flags: None
*/
function getshaderconstantindex(codeconstname)
{
	switch(codeconstname)
	{
		case "scriptvector0":
		{
			return 0;
		}
		case "scriptvector1":
		{
			return 4;
		}
		case "scriptvector2":
		{
			return 8;
		}
		case "scriptvector3":
		{
			return 12;
		}
		case "scriptvector4":
		{
			return 16;
		}
		case "scriptvector5":
		{
			return 20;
		}
		case "scriptvector6":
		{
			return 24;
		}
		case "scriptvector7":
		{
			return 28;
		}
	}
	return -1;
}

