package;

import js.Browser;
import react.ReactDOM;
import react.ReactMacro.jsx;
import react.router.BrowserRouter;
import react.router.Route;
import react.router.Switch;
import react.router.bundle.Bundle;
import redux.react.Provider;
import AppStore;

class Main {
	public static function main() {
		var store = AppStore.create();

		var wrapper = Browser.document.createDivElement();
		Browser.document.body.appendChild(wrapper);

		#if (debug && react_hot) var app = #end
		ReactDOM.render(jsx('
			<Provider store=$store>
				<$BrowserRouter>
					<$Switch>
						<$Route path="/test" component=${Bundle.load(Test)} />
						<$Route path="/" component=${Bundle.load(Index)} />
					</$Switch>
				</$BrowserRouter>
			</Provider>
		'), wrapper);

		#if (debug && react_hot)
		ReactHMR.autoRefresh(app);
		#end
	}
}

