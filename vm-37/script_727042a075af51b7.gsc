#using script_618d6f5ff5d18933;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_7da6f8ca;

/*
	Name: function_89f2df9
	Namespace: namespace_7da6f8ca
	Checksum: 0x52DA64B5
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_40a4f03bb2983ee3", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_7da6f8ca
	Checksum: 0xF546259D
	Offset: 0x120
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "item_drop_tail", 1, 1, "int", &item_drop_tail, 0, 0);
	clientfield::register("scriptmover", "item_updateWorldFX", 1, 1, "int", &item_updateworldfx, 0, 0);
}

/*
	Name: function_6ee35a0a
	Namespace: namespace_7da6f8ca
	Checksum: 0xF330FFBB
	Offset: 0x1C0
	Size: 0x102
	Parameters: 1
	Flags: Linked
*/
function function_6ee35a0a(rarity)
{
	switch(rarity)
	{
		case "resource":
		{
			return #"hash_20b3d352fb23155c";
			break;
		}
		case "common":
		{
			return #"hash_1c62f1903d03705a";
			break;
		}
		case "rare":
		{
			return #"hash_3e3f86ff3fc6055";
			break;
		}
		case "epic":
		{
			return #"hash_6c7840c9ca34f2a3";
			break;
		}
		case "legendary":
		{
			return #"hash_7f4c941a9564c78f";
			break;
		}
		case "ultra":
		{
			return #"hash_3dad79ca7ca879b5";
			break;
		}
		default:
		{
			return #"hash_20b3d352fb23155c";
			break;
		}
	}
}

/*
	Name: item_drop_tail
	Namespace: namespace_7da6f8ca
	Checksum: 0x2C96C624
	Offset: 0x2D0
	Size: 0x10E
	Parameters: 7
	Flags: Linked
*/
function item_drop_tail(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(isdefined(self.var_a6762160.rarity))
		{
			rarity = self.var_a6762160.rarity;
		}
		else
		{
			rarity = "None";
		}
		fx_to_play = function_6ee35a0a(rarity);
		if(!isdefined(self.var_11154944))
		{
			self.var_11154944 = util::playfxontag(fieldname, fx_to_play, self, "tag_origin");
		}
	}
	else if(isdefined(self.var_11154944))
	{
		stopfx(fieldname, self.var_11154944);
		self.var_11154944 = undefined;
	}
}

/*
	Name: item_updateworldfx
	Namespace: namespace_7da6f8ca
	Checksum: 0x69592E1C
	Offset: 0x3E8
	Size: 0x11C
	Parameters: 7
	Flags: Linked
*/
function item_updateworldfx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump != 0)
	{
		self.falling = 0;
		if(isdefined(level.var_d342a3fd) && isdefined(level.var_d342a3fd[fieldname]))
		{
			var_8040e225 = level.var_d342a3fd[fieldname];
			model = var_8040e225.var_ab111430[self.var_bd027dd9];
			if(isdefined(model))
			{
				item_world::function_2990e5f(fieldname, model);
				model.var_f7fa2943 = undefined;
				wait(0.5);
				if(isdefined(self) && (isdefined(self.var_bd027dd9) && isdefined(model)))
				{
					item_world::function_a4886b1e(fieldname, self.var_bd027dd9, model);
				}
			}
		}
	}
}

