#using script_16d5152aa3230986;
#using scripts\core_common\clientfield_shared.csc;

#namespace coop;

/*
	Name: function_2b8f775b
	Namespace: coop
	Checksum: 0x8D9951C8
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2b8f775b()
{
	level notify(604611781);
}

/*
	Name: init
	Namespace: coop
	Checksum: 0x180FC8E6
	Offset: 0xD0
	Size: 0x9C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	level.var_d43d228 = cp_killcam::function_5c1bb138();
	registerclientfield("playercorpse", "hide_body", 1, 1, "int", &function_961f3093, 0);
	registerclientfield("toplayer", "killcam_menu", 1, 1, "int", &function_8b7a2341, 0);
}

/*
	Name: main
	Namespace: coop
	Checksum: 0xFDA2614C
	Offset: 0x178
	Size: 0xC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
}

/*
	Name: onprecachegametype
	Namespace: coop
	Checksum: 0x80F724D1
	Offset: 0x190
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function onprecachegametype()
{
}

/*
	Name: onstartgametype
	Namespace: coop
	Checksum: 0x80F724D1
	Offset: 0x1A0
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
}

/*
	Name: function_8b7a2341
	Namespace: coop
	Checksum: 0xEA461472
	Offset: 0x1B0
	Size: 0xDC
	Parameters: 7
	Flags: Linked
*/
function function_8b7a2341(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(function_1cbf351b(fieldname))
	{
		return;
	}
	if(bwastimejump)
	{
		if(!level.var_d43d228 cp_killcam::is_open(fieldname))
		{
			level.var_d43d228 cp_killcam::open(fieldname);
		}
	}
	else if(level.var_d43d228 cp_killcam::is_open(fieldname))
	{
		level.var_d43d228 cp_killcam::close(fieldname);
	}
}

/*
	Name: function_961f3093
	Namespace: coop
	Checksum: 0xD4EBFEC
	Offset: 0x298
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function function_961f3093(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump && !function_1cbf351b(fieldname))
	{
		self hide();
	}
	else
	{
		self show();
	}
}

