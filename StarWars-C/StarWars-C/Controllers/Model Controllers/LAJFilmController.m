//
//  LAJFilmController.m
//  StarWars-C
//
//  Created by LAURA JELENICH on 10/1/20.
//

#import "LAJFilmController.h"

static NSString *const baseURLString = @"https://swapi.dev/api/";
static NSString *const filmEndpoint = @"films";

@implementation LAJFilmController

+ (void)fetchFilmForSearchTerm:(NSString *)searchId completion:(void (^)(LAJFilm *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *filmURL = [baseURL URLByAppendingPathComponent:filmEndpoint];
    NSURL *finalURL = [filmURL URLByAppendingPathComponent:searchId];
    NSLog(@"%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an Error: %@", error);
            return completion(nil);
        }

        if (!data)
        {
            NSLog(@"Error there appears to be no data: %@", error);
            return completion(nil);
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!dictionary)
        {
            NSLog(@"Error parsing the JSON: %@", error);
            completion(nil);
            return;
        }
        
        LAJFilm *film = [[LAJFilm alloc] initWithDictionary:dictionary];
        completion(film);
        
    }] resume];
}

@end
