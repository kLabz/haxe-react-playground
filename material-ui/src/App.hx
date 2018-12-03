package;

import js.Browser;

import react.ReactDOM;
import react.ReactMacro.jsx;
import mui.core.Button;
import mui.core.CssBaseline;
import mui.core.Grid;
import mui.core.styles.MuiTheme.createMuiTheme;
import mui.core.styles.MuiThemeProvider;

class App {
	public static function main() {
		var wrapper = Browser.document.createElement("div");
		Browser.document.body.appendChild(wrapper);

		var theme = createMuiTheme({});

		var app = ReactDOM.render(
			jsx('
				<$MuiThemeProvider theme=${theme}>
					<>
						<$CssBaseline />

						<$Grid container>
							<$Grid item>
								<$Button color=${Primary} variant=${Outlined} fullWidth>
									Test
								</$Button>
							</$Grid>
							<$Grid item>
								<$Button color=${Secondary} variant=${Raised} fullWidth>
									Test
								</$Button>
							</$Grid>
						</$Grid>
					</>
				</$MuiThemeProvider>
			'),
			wrapper
		);

		#if (debug && react_hot)
		ReactHMR.autoRefresh(app, false);
		#end
	}
}
