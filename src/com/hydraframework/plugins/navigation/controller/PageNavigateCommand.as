/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the MIT License (http://www.opensource.org/licenses/mit-license.php)
 */
package com.hydraframework.plugins.navigation.controller {
	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.events.Phase;
	import com.hydraframework.core.mvc.interfaces.IFacade;
	import com.hydraframework.plugins.navigation.PageNavigationPlugin;
	import com.hydraframework.core.mvc.patterns.command.SimpleCommand;

	public class PageNavigateCommand extends SimpleCommand {
		public function PageNavigateCommand(facade:IFacade) {
			super(facade);
		}

		override public function execute(notification:Notification):void {
			super.execute(notification);

			if (notification.isResponse()) {
				this.facade.sendNotification(new Notification(PageNavigationPlugin.CONTENT_LOAD, notification.body, Phase.REQUEST));
			}
		}
	}
}