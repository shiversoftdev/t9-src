#using script_59f07c660e6710a5;
#using scripts\zm\ai\zm_ai_dog.gsc;

#namespace zm_ai_dog_interface;

/*
	Name: function_7c665a41
	Namespace: zm_ai_dog_interface
	Checksum: 0x9F909C90
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7c665a41()
{
	level notify(-1267989814);
}

/*
	Name: registerzombiedoginterfaceattributes
	Namespace: zm_ai_dog_interface
	Checksum: 0x19DA6908
	Offset: 0xA8
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function registerzombiedoginterfaceattributes()
{
	ai::registermatchedinterface(#"zombie_dog", #"gravity", "normal", array("low", "normal"), &zm_ai_dog::zombiedoggravity);
	ai::registermatchedinterface(#"zombie_dog", #"min_run_dist", 700);
	ai::registermatchedinterface(#"zombie_dog", #"sprint", 0, array(1, 0));
	ai::registermatchedinterface(#"zombie_dog", #"patrol", 0, array(1, 0));
}

