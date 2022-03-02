#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\visionset_mgr_shared.csc;

#namespace globallogic;

/*
	Name: function_1c0feebf
	Namespace: globallogic
	Checksum: 0x6EF31EA9
	Offset: 0x140
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1c0feebf()
{
	level notify(777558000);
}

/*
	Name: function_89f2df9
	Namespace: globallogic
	Checksum: 0xA582CE62
	Offset: 0x160
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
	Checksum: 0x1FC88476
	Offset: 0x1B0
	Size: 0x124
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	visionset_mgr::register_visionset_info("crithealth", 1, 25, undefined, "critical_health");
	clientfield::function_a8bbc967("hudItems.armorIsOnCooldown", #"hud_items", #"hash_2f36ddfd4c373968", 1, 1, "int", undefined, 0, 0);
	clientfield::function_91cd7763("string", "hudItems.cursorHintZMPurchaseInvalidText", #"hud_items", #"hash_118ad44e348b0da0", 1, undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.cursorHintZMPurchaseInvalid", #"hud_items", #"hash_679adafa6635cf07", 1, 1, "int", undefined, 0, 0);
	level.new_health_model = 1;
}

