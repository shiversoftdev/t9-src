#using script_178024232e91b0a1;
#using script_218f57fb32d9325b;
#using script_317aa6153a75c589;
#using script_35598499769dbb3d;
#using script_3aa0f32b70d4f7cb;
#using script_45ff1d093a485300;
#using script_4a3f9b8905878272;
#using script_4c5c4a64a59247a2;
#using script_54ad756f68b48e83;
#using script_59f07c660e6710a5;
#using script_caf007e2a98afa2;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace archetype_utility;

/*
	Name: function_737bc4ff
	Namespace: archetype_utility
	Checksum: 0x8DBE1052
	Offset: 0xAD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_737bc4ff()
{
	level notify(1081008738);
}

#namespace aiutility;

/*
	Name: function_89f2df9
	Namespace: aiutility
	Checksum: 0xB5AA6C25
	Offset: 0xAF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"archetype_utility", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: aiutility
	Checksum: 0x6950F6A3
	Offset: 0xB38
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	registerbehaviorscriptfunctions();
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: aiutility
	Checksum: 0x98A2678B
	Offset: 0xB58
	Size: 0x26E4
	Parameters: 0
	Flags: Linked, Private
*/
function private registerbehaviorscriptfunctions()
{
	/#
		assert(iscodefunctionptr(&btapi_forceragdoll));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_forceragdoll", &btapi_forceragdoll);
	/#
		assert(iscodefunctionptr(&btapi_hasammo));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_hasammo", &btapi_hasammo);
	/#
		assert(iscodefunctionptr(&btapi_haslowammo));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_haslowammo", &btapi_haslowammo);
	/#
		assert(isscriptfunctionptr(&function_2de6da8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6a474bfdd215a3f4", &function_2de6da8);
	/#
		assert(isscriptfunctionptr(&function_a9bc841));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_185ec143f3641fa6", &function_a9bc841);
	/#
		assert(iscodefunctionptr(&btapi_hasenemy));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_hasenemy", &btapi_hasenemy);
	/#
		assert(isscriptfunctionptr(&function_e0454a8b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_10923e11cc70c83f", &function_e0454a8b);
	/#
		assert(isscriptfunctionptr(&issafefromgrenades));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"issafefromgrenades", &issafefromgrenades);
	/#
		assert(isscriptfunctionptr(&function_f557fb8b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1226ab372ff4dc13", &function_f557fb8b);
	/#
		assert(isscriptfunctionptr(&function_865ea8e6));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2ff118c59ed4bd9e", &function_865ea8e6);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_78488585a31af367", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&recentlysawenemy));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"recentlysawenemy", &recentlysawenemy);
	/#
		assert(isscriptfunctionptr(&shouldbeaggressive));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldbeaggressive", &shouldbeaggressive);
	/#
		assert(isscriptfunctionptr(&shouldonlyfireaccurately));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldonlyfireaccurately", &shouldonlyfireaccurately);
	/#
		assert(isscriptfunctionptr(&canblindfire));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"canblindfire", &canblindfire);
	/#
		assert(isscriptfunctionptr(&shouldreacttonewenemy));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldreacttonewenemy", &shouldreacttonewenemy);
	/#
		assert(isscriptfunctionptr(&shouldreacttonewenemy));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"shouldreacttonewenemy", &shouldreacttonewenemy);
	/#
		assert(isscriptfunctionptr(&hasweaponmalfunctioned));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hasweaponmalfunctioned", &hasweaponmalfunctioned);
	/#
		assert(isscriptfunctionptr(&shouldstopmoving));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldstopmoving", &shouldstopmoving);
	/#
		assert(isscriptfunctionptr(&shouldstopmoving));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"shouldstopmoving", &shouldstopmoving);
	/#
		assert(isscriptfunctionptr(&function_abb9c007));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_750c8220e46d9ba", &function_abb9c007);
	/#
		assert(isscriptfunctionptr(&function_abb9c007));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_750c8220e46d9ba", &function_abb9c007);
	/#
		assert(isscriptfunctionptr(&choosebestcovernodeasap));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"choosebestcovernodeasap", &choosebestcovernodeasap);
	/#
		assert(isscriptfunctionptr(&function_c1ac838a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_12126a94eb75c541", &function_c1ac838a);
	/#
		assert(isscriptfunctionptr(&choosebettercoverservicecodeversion));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("chooseBetterCoverService", &choosebettercoverservicecodeversion, 1);
	/#
		assert(isscriptfunctionptr(&sensenearbyplayers));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"sensenearbyplayers", &sensenearbyplayers);
	/#
		assert(isscriptfunctionptr(&function_4755155f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_28725784491067a5", &function_4755155f);
	/#
		assert(iscodefunctionptr(&function_95b98edf));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_refillammoifneededservice", &function_95b98edf);
	/#
		assert(isscriptfunctionptr(&function_43a090a8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2b72d392931b3fe0", &function_43a090a8);
	/#
		assert(isscriptfunctionptr(&function_dc44803c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_44ffd558c93366a3", &function_dc44803c);
	/#
		assert(isscriptfunctionptr(&function_a7abd081));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_338bde0d7a1d8ab4", &function_a7abd081);
	/#
		assert(isscriptfunctionptr(&trystoppingservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"trystoppingservice", &trystoppingservice);
	/#
		assert(isscriptfunctionptr(&isfrustrated));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"isfrustrated", &isfrustrated);
	/#
		assert(isscriptfunctionptr(&function_22766ccd));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7a7ca1fd075b9349", &function_22766ccd);
	/#
		assert(isscriptfunctionptr(&function_d116f6b4));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_40e03ac97f371cb1", &function_d116f6b4);
	/#
		assert(iscodefunctionptr(&btapi_updatefrustrationlevel));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_updatefrustrationlevel", &btapi_updatefrustrationlevel);
	/#
		assert(isscriptfunctionptr(&islastknownenemypositionapproachable));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"islastknownenemypositionapproachable", &islastknownenemypositionapproachable);
	/#
		assert(isscriptfunctionptr(&tryadvancingonlastknownpositionbehavior));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"tryadvancingonlastknownpositionbehavior", &tryadvancingonlastknownpositionbehavior);
	/#
		assert(isscriptfunctionptr(&function_15b9bbef));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6eddb51350d11f58", &function_15b9bbef);
	/#
		assert(isscriptfunctionptr(&trygoingtoclosestnodetoenemybehavior));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"trygoingtoclosestnodetoenemybehavior", &trygoingtoclosestnodetoenemybehavior);
	/#
		assert(isscriptfunctionptr(&tryrunningdirectlytoenemybehavior));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"tryrunningdirectlytoenemybehavior", &tryrunningdirectlytoenemybehavior);
	/#
		assert(isscriptfunctionptr(&flagenemyunattackableservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"flagenemyunattackableservice", &flagenemyunattackableservice);
	/#
		assert(isscriptfunctionptr(&keepclaimnode));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"keepclaimnode", &keepclaimnode);
	/#
		assert(isscriptfunctionptr(&keepclaimnode));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"keepclaimnode", &keepclaimnode);
	/#
		assert(isscriptfunctionptr(&releaseclaimnode));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"releaseclaimnode", &releaseclaimnode);
	/#
		assert(isscriptfunctionptr(&releaseclaimnode));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"releaseclaimnode", &releaseclaimnode);
	/#
		assert(isscriptfunctionptr(&function_8b760d36));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_674fb2fe0b622d15", &function_8b760d36);
	/#
		assert(isscriptfunctionptr(&scriptstartragdoll));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"startragdoll", &scriptstartragdoll);
	/#
		assert(isscriptfunctionptr(&notstandingcondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"notstandingcondition", &notstandingcondition);
	/#
		assert(isscriptfunctionptr(&notcrouchingcondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"notcrouchingcondition", &notcrouchingcondition);
	/#
		assert(isscriptfunctionptr(&function_736c20e1));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_34d02056cda999ed", &function_736c20e1);
	/#
		assert(isscriptfunctionptr(&function_4aff5b9d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_67f7516b1162e7ee", &function_4aff5b9d);
	/#
		assert(isscriptfunctionptr(&function_4fefd9b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5eb98eaec46c01af", &function_4fefd9b);
	/#
		assert(isscriptfunctionptr(&function_31cbd57e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_587aa92de0ae4cdd", &function_31cbd57e);
	/#
		assert(isscriptfunctionptr(&function_4aff5b9d));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_67f7516b1162e7ee", &function_4aff5b9d);
	/#
		assert(isscriptfunctionptr(&meleeacquiremutex));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"meleeacquiremutex", &meleeacquiremutex);
	/#
		assert(isscriptfunctionptr(&meleereleasemutex));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"meleereleasemutex", &meleereleasemutex);
	/#
		assert(isscriptfunctionptr(&prepareforexposedmelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"prepareforexposedmelee", &prepareforexposedmelee);
	/#
		assert(isscriptfunctionptr(&cleanupmelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"cleanupmelee", &cleanupmelee);
	/#
		assert(iscodefunctionptr(&btapi_shouldnormalmelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_shouldnormalmelee", &btapi_shouldnormalmelee);
	/#
		assert(iscodefunctionptr(&btapi_shouldnormalmelee));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_shouldnormalmelee", &btapi_shouldnormalmelee);
	/#
		assert(iscodefunctionptr(&btapi_shouldmelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_shouldmelee", &btapi_shouldmelee);
	/#
		assert(iscodefunctionptr(&btapi_shouldmelee));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_shouldmelee", &btapi_shouldmelee);
	/#
		assert(isscriptfunctionptr(&isbalconydeath));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"isbalconydeath", &isbalconydeath);
	/#
		assert(isscriptfunctionptr(&function_c104a10e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_73d21e0db2035bfa", &function_c104a10e);
	/#
		assert(isscriptfunctionptr(&balconydeath));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"balconydeath", &balconydeath);
	/#
		assert(isscriptfunctionptr(&usecurrentposition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"usecurrentposition", &usecurrentposition);
	/#
		assert(isscriptfunctionptr(&isunarmed));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"isunarmed", &isunarmed);
	/#
		assert(isscriptfunctionptr(&function_459c5ea7));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_712bff7525e4a6b8", &function_459c5ea7);
	/#
		assert(isscriptfunctionptr(&function_b375c36c));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_3da552249ce651af", &function_b375c36c);
	/#
		assert(isscriptfunctionptr(&function_39c7ce7f));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_a8b8446f4206a0a", &function_39c7ce7f);
	/#
		assert(iscodefunctionptr(&btapi_shouldchargemelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_shouldchargemelee", &btapi_shouldchargemelee);
	/#
		assert(iscodefunctionptr(&btapi_shouldchargemelee));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"btapi_shouldchargemelee", &btapi_shouldchargemelee);
	/#
		assert(isscriptfunctionptr(&cleanupchargemelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"cleanupchargemelee", &cleanupchargemelee);
	/#
		assert(isscriptfunctionptr(&cleanupchargemeleeattack));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"cleanupchargemeleeattack", &cleanupchargemeleeattack);
	/#
		assert(isscriptfunctionptr(&setupchargemeleeattack));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"setupchargemeleeattack", &setupchargemeleeattack);
	/#
		assert(isscriptfunctionptr(&function_de7e2d3f));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_209f67e4390a01e4", &function_de7e2d3f);
	/#
		assert(isscriptfunctionptr(&function_9414b79f));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_6cd29429666ea22d", &function_9414b79f);
	/#
		assert(isscriptfunctionptr(&function_bcbf3f38));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_6ae246561f9295e4", &function_bcbf3f38);
	/#
		assert(isscriptfunctionptr(&shouldchoosespecialpain));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldchoosespecialpain", &shouldchoosespecialpain);
	/#
		assert(isscriptfunctionptr(&function_3769693b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_382af3d128c68e13", &function_3769693b);
	/#
		assert(isscriptfunctionptr(&function_9b0e7a22));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_50fc16dcf1175197", &function_9b0e7a22);
	/#
		assert(isscriptfunctionptr(&shouldchoosespecialpronepain));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldchoosespecialpronepain", &shouldchoosespecialpronepain);
	/#
		assert(isscriptfunctionptr(&function_89cb7bfd));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_78675d76c0c51e10", &function_89cb7bfd);
	/#
		assert(isscriptfunctionptr(&shouldchoosespecialdeath));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldchoosespecialdeath", &shouldchoosespecialdeath);
	/#
		assert(isscriptfunctionptr(&shouldchoosespecialpronedeath));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldchoosespecialpronedeath", &shouldchoosespecialpronedeath);
	/#
		assert(isscriptfunctionptr(&setupexplosionanimscale));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"setupexplosionanimscale", &setupexplosionanimscale);
	function_7a62f47d();
	/#
		assert(iscodefunctionptr(&btapi_isinphalanx));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_isinphalanx", &btapi_isinphalanx);
	/#
		assert(isscriptfunctionptr(&isinphalanx));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"isinphalanx", &isinphalanx);
	/#
		assert(isscriptfunctionptr(&isinphalanxstance));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"isinphalanxstance", &isinphalanxstance);
	/#
		assert(isscriptfunctionptr(&togglephalanxstance));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"togglephalanxstance", &togglephalanxstance);
	/#
		assert(isscriptfunctionptr(&isatattackobject));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"isatattackobject", &isatattackobject);
	/#
		assert(isscriptfunctionptr(&shouldattackobject));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldattackobject", &shouldattackobject);
	/#
		assert(isscriptfunctionptr(&function_81c32010));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_554e27065bc759d9", &function_81c32010);
	behaviortreenetworkutility::registerbehaviortreeaction(#"defaultaction", undefined, undefined, undefined);
	/#
		assert(isscriptfunctionptr(&function_331e64bd));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1e656fe04d8ca3d7", &function_331e64bd);
	archetype_aivsaimelee::registeraivsaimeleebehaviorfunctions();
}

/*
	Name: function_7a62f47d
	Namespace: aiutility
	Checksum: 0xF8E9F74B
	Offset: 0x3248
	Size: 0x24FC
	Parameters: 0
	Flags: Linked
*/
function function_7a62f47d()
{
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldstealth", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealthreactcondition", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"locomotionshouldstealth", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldstealthresume", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealthreactstart", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealthreactterminate", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealthidleterminate", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6015c026b1fa3b68", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6903274957b06c58", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"ifinstealth", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_30483c99fb320ecb", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5d5935e442748f9e", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2b4b5597da9bc2f8", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_8374ad58022a136", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_652e009b8323c31b", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealth_enemy_updateeveryframe", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_65e89f484bba20bb", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_14f8e3d6eda75d6a", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_458e9a34b803db29", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7ed5e6ee9b115c2a", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_77e5c00cfcf7002e", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5d73de1aab3eb35d", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_ae56f63cd9fbe86", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealth_shouldinvestigate", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6431cd50d65a767c", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_31b933dc0e7c5c84", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1e0ad4032a3da41f", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1c37119295b3cc48", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6a892d952d9c58b7", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_247b034a88a7e3b", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_540afeb2906c14c7", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_44e72b8fcdaf3ff8", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealth_shouldhunt", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1432a729e25120ac", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4691e67cad7d9b37", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6c20630dac281d70", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7c50b51a79eba680", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1a2cb215f0adfdab", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_a287df3d9435b4c", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4429fadb560937b5", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4d4262f789528f48", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6623ac05b3e89d2", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_c3501ebe051547e", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_633bd00a4c6c070d", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_38670b1f6bfc60d6", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_219ee8817462ba75", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_56707481883cec89", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_72041acc7d1e9e99", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_a1c1fb228689f9c", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_fef2a96c4de38c7", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3cb50e01a7d9b2e0", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7faa7f08cbd182e0", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2792d75a8b597397", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"stealth_neutral_updateeveryframe", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_15db81c49c83357e", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"ifshoulddosmartobject", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"dosmartobject", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"dosmartobject_init", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_792be4bd91e1c9e2", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4ab3a0d2b8ce1d48", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3fb32d4ff7ddb9f7", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2fa97de855da1e4f", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7ccd1fa8f8bd85fc", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7f29302adf2f1e45", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_52aa02ad4a142cb3", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_982f6b18e2cdc06", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_23286b53d24487b4", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_22ca87c523f21d6d", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1d1883695574917c", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1cad32c846c91188", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_865ea8e6));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_37829e514d614663", &function_865ea8e6);
	/#
		assert(isscriptfunctionptr(&function_865ea8e6));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_66bfafd78f8a2da4", &function_865ea8e6);
	/#
		assert(isscriptfunctionptr(&function_865ea8e6));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_28aa53308dae6714", &function_865ea8e6);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_77e5c00cfcf7002e", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_5d73de1aab3eb35d", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_ae56f63cd9fbe86", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_76d6aa4d32b2559c", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1082b3ce4938748d", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"locomotionshouldstealth", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_6015c026b1fa3b68", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_6903274957b06c58", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"stealthreactcondition", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_34ba896ad71ef639", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_247b034a88a7e3b", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_540afeb2906c14c7", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_44e72b8fcdaf3ff8", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_2fa97de855da1e4f", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_7cd1f4f1d328c8c", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_344cc9226dda1596", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_8f12f910));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_1082b3ce4938748d", &function_8f12f910);
	/#
		assert(isscriptfunctionptr(&function_865ea8e6));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal(#"hash_59f41dfd5931bd64", &function_865ea8e6);
}

/*
	Name: function_8f12f910
	Namespace: aiutility
	Checksum: 0xD7D0390C
	Offset: 0x5750
	Size: 0xE
	Parameters: 1
	Flags: Linked
*/
function function_8f12f910(entity)
{
	return false;
}

/*
	Name: function_865ea8e6
	Namespace: aiutility
	Checksum: 0x3D7D3E2B
	Offset: 0x5768
	Size: 0x10
	Parameters: 1
	Flags: Linked
*/
function function_865ea8e6(entity)
{
	return true;
}

/*
	Name: function_ba333ba3
	Namespace: aiutility
	Checksum: 0x8BF080EB
	Offset: 0x5780
	Size: 0x2E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ba333ba3()
{
	if(is_true(self.onslope))
	{
		return "SLOPE";
	}
	return "STAIRS";
}

/*
	Name: bb_getstairsnumskipsteps
	Namespace: aiutility
	Checksum: 0x7DDDA64C
	Offset: 0x57B8
	Size: 0x152
	Parameters: 0
	Flags: Linked, Private
*/
function private bb_getstairsnumskipsteps()
{
	/#
		assert(isdefined(self._stairsstartnode) && isdefined(self._stairsendnode));
	#/
	numtotalsteps = self getblackboardattribute("_staircase_num_total_steps");
	stepssofar = self getblackboardattribute("_staircase_num_steps");
	direction = self getblackboardattribute("_staircase_direction");
	numoutsteps = 2;
	totalstepswithoutout = numtotalsteps - numoutsteps;
	/#
		assert(stepssofar < totalstepswithoutout);
	#/
	remainingsteps = totalstepswithoutout - stepssofar;
	if(remainingsteps >= 8)
	{
		return "staircase_skip_8";
	}
	if(remainingsteps >= 6)
	{
		return "staircase_skip_6";
	}
	/#
		assert(remainingsteps >= 3);
	#/
	return "staircase_skip_3";
}

/*
	Name: function_459c5ea7
	Namespace: aiutility
	Checksum: 0x86453D34
	Offset: 0x5918
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_459c5ea7(entity)
{
	return function_27675652(entity) === "_vault_over_drop" || function_b375c36c(entity) || function_39c7ce7f(entity);
}

/*
	Name: function_b375c36c
	Namespace: aiutility
	Checksum: 0xCC42BE2
	Offset: 0x5980
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_b375c36c(entity)
{
	return function_27675652(entity) === "_vault_jump_up_drop";
}

/*
	Name: function_39c7ce7f
	Namespace: aiutility
	Checksum: 0x2438D81A
	Offset: 0x59B8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_39c7ce7f(entity)
{
	return function_27675652(entity) === "_vault_jump_down_drop";
}

/*
	Name: function_27675652
	Namespace: aiutility
	Checksum: 0x6DF96369
	Offset: 0x59F0
	Size: 0x37E
	Parameters: 1
	Flags: Linked
*/
function function_27675652(entity)
{
	/#
		assert(isdefined(entity.var_854857c6));
	#/
	traversaltype = entity getblackboardattribute("_parametric_traversal_type");
	if(!isdefined(traversaltype) || traversaltype != "mantle_traversal")
	{
		return undefined;
	}
	if(!isdefined(entity.var_854857c6))
	{
		return undefined;
	}
	if(!isdefined(entity.ai.var_e233df10))
	{
		entity.ai.var_e233df10 = [];
		bundle = getscriptbundle(entity.var_854857c6);
		entity.ai.var_e233df10[#"min"] = bundle.var_f850cb73;
		entity.ai.var_e233df10[#"max"] = bundle.var_f724517b;
	}
	if(!isdefined(entity.ai.var_e233df10[#"min"]))
	{
		entity.ai.var_e233df10[#"min"] = 0.8;
	}
	if(!isdefined(entity.ai.var_e233df10[#"max"]))
	{
		entity.ai.var_e233df10[#"max"] = 1.2;
	}
	startnode = entity.traversestartnode;
	endnode = entity.traverseendnode;
	mantlenode = entity.traversemantlenode;
	if(!isdefined(mantlenode))
	{
		return undefined;
	}
	startheight = mantlenode.origin[2] - startnode.origin[2];
	endheight = mantlenode.origin[2] - endnode.origin[2];
	/#
		if(startheight == 0 || endheight == 0)
		{
			/#
				assertmsg(((((("" + mantlenode.origin[0]) + "") + mantlenode.origin[1]) + "") + mantlenode.origin[2]) + "");
			#/
		}
	#/
	ratio = abs(endheight / startheight);
	if(ratio < entity.ai.var_e233df10[#"min"])
	{
		return "_vault_jump_up_drop";
	}
	if(ratio > entity.ai.var_e233df10[#"max"])
	{
		return "_vault_jump_down_drop";
	}
	return "_vault_over_drop";
}

/*
	Name: function_36e869c5
	Namespace: aiutility
	Checksum: 0xEC52FFFC
	Offset: 0x5D78
	Size: 0x8A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_36e869c5()
{
	entity = self;
	startnode = entity.traversestartnode;
	mantlenode = entity.traversemantlenode;
	if(!isdefined(mantlenode))
	{
		return undefined;
	}
	startheight = abs(mantlenode.origin[2] - startnode.origin[2]);
	return startheight;
}

/*
	Name: function_975e9355
	Namespace: aiutility
	Checksum: 0x90D0C5F3
	Offset: 0x5E10
	Size: 0x8A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_975e9355()
{
	entity = self;
	endnode = entity.traverseendnode;
	mantlenode = entity.traversemantlenode;
	if(!isdefined(mantlenode))
	{
		return undefined;
	}
	endheight = abs(mantlenode.origin[2] - endnode.origin[2]);
	return endheight;
}

/*
	Name: bb_gettraversalheight
	Namespace: aiutility
	Checksum: 0xFC62522C
	Offset: 0x5EA8
	Size: 0x2C4
	Parameters: 0
	Flags: Linked, Private
*/
function private bb_gettraversalheight()
{
	entity = self;
	startposition = entity.traversalstartpos;
	endposition = entity.traversalendpos;
	if(isdefined(entity.traveseheightoverride))
	{
		/#
			record3dtext("" + entity.traveseheightoverride, self.origin + vectorscale((0, 0, 1), 32), (1, 0, 0), "");
		#/
		return entity.traveseheightoverride;
	}
	if(isdefined(entity.traversemantlenode) || entity function_dd4f686e())
	{
		pivotorigin = archetype_mocomps_utility::calculatepivotoriginfromedge(entity, entity.traversemantlenode, entity.origin);
		traversalheight = pivotorigin[2] - (isdefined(entity.traversalstartpos) ? entity.traversalstartpos[2] : entity.origin[2]);
		/#
			record3dtext("" + traversalheight, self.origin + vectorscale((0, 0, 1), 32), (1, 0, 0), "");
			if(traversalheight < 24)
			{
				println(((("" + entity.traversalstartpos) + "") + traversalheight) + "");
			}
		#/
		return traversalheight;
	}
	if(isdefined(startposition) && isdefined(endposition))
	{
		traversalheight = endposition[2] - startposition[2];
		if(bb_getparametrictraversaltype() == "jump_across_traversal" && function_dabc588b(entity.aitype))
		{
			traversalheight = abs(traversalheight);
		}
		/#
			record3dtext("" + traversalheight, self.origin + vectorscale((0, 0, 1), 32), (1, 0, 0), "");
		#/
		return traversalheight;
	}
	return 0;
}

/*
	Name: bb_gettraversalwidth
	Namespace: aiutility
	Checksum: 0x3AC183AA
	Offset: 0x6178
	Size: 0x124
	Parameters: 0
	Flags: Linked, Private
*/
function private bb_gettraversalwidth()
{
	entity = self;
	startposition = entity.traversalstartpos;
	endposition = entity.traversalendpos;
	if(isdefined(entity.travesewidthoverride))
	{
		/#
			record3dtext("" + entity.travesewidthoverride, self.origin + vectorscale((0, 0, 1), 48), (1, 0, 0), "");
		#/
		return entity.travesewidthoverride;
	}
	if(isdefined(startposition) && isdefined(endposition))
	{
		var_d4b651b8 = distance2d(startposition, endposition);
		/#
			record3dtext("" + var_d4b651b8, self.origin + vectorscale((0, 0, 1), 48), (1, 0, 0), "");
		#/
		return var_d4b651b8;
	}
	return 0;
}

/*
	Name: bb_getparametrictraversaltype
	Namespace: aiutility
	Checksum: 0xF27F22AF
	Offset: 0x62A8
	Size: 0x3AA
	Parameters: 0
	Flags: Linked
*/
function bb_getparametrictraversaltype()
{
	entity = self;
	if(entity function_3c566724())
	{
		if(entity function_dd4f686e())
		{
			return "mantle_traversal";
		}
		startposition = entity.traversalstartpos;
		endposition = entity.traversalendpos;
		if(isdefined(startposition) && isdefined(endposition))
		{
			traversaldistance = distance2d(startposition, endposition);
			isendpointaboveorsamelevel = startposition[2] <= endposition[2];
			if(traversaldistance >= 108 && (abs(endposition[2] - startposition[2])) <= 100)
			{
				return "jump_across_traversal";
			}
			/#
				if((abs(endposition[2] - startposition[2])) <= 24)
				{
					traversal_type = (isendpointaboveorsamelevel ? "" : "");
					height = endposition[2] - startposition[2];
					println(((((((("" + traversal_type) + "") + height) + "") + startposition) + "") + endposition) + "");
				}
			#/
			if(isendpointaboveorsamelevel)
			{
				return "jump_up_traversal";
			}
			return "jump_down_traversal";
		}
		return "unknown_traversal";
	}
	entity = self;
	startposition = entity.traversalstartpos;
	endposition = entity.traversalendpos;
	if(!isdefined(entity.traversestartnode) || entity.traversestartnode.type != "Volume" || (!isdefined(entity.traverseendnode) || entity.traverseendnode.type != "Volume"))
	{
		return "unknown_traversal";
	}
	if(isdefined(entity.traversestartnode) && isdefined(entity.traversemantlenode))
	{
		return "mantle_traversal";
	}
	if(isdefined(startposition) && isdefined(endposition))
	{
		traversaldistance = distance2d(startposition, endposition);
		isendpointaboveorsamelevel = startposition[2] <= endposition[2];
		if(traversaldistance >= 108 && (abs(endposition[2] - startposition[2])) <= 100)
		{
			return "jump_across_traversal";
		}
		if(isendpointaboveorsamelevel)
		{
			if(is_true(entity.traverseendnode.var_446fcc3b) && is_true(entity.var_1731eda3))
			{
				return "jump_up_hanging_traversal";
			}
			return "jump_up_traversal";
		}
		return "jump_down_traversal";
	}
	return "unknown_traversal";
}

/*
	Name: bb_getawareness
	Namespace: aiutility
	Checksum: 0x5845BE37
	Offset: 0x6660
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function bb_getawareness()
{
	return self.awarenesslevelcurrent;
}

/*
	Name: bb_getawarenessprevious
	Namespace: aiutility
	Checksum: 0x1CDA80C1
	Offset: 0x6678
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function bb_getawarenessprevious()
{
	return self.awarenesslevelprevious;
}

/*
	Name: function_cc26899f
	Namespace: aiutility
	Checksum: 0xD255B4BB
	Offset: 0x6690
	Size: 0xB2
	Parameters: 0
	Flags: Linked
*/
function function_cc26899f()
{
	if(isdefined(self.zombie_move_speed))
	{
		if(self.zombie_move_speed == "walk")
		{
			return "locomotion_speed_walk";
		}
		if(self.zombie_move_speed == "run")
		{
			return "locomotion_speed_run";
		}
		if(self.zombie_move_speed == "sprint")
		{
			return "locomotion_speed_sprint";
		}
		if(self.zombie_move_speed == "super_sprint")
		{
			return "locomotion_speed_super_sprint";
		}
		if(self.zombie_move_speed == "super_super_sprint")
		{
			return "locomotion_speed_super_super_sprint";
		}
	}
	return "locomotion_speed_walk";
}

/*
	Name: bb_getgibbedlimbs
	Namespace: aiutility
	Checksum: 0xD39EACED
	Offset: 0x6750
	Size: 0xA6
	Parameters: 0
	Flags: Linked, Private
*/
function private bb_getgibbedlimbs()
{
	entity = self;
	rightarmgibbed = gibserverutils::isgibbed(entity, 16);
	leftarmgibbed = gibserverutils::isgibbed(entity, 32);
	if(rightarmgibbed && leftarmgibbed)
	{
		return "both_arms";
	}
	if(rightarmgibbed)
	{
		return "right_arm";
	}
	if(leftarmgibbed)
	{
		return "left_arm";
	}
	return "none";
}

/*
	Name: bb_getyawtocovernode
	Namespace: aiutility
	Checksum: 0xF61DF2BE
	Offset: 0x6800
	Size: 0x132
	Parameters: 0
	Flags: Linked
*/
function bb_getyawtocovernode()
{
	if(!isdefined(self.node) || self.node.spawnflags & 128)
	{
		return 0;
	}
	disttonodesqr = distance2dsquared(self getnodeoffsetposition(self.node), self.origin);
	if(is_true(self.keepclaimednode))
	{
		if(disttonodesqr > sqr(64))
		{
			return 0;
		}
	}
	else if(disttonodesqr > sqr(24))
	{
		return 0;
	}
	angletonode = ceil(angleclamp180(self.angles[1] - self getnodeoffsetangles(self.node)[1]));
	return angletonode;
}

/*
	Name: bb_gethigheststance
	Namespace: aiutility
	Checksum: 0x6E616DBD
	Offset: 0x6940
	Size: 0x82
	Parameters: 0
	Flags: None
*/
function bb_gethigheststance()
{
	if(self isatcovernodestrict() && self shouldusecovernode())
	{
		higheststance = self gethighestnodestance(self.node);
		return higheststance;
	}
	return self getblackboardattribute("_stance");
}

/*
	Name: bb_getlocomotionfaceenemyquadrantprevious
	Namespace: aiutility
	Checksum: 0x5A4C18CD
	Offset: 0x69D0
	Size: 0xBA
	Parameters: 0
	Flags: Linked
*/
function bb_getlocomotionfaceenemyquadrantprevious()
{
	if(isdefined(self.prevrelativedir))
	{
		direction = self.prevrelativedir;
		switch(direction)
		{
			case 0:
			{
				return "locomotion_face_enemy_none";
			}
			case 1:
			{
				return "locomotion_face_enemy_front";
			}
			case 2:
			{
				return "locomotion_face_enemy_right";
			}
			case 3:
			{
				return "locomotion_face_enemy_left";
			}
			case 4:
			{
				return "locomotion_face_enemy_back";
			}
		}
	}
	return "locomotion_face_enemy_none";
}

/*
	Name: bb_getcurrentcovernodetype
	Namespace: aiutility
	Checksum: 0x51530E5F
	Offset: 0x6A98
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function bb_getcurrentcovernodetype()
{
	return getcovertype(self.node);
}

/*
	Name: bb_getcoverconcealed
	Namespace: aiutility
	Checksum: 0xB2F823FC
	Offset: 0x6AC0
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function bb_getcoverconcealed()
{
	if(iscoverconcealed(self.node))
	{
		return "concealed";
	}
	return "unconcealed";
}

/*
	Name: bb_getcurrentlocationcovernodetype
	Namespace: aiutility
	Checksum: 0x4D10B58F
	Offset: 0x6AF8
	Size: 0x7A
	Parameters: 0
	Flags: Linked
*/
function bb_getcurrentlocationcovernodetype()
{
	if(isdefined(self.node) && distancesquared(self.origin, self.node.origin) < sqr(24))
	{
		return bb_getcurrentcovernodetype();
	}
	return bb_getpreviouscovernodetype();
}

/*
	Name: function_8493bd6a
	Namespace: aiutility
	Checksum: 0x44FA1488
	Offset: 0x6B80
	Size: 0x92
	Parameters: 0
	Flags: Linked
*/
function function_8493bd6a()
{
	if(isdefined(self.node) && distancesquared(self.origin, self.node.origin) < sqr(24))
	{
		return self gethighestnodestance(self.node);
	}
	return self gethighestnodestance(self.prevnode);
}

/*
	Name: function_7f1ff852
	Namespace: aiutility
	Checksum: 0xF3764C45
	Offset: 0x6C20
	Size: 0xBE
	Parameters: 0
	Flags: Linked
*/
function function_7f1ff852()
{
	var_c6e68bb4 = self.prevnode;
	if(isdefined(self.node) && distancesquared(self.origin, self.node.origin) < sqr(24))
	{
		var_c6e68bb4 = self.node;
	}
	if(isdefined(var_c6e68bb4))
	{
		if(isinarray(getvalidcoverpeekouts(var_c6e68bb4), "over"))
		{
			return "YES";
		}
	}
	return "NO";
}

/*
	Name: bb_getshouldturn
	Namespace: aiutility
	Checksum: 0xD55F3112
	Offset: 0x6CE8
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function bb_getshouldturn()
{
	if(isdefined(self.should_turn) && self.should_turn)
	{
		return "should_turn";
	}
	return "should_not_turn";
}

/*
	Name: bb_getarmsposition
	Namespace: aiutility
	Checksum: 0x105DC98E
	Offset: 0x6D20
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function bb_getarmsposition()
{
	if(isdefined(self.zombie_arms_position))
	{
		if(self.zombie_arms_position == "up")
		{
			return "arms_up";
		}
		return "arms_down";
	}
	return "arms_up";
}

/*
	Name: bb_gethaslegsstatus
	Namespace: aiutility
	Checksum: 0x52C4FDBA
	Offset: 0x6D68
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function bb_gethaslegsstatus()
{
	if(self.missinglegs)
	{
		return "has_legs_no";
	}
	return "has_legs_yes";
}

/*
	Name: function_f61d3341
	Namespace: aiutility
	Checksum: 0x25DA20D5
	Offset: 0x6D90
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_f61d3341()
{
	if(gibserverutils::isgibbed(self, 256))
	{
		return "has_left_leg_no";
	}
	return "has_left_leg_yes";
}

/*
	Name: function_9b395e55
	Namespace: aiutility
	Checksum: 0x31386E88
	Offset: 0x6DC8
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_9b395e55()
{
	if(gibserverutils::isgibbed(self, 128))
	{
		return "has_right_leg_no";
	}
	return "has_right_leg_yes";
}

/*
	Name: function_99e55609
	Namespace: aiutility
	Checksum: 0xEEAF5472
	Offset: 0x6E00
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_99e55609()
{
	if(gibserverutils::isgibbed(self, 32))
	{
		return "has_left_arm_no";
	}
	return "has_left_arm_yes";
}

/*
	Name: function_aa8f1e69
	Namespace: aiutility
	Checksum: 0x784516
	Offset: 0x6E38
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_aa8f1e69()
{
	if(gibserverutils::isgibbed(self, 16))
	{
		return "has_right_arm_no";
	}
	return "has_right_arm_yes";
}

/*
	Name: function_5b03a448
	Namespace: aiutility
	Checksum: 0x27D52580
	Offset: 0x6E70
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function function_5b03a448()
{
	if(isdefined(self.var_beb2295))
	{
		return "has_grapplee_yes";
	}
	return "has_grapplee_no";
}

/*
	Name: actorgetpredictedyawtoenemy
	Namespace: aiutility
	Checksum: 0x5F9C7107
	Offset: 0x6E98
	Size: 0x162
	Parameters: 2
	Flags: Linked
*/
function actorgetpredictedyawtoenemy(entity, lookaheadtime)
{
	if(isdefined(entity.predictedyawtoenemy) && isdefined(entity.predictedyawtoenemytime) && entity.predictedyawtoenemytime == gettime())
	{
		return entity.predictedyawtoenemy;
	}
	selfpredictedpos = entity.origin;
	moveangle = entity.angles[1] + entity getmotionangle();
	selfpredictedpos = selfpredictedpos + (((cos(moveangle), sin(moveangle), 0) * 200) * lookaheadtime);
	aimpos = entity function_c709ce88();
	yaw = (vectortoangles(aimpos - selfpredictedpos)[1]) - entity.angles[1];
	yaw = absangleclamp360(yaw);
	entity.predictedyawtoenemy = yaw;
	entity.predictedyawtoenemytime = gettime();
	return yaw;
}

/*
	Name: function_e28a3ee5
	Namespace: aiutility
	Checksum: 0x3C32C74A
	Offset: 0x7008
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function function_e28a3ee5()
{
	if(isdefined(self.var_920617c1))
	{
		return self.var_920617c1;
	}
	return "stealth_investigate_height_default";
}

/*
	Name: bb_actorispatroling
	Namespace: aiutility
	Checksum: 0xD7FAE1B8
	Offset: 0x7030
	Size: 0x5E
	Parameters: 0
	Flags: Linked
*/
function bb_actorispatroling()
{
	entity = self;
	if(entity ai::has_behavior_attribute("patrol") && entity ai::get_behavior_attribute("patrol"))
	{
		return "patrol_enabled";
	}
	return "patrol_disabled";
}

/*
	Name: bb_actorhasenemy
	Namespace: aiutility
	Checksum: 0x52FB2AA2
	Offset: 0x7098
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function bb_actorhasenemy()
{
	entity = self;
	if(isdefined(entity.enemy))
	{
		return "has_enemy";
	}
	return "no_enemy";
}

/*
	Name: function_b3f35a07
	Namespace: aiutility
	Checksum: 0x381C35BB
	Offset: 0x70D0
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function function_b3f35a07()
{
	c_door = self.ai.doortoopen;
	if(!isdefined(c_door))
	{
		return "door_will_open_no";
	}
	if(is_true(self.ai.door_opened))
	{
		return "door_will_open_yes";
	}
	return "door_will_open_no";
}

/*
	Name: function_7970d18b
	Namespace: aiutility
	Checksum: 0x939932B1
	Offset: 0x7148
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function function_7970d18b()
{
	if(is_true(self.ai.var_10150769))
	{
		return "door_overlay_disabled";
	}
	return "door_overlay_enabled";
}

/*
	Name: function_19574f85
	Namespace: aiutility
	Checksum: 0x6C423AFB
	Offset: 0x7190
	Size: 0x162
	Parameters: 0
	Flags: Linked
*/
function function_19574f85()
{
	c_door = self.ai.doortoopen;
	if(!isdefined(c_door))
	{
		return 999999;
	}
	var_203b2da1 = c_door.var_85f2454d.doorbottomcenter;
	if(!isdefined(var_203b2da1))
	{
		var_203b2da1 = c_door.origin;
	}
	var_f56439f = c_door.var_85f2454d.var_c4269c41;
	if(!isdefined(var_f56439f))
	{
		var_f56439f = anglestoright(c_door.angles);
	}
	var_a003c4d6 = math::vec_to_angles(var_f56439f);
	var_93b76ac5 = var_203b2da1 - self.origin;
	var_3ea61d84 = math::vec_to_angles(var_93b76ac5);
	angle_diff = var_a003c4d6 - var_3ea61d84;
	angle_diff = angleclamp180(angle_diff);
	var_deeb5ea3 = undefined;
	if(angle_diff < 0)
	{
		var_deeb5ea3 = angle_diff + 90;
	}
	else
	{
		var_deeb5ea3 = angle_diff - 90;
	}
	return var_deeb5ea3;
}

/*
	Name: bb_actorgetenemyyaw
	Namespace: aiutility
	Checksum: 0x48059FDE
	Offset: 0x7300
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function bb_actorgetenemyyaw()
{
	enemy = self.enemy;
	if(!isdefined(enemy))
	{
		return 0;
	}
	toenemyyaw = actorgetpredictedyawtoenemy(self, 0.2);
	return toenemyyaw;
}

/*
	Name: function_dc8e1a0a
	Namespace: aiutility
	Checksum: 0x7CC86841
	Offset: 0x7360
	Size: 0x148
	Parameters: 0
	Flags: Linked
*/
function function_dc8e1a0a()
{
	enemy = (isdefined(self.var_2df45b5d) ? self.var_2df45b5d : self.enemy);
	if(!isdefined(enemy))
	{
		return 0;
	}
	node = undefined;
	if(isdefined(self.node) && self nearnode(self.node))
	{
		node = self.node;
	}
	else
	{
		node = self.prevnode;
	}
	if(!isdefined(node))
	{
		return 0;
	}
	toenemyyaw = (vectortoangles(enemy.origin - node.origin)[1]) - node.angles[1];
	toenemyyaw = absangleclamp360(toenemyyaw);
	/#
		record3dtext("" + toenemyyaw, self.origin, (1, 0, 0), "", self);
	#/
	return toenemyyaw;
}

/*
	Name: bb_actorgetperfectenemyyaw
	Namespace: aiutility
	Checksum: 0xA0820586
	Offset: 0x74B0
	Size: 0xE0
	Parameters: 0
	Flags: Linked
*/
function bb_actorgetperfectenemyyaw()
{
	enemy = (isdefined(self.var_2df45b5d) ? self.var_2df45b5d : self.enemy);
	if(!isdefined(enemy))
	{
		return 0;
	}
	toenemyyaw = (vectortoangles(enemy.origin - self.origin)[1]) - self.angles[1];
	toenemyyaw = absangleclamp360(toenemyyaw);
	/#
		record3dtext("" + toenemyyaw, self.origin, (1, 0, 0), "", self);
	#/
	return toenemyyaw;
}

/*
	Name: function_caea19a8
	Namespace: aiutility
	Checksum: 0xC885BEE4
	Offset: 0x7598
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_caea19a8()
{
	result = self.angles[1];
	if(isdefined(self.stealth) && (isdefined(self.stealth.patrol_react_pos) && isdefined(self.stealth.patrol_react_time)) && (gettime() - self.stealth.patrol_react_time) < 2000)
	{
		deltaorigin = self.stealth.patrol_react_pos - self.origin;
		result = vectortoangles(deltaorigin)[1];
	}
	return result;
}

/*
	Name: bb_actorgetreactyaw
	Namespace: aiutility
	Checksum: 0x3B2F184A
	Offset: 0x7658
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function bb_actorgetreactyaw()
{
	return absangleclamp360(self.angles[1] - self getblackboardattribute("_react_yaw_world"));
}

/*
	Name: function_bee4de6
	Namespace: aiutility
	Checksum: 0xC1EBA726
	Offset: 0x76A8
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_bee4de6()
{
	result = self.angles[1];
	if(isdefined(self.var_5aaa7f76))
	{
		deltaorigin = self.var_5aaa7f76 - self.origin;
		/#
			recordstar(self.var_5aaa7f76, (1, 0, 1), "", self);
			recordline(self.origin, self.var_5aaa7f76, (1, 0, 1), "", self);
		#/
		result = vectortoangles(deltaorigin)[1];
	}
	return result;
}

/*
	Name: function_6568cc68
	Namespace: aiutility
	Checksum: 0x889866CB
	Offset: 0x7770
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function function_6568cc68()
{
	angle = absangleclamp360(self.angles[1] - self getblackboardattribute("_zombie_react_yaw_world"));
	/#
		record3dtext("" + angle, self.origin, (1, 0, 1), "", self);
	#/
	return angle;
}

/*
	Name: function_abb9c007
	Namespace: aiutility
	Checksum: 0x11A1FA13
	Offset: 0x7808
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function function_abb9c007(entity)
{
	if(isdefined(self.stealth))
	{
		if(is_true(self.stealth.var_7f670ead))
		{
			return 0;
		}
		return is_true(self.stealth.var_527ef51c);
	}
	return self haspath();
}

/*
	Name: getangleusingdirection
	Namespace: aiutility
	Checksum: 0xAB8D9BB0
	Offset: 0x7890
	Size: 0xB2
	Parameters: 1
	Flags: Linked
*/
function getangleusingdirection(direction)
{
	directionyaw = vectortoangles(direction)[1];
	yawdiff = directionyaw - self.angles[1];
	yawdiff = yawdiff * 0.002777778;
	flooredyawdiff = floor(yawdiff + 0.5);
	turnangle = (yawdiff - flooredyawdiff) * 360;
	return absangleclamp360(turnangle);
}

/*
	Name: wasatcovernode
	Namespace: aiutility
	Checksum: 0x3756CF64
	Offset: 0x7950
	Size: 0x13C
	Parameters: 0
	Flags: Linked
*/
function wasatcovernode()
{
	if(isdefined(self.prevnode))
	{
		if(self.prevnode.type == #"hash_63cbb4767da2a801" || self.prevnode.type == #"hash_2a7b1ca393696762" || self.prevnode.type == #"hash_7a0e62fbbe3989d4" || (self.prevnode.type == #"hash_581529fff05853f0" || self.prevnode.type == #"hash_1bb444d857814e92") || (self.prevnode.type == #"hash_6d8019ab9d39bf96" || self.prevnode.type == #"hash_280d1247a6abdbae" || self.prevnode.type == #"hash_171465527444ed14"))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: bb_getlocomotionexityaw
	Namespace: aiutility
	Checksum: 0xC62639FB
	Offset: 0x7A98
	Size: 0x636
	Parameters: 2
	Flags: Linked
*/
function bb_getlocomotionexityaw(blackboard, yaw)
{
	if(self haspath())
	{
		predictedlookaheadinfo = self predictexit();
		status = predictedlookaheadinfo[#"path_prediction_status"];
		if(!isdefined(self.pathgoalpos))
		{
			return -1;
		}
		if(status == 3)
		{
			start = self.origin;
			end = start + vectorscale((0, predictedlookaheadinfo[#"path_prediction_travel_vector"][1], 0), 100);
			angletoexit = vectortoangles(predictedlookaheadinfo[#"path_prediction_travel_vector"])[1];
			exityaw = absangleclamp360(angletoexit - self.prevnode.angles[1]);
			/#
				record3dtext("" + int(exityaw), self.origin - vectorscale((0, 0, 1), 5), (1, 0, 0), "", undefined, 0.4);
			#/
			return exityaw;
		}
		if(status == 4)
		{
			start = self.origin;
			end = start + vectorscale((0, predictedlookaheadinfo[#"path_prediction_travel_vector"][1], 0), 100);
			angletoexit = vectortoangles(predictedlookaheadinfo[#"path_prediction_travel_vector"])[1];
			exityaw = absangleclamp360(angletoexit - self.angles[1]);
			/#
				record3dtext("" + int(exityaw), self.origin - vectorscale((0, 0, 1), 5), (1, 0, 0), "", undefined, 0.4);
			#/
			return exityaw;
		}
		if(status == 0)
		{
			if(wasatcovernode() && distancesquared(self.prevnode.origin, self.origin) < 25)
			{
				end = self.pathgoalpos;
				angletodestination = vectortoangles(end - self.origin)[1];
				exityaw = absangleclamp360(angletodestination - self.prevnode.angles[1]);
				/#
					record3dtext("" + int(exityaw), self.origin - vectorscale((0, 0, 1), 5), (1, 0, 0), "", undefined, 0.4);
				#/
				return exityaw;
			}
			start = predictedlookaheadinfo[#"path_prediction_start_point"];
			end = start + predictedlookaheadinfo[#"path_prediction_travel_vector"];
			exityaw = getangleusingdirection(predictedlookaheadinfo[#"path_prediction_travel_vector"]);
			/#
				record3dtext("" + int(exityaw), self.origin - vectorscale((0, 0, 1), 5), (1, 0, 0), "", undefined, 0.4);
			#/
			return exityaw;
		}
		if(status == 2)
		{
			if(wasatcovernode() && distancesquared(self.prevnode.origin, self.origin) < 25)
			{
				end = self.pathgoalpos;
				angletodestination = vectortoangles(end - self.origin)[1];
				exityaw = absangleclamp360(angletodestination - self.prevnode.angles[1]);
				/#
					record3dtext("" + int(exityaw), self.origin - vectorscale((0, 0, 1), 5), (1, 0, 0), "", undefined, 0.4);
				#/
				return exityaw;
			}
			exityaw = getangleusingdirection(vectornormalize(self.pathgoalpos - self.origin));
			/#
				record3dtext("" + int(exityaw), self.origin - vectorscale((0, 0, 1), 5), (1, 0, 0), "", undefined, 0.4);
			#/
			return exityaw;
		}
	}
	return -1;
}

/*
	Name: bb_getlocomotionfaceenemyquadrant
	Namespace: aiutility
	Checksum: 0x708C7E2
	Offset: 0x80D8
	Size: 0x14A
	Parameters: 0
	Flags: Linked
*/
function bb_getlocomotionfaceenemyquadrant()
{
	/#
		walkstring = getdvarstring(#"tacticalwalkdirection");
		switch(walkstring)
		{
			case "right":
			{
				return "";
			}
			case "left":
			{
				return "";
			}
			case "back":
			{
				return "";
			}
		}
	#/
	if(isdefined(self.relativedir))
	{
		direction = self.relativedir;
		switch(direction)
		{
			case 0:
			{
				return "locomotion_face_enemy_front";
			}
			case 1:
			{
				return "locomotion_face_enemy_front";
			}
			case 2:
			{
				return "locomotion_face_enemy_right";
			}
			case 3:
			{
				return "locomotion_face_enemy_left";
			}
			case 4:
			{
				return "locomotion_face_enemy_back";
			}
		}
	}
	return "locomotion_face_enemy_front";
}

/*
	Name: bb_getlocomotionpaintype
	Namespace: aiutility
	Checksum: 0x9DB577E3
	Offset: 0x8230
	Size: 0x26A
	Parameters: 0
	Flags: Linked
*/
function bb_getlocomotionpaintype()
{
	if(self haspath())
	{
		predictedlookaheadinfo = self predictpath();
		status = predictedlookaheadinfo[#"path_prediction_status"];
		startpos = self.origin;
		furthestpointtowardsgoalclear = 1;
		if(status == 2)
		{
			furthestpointalongtowardsgoal = startpos + vectorscale(self.lookaheaddir, 300);
			furthestpointtowardsgoalclear = self findpath(startpos, furthestpointalongtowardsgoal, 0, 0) && self maymovetopoint(furthestpointalongtowardsgoal);
		}
		if(furthestpointtowardsgoalclear)
		{
			forwarddir = anglestoforward(self.angles);
			possiblepaintypes = [];
			endpos = startpos + vectorscale(forwarddir, 300);
			if(self maymovetopoint(endpos) && self findpath(startpos, endpos, 0, 0))
			{
				possiblepaintypes[possiblepaintypes.size] = "locomotion_moving_pain_long";
			}
			endpos = startpos + vectorscale(forwarddir, 200);
			if(self maymovetopoint(endpos) && self findpath(startpos, endpos, 0, 0))
			{
				possiblepaintypes[possiblepaintypes.size] = "locomotion_moving_pain_med";
			}
			endpos = startpos + vectorscale(forwarddir, 150);
			if(self maymovetopoint(endpos) && self findpath(startpos, endpos, 0, 0))
			{
				possiblepaintypes[possiblepaintypes.size] = "locomotion_moving_pain_short";
			}
			if(possiblepaintypes.size)
			{
				return array::random(possiblepaintypes);
			}
		}
	}
	return "locomotion_inplace_pain";
}

/*
	Name: bb_getlookaheadangle
	Namespace: aiutility
	Checksum: 0x6C1BA3D6
	Offset: 0x84A8
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function bb_getlookaheadangle()
{
	return absangleclamp360(vectortoangles(self.lookaheaddir)[1] - self.angles[1]);
}

/*
	Name: bb_getpreviouscovernodetype
	Namespace: aiutility
	Checksum: 0x380FD72D
	Offset: 0x84F8
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function bb_getpreviouscovernodetype()
{
	return getcovertype(self.prevnode);
}

/*
	Name: bb_actorgettrackingturnyaw
	Namespace: aiutility
	Checksum: 0x7F9FC0B9
	Offset: 0x8520
	Size: 0x246
	Parameters: 0
	Flags: Linked
*/
function bb_actorgettrackingturnyaw()
{
	var_71a0045b = undefined;
	if(isdefined(self.enemy))
	{
		if(self cansee(self.enemy))
		{
			var_71a0045b = self.enemy.origin;
		}
		else if(issentient(self.enemy))
		{
			if(self.highlyawareradius && distance2dsquared(self.enemy.origin, self.origin) < sqr(self.highlyawareradius))
			{
				var_71a0045b = self.enemy.origin;
			}
			else
			{
				var_71a0045b = self function_c709ce88();
			}
		}
	}
	else
	{
		if(isdefined(self.ai.var_3af1add3))
		{
			var_71a0045b = [[self.ai.var_3af1add3]](self);
		}
		else if(isdefined(self.likelyenemyposition))
		{
			if(self canshoot(self.likelyenemyposition))
			{
				if(!isdefined(self.var_2747663c))
				{
					self.var_2747663c = 0;
					self.var_dec89a60 = 0;
				}
				if(gettime() - self.var_2747663c > 500)
				{
					self.var_dec89a60 = sighttracepassed(self.origin + vectorscale((0, 0, 1), 64), self.likelyenemyposition, 0, self);
					self.var_2747663c = gettime();
				}
				if(self.var_dec89a60)
				{
					var_71a0045b = self.likelyenemyposition;
				}
			}
		}
	}
	if(isdefined(var_71a0045b))
	{
		turnyaw = absangleclamp360(self.angles[1] - (vectortoangles(var_71a0045b - self.origin)[1]));
		return turnyaw;
	}
	return 0;
}

/*
	Name: bb_getweaponclass
	Namespace: aiutility
	Checksum: 0x5505928A
	Offset: 0x8770
	Size: 0x11A
	Parameters: 0
	Flags: Linked
*/
function bb_getweaponclass()
{
	weaponclass = (isdefined(self.weaponclass) ? self.weaponclass : "rifle");
	switch(weaponclass)
	{
		case "rifle":
		{
			return "rifle";
		}
		case "rifle":
		{
			return "rifle";
		}
		case "mg":
		{
			return "mg";
		}
		case "smg":
		{
			return "smg";
		}
		case "spread":
		{
			return "spread";
		}
		case "pistol":
		{
			return "pistol";
		}
		case "grenade":
		{
			return "grenade";
		}
		case "rocketlauncher":
		{
			return "rocketlauncher";
		}
		default:
		{
			return "rifle";
		}
	}
}

/*
	Name: function_6f949118
	Namespace: aiutility
	Checksum: 0xBC5CC5D9
	Offset: 0x8898
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function function_6f949118()
{
	angles = self gettagangles("tag_origin");
	return angleclamp180(angles[0]);
}

/*
	Name: function_38855dc8
	Namespace: aiutility
	Checksum: 0xFC38B61
	Offset: 0x88E8
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_38855dc8()
{
	if(!isdefined(self.favoriteenemy))
	{
		return 0;
	}
	velocity = self.favoriteenemy getvelocity();
	return length(velocity);
}

/*
	Name: function_ebaa4b7c
	Namespace: aiutility
	Checksum: 0x84D69A23
	Offset: 0x8940
	Size: 0x36
	Parameters: 0
	Flags: Linked
*/
function function_ebaa4b7c()
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}
	return self.enemy.origin[2] - self.origin[2];
}

/*
	Name: function_6ecd367e
	Namespace: aiutility
	Checksum: 0x902C48FF
	Offset: 0x8980
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function function_6ecd367e()
{
	if(!isdefined(self.traversestartnode) || !isdefined(self.traversestartnode.type))
	{
		return "NONE";
	}
	return self.traversestartnode.type;
}

/*
	Name: function_b51ae338
	Namespace: aiutility
	Checksum: 0x6B436720
	Offset: 0x89D0
	Size: 0x8E
	Parameters: 0
	Flags: Linked
*/
function function_b51ae338()
{
	if(!isdefined(self.var_15d45247))
	{
		self.var_15d45247 = -1;
		self.var_82a8657 = "";
	}
	currenttime = gettime();
	if(currenttime != self.var_15d45247)
	{
		self.var_15d45247 = currenttime;
		footstep = self function_502c064();
		self.var_82a8657 = footstep;
		return footstep;
	}
	return self.var_82a8657;
}

/*
	Name: function_463cbab0
	Namespace: aiutility
	Checksum: 0x149F7FB1
	Offset: 0x8A68
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function function_463cbab0()
{
	if(isdefined(self.ai.var_9ec404f2))
	{
		return self.ai.var_9ec404f2;
	}
	return (isdefined(self getblackboardattribute("_stance")) ? self getblackboardattribute("_stance") : "stand");
}

/*
	Name: notstandingcondition
	Namespace: aiutility
	Checksum: 0xE12DABCC
	Offset: 0x8AE0
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function notstandingcondition(entity)
{
	if(entity getblackboardattribute("_stance") != "stand")
	{
		return true;
	}
	return false;
}

/*
	Name: notcrouchingcondition
	Namespace: aiutility
	Checksum: 0x1C0AAF8A
	Offset: 0x8B28
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function notcrouchingcondition(entity)
{
	if(entity getblackboardattribute("_stance") != "crouch")
	{
		return true;
	}
	return false;
}

/*
	Name: function_736c20e1
	Namespace: aiutility
	Checksum: 0x8A4213A7
	Offset: 0x8B70
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function function_736c20e1(entity)
{
	if(entity getblackboardattribute("_stance") != "prone")
	{
		return true;
	}
	return false;
}

/*
	Name: function_4aff5b9d
	Namespace: aiutility
	Checksum: 0xF604F587
	Offset: 0x8BB8
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function function_4aff5b9d(entity)
{
	var_899a4d57 = 0;
	if(notstandingcondition(entity))
	{
		if(isdefined(entity.prevnode) && (!iscovernode(entity.prevnode) || !entity function_4c2fffe6(entity.prevnode)))
		{
			var_899a4d57 = 1;
		}
	}
	return var_899a4d57;
}

/*
	Name: function_4fefd9b
	Namespace: aiutility
	Checksum: 0x6A2E12EC
	Offset: 0x8C48
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function function_4fefd9b(entity)
{
	var_a65f9f38 = 0;
	if(gettime() > (isdefined(entity.var_20b5b6da) ? entity.var_20b5b6da : 0))
	{
		if(isdefined(entity.prevnode) && iscovernode(entity.prevnode) && entity function_4c2fffe6(entity.prevnode) && entity nearnode(entity.prevnode))
		{
			exityaw = bb_getlocomotionexityaw();
			if(exityaw > 120 && exityaw < 240)
			{
				tacpoint = function_5e657d(entity.prevnode);
				if(isdefined(tacpoint) && isdefined(entity.enemy) && function_96c81b85(tacpoint, entity.enemy.origin + vectorscale((0, 0, 1), 60)))
				{
					var_a65f9f38 = 1;
				}
			}
		}
	}
	return var_a65f9f38;
}

/*
	Name: function_31cbd57e
	Namespace: aiutility
	Checksum: 0x853834A9
	Offset: 0x8DC0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_31cbd57e(entity)
{
	entity.var_20b5b6da = gettime() + 3000;
	function_2da76de(entity);
}

/*
	Name: scriptstartragdoll
	Namespace: aiutility
	Checksum: 0xAB6B23B3
	Offset: 0x8E00
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function scriptstartragdoll(entity)
{
	entity startragdoll();
	/#
		record3dtext("", entity.origin + vectorscale((0, 0, 1), 4), (1, 0, 0), "", undefined, 0.4);
	#/
}

/*
	Name: prepareforexposedmelee
	Namespace: aiutility
	Checksum: 0x960E2D66
	Offset: 0x8E78
	Size: 0x104
	Parameters: 1
	Flags: Linked, Private
*/
function private prepareforexposedmelee(entity)
{
	keepclaimnode(entity);
	meleeacquiremutex(entity);
	currentstance = entity getblackboardattribute("_stance");
	if(isdefined(entity.enemy) && entity.enemy.scriptvehicletype === "firefly")
	{
		entity setblackboardattribute("_melee_enemy_type", "fireflyswarm");
		entity.var_9af77489 = 1;
	}
	if(currentstance == "crouch")
	{
		entity setblackboardattribute("_desired_stance", "stand");
	}
}

/*
	Name: isfrustrated
	Namespace: aiutility
	Checksum: 0x27AF6E97
	Offset: 0x8F88
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function isfrustrated(entity)
{
	return isdefined(entity.ai.frustrationlevel) && entity.ai.frustrationlevel > 0;
}

/*
	Name: function_22766ccd
	Namespace: aiutility
	Checksum: 0x4930F52B
	Offset: 0x8FD0
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function function_22766ccd(entity)
{
	if(isdefined(entity.ai.frustrationlevel) && entity.ai.frustrationlevel >= 2)
	{
		if(entity isatcovernode())
		{
			var_7153a971 = gettime() - entity.var_79f94433;
			if(var_7153a971 >= 3000)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: flagenemyunattackableservice
	Namespace: aiutility
	Checksum: 0xCA2B402B
	Offset: 0x9060
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function flagenemyunattackableservice(entity)
{
	entity flagenemyunattackable();
}

/*
	Name: islastknownenemypositionapproachable
	Namespace: aiutility
	Checksum: 0x12B72C32
	Offset: 0x9090
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function islastknownenemypositionapproachable(entity)
{
	if(isdefined(entity.enemy))
	{
		lastknownpositionofenemy = entity lastknownpos(entity.enemy);
		if(entity isingoal(lastknownpositionofenemy) && entity findpath(entity.origin, lastknownpositionofenemy, 1, 0))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_d116f6b4
	Namespace: aiutility
	Checksum: 0x346C5E0E
	Offset: 0x9128
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_d116f6b4(entity)
{
	return is_true(entity.fixednode);
}

/*
	Name: tryadvancingonlastknownpositionbehavior
	Namespace: aiutility
	Checksum: 0xC8F5F1FC
	Offset: 0x9158
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function tryadvancingonlastknownpositionbehavior(entity)
{
	if(isdefined(entity.enemy))
	{
		if(is_true(entity.aggressivemode))
		{
			lastknownpositionofenemy = entity lastknownpos(entity.enemy);
			if(entity isingoal(lastknownpositionofenemy) && entity findpath(entity.origin, lastknownpositionofenemy, 1, 0))
			{
				entity function_a57c34b7(lastknownpositionofenemy, lastknownpositionofenemy);
				setnextfindbestcovertime(entity);
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_15b9bbef
	Namespace: aiutility
	Checksum: 0xC01ECF97
	Offset: 0x9240
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function function_15b9bbef(entity)
{
	if(function_d116f6b4(entity) || entity.goalforced)
	{
		return false;
	}
	if(shouldonlyfireaccurately(entity))
	{
		return false;
	}
	if(!isdefined(entity.var_df6c21d4))
	{
		return true;
	}
	if(gettime() > entity.var_df6c21d4)
	{
		return true;
	}
	return false;
}

/*
	Name: trygoingtoclosestnodetoenemybehavior
	Namespace: aiutility
	Checksum: 0x98D21EAB
	Offset: 0x92C8
	Size: 0x3B4
	Parameters: 1
	Flags: Linked
*/
function trygoingtoclosestnodetoenemybehavior(entity)
{
	var_be8baf32 = randomintrange(30000, 60000);
	if(entity.aggressivemode)
	{
		var_be8baf32 = var_be8baf32 / 2;
	}
	entity.var_df6c21d4 = gettime() + var_be8baf32;
	if(isdefined(entity.weapon) && isdefined(entity.weapon.weapclass) && entity.weapon.weapclass == "spread")
	{
		if(!is_true(entity.var_64a1455c) && (isdefined(entity.team) && entity.team !== #"allies"))
		{
			var_75f2bdf3 = tryrunningdirectlytoenemybehavior(entity);
			if(var_75f2bdf3)
			{
				return true;
			}
		}
	}
	if(isdefined(entity.enemy))
	{
		lastknownpositionofenemy = entity lastknownpos(entity.enemy);
		closestrandomnode = undefined;
		nodes = entity findbestcovernodes();
		if(nodes.size > 0)
		{
			var_e416dc99 = [];
			foreach(node in nodes)
			{
				if(node.spawnflags & 128)
				{
					var_e416dc99[var_e416dc99.size] = node;
					continue;
				}
				nodedir = anglestoforward(node.angles);
				dirtoenemy = vectornormalize((lastknownpositionofenemy - node.origin) * (1, 1, 0));
				dot = vectordot(nodedir, dirtoenemy);
				if(dot > 0.5)
				{
					var_e416dc99[var_e416dc99.size] = node;
				}
			}
			if(var_e416dc99.size > 0)
			{
				nodes = var_e416dc99;
			}
			var_abe95912 = min(nodes.size, 15);
			bestnodes = array::slice(nodes, 0, var_abe95912 - 1);
			var_1a11849e = arraysortclosest(bestnodes, lastknownpositionofenemy, 1);
			closestrandomnode = var_1a11849e[0];
		}
		if(isdefined(closestrandomnode) && entity isingoal(closestrandomnode.origin))
		{
			releaseclaimnode(entity);
			usecovernodewrapper(entity, closestrandomnode);
			return true;
		}
	}
	return false;
}

/*
	Name: tryrunningdirectlytoenemybehavior
	Namespace: aiutility
	Checksum: 0x6EBDFFA9
	Offset: 0x9688
	Size: 0x22C
	Parameters: 1
	Flags: Linked
*/
function tryrunningdirectlytoenemybehavior(entity)
{
	if(isdefined(entity.enemy) && is_true(entity.aggressivemode))
	{
		origin = entity.enemy.origin;
		var_4bb69ed1 = 0;
		if(entity isingoal(origin))
		{
			var_4bb69ed1 = 1;
		}
		else
		{
			var_1f2328d0 = self function_4794d6a3();
			if(isdefined(var_1f2328d0.goalvolume))
			{
				var_28fe9101 = var_1f2328d0.goalvolume.maxs - var_1f2328d0.goalvolume.mins;
				var_2e7904ce = (var_28fe9101[0] + var_28fe9101[1]) / 2;
				var_9fd6b922 = var_2e7904ce * 0.5;
				var_7ccdb9a2 = function_1ec73db4(origin, var_1f2328d0.goalvolume);
				if(var_7ccdb9a2 < var_9fd6b922)
				{
					var_4bb69ed1 = 1;
				}
			}
			else
			{
				var_d1530255 = var_1f2328d0.goalradius * 0.5;
				var_30a12270 = distance(origin, var_1f2328d0.goalpos) - var_1f2328d0.goalradius;
				if(var_30a12270 < var_d1530255)
				{
					var_4bb69ed1 = 1;
				}
			}
		}
		if(var_4bb69ed1 && entity findpath(entity.origin, origin, 1, 0))
		{
			function_106ea3ab(entity, origin);
			thread function_97d5dde9(entity, entity.enemy);
			return true;
		}
	}
	return false;
}

/*
	Name: function_106ea3ab
	Namespace: aiutility
	Checksum: 0x68FD75E8
	Offset: 0x98C0
	Size: 0x8A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_106ea3ab(entity, origin)
{
	entity function_a57c34b7(origin, undefined, "run_to_enemy");
	releaseclaimnode(entity);
	setnextfindbestcovertime(entity);
	if(entity.nextfindbestcovertime - gettime() < 20000)
	{
		entity.nextfindbestcovertime = gettime() + 20000;
	}
}

/*
	Name: function_97d5dde9
	Namespace: aiutility
	Checksum: 0x2859F971
	Offset: 0x9958
	Size: 0x140
	Parameters: 2
	Flags: Linked, Private
*/
function private function_97d5dde9(entity, currentenemy)
{
	entity endon(#"death", #"entitydeleted");
	self notify("211f330ef7acd8a6");
	self endon("211f330ef7acd8a6");
	while(true)
	{
		if(!isdefined(entity.enemy))
		{
			entity function_d4c687c9();
			return;
		}
		if(entity.enemy != currentenemy)
		{
			function_106ea3ab(entity, entity.enemy.origin);
			currentenemy = entity.enemy;
		}
		if(gettime() > entity.nextfindbestcovertime)
		{
			entity function_d4c687c9();
			return;
		}
		if(entity cansee(entity.enemy))
		{
			function_106ea3ab(entity, entity.enemy.origin);
		}
		wait(1);
	}
}

/*
	Name: shouldreacttonewenemy
	Namespace: aiutility
	Checksum: 0xDD16F908
	Offset: 0x9AA0
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function shouldreacttonewenemy(entity)
{
	return false;
}

/*
	Name: hasweaponmalfunctioned
	Namespace: aiutility
	Checksum: 0xD4EB57B0
	Offset: 0x9B40
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function hasweaponmalfunctioned(entity)
{
	return is_true(entity.malfunctionreaction);
}

/*
	Name: function_2de6da8
	Namespace: aiutility
	Checksum: 0x8AE3D2F3
	Offset: 0x9B70
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function function_2de6da8(entity)
{
	if(entity ai::get_behavior_attribute("disablereload"))
	{
		return true;
	}
	if(btapi_hasammo(entity) || function_5ac894ba(entity))
	{
		return true;
	}
	return false;
}

/*
	Name: function_a9bc841
	Namespace: aiutility
	Checksum: 0x45B0DFC5
	Offset: 0x9BE8
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function function_a9bc841(entity)
{
	if(entity ai::get_behavior_attribute("disablereload"))
	{
		return false;
	}
	if(btapi_haslowammo(entity) && !function_5ac894ba(entity))
	{
		return true;
	}
	return false;
}

/*
	Name: function_e0454a8b
	Namespace: aiutility
	Checksum: 0xC2BD2989
	Offset: 0x9C60
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_e0454a8b(entity)
{
	if(btapi_hasenemy(entity))
	{
		return true;
	}
	if(isdefined(entity.var_38754eac))
	{
		return true;
	}
	return false;
}

/*
	Name: issafefromgrenades
	Namespace: aiutility
	Checksum: 0xD0E3FDF0
	Offset: 0x9CB0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function issafefromgrenades(entity)
{
	return entity issafefromgrenade();
}

/*
	Name: function_f557fb8b
	Namespace: aiutility
	Checksum: 0x400C461A
	Offset: 0x9CE0
	Size: 0x96
	Parameters: 2
	Flags: Linked
*/
function function_f557fb8b(entity, var_7a033306)
{
	if(isdefined(var_7a033306))
	{
		if(!entity function_e8448790(var_7a033306))
		{
			return false;
		}
		if(entity function_3f7004eb(var_7a033306))
		{
			return false;
		}
	}
	else
	{
		if(!issafefromgrenades(entity))
		{
			return false;
		}
		if(!entity function_b6149e2e())
		{
			return false;
		}
	}
	return true;
}

/*
	Name: recentlysawenemy
	Namespace: aiutility
	Checksum: 0xE806A658
	Offset: 0x9D80
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function recentlysawenemy(entity)
{
	if(isdefined(entity.enemy) && entity seerecently(entity.enemy, 6))
	{
		return true;
	}
	return false;
}

/*
	Name: shouldonlyfireaccurately
	Namespace: aiutility
	Checksum: 0x4DFB5949
	Offset: 0x9DD8
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function shouldonlyfireaccurately(entity)
{
	if(is_true(entity.accuratefire))
	{
		return true;
	}
	return false;
}

/*
	Name: canblindfire
	Namespace: aiutility
	Checksum: 0x62300AC3
	Offset: 0x9E10
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function canblindfire(entity)
{
	if(is_true(entity.var_57314c74))
	{
		return true;
	}
	return false;
}

/*
	Name: shouldbeaggressive
	Namespace: aiutility
	Checksum: 0x825EE76E
	Offset: 0x9E48
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function shouldbeaggressive(entity)
{
	if(is_true(entity.aggressivemode))
	{
		return true;
	}
	return false;
}

/*
	Name: usecovernodewrapper
	Namespace: aiutility
	Checksum: 0xD2064296
	Offset: 0x9E80
	Size: 0xEE
	Parameters: 2
	Flags: Linked
*/
function usecovernodewrapper(entity, node)
{
	samenode = entity.node === node;
	entity usecovernode(node);
	if(!samenode)
	{
		entity setblackboardattribute("_cover_mode", "cover_mode_none");
		entity setblackboardattribute("_previous_cover_mode", "cover_mode_none");
	}
	if(samenode)
	{
		setnextfindbestcovertime(entity);
	}
	else
	{
		entity.var_11b1735a = 1;
	}
	entity.ai.var_47823ae7 = gettime() + 1000;
}

/*
	Name: function_3823e69e
	Namespace: aiutility
	Checksum: 0x73BB2A02
	Offset: 0x9F78
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function function_3823e69e(entity)
{
	var_f4406fbd = 0;
	if(is_true(entity.var_11b1735a))
	{
		var_f4406fbd = 1;
		if(isdefined(entity.node))
		{
			offsetorigin = entity getnodeoffsetposition(entity.node);
			if(!entity isposatgoal(offsetorigin))
			{
				var_f4406fbd = 0;
			}
		}
	}
	if(var_f4406fbd)
	{
		setnextfindbestcovertime(entity);
		entity.var_79f94433 = gettime();
		entity.var_11b1735a = undefined;
	}
}

/*
	Name: setnextfindbestcovertime
	Namespace: aiutility
	Checksum: 0xF984DDDD
	Offset: 0xA050
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function setnextfindbestcovertime(entity)
{
	entity.nextfindbestcovertime = entity getnextfindbestcovertime();
}

/*
	Name: choosebestcovernodeasap
	Namespace: aiutility
	Checksum: 0xF0332F54
	Offset: 0xA088
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function choosebestcovernodeasap(entity)
{
	node = getbestcovernodeifavailable(entity);
	if(isdefined(node))
	{
		releaseclaimnode(entity);
		usecovernodewrapper(entity, node);
	}
}

/*
	Name: function_c1ac838a
	Namespace: aiutility
	Checksum: 0x47F064F6
	Offset: 0xA0F8
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_c1ac838a(entity)
{
	var_eddf1d34 = function_f557fb8b(entity);
	if(!var_eddf1d34)
	{
		node = getbestcovernodeifavailable(entity);
		if(isdefined(node))
		{
			if(isdefined(entity.node) && !var_eddf1d34 && !function_f557fb8b(entity, node.origin))
			{
				node = undefined;
			}
		}
		if(isdefined(node))
		{
			releaseclaimnode(entity);
			usecovernodewrapper(entity, node);
		}
	}
}

/*
	Name: function_589c524f
	Namespace: aiutility
	Checksum: 0x9609CA21
	Offset: 0xA1D8
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_589c524f(entity)
{
	var_edbb5c0d = 0;
	if(isdefined(entity.ai.var_bb3caa0f))
	{
		var_1f2328d0 = self function_4794d6a3();
		if(isdefined(var_1f2328d0.overridegoalpos))
		{
			if(var_1f2328d0.var_93096ed5 === "exposed_reacquire")
			{
				var_edbb5c0d = 1;
			}
		}
	}
	if(var_edbb5c0d)
	{
		if(!var_1f2328d0.var_9e404264)
		{
			return 1;
		}
		curtime = gettime();
		var_20d51dfe = gettime() - entity.ai.var_bb3caa0f;
		var_5b03a551 = var_20d51dfe >= 5000;
		if(!var_5b03a551)
		{
			return 2;
		}
		var_bb5564f2 = var_20d51dfe > 30000;
		if(!var_bb5564f2)
		{
			return 3;
		}
		return 4;
	}
	return 0;
}

/*
	Name: choosebettercoverservicecodeversion
	Namespace: aiutility
	Checksum: 0xC40C68AC
	Offset: 0xA300
	Size: 0x30E
	Parameters: 1
	Flags: Linked
*/
function choosebettercoverservicecodeversion(entity)
{
	if(!isalive(entity))
	{
		return false;
	}
	if(isdefined(entity.stealth) && entity ai::get_behavior_attribute("stealth"))
	{
		return false;
	}
	if(is_true(entity.fixednode))
	{
		var_d4302a98 = 0;
		if(isdefined(entity getgoalvolume()))
		{
			if(!isdefined(entity.node) || !entity isapproachinggoal())
			{
				var_d4302a98 = 1;
			}
		}
		if(!var_d4302a98)
		{
			return false;
		}
	}
	if(is_true(entity.avoid_cover))
	{
		return false;
	}
	var_eddf1d34 = function_f557fb8b(entity);
	if(var_eddf1d34)
	{
		if(entity isatcovernode() && issuppressedatcovercondition(entity))
		{
			return false;
		}
		if(function_22766ccd(entity) && function_15b9bbef(entity))
		{
			return false;
		}
	}
	var_d78ca29a = function_589c524f(entity);
	if(var_d78ca29a == 1 || var_d78ca29a == 2)
	{
		return false;
	}
	if(is_true(entity.keepclaimednode))
	{
		return false;
	}
	var_eef1785f = !is_true(entity.var_11b1735a);
	newnode = entity choosebettercovernode(1, !var_eef1785f);
	if(isdefined(newnode))
	{
		if(isdefined(entity.node) && !var_eddf1d34 && !function_f557fb8b(entity))
		{
			newnode = undefined;
		}
	}
	if(isdefined(newnode))
	{
		usecovernodewrapper(entity, newnode);
		return true;
	}
	var_c8d2b0aa = is_true(entity.var_11b1735a);
	if(gettime() > entity.nextfindbestcovertime && !var_c8d2b0aa)
	{
		setnextfindbestcovertime(entity);
	}
	return false;
}

/*
	Name: sensenearbyplayers
	Namespace: aiutility
	Checksum: 0xAFF7E54
	Offset: 0xA618
	Size: 0x2D0
	Parameters: 1
	Flags: Linked, Private
*/
function private sensenearbyplayers(entity)
{
	if(isdefined(entity.stealth) && entity ai::get_behavior_attribute("stealth"))
	{
		return false;
	}
	var_821a7a87 = getplayers();
	if(entity.team === #"allies")
	{
		allai = getaiarray();
		foreach(ai in allai)
		{
			if(ai.team === #"axis")
			{
				array::add(var_821a7a87, ai);
			}
		}
	}
	foreach(target in var_821a7a87)
	{
		distancesq = distancesquared(target.origin, entity.origin);
		if(isdefined(entity.ai.var_5a4e769f))
		{
			var_89f8daa2 = entity.ai.var_5a4e769f;
			var_f7df3136 = sqr(var_89f8daa2);
		}
		else
		{
			var_89f8daa2 = 360;
			var_f7df3136 = sqr(360);
		}
		if(distancesq <= var_f7df3136)
		{
			distancetotarget = sqrt(distancesq);
			randchance = 1 - (distancetotarget / var_89f8daa2);
			var_56e2d5dc = randomfloat(1);
			if(var_56e2d5dc < randchance)
			{
				entity getperfectinfo(target);
			}
		}
	}
}

/*
	Name: function_4755155f
	Namespace: aiutility
	Checksum: 0x6AF4E833
	Offset: 0xA8F0
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4755155f(entity)
{
	btapi_trackcoverparamsservice(entity);
}

/*
	Name: function_43a090a8
	Namespace: aiutility
	Checksum: 0x17302DA7
	Offset: 0xA920
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_43a090a8(entity)
{
	entity.ai.reloading = 1;
}

/*
	Name: function_dc44803c
	Namespace: aiutility
	Checksum: 0x38189D4E
	Offset: 0xA950
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function function_dc44803c(entity)
{
	function_95b98edf(entity);
	entity.ai.reloading = 0;
	if(isdefined(entity.var_bd5efde2))
	{
		animationstatenetwork::function_9d41000(entity);
	}
	if(isdefined(entity.var_af41987d) && entity haspart(entity.var_af41987d))
	{
		entity showpart(entity.var_af41987d);
	}
	if(isdefined(entity.var_91d2328b) && entity haspart(entity.var_91d2328b))
	{
		entity showpart(entity.var_91d2328b);
	}
}

/*
	Name: function_a7abd081
	Namespace: aiutility
	Checksum: 0x6E87E34F
	Offset: 0xAA58
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a7abd081(entity)
{
}

/*
	Name: getbestcovernodeifavailable
	Namespace: aiutility
	Checksum: 0xD03F3B38
	Offset: 0xAA70
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function getbestcovernodeifavailable(entity)
{
	node = entity findbestcovernode();
	if(!isdefined(node))
	{
		return undefined;
	}
	if(entity nearclaimnode())
	{
		currentnode = self.node;
	}
	if(isdefined(currentnode) && node == currentnode)
	{
		return undefined;
	}
	if(isdefined(entity.covernode) && node == entity.covernode)
	{
		return undefined;
	}
	return node;
}

/*
	Name: getsecondbestcovernodeifavailable
	Namespace: aiutility
	Checksum: 0xB1999DF2
	Offset: 0xAB20
	Size: 0xCA
	Parameters: 1
	Flags: None
*/
function getsecondbestcovernodeifavailable(entity)
{
	nodes = entity findbestcovernodes();
	if(nodes.size > 1)
	{
		node = nodes[1];
	}
	if(!isdefined(node))
	{
		return undefined;
	}
	if(entity nearclaimnode())
	{
		currentnode = self.node;
	}
	if(isdefined(currentnode) && node == currentnode)
	{
		return undefined;
	}
	if(isdefined(entity.covernode) && node == entity.covernode)
	{
		return undefined;
	}
	return node;
}

/*
	Name: getcovertype
	Namespace: aiutility
	Checksum: 0xEBAFBBE8
	Offset: 0xABF8
	Size: 0x1C6
	Parameters: 1
	Flags: Linked
*/
function getcovertype(node)
{
	if(isdefined(node))
	{
		if(node.type == #"hash_7a0e62fbbe3989d4")
		{
			return "cover_pillar";
		}
		if(node.type == #"hash_63cbb4767da2a801")
		{
			return "cover_left";
		}
		if(node.type == #"hash_2a7b1ca393696762")
		{
			return "cover_right";
		}
		if(node.type == #"hash_581529fff05853f0" || node.type == #"hash_1bb444d857814e92")
		{
			return "cover_stand";
		}
		if(node.type == #"hash_6d8019ab9d39bf96" || node.type == #"hash_280d1247a6abdbae" || node.type == #"hash_171465527444ed14")
		{
			return "cover_crouch";
		}
		if(node.type == #"exposed" || node.type == #"guard")
		{
			return "cover_exposed";
		}
		if(node.type == #"turret")
		{
			return "cover_turret";
		}
	}
	return "cover_none";
}

/*
	Name: iscoverconcealed
	Namespace: aiutility
	Checksum: 0x4269E641
	Offset: 0xADC8
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function iscoverconcealed(node)
{
	if(isdefined(node))
	{
		return node.type == #"hash_171465527444ed14" || node.type == #"hash_1bb444d857814e92";
	}
	return 0;
}

/*
	Name: canseeenemywrapper
	Namespace: aiutility
	Checksum: 0x5114600A
	Offset: 0xAE28
	Size: 0x492
	Parameters: 0
	Flags: None
*/
function canseeenemywrapper()
{
	if(!isdefined(self.enemy))
	{
		return 0;
	}
	if(!isdefined(self.node))
	{
		return self cansee(self.enemy);
	}
	node = self.node;
	enemyeye = self.enemy geteye();
	yawtoenemy = angleclamp180(node.angles[1] - (vectortoangles(enemyeye - node.origin)[1]));
	if(node.type == #"hash_63cbb4767da2a801" || node.type == #"hash_2a7b1ca393696762")
	{
		if(yawtoenemy > 60 || yawtoenemy < -60)
		{
			return 0;
		}
		if(self function_c97b59f8("stand", node))
		{
			if(node.type == #"hash_63cbb4767da2a801" && yawtoenemy > 10)
			{
				return 0;
			}
			if(node.type == #"hash_2a7b1ca393696762" && yawtoenemy < -10)
			{
				return 0;
			}
		}
	}
	nodeoffset = (0, 0, 0);
	if(node.type == #"hash_7a0e62fbbe3989d4")
	{
		/#
			assert(!(isdefined(node.spawnflags) && (node.spawnflags & 2048) == 2048) || (!(isdefined(node.spawnflags) && (node.spawnflags & 1024) == 1024)));
		#/
		canseefromleft = 1;
		canseefromright = 1;
		nodeoffset = (-32, 3.7, 60);
		lookfrompoint = calculatenodeoffsetposition(node, nodeoffset);
		canseefromleft = sighttracepassed(lookfrompoint, enemyeye, 0, undefined);
		nodeoffset = (32, 3.7, 60);
		lookfrompoint = calculatenodeoffsetposition(node, nodeoffset);
		canseefromright = sighttracepassed(lookfrompoint, enemyeye, 0, undefined);
		return canseefromright || canseefromleft;
	}
	if(node.type == #"hash_63cbb4767da2a801")
	{
		nodeoffset = (-36, 7, 63);
	}
	else
	{
		if(node.type == #"hash_2a7b1ca393696762")
		{
			nodeoffset = (36, 7, 63);
		}
		else
		{
			if(node.type == #"hash_581529fff05853f0" || node.type == #"hash_1bb444d857814e92")
			{
				nodeoffset = (-3.7, -22, 63);
			}
			else if(node.type == #"hash_6d8019ab9d39bf96" || node.type == #"hash_280d1247a6abdbae" || node.type == #"hash_171465527444ed14")
			{
				nodeoffset = (3.5, -12.5, 45);
			}
		}
	}
	lookfrompoint = calculatenodeoffsetposition(node, nodeoffset);
	if(sighttracepassed(lookfrompoint, enemyeye, 0, undefined))
	{
		return 1;
	}
	return 0;
}

/*
	Name: calculatenodeoffsetposition
	Namespace: aiutility
	Checksum: 0xB2F90B72
	Offset: 0xB2C8
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function calculatenodeoffsetposition(node, nodeoffset)
{
	right = anglestoright(node.angles);
	forward = anglestoforward(node.angles);
	return (node.origin + vectorscale(right, nodeoffset[0])) + vectorscale(forward, nodeoffset[1]) + (0, 0, nodeoffset[2]);
}

/*
	Name: gethighestnodestance
	Namespace: aiutility
	Checksum: 0xBB1277BB
	Offset: 0xB368
	Size: 0x49A
	Parameters: 1
	Flags: Linked
*/
function gethighestnodestance(node)
{
	/#
		assert(isdefined(node));
	#/
	/#
		assert(isdefined(self));
	#/
	if(self function_c97b59f8("stand", node))
	{
		return "stand";
	}
	if(self function_c97b59f8("crouch", node))
	{
		return "crouch";
	}
	if(self function_c97b59f8("prone", node))
	{
		return "prone";
	}
	/#
		var_f078bbdd = [];
		if(doesnodeallowstance(node, ""))
		{
			var_f078bbdd[var_f078bbdd.size] = "";
		}
		if(doesnodeallowstance(node, ""))
		{
			var_f078bbdd[var_f078bbdd.size] = "";
		}
		if(doesnodeallowstance(node, ""))
		{
			var_f078bbdd[var_f078bbdd.size] = "";
		}
		var_58cb7691 = [];
		if(self function_f0e4aede("", node))
		{
			var_58cb7691[var_58cb7691.size] = "";
		}
		if(self function_f0e4aede("", node))
		{
			var_58cb7691[var_58cb7691.size] = "";
		}
		if(self function_f0e4aede("", node))
		{
			var_58cb7691[var_58cb7691.size] = "";
		}
		msg1 = ((((("" + self.aitype) + "") + node.type) + "") + node.origin) + "";
		msg2 = "";
		if(var_f078bbdd.size == 0)
		{
			msg2 = msg2 + "";
		}
		else
		{
			foreach(stance in var_f078bbdd)
			{
				msg2 = msg2 + (("" + stance) + "");
			}
		}
		msg2 = msg2 + "";
		msg3 = "";
		if(var_58cb7691.size == 0)
		{
			msg3 = msg3 + "";
		}
		else
		{
			foreach(stance in var_58cb7691)
			{
				msg3 = msg3 + (("" + stance) + "");
			}
		}
		msg3 = msg3 + "";
		errormsg((((("" + msg1) + "") + msg2) + "") + msg3);
	#/
	if(node.type == #"hash_6d8019ab9d39bf96" || node.type == #"hash_280d1247a6abdbae" || node.type == #"hash_171465527444ed14")
	{
		return "crouch";
	}
	return "stand";
}

/*
	Name: function_c97b59f8
	Namespace: aiutility
	Checksum: 0x60F4A4E7
	Offset: 0xB810
	Size: 0x108
	Parameters: 2
	Flags: Linked
*/
function function_c97b59f8(stance, node)
{
	/#
		assert(isdefined(stance));
	#/
	/#
		assert(isdefined(node) && ispathnode(node));
	#/
	/#
		assert(isdefined(self) && isactor(self));
	#/
	if(ispathnode(node) && isactor(self) && isdefined(stance))
	{
		return doesnodeallowstance(node, stance) && self function_f0e4aede(stance, node);
	}
	return 0;
}

/*
	Name: trystoppingservice
	Namespace: aiutility
	Checksum: 0x553156A2
	Offset: 0xB920
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function trystoppingservice(entity)
{
	if(entity shouldholdgroundagainstenemy())
	{
		entity clearpath();
		keepclaimnode(entity);
		return true;
	}
	releaseclaimnode(entity);
	return false;
}

/*
	Name: shouldstopmoving
	Namespace: aiutility
	Checksum: 0x391A492B
	Offset: 0xB998
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function shouldstopmoving(entity)
{
	if(entity shouldholdgroundagainstenemy())
	{
		return true;
	}
	return false;
}

/*
	Name: setcurrentweapon
	Namespace: aiutility
	Checksum: 0xF48BF322
	Offset: 0xB9D0
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function setcurrentweapon(weapon)
{
	self.weapon = weapon;
	self.weaponclass = weapon.weapclass;
	if(weapon != level.weaponnone)
	{
		/#
			assert(isdefined(weapon.worldmodel), ("" + weapon.name) + "");
		#/
	}
	self.weaponmodel = weapon.worldmodel;
}

/*
	Name: setprimaryweapon
	Namespace: aiutility
	Checksum: 0xA972902A
	Offset: 0xBA68
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function setprimaryweapon(weapon)
{
	self.primaryweapon = weapon;
	self.primaryweaponclass = weapon.weapclass;
	if(weapon != level.weaponnone)
	{
		/#
			assert(isdefined(weapon.worldmodel), ("" + weapon.name) + "");
		#/
	}
}

/*
	Name: setsecondaryweapon
	Namespace: aiutility
	Checksum: 0x13104A83
	Offset: 0xBAF0
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function setsecondaryweapon(weapon)
{
	self.secondaryweapon = weapon;
	self.secondaryweaponclass = weapon.weapclass;
	if(weapon != level.weaponnone)
	{
		/#
			assert(isdefined(weapon.worldmodel), ("" + weapon.name) + "");
		#/
	}
}

/*
	Name: keepclaimnode
	Namespace: aiutility
	Checksum: 0xB0F2198F
	Offset: 0xBB78
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function keepclaimnode(entity)
{
	entity.keepclaimednode = 1;
	return true;
}

/*
	Name: releaseclaimnode
	Namespace: aiutility
	Checksum: 0x7515C713
	Offset: 0xBBA0
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function releaseclaimnode(entity)
{
	entity.keepclaimednode = 0;
	return true;
}

/*
	Name: function_8b760d36
	Namespace: aiutility
	Checksum: 0x702190EF
	Offset: 0xBBC8
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_8b760d36(entity)
{
	if(entity isingoal(entity.origin))
	{
		return true;
	}
	return false;
}

/*
	Name: getaimyawtoenemyfromnode
	Namespace: aiutility
	Checksum: 0xAC42D8C1
	Offset: 0xBC08
	Size: 0x7A
	Parameters: 3
	Flags: Linked
*/
function getaimyawtoenemyfromnode(entity, node, enemy)
{
	return angleclamp180((vectortoangles(node lastknownpos(node.enemy) - enemy.origin)[1]) - enemy.angles[1]);
}

/*
	Name: getaimpitchtoenemyfromnode
	Namespace: aiutility
	Checksum: 0x215B8EE8
	Offset: 0xBC90
	Size: 0x7A
	Parameters: 3
	Flags: Linked
*/
function getaimpitchtoenemyfromnode(entity, node, enemy)
{
	return angleclamp180((vectortoangles(node lastknownpos(node.enemy) - enemy.origin)[0]) - enemy.angles[0]);
}

/*
	Name: choosefrontcoverdirection
	Namespace: aiutility
	Checksum: 0xD42DFE4D
	Offset: 0xBD18
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function choosefrontcoverdirection(entity)
{
	coverdirection = entity getblackboardattribute("_cover_direction");
	entity setblackboardattribute("_previous_cover_direction", coverdirection);
	entity setblackboardattribute("_cover_direction", "cover_front_direction");
}

/*
	Name: locomotionshouldpatrol
	Namespace: aiutility
	Checksum: 0x663C5AAC
	Offset: 0xBDA0
	Size: 0x70
	Parameters: 1
	Flags: None
*/
function locomotionshouldpatrol(entity)
{
	if(entity haspath() && entity ai::has_behavior_attribute("patrol") && entity ai::get_behavior_attribute("patrol"))
	{
		return true;
	}
	return false;
}

/*
	Name: _dropriotshield
	Namespace: aiutility
	Checksum: 0xECD0CBB7
	Offset: 0xBE18
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private _dropriotshield(riotshieldinfo)
{
	entity = self;
	entity shared::throwweapon(riotshieldinfo.weapon, riotshieldinfo.tag, 1, 0);
	if(isdefined(entity))
	{
		entity detach(riotshieldinfo.model, riotshieldinfo.tag);
	}
}

/*
	Name: attachriotshield
	Namespace: aiutility
	Checksum: 0x2FA6FC2E
	Offset: 0xBE98
	Size: 0x92
	Parameters: 4
	Flags: None
*/
function attachriotshield(entity, riotshieldweapon, riotshieldmodel, riotshieldtag)
{
	riotshield = spawnstruct();
	riotshield.weapon = riotshieldweapon;
	riotshield.tag = riotshieldtag;
	riotshield.model = riotshieldmodel;
	entity attach(riotshieldmodel, riotshield.tag);
	entity.riotshield = riotshield;
}

/*
	Name: dropriotshield
	Namespace: aiutility
	Checksum: 0x295CCE22
	Offset: 0xBF38
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function dropriotshield(entity)
{
	if(isdefined(entity.riotshield))
	{
		riotshieldinfo = entity.riotshield;
		entity.riotshield = undefined;
		entity thread _dropriotshield(riotshieldinfo);
	}
}

/*
	Name: meleeacquiremutex
	Namespace: aiutility
	Checksum: 0x13B54B4E
	Offset: 0xBF98
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function meleeacquiremutex(entity)
{
	if(isdefined(entity) && isdefined(entity.enemy))
	{
		entity.meleeenemy = entity.enemy;
		if(isplayer(entity.meleeenemy))
		{
			if(!isdefined(entity.meleeenemy.meleeattackers))
			{
				entity.meleeenemy.meleeattackers = 0;
			}
			entity.meleeenemy.meleeattackers++;
		}
	}
}

/*
	Name: meleereleasemutex
	Namespace: aiutility
	Checksum: 0xBD8F923C
	Offset: 0xC030
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function meleereleasemutex(entity)
{
	if(isdefined(entity.meleeenemy))
	{
		if(isplayer(entity.meleeenemy))
		{
			if(isdefined(entity.meleeenemy.meleeattackers))
			{
				entity.meleeenemy.meleeattackers = entity.meleeenemy.meleeattackers - 1;
				if(entity.meleeenemy.meleeattackers <= 0)
				{
					entity.meleeenemy.meleeattackers = undefined;
				}
			}
		}
	}
	entity.meleeenemy = undefined;
}

/*
	Name: shouldmutexmelee
	Namespace: aiutility
	Checksum: 0x78011D26
	Offset: 0xC0E8
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function shouldmutexmelee(entity)
{
	return function_3d91d94b(entity);
}

/*
	Name: shouldnormalmelee
	Namespace: aiutility
	Checksum: 0x4B2A8375
	Offset: 0xC118
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function shouldnormalmelee(entity)
{
	return hascloseenemytomelee(entity);
}

/*
	Name: shouldmelee
	Namespace: aiutility
	Checksum: 0x5C69532B
	Offset: 0xC148
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function shouldmelee(entity)
{
	return btapi_shouldmelee(entity);
}

/*
	Name: hascloseenemytomelee
	Namespace: aiutility
	Checksum: 0xF238012D
	Offset: 0xC178
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function hascloseenemytomelee(entity)
{
	return btapi_shouldnormalmelee(entity);
}

/*
	Name: shouldchargemelee
	Namespace: aiutility
	Checksum: 0xC69EC8D8
	Offset: 0xC1A8
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function shouldchargemelee(entity)
{
	return btapi_shouldchargemelee(entity);
}

/*
	Name: setupchargemeleeattack
	Namespace: aiutility
	Checksum: 0x989FD857
	Offset: 0xC1D8
	Size: 0x104
	Parameters: 1
	Flags: Linked, Private
*/
function private setupchargemeleeattack(entity)
{
	if(isdefined(entity.enemy) && entity.enemy.scriptvehicletype === "firefly")
	{
		entity setblackboardattribute("_melee_enemy_type", "fireflyswarm");
		entity.var_9af77489 = 1;
	}
	meleeacquiremutex(entity);
	keepclaimnode(entity);
	/#
		record3dtext("" + distance(self.origin, self.enemy.origin), self.origin + vectorscale((0, 0, 1), 64), (1, 0, 0), "");
	#/
}

/*
	Name: cleanupmelee
	Namespace: aiutility
	Checksum: 0x9B2B192E
	Offset: 0xC2E8
	Size: 0x104
	Parameters: 1
	Flags: Linked, Private
*/
function private cleanupmelee(entity)
{
	meleereleasemutex(entity);
	releaseclaimnode(entity);
	if(is_true(entity.var_9af77489))
	{
		entity setblackboardattribute("_melee_enemy_type", undefined);
		entity.var_9af77489 = undefined;
	}
	if(isdefined(entity.ai.var_aba9dcfd) && isdefined(entity.ai.var_38ee3a42))
	{
		entity pathmode("move delayed", 1, randomfloatrange(entity.ai.var_aba9dcfd, entity.ai.var_38ee3a42));
	}
}

/*
	Name: cleanupchargemelee
	Namespace: aiutility
	Checksum: 0xB71F3C22
	Offset: 0xC3F8
	Size: 0xDC
	Parameters: 1
	Flags: Linked, Private
*/
function private cleanupchargemelee(entity)
{
	entity.ai.nextchargemeleetime = gettime() + 2000;
	if(is_true(entity.var_9af77489))
	{
		entity setblackboardattribute("_melee_enemy_type", undefined);
		entity.var_9af77489 = undefined;
	}
	meleereleasemutex(entity);
	releaseclaimnode(entity);
	entity pathmode("move delayed", 1, randomfloatrange(0.75, 1.5));
}

/*
	Name: cleanupchargemeleeattack
	Namespace: aiutility
	Checksum: 0x715962CC
	Offset: 0xC4E0
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function cleanupchargemeleeattack(entity)
{
	meleereleasemutex(entity);
	releaseclaimnode(entity);
	if(is_true(entity.var_9af77489))
	{
		entity setblackboardattribute("_melee_enemy_type", undefined);
		entity.var_9af77489 = undefined;
	}
	if(isdefined(entity.ai.var_aba9dcfd) && isdefined(entity.ai.var_38ee3a42))
	{
		entity pathmode("move delayed", 1, randomfloatrange(entity.ai.var_aba9dcfd, entity.ai.var_38ee3a42));
	}
	else
	{
		entity pathmode("move delayed", 1, randomfloatrange(0.5, 1));
	}
}

/*
	Name: shouldchoosespecialpronepain
	Namespace: aiutility
	Checksum: 0xA15F5905
	Offset: 0xC630
	Size: 0x56
	Parameters: 1
	Flags: Linked, Private
*/
function private shouldchoosespecialpronepain(entity)
{
	stance = entity getblackboardattribute("_stance");
	return stance == "prone_back" || stance == "prone_front";
}

/*
	Name: function_9b0e7a22
	Namespace: aiutility
	Checksum: 0xDA23929B
	Offset: 0xC690
	Size: 0x20
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9b0e7a22(entity)
{
	return entity.var_40543c03 === "concussion";
}

/*
	Name: function_3769693b
	Namespace: aiutility
	Checksum: 0x549DAA87
	Offset: 0xC6B8
	Size: 0x20
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3769693b(entity)
{
	return entity.var_40543c03 === "fire";
}

/*
	Name: shouldchoosespecialpain
	Namespace: aiutility
	Checksum: 0x73A589F2
	Offset: 0xC6E0
	Size: 0xE
	Parameters: 1
	Flags: Linked, Private
*/
function private shouldchoosespecialpain(entity)
{
	return false;
}

/*
	Name: function_89cb7bfd
	Namespace: aiutility
	Checksum: 0x46945787
	Offset: 0xC6F8
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_89cb7bfd(entity)
{
	return entity.var_ab2486b4;
}

/*
	Name: shouldchoosespecialdeath
	Namespace: aiutility
	Checksum: 0xC07C2D23
	Offset: 0xC718
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private shouldchoosespecialdeath(entity)
{
	if(isdefined(entity.damageweapon))
	{
		return entity.damageweapon.specialpain;
	}
	return 0;
}

/*
	Name: shouldchoosespecialpronedeath
	Namespace: aiutility
	Checksum: 0x1D92E328
	Offset: 0xC758
	Size: 0x56
	Parameters: 1
	Flags: Linked, Private
*/
function private shouldchoosespecialpronedeath(entity)
{
	stance = entity getblackboardattribute("_stance");
	return stance == "prone_back" || stance == "prone_front";
}

/*
	Name: setupexplosionanimscale
	Namespace: aiutility
	Checksum: 0x5A187C0D
	Offset: 0xC7B8
	Size: 0x40
	Parameters: 2
	Flags: Linked, Private
*/
function private setupexplosionanimscale(entity, asmstatename)
{
	self.animtranslationscale = 2;
	self asmsetanimationrate(0.7);
	return 4;
}

/*
	Name: isbalconydeath
	Namespace: aiutility
	Checksum: 0x14B44C41
	Offset: 0xC800
	Size: 0x1FE
	Parameters: 1
	Flags: Linked
*/
function isbalconydeath(entity)
{
	if(is_true(entity.var_2f38dcc9) || is_true(entity.var_f13e4919))
	{
		self.b_balcony_death = 1;
		return true;
	}
	if(!isdefined(entity.node))
	{
		return false;
	}
	if(!(entity.node.spawnflags & 1024 || entity.node.spawnflags & 2048))
	{
		return false;
	}
	if(isdefined(entity.node.script_balconydeathchance) && randomint(100) > (int(100 * entity.node.script_balconydeathchance)))
	{
		return false;
	}
	distsq = distancesquared(entity.origin, entity.node.origin);
	if(distsq > sqr(64))
	{
		return false;
	}
	anglediff = math::angle_dif(int(entity.node.angles[1]), int(entity.angles[1]));
	if(abs(anglediff) > 15)
	{
		return false;
	}
	self.b_balcony_death = 1;
	return true;
}

/*
	Name: function_c104a10e
	Namespace: aiutility
	Checksum: 0x68922B20
	Offset: 0xCA08
	Size: 0x1AA
	Parameters: 1
	Flags: Linked
*/
function function_c104a10e(entity)
{
	if(is_true(entity.var_20ed6efb))
	{
		return true;
	}
	if(!isdefined(entity.node))
	{
		return false;
	}
	if(!is_true(entity.node.var_f0a93b8d))
	{
		return false;
	}
	if(isdefined(entity.node.var_b8179184) && randomint(100) > (int(100 * entity.node.var_b8179184)))
	{
		return false;
	}
	distsq = distancesquared(entity.origin, entity.node.origin);
	if(distsq > sqr(64))
	{
		return false;
	}
	anglediff = math::angle_dif(int(entity.node.angles[1]), int(entity.angles[1]));
	if(abs(anglediff) > 15)
	{
		return false;
	}
	return true;
}

/*
	Name: balconydeath
	Namespace: aiutility
	Checksum: 0x72F7D0BE
	Offset: 0xCBC0
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function balconydeath(entity)
{
	entity.clamptonavmesh = 0;
	if(is_true(entity.var_2f38dcc9) || entity.node.spawnflags & 1024)
	{
		entity setblackboardattribute("_special_death", "balcony");
	}
	else if(is_true(entity.var_f13e4919) || entity.node.spawnflags & 2048)
	{
		entity setblackboardattribute("_special_death", "balcony_norail");
	}
}

/*
	Name: usecurrentposition
	Namespace: aiutility
	Checksum: 0x375E4C46
	Offset: 0xCCA0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function usecurrentposition(entity)
{
	entity function_a57c34b7(entity.origin);
}

/*
	Name: isunarmed
	Namespace: aiutility
	Checksum: 0xD142DC7E
	Offset: 0xCCD8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function isunarmed(entity)
{
	if(entity.weapon == level.weaponnone)
	{
		return true;
	}
	return false;
}

/*
	Name: function_7bbe1407
	Namespace: aiutility
	Checksum: 0x70BBDF52
	Offset: 0xCD10
	Size: 0x174
	Parameters: 1
	Flags: None
*/
function function_7bbe1407(ai)
{
	ai endon(#"death");
	sniper_glint = #"lensflares/fx9_lf_sniper_glint";
	var_910f361 = ai.weapon;
	fx_tags = [5:"tag_eye", 4:"tag_flash", 3:"tag_barrel", 2:"tag_scope", 1:"tag_scope_rear_lid_animate", 0:"tag_sights"];
	while(true)
	{
		ai waittill(#"about_to_fire");
		if(ai.weapon != var_910f361)
		{
			continue;
		}
		for(i = 0; i < fx_tags.size; i++)
		{
			tag = fx_tags[i];
			has_tag = isdefined(ai gettagorigin(tag));
			if(has_tag)
			{
				playfxontag(sniper_glint, ai, tag);
				break;
			}
		}
	}
}

/*
	Name: function_efed8903
	Namespace: aiutility
	Checksum: 0x2BC85F44
	Offset: 0xCE90
	Size: 0x48
	Parameters: 1
	Flags: None
*/
function function_efed8903(ai)
{
	ai endon(#"death");
	while(true)
	{
		ai waittill(#"stopped_firing");
	}
}

/*
	Name: isinphalanx
	Namespace: aiutility
	Checksum: 0xEE422E01
	Offset: 0xCEE0
	Size: 0x2A
	Parameters: 1
	Flags: Linked, Private
*/
function private isinphalanx(entity)
{
	return entity ai::get_behavior_attribute("phalanx");
}

/*
	Name: isinphalanxstance
	Namespace: aiutility
	Checksum: 0x9CEBF8FA
	Offset: 0xCF18
	Size: 0xB6
	Parameters: 1
	Flags: Linked, Private
*/
function private isinphalanxstance(entity)
{
	phalanxstance = entity ai::get_behavior_attribute("phalanx_force_stance");
	currentstance = entity getblackboardattribute("_stance");
	switch(phalanxstance)
	{
		case "stand":
		{
			return currentstance == "stand";
		}
		case "crouch":
		{
			return currentstance == "crouch";
		}
	}
	return 1;
}

/*
	Name: togglephalanxstance
	Namespace: aiutility
	Checksum: 0x9D199EC3
	Offset: 0xCFD8
	Size: 0xBA
	Parameters: 1
	Flags: Linked, Private
*/
function private togglephalanxstance(entity)
{
	phalanxstance = entity ai::get_behavior_attribute("phalanx_force_stance");
	switch(phalanxstance)
	{
		case "stand":
		{
			entity setblackboardattribute("_desired_stance", "stand");
			break;
		}
		case "crouch":
		{
			entity setblackboardattribute("_desired_stance", "crouch");
			break;
		}
	}
}

/*
	Name: isatattackobject
	Namespace: aiutility
	Checksum: 0x9A4511D0
	Offset: 0xD0A0
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function isatattackobject(entity)
{
	if(isdefined(entity.enemy_override))
	{
		return false;
	}
	if(isdefined(entity.attackable) && is_true(entity.attackable.is_active))
	{
		if(!isdefined(entity.attackable_slot))
		{
			return false;
		}
		if(entity isatgoal())
		{
			entity.is_at_attackable = 1;
			return true;
		}
	}
	return false;
}

/*
	Name: shouldattackobject
	Namespace: aiutility
	Checksum: 0xE1345270
	Offset: 0xD148
	Size: 0x7E
	Parameters: 1
	Flags: Linked
*/
function shouldattackobject(entity)
{
	if(isdefined(entity.enemy_override))
	{
		return false;
	}
	if(isdefined(entity.attackable) && is_true(entity.attackable.is_active))
	{
		if(is_true(entity.is_at_attackable))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: meleeattributescallback
	Namespace: aiutility
	Checksum: 0x4B0D4D3B
	Offset: 0xD1D0
	Size: 0xAA
	Parameters: 4
	Flags: None
*/
function meleeattributescallback(entity, attribute, oldvalue, value)
{
	switch(oldvalue)
	{
		case "can_melee":
		{
			if(value)
			{
				attribute.canmelee = 1;
			}
			else
			{
				attribute.canmelee = 0;
			}
			break;
		}
		case "can_be_meleed":
		{
			if(value)
			{
				attribute.canbemeleed = 1;
			}
			else
			{
				attribute.canbemeleed = 0;
			}
			break;
		}
	}
}

/*
	Name: arrivalattributescallback
	Namespace: aiutility
	Checksum: 0x8B165DDB
	Offset: 0xD288
	Size: 0x82
	Parameters: 4
	Flags: None
*/
function arrivalattributescallback(entity, attribute, oldvalue, value)
{
	switch(oldvalue)
	{
		case "disablearrivals":
		{
			if(value)
			{
				attribute.ai.disablearrivals = 1;
			}
			else
			{
				attribute.ai.disablearrivals = 0;
			}
			break;
		}
	}
}

/*
	Name: function_eef4346c
	Namespace: aiutility
	Checksum: 0x8EB2839
	Offset: 0xD318
	Size: 0x82
	Parameters: 4
	Flags: None
*/
function function_eef4346c(entity, attribute, oldvalue, value)
{
	switch(oldvalue)
	{
		case "disablepeek":
		{
			if(value)
			{
				attribute.ai.disablepeek = 1;
			}
			else
			{
				attribute.ai.disablepeek = 0;
			}
			break;
		}
	}
}

/*
	Name: function_1cd75f29
	Namespace: aiutility
	Checksum: 0x98F5EDF0
	Offset: 0xD3A8
	Size: 0x82
	Parameters: 4
	Flags: None
*/
function function_1cd75f29(entity, attribute, oldvalue, value)
{
	switch(oldvalue)
	{
		case "disablelean":
		{
			if(value)
			{
				attribute.ai.disablelean = 1;
			}
			else
			{
				attribute.ai.disablelean = 0;
			}
			break;
		}
	}
}

/*
	Name: function_a626b1a9
	Namespace: aiutility
	Checksum: 0xB480475A
	Offset: 0xD438
	Size: 0x82
	Parameters: 4
	Flags: None
*/
function function_a626b1a9(entity, attribute, oldvalue, value)
{
	switch(oldvalue)
	{
		case "disablereload":
		{
			if(value)
			{
				attribute.ai.disablereload = 1;
			}
			else
			{
				attribute.ai.disablereload = 0;
			}
			break;
		}
	}
}

/*
	Name: phalanxattributecallback
	Namespace: aiutility
	Checksum: 0xBFD63EAD
	Offset: 0xD4C8
	Size: 0x5A
	Parameters: 4
	Flags: None
*/
function phalanxattributecallback(entity, attribute, oldvalue, value)
{
	if(value)
	{
		oldvalue.ai.phalanx = 1;
	}
	else
	{
		oldvalue.ai.phalanx = 0;
	}
}

/*
	Name: function_81c32010
	Namespace: aiutility
	Checksum: 0xEE74FAEC
	Offset: 0xD530
	Size: 0x2C6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_81c32010(entity)
{
	if(!isdefined(entity.reacquire_state))
	{
		entity.reacquire_state = 0;
	}
	if(!isdefined(entity.enemy))
	{
		entity.reacquire_state = 0;
		return false;
	}
	if(entity haspath())
	{
		entity.reacquire_state = 0;
		return false;
	}
	if(is_true(entity.fixednode))
	{
		entity.reacquire_state = 0;
		return false;
	}
	if(entity seerecently(entity.enemy, 4))
	{
		entity.reacquire_state = 0;
		return false;
	}
	dirtoenemy = vectornormalize(entity.enemy.origin - entity.origin);
	forward = anglestoforward(entity.angles);
	if(vectordot(dirtoenemy, forward) < 0.5)
	{
		entity.reacquire_state = 0;
		return false;
	}
	switch(entity.reacquire_state)
	{
		case 0:
		case 1:
		case 2:
		{
			step_size = 32 + (entity.reacquire_state * 32);
			reacquirepos = entity reacquirestep(step_size);
			break;
		}
		case 4:
		{
			if(!entity cansee(entity.enemy) || !entity canshootenemy())
			{
				entity flagenemyunattackable();
			}
			break;
		}
		default:
		{
			if(entity.reacquire_state > 15)
			{
				entity.reacquire_state = 0;
				return false;
			}
			break;
		}
	}
	if(isvec(reacquirepos))
	{
		entity function_a57c34b7(reacquirepos);
		return true;
	}
	entity.reacquire_state++;
	return false;
}

/*
	Name: function_bcbf3f38
	Namespace: aiutility
	Checksum: 0xA9FA3F33
	Offset: 0xD800
	Size: 0x2EE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bcbf3f38(entity)
{
	if(!isdefined(self.enemy))
	{
		return false;
	}
	animation = self asmgetcurrentdeltaanimation();
	currenttime = self getanimtime(animation);
	notes = getnotetracktimes(animation, "melee_fire");
	if(!isdefined(notes))
	{
		if(!isalive(self.enemy))
		{
			return true;
		}
		return false;
	}
	meleetime = notes[0];
	if(meleetime > currenttime && (meleetime - currenttime) < 0.05)
	{
		weapon = self.weapon;
		if(isdefined(self.meleeweapon) && self.meleeweapon != getweapon(#"none"))
		{
			weapon = self.meleeweapon;
		}
		if(!isdefined(weapon))
		{
			return false;
		}
		distancetotarget = distance(self.origin, self.enemy.origin);
		/#
			record3dtext("" + distancetotarget, self.origin + vectorscale((0, 0, 1), 64), (1, 0, 0), "");
		#/
		if(distancetotarget <= weapon.var_d3cafde6)
		{
			return false;
		}
		var_51d5c26f = self ai::function_9139c839();
		if(!(isdefined(var_51d5c26f) && isdefined(var_51d5c26f.var_158394c8)))
		{
			return false;
		}
		if(distancetotarget > weapon.var_d3cafde6 + var_51d5c26f.var_158394c8)
		{
			return true;
		}
		toenemy = vectornormalize(self.enemy.origin - self.origin);
		dot = vectordot(toenemy, self getweaponforwarddir());
		dot = math::clamp(dot, -1, 1);
		if(dot < 0 || acos(dot) > 80)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_de7e2d3f
	Namespace: aiutility
	Checksum: 0x43CD72FA
	Offset: 0xDAF8
	Size: 0x58
	Parameters: 1
	Flags: Linked, Private
*/
function private function_de7e2d3f(entity)
{
	entity setblackboardattribute("_charge_melee_anim", math::cointoss());
	entity setupchargemeleeattack(entity);
	return true;
}

/*
	Name: function_9414b79f
	Namespace: aiutility
	Checksum: 0x185DD63C
	Offset: 0xDB58
	Size: 0x28
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9414b79f(entity)
{
	entity cleanupchargemelee(entity);
	return true;
}

/*
	Name: function_331e64bd
	Namespace: aiutility
	Checksum: 0xF281446
	Offset: 0xDB88
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_331e64bd(entity)
{
	function_644b35fa(entity);
}

/*
	Name: function_493e5914
	Namespace: aiutility
	Checksum: 0x581B2A9A
	Offset: 0xDBB8
	Size: 0xCE
	Parameters: 1
	Flags: Linked
*/
function function_493e5914(smeansofdeath)
{
	var_62ea2e0c = [8:"MOD_IMPACT", 7:"MOD_HEAD_SHOT", 6:"MOD_MELEE_ASSASSINATE", 5:"MOD_MELEE_WEAPON_BUTT", 4:"MOD_MELEE", 3:"MOD_PROJECTILE", 2:"MOD_GRENADE", 1:"MOD_RIFLE_BULLET", 0:"MOD_PISTOL_BULLET"];
	if(isinarray(var_62ea2e0c, smeansofdeath))
	{
		return true;
	}
	return false;
}

/*
	Name: function_69c2d36f
	Namespace: aiutility
	Checksum: 0xEEF35141
	Offset: 0xDC90
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function function_69c2d36f(smeansofdeath)
{
	var_4e9743c0 = [4:"MOD_MELEE_ASSASSINATE", 3:"MOD_MELEE_WEAPON_BUTT", 2:"MOD_MELEE", 1:"MOD_PROJECTILE", 0:"MOD_GRENADE"];
	if(isinarray(var_4e9743c0, smeansofdeath))
	{
		return false;
	}
	return true;
}

/*
	Name: function_cb552839
	Namespace: aiutility
	Checksum: 0x84F96D41
	Offset: 0xDD28
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_cb552839(entity)
{
	var_cd13f926 = entity.origin;
	if(isdefined(entity.var_28621cf4))
	{
		var_cd13f926 = entity gettagorigin(entity.var_28621cf4);
	}
	offset = vectorscale((0, 0, 1), 60);
	if(isdefined(entity.var_e5365d8a))
	{
		offset = entity.var_e5365d8a;
	}
	return var_cd13f926 + offset;
}

