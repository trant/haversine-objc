//
//  haversine.m
//
//  Created by Carsten Nielsen.
//

#import "Haversine.h"

float const HAVERSINE_RADS_PER_DEGREE = 0.0174532925199433;
float const HAVERSINE_MI_RADIUS = 3956.0;
float const HAVERSINE_KM_RADIUS = 6371.0;
float const HAVERSINE_M_PER_KM = 1000.0;
float const HAVERSINE_F_PER_MI = 5282.0;

@implementation Haversine

- (id)initWithPoint1:(CLLocationCoordinate2D)point1 andPoint2:(CLLocationCoordinate2D)point2 {
  self = [super init]; 
  if (self) {
      
      self.point1 = point1;
      self.point2 = point2;
  }
  return self; 
}

- (float)distance {
  float lat1Rad = self.point1.latitude * HAVERSINE_RADS_PER_DEGREE;
  float lat2Rad = self.point2.latitude * HAVERSINE_RADS_PER_DEGREE;
  float dLonRad = ((self.point2.longitude - self.point1.longitude) * HAVERSINE_RADS_PER_DEGREE);
  float dLatRad = ((self.point2.latitude - self.point1.latitude) * HAVERSINE_RADS_PER_DEGREE);
  float a = pow(sin(dLatRad / 2), 2) + cos(lat1Rad) * cos(lat2Rad) * pow(sin(dLonRad / 2), 2);
  return (2 * atan2(sqrt(a), sqrt(1 - a)));
}

- (float)toKilometers {
  return [self distance] * HAVERSINE_KM_RADIUS;
}

- (float)toMeters {
  return [self toKilometers] * HAVERSINE_M_PER_KM;
}

- (float)toMiles {
  return [self distance] * HAVERSINE_MI_RADIUS; 
}

- (float)toFeet {
  return [self toMiles] * HAVERSINE_F_PER_MI;
}

@end
