#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_perks.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_ce975293;

/*
	Name: function_89f2df9
	Namespace: namespace_ce975293
	Checksum: 0x3CBB8C26
	Offset: 0x120
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4126bd1da5c94003", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ce975293
	Checksum: 0x128BE412
	Offset: 0x168
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	function_27473e44();
}

/*
	Name: function_27473e44
	Namespace: namespace_ce975293
	Checksum: 0x7E028D6C
	Offset: 0x188
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_27473e44()
{
	zm_perks::register_perk_clientfields(#"hash_51b6cc6dbafb7f31", &function_37236662, &callback_func);
	zm_perks::register_perk_effects(#"hash_51b6cc6dbafb7f31", "elemental_pop_light");
	zm_perks::register_perk_init_thread(#"hash_51b6cc6dbafb7f31", &init_perk);
	zm_perks::function_f3c80d73("zombie_perk_bottle_elemental_pop");
}

/*
	Name: init_perk
	Namespace: namespace_ce975293
	Checksum: 0x498C2116
	Offset: 0x248
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function init_perk()
{
	if(is_true(level.enable_magic))
	{
		level._effect[#"elemental_pop_light"] = "zombie/fx_perk_element_pop_ndu";
	}
}

/*
	Name: function_37236662
	Namespace: namespace_ce975293
	Checksum: 0xDA991764
	Offset: 0x290
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_37236662()
{
	clientfield::register("scriptmover", "" + #"hash_2bc83061af453e44", 1, 1, "counter", &function_9717930f, 0, 0);
	clientfield::register("toplayer", "" + #"hash_12c6e46c315cd43b", 1, 1, "counter", &function_2d190a32, 0, 0);
}

/*
	Name: callback_func
	Namespace: namespace_ce975293
	Checksum: 0x80F724D1
	Offset: 0x350
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function callback_func()
{
}

/*
	Name: function_9717930f
	Namespace: namespace_ce975293
	Checksum: 0xF6EA4B93
	Offset: 0x360
	Size: 0xEC
	Parameters: 7
	Flags: Linked
*/
function function_9717930f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::playfxontag(bwastimejump, #"hash_35c5a29b4a86b5fb", self, "tag_origin");
	util::playfxontag(bwastimejump, #"hash_250adc9af94491d1", self, "tag_origin");
	util::playfxontag(bwastimejump, #"hash_4bbd9da4b24f7552", self, "tag_origin");
	playsound(bwastimejump, #"hash_67d6791052a84d2a", self.origin + vectorscale((0, 0, 1), 75));
}

/*
	Name: function_2d190a32
	Namespace: namespace_ce975293
	Checksum: 0x87BEAAB2
	Offset: 0x458
	Size: 0x84
	Parameters: 7
	Flags: Linked, Private
*/
function private function_2d190a32(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(zm_utility::function_f8796df3(bwastimejump))
	{
		playfxoncamera(bwastimejump, #"hash_b471a5df94f45b7", undefined, (1, 0, 0), (0, 0, 1));
	}
}

