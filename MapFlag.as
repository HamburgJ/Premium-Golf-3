package {
	import flash.display.*;
	import flash.events.*;
	
	public class MapFlag extends MovieClip {
		//Scale for on the map (the value isn't too important)
		private var scale = 0.1;
		
		//Position on the map
		public var mapX:Number;
		public var mapY:Number;
		
		public function MapFlag(mapX,mapY,mapOffset,mapScale) {
			//Scale
			this.scaleX = scale;
			this.scaleY = scale;
			
			//Set coordinates
			this.x = mapOffset + mapX*mapScale;
			this.y = mapOffset + mapY*mapScale;
			
			//Set map coordinates
			this.mapX = mapX;
			this.mapY = mapY;
		}
		
		public function remove() {
			parent.removeChild(this);
		}
		
	}
	
}