package {
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class IdManager extends AbstractIdManager {
		
		private var _httpService:HTTPService = null;
		private var _webServiceURL:String = "";
		private var _connectionTimer:Timer;
		private var _username:String;
		private var _peerId:String;
		
		override protected function doSetService(service:Object):void {
			_webServiceURL = service as String;
		}
		
		override protected function doRegister(username:String, peerId:String):void {
			if(_webServiceURL.length == 0 || username.length == 0 || peerId.length == 0) {
				dispatchEvent(new IdManagerError("reigsterFailure", "Empty web service URL/user/peerId"));
				return;
			}
			_username = username;
			_peerId = peerId;
			
			_httpService = new HTTPService();
			_httpService.url = _webServiceURL;
			_httpService.addEventListener("result", httpResult);
			_httpService.addEventListener("fault", httpFault);
			
			var request:Object = new Object();
			// Enable proper URL redirect
			request.r = "user/idManager";
			request.action = "register";
			request.username = username;
			request.peerId = peerId;
			_httpService.cancel();
			trace(_httpService);
			_httpService.send(request);
			
			_connectionTimer = new Timer(1000 * 60 * 30);
			_connectionTimer.addEventListener(TimerEvent.TIMER, onConnectionTimer);
			_connectionTimer.start();
			
		}
		
		override protected function doLookup(username:String):void {
			if(_httpService) {
				var request:Object = new Object();
				// Enable proper URL redirect
				request.r = "user/idManager";
				request.action = "lookup";
				request.username = username;
				request.time = (new Date()).getTime();
				_httpService.cancel();
				_httpService.send(request);
			} else {
				dispatchEvent(new IdManagerError("lookupFailure", "HTTP Service not initialized"));
			}
		}
		
		override protected function doUnregister():void {
			if(_httpService) {
				var request:Object = new Object();
				// Enable proper URL redirect
				request.r = "user/idManager";
				request.action = "unregister";
				request.username = _username;
				_httpService.cancel();
				_httpService.send(request);
				
				if(_connectionTimer) {
					_connectionTimer.stop();
					_connectionTimer  = null;
				}
			} else {
				dispatchEvent(new IdManagerError("unregisterFailure", "HTTP Service not initialized"));
			}			
		}
		
		private function onConnectionTimer(evnt:TimerEvent):void {
			var request:Object = new Object();
			// Enable proper URL redirect
			request.r = "user/idManager";
			request.action = "register";
			request.username = _username;
			request.peerId = _peerId;
			request.time = (new Date().getTime());
			_httpService.cancel();
			_httpService.send(request);
		}
		
		private function httpFault(evnt:FaultEvent):void {
			dispatchEvent(new IdManagerError("idManagerError", "HTTP Error: " + evnt.message.toString()));
		}
		
		private function httpResult(evnt:ResultEvent):void {
			var result:Object = evnt.result as Object;
			var remote:Object;

			switch(result.result.message) {
				case "registerSuccess": {		
					dispatchEvent(new Event("registerSuccess"));
					break;
				}
				case "unRegisterSuccess": {
					dispatchEvent(new Event("unRegisterSuccess"));
					break;
				}
				case "lookupSuccess": {
					remote = result.result as Object;
					dispatchEvent(new IdManagerEvent("lookupSuccess", remote.username, remote.peerId));
					break;
				}
				default: {
					dispatchEvent(new IdManagerError("idManagerError", "Unhandled HTTP response"));
					break;
				}
			}
		}
		
	}
}