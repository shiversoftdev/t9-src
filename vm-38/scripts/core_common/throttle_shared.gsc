class throttle 
{
	var queue_;
	var var_3cd6b18f;
	var processed_;
	var processlimit_;
	var updaterate_;

	/*
		Name: constructor
		Namespace: throttle
		Checksum: 0x106AA11D
		Offset: 0xD0
		Size: 0x42
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.queue_ = [];
		self.processed_ = 0;
		self.processlimit_ = 1;
		self.var_3cd6b18f = [];
		self.updaterate_ = 0.05;
	}

	/*
		Name: destructor
		Namespace: throttle
		Checksum: 0x80F724D1
		Offset: 0x120
		Size: 0x4
		Parameters: 0
		Flags: Linked, 128
	*/
	destructor()
	{
	}

	/*
		Name: wm_ht_posidlestart
		Namespace: throttle
		Checksum: 0x7B06D5C2
		Offset: 0x428
		Size: 0x22
		Parameters: 1
		Flags: Linked
	*/
	function wm_ht_posidlestart(entity)
	{
		return isinarray(queue_, entity);
	}

	/*
		Name: _updatethrottlethread
		Namespace: throttle
		Checksum: 0xEA871137
		Offset: 0x90
		Size: 0x34
		Parameters: 1
		Flags: Linked, Private
	*/
	function private _updatethrottlethread(throttle)
	{
		while(isdefined(throttle))
		{
			[[ throttle ]]->_updatethrottle();
			wait(throttle.updaterate_);
		}
	}

	/*
		Name: initialize
		Namespace: throttle
		Checksum: 0x17397C31
		Offset: 0x280
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function initialize(processlimit, updaterate)
	{
		self.processlimit_ = processlimit;
		self.updaterate_ = updaterate;
		self thread _updatethrottlethread(self);
	}

	/*
		Name: function_5ef47bb4
		Namespace: throttle
		Checksum: 0x786BE36B
		Offset: 0x458
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_5ef47bb4(entity)
	{
		arrayremovevalue(queue_, entity);
	}

	/*
		Name: _updatethrottle
		Namespace: throttle
		Checksum: 0x5C9FECC9
		Offset: 0x130
		Size: 0x146
		Parameters: 0
		Flags: Linked, Private
	*/
	function private _updatethrottle()
	{
		self.processed_ = 0;
		currentqueue = queue_;
		self.queue_ = [];
		foreach(item in currentqueue)
		{
			if(!isdefined(item))
			{
				continue;
			}
			foreach(var_fe3b6341 in var_3cd6b18f)
			{
				if(item === var_fe3b6341)
				{
					self.queue_[queue_.size] = item;
					break;
				}
			}
		}
		self.var_3cd6b18f = [];
	}

	/*
		Name: waitinqueue
		Namespace: throttle
		Checksum: 0x52000AD
		Offset: 0x2D0
		Size: 0x150
		Parameters: 1
		Flags: Linked
	*/
	function waitinqueue(entity)
	{
		if(!isdefined(entity))
		{
			entity = randomint(2147483647);
		}
		if(processed_ >= processlimit_)
		{
			nextqueueindex = (queue_.size > 0 ? getlastarraykey(queue_) + 1 : 0);
			self.queue_[nextqueueindex] = entity;
			firstinqueue = 0;
			while(!firstinqueue)
			{
				if(!isdefined(entity))
				{
					return;
				}
				firstqueueindex = getfirstarraykey(queue_);
				if(processed_ < processlimit_ && queue_[firstqueueindex] === entity)
				{
					firstinqueue = 1;
					self.queue_[firstqueueindex] = undefined;
				}
				else
				{
					self.var_3cd6b18f[var_3cd6b18f.size] = entity;
					wait(updaterate_);
				}
			}
		}
		self.processed_++;
	}

	/*
		Name: function_f629508d
		Namespace: throttle
		Checksum: 0x36BF3D63
		Offset: 0x660
		Size: 0x34
		Parameters: 1
		Flags: Linked, Private
	*/
	function private function_f629508d(throttle)
	{
		while(isdefined(throttle))
		{
			[[ throttle ]]->function_eba90b67();
			wait(throttle.updaterate_);
		}
	}

}

class class_c6c0e94 
{
	var queue_;
	var var_53070152;
	var processlimit_;

	/*
		Name: constructor
		Namespace: namespace_c6c0e94
		Checksum: 0xCD738550
		Offset: 0x6A0
		Size: 0x2A
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
		self.queue_ = [];
		self.processlimit_ = 1;
		self.updaterate_ = 0.05;
	}

	/*
		Name: destructor
		Namespace: namespace_c6c0e94
		Checksum: 0x80F724D1
		Offset: 0x6D8
		Size: 0x4
		Parameters: 0
		Flags: Linked, 128
	*/
	destructor()
	{
	}

	/*
		Name: wm_ht_posidlestart
		Namespace: namespace_c6c0e94
		Checksum: 0x4C359461
		Offset: 0x908
		Size: 0x22
		Parameters: 1
		Flags: Linked
	*/
	function wm_ht_posidlestart(entity)
	{
		return isinarray(queue_, entity);
	}

	/*
		Name: initialize
		Namespace: namespace_c6c0e94
		Checksum: 0x5FCB3BF8
		Offset: 0x7D8
		Size: 0x64
		Parameters: 3
		Flags: Linked
	*/
	function initialize(name, processlimit, updaterate)
	{
		self.processlimit_ = processlimit;
		self.updaterate_ = updaterate;
		self.var_53070152 = name + "_wake_up";
		self thread throttle::function_f629508d(self);
	}

	/*
		Name: function_5ef47bb4
		Namespace: namespace_c6c0e94
		Checksum: 0x389BBD0D
		Offset: 0x938
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_5ef47bb4(entity)
	{
		arrayremovevalue(queue_, entity);
	}

	/*
		Name: waitinqueue
		Namespace: namespace_c6c0e94
		Checksum: 0x34588C59
		Offset: 0x848
		Size: 0xB4
		Parameters: 1
		Flags: Linked
	*/
	function waitinqueue(entity)
	{
		if(!isdefined(entity))
		{
			return;
		}
		if(!isentity(entity) && !isstruct(entity))
		{
			return;
		}
		if(!isinarray(queue_, entity))
		{
			self.queue_[queue_.size] = entity;
		}
		entity endon(#"death", #"delete");
		entity waittill(var_53070152);
	}

	/*
		Name: function_eba90b67
		Namespace: namespace_c6c0e94
		Checksum: 0xF4E3F9CD
		Offset: 0x6E8
		Size: 0xE8
		Parameters: 0
		Flags: Linked, Private
	*/
	function private function_eba90b67()
	{
		arrayremovevalue(queue_, undefined);
		processed = 0;
		foreach(item in queue_)
		{
			if(!isdefined(item))
			{
				continue;
			}
			arrayremovevalue(queue_, item);
			item notify(var_53070152);
			processed++;
			if(processed >= processlimit_)
			{
				break;
			}
		}
	}

}

#namespace throttle_shared;

/*
	Name: function_c3896915
	Namespace: throttle_shared
	Checksum: 0xF92470A1
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c3896915()
{
	level notify(706337188);
}

