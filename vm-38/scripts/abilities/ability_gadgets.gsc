#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace ability_gadgets;

/*
	Name: function_ddde0509
	Namespace: ability_gadgets
	Checksum: 0x9B0D1BB1
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ddde0509()
{
	level notify(330472428);
}

/*
	Name: __init__system__
	Namespace: ability_gadgets
	Checksum: 0xAC77A6ED
	Offset: 0x100
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"ability_gadgets", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: ability_gadgets
	Checksum: 0x170C7BA0
	Offset: 0x148
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	clientfield::register_clientuimodel("huditems.abilityHoldToActivate", 1, 2, "int");
	clientfield::register_clientuimodel("huditems.abilityDelayProgress", 1, 5, "float");
}

/*
	Name: gadgets_print
	Namespace: ability_gadgets
	Checksum: 0x16B6E68B
	Offset: 0x1E8
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function gadgets_print(str)
{
	/#
		if(getdvarint(#"scr_debug_gadgets", 0))
		{
			toprint = str;
			println(((self.playername + "") + "") + toprint);
		}
	#/
}

/*
	Name: on_player_connect
	Namespace: ability_gadgets
	Checksum: 0x80F724D1
	Offset: 0x268
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
}

/*
	Name: setflickering
	Namespace: ability_gadgets
	Checksum: 0x8C8FE336
	Offset: 0x278
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function setflickering(slot, length)
{
	if(!isdefined(length))
	{
		length = 0;
	}
	self gadgetflickering(slot, 1, length);
}

/*
	Name: on_player_spawned
	Namespace: ability_gadgets
	Checksum: 0x80F724D1
	Offset: 0x2C8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
}

/*
	Name: gadget_give_callback
	Namespace: ability_gadgets
	Checksum: 0x19F1E8FC
	Offset: 0x2D8
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event gadget_give_callback(eventstruct)
{
	/#
		eventstruct.entity gadgets_print(("" + eventstruct.slot) + "");
	#/
	eventstruct.entity ability_player::give_gadget(eventstruct.slot, eventstruct.weapon);
}

/*
	Name: gadget_take_callback
	Namespace: ability_gadgets
	Checksum: 0x1EDE7B4A
	Offset: 0x350
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event gadget_take_callback(eventstruct)
{
	/#
		eventstruct.entity gadgets_print(("" + eventstruct.slot) + "");
	#/
	eventstruct.entity ability_player::take_gadget(eventstruct.slot, eventstruct.weapon);
}

/*
	Name: gadget_primed_callback
	Namespace: ability_gadgets
	Checksum: 0xBC61C3FB
	Offset: 0x3C8
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event gadget_primed_callback(eventstruct)
{
	/#
		eventstruct.entity gadgets_print(("" + eventstruct.slot) + "");
	#/
	eventstruct.entity ability_player::gadget_primed(eventstruct.slot, eventstruct.weapon);
}

/*
	Name: gadget_ready_callback
	Namespace: ability_gadgets
	Checksum: 0xC1350A9F
	Offset: 0x440
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event gadget_ready_callback(eventstruct)
{
	/#
		eventstruct.entity gadgets_print(("" + eventstruct.slot) + "");
	#/
	eventstruct.entity ability_player::gadget_ready(eventstruct.slot, eventstruct.weapon);
}

/*
	Name: gadget_on_callback
	Namespace: ability_gadgets
	Checksum: 0x4A1B10A4
	Offset: 0x4B8
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event gadget_on_callback(eventstruct)
{
	/#
		eventstruct.entity gadgets_print(("" + eventstruct.slot) + "");
	#/
	eventstruct.entity ability_player::turn_gadget_on(eventstruct.slot, eventstruct.weapon);
}

/*
	Name: gadget_off_callback
	Namespace: ability_gadgets
	Checksum: 0x406CAD74
	Offset: 0x530
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event gadget_off_callback(eventstruct)
{
	/#
		eventstruct.entity gadgets_print(("" + eventstruct.slot) + "");
	#/
	eventstruct.entity ability_player::turn_gadget_off(eventstruct.slot, eventstruct.weapon);
}

/*
	Name: function_40d8d1ec
	Namespace: ability_gadgets
	Checksum: 0x53F4105C
	Offset: 0x5A8
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event function_40d8d1ec(eventstruct)
{
	/#
		eventstruct.entity gadgets_print(("" + eventstruct.slot) + "");
	#/
	eventstruct.entity ability_player::function_50557027(eventstruct.slot, eventstruct.weapon);
}

/*
	Name: function_15061ae6
	Namespace: ability_gadgets
	Checksum: 0x3ED81F68
	Offset: 0x620
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event function_15061ae6(eventstruct)
{
	/#
		eventstruct.entity gadgets_print(("" + eventstruct.slot) + "");
	#/
	eventstruct.entity ability_player::function_d5260ebe(eventstruct.slot, eventstruct.weapon);
}

/*
	Name: gadget_flicker_callback
	Namespace: ability_gadgets
	Checksum: 0x3ABBB22B
	Offset: 0x698
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event gadget_flicker_callback(eventstruct)
{
	/#
		eventstruct.entity gadgets_print(("" + eventstruct.slot) + "");
	#/
	eventstruct.entity ability_player::gadget_flicker(eventstruct.slot, eventstruct.weapon);
}

