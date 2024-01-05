#using script_113dd7f0ea2a1d4f;
#using script_437ce686d29bb81b;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using script_2618e0f3e5e11649;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_553954de;

/*
	Name: function_92b4c2a0
	Namespace: namespace_553954de
	Checksum: 0xF2167AE0
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_92b4c2a0()
{
	level notify(1589356521);
}

/*
	Name: function_14bada94
	Namespace: namespace_553954de
	Checksum: 0x72EA66E4
	Offset: 0x118
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
	Checksum: 0x7148B850
	Offset: 0x160
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
	Checksum: 0x22C1CFCA
	Offset: 0x1A0
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
		level thread zm_vo::function_7622cb70("matchEndLoseObjectiveFail");
		wait(4);
		level thread globallogic::endgame(#"axis");
	}
}

/*
	Name: function_8e066676
	Namespace: namespace_553954de
	Checksum: 0x9FFD98EE
	Offset: 0x328
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
	Checksum: 0x1209B321
	Offset: 0x450
	Size: 0x18C
	Parameters: 1
	Flags: Linked
*/
function function_7c97e961(var_661691aa)
{
	/#
		assert(isdefined(var_661691aa), "");
	#/
	level.var_b48509f9 = var_661691aa;
	setroundsplayed(var_661691aa);
	switch(level.var_b48509f9)
	{
		case 1:
		{
			level.var_15d17eb2 = 1;
			break;
		}
		case 2:
		{
			level.var_15d17eb2 = 2;
			break;
		}
		case 3:
		case 4:
		{
			level.var_15d17eb2 = 3;
			break;
		}
		case 5:
		case 6:
		case 7:
		{
			level.var_15d17eb2 = 4;
			break;
		}
		default:
		{
			level.var_15d17eb2 = 5;
			break;
		}
	}
	namespace_ce1f29cc::function_15bf0b91(level.var_15d17eb2);
	callback::callback(#"hash_564379c43286f074");
}

/*
	Name: function_1aa044d3
	Namespace: namespace_553954de
	Checksum: 0x8D07FD9
	Offset: 0x5E8
	Size: 0x1A4
	Parameters: 1
	Flags: Linked
*/
function function_1aa044d3(map_name)
{
	if(is_true(level.var_83e2326))
	{
		return;
	}
	level notify(#"hash_80008492ea92df4");
	namespace_cf6efd05::function_ded56b14();
	namespace_cf6efd05::function_c484a9be(#"initialized", 1);
	namespace_cf6efd05::function_c484a9be(#"hash_1601cc3215f4f8b3", level.var_b48509f9);
	foreach(player in getplayers())
	{
		namespace_cf6efd05::function_42f98bb6(player);
	}
	namespace_cf6efd05::function_9c9d3652();
	level.var_83e2326 = 1;
	switchmap_load(map_name, "");
	level waittilltimeout(25, #"switchmap_preload_finished");
	switchmap_switch();
}

