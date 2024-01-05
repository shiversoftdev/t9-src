#using scripts\zm_common\zm_utility.gsc;
#using script_54f593f5beb1464a;
#using script_2a30ac7aa0ee8988;

#namespace namespace_5f402033;

/*
	Name: function_cbf03149
	Namespace: namespace_5f402033
	Checksum: 0xEED16E92
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cbf03149()
{
	level notify(-2128039538);
}

/*
	Name: function_ceb1991
	Namespace: namespace_5f402033
	Checksum: 0x986FA313
	Offset: 0x98
	Size: 0x2C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_ceb1991()
{
	if(zm_utility::is_survival())
	{
		function_c2e022a9();
	}
}

/*
	Name: function_c2e022a9
	Namespace: namespace_5f402033
	Checksum: 0x7D1DACD0
	Offset: 0xD0
	Size: 0x28C
	Parameters: 0
	Flags: Linked
*/
function function_c2e022a9()
{
	var_87d0eef8 = &item_world_fixup::remove_item;
	var_74257310 = &item_world_fixup::add_item_replacement;
	var_f8a4c541 = &item_world_fixup::function_6991057;
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_2bc860861f3d0de8", #"hash_5a0d71e3ac445440");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_221906f8bdc73445", #"hash_34df7602d5c008cf");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_75919f57f0b525e", #"hash_2e0356881af935f6");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_34d3979a2a288fc3", #"hash_1a9c5ea66e491d35");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_184696e078d57224", #"hash_61fe0b38b86cdf0c");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_2a6d2a28bc20ca41", #"hash_71dc2a9d0a3c625b");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_5427efb18ee54422", #"hash_2b455c54acf3644a");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_320e621e924cb7cb", #"hash_644a55abccb4047d");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_29ab9a9818e29ecc", #"hash_21ae4040db3031b4");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_5dd2700b68b0d40d", #"hash_6e29125f3e375ef7");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_456961fe239bd146", #"hash_7ef0aff472cef99e");
	namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_4cd08be9a04e390f", #"hash_a577596a7137b51");
}

