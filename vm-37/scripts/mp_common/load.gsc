#using script_165beea08a63a243;
#using script_1c65dbfc2f1c8d8f;
#using script_1cc417743d7c262d;
#using script_2a30ac7aa0ee8988;
#using script_3d9b397414d0a87d;
#using script_4108035fe400ce67;
#using script_42f9a645e203120c;
#using script_54f593f5beb1464a;
#using script_5fa3e00acab6b7b4;
#using script_655e1025200f4d5b;
#using script_6a9de48d8cd7ee4b;
#using script_7bacb32f8222fa3e;
#using script_bf0c2c69ce5745e;
#using script_d5e47f3a0e95613;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\mp_common\util.gsc;

#namespace load;

/*
	Name: function_aeb1baea
	Namespace: load
	Checksum: 0x2E2D1C34
	Offset: 0x150
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_aeb1baea()
{
	/#
		assert(!isdefined(level.var_f18a6bd6));
	#/
	level.var_f18a6bd6 = &function_5e443ed1;
}

/*
	Name: function_5e443ed1
	Namespace: load
	Checksum: 0x6D560CD3
	Offset: 0x198
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_5e443ed1()
{
	/#
		assert(isdefined(level.first_frame), "");
	#/
	level._loadstarted = 1;
	/#
		util::check_art_mode();
	#/
	/#
		util::apply_dev_overrides();
	#/
	setclearanceceiling(16);
	register_clientfields();
	level.aitriggerspawnflags = getaitriggerflags();
	level.vehicletriggerspawnflags = getvehicletriggerflags();
	setup_traversals();
	level.globallogic_audio_dialog_on_player_override = &globallogic_audio::leader_dialog_on_player;
	level.growing_hitmarker = 1;
	system::function_c11b0642();
	level flag::set(#"load_main_complete");
}

/*
	Name: init_traverse
	Namespace: load
	Checksum: 0x8836A892
	Offset: 0x2D0
	Size: 0xAE
	Parameters: 0
	Flags: Linked
*/
function init_traverse()
{
	point = getent(self.target, "targetname");
	if(isdefined(point))
	{
		self.traverse_height = point.origin[2];
		point delete();
	}
	else
	{
		point = struct::get(self.target, "targetname");
		if(isdefined(point))
		{
			self.traverse_height = point.origin[2];
		}
	}
}

/*
	Name: setup_traversals
	Namespace: load
	Checksum: 0x4C634BDA
	Offset: 0x388
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function setup_traversals()
{
	potential_traverse_nodes = getallnodes();
	for(i = 0; i < potential_traverse_nodes.size; i++)
	{
		node = potential_traverse_nodes[i];
		if(node.type == #"begin")
		{
			node init_traverse();
		}
	}
}

/*
	Name: register_clientfields
	Namespace: load
	Checksum: 0xD9D8D2CF
	Offset: 0x418
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function register_clientfields()
{
	clientfield::register("missile", "cf_m_proximity", 1, 1, "int");
	clientfield::register("missile", "cf_m_emp", 1, 1, "int");
	clientfield::register("missile", "cf_m_stun", 1, 1, "int");
}

