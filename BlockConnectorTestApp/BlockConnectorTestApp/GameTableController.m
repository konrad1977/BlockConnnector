//
//  ViewController.m
//  BlockConnectorTestApp
//
//  Created by Mikael Konradsson on 2013-05-09.
//  Copyright (c) 2013 Mikael Konradsson. All rights reserved.
//

#import "GameTableController.h"
#import "GameRequester.h"
#import "Game.h"

@interface GameTableController ()

@property (nonatomic, strong) GameRequester *requester;
@property (nonatomic, strong) NSArray *gameList;
@end

@implementation GameTableController

- (id)init
{
    self = [super init];
    if (self) {
        
        [[self requester] requestGameListWithCompletionBlock:^(NSArray *gameList) {
            [self setGameList:gameList];
        } errorBlock:^(NSError *error) {
            NSLog(@"%@", error);
        }];
    }
    return self;
}

- (void) setGameList:(NSArray *)gameList {
    if (_gameList != gameList) {
        _gameList = gameList;
        
        [[self tableView] reloadData];
    }
}

- (GameRequester*)requester {
    if (_requester == nil) {
        _requester = [[GameRequester alloc] init];
    }
    return _requester;
}

- (UITableViewCell*)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier];
        
    }
    
    Game *game = [self gameList][indexPath.row];
    [[cell textLabel] setText:game.name];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [[self gameList] count];
}

@end
