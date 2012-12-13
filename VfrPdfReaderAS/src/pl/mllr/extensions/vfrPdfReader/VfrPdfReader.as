package pl.mllr.extensions.vfrPdfReader
{

	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.geom.Point;
	import flash.system.Capabilities;

	public class VfrPdfReader extends EventDispatcher
	{

		public static const EXTENSION_ID : String = "pl.mllr.extensions.vfrPdfReader";
		
		private var context:ExtensionContext = null;
		private static var _set:Boolean = false;
		private static var _isSupp:Boolean = false;
		
		
		/**
		 * initializes vfr reader
		 */
		public function VfrPdfReader()
		{
			try{
				context = ExtensionContext.createExtensionContext(EXTENSION_ID, null);
			}catch(e:Error){
				trace(e.message,e.errorID);
			}
		}		
		public function dispose():void{
			if(context){
				context.dispose();
			}
		}
		/**
		 * opens pdf from specified path using password if required
		 * @param filePath absolute path to file
		 * @param password password required to open file (if used)
		 * @return true if file exists, false if file not found or extension is not supported
		 */		
		public function showFile(filePath:String,password:String=""):Boolean
		{
			try{
				return context.call("vfrPdfReaderShowFile",filePath,password);
			}catch(e:Error){
				trace("not supported on this platform");
			}
			return false;
		}
		/**
		 * Whether the VfrPdfReader is available on the device (true);<br>otherwise false
		 */
		public static function get isSupported():Boolean{
			if(!_set){// checks if a value was set before
				try{
					_set = true;
						var _context:ExtensionContext = ExtensionContext.createExtensionContext(EXTENSION_ID, null);
						_isSupp = _context.call("vfrPdfReaderIsSupported");
						_context.dispose();
				}catch(e:Error){
					trace(e.message,e.errorID);
					return _isSupp;
				}
			}	
			return _isSupp;

		}
	}
}





