function RadarProduct() {
  this.product = '';
  this.description = '';
  this.lon = 0.0;
  this.lat = 0.0;
  zoom = 5;
  this.nelon = 0.0;
  this.nelat = 0.0;
  this.swlon = 0.0;
  this.swlat = 0.0;
}

var radar_products = {};

var radar_option_list = new Array();

radar_products['cawkr_gmaps'] = new RadarProduct;
radar_products['cawkr_gmaps'].description = 'King City, ON';
radar_products['cawkr_gmaps'].lon = -79.57416;
radar_products['cawkr_gmaps'].lat = 43.96388; 
radar_products['cawkr_gmaps'].zoom = 6;
radar_products['cawkr_gmaps'].nelon = -77.690089;
radar_products['cawkr_gmaps'].nelat = 45.319843;
radar_products['cawkr_gmaps'].swlon = -81.454030;
radar_products['cawkr_gmaps'].swlat = 42.608139;
radar_option_list[0] = 'cawkr_gmaps';

