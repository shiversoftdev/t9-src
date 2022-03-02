#using script_165beea08a63a243;
#using script_1caf36ff04a85ff6;
#using script_1cc417743d7c262d;
#using script_340a2e805e35f7a2;
#using script_3a704cbcf4081bfb;
#using script_471b31bd963b388e;
#using script_7fc996fe8678852;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_58949729;

/*
	Name: function_4b4719bd
	Namespace: namespace_58949729
	Checksum: 0xC8C0216F
	Offset: 0x3C8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4b4719bd()
{
	level notify(197632755);
}

/*
	Name: function_89f2df9
	Namespace: namespace_58949729
	Checksum: 0x5610FCB9
	Offset: 0x3E8
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5f19cd68b4607f52", &function_70a657d8, undefined, &finalize, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_58949729
	Checksum: 0x3BC11273
	Offset: 0x448
	Size: 0x153C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	level.var_8634611a = [];
	level.var_6fff281a = [];
	level.var_b048b7e = [];
	level.var_86a1e8b6 = new class_c6c0e94();
	[[ level.var_86a1e8b6 ]]->initialize(#"hash_49b01ce6d2589091", 1, float(function_60d95f53()) / 1000);
	namespace_8b6a9d79::function_b3464a7c("explore_chests", &function_50855654);
	namespace_8b6a9d79::function_b3464a7c("explore_chests_large", &function_c3e93273);
	namespace_8b6a9d79::function_b3464a7c("explore_chests_small", &function_61f1a62e);
	namespace_8b6a9d79::function_b3464a7c("loot_pods", &function_3e953077);
	clientfield::register("scriptmover", "reward_chest_fx", 1, 2, "int");
	level.var_a332ae5f = [];
	function_dabc4d71(#"hash_fb02b41b0d01f39", &function_cff40da3);
	function_dabc4d71(#"hash_2cdb76a587cf7a3b", &function_e15f0669);
	function_6ac967bf(#"gold", 1, #"hash_681934df8ead92cc");
	function_6ac967bf(#"gold", 2, #"hash_681937df8ead97e5");
	function_6ac967bf(#"gold", 3, #"hash_681936df8ead9632");
	function_6ac967bf(#"gold", 4, #"hash_681931df8ead8db3");
	function_6ac967bf(#"gold", 5, #"hash_681930df8ead8c00");
	function_6ac967bf(#"gold", 6, #"hash_681933df8ead9119");
	function_6ac967bf(#"large", 1, #"hash_4651e5abf3256c53");
	function_6ac967bf(#"large", 2, #"hash_4651e6abf3256e06");
	function_6ac967bf(#"large", 3, #"hash_4651e7abf3256fb9");
	function_6ac967bf(#"large", 4, #"hash_4651e8abf325716c");
	function_6ac967bf(#"large", 5, #"hash_4651e9abf325731f");
	function_6ac967bf(#"large", 6, #"hash_4651eaabf32574d2");
	function_6ac967bf(#"medium", 1, #"hash_570210f86dd830fd");
	function_6ac967bf(#"medium", 2, #"hash_57020df86dd82be4");
	function_6ac967bf(#"medium", 3, #"hash_57020ef86dd82d97");
	function_6ac967bf(#"medium", 4, #"hash_57020bf86dd8287e");
	function_6ac967bf(#"medium", 5, #"hash_57020cf86dd82a31");
	function_6ac967bf(#"medium", 6, #"hash_570209f86dd82518");
	function_6ac967bf(#"small", 1, #"hash_3284bf8ca3a6f00b");
	function_6ac967bf(#"small", 2, #"hash_3284c08ca3a6f1be");
	function_6ac967bf(#"small", 3, #"hash_3284c18ca3a6f371");
	function_6ac967bf(#"small", 4, #"hash_3284c28ca3a6f524");
	function_6ac967bf(#"small", 5, #"hash_3284c38ca3a6f6d7");
	function_6ac967bf(#"small", 6, #"hash_3284c48ca3a6f88a");
	function_6ac967bf(#"hash_24af9f98f7899474", 1, #"hash_23a5557263861cff");
	function_6ac967bf(#"hash_24af9f98f7899474", 2, #"hash_23a5567263861eb2");
	function_6ac967bf(#"hash_24af9f98f7899474", 3, #"hash_23a5577263862065");
	function_6ac967bf(#"hash_24af9f98f7899474", 4, #"hash_23a5507263861480");
	function_6ac967bf(#"hash_24af9f98f7899474", 5, #"hash_23a5517263861633");
	function_6ac967bf(#"hash_24af9f98f7899474", 6, #"hash_23a55272638617e6");
	function_6ac967bf(#"pod", 1, #"hash_69f376be088d343a");
	function_6ac967bf(#"pod", 2, #"hash_69f375be088d3287");
	function_6ac967bf(#"pod", 3, #"hash_69f374be088d30d4");
	function_6ac967bf(#"pod", 4, #"hash_69f373be088d2f21");
	function_6ac967bf(#"pod", 5, #"hash_69f372be088d2d6e");
	function_6ac967bf(#"pod", 6, #"hash_69f371be088d2bbb");
	if(zm_utility::function_c200446c())
	{
		function_8e7c24bc(#"normal", 1, #"hash_71d760081148ecb6");
		function_8e7c24bc(#"normal", 2, #"hash_4f2e124a4b2b0bc3");
		function_8e7c24bc(#"normal", 3, #"hash_2b8bf3ab711529a8");
		function_8e7c24bc(#"normal", 4, #"hash_3e6f1def958c4b3d");
		function_8e7c24bc(#"normal", 5, #"hash_3a70ee29a1b9f032");
		function_8e7c24bc(#"normal", 6, #"hash_5e9c9f88842d805f");
	}
	else
	{
		function_8e7c24bc(#"normal", 1, #"hash_3970bd17d0c80ee9");
		function_8e7c24bc(#"normal", 2, #"hash_5f54a3c5729c5e20");
		function_8e7c24bc(#"normal", 3, #"hash_7961d52f46f8bdb");
		function_8e7c24bc(#"normal", 4, #"hash_47abf4722829700a");
		function_8e7c24bc(#"normal", 5, #"hash_4cee343a76feb1d5");
		function_8e7c24bc(#"normal", 6, #"hash_37f8ec422b2d0d8c");
	}
	function_8e7c24bc(#"hash_622e7c9cc7c06c7", 1, #"hash_521478a4982eef4f");
	function_8e7c24bc(#"hash_622e7c9cc7c06c7", 2, #"hash_6ed29fafec506ea2");
	function_8e7c24bc(#"hash_622e7c9cc7c06c7", 3, #"hash_5cb2f5bb1fc58cad");
	function_8e7c24bc(#"hash_622e7c9cc7c06c7", 4, #"hash_37382e7f41973358");
	function_8e7c24bc(#"hash_622e7c9cc7c06c7", 5, #"hash_11f28a428bde6973");
	function_8e7c24bc(#"hash_622e7c9cc7c06c7", 6, #"hash_56beeef12ed96266");
	function_8e7c24bc(#"hash_7a778318514578f7", 1, #"hash_521478a4982eef4f");
	function_8e7c24bc(#"hash_7a778318514578f7", 2, #"hash_6ed29fafec506ea2");
	function_8e7c24bc(#"hash_7a778318514578f7", 3, #"hash_5cb2f5bb1fc58cad");
	function_8e7c24bc(#"hash_7a778318514578f7", 4, #"hash_37382e7f41973358");
	function_8e7c24bc(#"hash_7a778318514578f7", 5, #"hash_11f28a428bde6973");
	function_8e7c24bc(#"hash_7a778318514578f7", 6, #"hash_56beeef12ed96266");
	function_8e7c24bc(#"special", 1, #"hash_7434c3ef3763f293");
	function_8e7c24bc(#"special", 2, #"hash_1207617b628e6706");
	function_8e7c24bc(#"special", 3, #"hash_6540961a1860ac81");
	function_8e7c24bc(#"special", 4, #"hash_69c0e3418ae7ea04");
	function_8e7c24bc(#"special", 5, #"hash_4ec3117b737f48ef");
	function_8e7c24bc(#"special", 6, #"hash_668d0d63986b95c2");
	if(zm_utility::is_classic())
	{
		function_8e7c24bc(#"hash_3adefdb432d5b064", 1, #"hash_20cf9bd43847f62c");
		function_8e7c24bc(#"hash_3adefdb432d5b064", 2, #"hash_508f8ce04a76e2f7");
		function_8e7c24bc(#"hash_3adefdb432d5b064", 3, #"hash_7b448e951364c86a");
		function_8e7c24bc(#"hash_3adefdb432d5b064", 4, #"hash_47d7f8f865b59665");
		function_8e7c24bc(#"hash_3adefdb432d5b064", 5, #"hash_40ee1ad229707a00");
		function_8e7c24bc(#"hash_3adefdb432d5b064", 6, #"hash_3d970199ba5ddf6b");
		function_8e7c24bc(#"elite", 1, #"hash_3640ffa1f26c43d6");
		function_8e7c24bc(#"elite", 2, #"hash_46551e87693166e3");
		function_8e7c24bc(#"elite", 3, #"hash_6de5a324f87a8cc8");
		function_8e7c24bc(#"elite", 4, #"hash_7559767c98007f5d");
		function_8e7c24bc(#"elite", 5, #"hash_28f0bc6a023675d2");
		function_8e7c24bc(#"elite", 6, #"hash_3cefdd5aa8a9967f");
	}
	else
	{
		if(zm_utility::function_c200446c())
		{
			function_8e7c24bc(#"hash_3adefdb432d5b064", 1, #"hash_5760b26e51ad9737");
			function_8e7c24bc(#"hash_3adefdb432d5b064", 2, #"hash_3f27259a0a216c6c");
			function_8e7c24bc(#"hash_3adefdb432d5b064", 3, #"hash_1e5db0734c456c81");
			function_8e7c24bc(#"hash_3adefdb432d5b064", 4, #"hash_790ef3cf334997ce");
			function_8e7c24bc(#"hash_3adefdb432d5b064", 5, #"hash_5e4ceabbcf01a5ab");
			function_8e7c24bc(#"hash_3adefdb432d5b064", 6, #"hash_4757c1d167e87940");
			function_8e7c24bc(#"special", 1, #"hash_7c73206328c135f4");
			function_8e7c24bc(#"special", 2, #"hash_4859e9f5bf0aefbd");
			function_8e7c24bc(#"special", 3, #"hash_445bba2fcb3894b2");
			function_8e7c24bc(#"special", 4, #"hash_5918de5074a9b043");
			function_8e7c24bc(#"special", 5, #"hash_3576bfb19a93ce28");
			function_8e7c24bc(#"special", 6, #"hash_5eb06ead237dae71");
			function_8e7c24bc(#"elite", 1, #"hash_7c73206328c135f4");
			function_8e7c24bc(#"elite", 2, #"hash_4859e9f5bf0aefbd");
			function_8e7c24bc(#"elite", 3, #"hash_445bba2fcb3894b2");
			function_8e7c24bc(#"elite", 4, #"hash_5918de5074a9b043");
			function_8e7c24bc(#"elite", 5, #"hash_3576bfb19a93ce28");
			function_8e7c24bc(#"elite", 6, #"hash_5eb06ead237dae71");
		}
		else
		{
			function_8e7c24bc(#"elite", 1, #"hash_3ce7e905227cc6ef");
			function_8e7c24bc(#"elite", 2, #"hash_54b1e4ed476913c2");
			function_8e7c24bc(#"elite", 3, #"hash_5321fc866b5674cd");
			function_8e7c24bc(#"elite", 4, #"hash_10b87793678eb878");
			function_8e7c24bc(#"elite", 5, #"hash_62599b78e6617093");
			function_8e7c24bc(#"elite", 6, #"hash_2c3905118be506");
		}
	}
}

/*
	Name: finalize
	Namespace: namespace_58949729
	Checksum: 0x799E192
	Offset: 0x1990
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function finalize()
{
	/#
		level thread function_2085db3b();
	#/
}

/*
	Name: function_5a12541e
	Namespace: namespace_58949729
	Checksum: 0x991A5CC4
	Offset: 0x19B8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_5a12541e()
{
	level.var_82d4d3b8 = 0;
	callback::on_ai_killed(&function_2394df30);
}

/*
	Name: function_6ac967bf
	Namespace: namespace_58949729
	Checksum: 0x43A2F42B
	Offset: 0x19F8
	Size: 0x5A
	Parameters: 3
	Flags: Linked, Private
*/
function private function_6ac967bf(type, var_b48509f9, list)
{
	if(!isdefined(level.var_6fff281a[type]))
	{
		level.var_6fff281a[type] = [];
	}
	level.var_6fff281a[type][var_b48509f9] = list;
}

/*
	Name: function_8e7c24bc
	Namespace: namespace_58949729
	Checksum: 0x65887BC8
	Offset: 0x1A60
	Size: 0x5A
	Parameters: 3
	Flags: Linked, Private
*/
function private function_8e7c24bc(type, var_b48509f9, list)
{
	if(!isdefined(level.var_b048b7e[type]))
	{
		level.var_b048b7e[type] = [];
	}
	level.var_b048b7e[type][var_b48509f9] = list;
}

/*
	Name: function_b764d7c6
	Namespace: namespace_58949729
	Checksum: 0xF2FD029C
	Offset: 0x1AC8
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_b764d7c6(attachment)
{
	switch(attachment)
	{
		case "suppressed":
		{
			return 8;
			break;
		}
		case "suppressed2":
		{
			return 10;
			break;
		}
		case "hash_6cb337a8f1814a78":
		{
			return 8;
			break;
		}
		case "hash_35d1de125eb13bbe":
		{
			return 10;
			break;
		}
	}
	return 0;
}

/*
	Name: function_339b84ba
	Namespace: namespace_58949729
	Checksum: 0x88F21B11
	Offset: 0x1B60
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_339b84ba(attachment)
{
	switch(attachment)
	{
		case "light":
		{
			return 5;
			break;
		}
		case "light2":
		{
			return 8;
			break;
		}
		case "hash_574e57ebbb1fab71":
		{
			return 3;
			break;
		}
		case "hash_79caa88ef6d002d9":
		{
			return 10;
			break;
		}
	}
	return 0;
}

/*
	Name: function_7ff60ccf
	Namespace: namespace_58949729
	Checksum: 0xA68F49E1
	Offset: 0x1BF8
	Size: 0x122
	Parameters: 1
	Flags: Linked
*/
function function_7ff60ccf(var_173cd713)
{
	if(!isdefined(var_173cd713))
	{
		var_173cd713 = 1;
	}
	switch(var_173cd713)
	{
		case 1:
		{
			return #"hash_2042e77c3ce99563";
			break;
		}
		case 2:
		{
			return #"hash_494c1bde3ba73e1e";
			break;
		}
		case 3:
		{
			return #"hash_16ce6d2a3a080ed";
			break;
		}
		case 4:
		{
			return #"hash_2e7dcdf753359010";
			break;
		}
		case 5:
		{
			return #"hash_2486a89180da5df7";
			break;
		}
		case 6:
		{
			return #"hash_4d1c224a3067c3b2";
			break;
		}
		default:
		{
			return #"hash_4d1c224a3067c3b2";
			break;
		}
	}
	return #"hash_2042e77c3ce99563";
}

/*
	Name: function_2394df30
	Namespace: namespace_58949729
	Checksum: 0x842DE977
	Offset: 0x1D28
	Size: 0x8A6
	Parameters: 1
	Flags: Linked
*/
function function_2394df30(s_params)
{
	/#
		if(is_true(getdvarint(#"hash_5b8584aa904a13cc")))
		{
			return;
		}
	#/
	if(is_true(self.var_98f1f37c))
	{
		return;
	}
	if(!isdefined(self) || !isactor(self))
	{
		return;
	}
	if(self function_dd070839())
	{
		return;
	}
	if(isdefined(s_params.weapon))
	{
		weapon = s_params.weapon;
	}
	zombie_origin = self.origin;
	var_3ecf13fe = self.angles;
	var_35d10171 = self.var_6f84b820;
	var_408fcfcb = self.var_9fde8624;
	var_2e6f77db = self.aitype;
	var_1c7494b3 = self.var_44505aa3;
	waitframe(1);
	var_cb46b9ea = {};
	[[ level.var_86a1e8b6 ]]->waitinqueue(var_cb46b9ea);
	var_9bbfe6c2 = 1;
	var_ec6368f9 = function_257d7203(var_35d10171);
	if(var_408fcfcb === #"hash_622e7c9cc7c06c7" || var_408fcfcb === #"hash_7a778318514578f7")
	{
		var_ec6368f9 = function_257d7203(var_408fcfcb);
	}
	dropstruct = {#hash_738dfc81:10, #angles:var_3ecf13fe, #origin:zombie_origin};
	var_5bb8af3f = dropstruct namespace_65181344::function_fd87c780(var_ec6368f9, 10, 2);
	if(!isdefined(var_5bb8af3f))
	{
		var_5bb8af3f = [];
	}
	if(var_5bb8af3f.size <= 0 && isdefined(weapon))
	{
		var_8be3ada4 = 0;
		var_311d223d = 0;
		var_e6d210b6 = 0;
		var_515ea3b6 = 0;
		var_d6525c75 = #"none";
		var_544f5f81 = #"none";
		if(isarray(weapon.attachments))
		{
			attachments = weapon.attachments;
			foreach(attachment in weapon.attachments)
			{
				if(attachment == #"suppressed" || attachment == #"suppressed2" || attachment == #"hash_6cb337a8f1814a78" || attachment == #"hash_35d1de125eb13bbe")
				{
					var_8be3ada4 = 1;
					var_d6525c75 = attachment;
				}
				if(attachment == #"light" || attachment == #"light2" || attachment == #"hash_574e57ebbb1fab71" || attachment == #"hash_79caa88ef6d002d9")
				{
					var_311d223d = 1;
					var_544f5f81 = attachment;
				}
			}
		}
		if(var_8be3ada4 && var_311d223d)
		{
			var_e6d210b6 = function_b764d7c6(var_d6525c75);
			var_515ea3b6 = function_339b84ba(var_544f5f81);
			if(math::cointoss(var_e6d210b6))
			{
				dropstruct = {#hash_738dfc81:10, #angles:var_3ecf13fe, #origin:zombie_origin};
				var_5bb8af3f = dropstruct namespace_65181344::function_fd87c780(#"hash_2cdfcdfd6191b1a9", 1, 2);
			}
			if(var_5bb8af3f.size <= 0)
			{
				if(math::cointoss(var_515ea3b6))
				{
					list = function_7ff60ccf(zm_utility::function_e3025ca5());
					dropstruct = {#hash_738dfc81:10, #angles:var_3ecf13fe, #origin:zombie_origin};
					var_5bb8af3f = dropstruct namespace_65181344::function_fd87c780(list, 1, 2);
				}
			}
		}
		else
		{
			if(var_8be3ada4)
			{
				var_e6d210b6 = function_b764d7c6(var_d6525c75);
				if(math::cointoss(var_e6d210b6))
				{
					dropstruct = {#hash_738dfc81:10, #angles:var_3ecf13fe, #origin:zombie_origin};
					var_5bb8af3f = dropstruct namespace_65181344::function_fd87c780(#"hash_2cdfcdfd6191b1a9", 1, 2);
				}
			}
			else if(var_311d223d)
			{
				var_515ea3b6 = function_339b84ba(var_544f5f81);
				if(math::cointoss(var_515ea3b6))
				{
					list = function_7ff60ccf(zm_utility::function_e3025ca5());
					dropstruct = {#hash_738dfc81:10, #angles:var_3ecf13fe, #origin:zombie_origin};
					var_5bb8af3f = dropstruct namespace_65181344::function_fd87c780(list, 1, 2);
				}
			}
		}
	}
	wait(0.2);
	if(isdefined(var_2e6f77db) && issubstr(var_2e6f77db, "hvt"))
	{
		a_items = dropstruct namespace_65181344::function_fd87c780(#"hash_7a046d913a142a88", 1, 2);
		if(isarray(a_items))
		{
			var_5bb8af3f = arraycombine(var_5bb8af3f, a_items, 0, 0);
		}
	}
	if(isdefined(level.var_b20199e0))
	{
		a_items = dropstruct [[level.var_b20199e0]]();
		if(isarray(a_items))
		{
			var_5bb8af3f = arraycombine(var_5bb8af3f, a_items, 0, 0);
		}
	}
	foreach(item in var_5bb8af3f)
	{
		if(isdefined(item))
		{
			item.var_d688ad29 = 1;
		}
	}
}

/*
	Name: function_257d7203
	Namespace: namespace_58949729
	Checksum: 0xEEC262A6
	Offset: 0x25D8
	Size: 0xB2
	Parameters: 2
	Flags: Linked
*/
function function_257d7203(type, var_59364773)
{
	if(!isdefined(type))
	{
		type = #"normal";
	}
	var_b48509f9 = zm_utility::function_e3025ca5();
	if(isdefined(var_59364773))
	{
		var_b48509f9 = var_b48509f9 + var_59364773;
	}
	var_b48509f9 = math::clamp(var_b48509f9, 1, 6);
	if(isdefined(level.var_b048b7e[type][var_b48509f9]))
	{
		return level.var_b048b7e[type][var_b48509f9];
	}
	return #"hash_3970bd17d0c80ee9";
}

/*
	Name: function_fd5e77fa
	Namespace: namespace_58949729
	Checksum: 0xFB63D769
	Offset: 0x2698
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function function_fd5e77fa(type)
{
	if(!isdefined(type))
	{
		type = #"small";
	}
	var_b48509f9 = zm_utility::function_e3025ca5();
	var_b48509f9 = math::clamp(var_b48509f9, 1, 6);
	if(isdefined(level.var_6fff281a[type][var_b48509f9]))
	{
		return level.var_6fff281a[type][var_b48509f9];
	}
	return #"hash_3284bf8ca3a6f00b";
}

/*
	Name: function_6e72c1e2
	Namespace: namespace_58949729
	Checksum: 0x7BF622C2
	Offset: 0x2740
	Size: 0x122
	Parameters: 1
	Flags: Linked
*/
function function_6e72c1e2(instance)
{
	destination = instance.location.destination;
	switch(destination.targetname)
	{
		case "hash_2041750e8a960d7d":
		{
			return 5;
		}
		case "hash_5916716310680195":
		{
			return 5;
		}
		case "hash_d4f4079cb93246f":
		{
			return 5;
		}
		case "hash_2d1de2a0a5c25bd9":
		{
			return 5;
		}
		case "hash_43272f4dc95dce62":
		{
			return 5;
		}
		case "hash_1cc277407eed9c27":
		{
			return 5;
		}
		case "hash_13e66a07a0ef569d":
		{
			return 5;
		}
		case "hash_677d5923437f98ef":
		{
			return 5;
		}
		case "hash_4de7a307c10b2ed4":
		{
			return 5;
		}
		default:
		{
			return 5;
		}
	}
}

/*
	Name: function_933f4c09
	Namespace: namespace_58949729
	Checksum: 0x599D3F15
	Offset: 0x2870
	Size: 0x122
	Parameters: 1
	Flags: Linked
*/
function function_933f4c09(instance)
{
	destination = instance.location.destination;
	switch(destination.targetname)
	{
		case "hash_2041750e8a960d7d":
		{
			return 10;
		}
		case "hash_5916716310680195":
		{
			return 10;
		}
		case "hash_d4f4079cb93246f":
		{
			return 10;
		}
		case "hash_2d1de2a0a5c25bd9":
		{
			return 10;
		}
		case "hash_43272f4dc95dce62":
		{
			return 10;
		}
		case "hash_1cc277407eed9c27":
		{
			return 10;
		}
		case "hash_13e66a07a0ef569d":
		{
			return 10;
		}
		case "hash_677d5923437f98ef":
		{
			return 10;
		}
		case "hash_4de7a307c10b2ed4":
		{
			return 10;
		}
		default:
		{
			return 10;
		}
	}
}

/*
	Name: function_7cd90066
	Namespace: namespace_58949729
	Checksum: 0x576B171E
	Offset: 0x29A0
	Size: 0x122
	Parameters: 1
	Flags: Linked
*/
function function_7cd90066(instance)
{
	destination = instance.location.destination;
	switch(destination.targetname)
	{
		case "hash_2041750e8a960d7d":
		{
			return 10;
		}
		case "hash_5916716310680195":
		{
			return 10;
		}
		case "hash_d4f4079cb93246f":
		{
			return 10;
		}
		case "hash_2d1de2a0a5c25bd9":
		{
			return 10;
		}
		case "hash_43272f4dc95dce62":
		{
			return 10;
		}
		case "hash_1cc277407eed9c27":
		{
			return 10;
		}
		case "hash_13e66a07a0ef569d":
		{
			return 10;
		}
		case "hash_677d5923437f98ef":
		{
			return 10;
		}
		case "hash_4de7a307c10b2ed4":
		{
			return 10;
		}
		default:
		{
			return 10;
		}
	}
}

/*
	Name: function_c3e93273
	Namespace: namespace_58949729
	Checksum: 0xC114F3F0
	Offset: 0x2AD0
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function function_c3e93273(instance)
{
	var_cc1fb2d0 = function_fd5e77fa(#"large");
	var_3a053962 = #"hash_39c86bb99fc237d";
	/#
		str_dvar = "";
	#/
	var_c6e3f0a = function_6e72c1e2(instance);
	if(getplayers().size > 3)
	{
		var_c6e3f0a = var_c6e3f0a + 1;
	}
	function_34c59c2c(instance, var_c6e3f0a, var_cc1fb2d0, var_3a053962, #"hash_473df02427c669ff", 3, str_dvar);
}

/*
	Name: function_50855654
	Namespace: namespace_58949729
	Checksum: 0x933CEFD1
	Offset: 0x2BC0
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function function_50855654(instance)
{
	var_cc1fb2d0 = function_fd5e77fa(#"medium");
	var_3a053962 = #"hash_4392142b99d9d79a";
	/#
		str_dvar = "";
	#/
	var_c6e3f0a = function_933f4c09(instance);
	if(getplayers().size > 2)
	{
		var_c6e3f0a = var_c6e3f0a + 1;
	}
	function_34c59c2c(instance, var_c6e3f0a, var_cc1fb2d0, var_3a053962, #"hash_7d3c5ac38ba069f0", 2, str_dvar);
}

/*
	Name: function_61f1a62e
	Namespace: namespace_58949729
	Checksum: 0x97BB6817
	Offset: 0x2CB0
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function function_61f1a62e(instance)
{
	var_cc1fb2d0 = function_fd5e77fa(#"small");
	var_3a053962 = #"hash_27f68725fa24b68";
	/#
		str_dvar = "";
	#/
	var_c6e3f0a = function_7cd90066(instance);
	if(getplayers().size > 1)
	{
		var_c6e3f0a = var_c6e3f0a + 1;
	}
	function_34c59c2c(instance, var_c6e3f0a, var_cc1fb2d0, var_3a053962, #"hash_5815cc7ba68d56e", 1, str_dvar);
}

/*
	Name: function_34c59c2c
	Namespace: namespace_58949729
	Checksum: 0xFB35455E
	Offset: 0x2DA0
	Size: 0x3CC
	Parameters: 7
	Flags: Linked
*/
function function_34c59c2c(instance, var_c6e3f0a, var_cc1fb2d0, var_3a053962, str_scene, var_dae71351, str_dvar)
{
	a_spawn_points = instance.var_fe2612fe[#"hash_6b1e5d8f9e70a70e"];
	a_spawn_points = array::randomize(a_spawn_points);
	var_8634611a = [];
	for(i = 0; i < a_spawn_points.size; i++)
	{
		struct = a_spawn_points[i];
		if(isdefined(struct.scriptmodel))
		{
			struct.scriptmodel delete();
		}
		if(isdefined(struct.trigger))
		{
			struct.trigger delete();
		}
		var_df4d665a = function_ce254cce(struct);
		if(var_8634611a.size >= var_c6e3f0a || (!var_df4d665a && getdvarint(#"hash_6e805904860dca0d", 0)))
		{
			if(var_df4d665a || getdvarint(#"hash_6e805904860dca0d", 0) && var_3a053962 !== "p9_fxanim_zm_gp_chest_01_sml_low_xmodel")
			{
				struct.var_3a053962 = var_3a053962;
				struct.var_dae71351 = var_dae71351;
				if(!isdefined(level.var_86e072a5))
				{
					level.var_86e072a5 = [];
				}
				else if(!isarray(level.var_86e072a5))
				{
					level.var_86e072a5 = array(level.var_86e072a5);
				}
				level.var_86e072a5[level.var_86e072a5.size] = struct;
			}
			continue;
		}
		util::wait_network_frame();
		/#
			level thread function_e4314d0e(struct);
		#/
		if(!var_df4d665a)
		{
			continue;
		}
		function_4ec9fc99(struct, var_cc1fb2d0, var_3a053962, str_scene, var_dae71351);
		if(!isdefined(var_8634611a))
		{
			var_8634611a = [];
		}
		else if(!isarray(var_8634611a))
		{
			var_8634611a = array(var_8634611a);
		}
		if(!isinarray(var_8634611a, struct))
		{
			var_8634611a[var_8634611a.size] = struct;
		}
		if(!isdefined(level.var_8634611a))
		{
			level.var_8634611a = [];
		}
		else if(!isarray(level.var_8634611a))
		{
			level.var_8634611a = array(level.var_8634611a);
		}
		if(!isinarray(level.var_8634611a, struct))
		{
			level.var_8634611a[level.var_8634611a.size] = struct;
		}
	}
	/#
		instance.var_8634611a = var_8634611a;
		level thread function_8f59f892(instance, str_dvar);
	#/
}

/*
	Name: function_ce254cce
	Namespace: namespace_58949729
	Checksum: 0x7B20BA37
	Offset: 0x3178
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function function_ce254cce(struct)
{
	var_4ee5a6d7 = arraysortclosest(level.var_8634611a, struct.origin, 1, 0, 2000);
	if(var_4ee5a6d7.size > 0)
	{
		return false;
	}
	return true;
}

/*
	Name: function_4ec9fc99
	Namespace: namespace_58949729
	Checksum: 0x9453A6A0
	Offset: 0x31E0
	Size: 0x26E
	Parameters: 5
	Flags: Linked
*/
function function_4ec9fc99(struct, var_cc1fb2d0, var_3a053962, str_scene, var_dae71351)
{
	struct.scriptmodel = namespace_8b6a9d79::spawn_script_model(struct, var_3a053962, 1);
	struct.scriptmodel clientfield::set("reward_chest_fx", var_dae71351);
	struct.var_422ae63e = str_scene;
	forward = anglestoforward(struct.scriptmodel.angles);
	forward = vectornormalize(forward);
	forward = (forward[0] * 16, forward[1] * 16, forward[2] * 16);
	forward = (forward[0], forward[1], forward[2] + 16);
	trigger = namespace_8b6a9d79::function_214737c7(struct, &function_8665f666, #"hash_4703982104472957", undefined, 60, 24, undefined, forward);
	trigger.struct = struct;
	trigger.var_cc1fb2d0 = var_cc1fb2d0;
	trigger.targetname = "explore_chest_trigger";
	struct.trigger = trigger;
	if(var_3a053962 === #"hash_401a47741ffd646f")
	{
		trigger sethintstring("SURVIVAL/SUPPLY_DROP_OPEN");
	}
	else
	{
		if(var_3a053962 === "p9_fxanim_zm_gp_chest_01_lrg_low_xmodel")
		{
			trigger sethintstring("SCRIPT/SR_LOOT_HINT_LARGE");
		}
		else
		{
			if(var_3a053962 === "p9_fxanim_zm_gp_chest_01_med_low_xmodel")
			{
				trigger sethintstring("SCRIPT/SR_LOOT_HINT_MEDIUM");
			}
			else if(var_3a053962 === "p9_fxanim_zm_gp_chest_01_sml_low_xmodel")
			{
				trigger sethintstring("SCRIPT/SR_LOOT_HINT_SMALL");
			}
		}
	}
	trigger.origin = trigger.origin + vectorscale((0, 0, 1), 16);
}

/*
	Name: function_25979f32
	Namespace: namespace_58949729
	Checksum: 0xB281E2BC
	Offset: 0x3458
	Size: 0x428
	Parameters: 3
	Flags: Linked
*/
function function_25979f32(struct, var_93fe96a6, s_instance)
{
	if(isdefined(s_instance) && s_instance flag::get("cleanup"))
	{
		return;
	}
	if(!isdefined(struct.var_422ae63e))
	{
		struct.var_422ae63e = #"hash_473df02427c669ff";
	}
	if(!isdefined(struct.var_cc1fb2d0))
	{
		struct.var_cc1fb2d0 = function_fd5e77fa(#"gold");
	}
	if(!isdefined(struct.var_31919730))
	{
		struct.var_31919730 = #"hash_401a47741ffd646f";
	}
	if(!isdefined(struct.var_dae71351))
	{
		struct.var_dae71351 = 3;
	}
	struct.scriptmodel = namespace_8b6a9d79::spawn_script_model(struct, struct.var_31919730, 1);
	struct.scriptmodel clientfield::set("reward_chest_fx", struct.var_dae71351);
	forward = anglestoforward(struct.scriptmodel.angles);
	forward = vectornormalize(forward);
	forward = (forward[0] * 16, forward[1] * 16, forward[2] * 16);
	forward = (forward[0], forward[1], forward[2] + 16);
	trigger = namespace_8b6a9d79::function_214737c7(struct, &function_8665f666, #"hash_4703982104472957", undefined, 60, 24, undefined, forward);
	trigger.struct = struct;
	trigger.var_cc1fb2d0 = struct.var_cc1fb2d0;
	struct.scriptmodel.trigger = trigger;
	if(struct.var_31919730 === #"hash_401a47741ffd646f")
	{
		trigger sethintstring("SURVIVAL/SUPPLY_DROP_OPEN");
	}
	else
	{
		if(struct.var_31919730 === "p9_fxanim_zm_gp_chest_01_lrg_low_xmodel")
		{
			trigger sethintstring("SCRIPT/SR_LOOT_HINT_LARGE");
		}
		else
		{
			if(struct.var_31919730 === "p9_fxanim_zm_gp_chest_01_med_low_xmodel")
			{
				trigger sethintstring("SCRIPT/SR_LOOT_HINT_MEDIUM");
			}
			else if(struct.var_31919730 === "p9_fxanim_zm_gp_chest_01_sml_low_xmodel")
			{
				trigger sethintstring("SCRIPT/SR_LOOT_HINT_SMALL");
			}
		}
	}
	trigger.origin = trigger.origin + vectorscale((0, 0, 1), 16);
	if(is_true(var_93fe96a6))
	{
		struct.var_e234ef47 = zm_utility::function_f5a222a8(#"hash_15752913c15d86ff", struct.scriptmodel);
	}
	if(isdefined(s_instance))
	{
		if(!isdefined(s_instance.var_f46ace2))
		{
			s_instance.var_f46ace2 = [];
		}
		else if(!isarray(s_instance.var_f46ace2))
		{
			s_instance.var_f46ace2 = array(s_instance.var_f46ace2);
		}
		if(!isinarray(s_instance.var_f46ace2, struct))
		{
			s_instance.var_f46ace2[s_instance.var_f46ace2.size] = struct;
		}
	}
}

/*
	Name: function_ccf9be41
	Namespace: namespace_58949729
	Checksum: 0x229B7D9F
	Offset: 0x3888
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_ccf9be41(s_instance)
{
	if(isdefined(s_instance.var_f46ace2))
	{
		foreach(s_chest in s_instance.var_f46ace2)
		{
			if(isdefined(s_chest))
			{
				function_a3852ab5(s_chest);
			}
		}
		arrayremovevalue(s_instance.var_f46ace2, undefined);
	}
}

/*
	Name: function_a3852ab5
	Namespace: namespace_58949729
	Checksum: 0x779BACEA
	Offset: 0x3958
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_a3852ab5(struct)
{
	function_a5d57202(struct);
	if(isdefined(struct.scriptmodel.trigger))
	{
		struct.scriptmodel.trigger delete();
	}
	if(isdefined(struct.scriptmodel))
	{
		struct.scriptmodel scene::stop();
		struct.scriptmodel delete();
	}
}

/*
	Name: function_a5d57202
	Namespace: namespace_58949729
	Checksum: 0xF5B0A6FA
	Offset: 0x3A00
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function function_a5d57202(struct)
{
	if(isdefined(struct.var_e234ef47))
	{
		objective_delete(struct.var_e234ef47);
		gameobjects::release_obj_id(struct.var_e234ef47);
		struct.var_e234ef47 = undefined;
	}
}

/*
	Name: function_7e02195f
	Namespace: namespace_58949729
	Checksum: 0x60A4A2D9
	Offset: 0x3A60
	Size: 0x124
	Parameters: 3
	Flags: Linked
*/
function function_7e02195f(s_spawn_point, var_3a053962, var_dae71351)
{
	if(!isdefined(var_3a053962))
	{
		var_3a053962 = "p9_fxanim_zm_gp_chest_01_med_low_xmodel";
	}
	if(!isdefined(var_dae71351))
	{
		var_dae71351 = 2;
	}
	if(var_3a053962 === "p9_fxanim_zm_gp_chest_01_lrg_low_xmodel")
	{
		var_68455141 = #"hash_e492c531718b7e2";
	}
	else
	{
		var_68455141 = #"hash_4c4e28d400b974a8";
	}
	var_c590f74 = namespace_be0f9d50::function_b309db61([0:s_spawn_point], undefined, undefined, var_68455141);
	var_c590f74 clientfield::set("reward_chest_fx", var_dae71351);
	/#
		if(getdvarint(#"hash_6e805904860dca0d", 0))
		{
			debugstar(s_spawn_point.origin, 99999, (1, 1, 1), "");
		}
	#/
}

/*
	Name: function_2901cde1
	Namespace: namespace_58949729
	Checksum: 0xF4388DFF
	Offset: 0x3B90
	Size: 0x1FE
	Parameters: 0
	Flags: None
*/
function function_2901cde1()
{
	self notify("5eddd57ecdd983f1");
	self endon("5eddd57ecdd983f1");
	self endon(#"death");
	while(true)
	{
		foreach(player in getplayers())
		{
			if(!isdefined(player.var_4ee86e15))
			{
				player.var_4ee86e15 = [];
			}
			if(!isinarray(player.var_4ee86e15, self) && distancesquared(player.origin, self.origin) < 1562500)
			{
				player thread globallogic_audio::play_taacom_dialog("treasureChest");
				arrayremovevalue(player.var_4ee86e15, undefined);
				if(!isdefined(player.var_4ee86e15))
				{
					player.var_4ee86e15 = [];
				}
				else if(!isarray(player.var_4ee86e15))
				{
					player.var_4ee86e15 = array(player.var_4ee86e15);
				}
				if(!isinarray(player.var_4ee86e15, self))
				{
					player.var_4ee86e15[player.var_4ee86e15.size] = self;
				}
			}
		}
		wait(1);
	}
}

/*
	Name: function_8665f666
	Namespace: namespace_58949729
	Checksum: 0x8D5823BD
	Offset: 0x3D98
	Size: 0x364
	Parameters: 1
	Flags: Linked
*/
function function_8665f666(eventstruct)
{
	if(is_true(self.b_opened))
	{
		return;
	}
	self.b_opened = 1;
	self notify(#"chest_opened");
	self callback::function_b74bf3e(&function_8665f666);
	self triggerenable(0);
	self.struct.scriptmodel thread scene::play(self.struct.var_422ae63e, self.struct.scriptmodel);
	if(isplayer(eventstruct.activator))
	{
		eventstruct.activator playrumbleonentity("damage_heavy");
		eventstruct.activator zm_stats::function_945c7ce2(#"hash_346e6565d0a79066", 1);
	}
	var_2fab6c8d = #"hash_3c26138474513c5c";
	if(isdefined(self.var_cc1fb2d0))
	{
		if(self.var_cc1fb2d0 === #"hash_1aa6f1facd821300")
		{
			var_2fab6c8d = #"hash_2f094f31f2dbf8f4";
		}
		else if(self.var_cc1fb2d0 === #"hash_4d5713fd0d76f4a")
		{
			var_2fab6c8d = #"hash_6f32121c959e02d0";
		}
	}
	self.struct.scriptmodel playsound(var_2fab6c8d);
	wait(1);
	if(isdefined(self.struct.scriptmodel))
	{
		level thread function_f82f361c(self.struct, self.var_cc1fb2d0, 3, 0, vectorscale((0, 0, -1), 8), 1);
		if(self.struct.scriptmodel.model === #"hash_401a47741ffd646f")
		{
			v_drop = (anglestoup(self.struct.scriptmodel.angles) * 16) + (anglestoforward(self.struct.scriptmodel.angles) * 12);
			level thread util::delay(1, undefined, &zm_powerups::specific_powerup_drop, "hero_weapon_power", self.struct.scriptmodel.origin + v_drop);
		}
		self.struct.scriptmodel thread function_1e2500f();
	}
	waittillframeend();
	if(isdefined(self))
	{
		function_a5d57202(self.struct);
		self delete();
	}
}

/*
	Name: function_1e2500f
	Namespace: namespace_58949729
	Checksum: 0xE63A762C
	Offset: 0x4108
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_1e2500f()
{
	level endon(#"game_ended");
	self endon(#"death");
	self clientfield::set("reward_chest_fx", 0);
	level function_a518db14(self.origin);
	self scene::stop();
	util::wait_network_frame();
	self delete();
}

/*
	Name: function_a518db14
	Namespace: namespace_58949729
	Checksum: 0x86C996FA
	Offset: 0x41C0
	Size: 0x78
	Parameters: 2
	Flags: Linked
*/
function function_a518db14(location, radius)
{
	if(!isdefined(radius))
	{
		radius = 1500;
	}
	level endon(#"game_ended");
	while(true)
	{
		if(getplayers("all", location, radius).size == 0)
		{
			return;
		}
		wait(5);
	}
}

/*
	Name: function_f82f361c
	Namespace: namespace_58949729
	Checksum: 0x181D3649
	Offset: 0x4240
	Size: 0x356
	Parameters: 6
	Flags: Linked
*/
function function_f82f361c(struct, var_cc1fb2d0, var_98d110e6, var_5b57dd9, v_offset, var_e2856109)
{
	if(!isdefined(var_98d110e6))
	{
		var_98d110e6 = 1;
	}
	if(!isdefined(var_5b57dd9))
	{
		var_5b57dd9 = 0;
	}
	if(!isdefined(v_offset))
	{
		v_offset = (0, 0, 0);
	}
	if(!isdefined(var_e2856109))
	{
		var_e2856109 = 0;
	}
	scriptmodel = struct.scriptmodel;
	reward_origin = scriptmodel.origin;
	if(var_5b57dd9)
	{
		reward_origin = struct.origin;
	}
	reward_origin = reward_origin + v_offset;
	n_count = struct.var_738dfc81;
	if(!isdefined(n_count))
	{
		n_count = 99;
	}
	dropstruct = {#hash_738dfc81:n_count, #angles:scriptmodel.angles, #origin:reward_origin};
	a_items = dropstruct namespace_65181344::function_fd87c780(var_cc1fb2d0, n_count, var_98d110e6);
	if(var_cc1fb2d0 === #"hash_69f376be088d343a" || var_cc1fb2d0 === #"hash_69f375be088d3287" || var_cc1fb2d0 === #"hash_69f374be088d30d4" || var_cc1fb2d0 === #"hash_69f373be088d2f21" || var_cc1fb2d0 === #"hash_69f372be088d2d6e" || var_cc1fb2d0 === #"hash_69f371be088d2bbb")
	{
		foreach(item in a_items)
		{
			if(item.var_a6762160.name === #"hash_5a5d63f61e6770f9" || item.var_a6762160.name === #"hash_58951f692bf35608")
			{
				item.var_569199b9 = 1;
			}
		}
	}
	else if(is_true(var_e2856109))
	{
		foreach(item in a_items)
		{
			if(isdefined(item) && isdefined(item.var_a6762160))
			{
				item.var_a6762160.var_387e74f4 = 1;
			}
		}
	}
}

/*
	Name: function_3e953077
	Namespace: namespace_58949729
	Checksum: 0x2EF6EAF6
	Offset: 0x45A0
	Size: 0x4A6
	Parameters: 1
	Flags: Linked
*/
function function_3e953077(instance)
{
	var_168390c = 0;
	var_e472e403 = 15;
	n_pods = 0;
	var_cb77f56c = instance.var_fe2612fe[#"hash_5b9881428a7afa40"];
	if(isdefined(var_cb77f56c))
	{
		/#
			level.var_50e94447 = var_cb77f56c;
		#/
		var_cb77f56c = array::randomize(var_cb77f56c);
		foreach(var_f721c918 in var_cb77f56c)
		{
			var_3471a9bf = 0;
			a_spawn_points = array::randomize(var_f721c918.var_fe2612fe[#"hash_49340510783e32e4"]);
			foreach(spawn in a_spawn_points)
			{
				if(var_168390c)
				{
					continue;
				}
				if(randomint(100) > var_e472e403 || getdvarint(#"hash_731bacd49b186d10", 0))
				{
					if(math::cointoss(50))
					{
						model = #"hash_40ce47dd15f047d6";
						str_scene = "p9_zm_gold_sur_crystal_medium_01_bundle";
					}
					else
					{
						model = #"hash_40ce46dd15f04623";
						str_scene = "p9_zm_gold_sur_crystal_medium_02_bundle";
					}
					e_pod = util::spawn_model(model, spawn.origin, spawn.angles, undefined, 1);
					if(isdefined(e_pod))
					{
						n_pods++;
						var_3471a9bf++;
						if(!isdefined(instance.a_models))
						{
							instance.a_models = [];
						}
						else if(!isarray(instance.a_models))
						{
							instance.a_models = array(instance.a_models);
						}
						instance.a_models[instance.a_models.size] = e_pod;
						e_pod setscale(randomfloatrange(0.85, 1.2));
						e_pod function_619a5c20();
						e_pod val::set("loot_pod", "takedamage", 1);
						e_pod.health = 5;
						e_pod thread scene::play(str_scene, e_pod);
						e_pod fx::play(#"hash_6583defa5c93e609", e_pod.origin, e_pod.angles, #"hash_285fd9bc53c292d8", 1);
						/#
							e_pod.targetname = "";
						#/
						level thread function_8265e656(e_pod);
						if(n_pods >= 33 || var_3471a9bf >= 7 && !getdvarint(#"hash_731bacd49b186d10", 0))
						{
							var_168390c = 1;
							continue;
						}
						util::wait_network_frame();
					}
				}
			}
			if(n_pods < 33)
			{
				var_168390c = 0;
			}
		}
	}
}

/*
	Name: vecscale
	Namespace: namespace_58949729
	Checksum: 0xAB71881
	Offset: 0x4A50
	Size: 0x3E
	Parameters: 2
	Flags: Linked
*/
function vecscale(vec, scalar)
{
	return (vec[0] * scalar, vec[1] * scalar, vec[2] * scalar);
}

/*
	Name: function_8265e656
	Namespace: namespace_58949729
	Checksum: 0xCF6BB7A3
	Offset: 0x4A98
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_8265e656(e_pod)
{
	level endon(#"hash_4a140b223cb0019d");
	if(isdefined(e_pod))
	{
		e_pod callback::function_d8abfc3d(#"hash_5f0caa4b2d44fedf", &function_cb742921);
	}
	while(isdefined(e_pod) && e_pod.health > 0)
	{
		s_result = undefined;
		s_result = e_pod waittill(#"damage", #"death");
		if(isplayer(s_result.attacker) && isalive(s_result.attacker))
		{
			s_result.attacker util::show_hit_marker();
		}
	}
	e_pod callback::callback(#"hash_5f0caa4b2d44fedf", s_result);
}

/*
	Name: function_cb742921
	Namespace: namespace_58949729
	Checksum: 0xFDC53C63
	Offset: 0x4BD8
	Size: 0x124
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cb742921(s_result)
{
	if(isplayer(s_result.attacker) || isai(s_result.attacker) || isvehicle(s_result.attacker))
	{
		self function_8ef626e3();
		playsoundatposition(#"hash_54c5c342b84cf845", self.origin);
		if(isplayer(s_result.attacker) && s_result.attacker isinvehicle())
		{
			var_80730518 = s_result.attacker getvehicleoccupied();
			if(isdefined(var_80730518))
			{
				var_80730518 thread function_df0dbb31();
			}
		}
	}
}

/*
	Name: function_df0dbb31
	Namespace: namespace_58949729
	Checksum: 0xA36FE194
	Offset: 0x4D08
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_df0dbb31()
{
	self endon(#"death");
	waitframe(1);
	self playrumbleonentity("sr_prototype_vehicle_run_over");
	self playsound(#"hash_7c72cea06ae4906c");
	playsoundatposition(#"hash_54c5c342b84cf845", self.origin);
}

/*
	Name: function_ff8b3908
	Namespace: namespace_58949729
	Checksum: 0x8CD6EF76
	Offset: 0x4D98
	Size: 0x54
	Parameters: 1
	Flags: Private, Event
*/
event private function_ff8b3908(eventstruct)
{
	dynent = eventstruct.ent;
	if(dynent.script_noteworthy === #"hash_5839d424446cf8ea")
	{
		dynent function_8ef626e3();
	}
}

/*
	Name: function_8ef626e3
	Namespace: namespace_58949729
	Checksum: 0x58064E44
	Offset: 0x4DF8
	Size: 0x25C
	Parameters: 0
	Flags: Linked
*/
function function_8ef626e3()
{
	var_7580ce3e = spawnstruct();
	var_7580ce3e.origin = self.origin;
	var_7580ce3e.angles = self.angles;
	var_7580ce3e.var_738dfc81 = 1;
	var_7580ce3e.scriptmodel = self;
	var_dddebb5c = anglestoup(var_7580ce3e.angles);
	var_dddebb5c = vectornormalize(var_dddebb5c);
	var_dddebb5c = vecscale(var_dddebb5c, 32);
	var_7580ce3e.origin = var_7580ce3e.origin + var_dddebb5c;
	if(isentity(self) && !isdefined(self.var_493b77d4))
	{
		self notify(#"hash_285fd9bc53c292d8");
		self function_23a29590();
		self fx::play(#"hash_65063e9505bafd58", self.origin, self.angles);
		if(self.modelname === "p9_gold_surcrystal_medium_01")
		{
			self setmodel(#"p9_sur_crystal_medium_01_dmg");
		}
		else
		{
			self setmodel(#"p9_sur_crystal_medium_02_dmg");
		}
	}
	if(is_true(self.var_defc3cee))
	{
		var_9b2da190 = function_fd5e77fa(#"hash_24af9f98f7899474");
	}
	else
	{
		var_9b2da190 = function_fd5e77fa(#"pod");
	}
	level thread function_f82f361c(var_7580ce3e, var_9b2da190, 2, 1);
	var_7580ce3e struct::delete();
}

/*
	Name: function_dabc4d71
	Namespace: namespace_58949729
	Checksum: 0x2314D202
	Offset: 0x5060
	Size: 0x24
	Parameters: 2
	Flags: Linked
*/
function function_dabc4d71(item_name, func)
{
	level.var_a332ae5f[item_name] = func;
}

/*
	Name: function_cff40da3
	Namespace: namespace_58949729
	Checksum: 0xC0E31E18
	Offset: 0x5090
	Size: 0x12A
	Parameters: 0
	Flags: Linked
*/
function function_cff40da3()
{
	var_add423b7 = 0;
	foreach(player in getplayers())
	{
		if((isdefined(player.maxarmor) ? player.maxarmor : 0) != 0)
		{
			level.var_20b35e7a = 1;
			var_add423b7 = 1;
			return #"hash_fb02b41b0d01f39";
		}
	}
	if(!var_add423b7 && !is_true(level.var_20b35e7a))
	{
		level.var_20b35e7a = 1;
		return #"hash_35675bbd363f934a";
	}
	return #"hash_fb02b41b0d01f39";
}

/*
	Name: function_e15f0669
	Namespace: namespace_58949729
	Checksum: 0x52A0DC87
	Offset: 0x51C8
	Size: 0x16A
	Parameters: 0
	Flags: Linked
*/
function function_e15f0669()
{
	if(!isdefined(level.var_102e4ee5))
	{
		level.var_102e4ee5 = 1;
	}
	if(!isdefined(level.var_a68449d2))
	{
		level.var_a68449d2 = 0;
	}
	players = getplayers();
	level.var_102e4ee5 = players.size;
	var_eceee3fa = 0;
	foreach(player in players)
	{
		var_74895d6d = (isdefined(player.var_72249004) ? player.var_72249004 : 0);
		if(var_74895d6d > 0)
		{
			var_eceee3fa++;
		}
	}
	if(var_eceee3fa == players.size || level.var_a68449d2 > level.var_102e4ee5)
	{
		return #"hash_5a5d63f61e6770f9";
	}
	level.var_a68449d2++;
	return #"hash_2cdb76a587cf7a3b";
}

/*
	Name: function_2085db3b
	Namespace: namespace_58949729
	Checksum: 0xD0B57298
	Offset: 0x5340
	Size: 0x134
	Parameters: 0
	Flags: None
*/
function function_2085db3b()
{
	/#
		util::waittill_can_add_debug_command();
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		util::function_e2e9d901("", "");
		level thread function_b6b13cf8();
	#/
}

/*
	Name: function_b6b13cf8
	Namespace: namespace_58949729
	Checksum: 0x80AFA278
	Offset: 0x5480
	Size: 0x3BE
	Parameters: 0
	Flags: None
*/
function function_b6b13cf8()
{
	/#
		n_group = 0;
		while(true)
		{
			var_8f420c16 = getdvarint(#"hash_731bacd49b186d10", 0);
			if(var_8f420c16 && isdefined(level.var_50e94447))
			{
				iprintlnbold("");
				function_3e953077(level.var_50e94447[0].parent);
				iprintlnbold("");
				setdvar(#"hash_731bacd49b186d10", 0);
			}
			n_debug = getdvarint(#"hash_748d6103fdf3d390", 0);
			if(n_debug)
			{
				var_55b8433b = getentarray("", "");
				foreach(pod in var_55b8433b)
				{
					n_radius = 64;
					n_dist = distance(pod.origin, getplayers()[0].origin);
					n_radius = n_radius * (n_dist / 3000);
					sphere(pod.origin, n_radius, (1, 0, 1), 0.7, 0, 7, 3);
				}
			}
			var_90f51d74 = getdvarint(#"hash_31e154b4986045db", 1);
			if(var_90f51d74 && isdefined(level.var_50e94447))
			{
				setdvar(#"hash_31e154b4986045db", 0);
				if(n_group >= (level.var_50e94447.size - 1))
				{
					n_group = 0;
				}
				var_f721c918 = level.var_50e94447[n_group];
				if(isdefined(var_f721c918))
				{
					foreach(player in function_a1ef346b())
					{
						player setorigin(var_f721c918.origin);
						player setplayerangles(var_f721c918.angles);
					}
				}
				n_group++;
			}
			waitframe(3);
		}
	#/
}

/*
	Name: function_8f59f892
	Namespace: namespace_58949729
	Checksum: 0xA8F588D1
	Offset: 0x5848
	Size: 0x160
	Parameters: 2
	Flags: None
*/
function function_8f59f892(instance, str_dvar)
{
	/#
		level notify(str_dvar);
		level endon(str_dvar);
		var_ad8b756a = 0;
		while(true)
		{
			n_debug = getdvarint(str_dvar, 0);
			if(n_debug)
			{
				setdvar(str_dvar, 0);
				s_chest = instance.var_8634611a[var_ad8b756a];
				foreach(player in function_a1ef346b())
				{
					player setorigin(s_chest.origin);
				}
				if(var_ad8b756a >= (instance.var_8634611a.size - 1))
				{
					var_ad8b756a = 0;
				}
				else
				{
					var_ad8b756a++;
				}
			}
			waitframe(5);
		}
	#/
}

/*
	Name: function_e4314d0e
	Namespace: namespace_58949729
	Checksum: 0xFF44DC29
	Offset: 0x59B0
	Size: 0x1EE
	Parameters: 1
	Flags: None
*/
function function_e4314d0e(struct)
{
	/#
		while(true)
		{
			n_debug = getdvarint(#"hash_29331ff5a16b8d53", 0);
			if(isdefined(struct.scriptmodel))
			{
				struct.b_spawned = 1;
			}
			else if(n_debug == 2 && !is_true(struct.b_spawned))
			{
				function_6f0024c1(struct);
			}
			if(n_debug && isdefined(struct))
			{
				n_radius = 64;
				n_dist = distance(struct.origin, getplayers()[0].origin);
				n_radius = n_radius * (n_dist / 3000);
				if(isdefined(struct.scriptmodel))
				{
					if(struct.parent.content_script_name === "")
					{
						str_color = (0, 1, 1);
					}
					else
					{
						if(struct.parent.content_script_name === "")
						{
							str_color = (0, 1, 0);
						}
						else
						{
							str_color = (1, 1, 0);
						}
					}
				}
				else
				{
					str_color = vectorscale((1, 1, 1), 0.75);
				}
				sphere(struct.origin, n_radius, str_color, 1, 0, 10, 3);
			}
			waitframe(3);
		}
	#/
}

/*
	Name: function_6f0024c1
	Namespace: namespace_58949729
	Checksum: 0xB47BC93D
	Offset: 0x5BA8
	Size: 0x2B0
	Parameters: 1
	Flags: None
*/
function function_6f0024c1(struct)
{
	/#
		if(struct.parent.content_script_name === "")
		{
			var_cc1fb2d0 = #"hash_4d5713fd0d76f4a";
			var_3a053962 = "";
			str_scene = #"hash_473df02427c669ff";
			var_dae71351 = 3;
		}
		else
		{
			if(struct.parent.content_script_name === "")
			{
				var_cc1fb2d0 = #"hash_1aa6f1facd821300";
				var_3a053962 = "";
				str_scene = #"hash_7d3c5ac38ba069f0";
				var_dae71351 = 2;
			}
			else
			{
				var_cc1fb2d0 = #"hash_31e5fe967ad787be";
				var_3a053962 = "";
				str_scene = #"hash_5815cc7ba68d56e";
				var_dae71351 = 1;
			}
		}
		function_4ec9fc99(struct, var_cc1fb2d0, var_3a053962, str_scene, var_dae71351);
		if(!isdefined(struct.parent.var_8634611a))
		{
			struct.parent.var_8634611a = [];
		}
		else if(!isarray(struct.parent.var_8634611a))
		{
			struct.parent.var_8634611a = array(struct.parent.var_8634611a);
		}
		if(!isinarray(struct.parent.var_8634611a, struct))
		{
			struct.parent.var_8634611a[struct.parent.var_8634611a.size] = struct;
		}
		if(!isdefined(level.var_8634611a))
		{
			level.var_8634611a = [];
		}
		else if(!isarray(level.var_8634611a))
		{
			level.var_8634611a = array(level.var_8634611a);
		}
		if(!isinarray(level.var_8634611a, struct))
		{
			level.var_8634611a[level.var_8634611a.size] = struct;
		}
	#/
}
