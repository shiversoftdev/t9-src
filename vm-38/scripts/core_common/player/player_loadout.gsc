#using scripts\core_common\util_shared.gsc;

#namespace player_loadout;

/*
	Name: function_41b69669
	Namespace: player_loadout
	Checksum: 0xB1BA3642
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_41b69669()
{
	level notify(865774092);
}

#namespace loadout;

/*
	Name: function_87bcb1b
	Namespace: loadout
	Checksum: 0xBE289078
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function function_87bcb1b()
{
	return level.var_d0e6b79d === 1;
}

/*
	Name: function_c67222df
	Namespace: loadout
	Checksum: 0xB5FD512B
	Offset: 0x118
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_c67222df()
{
	if(!isdefined(self.pers[#"loadout"]))
	{
		self.pers[#"loadout"] = spawnstruct();
	}
	self init_loadout_slot("primary");
	self init_loadout_slot("secondary");
	self init_loadout_slot("herogadget");
	self init_loadout_slot("ultimate");
	self init_loadout_slot("primarygrenade");
	self init_loadout_slot("secondarygrenade");
	self init_loadout_slot("specialgrenade");
}

/*
	Name: init_loadout_slot
	Namespace: loadout
	Checksum: 0xB9627CEA
	Offset: 0x250
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function init_loadout_slot(slot_index)
{
	self.pers[#"loadout"].slots[slot_index] = {#killed:0, #count:0, #hash_4cfdfa9b:level.weaponnone, #weapon:level.weaponnone, #slot:slot_index};
}

/*
	Name: get_loadout_slot
	Namespace: loadout
	Checksum: 0x7C8095F2
	Offset: 0x2E8
	Size: 0x50
	Parameters: 1
	Flags: None
*/
function get_loadout_slot(slot_index)
{
	if(isdefined(self.pers[#"loadout"]))
	{
		return self.pers[#"loadout"].slots[slot_index];
	}
	return undefined;
}

/*
	Name: function_8435f729
	Namespace: loadout
	Checksum: 0xCB2249FD
	Offset: 0x340
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_8435f729(weapon)
{
	if(isdefined(self.pers[#"loadout"]))
	{
		foreach(slot_index, slot in self.pers[#"loadout"].slots)
		{
			if(slot.weapon == weapon)
			{
				return slot_index;
			}
		}
	}
	return undefined;
}

/*
	Name: find_loadout_slot
	Namespace: loadout
	Checksum: 0x35F0EC75
	Offset: 0x418
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function find_loadout_slot(weapon)
{
	if(isdefined(self.pers[#"loadout"]))
	{
		foreach(slot in self.pers[#"loadout"].slots)
		{
			if(slot.weapon == weapon)
			{
				return slot;
			}
		}
	}
	return undefined;
}

/*
	Name: function_18a77b37
	Namespace: loadout
	Checksum: 0x323BA584
	Offset: 0x4F0
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function function_18a77b37(slot_index)
{
	if(function_87bcb1b() && isdefined(self) && isdefined(self.pers) && isdefined(self.pers[#"loadout"]))
	{
		/#
			assert(isdefined(self.pers[#"loadout"].slots[slot_index]));
		#/
		return self.pers[#"loadout"].slots[slot_index].weapon;
	}
	return undefined;
}

/*
	Name: function_442539
	Namespace: loadout
	Checksum: 0x90FE3732
	Offset: 0x5B0
	Size: 0xB6
	Parameters: 2
	Flags: None
*/
function function_442539(slot_index, weapon)
{
	/#
		assert(isdefined(self.pers[#"loadout"].slots[slot_index]));
	#/
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isdefined(weapon));
	#/
	self.pers[#"loadout"].slots[slot_index].weapon = weapon;
}

/*
	Name: gadget_is_in_use
	Namespace: loadout
	Checksum: 0x405A765B
	Offset: 0x670
	Size: 0x8A
	Parameters: 1
	Flags: None
*/
function gadget_is_in_use(slot_index)
{
	player = self;
	weapon = function_18a77b37(slot_index);
	if(!isdefined(weapon))
	{
		return 0;
	}
	slot = player gadgetgetslot(weapon);
	active = player util::gadget_is_in_use(slot);
	return active;
}

