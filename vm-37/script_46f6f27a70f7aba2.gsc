#using script_5971282fa1e50330;

#namespace flowgraph_logic;

/*
	Name: iffunc
	Namespace: flowgraph_logic
	Checksum: 0xDE43D61C
	Offset: 0x68
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function iffunc(x, b)
{
	return array(b, !b);
}

/*
	Name: orfunc
	Namespace: flowgraph_logic
	Checksum: 0x6DFA7D18
	Offset: 0xA0
	Size: 0x4A
	Parameters: 3
	Flags: None
*/
function orfunc(x, b_a, b_b)
{
	return array(b_a || b_b, !(b_a || b_b));
}

/*
	Name: andfunc
	Namespace: flowgraph_logic
	Checksum: 0xA9AB675B
	Offset: 0xF8
	Size: 0x4A
	Parameters: 3
	Flags: None
*/
function andfunc(x, b_a, b_b)
{
	return array(b_a && b_b, !(b_a && b_b));
}

/*
	Name: notfunc
	Namespace: flowgraph_logic
	Checksum: 0xA3BE184C
	Offset: 0x150
	Size: 0x12
	Parameters: 1
	Flags: None
*/
function notfunc(b_value)
{
	return !b_value;
}

/*
	Name: lessthan
	Namespace: flowgraph_logic
	Checksum: 0xEA7F7F3A
	Offset: 0x170
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function lessthan(var_8b1a2ec6, var_d2073c9f)
{
	return var_8b1a2ec6 < var_d2073c9f;
}

/*
	Name: function_b457969e
	Namespace: flowgraph_logic
	Checksum: 0x19F4A547
	Offset: 0x198
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function function_b457969e(var_8b1a2ec6, var_d2073c9f)
{
	return var_8b1a2ec6 <= var_d2073c9f;
}

/*
	Name: greaterthan
	Namespace: flowgraph_logic
	Checksum: 0x1D7C27FC
	Offset: 0x1C0
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function greaterthan(var_8b1a2ec6, var_d2073c9f)
{
	return var_8b1a2ec6 > var_d2073c9f;
}

/*
	Name: function_3743e19e
	Namespace: flowgraph_logic
	Checksum: 0x82358CD7
	Offset: 0x1E8
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function function_3743e19e(var_8b1a2ec6, var_d2073c9f)
{
	return var_8b1a2ec6 >= var_d2073c9f;
}

/*
	Name: equal
	Namespace: flowgraph_logic
	Checksum: 0x4DC018F2
	Offset: 0x210
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function equal(var_8b1a2ec6, var_d2073c9f)
{
	return var_8b1a2ec6 == var_d2073c9f;
}

/*
	Name: function_5cb6d7c8
	Namespace: flowgraph_logic
	Checksum: 0x8A59A7CC
	Offset: 0x238
	Size: 0xAC
	Parameters: 3
	Flags: None
*/
function function_5cb6d7c8(x, var_ff3acc90, var_d545f8ef)
{
	if(is_true(var_ff3acc90))
	{
		self flowgraph::kick(array(undefined, 1, 0), 1);
	}
	else if(is_true(var_d545f8ef))
	{
		self flowgraph::kick(array(undefined, 0, 1), 1);
	}
}

/*
	Name: function_4902305f
	Namespace: flowgraph_logic
	Checksum: 0x5A66CF2B
	Offset: 0x2F0
	Size: 0x114
	Parameters: 4
	Flags: None
*/
function function_4902305f(x, var_ff3acc90, var_d545f8ef, var_e7049c6c)
{
	if(is_true(var_ff3acc90))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0), 1);
	}
	else
	{
		if(is_true(var_d545f8ef))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0), 1);
		}
		else if(is_true(var_e7049c6c))
		{
			self flowgraph::kick(array(undefined, 0, 0, 1), 1);
		}
	}
}

/*
	Name: function_3b225c4
	Namespace: flowgraph_logic
	Checksum: 0xD87CAB78
	Offset: 0x410
	Size: 0x16C
	Parameters: 5
	Flags: None
*/
function function_3b225c4(x, var_ff3acc90, var_d545f8ef, var_e7049c6c, var_f4aeb7c0)
{
	if(is_true(var_ff3acc90))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0, 0), 1);
	}
	else
	{
		if(is_true(var_d545f8ef))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0, 0), 1);
		}
		else
		{
			if(is_true(var_e7049c6c))
			{
				self flowgraph::kick(array(undefined, 0, 0, 1, 0), 1);
			}
			else if(is_true(var_f4aeb7c0))
			{
				self flowgraph::kick(array(undefined, 0, 0, 0, 1), 1);
			}
		}
	}
}

/*
	Name: function_f82f0ebe
	Namespace: flowgraph_logic
	Checksum: 0xE36BD33A
	Offset: 0x588
	Size: 0x1C4
	Parameters: 6
	Flags: None
*/
function function_f82f0ebe(x, var_ff3acc90, var_d545f8ef, var_e7049c6c, var_f4aeb7c0, var_fe28cab4)
{
	if(is_true(var_ff3acc90))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0), 1);
	}
	else
	{
		if(is_true(var_d545f8ef))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0), 1);
		}
		else
		{
			if(is_true(var_e7049c6c))
			{
				self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0), 1);
			}
			else
			{
				if(is_true(var_f4aeb7c0))
				{
					self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0), 1);
				}
				else if(is_true(var_fe28cab4))
				{
					self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1), 1);
				}
			}
		}
	}
}

/*
	Name: function_3f431ce5
	Namespace: flowgraph_logic
	Checksum: 0xAE7CC732
	Offset: 0x758
	Size: 0x21C
	Parameters: 7
	Flags: None
*/
function function_3f431ce5(x, var_ff3acc90, var_d545f8ef, var_e7049c6c, var_f4aeb7c0, var_fe28cab4, var_fdb6e19)
{
	if(is_true(var_ff3acc90))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0, 0), 1);
	}
	else
	{
		if(is_true(var_d545f8ef))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0, 0), 1);
		}
		else
		{
			if(is_true(var_e7049c6c))
			{
				self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0, 0), 1);
			}
			else
			{
				if(is_true(var_f4aeb7c0))
				{
					self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0, 0), 1);
				}
				else
				{
					if(is_true(var_fe28cab4))
					{
						self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1, 0), 1);
					}
					else if(is_true(var_fdb6e19))
					{
						self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 1), 1);
					}
				}
			}
		}
	}
}

/*
	Name: function_2d817962
	Namespace: flowgraph_logic
	Checksum: 0xE151DC96
	Offset: 0x980
	Size: 0x2AC
	Parameters: 8
	Flags: None
*/
function function_2d817962(x, var_ff3acc90, var_d545f8ef, var_e7049c6c, var_f4aeb7c0, var_fe28cab4, var_fdb6e19, var_198e8183)
{
	if(is_true(var_ff3acc90))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0, 0, 0), 1);
	}
	else
	{
		if(is_true(var_d545f8ef))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0, 0, 0), 1);
		}
		else
		{
			if(is_true(var_e7049c6c))
			{
				self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0, 0, 0), 1);
			}
			else
			{
				if(is_true(var_f4aeb7c0))
				{
					self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0, 0, 0), 1);
				}
				else
				{
					if(is_true(var_fe28cab4))
					{
						self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1, 0, 0), 1);
					}
					else
					{
						if(is_true(var_fdb6e19))
						{
							self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 1, 0), 1);
						}
						else if(is_true(var_198e8183))
						{
							self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 0, 1), 1);
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_c8fcb052
	Namespace: flowgraph_logic
	Checksum: 0x75FB874F
	Offset: 0xC38
	Size: 0x30C
	Parameters: 9
	Flags: None
*/
function function_c8fcb052(x, var_ff3acc90, var_d545f8ef, var_e7049c6c, var_f4aeb7c0, var_fe28cab4, var_fdb6e19, var_198e8183, var_2b5c251e)
{
	if(is_true(var_ff3acc90))
	{
		self flowgraph::kick(array(undefined, 1, 0, 0, 0, 0, 0, 0, 0), 1);
	}
	else
	{
		if(is_true(var_d545f8ef))
		{
			self flowgraph::kick(array(undefined, 0, 1, 0, 0, 0, 0, 0, 0), 1);
		}
		else
		{
			if(is_true(var_e7049c6c))
			{
				self flowgraph::kick(array(undefined, 0, 0, 1, 0, 0, 0, 0, 0), 1);
			}
			else
			{
				if(is_true(var_f4aeb7c0))
				{
					self flowgraph::kick(array(undefined, 0, 0, 0, 1, 0, 0, 0, 0), 1);
				}
				else
				{
					if(is_true(var_fe28cab4))
					{
						self flowgraph::kick(array(undefined, 0, 0, 0, 0, 1, 0, 0, 0), 1);
					}
					else
					{
						if(is_true(var_fdb6e19))
						{
							self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 1, 0, 0), 1);
						}
						else
						{
							if(is_true(var_198e8183))
							{
								self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 0, 1, 0), 1);
							}
							else if(is_true(var_2b5c251e))
							{
								self flowgraph::kick(array(undefined, 0, 0, 0, 0, 0, 0, 0, 1), 1);
							}
						}
					}
				}
			}
		}
	}
}

#namespace flowgraph_loops;

/*
	Name: forloop
	Namespace: flowgraph_loops
	Checksum: 0x70429B24
	Offset: 0xF50
	Size: 0x92
	Parameters: 3
	Flags: None
*/
function forloop(x, i_begin, i_end)
{
	i_step = 1;
	if(i_end < i_begin)
	{
		i_step = -1;
	}
	i = i_begin;
	while(i != i_end)
	{
		self flowgraph::kick(array(1, i), 1);
		i = i + i_step;
	}
}

/*
	Name: foreachloop
	Namespace: flowgraph_loops
	Checksum: 0xBDA6178
	Offset: 0xFF0
	Size: 0xB0
	Parameters: 2
	Flags: None
*/
function foreachloop(x, a_items)
{
	foreach(item in a_items)
	{
		self flowgraph::kick(array(1, item), 1);
	}
}

/*
	Name: whileloop
	Namespace: flowgraph_loops
	Checksum: 0xC006C29D
	Offset: 0x10A8
	Size: 0x6E
	Parameters: 2
	Flags: None
*/
function whileloop(x, b_condition)
{
	while(b_condition)
	{
		self flowgraph::kick(1, 1);
		inputs = self flowgraph::collect_inputs();
		b_condition = inputs[1];
	}
}

#namespace flowgraph_sequence;

/*
	Name: sequence2
	Namespace: flowgraph_sequence
	Checksum: 0x719B651
	Offset: 0x1120
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function sequence2(x)
{
	self flowgraph::kick(array(1, 0), 1);
	self flowgraph::kick(array(0, 1), 1);
}

/*
	Name: sequence3
	Namespace: flowgraph_sequence
	Checksum: 0x28BA2EC4
	Offset: 0x1198
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function sequence3(x)
{
	self flowgraph::kick(array(1, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 1), 1);
}

/*
	Name: sequence4
	Namespace: flowgraph_sequence
	Checksum: 0xCDB44931
	Offset: 0x1240
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function sequence4(x)
{
	self flowgraph::kick(array(1, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 1), 1);
}

/*
	Name: sequence5
	Namespace: flowgraph_sequence
	Checksum: 0xA67E3187
	Offset: 0x1318
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function sequence5(x)
{
	self flowgraph::kick(array(1, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 1, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 1), 1);
}

/*
	Name: sequence6
	Namespace: flowgraph_sequence
	Checksum: 0x6FC63220
	Offset: 0x1448
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function sequence6(x)
{
	self flowgraph::kick(array(1, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 1, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 1, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 1), 1);
}

/*
	Name: sequence7
	Namespace: flowgraph_sequence
	Checksum: 0xDD6BA1E2
	Offset: 0x15B0
	Size: 0x194
	Parameters: 1
	Flags: None
*/
function sequence7(x)
{
	self flowgraph::kick(array(1, 0, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 1, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 1, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 1, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 0, 1), 1);
}

/*
	Name: sequence8
	Namespace: flowgraph_sequence
	Checksum: 0xA85DE057
	Offset: 0x1750
	Size: 0x1CC
	Parameters: 1
	Flags: None
*/
function sequence8(x)
{
	self flowgraph::kick(array(1, 0, 0, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 1, 0, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 1, 0, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 1, 0, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 1, 0, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 1, 0, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 0, 1, 0), 1);
	self flowgraph::kick(array(0, 0, 0, 0, 0, 0, 0, 1), 1);
}

#namespace flowgraph_util;

/*
	Name: onflowgraphrun
	Namespace: flowgraph_util
	Checksum: 0x863B8A7D
	Offset: 0x1928
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function onflowgraphrun()
{
	self.owner waittill(#"flowgraph_run");
	return true;
}

/*
	Name: waitfunc
	Namespace: flowgraph_util
	Checksum: 0xA52D97D4
	Offset: 0x1958
	Size: 0x1E
	Parameters: 2
	Flags: None
*/
function waitfunc(x, f_seconds)
{
	wait(f_seconds);
	return true;
}

/*
	Name: createthread
	Namespace: flowgraph_util
	Checksum: 0x8D85327E
	Offset: 0x1980
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function createthread(x)
{
	return true;
}

#namespace flowgraph_random;

/*
	Name: randomfloatinrangefunc
	Namespace: flowgraph_random
	Checksum: 0x4D22D27B
	Offset: 0x1998
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function randomfloatinrangefunc(f_min, f_max)
{
	return randomfloatrange(f_min, f_max);
}

/*
	Name: randomunitvector
	Namespace: flowgraph_random
	Checksum: 0x86B891B9
	Offset: 0x19D0
	Size: 0x5A
	Parameters: 0
	Flags: None
*/
function randomunitvector()
{
	return vectornormalize((randomfloat(1), randomfloat(1), randomfloat(1)));
}

#namespace flowgraph_math;

/*
	Name: multiply
	Namespace: flowgraph_math
	Checksum: 0x727F0A2C
	Offset: 0x1A38
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function multiply(var_d895ca40, var_3029f96f)
{
	return var_3029f96f * var_3029f96f;
}

/*
	Name: divide
	Namespace: flowgraph_math
	Checksum: 0x67DAB5E9
	Offset: 0x1A60
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function divide(var_d895ca40, var_3029f96f)
{
	return var_d895ca40 / var_3029f96f;
}

/*
	Name: add
	Namespace: flowgraph_math
	Checksum: 0xD6131013
	Offset: 0x1A88
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function add(var_d895ca40, var_3029f96f)
{
	return var_d895ca40 + var_3029f96f;
}

/*
	Name: subtract
	Namespace: flowgraph_math
	Checksum: 0x5ED28556
	Offset: 0x1AB0
	Size: 0x1A
	Parameters: 2
	Flags: None
*/
function subtract(var_d895ca40, var_3029f96f)
{
	return var_d895ca40 - var_3029f96f;
}

/*
	Name: negate
	Namespace: flowgraph_math
	Checksum: 0x4A447C6E
	Offset: 0x1AD8
	Size: 0x16
	Parameters: 1
	Flags: None
*/
function negate(v)
{
	return v * -1;
}

/*
	Name: vectordotfunc
	Namespace: flowgraph_math
	Checksum: 0x318953B7
	Offset: 0x1AF8
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function vectordotfunc(v_1, v_2)
{
	return vectordot(v_1, v_2);
}

#namespace namespace_f851c3be;

/*
	Name: function_35dc468d
	Namespace: namespace_f851c3be
	Checksum: 0x816F2CFE
	Offset: 0x1B30
	Size: 0x18
	Parameters: 1
	Flags: None
*/
function function_35dc468d(str_field)
{
	return level.(str_field);
}

/*
	Name: function_f9d5c4b0
	Namespace: namespace_f851c3be
	Checksum: 0xCD448763
	Offset: 0x1B50
	Size: 0x32
	Parameters: 3
	Flags: None
*/
function function_f9d5c4b0(x, str_field, var_b8003601)
{
	level.(str_field) = var_b8003601;
	return true;
}

#namespace namespace_22752a75;

/*
	Name: function_8892c7a6
	Namespace: namespace_22752a75
	Checksum: 0x8D1025A8
	Offset: 0x1B90
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_8892c7a6(i_value)
{
	return i_value;
}

/*
	Name: function_28c4ae67
	Namespace: namespace_22752a75
	Checksum: 0xE73EAA28
	Offset: 0x1BA8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_28c4ae67(var_2eb63fd3)
{
	return var_2eb63fd3;
}

/*
	Name: function_36bf9c6c
	Namespace: namespace_22752a75
	Checksum: 0xA72F52E3
	Offset: 0x1BC0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_36bf9c6c(b_value)
{
	return b_value;
}

/*
	Name: function_fe4cf085
	Namespace: namespace_22752a75
	Checksum: 0xEF592885
	Offset: 0x1BD8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_fe4cf085(str_value)
{
	return str_value;
}

/*
	Name: function_3ece9d7e
	Namespace: namespace_22752a75
	Checksum: 0x6221071D
	Offset: 0x1BF0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_3ece9d7e(var_4cb0cd3c)
{
	return var_4cb0cd3c;
}

/*
	Name: function_68a5d644
	Namespace: namespace_22752a75
	Checksum: 0xC142EC5D
	Offset: 0x1C08
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_68a5d644(var_30e9e231)
{
	return var_30e9e231;
}

/*
	Name: function_4e718879
	Namespace: namespace_22752a75
	Checksum: 0x4E72AA30
	Offset: 0x1C20
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_4e718879(v_value)
{
	return v_value;
}

/*
	Name: function_a7a4e2b8
	Namespace: namespace_22752a75
	Checksum: 0xED6D7EFD
	Offset: 0x1C38
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_a7a4e2b8(var_f4af12cc)
{
	return var_f4af12cc;
}

/*
	Name: function_9ef80b8b
	Namespace: namespace_22752a75
	Checksum: 0xCDF59E2A
	Offset: 0x1C50
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_9ef80b8b(var_f74b77ea)
{
	return var_f74b77ea;
}

/*
	Name: introduction_minigun
	Namespace: namespace_22752a75
	Checksum: 0x21EADA06
	Offset: 0x1C68
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function introduction_minigun(var_e08c6927)
{
	return var_e08c6927;
}

/*
	Name: function_513da14e
	Namespace: namespace_22752a75
	Checksum: 0x70721D34
	Offset: 0x1C80
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_513da14e(var_162b6305)
{
	return var_162b6305;
}

/*
	Name: function_7cbb60c3
	Namespace: namespace_22752a75
	Checksum: 0xD03D81EE
	Offset: 0x1C98
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_7cbb60c3(var_e7355b57)
{
	return var_e7355b57;
}

/*
	Name: function_f2357a4d
	Namespace: namespace_22752a75
	Checksum: 0xD6D4C61D
	Offset: 0x1CB0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_f2357a4d(var_52d6c2bd)
{
	return var_52d6c2bd;
}

/*
	Name: function_79f7d941
	Namespace: namespace_22752a75
	Checksum: 0x2FC862A0
	Offset: 0x1CC8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_79f7d941(var_b8003601)
{
	return var_b8003601;
}

/*
	Name: function_fdafe394
	Namespace: namespace_22752a75
	Checksum: 0x62122D85
	Offset: 0x1CE0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_fdafe394(var_e477c3b)
{
	return var_e477c3b;
}

/*
	Name: function_28848a6a
	Namespace: namespace_22752a75
	Checksum: 0x81B2CBC2
	Offset: 0x1CF8
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_28848a6a(var_6b11d5a)
{
	return var_6b11d5a;
}

/*
	Name: function_8f5a9b3e
	Namespace: namespace_22752a75
	Checksum: 0x79B9B64E
	Offset: 0x1D10
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_8f5a9b3e(fx_value)
{
	return fx_value;
}

/*
	Name: function_a5f771ce
	Namespace: namespace_22752a75
	Checksum: 0x6F2EA09
	Offset: 0x1D28
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_a5f771ce(var_e0bddaf5)
{
	return var_e0bddaf5;
}

/*
	Name: function_527fa489
	Namespace: namespace_22752a75
	Checksum: 0x2D8F5CEF
	Offset: 0x1D40
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_527fa489(var_5ab747e5)
{
	return var_5ab747e5;
}

