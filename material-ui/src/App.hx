package;

import js.Browser;

import mui.core.Button;
import mui.core.CssBaseline;
import mui.core.Grid;
import mui.core.styles.MuiTheme.createMuiTheme;
import mui.core.styles.MuiThemeProvider;
import react.ReactDOM;
import react.ReactMacro.jsx;

class App {
	public static function main() {
		var wrapper = Browser.document.createElement("div");
		Browser.document.body.appendChild(wrapper);

		// Will be merged with default values from mui
		var theme = createMuiTheme({
			palette: {
				background: {
					dark: "#424242"
				},
				text: {
					inverted: "#fefefe"
				}
			}
		});

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
								<$MyComponent>
									Test 2
								</$MyComponent>
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
