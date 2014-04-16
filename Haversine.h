//
//  haversine.h
//
//  Created by Carsten Nielsen on 23/04/09.
//

#import <Foundation/Foundation.h>

extern float const HAVERSINE_RADS_PER_DEGREE;
extern float const HAVERSINE_MI_RADIUS;
extern float const HAVERSINE_KM_RADIUS;
extern float const HAVERSINE_M_PER_KM;
extern float const HAVERSINE_F_PER_MI;

@interface Haversine : NSObject
    
@property CLLocationCoordinate2D point1;
@property CLLocationCoordinate2D point2;

- (id)initWithPoint1:(CLLocationCoordinate2D)point1 andPoint2:(CLLocationCoordinate2D)point2 ;

- (float)distance;
- (float)toKilometers;
- (float)toMeters;
- (float)toMiles;
- (float)toFeet;

@end
