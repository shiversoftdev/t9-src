#using script_50a49d535160be60;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace zm_equipment;

/*
	Name: function_89f2df9
	Namespace: zm_equipment
	Checksum: 0x344508E8
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_equipment", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_equipment
	Checksum: 0xDEC5009A
	Offset: 0x100
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level._equip_activated_callbacks = [];
	level.buildable_piece_count = 24;
	if(!is_true(level._no_equipment_activated_clientfield))
	{
		clientfield::register("scriptmover", "equipment_activated", 1, 4, "int", &equipment_activated_clientfield_cb, 1, 0);
	}
	zm_hint_text::register();
}

/*
	Name: add_equip_activated_callback_override
	Namespace: zm_equipment
	Checksum: 0x20F5514C
	Offset: 0x1A0
	Size: 0x24
	Parameters: 2
	Flags: None
*/
function add_equip_activated_callback_override(model, func)
{
	level._equip_activated_callbacks[model] = func;
}

/*
	Name: equipment_activated_clientfield_cb
	Namespace: zm_equipment
	Checksum: 0x419CC000
	Offset: 0x1D0
	Size: 0x11E
	Parameters: 7
	Flags: Linked
*/
function equipment_activated_clientfield_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.model) && isdefined(level._equip_activated_callbacks[self.model]))
	{
		[[level._equip_activated_callbacks[self.model]]](localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
	}
	if(!newval)
	{
		if(isdefined(self._equipment_activated_fx))
		{
			for(i = 0; i < self._equipment_activated_fx.size; i++)
			{
				for(j = 0; j < self._equipment_activated_fx[i].size; j++)
				{
					deletefx(i, self._equipment_activated_fx[i][j]);
				}
			}
			self._equipment_activated_fx = undefined;
		}
	}
}

/*
	Name: play_fx_for_all_clients
	Namespace: zm_equipment
	Checksum: 0x9FC8AD29
	Offset: 0x2F8
	Size: 0x24C
	Parameters: 4
	Flags: None
*/
function play_fx_for_all_clients(fx, tag, storehandles, forward)
{
	if(!isdefined(storehandles))
	{
		storehandles = 0;
	}
	if(!isdefined(forward))
	{
		forward = undefined;
	}
	numlocalplayers = getlocalplayers().size;
	if(!isdefined(self._equipment_activated_fx))
	{
		self._equipment_activated_fx = [];
		for(i = 0; i < numlocalplayers; i++)
		{
			self._equipment_activated_fx[i] = [];
		}
	}
	if(isdefined(tag))
	{
		for(i = 0; i < numlocalplayers; i++)
		{
			if(storehandles)
			{
				self._equipment_activated_fx[i][self._equipment_activated_fx[i].size] = util::playfxontag(i, fx, self, tag);
				continue;
			}
			self_for_client = getentbynum(i, self getentitynumber());
			if(isdefined(self_for_client))
			{
				util::playfxontag(i, fx, self_for_client, tag);
			}
		}
	}
	else
	{
		for(i = 0; i < numlocalplayers; i++)
		{
			if(storehandles)
			{
				if(isdefined(forward))
				{
					self._equipment_activated_fx[i][self._equipment_activated_fx[i].size] = playfx(i, fx, self.origin, forward);
				}
				else
				{
					self._equipment_activated_fx[i][self._equipment_activated_fx[i].size] = playfx(i, fx, self.origin);
				}
				continue;
			}
			if(isdefined(forward))
			{
				playfx(i, fx, self.origin, forward);
				continue;
			}
			playfx(i, fx, self.origin);
		}
	}
}

/*
	Name: is_included
	Namespace: zm_equipment
	Checksum: 0xF41F8F06
	Offset: 0x550
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function is_included(equipment)
{
	if(!isdefined(level._included_equipment))
	{
		return 0;
	}
	return isdefined(level._included_equipment[equipment.rootweapon]);
}

/*
	Name: include
	Namespace: zm_equipment
	Checksum: 0x76DA0051
	Offset: 0x590
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function include(equipment_name)
{
	if(!isdefined(level._included_equipment))
	{
		level._included_equipment = [];
	}
	equipment = getweapon(equipment_name);
	level._included_equipment[equipment] = equipment;
}

