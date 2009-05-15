package com.hydraframework.plugins.navigation {
	import com.hydraframework.core.mvc.patterns.plugin.Plugin;
	import com.hydraframework.plugins.navigation.controller.*;
	import com.hydraframework.plugins.navigation.interfaces.IContentContainer;
	import com.hydraframework.plugins.navigation.view.ContentContainerMediator;

	public class PageNavigationPlugin extends Plugin {
		public static const NAME:String = "PageNavigationPlugin";
		public static const CONTENT_LOAD:String = "plugins.navigation.contentLoad";
		public var contentContainer:IContentContainer;

		public function PageNavigationPlugin(contentContainer:IContentContainer) {
			super(NAME);
			this.contentContainer = contentContainer;
		}

		override public function preinitialize():void {
			super.preinitialize();
			/*
			   Plugin dependencies
			 */
			this.facade.registerPlugin(new NavigationPlugin());
			/*
			   Mediators
			 */
			this.facade.registerMediator(new ContentContainerMediator(this.contentContainer));
			/*
			   Commands
			 */
			this.facade.registerCommand(NavigationPlugin.NAVIGATE, PageNavigateCommand);
		}
	}
}
