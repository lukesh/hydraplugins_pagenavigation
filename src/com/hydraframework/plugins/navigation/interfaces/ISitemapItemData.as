/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
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