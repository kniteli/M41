module m41.core.events;

import m41.utility;
import std.container, std.typecons, std.algorithm, std.stdio;

enum Events : uint {
	Quit = 0,
	MouseMove,
	END
}

EventsHub Hub;

static this() {
	Hub = new EventsHub;
}

class EventsHub {
	Array!(EventsComponent)[Events.END] listeners;

	void postEvent()(Events event) {
		foreach(l; listeners[event]) {
			l.trigger(event);
		}		
	}

	void postEvent(T...)(Events event, T t) {
		foreach(l; listeners[event]) {
			l.trigger(event, t);
		}
	}

	void registerListener(Events event, EventsComponent registrant) {
            listeners[event] ~= registrant;
	}

	void unregisterListener(Events event, EventsComponent registrant) {
		auto target = listeners[event][].find(registrant);
		listeners[event].linearRemove(target[0..1]);
	}

	void silenceEvent(Events event) {

	}
}

alias ActionTrigger = void delegate();
alias RangeTrigger = void delegate(float x);
alias DoubleRangeTrigger = void delegate(float x, float y);
alias StateTrigger = void delegate (bool active);


class EventsComponent {
private:
	ActionTrigger[Events.END] action_events = null;
	RangeTrigger[Events.END] range_events = null;
	DoubleRangeTrigger[Events.END] double_range_events = null;
	StateTrigger[Events.END] state_events = null;
	bool[Events.END] mapped_events;

public:
	void trigger(Events event) {
		if(action_events[event]) {
			action_events[event]();
		} else {
			throw new Exception("No trigger set for event");
		}
	}

	void trigger(Events event, float x) {
		range_events[event](x);
	}

	void trigger(Events event, float x, float y) {
		double_range_events[event](x, y);
	}

	void trigger(Events event, bool active) {
		state_events[event](active);
	}

	void addTrigger(T)(Events event, T callback) {
		if(!mapped_events[event]) {
			mapped_events[event] = true;
			static if(is(T == ActionTrigger)) {
				action_events[event] = callback;
			} else static if(is(T == RangeTrigger)) {
				range_events[event] = callback;
			} else static if(is(T == DoubleRangeTrigger)) {
				double_range_events[event] = callback;
			} else static if(is(T == StateTrigger)) {
				state_events[event] = callback;
			} else {
				static assert(false, T.stringof ~ " is not supported");
			}
			Hub.registerListener(event, this);
		}
	}

	void removeTrigger(Events event) {
		action_events[event] = null;
		range_events[event] = null;
		double_range_events[event] = null;
		state_events[event] = null;
		mapped_events[event] = false;
		Hub.unregisterListener(event, this);
	}
}