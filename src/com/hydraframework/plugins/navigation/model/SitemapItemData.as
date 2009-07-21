/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.hydraframework.plugins.navigation.model {
	import com.hydraframework.plugins.navigation.interfaces.ISitemapItemData;

	public class SitemapItemData implements ISitemapItemData {
		private var content:*;
		private var breadcrumb:Array;
		private var args:Object;
		private var authenticationRequired:Boolean;

		public function SitemapItemData(content:*, breadcrumb:Array = null, args:Object = null, authenticationRequired:Boolean = false) {
			this.content = content;
			this.breadcrumb = breadcrumb;
			this.args = args;
			this.authenticationRequired = authenticationRequired;
		}

		public function setContent(value:*):void {
			this.content = value;
		}

		public function getContent():* {
			return this.content;
		}

		public function setBreadCrumb(value:Array):void {
			this.breadcrumb = value;
		}

		public function getBreadCrumb():Array {
			return this.breadcrumb;
		}

		public function setArgs(value:Object):void {
			this.args = value;
		}

		public function getArgs():Object {
			return this.args;
		}

		public function setAuthenticationRequired(value:Boolean):void {
			this.authenticationRequired = value;
		}

		public function getAuthenticationRequired():Boolean {
			return this.authenticationRequired;
		}

		public function clone():ISitemapItemData {
			return new SitemapItemData(content, breadcrumb, args, authenticationRequired);
		}
	}
}