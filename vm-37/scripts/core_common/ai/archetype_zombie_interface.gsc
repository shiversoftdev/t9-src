#using script_59f07c660e6710a5;
#using scripts\core_common\ai\zombie.gsc;

#namespace zombieinterface;

/*
	Name: registerzombieinterfaceattributes
	Namespace: zombieinterface
	Checksum: 0xAAB8118
	Offset: 0x88
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function registerzombieinterfaceattributes()
{
	ai::registermatchedinterface(#"zombie", #"can_juke", 0, array(1, 0));
	ai::registermatchedinterface(#"zombie", #"suicidal_behavior", 0, array(1, 0));
	ai::registermatchedinterface(#"zombie", #"spark_behavior", 0, array(1, 0));
	ai::registermatchedinterface(#"zombie", #"use_attackable", 0, array(1, 0));
	ai::registermatchedinterface(#"zombie", #"gravity", "normal", array("low", "normal"), &zombiebehavior::function_db26137a);
}

