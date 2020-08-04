package {
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	
	public class Ground extends MovieClip {
		//Size before scaling
		public var unscaledWidth:Number;
		public var unscaledHeight:Number;
		
		//Positions for respawning
		private var lastRotZ:Number;
		private var lastX:Number;
		private var lastZ:Number;
		private var lastScale:Number;
		
		public function Ground(posX, posY, scale, currentHole) {
			//Texture to use for level
			this.gotoAndStop(currentHole);
			
			//Set Postion
			this.x = posX;
			this.y = posY;
			
			//Set unscaled size before scaling
			this.unscaledWidth = this.width;
			this.unscaledHeight = this.height;
			
			//Rotate to be flat on the ground
			this.rotationX = 90;
			this.rotationY = -180;
			this.rotationZ = 180;
			
			//Scale
			this.scaleX = scale;
			this.scaleY = scale;
			
			updateLastPos()
		}
		
		//Update position for respawning
		public function updateLastPos() {
			this.lastRotZ = this.rotationZ;
			this.lastX = this.x;
			this.lastZ = this.z;
			this.lastScale = this.scaleX;
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
			this.rotationX = 90
			this.rotationY = 180;
			this.rotationZ = this.lastRotZ;
			this.z = this.lastZ;
			this.x = this.lastX;
			this.scaleX = this.lastScale;
			this.scaleY = this.lastScale;
		}
		
		public function remove() {
			parent.removeChild(this);
		}
		
	}
	
}