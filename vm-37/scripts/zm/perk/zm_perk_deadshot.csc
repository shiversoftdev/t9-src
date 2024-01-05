#using scripts\zm_common\zm_perks.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_perk_deadshot;

/*
	Name: __init__system__
	Namespace: zm_perk_deadshot
	Checksum: 0x7EECEDC7
	Offset: 0x108
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_perk_deadshot", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_deadshot
	Checksum: 0x99AD0526
	Offset: 0x150
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	enable_deadshot_perk_for_level();
}

/*
	Name: enable_deadshot_perk_for_level
	Namespace: zm_perk_deadshot
	Checksum: 0xD58D1CAE
	Offset: 0x170
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function enable_deadshot_perk_for_level()
{
	zm_perks::register_perk_clientfields(#"hash_210097a75bb6c49a", &deadshot_client_field_func, &deadshot_code_callback_func);
	zm_perks::register_perk_effects(#"hash_210097a75bb6c49a", "deadshot_light");
	zm_perks::register_perk_init_thread(#"hash_210097a75bb6c49a", &init_deadshot);
	zm_perks::function_f3c80d73("zombie_perk_bottle_deadshot");
}

/*
	Name: init_deadshot
	Namespace: zm_perk_deadshot
	Checksum: 0xAC4DC0DC
	Offset: 0x230
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function init_deadshot()
{
	if(is_true(level.enable_magic))
	{
		level._effect[#"deadshot_light"] = "zombie/fx_perk_deadshot_ndu";
	}
}

/*
	Name: deadshot_client_field_func
	Namespace: zm_perk_deadshot
	Checksum: 0x2CD47217
	Offset: 0x278
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function deadshot_client_field_func()
{
	clientfield::register("toplayer", "deadshot_perk", 1, 1, "int", &player_deadshot_perk_handler, 0, 1);
}

/*
	Name: deadshot_code_callback_func
	Namespace: zm_perk_deadshot
	Checksum: 0x80F724D1
	Offset: 0x2D0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function deadshot_code_callback_func()
{
}

/*
	Name: player_deadshot_perk_handler
	Namespace: zm_perk_deadshot
	Checksum: 0x10EAF09F
	Offset: 0x2E0
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function player_deadshot_perk_handler(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!is_local_player(self))
	{
		return;
	}
	self endon(#"death");
	if(self util::function_50ed1561(fieldname))
	{
		if(is_local_player(self))
		{
			if(bwastimejump)
			{
				self usealternateaimparams();
			}
			else
			{
				self clearalternateaimparams();
			}
		}
	}
}

/*
	Name: is_local_player
	Namespace: zm_perk_deadshot
	Checksum: 0xA6BC4690
	Offset: 0x3B8
	Size: 0x6A
	Parameters: 1
	Flags: Linked, Private
*/
function private is_local_player(player)
{
	if(!isdefined(player) || !isplayer(player))
	{
		return 0;
	}
	a_players = getlocalplayers();
	return isinarray(a_players, player);
}

