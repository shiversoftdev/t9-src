#using scripts\core_common\util_shared.gsc;

#namespace loadout;

/*
	Name: function_87bcb1b
	Namespace: loadout
	Checksum: 0x8706E78B
	Offset: 0xD8
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
	Checksum: 0xD359B8FE
	Offset: 0xF8
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
	Checksum: 0x7258C2DF
	Offset: 0x230
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
	Checksum: 0xBD44D325
	Offset: 0x2C8
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
	Checksum: 0x83630BC3
	Offset: 0x320
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
	Checksum: 0x9511A6DC
	Offset: 0x3F8
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
	Checksum: 0xCFE025DE
	Offset: 0x4D0
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
	Checksum: 0x43189071
	Offset: 0x590
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
	Checksum: 0x57D67C00
	Offset: 0x650
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

