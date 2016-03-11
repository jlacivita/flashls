package org.mangui.osmf.plugins.events
{
	import flash.events.Event;

	public class HLSID3Event extends Event
	{
		public static const ID3:String	= "id3";
		public var id3s:Array;

		public function HLSID3Event(type:String, bubbles:Boolean=false, cancelable:Boolean=false, id3s:Array=null)
		{
			super(type, bubbles, cancelable);
			this.id3s = id3s;
		}
	}
}