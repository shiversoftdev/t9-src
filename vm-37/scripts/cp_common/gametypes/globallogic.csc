#using scripts\core_common\system_shared.csc;
#using scripts\core_common\visionset_mgr_shared.csc;

#namespace globallogic;

/*
	Name: function_89f2df9
	Namespace: globallogic
	Checksum: 0xFCE49BD5
	Offset: 0x98
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
	Checksum: 0x57A46EF8
	Offset: 0xE8
	Size: 0x60
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	visionset_mgr::register_visionset_info("crithealth", 1, 25, undefined, "critical_health");
	level.new_health_model = getdvarint(#"new_health_model", 1) > 0;
}

