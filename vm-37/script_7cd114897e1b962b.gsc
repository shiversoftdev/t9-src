#using script_309ce7f5a9a023de;
#using script_644007a8c3885fc;

#namespace namespace_7613a4d0;

/*
	Name: __init__
	Namespace: namespace_7613a4d0
	Checksum: 0x4E21D40A
	Offset: 0x80
	Size: 0x24
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	function_6e338a1c();
	level.var_21f73755 = 1;
}

/*
	Name: function_6e338a1c
	Namespace: namespace_7613a4d0
	Checksum: 0xE874DBB3
	Offset: 0xB0
	Size: 0x9B1C
	Parameters: 0
	Flags: Linked
*/
function function_6e338a1c()
{
	str_gametype = getdvarstring(#"g_gametype");
	var_87d0eef8 = &namespace_b0722f43::function_63bfe27;
	var_74257310 = &namespace_b0722f43::function_6da5e673;
	var_f8a4c541 = &namespace_b0722f43::function_6991057;
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_54877da1f10e40b5", #"hash_5f6d7361258230a");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_ba416827a85877c", #"hash_cefb3af28fb800b");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_24a1df9928527c11", #"hash_18ed63a25d0c43d1");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_2294e52d4ac78b9a", #"hash_541f29266c6b7df8");
	if(str_gametype == "zclassic" || str_gametype == #"hash_1f847b868c4199a3")
	{
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_7fcec90f9735b363", #"hash_d73a66d19f42ecc");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_28d7fd7195f35c1e", #"hash_2a39f44c8e39086b");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_60f8c865fdec9eed", #"hash_7eac920601280542");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_e09af8aad81ae10", #"hash_218d705a5c986831");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_4128a24db267bf7", #"hash_3728bd3f5715368");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_2ca803dd8ab3e1b2", #"hash_57a72df1795563e7");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_19cc35be1f917b1b", #"hash_3ad43d7e90f5707d");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_2ee2b9ad49df0876", #"hash_97be8c9e3bfeff2");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_f801bdfce80c3e5", #"hash_ede33286b211f4b");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_3f08e8f3e9c94c88", #"hash_149802efb7494470");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_e7173ed4c6ad28f", #"hash_4727783bd1b11bd9");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_3391a68264ab20a", #"hash_246ac3117d240e0e");
	}
	if(str_gametype == #"zonslaught" || str_gametype == #"hash_321225a5ce1eb35")
	{
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_d73a66d19f42ecc", #"hash_756674c183176048");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_2a39f44c8e39086b", #"hash_756674c183176048");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_7eac920601280542", #"hash_756674c183176048");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_218d705a5c986831", #"hash_756674c183176048");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_3728bd3f5715368", #"hash_756674c183176048");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_57a72df1795563e7", #"hash_756674c183176048");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_1afc56b14728d1d5", #"hash_31b3a426d0b6e38b");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_7604ffd8d7fb367e", #"hash_68e6d3f1ef87d0d8");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_1f2b0032ecc93237", #"hash_6e468e383daed369");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_69e976c5199fdc20", #"hash_59c8903a26c35c06");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_4c8b14db7f358559", #"hash_650179efcf6aedc7");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_63e44c0150bb5992", #"hash_3bf7450bdd155fb4");
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_1ee01480f4008cf0", #"hash_298d31ad27126c56");
	}
	if(is_true(getgametypesetting(#"hash_7e8e34cc69a77e0b")) || getdvarint(#"hash_40bd34b35079cf2e", 0) > 0)
	{
		namespace_1c7b37c6::function_149cbc84(var_f8a4c541, #"hash_4a5ba547feb80628", #"hash_234653830cc328d9");
	}
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_74efc2f0523a1b43", #"hash_5951baf77aea4bb5");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_1bdc6102e1922ee1", #"hash_60d26e5edbea903b");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_3d79e8fa4d04bbe9", #"hash_9c323d05d70c243");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_63a257f430cb24e4", #"hash_b5a96736b401cc");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_7e68f63f8995b1e6", #"hash_4cc226cdaeae487e");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_66f7a79dbd87eec0", #"hash_54b96cd4694b8d8");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_409656a5454ca9a1", #"hash_1201c7fcb7f51efb");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_139fe0e3be289c29", #"hash_37f2c1e35818d083");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_1d1e0f96c57550a2", #"hash_6e8212c05312bdca");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_43a7c00ebad019fc", #"hash_29445e5eef449964");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_2551991b0ce4278e", #"hash_67b9395b2e0029e6");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_2a74aa6c21425de8", #"hash_c78ec937b30c440");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_13e7b5e35b27fda2", #"hash_29c5035db4124cca");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_1e87409dae378d95", #"hash_77228486973b1c5f");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_780b6e02fd11b515", #"hash_57976ae65aa47edf");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_5e8e59ff7a020c33", #"hash_2a9b80bf6e719e25");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_72c4fa7a2b91b0b3", #"hash_3458660ffe1b7fa5");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_7a28e0acec4d71b2", #"hash_6b5294a02fc58a1a");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_355338f948fa31c", #"hash_69ff77781cdb7e44");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_6edd00dc752c24e1", #"hash_73abacec2fd5e23b");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_13101dfb0ca2d5fe", #"hash_314a8049e018d6");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_a89044fba7b2c27", #"hash_6737da1ec5ceec49");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_4e931ec838beed9f", #"hash_c2dac0adf881b21");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_2beafef30af1e8c5", #"hash_71743f1f9fdd9a4f");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_693720c039d99805", #"hash_7737198669ce118f");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_63dd998473d02f01", #"hash_67ae49fa210cf21b");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_6d0a8b21a8b8b789", #"hash_2b523070346b22a3");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_7ec532c309e0eef7", #"hash_e5c35c6be678059");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_8337602f5a165af", #"hash_68c9e1eaf1008e31");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_4bfc4ce4d3e99f07", #"hash_3dcbd16782db8ce9");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_13623c18b49d567f", #"hash_79d7bb05f68ddc41");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_6cc986f0af4b142a", #"hash_603b80c2dece2932");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_438ee0a9ed0f3b64", #"hash_796bd61d402094c");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_6db3b0a25b06fbb9", #"hash_516b9c009f958053");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_311a6366c098f011", #"hash_5867887c7438eb6b");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_26a11c1d57bbb4d1", #"hash_4ca03fd7fb77142b");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_64d48522d34c4f99", #"hash_66518103ed838ff3");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_776efcf8d78c80", #"hash_70e74393ae147f98");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_2b8002d0d1dd882a", #"hash_c8e1dbdf1b9a532");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_2ff1e718a658a883", #"hash_657c0726e2c50cf5");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_60df57f4f5a14577", #"hash_6284d1f01b3447d9");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_53ac88663aebc40", #"hash_798c6f4830e4fd58");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_7935909de8935589", #"hash_37872a865636aca3");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_28efceaacc63752f", #"hash_3e4ff275ec81e8b1");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_6e6118f39468cb2c", #"hash_2358dab17bbd3454");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_af064392d860f1f", #"hash_20b99d912e487ba1");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_10ade3abf18cb742", #"hash_31d80559a5a0ec2a");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_4bc121b59bfe4a2c", #"hash_656765b4799b0954");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_3c63a8769b611006", #"hash_4af2b13b3c82745e");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_114f1df6ad46f598", #"hash_4fb8b91096066f0");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_fddd3e0764a6167", #"hash_e248eef6a401689");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_21f2c71ee52d3d5f", #"hash_3a06adcc040945e1");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_767e2b6d5150883b", #"hash_14cdaa7fd97c546d");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_12aaf0a984a5418b", #"hash_5dd5b8fd48364b3d");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_100ffabc91f834d2", #"hash_233d4b936507cefa");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_1d25af262e371b3c", #"hash_26ddd582ce81b2a4");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_7823002429b5d54f", #"hash_2ffc87f1c781bf91");
	namespace_1c7b37c6::function_149cbc84(var_74257310, #"hash_bec81919557da77", #"hash_4902fc1a64ffced9");
	if(!is_true(getgametypesetting(#"hash_21dfcc8984dad931")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_79d7d5e206eaf770");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_771f711d441787c5");
	}
	if(!is_true(getgametypesetting(#"hash_9574295c8d1417e")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4777f28d1a2ad7bf");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5ee46705c4afac24");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_d66af904f3396ed");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_331a7feb84ee38dd");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_58008b880e4ac4c2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1e1bb0dbbbf344eb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1d86ab2e351b6adb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_95aecf4be5ba1e8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3e14004c7e126c4c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_61aab3d63d7666b2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1350eb87d6904739");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6c459f9f33534722");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1f13a7f0837bace8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_799fad8f9b3f4dbf");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1ca36ca26c214cd6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4376cc7b056719fc");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5838e691aa6fc48b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5b2d331d596e0292");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1729a203dbc446f8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_67af34a77d27a7cf");
	}
	if(!is_true(getgametypesetting(#"hash_197b8b458c4577b9")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1c8dd580df5d8582");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_373f54af813df1df");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_721b5e7dc2fd5878");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2ec0b5ea11a8dcbe");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4a25f8b63584daed");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6658563ce3a2e366");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6656febb50830a6c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_362c7af96cee30bb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7c9c71603f9ec9db");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_91b54f2a2e16beb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3f3f63e98e023778");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_14301c3cc01ee5ed");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5600a18cffa3c5dd");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_551bfb1013aba1c2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2c001e6e62627a49");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6564a0c4b807acd9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_554ef651bbf7076");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_77d1b7aa5ea3ccc1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7b233c3274c0a761");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_295f9914fb41be4e");
	}
	if(!is_true(getgametypesetting(#"hash_3cd4e4f070668ada")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_62f17a7633b39af");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_576b20f27b24c234");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1f461464e7febd3d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_44cc28158659064d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4a5ecbbc6374c672");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7c63497de430b79b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_71611ac3eb528fab");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_39b42851d26f0b38");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_703e827fce9bed9c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4c56d2c1a92fde2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4a2e5ec6773be369");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_59b7a489acf2b652");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_59765578c5de7b8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7f003a100db1478f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5b79e6c63f02c66");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_26cae2b875a0456c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7bacdd7c20d09bbb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6fec98353aa8cf82");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_32da80f29ddd6b08");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_29936bdf24f06fdf");
	}
	if(!is_true(getgametypesetting(#"hash_38fc677b479b1b9b")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6289f9985ec60014");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_74b941353b668881");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_31a3a80e4feec9a2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_66b9876bd282468");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5ae918caab30fd3f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1f84d2a433fbc40");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6c25d5221efe85f6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_400dbb134a59ac35");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3767c10174b2ebc1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_32a42ecfd06fa461");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_64693fc2cc2b0b4e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_70e3c9259d790563");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_633e2a8572b1efa3");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_64fc418b7cbca20");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1f3ffd6f9aced99b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2716ec41828db5ab");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4eb76986c8d79138");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7473ef780c3cd063");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4a8134cdff7770a3");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_51fd64cb3365db20");
	}
	if(!is_true(getgametypesetting(#"hash_5428069c26ac7a85")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_63f32e49ebb12a42");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6aaf0aaefdefd49f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_571712eb42ebc938");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4e44b01f432bc77e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2935ac9a1d3c57ad");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5c05aa1899596726");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5da64c2ac6cde62c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_73d9a4fe286c707b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5ff5464e44b07f9b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3c3f2364dd8ce7ab");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3f71bd02161ae338");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3776fa271006ecad");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4df631c1d16a749d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5cc8065566e9d282");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5dee4340c4d5b809");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1bd43f1c473cfc99");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1a81802b1e48e436");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4dfb91f0a16f381");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7eac69a46b6c1721");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_66de50e598bc050e");
	}
	if(!is_true(getgametypesetting(#"hash_30fcc5c576cf049c")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_33547d35295bb55d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_e15cb67668fbed2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4d62a9afc766242b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6a3af7d99c1a21b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_636db75334f92328");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1314b09f26924df1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_79531b36f8c876b1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1ea543bcb9ef159e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_58b086530612db3e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5c020d0b4d042d14");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_17cab0b52cb85833");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4579f8cec16f5054");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1c27a0f70eab744a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3152a72031bc67c1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3b690bafadb73c0c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3222af9298786372");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_46311edf1d385f9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5b1db5e03f5e110");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_29ef5eff7240be66");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1dd7ef9708d592a5");
	}
	if(!is_true(getgametypesetting(#"hash_21138fb9940856ed")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_19c00ed3eb4d3262");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3dc92b4efe67d2ff");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2be7e0bf1f400e98");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5c34e579fde4a31e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_457d9449458cd7cd");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_8ac3f68c41d6286");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6482eba858b2124c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_23142b0303e40c9b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_57423a94a1d0dfb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_42d706878ce5facb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_459bdf03428919d8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_19bc34ea0819eb8d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5108b389f8e4cbd");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_648591868da84e22");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_101032c024c386e9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_31f8ec1f09f4ae39");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1c6b66d5beb64756");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_26bdebfa4c19c961");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7dd291a21f7375c1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_73b0c097aecf62e");
	}
	if(!is_true(getgametypesetting(#"hash_55a71b8eec91f064")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_40412bac52e502ab");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5b62a2915232a6a8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6c50df64417b9ee9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_554a573b37700f56");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3ca0bf1c4d88418f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1530045ffc25354");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3f43237191b3f3b0");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_483d0a835181c405");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_30e49f0cd5b6c06");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4d580c4d079fc11b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3fe88990af2607c2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5b2bec9d0b75451f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_35be7629fed232e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_25dc0832f0318d43");
	}
	if(!is_true(getgametypesetting(#"hash_6e08ae9c93d49fa9")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_223d1fd4772a9b78");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7473883f6142d3ed");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_573cf416f1299246");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_677ba5987639800c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6d1e570b735e805b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2c6026a82b3fbdbc");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4713bd36570368c2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_333ba92829ae949");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5b66f995567f813d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_b3df9020f4cd24d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_49ec774a3b5b5272");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5c3a5cb21a8bb67f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3ea0a8ed846b307f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_11f015d877033de4");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_582d18b68445f45f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7b0f7fd7bc8c369f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_560ad67d564c8904");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_63dcfacd6885b917");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_72bd537d51265067");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_e86c17e3d9d283c");
	}
	if(!is_true(getgametypesetting(#"hash_325ba7c748b18956")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_57ecfa2e8316c14d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_30655e611e78fce2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2270c66cc693417b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7e16fc49046ee54b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_675b37800fcbec58");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_210b73aae673cde1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_329cfdd0f9a03341");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_280ad9b824ee4bae");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6b02f28bbe090e8e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_76493ec9d3bbd004");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1bc93747e7c51fe3");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_413476d40aa2e0c4");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1fd07257f425601a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_717d22b2cc658f91");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_ebeca79dd65dfdc");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_57f473de7f4a2b22");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_148dcef7977ea7a9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6db9367335eea300");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_24a067f15a7551b6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7f529291e37ba5f5");
	}
	if(!is_true(getgametypesetting(#"hash_276c762aa3f9fb83")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5533004ad9c681ba");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_34a2b08dde25c3f7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1e0b2cee8910e7a0");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3df017a001e59e96");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_14b2e1f66409a455");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5d17171befc6d51e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6f2789d62abcd834");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_66402daa103e61d3");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_35ccb59204a1d023");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_344411653f7c3b63");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7ca1f93905793ae0");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_75d4caad5b88e515");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_766d34c435190bd5");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7e6c4740d0b6376a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_ea89e2f9d6a6701");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6a5e85341704c1a1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1bb4932c33ea978e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_69767bccfe487d39");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5d07658a38c7f729");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7446bb3ab0a6d586");
	}
	if(!is_true(getgametypesetting(#"hash_3a7ec0a6978ebd27")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_500af850e37ee916");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_131e899e9c5b4bcb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6158e38126712e2c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_efcada820d42552");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_27865bc177d435d9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7d248bad294a43f2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4fdc1a9b15dc2098");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5cd7f405163a2aef");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_71c638121c7a1cc7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7ee6e42c61bf3c37");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_11b0f70adb43b4c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1afea64a7ed207f9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_602a3210dbc82ce9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3977177879d54846");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6f3b58530040f23d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2cf38583ace5854d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_29c0c12fb14cb572");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_591cbfbc064e6c05");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_66d13728a35aa565");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_26d4d92dfea8fcfa");
	}
	if(!is_true(getgametypesetting(#"hash_783783e66c8036bb")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7e424a2d8a7c6fd8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_787c4394cf15a70d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6b01dc09c2c361e6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1ef88b2497f4f5ec");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1d5fbec54ee6943b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_69fa9469cd06ad5c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6e5792d7aa10a3a2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_78fa11484e6e829");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2c240a2e3bc7d1dd");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_72ba0391a478a72d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_272d099accf8dc52");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_108456a9f5c3c81f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6e94238240fb8c5f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4ef616f20d2ac0c4");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1c46f99032c323ff");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2302496a1fb188ff");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3fb609bf65595e64");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6ba3b12d87d50cb7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_c22385bc196c5c7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_661744174e0f39c");
	}
	if(!is_true(getgametypesetting(#"hash_61d2c98cd4f42430")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4753c3b0bc43322b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7766bfc438d52d28");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_46aecc82c7b13269");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4a7f0efe16100b9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_34821077642701d6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_16feac3ad3bdd50f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3000edecbc4def2f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_608ab9822c7945d4");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_55c78d09794b5230");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3cb9e8d537a00246");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_e2b8185cf8cc785");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_463bb4ceda650e86");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4a41ae76b7a1964c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4ffa4d8d027dd09b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_315f46ebc2faa42");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_641a790ab60135c8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5dce2ddd0653549f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_19e050fa878481ae");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_50b024af36d4b464");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6bca7f356e3c90c3");
	}
	if(!is_true(getgametypesetting(#"hash_7d458c697d0c4966")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7f1b12bfc80bf6d1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_519a405e32b2cdbe");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7bb10b32cc8bf45f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4a9e376eab9e369f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7bd33545f77e8904");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7c4b3e495f693a6d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7a63d695f3df735d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7295a1222862e742");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2dd8e6be75aed57a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_16c09b6f788dd930");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7c1d1e2dfbecbeb7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7f66c8411a71fde0");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_413868676cd4f2d6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_504e2d663e070795");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_60dd413fd16ef3e0");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3db902dad88414d6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_42f59c88e3314995");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_687b669dd14bfd4");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_385a47e4285092ca");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_18f40daf4b28ae41");
	}
	if(!is_true(getgametypesetting(#"hash_26a2c5ac44218a16")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7dffbb661d133dcb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_d068582c8789d88");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_a50b02a87d6f9c9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2d69c03e495ffb59");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_76d83fa488e9e6f6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_51a8ed6e0f256eef");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2f010768085d06cf");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_44ae9e51b651574");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4ef79aa4f5156a10");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2f63ffe6072cb966");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_72d85abba5d2bda5");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4f2274fda13dc666");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_73fe1369d266d36c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_70ed0ae2e38f09bb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6849441a07c2f022");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_d65ed610da407e8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5c54a8b055eed8bf");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_46137706e84fd10e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6b417bbaff220784");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_722e68f0aec8f63");
	}
	if(!is_true(getgametypesetting(#"hash_1456b26ab6d295ef")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2df9bb2f173a5384");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3f41400b7e603351");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_39f57b5a1423a5f2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_227f15a728810698");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5ef774f45c8870ef");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_780da2675d1a5670");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3bd2493c26dc1c86");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_56f7e3f54e594c5");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1dc3b60fb9a60e51");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_9bee57b180855d1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4499a73f56b78c3e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_427ff34543523bd3");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_62946ab7380a21f3");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_43eed801ff3d6370");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6d0961915e191e2b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_a7e1d6e227c501b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2a5b1613c47db128");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6e599b756b1482d3");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6e7f2d6bf29196f3");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_9cfa0b458e2a870");
	}
	if(!is_true(getgametypesetting(#"hash_7fd1ff1f0b2dc779")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2d6e891d814d767a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6c39afe72168b1b7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3fda89f0a9869a60");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_39606551161a7856");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_76cb984bcff1a515");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1e5005ee55db6de");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_731e7676a8111af4");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1c6df7cff3269b93");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_368069b0da6cfce3");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3e81f1bdea05a623");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_67039a5990bc28a0");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_12a6c27ba16e31d5");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7cbacea78b657f95");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_f7cc154ca35712a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4dcc07f88eefdc1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5247b846111e9a61");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_66f2ce1ad9ec614e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_352d77559d328ff9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_578576238b6cc4e9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3c4ac72e4daf6046");
	}
	if(!is_true(getgametypesetting(#"hash_61b10205e83c5849")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_58d0e6fa693144d8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2427a9b73d2f760d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1999e554bac4cee6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1abb4a7cbaa41cec");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4dc61686a7bfab3b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_18929db4c5081a5c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6a1a522fccbfcaa2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_37f5f8d5ddbfff29");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_52b8796df6e830dd");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_40c79012ba53642d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7beb548bf1a9e952");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3e49210d602fff1f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_69a64645309ad15f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_65f4347c060cd5c4");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4a0bc3f39d2f5aff");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1e146c2d0f50cdff");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_56b427495e3b7364");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1238206d42f56bb7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5a2fc4dcd77182c7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5b1fbf329992009c");
	}
	if(!is_true(getgametypesetting(#"hash_36996ba5b37104c9")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5d310a03cd9f9af4");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6cf6b598aa489d21");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_39d3bf57fc469cc2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5795ca4554c9fd48");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_818cb42b60e541f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_624be476667a0de0");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_179568cc1a9322d6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4acb28442003795");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_350f3595e0ef1c61");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5c0429c89f508ec1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_31b006ea72841f2e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7ff08a9067020203");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_45687be110a8f183");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_41408e7f58797380");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5e21592f440c8bbb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3da193fb20d36a8b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7772208402b07d98");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2b64ba20f741c03");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_694c6b5c798cff83");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2f8b985821ed6180");
	}
	if(!is_true(getgametypesetting(#"hash_1b556d0ef1bd7a36")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_43e819ecb1562f21");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1ccd87e5054d51ee");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_32f2f83451af6ccf");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_32e49642defbbef");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_589f0338b76bb894");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_31f29a0adf6eac3d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2dc8f65098734d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_52829555166d8372");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5d631f507f8084aa");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_32d9647f3434df40");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1ead713dbf0b2b07");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5ab49a8d69e9e6b0");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6ae550ef41f06fc6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2d252b486304cd05");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3b20ca3b9b433ed0");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_25fffe5cbaac6526");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_385547696c0a5a65");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1fb9cb69c31e6a64");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2853c33ed2e0d9fa");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1def269957739d71");
	}
	if(!is_true(getgametypesetting(#"hash_4e946885bf06df52")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_651ef81aad7ab3c9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_16be38a88cccb4f6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_64180edcb9169087");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2d88f2f2db621ff7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7ae86b266526e30c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_330ac21d10c5f205");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2054e455870f7765");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_b1f59cf3c4beefa");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_56c6c84bb6774c22");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6d7ab182af7b9be8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5da1fff0f5b9acbf");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2aef22b49e8efe68");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1a6d81d7bf7713ce");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_503d3bdfb97f00bd");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_73f2f7330f780378");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5c67630b34e6fdbe");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1882914fa0f18bed");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_190de4bed9fc266c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3632af26be7e7992");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7980c79e0b854b19");
	}
	if(!is_true(getgametypesetting(#"hash_5dee59f4f540e800")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_61873493cf3c6419");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5a41b873850f75a6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_25298c7aa52c9df7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7117444e84a4c907");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_17de7645140b51dc");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_575aceaa2432c055");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2d35fc05f9e99b15");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_29daeb9118bb04aa");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_713a7c4821fe6b12");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1215b131f661b078");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_22d35958014a694f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7014a3daff1e8178");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2dcc9d1eb475b7be");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_21cff3103360e5ed");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3c6960707de95c28");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_64597c9b5ce5578e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2b223ec848d4257d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4ffb12ed23fe69bc");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_125bbfb48ff7ecc2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6c69e4dbaa09ad49");
	}
	if(!is_true(getgametypesetting(#"hash_634569782c55f196")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_30b8d2924d843003");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_42485d0c3856dd80");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2ccdb05de008371");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5ae2bb058d0e2731");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_27b21c5a6d860e1e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_341bffc58d404727");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_74c20eb6a6bb9957");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5898689be7d87e6c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_21c92b8691c27478");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_64b54b6f497ab0be");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6dd029d1cf0deeed");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_13a367157a0656ce");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6e10538412762b44");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1435ee96432d2023");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_20a1fb5f68f85eda");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3cef6f870c74bd0");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2106bfca51b590d7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5d9647113e7dae6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2e94c6086a29c0ec");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_31ef014e2ae18f3b");
	}
	if(!is_true(getgametypesetting(#"hash_46d3411097467f2d")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_55a27a00d9349812");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1d038fb6bb8dc04f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_622f65835075fa8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2f22a4022f73b20e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_d475085d26b67fd");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4dc7b9f0cc533436");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7b3b7da959cf181c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1e1ad2f6395c982b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_62fb4b54aff7718b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_47c508749d7a523b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1d2a4a60f18b4048");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_58aeebd935133ebd");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1462d8949661acd");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_13295023b76b62f2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3ef7bb3fce444df9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1c7aac457ff53ee9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7658a93b4a947a46");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3ab4f01a7d75a711");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4c4912d1dd882191");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7dcc56eb54028fe");
	}
	if(!is_true(getgametypesetting(#"hash_7880919be865d57b")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_70a0d91fd3d11c02");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4d0b656d41711d5f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_474a618c5a0daf8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_26982621906d543e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6b16440f080e8a6d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_78b19dd7e64665e6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5e2e6ef2cf4781ec");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_571cc6523f77e03b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7f4aba389622fd5b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4607476039d4566b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_76775de7fe4f09f8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_656748a23bf5a56d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3d8bcfd9677ad45d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_571b82fdd3a0d842");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7d374ad3de3939c9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4cefcf111fdebb59");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7547752dbb4a6f6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7a800082b5280041");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_380f2ea00bb391e1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_609793136b8e90ce");
	}
	if(!is_true(getgametypesetting(#"hash_7889914479f048a1")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2f25727fed26d18");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_17f116175d38db4d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_41d32ac4c5578126");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4ec1431306d5f42c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_ab273ef3d445e7b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_486cc90c6b568c9c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_796781ac0d947ae2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4531a90113dfb069");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_44d7e2a4a7ca3a1d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_212852753fa8b36d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7708bd5299ed3892");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_51ebd68203c9f55f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_200420900402999f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_d00dc1d400e9c04");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7a3b47d15aca53f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_51dc55a82b5d0b3f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_24a7e5e7c9caeca4");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2116e38be200ebf7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2cf14ec3050af307");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_16b627cf86c11bdc");
	}
	if(!is_true(getgametypesetting(#"hash_7e967deb0d6b9649")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_27a1d3b77a36f326");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3bfa9e13f565d47b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_9ada75d2497f81c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_ef7274674e40d62");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_62c28c045c07aae9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_32f862e44e3f6c02");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2d6923a85968f088");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_989e94478810d5f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5cca6a7551352cb7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1773ecca4f0325c7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6a72866b05c3539c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_14daff0ec1fe9a09");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4d6d548fd9a06299");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_59b568fa257daa36");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1ceed3c7dc5f09ad");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_35fdc6e7467fab9d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_704f1866af51f982");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_551ca3818f740355");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7043729826e48415");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_35514f9d12f4fdaa");
	}
	if(!is_true(getgametypesetting(#"hash_4f1f179b0cd480f1")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_78f079dd7a6e2e22");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4c10f73db23872bf");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_26af779cf0202258");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_584fed868cff57de");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4dc1ceb008c2e68d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2ec2ca7e3ee74146");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2b26a7b8120a2d0c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6a2e85b1c49c7d5b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7b0e5dbc398494bb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_20348a9188f8e58b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5bb63f44fd3f2898");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_9b1f9b20c76984d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1a510637b9f8617d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_304ce219bf2ff1e2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_69dbddfbde9661a9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_57dd185c67fb95f9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2723a17964af5b16");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_39cfa9ec04309821");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_49fe183faaff7881");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_350fd28d36691cee");
	}
	if(!is_true(getgametypesetting(#"hash_430002f66a3fd19b")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_30a0488c51baee56");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1d3016d87d07c10b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_b5438931bf0876c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7aea95525f29fc92");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_711429d61fde7e19");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_27b99465ed5732");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_56ac380b84c824d8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1a05b0be5c00172f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_46caf8bcdfdc1407");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6dacafd8b6b6fa77");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1f98f4622d2ca58c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2f4ff6c21f38e39");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_61e83f117f98a29");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6549f40cf2af1886");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_964402deefa27d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6e5b355d44a2468d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_344b1d1bfa8f1db2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_11dfe0da85e74745");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5f17e8e02529f6a5");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7711eee758908f3a");
	}
	if(!is_true(getgametypesetting(#"hash_7db8d2ae05b98ba1")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_200bb87bd1c3049e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7330c99abe9ae853");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_231291885db98e84");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4fed8fc8f3e90bda");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2558580f7a839451");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2ddbd69ade4ef97a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_158103fd5963c530");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1c0751394a676ab7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_11de3c52129f4a1f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5eb0f9af6bb2d25f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_550a2b5b546166c4");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_66a9ec0be2078171");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_339f223262ee6131");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2c48e4b83e1ee81e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_168aa53c035ea545");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_68baa543193f50a5");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_a35d2dae8c0893a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4cf361d49f792fed");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_46b094c2983263dd");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1d55870eee7b1fc2");
	}
	if(!is_true(getgametypesetting(#"hash_f75e8d54b6ad799")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_232f47ef8e00582e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7f5132a0f28c7c43");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4b95483752699ff4");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_40cbe9bc86a66f2a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_8fc5270a814fc21");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3175421b8c155b0a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_c18caf467dea460");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5687847b4e25a0a7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_500a65ae8af6db4f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_44f56a5f81d0776f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_50d6fbb014e7ec14");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_51a0ae810faf201");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6790fbdc867882a1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_760778394b36e88e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2270f53e40815735");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_34632e8923be92b5");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3361710e50222aca");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_288ec9b301b6b1bd");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_11a0fb16973993cd");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_39d971c2260eebf2");
	}
	if(!is_true(getgametypesetting(#"hash_27c9278627272303")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5d5001e3570c646b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5eee0462587df868");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6e9d6c458d1b4a9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_19289e55da4aaef9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_439db87b66d88416");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4183f053b3ce944f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_22b6b50eb6d7026f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7bd978eab2b0a714");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_415a2f2063a35570");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6a921048186cb986");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_16dc8117dc1a81c5");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1a4a2c12e50b8c6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2cdb7ca1b3ce638c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5a6cccc0c5455bdb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5dfa89f7260cf482");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_645de66087e9ba08");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5b54a6181aed2edf");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_27fbb9e5e90039ee");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3e84e6eb62624ba4");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_44c796cccc051203");
	}
	if(!is_true(getgametypesetting(#"hash_10756ba8dff36e5a")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5ca9897aafe3bb5");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6f9842c0affa204a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7ad1a3b6c3fe4c93");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_25a03433af9eccb3");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7b070b31a680e230");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_78eb17bbc43f3189");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5f4b194eb7d5f919");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1ac2b9ec84dde8b6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2c0fe6cbfebf2ba6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_518cc5e14405e3ac");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_72b14110aecd05fb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_49d57e58589708bc");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_291884ad29d369c2");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_11fb8516e0277a49");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_579a902e2818c4e4");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5f4ed73f6aad97a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_713755a1d9ff54f1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6e9de44134fcba88");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2874bd08c6351ae");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_29e1b8e89a63e9d");
	}
	if(!is_true(getgametypesetting(#"hash_6891ea2844c28717")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_48970e40447be9fc");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6aa7e4bae4199289");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7730c3edb5b03cda");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7f7551e7bfce25d0");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3ce79063eaf0ad7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7b3506e38157e428");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_8ebd2056cf3ef8e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_67ad7dbb90b83d7d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4089d9d0a4be54d9");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_20b71735278c609");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5c1d304f38223b66");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_c96da0ba42a251b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_79ac3282ba9ee82b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_48aa102aa02b2bb8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_71b652be0285b523");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_77ae42ad766fca63");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_201295f19d7139e0");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_304d190e0d3d0fcb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5f7cad8521a767b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_248dca521f5f3388");
	}
	if(!is_true(getgametypesetting(#"hash_fb69584de9657e3")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2230087fda13a58c");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4691d01781105a79");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_76bd198ba389610a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1b7b64bf5e38f660");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7203959a258612a7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5ed7dbe78f0889b8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2a797d12817f38fe");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_28c9df8d3159a12d");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4e32686366ae8989");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_509ca1b8cb550119");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4ff9da4f81b170b6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2750b1abf6a6bf2b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5aeec03374eb931b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_30b9b9ec09b6a428");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1d907bc74dbe9c13");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_44d8fcc9e688b33");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4ca965f07f2bc8b0");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7b49122756d14edb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_546c9713917cdaeb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1f3f1d42d4901678");
	}
	if(!is_true(getgametypesetting(#"hash_1a5305df17fdcc40")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_476fe89efa2dc20b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_60523eb11ee39c8");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7958d1eb3db3f109");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_37bc297d9fc70799");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3496ca99eb8d1f36");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6ac5891c3ab7df2f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_73f28667c986760f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5eb523d9cf6e0ab4");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_33b2e5e8a8286d50");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_407e5d0d760e60a6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4c0644e594bbcde5");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2a37c516df4516a6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1518f8e0101dc4ac");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_77c88fcb668f76fb");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6fd453d0adfeb62");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6653566292424928");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_76d53faa9e118dff");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4d87254f53dab84e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_656a433ad676dfc4");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1f2b61d42aa15ca3");
	}
	if(!is_true(getgametypesetting(#"hash_4cbfbe5e677ce735")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_448e825711a3d20a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2a696abcb41275a7");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_529e4ec18b83da50");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_658a6680e08b87a6");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5990b07be142e4e5");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2c40767b452254ae");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_22b425b7013b4d64");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_516cf3e617b539c3");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5b8c2ca960500293");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_51739dd522942eb3");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_53e6bbc941756430");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6ce9ab052a74db65");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_611600334dd5fe05");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2dde0d70bb98619a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_16885967e9cdc1f1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_67d5d0ade2ce52b1");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_502cab1220d0b19e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_57cd12d6f5f0ae89");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6645f935003b5019");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_51e668baf5282fb6");
	}
	if(!is_true(getgametypesetting(#"hash_596181cc4de6aad0")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4c696ce5b8b4e675");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3d6c85e60e7f64bf");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_c20bf6cb2f436fd");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_f5896e310254300");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_315d03848e9c8533");
	}
	if(!is_true(getgametypesetting(#"hash_6a5453075de4b0b3")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6ab225c69027e657");
	}
	if(!is_true(getgametypesetting(#"hash_22e96504754e8375")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7ab18956a0660839");
	}
	if(!is_true(getgametypesetting(#"hash_52f19cd89938e56a")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_689c84ba4e75b1c8");
	}
	if(!is_true(getgametypesetting(#"hash_240adf6a97ca2bdc")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7f37566c7dd7ecb");
	}
	if(!is_true(getgametypesetting(#"hash_55a58334a47dd0cb")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_49b7001ce02a0797");
	}
	if(!is_true(getgametypesetting(#"hash_76986c7749f63b9a")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_49c0448e11cb523c");
	}
	if(!is_true(getgametypesetting(#"hash_f8c884a70b46f1f")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1223df8e913d431b");
	}
	if(!is_true(getgametypesetting(#"hash_1ab1a89d032f7080")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_61247be669e9b732");
	}
	if(!is_true(getgametypesetting(#"hash_5d8dd9151ffe3c3f")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6174ad2674c82ec3");
	}
	if(!is_true(getgametypesetting(#"hash_48d605c9ac0d9395")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_35675bbd363f934a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_35675bbd363f934a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_35675bbd363f934a");
	}
	if(!is_true(getgametypesetting(#"hash_daa01e426a57a0a")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_fb02b41b0d01f39");
	}
	if(!is_true(getgametypesetting(#"hash_26dc68686741b223")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_aether_shroud_item_sr");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_aether_shroud_1_item_sr");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_aether_shroud_2_item_sr");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_aether_shroud_3_item_sr");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_aether_shroud_4_item_sr");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_aether_shroud_5_item_sr");
	}
	if(!is_true(getgametypesetting(#"hash_4230e2ce569b5e48")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_energy_mine_item_sr");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_energy_mine_1_item_sr");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_energy_mine_2_item_sr");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_energy_mine_3_item_sr");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_energy_mine_4_item_sr");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_energy_mine_5_item_sr");
	}
	if(!is_true(getgametypesetting(#"hash_af8083f7ea1c28b")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7ea42360bdf2de16");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1f9a001790297282");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_649e3a841620150f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_47954c9090e3f900");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_12f4d7321d9c5005");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_681471b56324b3e");
	}
	if(!is_true(getgametypesetting(#"hash_77e5bcb82c95cf00")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_37b9ba3f40fc1ba5");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4feb54f5041d1609");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_76ed099fde5ea820");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4554f3c03465642f");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_35d8042aa3ab475e");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1fc30bedac3b39a5");
	}
	if(!is_true(getgametypesetting(#"hash_2015355bc530a7e8")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_ring_of_fire_item_sr");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_ring_of_fire_1_item_sr");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_ring_of_fire_2_item_sr");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_ring_of_fire_3_item_sr");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_ring_of_fire_4_item_sr");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"field_upgrade_ring_of_fire_5_item_sr");
	}
	if(!is_true(getgametypesetting(#"hash_6e7905f68c5d7bdd")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_276a89fd0875409a");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_32d3740bf1d93fe");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_56f5e5578534069b");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_45a15df330b74adc");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5addc54d5927cc29");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7fecb687adf7f042");
	}
	if(!is_true(getgametypesetting(#"hash_6c0eea959e1beea9")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_62a3e74410720964");
	}
	if(!is_true(getgametypesetting(#"hash_4a821fd3ce297dbb")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_46c628be3252ab1b");
	}
	if(!is_true(getgametypesetting(#"hash_350adc73849f66ad")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5350847abcfe55a");
	}
	if(!is_true(getgametypesetting(#"hash_790760c24def02df")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2b581738427afe64");
	}
	if(!is_true(getgametypesetting(#"hash_3ad94f36f9fe01c3")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6d9ce0a337cdf3a4");
	}
	if(!is_true(getgametypesetting(#"hash_1eae2946efd5fc50")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_28143620b11383a1");
	}
	if(!is_true(getgametypesetting(#"hash_7b0522e8455161b3")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_682698368e3a043");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6ac270ce2416deb3");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2d7d38ce6d3e09db");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_680f19a3118e2c48");
	}
	if(!is_true(getgametypesetting(#"hash_115a6ae50a238213")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_18ed63a25d0c43d1");
	}
	if(!is_true(getgametypesetting(#"hash_6a0b096c6bbfd5eb")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_541f29266c6b7df8");
	}
	if(!is_true(getgametypesetting(#"hash_5bffbdd0ee4c82ed")) || !getdvarint(#"hash_2b2d7877c049d01a", 0))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3e1160ae9d1b5446");
	}
	if(!is_true(getgametypesetting(#"hash_58c821bc828f5ebe")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_ba416827a85877c");
	}
	if(!is_true(getgametypesetting(#"hash_72ad1c2b51381a57")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_24a1df9928527c11");
	}
	if(!is_true(getgametypesetting(#"hash_4cec0e29a8901e65")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2294e52d4ac78b9a");
	}
	if(!is_true(getgametypesetting(#"hash_3ab300fc07c95c32")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_54877da1f10e40b5");
	}
	if(!is_true(getgametypesetting(#"hash_3c47218eb5aa98c9")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5f6d7361258230a");
	}
	if(!is_true(getgametypesetting(#"hash_7edbf65b1ef09118")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_cefb3af28fb800b");
	}
	if(!is_true(getgametypesetting(#"hash_294ddd2442e040f4")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_58951f692bf35608");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4a604970e6ceeee");
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5a5d63f61e6770f9");
	}
	if(!is_true(getgametypesetting(#"hash_3e70ce2c501807dc")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2cdb76a587cf7a3b");
	}
	if(!is_true(getgametypesetting(#"hash_c6635a2daea5f19")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_9ead5435b1f7051");
	}
	if(!is_true(getgametypesetting(#"hash_7da80c21d54c06fe")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_357391843c5cf84c");
	}
	if(!is_true(getgametypesetting(#"hash_5288d81f40e45f48")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_124596f306f098a");
	}
	if(!is_true(getgametypesetting(#"hash_3f800fdfdeecf1a4")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5951baf77aea4bb5");
	}
	if(!is_true(getgametypesetting(#"hash_e2896eee66cc912")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_9c323d05d70c243");
	}
	if(!is_true(getgametypesetting(#"hash_7bc197f18ad9c160")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_60d26e5edbea903b");
	}
	if(!is_true(getgametypesetting(#"hash_33dfbf870d70dcff")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4cc226cdaeae487e");
	}
	if(!is_true(getgametypesetting(#"hash_160f3f7bd6c73057")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_b5a96736b401cc");
	}
	if(!is_true(getgametypesetting(#"hash_68113c8c43f83f21")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_54b96cd4694b8d8");
	}
	if(!is_true(getgametypesetting(#"hash_569740eb69009df4")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_37f2c1e35818d083");
	}
	if(!is_true(getgametypesetting(#"hash_23a116036c0c1772")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_1201c7fcb7f51efb");
	}
	if(!is_true(getgametypesetting(#"hash_23a117036c0c1925")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6e8212c05312bdca");
	}
	if(!is_true(getgametypesetting(#"hash_332bb2baad5b58ff")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_67b9395b2e0029e6");
	}
	if(!is_true(getgametypesetting(#"hash_4e9980349237e457")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_29445e5eef449964");
	}
	if(!is_true(getgametypesetting(#"hash_56993805c86d5f25")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_29c5035db4124cca");
	}
	if(!is_true(getgametypesetting(#"hash_13b948d391d89415")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_c78ec937b30c440");
	}
	if(!is_true(getgametypesetting(#"hash_196d0df204447726")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_57976ae65aa47edf");
	}
	if(!is_true(getgametypesetting(#"hash_78c5c63d405656fc")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_77228486973b1c5f");
	}
	if(!is_true(getgametypesetting(#"hash_4c45273c674d9ee4")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3458660ffe1b7fa5");
	}
	if(!is_true(getgametypesetting(#"hash_672081a388e4e5a2")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2a9b80bf6e719e25");
	}
	if(!is_true(getgametypesetting(#"hash_3e5289b2695c4ca9")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_69ff77781cdb7e44");
	}
	if(!is_true(getgametypesetting(#"hash_428c952907d62b61")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6b5294a02fc58a1a");
	}
	if(!is_true(getgametypesetting(#"hash_5b33393a60d164e")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_73abacec2fd5e23b");
	}
	if(!is_true(getgametypesetting(#"hash_37d48bb6639008a1")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_314a8049e018d6");
	}
	if(!is_true(getgametypesetting(#"hash_7af999d88a5c3e9e")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_c2dac0adf881b21");
	}
	if(!is_true(getgametypesetting(#"hash_525f16f31abe7e44")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6737da1ec5ceec49");
	}
	if(!is_true(getgametypesetting(#"hash_2c3ed1049b2a9bb8")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_7737198669ce118f");
	}
	if(!is_true(getgametypesetting(#"hash_5958b4d3a9664b7e")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_71743f1f9fdd9a4f");
	}
	if(!is_true(getgametypesetting(#"hash_6fd518232d24ffe0")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2b523070346b22a3");
	}
	if(!is_true(getgametypesetting(#"hash_2c17d5c5b5deb1d6")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_67ae49fa210cf21b");
	}
	if(!is_true(getgametypesetting(#"hash_2626d22dd381efe2")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_68c9e1eaf1008e31");
	}
	if(!is_true(getgametypesetting(#"hash_55e6f3de65ca7e70")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_e5c35c6be678059");
	}
	if(!is_true(getgametypesetting(#"hash_5fa8eb8092935d4a")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_79d7bb05f68ddc41");
	}
	if(!is_true(getgametypesetting(#"hash_1f65a3791067d2e8")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3dcbd16782db8ce9");
	}
	if(!is_true(getgametypesetting(#"hash_6bedad625441f5f9")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_796bd61d402094c");
	}
	if(!is_true(getgametypesetting(#"hash_26d369152c14a7f1")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_603b80c2dece2932");
	}
	if(!is_true(getgametypesetting(#"hash_40f536a8f29d74ba")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5867887c7438eb6b");
	}
	if(!is_true(getgametypesetting(#"hash_7e206914418d0318")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_516b9c009f958053");
	}
	if(!is_true(getgametypesetting(#"hash_170998bbdeb41682")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_66518103ed838ff3");
	}
	if(!is_true(getgametypesetting(#"hash_5965373b6c028d10")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4ca03fd7fb77142b");
	}
	if(!is_true(getgametypesetting(#"hash_ffe306b56f17a7b")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_c8e1dbdf1b9a532");
	}
	if(!is_true(getgametypesetting(#"hash_1e668f64bc52ca0b")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_70e74393ae147f98");
	}
	if(!is_true(getgametypesetting(#"hash_235cec66e8d6bee4")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_657c0726e2c50cf5");
	}
	if(!is_true(getgametypesetting(#"hash_27bb3c5a1198d400")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3e4ff275ec81e8b1");
	}
	if(!is_true(getgametypesetting(#"hash_1bfbbf0be6b090f6")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_6284d1f01b3447d9");
	}
	if(!is_true(getgametypesetting(#"hash_1bfbc00be6b092a9")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_798c6f4830e4fd58");
	}
	if(!is_true(getgametypesetting(#"hash_1bfbc10be6b0945c")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_37872a865636aca3");
	}
	if(!is_true(getgametypesetting(#"hash_62cadb1ee561ae0d")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2358dab17bbd3454");
	}
	if(!is_true(getgametypesetting(#"hash_62c0d91ee5595622")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_20b99d912e487ba1");
	}
	if(!is_true(getgametypesetting(#"hash_7bf18814d3e2c8f7")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_656765b4799b0954");
	}
	if(!is_true(getgametypesetting(#"hash_7e3300640a5b26bf")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_31d80559a5a0ec2a");
	}
	if(!is_true(getgametypesetting(#"hash_40c823219ff89d55")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4fb8b91096066f0");
	}
	if(!is_true(getgametypesetting(#"hash_cb11922d3737605")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4af2b13b3c82745e");
	}
	if(!is_true(getgametypesetting(#"hash_5cb59df3a875fa4e")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_3a06adcc040945e1");
	}
	if(!is_true(getgametypesetting(#"hash_7e95e1074078a0b4")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_e248eef6a401689");
	}
	if(!is_true(getgametypesetting(#"hash_64433bd5b95b8e2")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_5dd5b8fd48364b3d");
	}
	if(!is_true(getgametypesetting(#"hash_3b9cbac29f690970")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_14cdaa7fd97c546d");
	}
	if(!is_true(getgametypesetting(#"hash_2b42adb78f8dd85")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_26ddd582ce81b2a4");
	}
	if(!is_true(getgametypesetting(#"hash_110289ee8ee0bdf5")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_233d4b936507cefa");
	}
	if(!is_true(getgametypesetting(#"hash_1ff9ab7a376254f4")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_4902fc1a64ffced9");
	}
	if(!is_true(getgametypesetting(#"hash_379326ac1c160c72")))
	{
		namespace_1c7b37c6::function_7860b659(var_87d0eef8, #"hash_2ffc87f1c781bf91");
	}
}

