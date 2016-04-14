package org.mangui.osmf.plugins.events
{
	import flash.events.Event;

	public class HLSID3Event extends Event
	{
		public static const ID3:String	= "id3";
		public var data:String;

		public function HLSID3Event(type:String, bubbles:Boolean=false, cancelable:Boolean=false, data:String=null)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
	}
}