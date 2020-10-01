//
//  LAJFilmController.h
//  StarWars-C
//
//  Created by LAURA JELENICH on 10/1/20.
//

#import <Foundation/Foundation.h>
#import "LAJFilm.h"


@interface LAJFilmController : NSObject

+ (void)fetchFilmForSearchTerm:(NSString *)searchId completion: (void (^) (LAJFilm *film))completion;

@end

