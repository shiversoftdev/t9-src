#using script_113dd7f0ea2a1d4f;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_553954de;

/*
	Name: function_14bada94
	Namespace: namespace_553954de
	Checksum: 0x61CF041D
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_14bada94()
{
	self.var_7aa0d894 = 1;
	self.var_6696e200 = 1;
	self clientfield::set_player_uimodel("hudItems.srOverlayOpen", 1);
}

/*
	Name: function_548f282
	Namespace: namespace_553954de
	Checksum: 0x83704433
	Offset: 0x120
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_548f282()
{
	self.var_7aa0d894 = 0;
	self.var_6696e200 = undefined;
	self clientfield::set_player_uimodel("hudItems.srOverlayOpen", 0);
}

/*
	Name: end_match
	Namespace: namespace_553954de
	Checksum: 0x9B4542E8
	Offset: 0x160
	Size: 0x17C
	Parameters: 1
	Flags: Linked
*/
function end_match(b_success)
{
	if(!isdefined(b_success))
	{
		b_success = 1;
	}
	foreach(player in getplayers())
	{
		level.var_31028c5d prototype_hud::set_active_obj_visibility(player, 0);
	}
	if(b_success || getdvarint(#"hash_15b141da1584bd0d", 1) == 0)
	{
		level thread function_8e066676();
		wait(1);
		level globallogic::endgame(#"allies");
	}
	else
	{
		level.var_1726e2c7 = 1;
		level globallogic_audio::leader_dialog("matchEndLoseObjectiveFail");
		wait(4);
		level thread globallogic::endgame(#"axis");
	}
}

/*
	Name: function_8e066676
	Namespace: namespace_553954de
	Checksum: 0xF6382925
	Offset: 0x2E8
	Size: 0x11E
	Parameters: 0
	Flags: Linked
*/
function function_8e066676()
{
	foreach(ai in getaiarray())
	{
		if(isalive(ai) && !function_3132f113(ai))
		{
			util::stop_magic_bullet_shield(ai);
			ai.allowdeath = 1;
			ai.takedamage = 1;
			ai kill(undefined, undefined, undefined, undefined, undefined, 1);
			waitframe(randomint(3) + 1);
		}
	}
}

/*
	Name: function_7c97e961
	Namespace: namespace_553954de
	Checksum: 0x2F346E80
	Offset: 0x410
	Size: 0x144
	Parameters: 1
	Flags: None
*/
function function_7c97e961(var_661691aa)
{
	/#
		assert(isdefined(var_661691aa), "");
	#/
	var_88710b09 = zombie_utility::function_d2dfacfd(#"hash_6ba259e60f87bb15");
	if(isdefined(var_88710b09))
	{
		var_661691aa = math::clamp(var_661691aa, 1, var_88710b09.size);
	}
	level.var_b48509f9 = var_661691aa;
	switch(level.var_b48509f9)
	{
		case 1:
		{
			level.var_15d17eb2 = 1;
			break;
		}
		case 2:
		case 3:
		{
			level.var_15d17eb2 = 2;
			break;
		}
		default:
		{
			level.var_15d17eb2 = 3;
			break;
		}
	}
	callback::callback(#"hash_564379c43286f074");
}

/*
	Name: function_1aa044d3
	Namespace: namespace_553954de
	Checksum: 0x439DE04
	Offset: 0x560
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function function_1aa044d3(map_name)
{
}

