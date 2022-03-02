#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace cinematicmotion;

/*
	Name: function_89f2df9
	Namespace: cinematicmotion
	Checksum: 0x7ECBCFD7
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"cinematicmotion", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: cinematicmotion
	Checksum: 0x38B32BE2
	Offset: 0x100
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_70a657d8(localclientnum)
{
	n_bits = getminbitcountfornum(11);
	clientfield::register("toplayer", "cinematicMotion", 1, n_bits, "int", &function_877ad7c4, 0, 1);
}

/*
	Name: function_877ad7c4
	Namespace: cinematicmotion
	Checksum: 0x717A0082
	Offset: 0x180
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_877ad7c4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(fieldname != bwastimejump)
	{
		self function_c64b5405(bwastimejump);
	}
}

/*
	Name: function_c64b5405
	Namespace: cinematicmotion
	Checksum: 0x70A4C2B6
	Offset: 0x1E8
	Size: 0x23A
	Parameters: 1
	Flags: Linked
*/
function function_c64b5405(newval)
{
	if(!isdefined(self) || !isalive(self))
	{
		return;
	}
	switch(newval)
	{
		case 0:
		{
			self function_eadd0084();
			break;
		}
		case 1:
		{
			self function_7aa6104();
			break;
		}
		case 2:
		{
			self function_19690481();
			break;
		}
		case 3:
		{
			self function_7f56196();
			break;
		}
		case 4:
		{
			self function_19a404f3();
			break;
		}
		case 5:
		{
			self function_f27b36a2();
			break;
		}
		case 6:
		{
			self function_4887c796();
			break;
		}
		case 7:
		{
			self function_22441ab3();
			break;
		}
		case 8:
		{
			self function_5a740afe();
			break;
		}
		case 9:
		{
			self function_681e2652();
			break;
		}
		case 10:
		{
			self function_bd015017();
			break;
		}
		case 11:
		{
			self function_ccb26f79();
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_8152b11
	Namespace: cinematicmotion
	Checksum: 0x732773E1
	Offset: 0x430
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_8152b11(param)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	if(param != "")
	{
		self setcinematicmotionoverride(param);
	}
	else
	{
		self setcinematicmotionoverride();
	}
}

/*
	Name: function_bd8097ae
	Namespace: cinematicmotion
	Checksum: 0xD381A45
	Offset: 0x4A0
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_bd8097ae(duration, endval)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	if(!isdefined(endval))
	{
		return;
	}
	var_9a52780d = float(endval);
	if(isdefined(duration))
	{
		var_48f70e07 = float(duration);
	}
	if(!isdefined(var_48f70e07))
	{
		var_48f70e07 = 0;
	}
	if(!isdefined(var_9a52780d))
	{
		var_9a52780d = 0;
	}
	if(var_48f70e07 > 0)
	{
		var_6f465937 = self function_d40e85f();
		self function_6757d9a1(var_6f465937, var_9a52780d, var_48f70e07);
	}
	else
	{
		self function_97c2dab8(var_9a52780d);
	}
}

/*
	Name: function_6757d9a1
	Namespace: cinematicmotion
	Checksum: 0xCA55A055
	Offset: 0x5B8
	Size: 0x152
	Parameters: 3
	Flags: Linked
*/
function function_6757d9a1(startval, endval, duration)
{
	self notify("571c05ff9137e8da");
	self endon("571c05ff9137e8da");
	self endon(#"death_or_disconnect");
	currenttime = gettime();
	duration = duration * 1000;
	endtime = int(currenttime + duration);
	diff = abs(startval - endval);
	while(true)
	{
		currenttime = gettime();
		t = math::clamp(1 - ((endtime - currenttime) / duration), 0, 1);
		frac = lerpfloat(startval, endval, t);
		self function_97c2dab8(frac);
		if(t == 1)
		{
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_4887c796
	Namespace: cinematicmotion
	Checksum: 0xB3DEAF0A
	Offset: 0x718
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_4887c796()
{
	self function_97c2dab8(1);
}

/*
	Name: function_22441ab3
	Namespace: cinematicmotion
	Checksum: 0xB887CB41
	Offset: 0x748
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_22441ab3()
{
	self thread function_6757d9a1(0, 1, 1);
}

/*
	Name: function_5a740afe
	Namespace: cinematicmotion
	Checksum: 0x1EA6294A
	Offset: 0x788
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5a740afe()
{
	self thread function_6757d9a1(0, 1, 2);
}

/*
	Name: function_681e2652
	Namespace: cinematicmotion
	Checksum: 0xD8E83A93
	Offset: 0x7C8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_681e2652()
{
	self thread function_6757d9a1(0, 1, 3);
}

/*
	Name: function_bd015017
	Namespace: cinematicmotion
	Checksum: 0xCB547F7E
	Offset: 0x808
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_bd015017()
{
	self thread function_6757d9a1(0, 1, 4);
}

/*
	Name: function_ccb26f79
	Namespace: cinematicmotion
	Checksum: 0x1C68EA8
	Offset: 0x848
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_ccb26f79()
{
	self thread function_6757d9a1(0, 1, 5);
}

/*
	Name: function_eadd0084
	Namespace: cinematicmotion
	Checksum: 0x9C97FEBD
	Offset: 0x888
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_eadd0084()
{
	self function_97c2dab8(0);
}

/*
	Name: function_7aa6104
	Namespace: cinematicmotion
	Checksum: 0xF90D9B64
	Offset: 0x8B8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_7aa6104()
{
	self thread function_6757d9a1(1, 0, 1);
}

/*
	Name: function_19690481
	Namespace: cinematicmotion
	Checksum: 0xAA004AD5
	Offset: 0x8F8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_19690481()
{
	self thread function_6757d9a1(1, 0, 2);
}

/*
	Name: function_7f56196
	Namespace: cinematicmotion
	Checksum: 0xD1408F8E
	Offset: 0x938
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_7f56196()
{
	self thread function_6757d9a1(1, 0, 3);
}

/*
	Name: function_19a404f3
	Namespace: cinematicmotion
	Checksum: 0x744C2567
	Offset: 0x978
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_19a404f3()
{
	self thread function_6757d9a1(1, 0, 4);
}

/*
	Name: function_f27b36a2
	Namespace: cinematicmotion
	Checksum: 0x7DDD282E
	Offset: 0x9B8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_f27b36a2()
{
	self thread function_6757d9a1(1, 0, 5);
}

