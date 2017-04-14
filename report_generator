#pragma once

#include <iostream>
#include <vector>
#include "vote.h"

using std::cout;
using std::endl;
using std::vector;

bool nextVoteMask(Vote & v, Tuple & s, int z)
{
	bool zerosMet = false;

	do
	{
		for (auto i = 0; i < s.length(); i++)
		{
			v[i]++;
			if (v[i] > s[i])
				v[i] = 0;
			else
				break;
		}

		int c = 0;
		for (auto i = 0; i < v.length(); i++)
			if (v[i] == 0)
				c++;

		if (c == v.length())
			return false;

		if (c >= z)
			zerosMet = true;

	} while (zerosMet == false);

	return true;
}

void printVote(Vote & v)
{
	for (auto i = 0; i < v.length(); i++)
		cout << v[i] << " ";
}

void stat(vector<Vote> &voteMatrix, int n, Vote & mask, Tuple & s)
{
	cout << "{";

	for (auto j = 0; j < s.length(); j++)
	{
		if (j > 0)
			cout << ", ";

		int *k = new int[s[j]];
		for (auto i = 0; i < s[j]; i++)
			k[i] = 0;

		for (int i = 0; i < n; i++)
		{
			if (voteMatrix[i] == mask)
			{
				k[voteMatrix[i][j] - 1]++;
			}
		}

		int sampleSize = 0;
		for (int i = 0; i < n; i++)
		{
			if (voteMatrix[i] == mask)
			{
				sampleSize++;
			}
		}

		cout << "[";
		for (auto i = 0; i < s[j]; i++)
		{
			if (i > 0)
				cout << "-";
			if (sampleSize != 0)
				cout << (i + 1) << "(" << ((double)k[i] / sampleSize) << ")";
			else
				cout << (i + 1) << "(0)";
		}
		cout << "]";

		delete k;
	}
	
	cout << "}";
}

void classify(vector<Vote> &voteMatrix, int n, Tuple & valueSet, int k)
{
	int z = valueSet.length() - k;

	Vote m(valueSet.length());
	for (auto i = 0; i < m.length(); i++)
		m[i] = 0;

	bool available = nextVoteMask(m, valueSet, z);
	while (available)
	{
		cout << "Selector: "; printVote(m);
		stat(voteMatrix, n, m, valueSet);
		cout << endl;

		available = nextVoteMask(m, valueSet, z);
	}
}
