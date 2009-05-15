package com.hydraframework.plugins.navigation.view {
	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.events.Phase;
	import com.hydraframework.core.mvc.patterns.mediator.Mediator;
	import com.hydraframework.plugins.navigation.PageNavigationPlugin;
	import com.hydraframework.plugins.navigation.interfaces.IContent;
	import com.hydraframework.plugins.navigation.interfaces.IContentContainer;
	import com.hydraframework.plugins.navigation.interfaces.ISitemapItem;
	import com.hydraframework.plugins.navigation.interfaces.ISitemapItemData;
	import com.hydraframework.plugins.navigation.view.events.ContentEvent;
	
	import flash.display.DisplayObject;
	import flash.system.ApplicationDomain;
	
	import mx.events.ModuleEvent;

	public class ContentContainerMediator extends Mediator {
		public static const NAME:String = "ContentContainerMediator";

		public function get contentContainer():IContentContainer {
			return this.component as IContentContainer;
		}
		private var currentSitemapItem:ISitemapItem;

		public function ContentContainerMediator(component:IContentContainer) {
			super(NAME, component);
		}

		override public function initialize():void {
			super.initialize();
			contentContainer.getComponentContainer().addEventListener(ContentEvent.TRANSITION_OUT_COMPLETE, handleTransitionOutComplete);
			contentContainer.getModuleLoader().addEventListener(ContentEvent.TRANSITION_OUT_COMPLETE, handleTransitionOutComplete);
			contentContainer.getModuleLoader().addEventListener(ModuleEvent.READY, handleModuleLoad);
		}

		override public function handleNotification(notification:Notification):void {
			super.handleNotification(notification);

			switch (notification.name) {
				case PageNavigationPlugin.CONTENT_LOAD:
					if (notification.isRequest()) {
						currentSitemapItem = ISitemapItem(notification.body);

						if (contentContainer.getModuleLoader().child && (contentContainer.getModuleLoader().child as IContent)) {
							(contentContainer.getModuleLoader().child as IContent).transitionOut();
						} else if (contentContainer.getComponentContainer().numChildren > 0 && (contentContainer.getComponentContainer().getChildAt(0) as IContent)) {
							(contentContainer.getComponentContainer().getChildAt(0) as IContent).transitionOut();
						} else {
							handleTransitionOutComplete(null);
						}
					}
					break;
			}
		}

		private function handleTransitionOutComplete(event:ContentEvent):void {
			contentContainer.getComponentContainer().removeAllChildren();
			contentContainer.getModuleLoader().unloadModule();
			contentContainer.getModuleLoader().child = null;
			var sitemapItemData:ISitemapItemData;

			try {
				sitemapItemData = ISitemapItemData(currentSitemapItem.getData());
			} catch (error:Error) {
				throw new Error("HydraFramework PageNavigationPlugin Error: PageNavigationPlugin requires that the data property of ISiteMap items be of type ISitemapItemData.");
			}
			var component:DisplayObject;

			if (sitemapItemData.getContent() is Class) {
				component = new(sitemapItemData.getContent() as Class) as DisplayObject;
				contentContainer.getComponentContainer().addChild(component);
				this.sendNotification(new Notification(PageNavigationPlugin.CONTENT_LOAD, null, Phase.RESPONSE));
			} else {
				contentContainer.getModuleLoader().applicationDomain = ApplicationDomain.currentDomain;
				contentContainer.getModuleLoader().loadModule(sitemapItemData.getContent() as String);
			}
		}

		private function handleModuleLoad(event:ModuleEvent):void {
			this.sendNotification(new Notification(PageNavigationPlugin.CONTENT_LOAD, null, Phase.RESPONSE));
		}
	}
}