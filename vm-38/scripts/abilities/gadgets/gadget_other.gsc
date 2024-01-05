#using scripts\core_common\system_shared.gsc;
#using scripts\abilities\ability_player.gsc;

#namespace gadget_other;

/*
	Name: function_de9bbb64
	Namespace: gadget_other
	Checksum: 0xE27E2ABE
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_de9bbb64()
{
	level notify(588807270);
}

/*
	Name: __init__system__
	Namespace: gadget_other
	Checksum: 0x48D71400
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"gadget_other", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: gadget_other
	Checksum: 0x81F38D4A
	Offset: 0xD8
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	ability_player::register_gadget_is_inuse_callbacks(1, &gadget_other_is_inuse);
	ability_player::register_gadget_is_flickering_callbacks(1, &gadget_other_is_flickering);
}

/*
	Name: gadget_other_is_inuse
	Namespace: gadget_other
	Checksum: 0x1008ED24
	Offset: 0x128
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function gadget_other_is_inuse(slot)
{
	return self gadgetisactive(slot);
}

/*
	Name: gadget_other_is_flickering
	Namespace: gadget_other
	Checksum: 0xB44AADBA
	Offset: 0x158
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function gadget_other_is_flickering(slot)
{
	return self gadgetflickering(slot);
}

/*
	Name: set_gadget_other_status
	Namespace: gadget_other
	Checksum: 0xE8EB2CBB
	Offset: 0x188
	Size: 0xBC
	Parameters: 3
	Flags: None
*/
function set_gadget_other_status(weapon, status, time)
{
	/#
		timestr = "";
		if(isdefined(time))
		{
			timestr = ("" + "") + time;
		}
		if(getdvarint(#"scr_cpower_debug_prints", 0) > 0)
		{
			self iprintlnbold(((("" + weapon.name) + "") + status) + timestr);
		}
	#/
}

