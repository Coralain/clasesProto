package Utils.start
{
	import flash.display.Stage;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	public class DStarling
	{
		private static var starling:Starling;
		private static var _assetsManager:AssetManager;
		private static var _assets:Vector.<String>;
		private static var onComplete:Function;
		private static var baseClass:Class;
		
		public static function init(rootClas:Class, stage:Stage,
									assets:Vector.<String>, _onComplete:Function):void
									//Tambien se puede crear de tipo function :O
		{
			starling = new Starling(rootClas, stage);
			onComplete = _onComplete;
			baseClass = rootClas;
			starling.start();
			assetsManager = new AssetManager();
			_assets = assets;
			starling.addEventListener(Event.ROOT_CREATED, onRootCreated);
		}
		
		static private function onRootCreated(e:Event):void
		{
			starling.removeEventListener(Event.ROOT_CREATED, onRootCreated);
			
			for (var i:int = 0; i < _assets.length; i++)
			{
				assetsManager.enqueue(_assets[i]);
			}
			
			assetsManager.loadQueue(endQueue);
			//load comienza a cargar... 
		}
		
		static private function endQueue(ratio:Number):void
		{
			//entonces endQueue permite avisar que ya terminaron de cargar los assets
			if (ratio == 1)
			{
				var game:Object = starling.root as baseClass;
				game.start();
				//igual a (baseClass)starling.root;
				/*trae al objeto que tengas dentro -Game-
				y que lo vuelvas a la clase que pasaste...
				que es la clase Game :v */
				//onComplete();
			}
		}
		
		static public function get assetsManager():AssetManager 
		{
			return _assetsManager;
		}
		
		static public function set assetsManager(value:AssetManager):void 
		{
			_assetsManager = value;
		}
	
	}

}