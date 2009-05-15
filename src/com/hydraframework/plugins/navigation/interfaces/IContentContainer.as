package com.hydraframework.plugins.navigation.interfaces {
	import mx.core.Container;
	import mx.core.IUIComponent;
	import mx.modules.ModuleLoader;

	public interface IContentContainer extends IUIComponent {
		function getComponentContainer():Container;
		function getModuleLoader():ModuleLoader;
	}
}