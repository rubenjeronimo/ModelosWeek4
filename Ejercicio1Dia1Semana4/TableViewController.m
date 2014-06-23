//
//  TableViewController.m
//  Ejercicio1Dia1Semana4
//
//  Created by Ruben Jeronimo Fernandez on 23/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "TVShows.h"

static NSString * const savedShowsFileName = @"shows.txt";

@interface TableViewController ()
@property (nonatomic,strong) NSMutableArray *listaSeries;
@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    [self data];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self loadShows];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.listaSeries count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Celda" forIndexPath:indexPath];

    // Configure the cell...
    
    TVShows *serie = [self.listaSeries objectAtIndex:indexPath.row];
    NSLog(@"%d",indexPath.row);
    
    
    cell.nombre.text = serie.nombreSerie;
    cell.episodio.text = serie.episodioSerie;

    cell.imagenSerie.image = serie.imagenSerie;
    
    
    
    return cell;
}
- (IBAction)añadirShow:(id)sender {
    [self.listaSeries addObject:[self randomShow]];
    [self.tableView reloadData];
}

-(id )randomShow{

   // NSDictionary *otro = [NSDictionary dictionaryWithObjects:@[@"otro",@"s0000",@"duquesa.jpg",@2 ]forKeys:@[@"name",@"episode",@"image",@"remain"]];
    
    
     TVShows *show = [[TVShows alloc]init];
    show.identificadorSerie = 1;
    show.nombreSerie = @"nombre";
    show.descripcionSerie = @"descripcion";
    show.imagenSerie = [UIImage imageNamed:@"duquesa.jpg"];
    show.ratingSerie = 15;
    
    
    return show;
    
}

-(NSString *) archivePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *tempPath = NSTemporaryDirectory();
    NSArray *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    return [documentsDirectory stringByAppendingPathComponent:savedShowsFileName];
}



-(void) saveShows:(id) sender {
    if (self.listaSeries.count) {
        [NSKeyedArchiver archiveRootObject:self.listaSeries toFile:[self archivePath]];
    }
}

-(void) loadShows{
    NSArray *shows = [NSKeyedUnarchiver unarchiveObjectWithFile:[self archivePath]];
    if (shows.count) {
        self.listaSeries = [shows mutableCopy];
    }
}

- (IBAction)copiar:(id)sender {
    TVShows *miCopia = [self.listaSeries.lastObject copy];
    [self.listaSeries addObject:miCopia];
    [self.tableView reloadData];
    
    
    [self saveShows:(id)sender];
}

-(void) data{
    self.listaSeries = [[NSMutableArray alloc]init];
    
    TVShows *madman = [[TVShows alloc]init];
    madman.nombreSerie = @"madmen";
    madman.episodioSerie = @"S03ep04";
    madman.imagenSerie = [UIImage imageNamed:@"madmen.jpg"];
    madman.ratingSerie = 3;
    [self.listaSeries addObject:madman];
    
    TVShows *got = [[TVShows alloc]init];
    got.nombreSerie = @"Game of Thrones";
    got.episodioSerie = @"S03ep10";
    got.imagenSerie = [UIImage imageNamed:@"gThrones.jpg"];
    got.ratingSerie = 5;
    [self.listaSeries addObject:got];
    
    TVShows *iHack = [[TVShows alloc]init];
    iHack.nombreSerie = @"Iron Hack";
    iHack.episodioSerie = @"S01ep01";
    iHack.imagenSerie = [UIImage imageNamed:@"IronHackGuys.jpg"];
    iHack.ratingSerie = 10;
    [self.listaSeries addObject:iHack];
    
    
    
    /*
    NSDictionary *madman = [NSDictionary dictionaryWithObjects:@[@"madmen",@"S06ep3",@"madmen.jpg",@2 ]forKeys:@[@"name",@"episode",@"image",@"remain"]];
    [self.listaSeries addObject:madman];
    NSDictionary *got = [NSDictionary dictionaryWithObjects:@[@"Game of Thrones",@"S04ep10",@"gThrones.jpg" ,@1]forKeys:@[@"name",@"episode",@"image",@"remain"]];
    [self.listaSeries addObject:got];
    NSDictionary *IHack = [NSDictionary dictionaryWithObjects:@[@"Iron Hack",@"S01ep1",@"IronHackGuys.jpg",@0 ]forKeys:@[@"name",@"episode",@"image",@"remain"]];
    [self.listaSeries addObject:IHack];
    
    NSLog(@"%@",self.listaSeries);
     */
}

- (IBAction)comparar:(id)sender {
    NSInteger num = [self.listaSeries count];
    TVShows *firstShow = [self.listaSeries objectAtIndex:num-2];
    TVShows *lastShow = [self.listaSeries lastObject];
    NSLog(@"%@",firstShow.nombreSerie);
    NSLog(@"%@",lastShow.nombreSerie);
    
    if ([firstShow isEqual:lastShow]) {
        NSLog(@"es igual");
    }else {
        NSLog(@"no es igual");
    }
    
    
    
}





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
