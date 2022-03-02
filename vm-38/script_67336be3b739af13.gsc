#using script_27137b97a4a2215f;
#using script_59f07c660e6710a5;

#namespace archetype_zod_companion_interface;

/*
	Name: function_94eff4a9
	Namespace: archetype_zod_companion_interface
	Checksum: 0x70928B19
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_94eff4a9()
{
	level notify(519278930);
}

#namespace zodcompanioninterface;

/*
	Name: registerzodcompanioninterfaceattributes
	Namespace: zodcompanioninterface
	Checksum: 0x5A9B1619
	Offset: 0x90
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function registerzodcompanioninterfaceattributes()
{
	ai::registermatchedinterface(#"zod_companion", #"sprint", 0, array(1, 0));
}

