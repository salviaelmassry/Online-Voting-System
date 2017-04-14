#pragma once

#include "tuple.h"

class Vote : public Tuple
{
public:
	Vote(uint32_t n)
		: Tuple(n)
	{
	}

	Vote(const Vote &v)
		: Tuple (v)
	{
	}

	Vote(Vote &&) = delete;

	~Vote()
	{
	}

	Vote & operator=(Vote &) = delete;
	
	Vote & operator=(Vote &&) = delete;

	bool operator==(Vote & v)
	{
		if (v._n != _n)
			return false;

		for (auto i = 0; i < _n; i++)
			if (v._data[i] != _data[i] && v._data[i] != 0 && _data[i] != 0)
				return false;

		return true;
	}
};