//
//  LAJFilm.h
//  StarWars-C
//
//  Created by LAURA JELENICH on 10/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LAJFilm : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *producer;
@property (nonatomic, copy, readonly) NSString *openingCrawl;

- (instancetype)initWithTitle:(NSString *)title
                    producer:(NSString *)producer
                openingCrawl:(NSString *)openingCrawl;
@end

@interface LAJFilm (JSONConvertable)
- (LAJFilm *)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;
@end

NS_ASSUME_NONNULL_END
