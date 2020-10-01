//
//  LAJFilm.m
//  StarWars-C
//
//  Created by LAURA JELENICH on 10/1/20.
//

#import "LAJFilm.h"

@implementation LAJFilm

- (instancetype)initWithTitle:(NSString *)title producer:(NSString *)producer openingCrawl:(NSString *)openingCrawl
{
    self = [super init];
    if (self)
    {
        _title = title;
        _producer = producer;
        _openingCrawl = openingCrawl;
    }
    return self;
}

@end

@implementation LAJFilm (JSONConvertable)

- (LAJFilm *)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *producer = dictionary[@"producer"];
    NSString *openingCrawl = dictionary[@"opening_crawl"];
    
    return [self initWithTitle:title producer:producer openingCrawl:openingCrawl];
}

@end
