#namespace animation_state_machine_mocomp;

/*
	Name: function_d10f4914
	Namespace: animation_state_machine_mocomp
	Checksum: 0xD9CF5533
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d10f4914()
{
	level notify(719869211);
}

#namespace animationstatenetwork;

/*
	Name: initanimationmocomps
	Namespace: animationstatenetwork
	Checksum: 0xBB9CFF9D
	Offset: 0xC8
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
	Checksum: 0x2AA9897
	Offset: 0xE0
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
	Checksum: 0x60C00029
	Offset: 0x250
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
	Checksum: 0x8E4C8652
	Offset: 0x490
	Size: 0x2C
	Parameters: 5
	Flags: Linked
*/
function animationmocompemptyfunc(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
}

