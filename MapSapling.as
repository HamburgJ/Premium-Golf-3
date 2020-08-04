package {
	import flash.display.*;
	import flash.events.*;
	
	public class MapSapling extends MovieClip {
		//Scale for on the map (the value isn't too important)
		private var scale = 0.1;
		
		public function MapSapling(mapX,mapY,mapOffset,mapScale,saplingFrame) {
			//Scale
			this.scaleX = scale;
			this.scaleY = scale;
			
			//Set map coordinates
			this.x = mapOffset + mapX*mapScale;
			this.y = mapOffset + mapY*mapScale;
			
			//Go to texture
			gotoAndStop(saplingFrame);
		}
		
		public function remove() {
			parent.removeChild(this);
		}
		
	}
	
}