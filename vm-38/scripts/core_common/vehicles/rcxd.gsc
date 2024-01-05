#using scripts\core_common\vehicles\smart_bomb.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace rcxd;

/*
	Name: function_ad8e96f3
	Namespace: rcxd
	Checksum: 0xC663C6F
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ad8e96f3()
{
	level notify(1787841315);
}

/*
	Name: __init__system__
	Namespace: rcxd
	Checksum: 0x4217FC03
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"rcxd", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: rcxd
	Checksum: 0xA7714ACB
	Offset: 0x130
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("rcxd", &function_91ea9492);
}

/*
	Name: function_91ea9492
	Namespace: rcxd
	Checksum: 0x467511FB
	Offset: 0x168
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_91ea9492()
{
	smart_bomb::function_c6f75619();
	self.detonate_sides_disabled = 1;
	self useanimtree("generic");
	self initsounds();
	if(isdefined(level.vehicle_initializer_cb))
	{
		[[level.vehicle_initializer_cb]](self);
	}
	defaultrole();
}

/*
	Name: defaultrole
	Namespace: rcxd
	Checksum: 0xB9F08BA7
	Offset: 0x200
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function defaultrole()
{
	self vehicle_ai::init_state_machine_for_role("default");
	self vehicle_ai::get_state_callbacks("combat").update_func = &smart_bomb::state_combat_update;
	self vehicle_ai::get_state_callbacks("driving").update_func = &smart_bomb::state_scripted_update;
	self vehicle_ai::get_state_callbacks("death").update_func = &smart_bomb::state_death_update;
	self vehicle_ai::get_state_callbacks("emped").update_func = &smart_bomb::state_emped_update;
	self vehicle_ai::call_custom_add_state_callbacks();
	vehicle_ai::startinitialstate("combat");
}

/*
	Name: initsounds
	Namespace: rcxd
	Checksum: 0xC2461FE6
	Offset: 0x318
	Size: 0x19C
	Parameters: 0
	Flags: Linked
*/
function initsounds()
{
	self.sndalias = [];
	self.sndalias[#"inair"] = #"hash_65ec2e5d43b62423";
	self.sndalias[#"land"] = #"hash_26fddc98c4b5aa5a";
	self.sndalias[#"spawn"] = #"hash_1b30b26c406054e2";
	self.sndalias[#"direction"] = #"hash_69f9a2b48dccef90";
	self.sndalias[#"jump_up"] = #"hash_43b08a05140c0ea9";
	self.sndalias[#"vehclose250"] = #"hash_7a70a6fa72ea121";
	self.sndalias[#"vehclose1500"] = #"hash_548fbad0d3c63e20";
	self.sndalias[#"vehtargeting"] = #"hash_29426008ddf3da16";
	self.sndalias[#"vehalarm"] = #"hash_4966894e7ae3a222";
	self.sndalias[#"vehcollision"] = #"veh_wasp_wall_imp";
}

