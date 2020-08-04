package {
	import flash.display.*;
	import flash.events.*;
	
	public class Background extends MovieClip {
		private var turnSpeed; //The speed of the background during turning
		private var autoMove = false; //For clouds
		private var autoMoveSpeed; //Speed for automoving
		private var Texture:String;
		
		public function Background(texture) {
			//Initialize coordinates
			this.x = 0;
			this.y = 0;
			this.Texture = texture;
			
			//Set variables for the specific textures
			switch (texture) {
				case "Bush":
					gotoAndStop(1);
					this.turnSpeed = 30;
					break;
				case "Hills":
					gotoAndStop(2);
					this.turnSpeed = 30;
					break;
				case "Clouds":
					gotoAndStop(3);
					this.turnSpeed = 20;
					this.autoMove = true;
					this.autoMoveSpeed = 1;
					break;
			}
			addEventListener(Event.EXIT_FRAME, update);
		}
		
		private function update(e:Event) {
			//Automove
			if (this.autoMove) {
				this.x -= autoMoveSpeed;
			}
			/*
			if (this.Texture == "Hills") {
				parent.setChildIndex(this, 2);
			} else {
				parent.setChildIndex(this, 2);
			}
			*/
			//Adjust sprite if it turns too far 
			if (this.x > 0) {
				this.x -= this.width/2;
			} else if (this.x < -this.width+875) {
				this.x += this.width/2;
			}
		}
		
		//Turn by moving the x
		public function turn(dir):void {
			var tSpeed = this.turnSpeed;
			if (dir == "right") {
				tSpeed *= -1;
			}
			this.x += tSpeed;
		}
		
		public function remove() {
			removeEventListener(Event.EXIT_FRAME, update);
			parent.removeChild(this);
		}
	
	}
	
}