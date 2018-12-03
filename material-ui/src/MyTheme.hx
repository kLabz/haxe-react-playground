package;

import js.Object;

// This is not complete but exposes what we are currently using of the theme
typedef MyTheme = {
	var mixins:Mixins;
	var palette:ColorPalette;
	var spacing:Spacings;
	var zIndex:ZIndexes;

	// TODO: typography
	// TODO: direction
	// TODO: breakpoints
}

typedef Spacings = {
	var unit:Int;
}

typedef Mixins = {
	var appBar:Object;
	var leftPanel:Object;
}

enum abstract PaletteType(String) from String to String {
	var Light = "light";
	var Dark = "dark";
}

typedef ColorPalette = {
	var type:PaletteType;
	var contrastThreshold:Int;
	var tonalOffset:Float;
	var getContrastText:haxe.Constraints.Function;
	var augmentColor:haxe.Constraints.Function;

	// TODO: use the real types
	var primary:Dynamic;
	var secondary:Dynamic;
	var error:Dynamic;
	var action:Dynamic;

	var divider:String;

	var background:{
		paper:String,
		// default:String

		// custom values
		dark:String
	};

	var grey:{
		// TODO
	};

	var text:{
		primary:String,
		secondary:String,
		disabled:String,
		hint:String,

		// custom values
		inverted: String
	};

	var common:{
		black:String,
		white:String
	};

	// custom values
	var indicator:IndicatorsPalette;
}

typedef IndicatorsPalette = {
	var green:String;
	var yellow:String;
	var orange:String;
	var red:String;
}

typedef ZIndexes = {
	var mobileStepper:Int;
	var appBar:Int;
	var drawer:Int;
	var modal:Int;
	var snackbar:Int;
	var tooltip:Int;
}
