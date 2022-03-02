#namespace delete;

/*
	Name: _delete
	Namespace: delete
	Checksum: 0xC2A30933
	Offset: 0x60
	Size: 0x104
	Parameters: 1
	Flags: Private, Event
*/
event private _delete(eventstruct)
{
	/#
		assert(isdefined(self));
	#/
	if(isdefined(self))
	{
		/#
			if(isdefined(self.classname))
			{
				if(self.classname == "" || self.classname == "" || self.classname == "")
				{
					println("");
					println((("" + self getentitynumber()) + "") + self.origin);
					println("");
				}
			}
		#/
		self delete();
	}
}

/*
	Name: function_f447a48e
	Namespace: delete
	Checksum: 0x73000D6
	Offset: 0x170
	Size: 0x10C
	Parameters: 1
	Flags: Private, Event
*/
event private function_f447a48e(eventstruct)
{
	/#
		assert(isdefined(self));
	#/
	waitframe(1);
	if(isdefined(self))
	{
		/#
			if(isdefined(self.classname))
			{
				if(self.classname == "" || self.classname == "" || self.classname == "")
				{
					println("");
					println((("" + self getentitynumber()) + "") + self.origin);
					println("");
				}
			}
		#/
		self delete();
	}
}

