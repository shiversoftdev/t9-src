class class_d0a0a887 
{
	var _used;
	var _avail;

	/*
		Name: constructor
		Namespace: namespace_d0a0a887
		Checksum: 0x1E54F88
		Offset: 0x60
		Size: 0x1A
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
		self._avail = [];
		self._used = [];
	}

	/*
		Name: destructor
		Namespace: namespace_d0a0a887
		Checksum: 0x80F724D1
		Offset: 0x2E0
		Size: 0x4
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_271aec18
		Namespace: namespace_d0a0a887
		Checksum: 0xF625A2C6
		Offset: 0x248
		Size: 0x74
		Parameters: 1
		Flags: None
	*/
	function function_271aec18(index)
	{
		/#
			assert(isdefined(_used[index]));
		#/
		self._used[index] = undefined;
		/#
			assert(!isdefined(_avail[index]));
		#/
		self._avail[index] = index;
	}

	/*
		Name: function_65cdd2df
		Namespace: namespace_d0a0a887
		Checksum: 0x2C489D65
		Offset: 0x118
		Size: 0x128
		Parameters: 1
		Flags: None
	*/
	function function_65cdd2df(owner)
	{
		index = undefined;
		foreach(key, value in _avail)
		{
			index = key;
			break;
		}
		if(isdefined(index))
		{
			/#
				assert(!isdefined(_used[index]));
			#/
			if(isdefined(owner))
			{
				self._used[index] = owner;
			}
			else
			{
				self._used[index] = index;
			}
			/#
				assert(isdefined(_avail[index]));
			#/
			self._avail[index] = undefined;
		}
		return index;
	}

	/*
		Name: function_85a5add5
		Namespace: namespace_d0a0a887
		Checksum: 0x767E2DE6
		Offset: 0x2C8
		Size: 0xA
		Parameters: 0
		Flags: None
	*/
	function function_85a5add5()
	{
		return _used;
	}

	/*
		Name: init
		Namespace: namespace_d0a0a887
		Checksum: 0x9DBB8D56
		Offset: 0x88
		Size: 0x88
		Parameters: 1
		Flags: None
	*/
	function init(count)
	{
		/#
			assert(_avail.size == 0);
		#/
		/#
			assert(_used.size == 0);
		#/
		for(i = 0; i < count; i++)
		{
			self._avail[i] = i;
		}
	}

}

