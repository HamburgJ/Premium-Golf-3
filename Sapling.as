package {
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Vector3D;
	
	public class Sapling extends MovieClip {
		//Position on minimap
		public var mapX:Number; 
		public var mapY:Number;
		
		private var alphaTarget:Number = 1; //Alpha value to be transitioned to
		private var alphaZDistace:Number = 800; //Distance from Sapling to last changing alpha
		
		//Previous positions for respawning
		private var lastX:Number;
		private var lastY:Number;
		private var lastZ:Number;
		
		public function Sapling(scale,mapX,mapY,playerMapX,playerMapY,saplingFrame,WORLD_Y,STAGE_CENTRE_X) {
			//scale/10 makes a realistic tree size
			this.scaleX = scale/10;
			this.scaleY = scale/10;
			
			//Calculate place on screen
			this.x = STAGE_CENTRE_X + scale*(mapX - playerMapX);
			this.y = WORLD_Y;
			this.z = scale*(playerMapY - mapY);
			
			//Set map coordinates
			this.mapX = mapX;
			this.mapY = mapY;
			
			//Goto the chosen sprite
			gotoAndStop(saplingFrame);
			
			updateLastPos();
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event) {
			//Smoothly move alpha to alphaTarget
			if (this.z <= alphaZDistace) {
				alphaTarget = this.z/alphaZDistace + 0.3;
			} else {
				alphaTarget = 1;
			}
			this.alpha -= (this.alpha-alphaTarget)/10;
			
			//Make saplings always face the player
			this.rotationY = 0;
		}
		
		//Update position for respawning
		public function updateLastPos() {
			this.lastX = this.x;
			this.lastY = this.y;
			this.lastZ = this.z;
		}
		
		//Turn by rotating around the player
		public function turn(dir,turnX,turnY,turnSpeed):void {
			this.transform.matrix3D.appendTranslation(-turnX,-turnY,0);
			if (dir == "right") {
				turnSpeed *= -1;
			}
			this.transform.matrix3D.appendRotation(turnSpeed, Vector3D.Y_AXIS);
			this.transform.matrix3D.appendTranslation(turnX,turnY,0);
		}
		
		//Respawn
		public function gotoLastPos() {
			this.x = this.lastX;
			this.y = this.lastY;
			this.z = this.lastZ;
			this.alpha = 1;
		}
			
		public function remove() {
			removeEventListener(Event.ENTER_FRAME, update);
			parent.removeChild(this);
		}
		
	}
	
}