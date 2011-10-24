package {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class AbstractIdManager extends EventDispatcher {
		[Event(name="registerSuccess", type="Event")]
		[Event(name="registerFailure", type="IdManagerError")]
		[Event(name="lookupFailure", type="IdManagerError")]
		[Event(name="lookupSuccess", type="IdManagerEvent")]
		[Event(name="idManagerError", type="IdManagerError")]
		
		public function register(username:String, peerId:String):void {
			doRegister(username, peerId);
		}
		
		public function lookup(username:String):void {
			doLookup(username);
		}
		
		public function unregister():void {
			doUnregister();
		}
		
		public function set service(service:Object):void {
			doSetService(service);
		}
		
		protected function doRegister(username:String, peerId:String):void {
			var e:Event = new Event("registerFailure");
			dispatchEvent(e);
		}
		
		protected function doLookup(username:String):void {
			var e:Event = new Event("lookupFailure");
			dispatchEvent(e);
		}
		
		protected function doUnregister():void {
			// MUST override
		}
		
		protected function doSetService(service:Object):void {
			// MUST override
		}
	}
}
