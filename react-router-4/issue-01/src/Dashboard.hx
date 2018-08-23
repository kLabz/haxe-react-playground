package;

import react.ReactComponent;
import react.ReactMacro.jsx;
import react.router.NavLink;
import react.router.Route;
import react.router.Switch;

class Dashboard extends ReactComponentOfNothing {
	override public function render() {
		return jsx('
			<div>
				<h1>Dashboard</h1>

				<ul>
					<li>
						<$NavLink activeStyle=${{color: 'green'}} to="/dashboard/roles">
							Roles
						</$NavLink>
					</li>

					<li>
						<$NavLink activeStyle=${{color: 'green'}} to="/dashboard/settings">
							Settings
						</$NavLink>
					</li>
				</ul>

				<$Switch>
					<$Route path="/dashboard/roles" component={RolesForm.__jsxStatic} />
					<$Route path="/dashboard/settings" component={SettingsForm.__jsxStatic} />
				</$Switch>
			</div>
		');
	}
}
