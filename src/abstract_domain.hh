#pragma once

#include <list>
#include <any>

/*! This interface is use to create propre abstract domains, it gives the skeleton of the wanted abstract domains.  This is done in a generic way so that any domains can be implemented with this interface. */
template<typename T>
class abstract_domain
{
	protected:
		virtual T init(std::list<std::any> env) = 0;
		virtual T bottom() = 0;
		virtual T assign(T map,std::any var, int expr) = 0;
		virtual T guard(T map, bool pred) = 0;
		virtual T join(T map, T second_map) = 0;
		virtual T widen(T map, T second_map) = 0;
		virtual bool subset(T map, T second_map) = 0;
		virtual bool is_bottom(T map) = 0;
		virtual void print(T map) = 0;
};
