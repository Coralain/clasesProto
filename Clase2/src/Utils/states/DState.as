package Utils.states 
{
	import flash.system.ImageDecodingPolicy;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import Utils.start.DStarling;
	
	public class DState extends Sprite
	{
		
		protected var skin:Image;
		protected var clip:String;
		
		public function DState(_clip:String) 
		{
			clip = _clip;
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			init();
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			destroy();
			
		}
		
		public function destroy():void 
		{
			
		}
		
		public function init():void 
		{
			skin = new Image(DStarling.assetsManager.getTexture(clip));
			addChild(skin);
		}
	}

}