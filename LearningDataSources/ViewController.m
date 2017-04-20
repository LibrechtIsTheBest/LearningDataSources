#import "ViewController.h"
#import "PhotoTypeDataSource.h"
#import "ANIPoint.h"
#import "Photo.h"
#import "PhotoType.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    Photo *photo1 = [[Photo alloc] initWithImageName:@"photo1" comment:@"comment1"];
    Photo *photo2 = [[Photo alloc] initWithImageName:@"photo2" comment:@"comment2"];
    Photo *photo3 = [[Photo alloc] initWithImageName:@"photo3" comment:@"comment3"];
    Photo *photo4 = [[Photo alloc] initWithImageName:@"photo4" comment:@"comment4"];
    Photo *photo5 = [[Photo alloc] initWithImageName:@"photo5" comment:@"comment5"];

    PhotoType *type1 = [[PhotoType alloc] initWithName:@"type1"
        requiredQuantity:5
        photos:@[photo1, photo2, photo3]];

    PhotoType *type2 = [[PhotoType alloc] initWithName:@"type2"
        requiredQuantity:3
        photos:@[photo4, photo5]];

    ANIPoint *point = [[ANIPoint alloc] initWithName:@"POINT 1"
        address:@"1234567890"
        photoTypes:@[type1, type2]];
    
    PhotoTypeDataSource *dataSource1 = [[PhotoTypeDataSource alloc] initWithPoints:@[point]
        photoType:type1];

    NSLog(@"numberOfGroups: %@", @(dataSource1.numberOfGroups));
    for (int i = 0; i < dataSource1.numberOfGroups; ++i) {
        NSLog(@"numberOfObjectsInGroup %@: %@", @(i), @([dataSource1 numberOfObjectsInGroup:i]));
        NSLog(@"Header: %@", [dataSource1 headerObjectOfGroup:i]);
        for (int j = 0; j < [dataSource1 numberOfObjectsInGroup:i]; ++j) {
            NSLog(@"objectAtIndex %@ inGroup%@: %@", @(j), @(i), [dataSource1 objectAtIndex:j inGroup:i]);
        }
        NSLog(@"Footer: %@", [dataSource1 footerObjectOfGroup:i]);
    }
}

@end
