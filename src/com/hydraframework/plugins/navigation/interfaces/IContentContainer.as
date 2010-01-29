/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the MIT License (http://www.opensource.org/licenses/mit-license.php)
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