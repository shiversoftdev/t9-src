#using script_16d5152aa3230986;
#using scripts\core_common\clientfield_shared.csc;

#namespace coop;

/*
	Name: init
	Namespace: coop
	Checksum: 0xF2F3B4B6
	Offset: 0xB0
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
	Checksum: 0x864ED91
	Offset: 0x158
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
	Offset: 0x170
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
	Offset: 0x180
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
	Checksum: 0x9F24D64
	Offset: 0x190
	Size: 0xDC
	Parameters: 7
	Flags: None
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
	Checksum: 0xA8BE92A4
	Offset: 0x278
	Size: 0x8C
	Parameters: 7
	Flags: None
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

