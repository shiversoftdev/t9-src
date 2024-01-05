#using script_1883fa4e60abbf9f;
#using script_3072532951b5b4ae;
#using script_68d08b784c92da95;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using script_3aa0f32b70d4f7cb;
#using script_178024232e91b0a1;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_186a1392;

/*
	Name: function_9949b04
	Namespace: namespace_186a1392
	Checksum: 0xADEEB911
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9949b04()
{
	level notify(-403649685);
}

#namespace namespace_dba1ec08;

/*
	Name: __init__system__
	Namespace: namespace_dba1ec08
	Checksum: 0x9C153344
	Offset: 0x100
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_2dc824b6cfc14a18", &function_70a657d8, undefined, undefined, #"archetype_utility");
}

/*
	Name: function_70a657d8
	Namespace: namespace_dba1ec08
	Checksum: 0x516D56E5
	Offset: 0x150
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	namespace_77fd5d41::main();
	function_7dcf5e();
}

/*
	Name: function_7dcf5e
	Namespace: namespace_dba1ec08
	Checksum: 0x9E7D341F
	Offset: 0x180
	Size: 0x25E6
	Parameters: 0
	Flags: Linked
*/
function function_7dcf5e()
{
	level.var_70f1c402 = 1;
	/#
		assert(isscriptfunctionptr(&shouldstealth));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldstealth", &shouldstealth);
	/#
		assert(isscriptfunctionptr(&stealthreactcondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealthreactcondition", &stealthreactcondition);
	/#
		assert(isscriptfunctionptr(&locomotionshouldstealth));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"locomotionshouldstealth", &locomotionshouldstealth);
	/#
		assert(isscriptfunctionptr(&shouldstealthresume));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldstealthresume", &shouldstealthresume);
	/#
		assert(isscriptfunctionptr(&stealthreactstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealthreactstart", &stealthreactstart);
	/#
		assert(isscriptfunctionptr(&stealthreactterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealthreactterminate", &stealthreactterminate);
	/#
		assert(isscriptfunctionptr(&stealthidleterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealthidleterminate", &stealthidleterminate);
	/#
		assert(isscriptfunctionptr(&function_695d612e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1ddb2a42c13937e2", &function_695d612e);
	/#
		assert(isscriptfunctionptr(&function_36003c04));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_30871f9ff96a64d", &function_36003c04);
	/#
		assert(isscriptfunctionptr(&function_59b7ac43));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6015c026b1fa3b68", &function_59b7ac43);
	/#
		assert(isscriptfunctionptr(&function_50255836));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6903274957b06c58", &function_50255836);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::ifinstealth));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"ifinstealth", &namespace_77fd5d41::ifinstealth);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_3b8bcbc7));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_30483c99fb320ecb", &namespace_77fd5d41::function_3b8bcbc7);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::stealth_shouldfriendly));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5d5935e442748f9e", &namespace_77fd5d41::stealth_shouldfriendly);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::stealth_shouldneutral));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2b4b5597da9bc2f8", &namespace_77fd5d41::stealth_shouldneutral);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::stealth_initfriendly));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_8374ad58022a136", &namespace_77fd5d41::stealth_initfriendly);
	/#
		assert(isscriptfunctionptr(&aiutility::function_865ea8e6));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_652e009b8323c31b", &aiutility::function_865ea8e6);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::stealth_enemy_updateeveryframe));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealth_enemy_updateeveryframe", &namespace_77fd5d41::stealth_enemy_updateeveryframe);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_init));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_65e89f484bba20bb", &namespace_77fd5d41::hunt_init);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::idle_update));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_14f8e3d6eda75d6a", &namespace_77fd5d41::idle_update);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::idle_init));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_458e9a34b803db29", &namespace_77fd5d41::idle_init);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::idle_terminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7ed5e6ee9b115c2a", &namespace_77fd5d41::idle_terminate);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_470c948e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_77e5c00cfcf7002e", &namespace_77fd5d41::function_470c948e);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_ea5fc830));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5d73de1aab3eb35d", &namespace_77fd5d41::function_ea5fc830);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_df9a9513));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_ae56f63cd9fbe86", &namespace_77fd5d41::function_df9a9513);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::stealth_shouldinvestigate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealth_shouldinvestigate", &namespace_77fd5d41::stealth_shouldinvestigate);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::investigate_updateeveryframe));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6431cd50d65a767c", &namespace_77fd5d41::investigate_updateeveryframe);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::investigate_move));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_31b933dc0e7c5c84", &namespace_77fd5d41::investigate_move);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::investigate_move_init));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1e0ad4032a3da41f", &namespace_77fd5d41::investigate_move_init);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::investigate_move_terminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1c37119295b3cc48", &namespace_77fd5d41::investigate_move_terminate);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::investigate_targetedlookaround));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6a892d952d9c58b7", &namespace_77fd5d41::investigate_targetedlookaround);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_fe3c7909));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_247b034a88a7e3b", &namespace_77fd5d41::function_fe3c7909);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_26e16543));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_540afeb2906c14c7", &namespace_77fd5d41::function_26e16543);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_efc17e1a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_44e72b8fcdaf3ff8", &namespace_77fd5d41::function_efc17e1a);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::stealth_shouldhunt));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealth_shouldhunt", &namespace_77fd5d41::stealth_shouldhunt);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_move));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1432a729e25120ac", &namespace_77fd5d41::hunt_move);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_move_init));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4691e67cad7d9b37", &namespace_77fd5d41::hunt_move_init);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_move_terminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6c20630dac281d70", &namespace_77fd5d41::hunt_move_terminate);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_initialdelay));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7c50b51a79eba680", &namespace_77fd5d41::hunt_initialdelay);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_initialdelay_init));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1a2cb215f0adfdab", &namespace_77fd5d41::hunt_initialdelay_init);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_initialdelay_terminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_a287df3d9435b4c", &namespace_77fd5d41::hunt_initialdelay_terminate);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_shouldhunker));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4429fadb560937b5", &namespace_77fd5d41::hunt_shouldhunker);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_84d939b2));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4d4262f789528f48", &namespace_77fd5d41::function_84d939b2);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_25281284));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6623ac05b3e89d2", &namespace_77fd5d41::function_25281284);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_hunker));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_c3501ebe051547e", &namespace_77fd5d41::hunt_hunker);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_hunker_init));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_633bd00a4c6c070d", &namespace_77fd5d41::hunt_hunker_init);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_hunker_terminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_38670b1f6bfc60d6", &namespace_77fd5d41::hunt_hunker_terminate);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_isincover));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_219ee8817462ba75", &namespace_77fd5d41::hunt_isincover);
	/#
		assert(isscriptfunctionptr(&aiutility::function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_56707481883cec89", &aiutility::function_8f12f910);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_hunker_shouldexpose));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_72041acc7d1e9e99", &namespace_77fd5d41::hunt_hunker_shouldexpose);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_hunker_expose));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_a1c1fb228689f9c", &namespace_77fd5d41::hunt_hunker_expose);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_hunker_expose_init));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_fef2a96c4de38c7", &namespace_77fd5d41::hunt_hunker_expose_init);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_hunker_expose_terminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3cb50e01a7d9b2e0", &namespace_77fd5d41::hunt_hunker_expose_terminate);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::stealth_enemy_getbsmstate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7faa7f08cbd182e0", &namespace_77fd5d41::stealth_enemy_getbsmstate);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::hunt_active_terminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2792d75a8b597397", &namespace_77fd5d41::hunt_active_terminate);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::stealth_neutral_updateeveryframe));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealth_neutral_updateeveryframe", &namespace_77fd5d41::stealth_neutral_updateeveryframe);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::stealth_initneutral));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_15db81c49c83357e", &namespace_77fd5d41::stealth_initneutral);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::ifshoulddosmartobject));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"ifshoulddosmartobject", &namespace_77fd5d41::ifshoulddosmartobject);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::dosmartobject));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"dosmartobject", &namespace_77fd5d41::dosmartobject);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::dosmartobject_init));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"dosmartobject_init", &namespace_77fd5d41::dosmartobject_init);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::dosmartobjectterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_792be4bd91e1c9e2", &namespace_77fd5d41::dosmartobjectterminate);
	/#
		assert(isscriptfunctionptr(&aiutility::function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4ab3a0d2b8ce1d48", &aiutility::function_8f12f910);
	/#
		assert(isscriptfunctionptr(&aiutility::function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3fb32d4ff7ddb9f7", &aiutility::function_8f12f910);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_e73fe99));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2fa97de855da1e4f", &namespace_77fd5d41::function_e73fe99);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_11d3f42d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_23286b53d24487b4", &namespace_77fd5d41::function_11d3f42d);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_bd5f9968));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_22ca87c523f21d6d", &namespace_77fd5d41::function_bd5f9968);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_9a6e96bd));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7ccd1fa8f8bd85fc", &namespace_77fd5d41::function_9a6e96bd);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_4fff0007));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7f29302adf2f1e45", &namespace_77fd5d41::function_4fff0007);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_3031f40e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_52aa02ad4a142cb3", &namespace_77fd5d41::function_3031f40e);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_242c2d67));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_982f6b18e2cdc06", &namespace_77fd5d41::function_242c2d67);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_96903634));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1082b3ce4938748d", &namespace_77fd5d41::function_96903634);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_445c5acf));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1d1883695574917c", &namespace_77fd5d41::function_445c5acf);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_ba0a486b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1cad32c846c91188", &namespace_77fd5d41::function_ba0a486b);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_36915a04));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_37829e514d614663", &namespace_77fd5d41::function_36915a04);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_7653ca27));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_66bfafd78f8a2da4", &namespace_77fd5d41::function_7653ca27);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_bf263c90));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_28aa53308dae6714", &namespace_77fd5d41::function_bf263c90);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_470c948e));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_77e5c00cfcf7002e", &namespace_77fd5d41::function_470c948e);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_ea5fc830));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_5d73de1aab3eb35d", &namespace_77fd5d41::function_ea5fc830);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_df9a9513));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_ae56f63cd9fbe86", &namespace_77fd5d41::function_df9a9513);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_5db27177));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_9906f418003d6d6", &namespace_77fd5d41::function_5db27177);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_dcb14105));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_76d6aa4d32b2559c", &namespace_77fd5d41::function_dcb14105);
	/#
		assert(isscriptfunctionptr(&locomotionshouldstealth));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionshouldstealth", &locomotionshouldstealth);
	/#
		assert(isscriptfunctionptr(&function_59b7ac43));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_6015c026b1fa3b68", &function_59b7ac43);
	/#
		assert(isscriptfunctionptr(&function_50255836));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_6903274957b06c58", &function_50255836);
	/#
		assert(isscriptfunctionptr(&stealthreactcondition));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"stealthreactcondition", &stealthreactcondition);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_6c404960));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_34ba896ad71ef639", &namespace_77fd5d41::function_6c404960);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_fe3c7909));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_247b034a88a7e3b", &namespace_77fd5d41::function_fe3c7909);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_26e16543));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_540afeb2906c14c7", &namespace_77fd5d41::function_26e16543);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_efc17e1a));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_44e72b8fcdaf3ff8", &namespace_77fd5d41::function_efc17e1a);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_e73fe99));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_2fa97de855da1e4f", &namespace_77fd5d41::function_e73fe99);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_6a7ad1cf));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7cd1f4f1d328c8c", &namespace_77fd5d41::function_6a7ad1cf);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_ff473d5));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_344cc9226dda1596", &namespace_77fd5d41::function_ff473d5);
	/#
		assert(isscriptfunctionptr(&namespace_77fd5d41::function_96903634));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_1082b3ce4938748d", &namespace_77fd5d41::function_96903634);
	level.var_70f1c402 = undefined;
}

/*
	Name: shouldstealth
	Namespace: namespace_dba1ec08
	Checksum: 0x8A6AD27C
	Offset: 0x2770
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function shouldstealth(behaviortreeentity)
{
	if(behaviortreeentity ai::has_behavior_attribute("stealth") && behaviortreeentity ai::get_behavior_attribute("stealth"))
	{
		return true;
	}
	return false;
}

/*
	Name: locomotionshouldstealth
	Namespace: namespace_dba1ec08
	Checksum: 0x5EDAD7EC
	Offset: 0x27D0
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function locomotionshouldstealth(behaviortreeentity)
{
	if(namespace_77fd5d41::function_5bfdfc9d())
	{
		return false;
	}
	if(behaviortreeentity haspath())
	{
		return true;
	}
	return false;
}

/*
	Name: function_59b7ac43
	Namespace: namespace_dba1ec08
	Checksum: 0x42400725
	Offset: 0x2818
	Size: 0x40
	Parameters: 1
	Flags: Linked, Private
*/
function private function_59b7ac43(behaviortreeentity)
{
	if(behaviortreeentity getblackboardattribute("_human_demeanor") === "CQB")
	{
		return true;
	}
	return false;
}

/*
	Name: function_50255836
	Namespace: namespace_dba1ec08
	Checksum: 0x699021EF
	Offset: 0x2860
	Size: 0x40
	Parameters: 1
	Flags: Linked, Private
*/
function private function_50255836(behaviortreeentity)
{
	if(behaviortreeentity getblackboardattribute("_human_demeanor") === "COMBAT")
	{
		return true;
	}
	return false;
}

/*
	Name: shouldstealthresume
	Namespace: namespace_dba1ec08
	Checksum: 0x369C9C09
	Offset: 0x28A8
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function shouldstealthresume(behaviortreeentity)
{
	if(!shouldstealth(behaviortreeentity))
	{
		return false;
	}
	if(is_true(behaviortreeentity.stealth_resume))
	{
		behaviortreeentity.stealth_resume = undefined;
		return true;
	}
	return false;
}

/*
	Name: stealthreactcondition
	Namespace: namespace_dba1ec08
	Checksum: 0x2D683AB0
	Offset: 0x2910
	Size: 0xA0
	Parameters: 1
	Flags: Linked, Private
*/
function private stealthreactcondition(entity)
{
	inscene = isdefined(self._o_scene) && isdefined(self._o_scene._str_state) && self._o_scene._str_state == "play";
	return !is_true(entity.stealth_reacting) && entity hasvalidinterrupt("react") && !inscene;
}

/*
	Name: stealthreactstart
	Namespace: namespace_dba1ec08
	Checksum: 0x3BBAA02A
	Offset: 0x29B8
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private stealthreactstart(behaviortreeentity)
{
	behaviortreeentity.stealth_reacting = 1;
}

/*
	Name: stealthreactterminate
	Namespace: namespace_dba1ec08
	Checksum: 0x93CB76DF
	Offset: 0x29E0
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private stealthreactterminate(behaviortreeentity)
{
	behaviortreeentity.stealth_reacting = undefined;
}

/*
	Name: function_695d612e
	Namespace: namespace_dba1ec08
	Checksum: 0xF53C4DD3
	Offset: 0x2A00
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_695d612e(behaviortreeentity)
{
	behaviortreeentity ai::function_fc7bd6c7(1);
}

/*
	Name: function_36003c04
	Namespace: namespace_dba1ec08
	Checksum: 0xE9E237DF
	Offset: 0x2A30
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_36003c04(behaviortreeentity)
{
	behaviortreeentity ai::function_f6060793();
}

/*
	Name: stealthidleterminate
	Namespace: namespace_dba1ec08
	Checksum: 0xCA04FBC4
	Offset: 0x2A60
	Size: 0x56
	Parameters: 1
	Flags: Linked, Private
*/
function private stealthidleterminate(behaviortreeentity)
{
	behaviortreeentity notify(#"stealthidleterminate");
	if(is_true(behaviortreeentity.stealth_resume_after_idle))
	{
		behaviortreeentity.stealth_resume_after_idle = undefined;
		behaviortreeentity.stealth_resume = 1;
	}
}

