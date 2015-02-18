//
//  SerieService.m
//  Minishows
//
//  Created by Julian Alonso on 17/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "SerieService.h"
#import "Serie.h"

@implementation SerieService


- (NSArray *)findAll
{
    Serie *s1 = [[Serie alloc] init];
    
    s1.name = @"Breaking bad";
    s1.generalInfo = @"Breaking Bad (en español podría traducirse como «Corrompiéndose - o - Volviéndose malo») es una serie de televisión dramática estadounidense creada y producida por Vince Gilligan. Breaking Bad narra la historia de Walter White (Bryan Cranston), un profesor de química con problemas económicos a quien le diagnostican un cáncer de pulmón inoperable. Para pagar su tratamiento y asegurar el futuro económico de su familia comienza a cocinar y vender metanfetamina,1 junto con Jesse Pinkman (Aaron Paul), un antiguo alumno suyo. La serie, ambientada y producida en Albuquerque (Nuevo México), se caracteriza por poner a sus personajes en situaciones que aparentemente no tienen salida, lo que llevó a que su creador la describa como un western contemporáneo.";
    s1.overview = @"Breaking Bad (en español podría traducirse como «Corrompiéndose - o - Volviéndose malo») es una serie de televisión dramática estadounidense creada y producida por Vince Gilligan. Breaking Bad narra la historia de Walter White (Bryan Cranston), un profesor de química con problemas económicos a quien le diagnostican un cáncer de pulmón inoperable. Para pagar su tratamiento y asegurar el futuro económico de su familia comienza a cocinar y vender metanfetamina,1 junto con Jesse Pinkman (Aaron Paul), un antiguo alumno suyo. La serie, ambientada y producida en Albuquerque (Nuevo México), se caracteriza por poner a sus personajes en situaciones que aparentemente no tienen salida, lo que llevó a que su creador la describa como un western contemporáneo.";
    s1.imageName = @"breakingbad";
    
    s1.generalDescription = @"The best serie ever.";
    
    Serie *s2 = [s1 copy];
    Serie *s3 = [s1 copy];
    Serie *s4 = [s1 copy];
    Serie *s5 = [s1 copy];
    Serie *s6 = [s1 copy];
    Serie *s7 = [s1 copy];
    Serie *s8 = [s1 copy];
    Serie *s9 = [s1 copy];
    
    return [NSArray arrayWithObjects:s1, s2, s3, s4, s5, s6, s7, s8, s9, nil];
}


@end
