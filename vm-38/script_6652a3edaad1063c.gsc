#using script_164ba4a711296dd5;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\wz_common\util.gsc;

#namespace insertion;

/*
	Name: function_a2e39cfb
	Namespace: insertion
	Checksum: 0xCCBC9B39
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a2e39cfb()
{
	level notify(1580947635);
}

/*
	Name: init
	Namespace: insertion
	Checksum: 0x3A443741
	Offset: 0x98
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function init()
{
	level.var_a2915a68 = insertion_passenger_count::register();
	level.var_a3c0d635 = &insertion_passenger_count::is_open;
	level.var_f3320ad2 = &insertion_passenger_count::open;
	level.var_81b39a59 = &insertion_passenger_count::close;
	level.var_ce84dde9 = &insertion_passenger_count::set_count;
	callback::add_callback(#"hash_1634199a59f10727", &function_dd98c073);
	callback::add_callback(#"hash_20fcd06900f62558", &function_ddce9055);
}

/*
	Name: function_dd98c073
	Namespace: insertion
	Checksum: 0x80F724D1
	Offset: 0x180
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_dd98c073()
{
}

/*
	Name: function_ddce9055
	Namespace: insertion
	Checksum: 0x69B0F7E
	Offset: 0x190
	Size: 0x118
	Parameters: 0
	Flags: None
*/
function function_ddce9055()
{
	var_e8d63736 = array(#"hash_780a85992e00c556", #"hash_1669c4b328d5e163", #"hash_67baa029914d2410", #"hash_3f71a3968fd86875");
	var_1f1b9efb = var_e8d63736[randomint(var_e8d63736.size)];
	if(isdefined(self))
	{
		foreach(player in self.players)
		{
			if(isdefined(player))
			{
				player playlocalsound(var_1f1b9efb);
			}
		}
	}
}

