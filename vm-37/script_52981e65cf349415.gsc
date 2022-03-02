#using script_2dc48f46bfeac894;
#using scripts\core_common\system_shared.gsc;

#namespace gadget_other;

/*
	Name: function_89f2df9
	Namespace: gadget_other
	Checksum: 0xE7F8B374
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"gadget_other", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: gadget_other
	Checksum: 0xD0793805
	Offset: 0xB8
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
	Checksum: 0xD82844BA
	Offset: 0x108
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
	Checksum: 0xBC2EA915
	Offset: 0x138
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
	Checksum: 0x7B998791
	Offset: 0x168
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

