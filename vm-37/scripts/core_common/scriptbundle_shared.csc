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
		Offset: 0x68
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
		Offset: 0x78
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16
	*/
	destructor()
	{
	}

	/*
		Name: error
		Namespace: cscriptbundleobjectbase
		Checksum: 0x6CBBA62B
		Offset: 0x230
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
		Checksum: 0x7F91C247
		Offset: 0x360
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
		Checksum: 0xFDB3055
		Offset: 0x88
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
		Checksum: 0xFDD21099
		Offset: 0x158
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
		Checksum: 0x460BADBF
		Offset: 0x4E0
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
		Offset: 0x508
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16
	*/
	destructor()
	{
	}

	/*
		Name: error
		Namespace: cscriptbundlebase
		Checksum: 0xC4C49FE
		Offset: 0x6F0
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
		Checksum: 0xCB051B07
		Offset: 0x588
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
		Checksum: 0x2C58DA96
		Offset: 0x568
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
		Checksum: 0x6444312E
		Offset: 0x5E0
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
		Checksum: 0x892FAC81
		Offset: 0x4C8
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
		Checksum: 0xBDF9B093
		Offset: 0x5C8
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
		Checksum: 0x2A50F08E
		Offset: 0x660
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
		Checksum: 0x9BD21B68
		Offset: 0x518
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
		Checksum: 0xA1BE8B57
		Offset: 0x5A8
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
		Checksum: 0x37F7BDB3
		Offset: 0x690
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

#namespace scriptbundle;

/*
	Name: error_on_screen
	Namespace: scriptbundle
	Checksum: 0x61A567
	Offset: 0xA00
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

