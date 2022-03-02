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
		Checksum: 0x708E5E6D
		Offset: 0xB0
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
		Offset: 0x100
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16
	*/
	destructor()
	{
	}

	/*
		Name: wm_ht_posidlestart
		Namespace: throttle
		Checksum: 0xA4B30FFE
		Offset: 0x408
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
		Checksum: 0x52E5F38
		Offset: 0x70
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
		Checksum: 0x9A76DA35
		Offset: 0x260
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
		Checksum: 0xF026EF14
		Offset: 0x438
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
		Checksum: 0x425112F4
		Offset: 0x110
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
		Checksum: 0x4C794D07
		Offset: 0x2B0
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
		Checksum: 0x37BA17BD
		Offset: 0x640
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
		Checksum: 0xD66ADA7F
		Offset: 0x680
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
		Offset: 0x6B8
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16
	*/
	destructor()
	{
	}

	/*
		Name: wm_ht_posidlestart
		Namespace: namespace_c6c0e94
		Checksum: 0x5FB0470F
		Offset: 0x8E8
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
		Checksum: 0x7E392A42
		Offset: 0x7B8
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
		Checksum: 0xEBD241CB
		Offset: 0x918
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
		Checksum: 0x32987E9F
		Offset: 0x828
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
		Checksum: 0xC3C4C7BD
		Offset: 0x6C8
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

