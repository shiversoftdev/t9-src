#using script_2618e0f3e5e11649;
#using script_799de24f8ad427f7;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using script_1940fc077a028a81;
#using scripts\zm_common\zm_utility.gsc;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using script_61fcfebb2f3a00e0;
#using script_744259b349d834c7;
#using scripts\core_common\flag_shared.gsc;
#using script_522aeb6ae906391e;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_119be0ad;

/*
	Name: function_cd0ef621
	Namespace: namespace_119be0ad
	Checksum: 0xB8B53C6F
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cd0ef621()
{
	level notify(-1066906626);
}

/*
	Name: __init__system__
	Namespace: namespace_119be0ad
	Checksum: 0x72FBD43B
	Offset: 0x120
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_5c9db1b706c2571", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_119be0ad
	Checksum: 0xC16EA020
	Offset: 0x168
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function function_70a657d8()
{
	spawner::add_archetype_spawn_function(#"soa", &function_49bf8a32);
	spawner::function_89a2cd87(#"soa", &function_751146f8);
	callback::add_callback(#"hash_72fd23232c4c7ab1", &function_53bc3572);
	callback::add_callback(#"hash_2a040f8b8142266d", &function_3138c2d5);
	namespace_ce1f29cc::add_archetype_spawn_function(#"soa", &function_f18b95c7);
}

/*
	Name: function_49bf8a32
	Namespace: namespace_119be0ad
	Checksum: 0x771CC087
	Offset: 0x268
	Size: 0x12C
	Parameters: 0
	Flags: None
*/
function function_49bf8a32()
{
	self.ai.var_870d0893 = 1;
	self.var_97ca51c7 = 0;
	self flag::set(#"hash_7b1f9f26f086bf39");
	self flag::set(#"hash_290cba33c13ddac5");
	self.var_917994fb = &function_917994fb;
	self.var_acf89fbb = &function_acf89fbb;
	self.var_48615dc2 = &function_2802bd9e;
	self.var_d690f304 = &function_abeaa83;
	self callback::function_d8abfc3d(#"on_ai_damage", &function_66c569e2);
	self callback::on_death(&function_9730c48d);
	setup_awareness(self);
}

/*
	Name: function_751146f8
	Namespace: namespace_119be0ad
	Checksum: 0x80F724D1
	Offset: 0x3A0
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_751146f8()
{
}

/*
	Name: function_f18b95c7
	Namespace: namespace_119be0ad
	Checksum: 0xC3B9A407
	Offset: 0x3B0
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function function_f18b95c7()
{
	self.var_74586bed = self.origin;
}

/*
	Name: setup_awareness
	Namespace: namespace_119be0ad
	Checksum: 0x77FB7634
	Offset: 0x3D0
	Size: 0x204
	Parameters: 1
	Flags: Private
*/
function private setup_awareness(entity)
{
	entity.has_awareness = 1;
	entity.ignorelaststandplayers = 1;
	entity.var_e453bcfa = 10;
	entity.var_91a026f2 = 10;
	entity.var_7ee943e1 = 10;
	self callback::function_d8abfc3d(#"on_ai_damage", &awareness::function_5f511313);
	awareness::register_state(entity, #"wander", &function_bbabdf2, &function_21eb9d09, &awareness::function_b264a0bc, undefined, &awareness::function_555d960b);
	awareness::register_state(entity, #"investigate", &awareness::function_b41f0471, &awareness::function_9eefc327, &awareness::function_34162a25, undefined, &awareness::function_a360dd00);
	awareness::register_state(entity, #"chase", &awareness::function_978025e4, &function_d2e99333, &awareness::function_b9f81e8b, &function_440337c2);
	awareness::set_state(self, #"wander");
	entity callback::function_d8abfc3d(#"hash_10ab46b52df7967a", &function_9310b9ca);
	entity thread awareness::function_fa6e010d();
}

/*
	Name: function_9310b9ca
	Namespace: namespace_119be0ad
	Checksum: 0x17029430
	Offset: 0x5E0
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_9310b9ca(params)
{
	self endon(#"death");
	if(isdefined(self.attackable))
	{
		namespace_85745671::function_2b925fa5(self);
	}
	self.var_98f1f37c = 1;
	self.allowdeath = 1;
	self kill(undefined, undefined, undefined, undefined, 0, 1);
}

/*
	Name: function_66c569e2
	Namespace: namespace_119be0ad
	Checksum: 0xF6144DFA
	Offset: 0x670
	Size: 0x84
	Parameters: 1
	Flags: Private
*/
function private function_66c569e2(params)
{
	if(params.smeansofdeath == "MOD_CRUSH")
	{
		if(isalive(self))
		{
			self.allowdeath = 1;
			self.var_bf8a126c = 1;
			self kill(self.origin, params.eattacker, params.einflictor);
		}
	}
}

/*
	Name: function_9730c48d
	Namespace: namespace_119be0ad
	Checksum: 0xFEF80D4E
	Offset: 0x700
	Size: 0xDE
	Parameters: 1
	Flags: Private
*/
function private function_9730c48d(params)
{
	level endon(#"game_ended");
	self endon(#"death", #"entitydeleted");
	if(is_true(self.var_655fccbb))
	{
		return;
	}
	self.var_655fccbb = 1;
	if(is_true(self.var_bf8a126c))
	{
		playfx(#"hash_5036b3468c6304d4", self.origin);
		self notify(#"hash_1b5a2b3f9dfe9fad");
		self deletedelay();
		return;
	}
}

/*
	Name: function_53bc3572
	Namespace: namespace_119be0ad
	Checksum: 0x2AEBCA68
	Offset: 0x7E8
	Size: 0x114
	Parameters: 1
	Flags: Private
*/
function private function_53bc3572(soa)
{
	if(!self awareness::function_b3810444(self, #"bound"))
	{
		self awareness::register_state(self, #"bound", &function_916e0825, &function_1ea26b11, &function_a08dd1de, &function_39ab6f8d, undefined);
	}
	self awareness::set_state(self, #"bound");
	namespace_19c99142::function_7d12a873(self, #"attacking", &function_f024bc97);
	self callback::function_d8abfc3d(#"awareness_event", &function_2bcd6c38);
}

/*
	Name: function_3138c2d5
	Namespace: namespace_119be0ad
	Checksum: 0xB3BEC111
	Offset: 0x908
	Size: 0x5C
	Parameters: 1
	Flags: Private
*/
function private function_3138c2d5(soa)
{
	self awareness::set_state(self, #"wander");
	self callback::function_52ac9652(#"awareness_event", &function_2bcd6c38);
}

/*
	Name: function_bbabdf2
	Namespace: namespace_119be0ad
	Checksum: 0x2C7F73FF
	Offset: 0x970
	Size: 0x4C
	Parameters: 1
	Flags: Private
*/
function private function_bbabdf2(entity)
{
	/#
		if(getdvarint(#"hash_13f115c784a1f77b", 0) > 0)
		{
			return;
		}
	#/
	awareness::function_9c9d96b5(entity);
}

/*
	Name: function_21eb9d09
	Namespace: namespace_119be0ad
	Checksum: 0x2397ED63
	Offset: 0x9C8
	Size: 0x16C
	Parameters: 1
	Flags: Private
*/
function private function_21eb9d09(entity)
{
	/#
		if(getdvarint(#"hash_13f115c784a1f77b", 0) > 0)
		{
			if(!isdefined(level.var_48137965))
			{
				level.var_48137965 = entity.origin;
			}
			entity setgoal(level.var_48137965);
			return;
		}
	#/
	var_cc7597dc = namespace_19c99142::function_3d972f3(entity);
	var_6d4f3481 = entity.team !== level.zombie_team;
	if(isdefined(var_cc7597dc) && !var_6d4f3481 && namespace_19c99142::function_85d7a413(entity, var_cc7597dc))
	{
		var_4d21f369 = namespace_19c99142::function_da71e09a(entity);
		if(var_4d21f369 !== #"hash_6192d8af630c6c07")
		{
			namespace_19c99142::function_708afe1d(entity, #"hash_6192d8af630c6c07");
		}
		entity.favoriteenemy = var_cc7597dc;
	}
	awareness::function_4ebe4a6d(entity);
}

/*
	Name: function_440337c2
	Namespace: namespace_119be0ad
	Checksum: 0x9E30BF30
	Offset: 0xB40
	Size: 0x572
	Parameters: 1
	Flags: None
*/
function function_440337c2(entity)
{
	var_cc7597dc = namespace_19c99142::function_3d972f3(entity);
	entity.goalradius = entity getpathfindingradius() * 2;
	var_6d4f3481 = entity.team !== level.zombie_team;
	var_2929f2e0 = isdefined(entity.attackable);
	var_4d21f369 = namespace_19c99142::function_da71e09a(entity);
	switch(var_4d21f369)
	{
		case "chase":
		{
			if(namespace_19c99142::function_264f914c(entity) && !var_6d4f3481 && !var_2929f2e0)
			{
				if(isdefined(var_cc7597dc) && namespace_19c99142::function_85d7a413(entity, var_cc7597dc))
				{
					namespace_19c99142::function_708afe1d(entity, #"hash_6192d8af630c6c07");
				}
				else
				{
					if(namespace_19c99142::function_47f3f527(entity))
					{
						namespace_19c99142::function_708afe1d(entity, #"hash_685254f9ed0ce346");
					}
					else if(namespace_19c99142::function_d1293a5a(entity))
					{
						namespace_19c99142::function_708afe1d(entity, #"circle");
					}
				}
			}
			break;
		}
		case "hash_6192d8af630c6c07":
		{
			if(!isdefined(var_cc7597dc) || !namespace_19c99142::function_85d7a413(entity, var_cc7597dc) || var_6d4f3481)
			{
				namespace_19c99142::function_708afe1d(entity, #"chase");
			}
			break;
		}
		case "hash_685254f9ed0ce346":
		{
			if(namespace_19c99142::function_ee1f25af(entity))
			{
				namespace_19c99142::function_708afe1d(entity, #"hash_4ec3ec4f06b9498f");
			}
			break;
		}
		case "hash_4ec3ec4f06b9498f":
		{
			if(namespace_19c99142::function_89dbf30f(entity) || var_6d4f3481)
			{
				if(namespace_19c99142::function_47f3f527(entity))
				{
					namespace_19c99142::function_708afe1d(entity, #"hash_685254f9ed0ce346");
				}
				else
				{
					namespace_19c99142::function_708afe1d(entity, #"chase");
				}
			}
			break;
		}
		case "circle":
		{
			if(isdefined(var_cc7597dc) && namespace_19c99142::function_85d7a413(entity, var_cc7597dc))
			{
				namespace_19c99142::function_708afe1d(entity, #"hash_6192d8af630c6c07");
			}
			else if(namespace_19c99142::function_25517868(entity))
			{
				namespace_19c99142::function_708afe1d(entity, #"chase");
			}
			break;
		}
	}
	var_4d21f369 = namespace_19c99142::function_da71e09a(entity);
	switch(var_4d21f369)
	{
		case "chase":
		{
			if(namespace_19c99142::function_3c14ef44(entity))
			{
				if(entity.var_7418f498 !== entity.favoriteenemy && !var_2929f2e0)
				{
					if(namespace_19c99142::function_264f914c(entity))
					{
						namespace_19c99142::function_1b2f34c9(entity);
						awareness::function_5c40e824(entity);
					}
					else
					{
						entity.favoriteenemy = entity.var_7418f498;
					}
				}
			}
			else
			{
				namespace_19c99142::function_ff6a04bc(entity);
			}
			awareness::function_5c40e824(entity);
			break;
		}
		case "hash_6192d8af630c6c07":
		{
			/#
				assert(isdefined(var_cc7597dc), "");
			#/
			/#
			#/
			namespace_19c99142::function_ff6a04bc(entity);
			entity.favoriteenemy = var_cc7597dc;
			break;
		}
		case "hash_685254f9ed0ce346":
		{
			awareness::function_5c40e824(entity);
			break;
		}
		case "hash_4ec3ec4f06b9498f":
		{
			awareness::function_5c40e824(entity);
			break;
		}
		case "hash_110ee879f18b605f":
		{
			awareness::function_5c40e824(entity);
			break;
		}
		case "circle":
		{
			break;
		}
	}
}

/*
	Name: function_d2e99333
	Namespace: namespace_119be0ad
	Checksum: 0x22332DC0
	Offset: 0x10C0
	Size: 0xF4
	Parameters: 1
	Flags: Private
*/
function private function_d2e99333(entity)
{
	var_4d21f369 = namespace_19c99142::function_da71e09a(entity);
	switch(var_4d21f369)
	{
		case "circle":
		{
			var_b9dab425 = zm_ai_utility::function_825317c(entity);
			if(!awareness::function_2bc424fd(entity, var_b9dab425))
			{
				awareness::set_state(entity, (isdefined(entity.var_78f5fd91) ? entity.var_78f5fd91 : #"wander"));
				return;
			}
			namespace_19c99142::function_b046be53(entity);
			return;
			break;
		}
	}
	awareness::function_39da6c3c(entity);
}

/*
	Name: function_916e0825
	Namespace: namespace_119be0ad
	Checksum: 0xAEF242E7
	Offset: 0x11C0
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private function_916e0825(entity)
{
	entity callback::function_52ac9652(#"on_ai_damage", &awareness::function_5f511313);
}

/*
	Name: function_1ea26b11
	Namespace: namespace_119be0ad
	Checksum: 0xE03B2DEA
	Offset: 0x1208
	Size: 0x264
	Parameters: 1
	Flags: Private
*/
function private function_1ea26b11(entity)
{
	if(!namespace_19c99142::function_9d13a2e7(entity))
	{
		return;
	}
	namespace_19c99142::function_d9fe2b0(entity);
	soa = namespace_19c99142::function_9dd68a24(entity);
	var_4d21f369 = namespace_19c99142::function_2905c7db(entity);
	if(var_4d21f369 === #"attacking")
	{
		var_c50ad196 = !awareness::function_2bc424fd(entity.favoriteenemy);
		if(entity.favoriteenemy !== soa.favoriteenemy || var_c50ad196)
		{
			if(!isdefined(soa.favoriteenemy) || var_c50ad196 || distance2dsquared(soa.origin, entity.origin) > sqr(1000))
			{
				namespace_19c99142::function_c33fb385(entity, #"following");
			}
		}
	}
	if(var_4d21f369 === #"following")
	{
		if(isdefined(soa.favoriteenemy) && entity cansee(soa.favoriteenemy))
		{
			namespace_19c99142::function_c33fb385(entity, #"attacking");
		}
	}
	var_4d21f369 = namespace_19c99142::function_2905c7db(entity);
	if(var_4d21f369 === #"following")
	{
		goal = namespace_19c99142::function_dd116fa9(entity);
		entity namespace_e292b080::zombieupdategoal(goal);
	}
	else if(var_4d21f369 === #"attacking")
	{
		awareness::function_39da6c3c(entity);
	}
}

/*
	Name: function_f024bc97
	Namespace: namespace_119be0ad
	Checksum: 0x56344A6D
	Offset: 0x1478
	Size: 0x5C
	Parameters: 1
	Flags: Private
*/
function private function_f024bc97(entity)
{
	soa = namespace_19c99142::function_9dd68a24(entity);
	if(isdefined(soa.favoriteenemy))
	{
		awareness::function_c241ef9a(entity, soa.favoriteenemy, 1);
	}
}

/*
	Name: function_a08dd1de
	Namespace: namespace_119be0ad
	Checksum: 0xF0F49B69
	Offset: 0x14E0
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private function_a08dd1de(entity)
{
	entity callback::function_d8abfc3d(#"on_ai_damage", &awareness::function_5f511313);
}

/*
	Name: function_39ab6f8d
	Namespace: namespace_119be0ad
	Checksum: 0xA47E5C88
	Offset: 0x1528
	Size: 0x18C
	Parameters: 1
	Flags: Private
*/
function private function_39ab6f8d(entity)
{
	if(!namespace_19c99142::function_9d13a2e7(entity))
	{
		return;
	}
	soa = namespace_19c99142::function_9dd68a24(entity);
	var_4d21f369 = namespace_19c99142::function_2905c7db(entity);
	var_15cfc4f4 = 0;
	if(var_4d21f369 === #"attacking")
	{
		if(isplayer(soa.favoriteenemy) && is_true(entity.var_ff3cbd9e) && !getdvarint(#"hash_6f7afa24d5871b86", 0) > 0)
		{
			var_ce42b625 = zm_utility::function_d89330e6(soa.favoriteenemy);
			if(var_ce42b625 >= 0)
			{
				awareness::function_c241ef9a(entity, soa.favoriteenemy, -1);
				var_15cfc4f4 = 1;
			}
		}
	}
	if(is_false(var_15cfc4f4))
	{
		entity.var_6324ed63 = undefined;
		awareness::function_5c40e824(entity);
	}
}

/*
	Name: function_2bcd6c38
	Namespace: namespace_119be0ad
	Checksum: 0xFDF2959
	Offset: 0x16C0
	Size: 0xF4
	Parameters: 1
	Flags: Private
*/
function private function_2bcd6c38(event)
{
	if(!namespace_19c99142::function_9d13a2e7(self))
	{
		/#
			println(#"hash_1ccae6dcf9ee1418");
		#/
		return;
	}
	soa = namespace_19c99142::function_9dd68a24(self);
	soa callback::callback(#"awareness_event", {#params:event.params, #position:event.position, #entity:event.entity, #type:event.type});
}

/*
	Name: function_917994fb
	Namespace: namespace_119be0ad
	Checksum: 0xDA58886A
	Offset: 0x17C0
	Size: 0x70
	Parameters: 2
	Flags: None
*/
function function_917994fb(entity, n_to_spawn)
{
	/#
		/#
			assert(isdefined(n_to_spawn), "");
		#/
	#/
	if(isdefined(entity.var_9dabebcd) && (entity.var_9dabebcd + n_to_spawn) > 20)
	{
		return false;
	}
	return true;
}

/*
	Name: function_acf89fbb
	Namespace: namespace_119be0ad
	Checksum: 0xE4352EDC
	Offset: 0x1838
	Size: 0x58
	Parameters: 2
	Flags: None
*/
function function_acf89fbb(entity, move_speed)
{
	if(isdefined(entity.current_state) && entity.current_state.name === #"wander")
	{
		return "locomotion_speed_walk";
	}
	return move_speed;
}

/*
	Name: function_2802bd9e
	Namespace: namespace_119be0ad
	Checksum: 0xB19CE1C7
	Offset: 0x1898
	Size: 0x192
	Parameters: 2
	Flags: None
*/
function function_2802bd9e(entity, var_e0599216)
{
	if(!isplayer(entity.favoriteenemy) || !entity.favoriteenemy isinvehicle())
	{
		return var_e0599216;
	}
	var_e0599216 = min(var_e0599216, getdvarfloat(#"hash_2c1166b5cee66f07", 0));
	var_7eb0b70f = getdvarfloat(#"hash_7211ddce5960ad17", 800);
	if(distancesquared(entity.origin, entity.favoriteenemy.origin) > sqr(var_7eb0b70f))
	{
		return var_e0599216;
	}
	vehicle = entity.favoriteenemy getvehicleoccupied();
	if(vectordot(entity.origin - vehicle.origin, vehicle getvelocity()) < 5)
	{
		return var_e0599216;
	}
	return getdvarfloat(#"hash_5bcde58ef2ff5c67", 150);
}

/*
	Name: function_abeaa83
	Namespace: namespace_119be0ad
	Checksum: 0xDEDABD6E
	Offset: 0x1A38
	Size: 0x86
	Parameters: 2
	Flags: None
*/
function function_abeaa83(entity, target)
{
	if(!isdefined(target.var_74586bed))
	{
		return true;
	}
	dist_2d_sq = distance2dsquared(target.origin, target.var_74586bed);
	if(dist_2d_sq > sqr(3000))
	{
		return false;
	}
	return true;
}

