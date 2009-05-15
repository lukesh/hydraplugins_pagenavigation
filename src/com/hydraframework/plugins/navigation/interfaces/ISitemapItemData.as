package com.hydraframework.plugins.navigation.interfaces {

	public interface ISitemapItemData {
		function setContent(value:*):void;
		function getContent():*;
		function setBreadCrumb(value:Array):void;
		function getBreadCrumb():Array;
		function setArgs(value:Object):void;
		function getArgs():Object;
		function setAuthenticationRequired(value:Boolean):void;
		function getAuthenticationRequired():Boolean;
		function clone():ISitemapItemData;
	}
}