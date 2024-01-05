#using script_59f07c660e6710a5;
#using scripts\zm\ai\zm_ai_dog.gsc;

#namespace zm_ai_dog_interface;

/*
	Name: registerzombiedoginterfaceattributes
	Namespace: zm_ai_dog_interface
	Checksum: 0x83786746
	Offset: 0x88
	Size: 0x134
	Parameters: 0
	Flags: None
*/
function registerzombiedoginterfaceattributes()
{
	ai::registermatchedinterface(#"zombie_dog", #"gravity", "normal", array("low", "normal"), &zm_ai_dog::zombiedoggravity);
	ai::registermatchedinterface(#"zombie_dog", #"min_run_dist", 700);
	ai::registermatchedinterface(#"zombie_dog", #"sprint", 0, array(1, 0));
	ai::registermatchedinterface(#"zombie_dog", #"patrol", 0, array(1, 0));
}

