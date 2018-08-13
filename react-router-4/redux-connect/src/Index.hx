package;

import react.ReactMacro.jsx;
import react.router.Link;

@:expose('default')
@:jsxStatic(render)
class Index {
	public static function render() {
		return jsx('
			<>
				<h3>Index</h3>
				<p><$Link to="/test">Test</$Link></p>
			</>
		');
	}
}
