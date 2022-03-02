#using script_4ee0ccb42a9d88f5;
#using script_59f07c660e6710a5;

#namespace namespace_79bc4a1d;

/*
	Name: function_c5e5b158
	Namespace: namespace_79bc4a1d
	Checksum: 0x3A80AD46
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c5e5b158()
{
	level notify(541463894);
}

#namespace namespace_1f694fcd;

/*
	Name: registerbrutusinterfaceattributes
	Namespace: namespace_1f694fcd
	Checksum: 0xB80E64E6
	Offset: 0x90
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function registerbrutusinterfaceattributes()
{
	ai::registermatchedinterface(#"brutus", #"can_ground_slam", 0, array(1, 0));
	ai::registermatchedinterface(#"brutus", #"scripted_mode", 0, array(1, 0), &namespace_363fe686::function_f8aa76ea);
	ai::registermatchedinterface(#"brutus", #"patrol", 0, array(1, 0));
}

