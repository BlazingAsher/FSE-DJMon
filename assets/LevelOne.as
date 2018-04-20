package
{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.utils.*;
	import flash.ui.Keyboard;
	import flash.geom.Point;
	public class LevelOne extends MovieClip
	{

		var levelTimer:Timer;
		var vx,vy:int;
		var p:Player;
		var borderTracker:BorderTracker;
		var assetArray:Array;
		
		//w = 1600
		//h = 668
		
		public function LevelOne()//CONSTRUCTOR - runs when the program starts
		//it has the same name as the class name - runs ONLY ONCE
		{
			createAssets();
			this.addEventListener(Event.ENTER_FRAME,gameLoop);
			
		}//end CONSTRUCTOR
		
		public function getLevelStatus(){
			return "test";
		}
		
		public function createAssets(){
			
			assetArray = new Array();
			
			vx = 0;
			vy = 0;
			
			p = new Player();
			this.addChild(p);
			
			for(var i:int=0;i<4;i++){ //check whether to move player or background
				borderTracker = new BorderTracker();
				if(i == 0){
					borderTracker.x = -800;
					borderTracker.y = 334;
				}
				else if(i == 1){
					borderTracker.x = -800;
					borderTracker.y = -334;
				}
				else if(i == 2){
					borderTracker.x = 800;
					borderTracker.y = 334;
				}
				else{
					borderTracker.x = 800;
					borderTracker.y = -334;
				}
				
				this.addChild(borderTracker);
				assetArray.push(borderTracker);
			}
			
		}
		
		public function handleKeyboardDown(e:KeyboardEvent){
			if(e.keyCode == Keyboard.UP){
				vy = -5;
			}
			if(e.keyCode == Keyboard.DOWN){
				vy = 5;
			}
			if(e.keyCode == Keyboard.LEFT){
				vx = -5;
			}
			if(e.keyCode == Keyboard.RIGHT){
				vx = 5;
			}
		}
		
		public function handleKeyboardUp(e:KeyboardEvent){
			if(e.keyCode == Keyboard.UP){
				vy = 0;
			}
			if(e.keyCode == Keyboard.DOWN){
				vy = 0;
			}
			if(e.keyCode == Keyboard.LEFT){
				vx = 0;
			}
			if(e.keyCode == Keyboard.RIGHT){
				vx = 0;
			}
		}
		
		public function movePlayer(){
			var outOfBounds:Boolean = false;
			
			for(var i:int=0;i<4;i++){
				var pt2:Point = new Point(assetArray[i].x, assetArray[i].y);
				pt2 = assetArray[i].localToGlobal(pt2);
				
				//trace(pt2);
				
/*				if(pt2.x < 550 || pt2.x > 0 || pt2.y < 400 || pt2.y > 0){
					outOfBounds = true;
				}*/
			}
			
			//trace(outOfBounds);
		
			var pt:Point = new Point(p.x, p.y);
			pt = p.localToGlobal(pt);
			//trace(pt);
			
			if(pt.x < 20 && vx<0 && !outOfBounds){
				this.x += -vx;
				p.x += vx;
				trace(this.x);
				trace(p.x);
				trace(vx);
			}
			else if(pt.x > 530 && vx>0 && !outOfBounds){
				this.x += -vx;
				p.x += vx;
			}
			else if(pt.x < 530 && pt.x > 20){
				p.x += vx;
			}
			
			/*if(pt.y < 20 && vy>0 && !outOfBounds){
				trace("hi");
				trace(vy);
				trace(pt.y);
				//this.y += -vy;
				p.y += vy;
			}
			else if(pt.y > 380 && vy<0 && !outOfBounds){
				trace("bye");
				//this.y += -vy;
				p.y += vy;
			}
			else{
				p.y += vy;
			}*/
		}
		
		public function gameLoop(e:Event)
		{
			movePlayer();
			//p.x = mouseX;
			//p.y = mouseY;
		 	//trace("hi");
		}
	}//end class
}//end package