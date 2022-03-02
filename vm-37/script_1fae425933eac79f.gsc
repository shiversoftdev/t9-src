#using script_2118e128407b7acb;
#using script_59f07c660e6710a5;

#namespace namespace_8179cac5;

/*
	Name: registerzombiedoginterfaceattributes
	Namespace: namespace_8179cac5
	Checksum: 0x83786746
	Offset: 0x88
	Size: 0x134
	Parameters: 0
	Flags: None
*/
function registerzombiedoginterfaceattributes()
{
	ai::registermatchedinterface(#"zombie_dog", #"gravity", "normal", array("low", "normal"), &namespace_5eb9b9b6::zombiedoggravity);
	ai::registermatchedinterface(#"zombie_dog", #"min_run_dist", 700);
	ai::registermatchedinterface(#"zombie_dog", #"sprint", 0, array(1, 0));
	ai::registermatchedinterface(#"zombie_dog", #"patrol", 0, array(1, 0));
}

