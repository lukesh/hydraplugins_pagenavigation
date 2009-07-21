/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.hydraframework.plugins.navigation.interfaces {
	import mx.core.Container;
	import mx.core.IUIComponent;
	import mx.modules.ModuleLoader;

	public interface IContentContainer extends IUIComponent {
		function getComponentContainer():Container;
		function getModuleLoader():ModuleLoader;
	}
}