class cscriptbundleobjectbase 
{
	var _o_scene;
	var _s;
	var _e_array;
	var _n_clientnum;

	/*
		Name: constructor
		Namespace: cscriptbundleobjectbase
		Checksum: 0x80F724D1
		Offset: 0x88
		Size: 0x4
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cscriptbundleobjectbase
		Checksum: 0x80F724D1
		Offset: 0x98
		Size: 0x4
		Parameters: 0
		Flags: Linked, 128
	*/
	destructor()
	{
	}

	/*
		Name: error
		Namespace: cscriptbundleobjectbase
		Checksum: 0xC96DDD77
		Offset: 0x250
		Size: 0x128
		Parameters: 2
		Flags: Linked
	*/
	function error(condition, str_msg)
	{
		if(condition)
		{
			if([[ _o_scene ]]->is_testing())
			{
				scriptbundle::error_on_screen(str_msg);
			}
			else
			{
				/#
					assertmsg((((([[ _o_scene ]]->get_type()) + "") + function_9e72a96(_o_scene._str_name) + "") + (isdefined(_s.name) ? "" + _s.name : (isdefined("") ? "" + "" : "")) + "") + str_msg);
				#/
				/#
				#/
			}
			thread [[ _o_scene ]]->on_error();
			return true;
		}
		return false;
	}

	/*
		Name: get_ent
		Namespace: cscriptbundleobjectbase
		Checksum: 0x9A546D8
		Offset: 0x380
		Size: 0x18
		Parameters: 1
		Flags: Linked
	*/
	function get_ent(localclientnum)
	{
		return _e_array[localclientnum];
	}

	/*
		Name: init
		Namespace: cscriptbundleobjectbase
		Checksum: 0x8A1749DF
		Offset: 0xA8
		Size: 0xC6
		Parameters: 4
		Flags: Linked
	*/
	function init(s_objdef, o_bundle, e_ent, localclientnum)
	{
		self._s = s_objdef;
		self._o_scene = o_bundle;
		if(isdefined(e_ent))
		{
			/#
				assert(!isdefined(localclientnum) || e_ent.localclientnum == localclientnum, "");
			#/
			self._n_clientnum = e_ent.localclientnum;
			self._e_array[_n_clientnum] = e_ent;
		}
		else
		{
			self._e_array = [];
			if(isdefined(localclientnum))
			{
				self._n_clientnum = localclientnum;
			}
		}
	}

	/*
		Name: log
		Namespace: cscriptbundleobjectbase
		Checksum: 0x47E854C
		Offset: 0x178
		Size: 0xCC
		Parameters: 1
		Flags: Linked
	*/
	function log(str_msg)
	{
		/#
			println((((([[ _o_scene ]]->get_type()) + "") + function_9e72a96(_o_scene._str_name) + "") + (isdefined(_s.name) ? "" + _s.name : (isdefined("") ? "" + "" : "")) + "") + str_msg);
		#/
	}

}

class cscriptbundlebase 
{
	var _testing;
	var _s;
	var _str_name;
	var _a_objects;

	/*
		Name: constructor
		Namespace: cscriptbundlebase
		Checksum: 0xF81512BE
		Offset: 0x500
		Size: 0x1A
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self._a_objects = [];
		self._testing = 0;
	}

	/*
		Name: destructor
		Namespace: cscriptbundlebase
		Checksum: 0x80F724D1
		Offset: 0x528
		Size: 0x4
		Parameters: 0
		Flags: Linked, 128
	*/
	destructor()
	{
	}

	/*
		Name: error
		Namespace: cscriptbundlebase
		Checksum: 0x191D43E8
		Offset: 0x710
		Size: 0x9C
		Parameters: 2
		Flags: Linked
	*/
	function error(condition, str_msg)
	{
		if(condition)
		{
			if(_testing)
			{
			}
			else
			{
				/#
					assertmsg(((_s.type + "") + function_9e72a96(_str_name) + "") + str_msg);
				#/
				/#
				#/
			}
			thread [[ self ]]->on_error();
			return true;
		}
		return false;
	}

	/*
		Name: get_vm
		Namespace: cscriptbundlebase
		Checksum: 0x6B888734
		Offset: 0x5A8
		Size: 0x12
		Parameters: 0
		Flags: Linked
	*/
	function get_vm()
	{
		return _s.vmtype;
	}

	/*
		Name: get_type
		Namespace: cscriptbundlebase
		Checksum: 0xB115AC4A
		Offset: 0x588
		Size: 0x12
		Parameters: 0
		Flags: Linked
	*/
	function get_type()
	{
		return _s.type;
	}

	/*
		Name: add_object
		Namespace: cscriptbundlebase
		Checksum: 0x42F3D1EC
		Offset: 0x600
		Size: 0x74
		Parameters: 1
		Flags: Linked
	*/
	function add_object(o_object)
	{
		if(!isdefined(_a_objects))
		{
			self._a_objects = [];
		}
		else if(!isarray(_a_objects))
		{
			self._a_objects = array(_a_objects);
		}
		self._a_objects[_a_objects.size] = o_object;
	}

	/*
		Name: on_error
		Namespace: cscriptbundlebase
		Checksum: 0x215AB392
		Offset: 0x4E8
		Size: 0xC
		Parameters: 1
		Flags: Linked
	*/
	function on_error(e)
	{
	}

	/*
		Name: is_testing
		Namespace: cscriptbundlebase
		Checksum: 0x7B5D6758
		Offset: 0x5E8
		Size: 0xA
		Parameters: 0
		Flags: Linked
	*/
	function is_testing()
	{
		return _testing;
	}

	/*
		Name: remove_object
		Namespace: cscriptbundlebase
		Checksum: 0x3CAD2336
		Offset: 0x680
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function remove_object(o_object)
	{
		arrayremovevalue(_a_objects, o_object);
	}

	/*
		Name: init
		Namespace: cscriptbundlebase
		Checksum: 0x33164AB6
		Offset: 0x538
		Size: 0x42
		Parameters: 3
		Flags: Linked
	*/
	function init(str_name, s, b_testing)
	{
		self._s = s;
		self._str_name = str_name;
		self._testing = b_testing;
	}

	/*
		Name: get_objects
		Namespace: cscriptbundlebase
		Checksum: 0x3EE54E
		Offset: 0x5C8
		Size: 0x12
		Parameters: 0
		Flags: Linked
	*/
	function get_objects()
	{
		return _s.objects;
	}

	/*
		Name: log
		Namespace: cscriptbundlebase
		Checksum: 0x2FC74125
		Offset: 0x6B0
		Size: 0x54
		Parameters: 1
		Flags: Linked
	*/
	function log(str_msg)
	{
		/#
			println((((_s.type + "") + _str_name) + "") + str_msg);
		#/
	}

}

#namespace scriptbundle_shared;

/*
	Name: function_43d00a91
	Namespace: scriptbundle_shared
	Checksum: 0x99136990
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_43d00a91()
{
	level notify(1000517497);
}

#namespace scriptbundle;

/*
	Name: error_on_screen
	Namespace: scriptbundle
	Checksum: 0xBD733275
	Offset: 0xA20
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function error_on_screen(str_msg)
{
	if(str_msg != "")
	{
		/#
			errormsg(str_msg);
		#/
	}
}

