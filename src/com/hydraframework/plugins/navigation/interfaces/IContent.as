/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the MIT License (http://www.opensource.org/licenses/mit-license.php)
 */
package com.hydraframework.plugins.navigation.interfaces {

	public interface IContent {
		function transitionOut():void;
		function dispatchTransitionOut():void;
		function setArguments(args:Object):void;
		function getArguments():Object;
		function applyArguments():void;
		function isActive():Boolean;
	}
}