package
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.display.DisplayObject;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import Utils.start.DStarling;
	
	public class Game extends Sprite
	{
		private var timer:Timer = new Timer(1000);
		
		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		public function start():void
		{
			trace("start");
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			
			var bg:Image = new Image(DStarling.assetsManager.getTexture("scene1"));
			addChild(bg);
			bg.x = bg.y = 0;
			bg.width = stage.width;
			bg.height = stage.height;
			
			stage.addEventListener(TouchEvent.TOUCH,onTouch);
		}
		
		private function onTimer(e:TimerEvent):void
		{
			if (timer.currentCount % 4 == 0)
			{
				var mx:Image = new Image(DStarling.assetsManager.getTexture("coin"));
				addChild(mx);
				mx.x = Math.random() * stage.stageWidth;
				mx.y = Math.random() * stage.stageHeight;
				mx.name = 'coin';
			}
			else
			{
				var mc:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("walk00"));
				addChild(mc);
				mc.x = Math.random() * stage.stageWidth;
				mc.y = Math.random() * stage.stageHeight;
				Starling.juggler.add(mc);
				mc.name = 'green';
			}
		}
		
		private function onTouch(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(this);
			if (touch != null)
			{
				if (touch.phase == TouchPhase.BEGAN)
				{
					var content:DisplayObject = e.target as DisplayObject;
					if (content.name == 'coin' || content.name = 'green') 
					{
						removeChild(content);
					}
					trace(e.target);
				}
			}
		}
	
	}

}