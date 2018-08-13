package;

import react.ReactComponent;
import react.ReactMacro.jsx;
import redux.Redux.Dispatch;

import AppStore;

@:expose('default')
@:connect
class Test extends ReactComponent {
	static function mapStateToProps(state:AppState) {
		return {
			counter: state.data.counter
		};
	}

	static function mapDispatchToProps(dispatch:Dispatch) {
		return {
			inc: function() dispatch(Action.Increment)
		};
	}

	override public function render() {
		return jsx('
			<button onClick=${props.inc}>${props.counter}</button>
		');
	}
}

