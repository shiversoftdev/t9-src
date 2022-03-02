#using script_35ae72be7b4fec10;
#using script_3626f1b2cf51a99c;
#using script_4ccd0c3512b52a10;
#using script_7d0013bbc05623b9;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\cp_common\objectives.gsc;

#namespace namespace_2943ccdc;

/*
	Name: function_f31b00f5
	Namespace: namespace_2943ccdc
	Checksum: 0xF60A665C
	Offset: 0x2F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f31b00f5()
{
	level notify(2003742534);
}

/*
	Name: function_89f2df9
	Namespace: namespace_2943ccdc
	Checksum: 0x5CB2A6B3
	Offset: 0x310
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_ee64d6a280a2e42", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_2943ccdc
	Checksum: 0xA59AD030
	Offset: 0x358
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "toggle_interactive_map", 1, 1, "int");
}

/*
	Name: open
	Namespace: namespace_2943ccdc
	Checksum: 0x3C47994D
	Offset: 0x398
	Size: 0x68C
	Parameters: 10
	Flags: None
*/
function open(var_738a6265, top_left, bottom_right, var_879505e1, var_ff0f9714, var_3031d93b, var_3e6ff5b7, map_width, map_height, var_7ec0800f)
{
	if(!isdefined(var_879505e1))
	{
		var_879505e1 = 1;
	}
	if(!isdefined(var_ff0f9714))
	{
		var_ff0f9714 = 1;
	}
	if(!namespace_61e6d095::exists(#"hash_ee64d6a280a2e42"))
	{
		player = getplayers()[0];
		player actions::function_6c59e78f(0);
		player thread namespace_61e6d095::function_4bfa9617("close_interactive_map");
		player val::set(#"hash_46ef83540c23a2f7", "freezecontrols", 1);
		namespace_61e6d095::create(#"hash_ee64d6a280a2e42", var_738a6265);
		namespace_61e6d095::function_28027c42(#"hash_ee64d6a280a2e42", [2:#"hash_72cc4740fa4d3da3", 1:#"hash_66c6997fe4c5ccf", 0:#"hash_ee64d6a280a2e42"]);
		namespace_61e6d095::function_24e5fa63(#"hash_ee64d6a280a2e42", [1:#"hash_3c27402259e4c18e", 0:#"ui_confirm"], 1);
		if(!isdefined(top_left))
		{
			top_left = getent("interactive_map_top_left", "targetname");
			if(!isdefined(top_left))
			{
				top_left = struct::get("interactive_map_top_left", "targetname");
			}
		}
		if(!isdefined(bottom_right))
		{
			bottom_right = getent("interactive_map_bottom_right", "targetname");
			if(!isdefined(bottom_right))
			{
				bottom_right = struct::get("interactive_map_bottom_right", "targetname");
			}
		}
		if(isdefined(var_3031d93b))
		{
			namespace_61e6d095::set_x(#"hash_ee64d6a280a2e42", var_3031d93b);
		}
		if(isdefined(var_3e6ff5b7))
		{
			namespace_61e6d095::set_y(#"hash_ee64d6a280a2e42", var_3e6ff5b7);
		}
		if(isdefined(map_width))
		{
			namespace_61e6d095::function_8b0b5811(#"hash_ee64d6a280a2e42", map_width);
		}
		if(isdefined(map_height))
		{
			namespace_61e6d095::function_5dbd7024(#"hash_ee64d6a280a2e42", map_height);
		}
		if(is_true(var_7ec0800f) && isentity(top_left) && isentity(bottom_right))
		{
			namespace_61e6d095::function_9ade1d9b(#"hash_ee64d6a280a2e42", "topLeftEntNum", top_left getentitynumber());
			namespace_61e6d095::function_9ade1d9b(#"hash_ee64d6a280a2e42", "bottomRightEntNum", bottom_right getentitynumber());
		}
		x_axis = anglestoright(top_left.angles) * -1;
		y_axis = anglestoforward(top_left.angles);
		var_2a5cff6e = bottom_right.origin - top_left.origin;
		width = vectordot(var_2a5cff6e, x_axis);
		height = vectordot(var_2a5cff6e, y_axis);
		if(!isdefined(level.var_2943ccdc))
		{
			level.var_2943ccdc = {};
		}
		level.var_2943ccdc.dims = {#y_axis:y_axis, #x_axis:x_axis, #height:height, #width:width, #top_left:top_left.origin};
		if(!isdefined(level.var_2943ccdc.objects))
		{
			level.var_2943ccdc.objects = [];
		}
		if(!isdefined(level.var_2943ccdc.var_147d40f0))
		{
			level.var_2943ccdc.var_147d40f0 = [];
		}
		function_9af7280f(level.var_2943ccdc.objects);
		function_59b2a130(level.var_2943ccdc.var_147d40f0);
		function_9af7280f(getentarray("interactive_map_object", "script_noteworthy"));
		function_59b2a130(getentarray("interactive_map_hotspot", "script_noteworthy"));
		if(is_true(var_879505e1))
		{
			player function_879505e1(var_ff0f9714);
		}
	}
	else
	{
		/#
			assertmsg("");
		#/
	}
}

/*
	Name: function_e0cc3b71
	Namespace: namespace_2943ccdc
	Checksum: 0xF271F729
	Offset: 0xA30
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_e0cc3b71(name, value)
{
	namespace_61e6d095::function_9ade1d9b(#"hash_ee64d6a280a2e42", name, value);
}

/*
	Name: function_879505e1
	Namespace: namespace_2943ccdc
	Checksum: 0xB6BA3C59
	Offset: 0xA78
	Size: 0x41C
	Parameters: 3
	Flags: Linked
*/
function function_879505e1(var_ff0f9714, var_509b0860, var_74ac68df)
{
	if(!isdefined(var_ff0f9714))
	{
		var_ff0f9714 = 1;
	}
	if(!isdefined(var_509b0860))
	{
		var_509b0860 = #"hash_780067c4596705d7";
	}
	if(!isdefined(var_74ac68df))
	{
		var_74ac68df = #"hash_71f8107215effa5b";
	}
	/#
		assert(namespace_61e6d095::exists(#"hash_ee64d6a280a2e42"), "");
	#/
	function_23036faa(#"cursor", "uid", #"cursor");
	function_23036faa(#"cursor", "widgetName", var_509b0860);
	function_23036faa(#"cursor", "cursorImage", var_74ac68df);
	function_23036faa(#"cursor", "rightAligned", 0);
	function_23036faa(#"cursor", "bottomAligned", 0);
	namespace_61e6d095::function_9ade1d9b(#"hash_ee64d6a280a2e42", ("cursor" + ".") + "update", 1, 1, 0, 0, 1);
	function_41d66375(#"cursor", "descriptionList");
	function_41d66375(#"cursor", "interactionList");
	function_8b43da33();
	function_e4d34e68(0);
	prompts::function_e79f51ec(#"cursor");
	level.var_2943ccdc.var_1cd32747 = vectorscale((1, 1, 0), 0.5);
	if(isdefined(level.var_2943ccdc.var_87c49d20))
	{
		var_75576067 = level.var_2943ccdc.var_87c49d20 - level.var_2943ccdc.dims.top_left;
		level.var_2943ccdc.var_1cd32747 = (vectordot(var_75576067, level.var_2943ccdc.dims.x_axis) / level.var_2943ccdc.dims.width, vectordot(var_75576067, level.var_2943ccdc.dims.y_axis) / level.var_2943ccdc.dims.height, 0);
	}
	function_23036faa(#"cursor", "x", level.var_2943ccdc.var_1cd32747[0]);
	function_23036faa(#"cursor", "y", level.var_2943ccdc.var_1cd32747[1]);
	self clientfield::set_to_player("toggle_interactive_map", 1);
	thread function_75cb287(var_ff0f9714);
}

/*
	Name: function_50121b9
	Namespace: namespace_2943ccdc
	Checksum: 0xD8D64BC8
	Offset: 0xEA0
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function function_50121b9(position)
{
	if(!isdefined(level.var_2943ccdc))
	{
		level.var_2943ccdc = {};
	}
	level.var_2943ccdc.var_87c49d20 = position;
}

/*
	Name: function_9e8d4999
	Namespace: namespace_2943ccdc
	Checksum: 0x435CC780
	Offset: 0xEE8
	Size: 0x3B6
	Parameters: 4
	Flags: Linked
*/
function function_9e8d4999(title, descriptions, interactions, object)
{
	if(!isdefined(title))
	{
		title = #"";
	}
	if(!isdefined(descriptions))
	{
		descriptions = [];
	}
	else if(!isarray(descriptions))
	{
		descriptions = array(descriptions);
	}
	if(!isdefined(interactions))
	{
		interactions = [];
	}
	else if(!isarray(interactions))
	{
		interactions = array(interactions);
	}
	function_23036faa(#"cursor", "title", title);
	foreach(index, description in descriptions)
	{
		function_39d12272(#"cursor", index, "text", description, "descriptionList");
	}
	if(isdefined(level.var_2943ccdc.var_2c15274b.descriptions))
	{
		for(index = descriptions.size; index < level.var_2943ccdc.var_2c15274b.descriptions.size; index++)
		{
			function_dcedf7f(#"cursor", index, "descriptionList");
		}
	}
	var_fadf668d = 0;
	player = getplayers()[0];
	player prompts::function_ee7adae5(#"cursor");
	foreach(interaction in interactions)
	{
		player prompts::function_c97a48c7(prompt, interaction);
		var_fadf668d = 1;
	}
	if(var_fadf668d)
	{
		player prompts::function_46f198(#"hash_ee64d6a280a2e42", ((((("cursor" + ".") + "mapObjects") + ".") + #"cursor") + ".") + "interactionList");
	}
	level.var_2943ccdc.var_2c15274b = {#object:object, #interactions:interactions, #descriptions:descriptions, #title:title};
}

/*
	Name: function_e4d34e68
	Namespace: namespace_2943ccdc
	Checksum: 0x36575182
	Offset: 0x12A8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_e4d34e68(state)
{
	if(!isdefined(state))
	{
		state = 0;
	}
	function_23036faa(#"cursor", "state", state);
}

/*
	Name: function_8b43da33
	Namespace: namespace_2943ccdc
	Checksum: 0xFD68CF9B
	Offset: 0x12F8
	Size: 0x146
	Parameters: 0
	Flags: Linked
*/
function function_8b43da33()
{
	function_23036faa(#"cursor", "title", #"");
	if(isdefined(level.var_2943ccdc.var_2c15274b))
	{
		foreach(index, description in level.var_2943ccdc.var_2c15274b.descriptions)
		{
			function_dcedf7f(#"cursor", index, "descriptionList");
		}
		getplayers()[0] prompts::function_ee7adae5(#"cursor");
		level.var_2943ccdc.var_2c15274b = undefined;
	}
}

/*
	Name: function_2fb5abd8
	Namespace: namespace_2943ccdc
	Checksum: 0x2AD97669
	Offset: 0x1448
	Size: 0x156
	Parameters: 0
	Flags: None
*/
function function_2fb5abd8()
{
	level notify(#"hash_546b1fe54ba63887");
	player = getplayers()[0];
	player clientfield::set_to_player("toggle_interactive_map", 0);
	util::wait_network_frame(2);
	player prompts::function_ee7adae5(#"cursor");
	function_23036faa(#"cursor", "widgetName", #"");
	namespace_61e6d095::function_9ade1d9b(#"hash_ee64d6a280a2e42", ("cursor" + ".") + "update", 1, 1, 0, 0, 1);
	namespace_61e6d095::function_43525bc6(#"hash_ee64d6a280a2e42", #"cursor", 1);
	level.var_2943ccdc.var_2c15274b = undefined;
}

/*
	Name: add_object
	Namespace: namespace_2943ccdc
	Checksum: 0xDF5A7EE3
	Offset: 0x15A8
	Size: 0x444
	Parameters: 6
	Flags: Linked
*/
function add_object(uid, image, var_6d62c29c, angle_offset, title, scale)
{
	if(!isdefined(image))
	{
		image = #"hash_215b9409f9d7cc36";
	}
	if(!isdefined(self.var_2943ccdc))
	{
		self.var_2943ccdc = {};
	}
	if(!isdefined(uid))
	{
		uid = self.var_2943ccdc.uid;
	}
	if(!isdefined(var_6d62c29c))
	{
		var_6d62c29c = self.var_2943ccdc.var_6d62c29c;
	}
	if(!isdefined(angle_offset))
	{
		angle_offset = self.var_2943ccdc.angle_offset;
	}
	if(!isdefined(title))
	{
		title = self.var_2943ccdc.title;
	}
	if(!isdefined(scale))
	{
		scale = self.var_2943ccdc.scale;
	}
	if(!isdefined(uid) && isentity(self))
	{
		uid = self getentitynumber();
	}
	if(!isdefined(uid))
	{
		return;
	}
	level.var_2943ccdc.objects[uid] = self;
	if(isdefined(self.var_2943ccdc.image) && image == #"hash_215b9409f9d7cc36")
	{
		image = self.var_2943ccdc.image;
	}
	self.var_2943ccdc.uid = uid;
	self.var_2943ccdc.image = image;
	self.var_2943ccdc.var_6d62c29c = var_6d62c29c;
	self.var_2943ccdc.angle_offset = angle_offset;
	self.var_2943ccdc.title = title;
	self.var_2943ccdc.scale = scale;
	if(!namespace_61e6d095::exists(#"hash_ee64d6a280a2e42"))
	{
		return;
	}
	function_db6cb581(uid, #"hash_21fb68e196ffe610");
	function_d0243e5b(uid, "image", image);
	function_d0243e5b(uid, "x", 0.5);
	function_d0243e5b(uid, "y", 0.5);
	if(is_true(var_6d62c29c))
	{
		function_d0243e5b(uid, "angle", 0);
	}
	if(isdefined(title))
	{
		function_d0243e5b(uid, "title", title);
	}
	if(isdefined(scale))
	{
		function_d0243e5b(uid, "scale", scale);
	}
	function_d0243e5b(uid, "flags", 0);
	function_d0243e5b(uid, "state", 0);
	if(isdefined(self.var_62d718e2))
	{
		foreach(var_55633c65 in self.var_62d718e2)
		{
			function_d0243e5b(uid, var_55633c65.name, var_55633c65.var_872a88cd);
		}
	}
	self thread function_9dfe141f(uid, var_6d62c29c, angle_offset);
}

/*
	Name: function_d76aae9f
	Namespace: namespace_2943ccdc
	Checksum: 0xC0E21FDB
	Offset: 0x19F8
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function function_d76aae9f(uid, state)
{
	if(isdefined(level.var_2943ccdc.objects[uid]))
	{
		function_d0243e5b(uid, "state", state);
	}
}

/*
	Name: function_c8d8772e
	Namespace: namespace_2943ccdc
	Checksum: 0x2B38F37D
	Offset: 0x1A58
	Size: 0x15C
	Parameters: 2
	Flags: None
*/
function function_c8d8772e(uid, flags)
{
	if(isdefined(level.var_2943ccdc.objects[uid]))
	{
		if(!isdefined(flags))
		{
			flags = [];
		}
		else if(!isarray(flags))
		{
			flags = array(flags);
		}
		var_c2e076fc = 0;
		foreach(flag in flags)
		{
			var_c2e076fc = var_c2e076fc | (1 << flag);
		}
		var_b89f8baa = function_dbf83dc4(uid, "flags");
		if(isdefined(var_b89f8baa))
		{
			var_c2e076fc = var_c2e076fc | var_b89f8baa;
		}
		function_d0243e5b(uid, "flags", var_c2e076fc);
	}
}

/*
	Name: function_cc611397
	Namespace: namespace_2943ccdc
	Checksum: 0xF2FB9647
	Offset: 0x1BC0
	Size: 0x158
	Parameters: 2
	Flags: None
*/
function function_cc611397(uid, flags)
{
	if(isdefined(level.var_2943ccdc.objects[uid]))
	{
		var_c2e076fc = 0;
		var_b89f8baa = (isdefined(function_dbf83dc4(uid, "flags")) ? function_dbf83dc4(uid, "flags") : 0);
		var_c2e076fc = var_b89f8baa;
		if(!isdefined(flags))
		{
			flags = [];
		}
		else if(!isarray(flags))
		{
			flags = array(flags);
		}
		foreach(flag in flags)
		{
			var_c2e076fc = var_c2e076fc & (~(1 << flag));
		}
	}
}

/*
	Name: remove_object
	Namespace: namespace_2943ccdc
	Checksum: 0xA80503C8
	Offset: 0x1D20
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function remove_object(uid)
{
	if(isdefined(level.var_2943ccdc.objects[uid]))
	{
		level.var_2943ccdc.objects[uid] notify(#"hash_7c1f9e1214f47b4e");
		if(namespace_61e6d095::exists(#"hash_ee64d6a280a2e42"))
		{
			function_455d4424(uid);
		}
		arrayremoveindex(level.var_2943ccdc.objects, uid, 1);
	}
}

/*
	Name: function_87f0056b
	Namespace: namespace_2943ccdc
	Checksum: 0x27187758
	Offset: 0x1DE0
	Size: 0x102
	Parameters: 0
	Flags: None
*/
function function_87f0056b()
{
	if(namespace_61e6d095::exists(#"hash_ee64d6a280a2e42"))
	{
		foreach(uid, object in level.var_2943ccdc.objects)
		{
			level.var_2943ccdc.objects[uid] notify(#"hash_7c1f9e1214f47b4e");
			function_455d4424(uid);
		}
	}
	if(isdefined(level.var_2943ccdc.objects))
	{
		level.var_2943ccdc.objects = [];
	}
}

/*
	Name: function_d0243e5b
	Namespace: namespace_2943ccdc
	Checksum: 0xD0711986
	Offset: 0x1EF0
	Size: 0x64
	Parameters: 3
	Flags: Linked
*/
function function_d0243e5b(uid, name, value)
{
	namespace_61e6d095::function_d7d2fcce(#"hash_ee64d6a280a2e42", ((("mapObjects" + ".") + uid) + ".") + name, value);
}

/*
	Name: function_dbf83dc4
	Namespace: namespace_2943ccdc
	Checksum: 0x90D4A16A
	Offset: 0x1F60
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_dbf83dc4(uid, name)
{
	namespace_61e6d095::function_92ba69fa(#"hash_ee64d6a280a2e42", ((("mapObjects" + ".") + uid) + ".") + name);
}

/*
	Name: function_68ec091e
	Namespace: namespace_2943ccdc
	Checksum: 0xBDEE8ADB
	Offset: 0x1FC8
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_68ec091e(uid, scale)
{
	function_d0243e5b(uid, "scale", scale);
}

/*
	Name: function_23036faa
	Namespace: namespace_2943ccdc
	Checksum: 0x97E8AF4B
	Offset: 0x2008
	Size: 0x6C
	Parameters: 3
	Flags: Linked
*/
function function_23036faa(uid, name, value)
{
	namespace_61e6d095::function_9ade1d9b(#"hash_ee64d6a280a2e42", (((("cursor." + "mapObjects") + ".") + uid) + ".") + name, value);
}

/*
	Name: function_fce63823
	Namespace: namespace_2943ccdc
	Checksum: 0xF3593AF8
	Offset: 0x2080
	Size: 0x62
	Parameters: 2
	Flags: Linked
*/
function function_fce63823(uid, name)
{
	return namespace_61e6d095::function_f7c4c669(#"hash_ee64d6a280a2e42", (((("cursor." + "mapObjects") + ".") + uid) + ".") + name);
}

/*
	Name: function_835fb58e
	Namespace: namespace_2943ccdc
	Checksum: 0x8A75026B
	Offset: 0x20F0
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_835fb58e(scale)
{
	function_23036faa(#"cursor", "scale", scale);
}

/*
	Name: function_41d66375
	Namespace: namespace_2943ccdc
	Checksum: 0xEF17C7C
	Offset: 0x2130
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function function_41d66375(uid, var_29459a31)
{
	namespace_61e6d095::function_330981ed(#"hash_ee64d6a280a2e42", (((("cursor." + "mapObjects") + ".") + uid) + ".") + var_29459a31);
}

/*
	Name: function_39d12272
	Namespace: namespace_2943ccdc
	Checksum: 0x29FF7BC2
	Offset: 0x21A0
	Size: 0x84
	Parameters: 5
	Flags: Linked
*/
function function_39d12272(uid, index, name, value, var_29459a31)
{
	namespace_61e6d095::function_f2a9266(#"hash_ee64d6a280a2e42", index, name, value, (((("cursor." + "mapObjects") + ".") + uid) + ".") + var_29459a31);
}

/*
	Name: function_dcedf7f
	Namespace: namespace_2943ccdc
	Checksum: 0xAAC03173
	Offset: 0x2230
	Size: 0x74
	Parameters: 3
	Flags: Linked
*/
function function_dcedf7f(uid, index, var_29459a31)
{
	namespace_61e6d095::function_7239e030(#"hash_ee64d6a280a2e42", index, (((("cursor." + "mapObjects") + ".") + uid) + ".") + var_29459a31);
}

/*
	Name: function_7793b318
	Namespace: namespace_2943ccdc
	Checksum: 0x4EE077BD
	Offset: 0x22B0
	Size: 0x62
	Parameters: 3
	Flags: None
*/
function function_7793b318(uid, index, var_29459a31)
{
	return namespace_61e6d095::function_cd59371c(uid, index, (((("cursor." + "mapObjects") + ".") + uid) + ".") + var_29459a31);
}

/*
	Name: function_9af7280f
	Namespace: namespace_2943ccdc
	Checksum: 0xDBB8C7D4
	Offset: 0x2320
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_9af7280f(objects)
{
	foreach(object in objects)
	{
		if(function_7a600918(uid))
		{
			object add_object(uid);
			continue;
		}
		object add_object();
	}
}

/*
	Name: function_6385c805
	Namespace: namespace_2943ccdc
	Checksum: 0x63088B7F
	Offset: 0x23E8
	Size: 0x1B8
	Parameters: 0
	Flags: Linked
*/
function function_6385c805()
{
	array::add(level.var_2943ccdc.var_147d40f0, self, 0);
	var_fe23d888 = self.origin - level.var_2943ccdc.dims.top_left;
	self.var_2ac0bdff = (vectordot(var_fe23d888, level.var_2943ccdc.dims.x_axis) / level.var_2943ccdc.dims.width, vectordot(var_fe23d888, level.var_2943ccdc.dims.y_axis) / level.var_2943ccdc.dims.height, 0);
	if(namespace_61e6d095::exists(#"hash_ee64d6a280a2e42") && isdefined(self.var_62d718e2))
	{
		foreach(var_55633c65 in self.var_62d718e2)
		{
			function_e0cc3b71(var_55633c65.name, var_55633c65.var_872a88cd);
		}
	}
}

/*
	Name: function_59b2a130
	Namespace: namespace_2943ccdc
	Checksum: 0x373305B3
	Offset: 0x25A8
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function function_59b2a130(triggers)
{
	foreach(trigger in triggers)
	{
		trigger function_6385c805();
	}
}

/*
	Name: function_5a9ea417
	Namespace: namespace_2943ccdc
	Checksum: 0x9A180FB8
	Offset: 0x2640
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_5a9ea417()
{
	arrayremovevalue(level.var_2943ccdc.var_147d40f0, self);
}

/*
	Name: function_b2ece0a3
	Namespace: namespace_2943ccdc
	Checksum: 0x1C4A69B6
	Offset: 0x2678
	Size: 0x2E
	Parameters: 0
	Flags: None
*/
function function_b2ece0a3()
{
	if(isdefined(level.var_2943ccdc.var_147d40f0))
	{
		level.var_2943ccdc.var_147d40f0 = [];
	}
}

/*
	Name: function_9bc3d847
	Namespace: namespace_2943ccdc
	Checksum: 0xB731D77C
	Offset: 0x26B0
	Size: 0xB4
	Parameters: 4
	Flags: None
*/
function function_9bc3d847(event, name, value, var_872a88cd)
{
	if(!isdefined(self.var_62d718e2))
	{
		self.var_62d718e2 = [];
	}
	else if(!isarray(self.var_62d718e2))
	{
		self.var_62d718e2 = array(self.var_62d718e2);
	}
	self.var_62d718e2[event] = {#hash_872a88cd:var_872a88cd, #value:value, #name:name};
}

/*
	Name: function_4692570b
	Namespace: namespace_2943ccdc
	Checksum: 0x2E895136
	Offset: 0x2770
	Size: 0xF4
	Parameters: 2
	Flags: None
*/
function function_4692570b(event, value)
{
	if(isdefined(self.var_62d718e2[event]))
	{
		self.var_62d718e2[event].var_872a88cd = value;
		if(namespace_61e6d095::exists(#"hash_ee64d6a280a2e42"))
		{
			if(isdefined(self.var_2943ccdc.uid))
			{
				function_d0243e5b(self.var_2943ccdc.uid, self.var_62d718e2[event].name, self.var_62d718e2[event].var_872a88cd);
			}
			else
			{
				function_e0cc3b71(self.var_62d718e2[event].name, self.var_62d718e2[event].var_872a88cd);
			}
		}
	}
}

/*
	Name: function_bd9c894c
	Namespace: namespace_2943ccdc
	Checksum: 0x334378D5
	Offset: 0x2870
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_bd9c894c(description)
{
	if(!isdefined(self.var_94ca2a30))
	{
		self.var_94ca2a30 = [];
	}
	else if(!isarray(self.var_94ca2a30))
	{
		self.var_94ca2a30 = array(self.var_94ca2a30);
	}
	self.var_94ca2a30[self.var_94ca2a30.size] = description;
}

/*
	Name: function_e2b5e638
	Namespace: namespace_2943ccdc
	Checksum: 0x87B057CB
	Offset: 0x28F0
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_e2b5e638(description)
{
	if(isdefined(self.var_94ca2a30))
	{
		arrayremovevalue(self.var_94ca2a30, description, 0);
	}
}

/*
	Name: function_b5c2702b
	Namespace: namespace_2943ccdc
	Checksum: 0x90FBC2AB
	Offset: 0x2930
	Size: 0x144
	Parameters: 2
	Flags: None
*/
function function_b5c2702b(prompt, var_248cbbcf)
{
	var_248cbbcf = function_2e532eed(var_248cbbcf);
	if(!isdefined(var_248cbbcf.groups))
	{
		var_248cbbcf.groups = [];
	}
	else if(!isarray(var_248cbbcf.groups))
	{
		var_248cbbcf.groups = array(var_248cbbcf.groups);
	}
	if(!isinarray(var_248cbbcf.groups, #"cursor"))
	{
		var_248cbbcf.groups[var_248cbbcf.groups.size] = #"cursor";
	}
	if(!isdefined(self.var_174e0272))
	{
		self.var_174e0272 = [];
	}
	else if(!isarray(self.var_174e0272))
	{
		self.var_174e0272 = array(self.var_174e0272);
	}
	var_248cbbcf.var_1df3804c = self;
	self.var_174e0272[prompt] = var_248cbbcf;
}

/*
	Name: function_4b1a5235
	Namespace: namespace_2943ccdc
	Checksum: 0x6264D305
	Offset: 0x2A80
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_4b1a5235(prompt)
{
	if(isdefined(self.var_174e0272))
	{
		arrayremoveindex(self.var_174e0272, prompt, 1);
	}
}

/*
	Name: close
	Namespace: namespace_2943ccdc
	Checksum: 0x12543637
	Offset: 0x2AC8
	Size: 0x1D4
	Parameters: 1
	Flags: None
*/
function close(cleanup)
{
	level notify(#"hash_7d0c549b3fac0991");
	player = getplayers()[0];
	player notify(#"hash_7d0c549b3fac0991");
	player clientfield::set_to_player("toggle_interactive_map", 0);
	util::wait_network_frame(2);
	player prompts::function_ee7adae5(#"cursor");
	prompts::function_398ab9eb();
	namespace_61e6d095::function_9ade1d9b(#"hash_ee64d6a280a2e42", "cursor.update", 0, 1);
	namespace_61e6d095::function_d7d2fcce(#"hash_ee64d6a280a2e42", "update", 0, 1);
	namespace_61e6d095::remove(#"hash_ee64d6a280a2e42");
	namespace_61e6d095::function_4279fd02(#"hash_ee64d6a280a2e42");
	if(is_true(cleanup))
	{
		level.var_2943ccdc = undefined;
	}
	else
	{
		level.var_2943ccdc.dims = undefined;
	}
	player val::reset(#"hash_46ef83540c23a2f7", "freezecontrols");
	player actions::function_6c59e78f(1);
}

/*
	Name: function_fabe437a
	Namespace: namespace_2943ccdc
	Checksum: 0x2362AD61
	Offset: 0x2CA8
	Size: 0x3B4
	Parameters: 1
	Flags: None
*/
function function_fabe437a(var_248cbbcf)
{
	waypoint = level.var_2943ccdc.var_2c15274b.object;
	if(isdefined(waypoint.target))
	{
		if(isstring(waypoint.target))
		{
			if(isdefined(getent(waypoint.target, "targetname")))
			{
				waypoint = getent(waypoint.target, "targetname");
			}
			else if(isdefined(struct::get(waypoint.target, "targetname")))
			{
				waypoint = struct::get(waypoint.target, "targetname");
			}
		}
		else if(isstruct(waypoint.target) || isentity(waypoint.target))
		{
			waypoint = waypoint.target;
		}
	}
	objectives::remove(#"hash_748279bcfd49d4cd");
	if(level.var_2943ccdc.objects[#"hash_748279bcfd49d4cd"] === waypoint)
	{
		remove_object(#"hash_748279bcfd49d4cd");
	}
	else
	{
		objectives::goto(#"hash_748279bcfd49d4cd", waypoint.origin, undefined, 0, 0);
		if(isdefined(self.var_d9b5c896))
		{
			thread namespace_96850e69::function_49dec5b(#"hash_748279bcfd49d4cd", undefined, self.var_d9b5c896);
		}
		if(isdefined(level.var_2943ccdc.objects[#"hash_748279bcfd49d4cd"]))
		{
			level.var_2943ccdc.objects[#"hash_748279bcfd49d4cd"] notify(#"hash_7c1f9e1214f47b4e");
			level.var_2943ccdc.objects[#"hash_748279bcfd49d4cd"] = waypoint;
			waypoint thread function_9dfe141f(#"hash_748279bcfd49d4cd");
			function_d0243e5b(#"hash_748279bcfd49d4cd", "image", (isdefined(waypoint.var_2943ccdc.image) ? waypoint.var_2943ccdc.image : #"hash_215b9409f9d7cc36"));
		}
		else
		{
			waypoint add_object(#"hash_748279bcfd49d4cd", (isdefined(waypoint.var_2943ccdc.image) ? waypoint.var_2943ccdc.image : #"hash_215b9409f9d7cc36"), 0);
		}
		thread function_5cab7397();
		var_248cbbcf.player thread namespace_96850e69::show_objectives();
	}
}

/*
	Name: function_5cab7397
	Namespace: namespace_2943ccdc
	Checksum: 0x3D307C6C
	Offset: 0x3068
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5cab7397()
{
	level notify("f61ea4c2cf8a773");
	level endon(#"hash_7d0c549b3fac0991", "6c5260e220bebf4", #"hash_64a3b02565bdf75f");
	level waittill(#"hash_5644658da7c85062");
	objectives::remove(#"hash_748279bcfd49d4cd");
	remove_object(#"hash_748279bcfd49d4cd");
}

/*
	Name: function_db6cb581
	Namespace: namespace_2943ccdc
	Checksum: 0xC15829B9
	Offset: 0x3110
	Size: 0x7C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_db6cb581(uid, var_9f5096b8)
{
	if(!isdefined(var_9f5096b8))
	{
		var_9f5096b8 = #"hash_21fb68e196ffe610";
	}
	function_d0243e5b(uid, "uid", uid);
	function_d0243e5b(uid, "widgetName", var_9f5096b8);
	thread function_fa8087e3();
}

/*
	Name: function_455d4424
	Namespace: namespace_2943ccdc
	Checksum: 0x7673C73F
	Offset: 0x3198
	Size: 0xEC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_455d4424(uid)
{
	if(level.var_2943ccdc.var_eb166cf5 === self || level.var_2943ccdc.var_1896103a === self)
	{
		level.var_2943ccdc.var_eb166cf5 = undefined;
		level.var_2943ccdc.var_1896103a = undefined;
		function_8b43da33();
	}
	function_d0243e5b(uid, "widgetName", #"");
	namespace_61e6d095::function_6b97044d(#"hash_ee64d6a280a2e42", ("mapObjects" + ".") + uid, 1);
	thread function_fa8087e3();
}

/*
	Name: function_9dfe141f
	Namespace: namespace_2943ccdc
	Checksum: 0x4E781B7D
	Offset: 0x3290
	Size: 0x266
	Parameters: 3
	Flags: Linked, Private
*/
function private function_9dfe141f(uid, var_6d62c29c, angle_offset)
{
	if(!isdefined(angle_offset))
	{
		angle_offset = 0;
	}
	level endon(#"hash_7d0c549b3fac0991", #"hash_64a3b02565bdf75f");
	self endon(#"death", #"hash_7c1f9e1214f47b4e");
	self thread function_8e91c74c(uid);
	while(true)
	{
		pos = self.origin;
		angles = self.angles;
		if(isentity(self))
		{
			pos = pos + rotatepoint(self getboundsmidpoint(), angles);
		}
		var_fe23d888 = pos - level.var_2943ccdc.dims.top_left;
		self.var_2ac0bdff = (vectordot(var_fe23d888, level.var_2943ccdc.dims.x_axis) / level.var_2943ccdc.dims.width, vectordot(var_fe23d888, level.var_2943ccdc.dims.y_axis) / level.var_2943ccdc.dims.height, 0);
		function_d0243e5b(uid, "x", self.var_2ac0bdff[0]);
		function_d0243e5b(uid, "y", self.var_2ac0bdff[1]);
		if(is_true(var_6d62c29c))
		{
			function_d0243e5b(uid, "angle", angles[1] + angle_offset);
		}
		waitframe(1);
	}
}

/*
	Name: function_8e91c74c
	Namespace: namespace_2943ccdc
	Checksum: 0x92E4AC19
	Offset: 0x3500
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8e91c74c(uid)
{
	level endon(#"hash_7d0c549b3fac0991", #"hash_64a3b02565bdf75f");
	self endon(#"hash_7c1f9e1214f47b4e");
	self waittill(#"death");
	thread remove_object(uid);
}

/*
	Name: function_75cb287
	Namespace: namespace_2943ccdc
	Checksum: 0xD72055A1
	Offset: 0x3578
	Size: 0x276
	Parameters: 1
	Flags: Linked, Private
*/
function private function_75cb287(var_ff0f9714)
{
	level endon(#"hash_546b1fe54ba63887", #"hash_7d0c549b3fac0991", #"hash_64a3b02565bdf75f");
	player = getplayers()[0];
	player endon(#"death");
	level.var_2943ccdc.var_eb166cf5 = undefined;
	level.var_2943ccdc.var_1896103a = undefined;
	var_eb166cf5 = undefined;
	while(true)
	{
		if(namespace_61e6d095::should_hide(#"hash_ee64d6a280a2e42"))
		{
			waitframe(1);
			continue;
		}
		x = function_fce63823(#"cursor", "x");
		y = function_fce63823(#"cursor", "y");
		level.var_2943ccdc.var_1cd32747 = ((isdefined(x) ? x : 0.5), (isdefined(y) ? y : 0.5), 0);
		level.var_2943ccdc.var_87c49d20 = (level.var_2943ccdc.dims.top_left + ((level.var_2943ccdc.var_1cd32747[0] * level.var_2943ccdc.dims.width) * level.var_2943ccdc.dims.x_axis)) + ((level.var_2943ccdc.var_1cd32747[1] * level.var_2943ccdc.dims.height) * level.var_2943ccdc.dims.y_axis);
		function_c9099483();
		function_393ad031();
		waitframe(1);
	}
}

/*
	Name: function_c9099483
	Namespace: namespace_2943ccdc
	Checksum: 0x77601BD4
	Offset: 0x37F8
	Size: 0x152
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c9099483()
{
	if(isdefined(level.var_2943ccdc.var_eb166cf5) && !function_3fe61dc2(level.var_2943ccdc.var_eb166cf5))
	{
		thread function_11396e33(level.var_2943ccdc.var_eb166cf5);
		level.var_2943ccdc.var_eb166cf5 = undefined;
		return;
	}
	if(!isdefined(level.var_2943ccdc.var_eb166cf5))
	{
		foreach(object in level.var_2943ccdc.objects)
		{
			if(function_3fe61dc2(object))
			{
				thread function_7560d352(object);
				level.var_2943ccdc.var_eb166cf5 = object;
				break;
			}
		}
	}
}

/*
	Name: function_3fe61dc2
	Namespace: namespace_2943ccdc
	Checksum: 0x590B2FD4
	Offset: 0x3958
	Size: 0x118
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3fe61dc2(object)
{
	if(isdefined(object.var_2ac0bdff))
	{
		delta = object.var_2ac0bdff - level.var_2943ccdc.var_1cd32747;
		scale = (isdefined(function_dbf83dc4(object.var_2943ccdc.uid, "scale")) ? function_dbf83dc4(object.var_2943ccdc.uid, "scale") : 1);
		if(abs(delta[0]) < (0.04 * scale) && abs(delta[1]) < (0.04 * scale))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_393ad031
	Namespace: namespace_2943ccdc
	Checksum: 0x1F51FFAF
	Offset: 0x3A78
	Size: 0x152
	Parameters: 0
	Flags: Linked, Private
*/
function private function_393ad031()
{
	if(isdefined(level.var_2943ccdc.var_1896103a) && !function_4c186262(level.var_2943ccdc.var_1896103a))
	{
		thread function_11396e33(level.var_2943ccdc.var_1896103a);
		level.var_2943ccdc.var_1896103a = undefined;
		return;
	}
	foreach(var_7188b3ba in level.var_2943ccdc.var_147d40f0)
	{
		if(var_7188b3ba !== level.var_2943ccdc.var_1896103a && function_4c186262(var_7188b3ba))
		{
			thread function_7560d352(var_7188b3ba);
			level.var_2943ccdc.var_1896103a = var_7188b3ba;
			break;
		}
	}
}

/*
	Name: function_4c186262
	Namespace: namespace_2943ccdc
	Checksum: 0x93078834
	Offset: 0x3BD8
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4c186262(var_7188b3ba)
{
	return istouching(level.var_2943ccdc.var_87c49d20, var_7188b3ba);
}

/*
	Name: function_7560d352
	Namespace: namespace_2943ccdc
	Checksum: 0x54415D8C
	Offset: 0x3C18
	Size: 0x254
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7560d352(object)
{
	object notify(#"hash_36f946ec36b9e18f");
	if(isdefined(object.var_f90e2591))
	{
		object thread [[object.var_f90e2591]]();
	}
	if(isdefined(object.var_62d718e2[#"hash_34d2747d17c812f9"]))
	{
		object.var_62d718e2[#"hash_34d2747d17c812f9"].var_872a88cd = object.var_62d718e2[#"hash_34d2747d17c812f9"].value;
		if(isdefined(object.var_2943ccdc.uid))
		{
			function_d0243e5b(object.var_2943ccdc.uid, object.var_62d718e2[#"hash_34d2747d17c812f9"].name, object.var_62d718e2[#"hash_34d2747d17c812f9"].var_872a88cd);
		}
		else
		{
			function_e0cc3b71(object.var_62d718e2[#"hash_34d2747d17c812f9"].name, object.var_62d718e2[#"hash_34d2747d17c812f9"].var_872a88cd);
		}
	}
	if(function_a246a802(object))
	{
		function_23036faa(#"cursor", "rightAligned", object.var_2ac0bdff[0] < 0.5);
		function_23036faa(#"cursor", "bottomAligned", object.var_2ac0bdff[1] < 0.5);
		function_e4d34e68(1);
		function_9e8d4999(object.var_d9b5c896, object.var_94ca2a30, object.var_174e0272, object);
	}
}

/*
	Name: function_11396e33
	Namespace: namespace_2943ccdc
	Checksum: 0x3AAFEE12
	Offset: 0x3E78
	Size: 0x2AC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_11396e33(object)
{
	object notify(#"hash_c1b6fc0fc30a88a");
	if(isdefined(object.var_938b0e9b))
	{
		object thread [[object.var_938b0e9b]]();
	}
	if(isdefined(object.var_62d718e2[#"hash_9ca7f8f691003b5"]))
	{
		object.var_62d718e2[#"hash_9ca7f8f691003b5"].var_872a88cd = object.var_62d718e2[#"hash_9ca7f8f691003b5"].value;
		if(isdefined(object.var_2943ccdc.uid))
		{
			function_d0243e5b(object.var_2943ccdc.uid, object.var_62d718e2[#"hash_9ca7f8f691003b5"].name, object.var_62d718e2[#"hash_9ca7f8f691003b5"].var_872a88cd);
		}
		else
		{
			function_e0cc3b71(object.var_62d718e2[#"hash_9ca7f8f691003b5"].name, object.var_62d718e2[#"hash_9ca7f8f691003b5"].var_872a88cd);
		}
	}
	if(level.var_2943ccdc.var_2c15274b.object === object)
	{
		var_240f71c = object === level.var_2943ccdc.var_1896103a;
		var_6d991c4e = level.var_2943ccdc.var_1896103a;
		if(var_240f71c)
		{
			var_6d991c4e = level.var_2943ccdc.var_eb166cf5;
		}
		if(function_a246a802(object) && !function_a246a802(var_6d991c4e))
		{
			function_e4d34e68(0);
			function_8b43da33();
		}
		else if(function_a246a802(object) && function_a246a802(var_6d991c4e))
		{
			function_9e8d4999(var_6d991c4e.var_d9b5c896, var_6d991c4e.var_94ca2a30, var_6d991c4e.var_174e0272, var_6d991c4e);
		}
	}
}

/*
	Name: function_a246a802
	Namespace: namespace_2943ccdc
	Checksum: 0x46E68B2F
	Offset: 0x4130
	Size: 0x3A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a246a802(object)
{
	return isdefined(object.var_d9b5c896) || isdefined(object.var_94ca2a30) || isdefined(object.var_174e0272);
}

/*
	Name: function_fa8087e3
	Namespace: namespace_2943ccdc
	Checksum: 0x506640C1
	Offset: 0x4178
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fa8087e3()
{
	namespace_61e6d095::function_d7d2fcce(#"hash_ee64d6a280a2e42", "update", 1, 1, 0, 0, 1);
}

