/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
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