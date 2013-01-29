#import "Kiwi.h"

SPEC_BEGIN(FirstSpecs)

describe(@"The spec runner", ^{
    it(@"should be able to run passing specs", ^{
        NSString *myValue = @"Valid Value";
        [[myValue should] equal:@"Valid Value"];
    });
});

SPEC_END