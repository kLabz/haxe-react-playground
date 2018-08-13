package;

import redux.IReducer;
import redux.Redux;
import redux.Store;
import redux.StoreMethods;
import redux.StoreBuilder.*;
import AppState.DataState;

class AppStore {
	static public function create():Store<AppState> {
		// store model, implementing reducer and middleware logic
		var data = new DataStore();

		// create root reducer normally, excepted you must use
		// 'StoreBuilder.mapReducer' to wrap the Enum-based reducer
		var rootReducer = Redux.combineReducers({
			data: mapReducer(Action, data)
		});

		return createStore(rootReducer, null, null);
	}
}

enum Action {
	Increment;
}

class DataStore implements IReducer<Action, DataState> {
	public var store:StoreMethods<AppState>;
	public var initState:DataState = {
		counter: 0
	};

	public function new() {}

	public function reduce(state:DataState, action:Action):DataState {
		return switch(action) {
			case Increment: {counter: state.counter + 1};
		};
	}
}

