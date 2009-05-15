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