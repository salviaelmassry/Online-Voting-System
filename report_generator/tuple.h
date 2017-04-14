#pragma once

#include <stdint.h>
#include <stdexcept>

using std::range_error;

class Tuple
{
protected:
	uint32_t *_data;
	uint32_t _n;

public:
	Tuple(uint32_t n)
	{
		_n = n;
		_data = new uint32_t[n];
	}

	Tuple(const Tuple &t)
	{
		_n = t._n;
		_data = new uint32_t[_n];
		for (auto i = 0; i < _n; i++)
			_data[i] = t._data[i];
	}

	Tuple(Tuple &&) = delete;

	~Tuple()
	{
		if (_data != nullptr)
			delete[] _data;
	}

	Tuple & operator=(Tuple &t)
	{
		if (&t != this)
		{
			if (_data != nullptr)
				delete[] _data;

			_n = t._n;
			_data = new uint32_t[_n];
			for (auto i = 0; i < _n; i++)
				_data[i] = t._data[i];
		}
	
		return *this;
	}

	Tuple & operator=(Tuple &&) = delete;

	inline uint32_t & operator[](uint32_t i)
	{
		if (i < _n)
			return _data[i];

		throw range_error("Index out of bounds");
	}

	inline uint32_t length()
	{
		return _n;
	}
};