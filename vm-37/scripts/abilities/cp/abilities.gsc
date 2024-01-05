#using scripts\cp_common\gametypes\loadout.gsc;
#using scripts\abilities\gadgets\gadget_health_regen.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace abilities;

/*
	Name: __init__system__
	Namespace: abilities
	Checksum: 0x3BBE063B
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_4652e389efb9751f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: abilities
	Checksum: 0x66358EA
	Offset: 0x108
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		level.abilities_devgui_add_gadgets_custom = &abilities_devgui_add_gadgets_custom;
	#/
	callback::on_spawned(&init_abilities);
	clientfield::register_clientuimodel("playerAbilities.inRange", 1, 1, "int");
}

/*
	Name: init_abilities
	Namespace: abilities
	Checksum: 0xD2CC6B3B
	Offset: 0x178
	Size: 0x52
	Parameters: 0
	Flags: None
*/
function init_abilities()
{
	if(!isdefined(self._abilities))
	{
		self._abilities = spawnstruct();
	}
	if(!isdefined(self._abilities.optoutflags))
	{
		self._abilities.optoutflags = 0;
	}
}

/*
	Name: function_b797206c
	Namespace: abilities
	Checksum: 0xBA6F94DA
	Offset: 0x1D8
	Size: 0x18
	Parameters: 2
	Flags: None
*/
function function_b797206c(slot, weapon)
{
	return true;
}

/*
	Name: function_5bcf55cb
	Namespace: abilities
	Checksum: 0x9FA188A0
	Offset: 0x1F8
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function function_5bcf55cb(var_28b5f8ed)
{
	/#
		weapon_array = [];
		foreach(ability in var_28b5f8ed)
		{
			weapon = getweapon(ability);
			if(weapon != getweapon(#"none"))
			{
				arrayinsert(weapon_array, weapon, 0);
			}
		}
		return weapon_array;
	#/
}

/*
	Name: abilities_devgui_add_gadgets_custom
	Namespace: abilities
	Checksum: 0x620BBFE7
	Offset: 0x2F8
	Size: 0x5C0
	Parameters: 4
	Flags: None
*/
function abilities_devgui_add_gadgets_custom(root, pname, pid, menu_index)
{
	/#
		add_cmd_with_root = (("" + root) + pname) + "";
		level.var_fefd47f = [];
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		array::add(level.var_fefd47f, "", 0);
		a_grenades = function_5bcf55cb(level.var_fefd47f);
		ability_player::function_174037fe(add_cmd_with_root, pid, a_grenades, "", menu_index);
		level.var_29d4fb5b = [];
		array::add(level.var_29d4fb5b, "", 0);
		array::add(level.var_29d4fb5b, "", 0);
		array::add(level.var_29d4fb5b, "", 0);
		array::add(level.var_29d4fb5b, "", 0);
		array::add(level.var_29d4fb5b, "", 0);
		array::add(level.var_29d4fb5b, "", 0);
		array::add(level.var_29d4fb5b, "", 0);
		array::add(level.var_29d4fb5b, "", 0);
		array::add(level.var_29d4fb5b, "", 0);
		array::add(level.var_29d4fb5b, "", 0);
		array::add(level.var_29d4fb5b, "", 0);
		array::add(level.var_29d4fb5b, "", 0);
		array::add(level.var_29d4fb5b, "", 0);
		array::add(level.var_29d4fb5b, "", 0);
		a_abilities = function_5bcf55cb(level.var_29d4fb5b);
		ability_player::function_a40d04ca(add_cmd_with_root, pid, a_abilities, "", menu_index);
		menu_index++;
		menu_index = ability_player::abilities_devgui_add_power(add_cmd_with_root, pid, menu_index);
		wait(1);
		menu_index = ability_player::function_2e0162e9(add_cmd_with_root, pid, menu_index);
		level.var_86734d48 = &loadout::giveloadout;
		return menu_index;
	#/
}

