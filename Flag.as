package {
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Vector3D;
	
	public class Flag extends MovieClip {
		//Coordinates on map
		public var mapX:Number;
		public var mapY:Number;
		
		//Previous positions for respawning
		private var lastX:Number;
		private var lastY:Number;
		private var lastZ:Number;
		
		public function Flag(scale,mapX,mapY,playerMapX,playerMapY,WORLD_Y,STAGE_CENTRE_X) {
			//Set position
			this.scaleX = scale/10;
			this.scaleY = scale/10;
			this.x = STAGE_CENTRE_X + scale*(mapX - playerMapX);
			this.y = WORLD_Y;
			this.z = scale*(playerMapY - mapY);
			this.mapX = mapX;
			this.mapY = mapY;
			
			updateLastPos();
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		//Always face the player
		private function update(e:Event) {
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
		}
		
		public function remove() {
			parent.removeChild(this);
		}
		
	}
	
}