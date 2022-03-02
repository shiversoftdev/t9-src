#namespace animationstatenetwork;

/*
	Name: initanimationmocomps
	Namespace: animationstatenetwork
	Checksum: 0x9BD20D0F
	Offset: 0xA8
	Size: 0x10
	Parameters: 0
	Flags: AutoExec
*/
function autoexec initanimationmocomps()
{
	level._animationmocomps = [];
}

/*
	Name: runanimationmocomp
	Namespace: animationstatenetwork
	Checksum: 0xBCF6F375
	Offset: 0xC0
	Size: 0x162
	Parameters: 1
	Flags: Linked, Event
*/
event runanimationmocomp(eventstruct)
{
	/#
		assert(eventstruct.status >= 0 && eventstruct.status <= 2, ("" + eventstruct.status) + "");
	#/
	/#
		assert(isdefined(level._animationmocomps[eventstruct.name]), ("" + eventstruct.name) + "");
	#/
	if(eventstruct.status == 0)
	{
		eventstruct.status = "asm_mocomp_start";
	}
	else
	{
		if(eventstruct.status == 1)
		{
			eventstruct.status = "asm_mocomp_update";
		}
		else
		{
			eventstruct.status = "asm_mocomp_terminate";
		}
	}
	animationmocompresult = eventstruct.entity [[level._animationmocomps[eventstruct.name][eventstruct.status]]](eventstruct.entity, eventstruct.delta_anim, eventstruct.blend_out_time, "", eventstruct.duration);
	return animationmocompresult;
}

/*
	Name: registeranimationmocomp
	Namespace: animationstatenetwork
	Checksum: 0x1C1310E6
	Offset: 0x230
	Size: 0x232
	Parameters: 4
	Flags: Linked
*/
function registeranimationmocomp(mocompname, startfuncptr, updatefuncptr, terminatefuncptr)
{
	mocompname = tolower(mocompname);
	/#
		assert(isstring(mocompname), "");
	#/
	/#
		assert(!isdefined(level._animationmocomps[mocompname]), ("" + mocompname) + "");
	#/
	level._animationmocomps[mocompname] = array();
	/#
		assert(isdefined(startfuncptr) && isfunctionptr(startfuncptr), "");
	#/
	level._animationmocomps[mocompname][#"asm_mocomp_start"] = startfuncptr;
	if(isdefined(updatefuncptr))
	{
		/#
			assert(isfunctionptr(updatefuncptr), "");
		#/
		level._animationmocomps[mocompname][#"asm_mocomp_update"] = updatefuncptr;
	}
	else
	{
		level._animationmocomps[mocompname][#"asm_mocomp_update"] = &animationmocompemptyfunc;
	}
	if(isdefined(terminatefuncptr))
	{
		/#
			assert(isfunctionptr(terminatefuncptr), "");
		#/
		level._animationmocomps[mocompname][#"asm_mocomp_terminate"] = terminatefuncptr;
	}
	else
	{
		level._animationmocomps[mocompname][#"asm_mocomp_terminate"] = &animationmocompemptyfunc;
	}
}

/*
	Name: animationmocompemptyfunc
	Namespace: animationstatenetwork
	Checksum: 0x4F9E7FA3
	Offset: 0x470
	Size: 0x2C
	Parameters: 5
	Flags: Linked
*/
function animationmocompemptyfunc(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
}

