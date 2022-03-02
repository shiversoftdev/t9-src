class class_d0a0a887 
{
	var _used;
	var _avail;

	/*
		Name: constructor
		Namespace: namespace_d0a0a887
		Checksum: 0xDC520E06
		Offset: 0x80
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
		Offset: 0x300
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
		Checksum: 0xB94E95D1
		Offset: 0x268
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
		Checksum: 0x97F42026
		Offset: 0x138
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
		Checksum: 0x8524366A
		Offset: 0x2E8
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
		Checksum: 0xA7BBEB5B
		Offset: 0xA8
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

#namespace namespace_3125a05b;

/*
	Name: function_a21000a1
	Namespace: namespace_3125a05b
	Checksum: 0x57FE5B7E
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a21000a1()
{
	level notify(608596502);
}

