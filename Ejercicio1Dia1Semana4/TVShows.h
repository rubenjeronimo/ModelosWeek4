//
//  TVShows.h
//  Ejercicio1Dia1Semana4
//
//  Created by Ruben Jeronimo Fernandez on 23/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TVShows : NSObject<NSCopying,NSCoding>
@property int identificadorSerie;
@property (nonatomic,copy) NSString *nombreSerie;
@property (nonatomic,copy) NSString *episodioSerie;
@property (nonatomic,copy) NSString *descripcionSerie;
@property (nonatomic,copy) UIImage *imagenSerie;
@property (nonatomic,assign) CGFloat ratingSerie;

-(BOOL) isEqualToTVShow:(TVShows *)show;


@end
