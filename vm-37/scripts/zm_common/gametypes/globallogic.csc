#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\struct.csc;

#namespace globallogic;

/*
	Name: __init__system__
	Namespace: globallogic
	Checksum: 0x61C0158D
	Offset: 0x140
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"globallogic", &function_70a657d8, undefined, undefined, #"visionset_mgr");
}

/*
	Name: function_70a657d8
	Namespace: globallogic
	Checksum: 0xE1B00670
	Offset: 0x190
	Size: 0x124
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	visionset_mgr::register_visionset_info("crithealth", 1, 25, undefined, "critical_health");
	clientfield::register_clientuimodel("hudItems.armorIsOnCooldown", #"hud_items", #"hash_2f36ddfd4c373968", 1, 1, "int", undefined, 0, 0);
	clientfield::function_91cd7763("string", "hudItems.cursorHintZMPurchaseInvalidText", #"hud_items", #"hash_118ad44e348b0da0", 1, undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.cursorHintZMPurchaseInvalid", #"hud_items", #"hash_679adafa6635cf07", 1, 1, "int", undefined, 0, 0);
	level.new_health_model = 1;
}

