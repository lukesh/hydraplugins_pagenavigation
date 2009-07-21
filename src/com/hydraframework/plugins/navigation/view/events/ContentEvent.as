/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.hydraframework.plugins.navigation.view.events {
	import flash.events.Event;

	public class ContentEvent extends Event {
		public static const TRANSITION_OUT_COMPLETE:String = "ContentEvent.transitionOutComplete";
		public static const ARGUMENTS_APPLIED:String = "ContentEvent.argumentsApplied";
		
		public function ContentEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}