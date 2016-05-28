//
//  main.m
//  HiddenDigits


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
  
        NSString * line = @"abcdefghik";
        
        NSCharacterSet *numCharacterSet = [NSCharacterSet decimalDigitCharacterSet];
        
        NSDictionary *hiddenDigitDict = [NSDictionary dictionaryWithObjectsAndKeys:@"0", @"a", @"1", @"b", @"2", @"c", @"3", @"d", @"4", @"e", @"5", @"f", @"6", @"g", @"7", @"h", @"8", @"i", @"9", @"j", nil];
        
        BOOL foundAtLeastOneDigit = NO;
        
        NSMutableString *solutionString = [[NSMutableString alloc]init];
        
        NSInteger i = 0;
        for (i = 0; i < line.length; i++) {
            char charAtIndex = [line characterAtIndex:i];
            NSString *stringForCharAtIndex = [NSString stringWithFormat:@"%c", charAtIndex];
            
            if ([numCharacterSet characterIsMember:charAtIndex]) {
                [solutionString appendString:[NSString stringWithFormat:@"%c", charAtIndex]];
                 foundAtLeastOneDigit = YES;
            }
            
            
            else if ([[hiddenDigitDict allKeys] containsObject:stringForCharAtIndex]) {
                [solutionString appendString: [hiddenDigitDict objectForKey:stringForCharAtIndex]];
                foundAtLeastOneDigit = YES;
            }
        }
        
        if (!foundAtLeastOneDigit) {
            NSLog(@"NONE");
        }
        else {
            NSLog(@"solutionString: %@", solutionString);
        }
        
    }
    return 0;
}
