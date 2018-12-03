package;

// it's just easier with this lib
import classnames.ClassNames.fastNull as classNames;

import mui.core.Button;
import mui.core.styles.Classes;
import mui.core.styles.Styles;
import react.ReactComponent;
import react.ReactMacro.jsx;

private typedef Props = {
	> PublicProps,
	var classes:TClasses;
}

private typedef PublicProps = {
	var children:ReactFragment;
	@:optional var selected:Bool;
}

private typedef TClasses = Classes<[
	root,
	selected
]>

@:publicProps(PublicProps)
@:wrap(Styles.withStyles(styles))
class MyComponent extends ReactComponentOfProps<Props> {
	public static function styles(theme:MyTheme):ClassesDef<TClasses> {
		return {
			root: {
				padding: 4 * theme.spacing.unit,
				background: theme.palette.background.dark,
				color: theme.palette.text.inverted,
				"&::before": {
					content: '"pseudo-element"',
					display: "block",
					position: "relative"
				}
			},
			selected: {
				fontSize: "300%"
			}
		};
	}

	override public function render() {
		var classes = classNames({
			'${props.classes.root}': true,
			'${props.classes.selected}': props.selected
		});

		return jsx('
			<$Button variant=${Outlined} className=${classes} fullWidth>
				${props.children}
			</$Button>
		');
	}
}
