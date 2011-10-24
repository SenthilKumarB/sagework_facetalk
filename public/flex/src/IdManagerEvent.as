package
{
	import flash.events.Event;
	
	public class IdManagerEvent extends Event {
		public var username:String;
		public var peerId:String;
		
		public function IdManagerEvent(type:String, username:String, peerId:String)
		{
			super(type);
			this.peerId = peerId;
			this.username = username;
		}
		
		override public function clone():Event
		{
			return new IdManagerEvent(type, username, peerId);
		}
	}
}