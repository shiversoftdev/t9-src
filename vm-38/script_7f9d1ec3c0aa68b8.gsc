#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_vo;

/*
	Name: function_297bb152
	Namespace: zm_vo
	Checksum: 0x3278FB69
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_297bb152()
{
	level notify(1667024442);
}

/*
	Name: function_89f2df9
	Namespace: zm_vo
	Checksum: 0xBEE5BFFA
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_vo", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_vo
	Checksum: 0xC1106831
	Offset: 0x100
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::function_a8bbc967("zm_hud.commander_speaking", #"zm_hud", #"commander_speaking", 1, 5, "int", undefined, 0, 0);
	level.var_4edd846 = &function_d1711916;
}

/*
	Name: function_d1711916
	Namespace: zm_vo
	Checksum: 0xCE6DC665
	Offset: 0x178
	Size: 0x59A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d1711916(var_332276f2, dialogkey)
{
	switch(dialogkey)
	{
		case "hash_5f3108a8ed351288":
		{
			return var_332276f2.var_57aeff94;
		}
		case "hash_5e2a1ca8dc76be67":
		{
			return var_332276f2.var_1d7e6d4f;
		}
		case "hash_e98c059b131f86c":
		{
			return var_332276f2.var_78a321f1;
		}
		case "hash_2e657370192514b5":
		{
			return var_332276f2.var_8cf2fd05;
		}
		case "hash_4e2a478df2a81e8c":
		{
			return var_332276f2.var_6275013;
		}
		case "hash_4990f9c23cc9c32a":
		{
			return var_332276f2.var_4e454b1f;
		}
		case "hash_7bc0702612f442b9":
		{
			return var_332276f2.var_415efa99;
		}
		case "hash_4e930dbe494975b4":
		{
			return var_332276f2.var_675f3003;
		}
		case "hash_5e9f5daa234fe730":
		{
			return var_332276f2.var_fc81fdbb;
		}
		case "hash_51d31303312306d":
		{
			return var_332276f2.var_c24b2eea;
		}
		case "hash_69eda3d15a6035ab":
		{
			return var_332276f2.var_ead40107;
		}
		case "hash_2e354b187fdbfbbc":
		{
			return var_332276f2.var_26b25ec0;
		}
		case "hash_49f4ae06ae4af262":
		{
			return var_332276f2.var_2da3f7bd;
		}
		case "hash_76483333c5c6984":
		{
			return var_332276f2.var_8cf57938;
		}
		case "hash_14f8f2f4fa732dbd":
		{
			return var_332276f2.var_da554fd6;
		}
		case "hash_4542da19e0c104c":
		{
			return var_332276f2.var_de5c6530;
		}
		case "hash_5fc866a41152b3c":
		{
			return var_332276f2.var_a5d46693;
		}
		case "hash_5b20033c44a4321f":
		{
			return var_332276f2.var_29e91c40;
		}
		case "hash_6ea3cc8f89d4e196":
		{
			return var_332276f2.var_f4ff0388;
		}
		case "hash_6f196f933d7ff3ac":
		{
			return var_332276f2.var_eecf27c;
		}
		case "hash_7800d9b3f28f81ff":
		{
			return var_332276f2.var_65cbd0b3;
		}
		case "hash_db5b175bd794f60":
		{
			return var_332276f2.var_dbfd0b22;
		}
		case "hash_37d287851f148bc":
		{
			return var_332276f2.var_5e0f090;
		}
		case "hash_2b309e3eecad85fb":
		{
			return var_332276f2.var_af9eafb0;
		}
		case "hash_739c39c90683d021":
		{
			return var_332276f2.var_b4c1e119;
		}
		case "hash_4f054ee9602c2197":
		{
			return var_332276f2.var_54ec9c14;
		}
		case "hash_307d328d2ca73346":
		{
			return var_332276f2.var_87856536;
		}
		case "hash_287f99f86f82e12e":
		{
			return var_332276f2.var_af44f652;
		}
		case "hash_3c46000cdd88c6a1":
		{
			return var_332276f2.var_f35b9f76;
		}
		case "hash_5605b2abdf38cd4":
		{
			return var_332276f2.var_ea4e2490;
		}
		case "hash_22f552b15fc207f8":
		{
			return var_332276f2.var_5030cbb3;
		}
		case "hash_1aadb875c07be53a":
		{
			return var_332276f2.var_6a9e0dd7;
		}
		case "hash_33fa52ed652faf8a":
		{
			return var_332276f2.var_3badb1da;
		}
		case "hash_35f32b2271ef6ed7":
		{
			return var_332276f2.var_15fd8202;
		}
		case "hash_462ae51bbab3172a":
		{
			return var_332276f2.var_b22401a2;
		}
		case "hash_13b63b8343516b9e":
		{
			return var_332276f2.var_aa5adc89;
		}
		case "hash_db9d5c95dfea201":
		{
			return var_332276f2.var_a07153d7;
		}
		case "hash_504ad9537b38881f":
		{
			return var_332276f2.var_dc4f7a61;
		}
		case "hash_2a901c3db306ba24":
		{
			return var_332276f2.var_e63f226f;
		}
		case "hash_25d360e4ab517722":
		{
			return var_332276f2.var_ee31533f;
		}
		case "hash_23e7594539b63cb8":
		{
			return var_332276f2.var_813486d3;
		}
		case "hash_365549a15c5bde23":
		{
			return var_332276f2.var_63b4674c;
		}
		case "hash_7355d2a605e99ad6":
		{
			return var_332276f2.var_c3e62e0e;
		}
		case "hash_f4743ddde12c80c":
		{
			return var_332276f2.var_7f02b6c7;
		}
		case "hash_3321e0bf2e424c30":
		{
			return var_332276f2.var_c74169bf;
		}
		case "hash_3580f779bbcaa04d":
		{
			return var_332276f2.var_5ede0944;
		}
		case "hash_75c2910f28185f25":
		{
			return var_332276f2.var_6577839f;
		}
		case "hash_2238f6ae2f9c8847":
		{
			return var_332276f2.var_c150e63a;
		}
		case "hash_34a0c6f7267b8ba5":
		{
			return var_332276f2.var_dd1d58bf;
		}
		case "hash_73fd41d7b25c7854":
		{
			return var_332276f2.var_861c8fa7;
		}
	}
}

