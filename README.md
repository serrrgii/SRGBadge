SRGBadge
========

Custom badge cocoa view.

Supports padding and horizontal alignment.

```objective-c
SRGBadgeView *multipleDigitBadge = [SRGBadgeView badgeWithText:@"123456"
                                                            origin:CGPointMake(origin.x, origin.y)
                                                              font:font
                                                           padding:3.0f
                                                   badgeBackgroundColor:[UIColor blueColor]
                                                   foreGroundColor:[UIColor grayColor]
                                                       borderWidth:4.0f
                                                         alignment:SRGBadgeViewAlignmentTypeCenter
                                                            ];
```
