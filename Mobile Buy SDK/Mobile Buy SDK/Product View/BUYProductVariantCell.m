//
//  BUYProductVariantCell.m
//  Mobile Buy SDK
//
//  Created by David Muzi on 2015-07-06.
//  Copyright (c) 2015 Shopify Inc. All rights reserved.
//

#import "BUYProductVariantCell.h"
#import "BUYVariantOptionView.h"
#import "BUYProductVariant.h"
#import "BUYOptionValue.h"

@interface BUYProductVariantCell ()
@property (nonatomic, strong) BUYVariantOptionView *optionView1;
@property (nonatomic, strong) BUYVariantOptionView *optionView2;
@property (nonatomic, strong) BUYVariantOptionView *optionView3;
@property (nonatomic, strong) BUYTheme *theme;
@end

@implementation BUYProductVariantCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
				
		_optionView1 = [[BUYVariantOptionView alloc] init];
		_optionView1.translatesAutoresizingMaskIntoConstraints = NO;
		[self.contentView addSubview:_optionView1];
		
		_optionView2 = [[BUYVariantOptionView alloc] init];
		_optionView2.translatesAutoresizingMaskIntoConstraints = NO;
		[self.contentView addSubview:_optionView2];
		
		_optionView3 = [[BUYVariantOptionView alloc] init];
		_optionView3.translatesAutoresizingMaskIntoConstraints = NO;
		[self.contentView addSubview:_optionView3];
		
		NSDictionary *views = NSDictionaryOfVariableBindings(_optionView1, _optionView2, _optionView3);
		[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_optionView1]-[_optionView2]-[_optionView3]" options:0 metrics:nil views:views]];
		[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_optionView1]-|" options:0 metrics:nil views:views]];
		[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_optionView2]-|" options:0 metrics:nil views:views]];
		[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_optionView3]-|" options:0 metrics:nil views:views]];

		self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}

	return self;
}

- (void)setProductVariant:(BUYProductVariant *)productVariant
{
	_productVariant = productVariant;

	switch (productVariant.options.count) {
		case 3: {
			BUYOptionValue *optionValue = productVariant.options.allValues[2];
			[self.optionView3 setTextForOptionValue:optionValue];
		}
		
		case 2: {
			BUYOptionValue *optionValue = productVariant.options.allValues[1];
			[self.optionView2 setTextForOptionValue:optionValue];
		}
			
		case 1: {
			BUYOptionValue *optionValue = productVariant.options.allValues[0];
			[self.optionView1 setTextForOptionValue:optionValue];
		}
			break;
		
		default:
			break;
		}
}

- (void)setTheme:(BUYTheme *)theme
{
	_theme = theme;
	
	switch (theme.style) {
		case BUYThemeStyleDark:
			self.backgroundColor = [UIColor blackColor];
			break;
			
		case BUYThemeStyleLight:
			self.backgroundColor = [UIColor whiteColor];
			break;
			
		default:
			break;
	}
}

@end