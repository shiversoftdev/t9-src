#using scripts\core_common\system_shared.csc;
#using scripts\core_common\visionset_mgr_shared.csc;

#namespace globallogic;

/*
	Name: function_a7cfe336
	Namespace: globallogic
	Checksum: 0xD194649
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a7cfe336()
{
	level notify(41908221);
}

/*
	Name: function_89f2df9
	Namespace: globallogic
	Checksum: 0xD775BC29
	Offset: 0xB8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"globallogic", &function_70a657d8, undefined, undefined, #"visionset_mgr");
}

/*
	Name: function_70a657d8
	Namespace: globallogic
	Checksum: 0xD21330FE
	Offset: 0x108
	Size: 0x60
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	visionset_mgr::register_visionset_info("crithealth", 1, 25, undefined, "critical_health");
	level.new_health_model = getdvarint(#"new_health_model", 1) > 0;
}

