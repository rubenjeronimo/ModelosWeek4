//
//  TableViewCell.h
//  Ejercicio1Dia1Semana4
//
//  Created by Ruben Jeronimo Fernandez on 23/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imagenSerie;
@property (weak, nonatomic) IBOutlet UILabel *nombre;
@property (weak, nonatomic) IBOutlet UILabel *episodio;
@property (weak, nonatomic) IBOutlet UILabel *restante;
@end
