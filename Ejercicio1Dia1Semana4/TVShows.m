//
//  TVShows.m
//  Ejercicio1Dia1Semana4
//
//  Created by Ruben Jeronimo Fernandez on 23/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "TVShows.h"

@implementation TVShows 

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        _identificadorSerie = [aDecoder decodeIntegerForKey:@"identificadorSerie"];
        _nombreSerie = [aDecoder decodeObjectForKey:@"nombreSerie"];
        _imagenSerie = [aDecoder decodeObjectForKey:@"imagenSerie"];
        _ratingSerie = [aDecoder decodeFloatForKey:@"ratingSerie"];
    }
     return self;
}


-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:_identificadorSerie forKey:@"identificadorSerie"];
    [aCoder encodeObject:_nombreSerie forKey:@"nombreSerie"];
    [aCoder encodeObject:_imagenSerie forKey:@"imagenSerie"];
    [aCoder encodeFloat:_ratingSerie forKey:@"ratingSerie"];
}

-(id)copyWithZone:(NSZone *)zone{
    TVShows *show = [[[self class] allocWithZone:zone]init];
    if (show) {
        show.identificadorSerie = self.identificadorSerie;
        [show setNombreSerie:[self.nombreSerie copyWithZone:zone]];
        [show setEpisodioSerie:[self.episodioSerie copyWithZone:zone]];
        show.imagenSerie=self.imagenSerie;
        show.ratingSerie = self.ratingSerie;
    }
    return show;
}

-(BOOL)isEqualToTVShow:(TVShows *)show{
    if (![self.nombreSerie isEqualToString: show.nombreSerie]) {
        return NO;
    }
    return YES;
}

-(BOOL)isEqual:(TVShows *)show{
    if (self == show) {
        return YES;
    }
    if (![show isKindOfClass:[self class]]) {
        return NO;
    }
    return [self isEqualToTVShow:show];
}

-(NSUInteger)hash{
    return [_nombreSerie hash];
}


@end
