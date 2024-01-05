#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace ability_gadgets;

/*
	Name: __init__system__
	Namespace: ability_gadgets
	Checksum: 0x22CC01B6
	Offset: 0xE0
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
	Checksum: 0x38095101
	Offset: 0x128
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
	Checksum: 0x72BF3F33
	Offset: 0x1C8
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
	Offset: 0x248
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
	Checksum: 0xF6EA4A51
	Offset: 0x258
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
	Offset: 0x2A8
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
	Checksum: 0x94D0D475
	Offset: 0x2B8
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
	Checksum: 0xAD9B113
	Offset: 0x330
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
	Checksum: 0x5E16907
	Offset: 0x3A8
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
	Checksum: 0x6D9522FD
	Offset: 0x420
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
	Checksum: 0xCB2B1362
	Offset: 0x498
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
	Checksum: 0x261B715A
	Offset: 0x510
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
	Checksum: 0x34BE8227
	Offset: 0x588
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
	Checksum: 0x965CDAA0
	Offset: 0x600
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
	Checksum: 0xA5889DC3
	Offset: 0x678
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

