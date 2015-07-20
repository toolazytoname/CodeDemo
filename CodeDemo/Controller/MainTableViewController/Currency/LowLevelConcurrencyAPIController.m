//
//  LowLevelConcurrencyAPIController.m
//  CodeDemo
//
//  Created by weichao on 15/7/7.
//  Copyright (c) 2015年 FatGragon. All rights reserved.
//
//译文  Objc的底层并发API - webfrogs http://objccn.io/issue-2-3/
//原文 Low-Level Concurrency APIs http://www.objc.io/issues/2-concurrency/low-level-concurrency-apis/

#import "LowLevelConcurrencyAPIController.h"

@interface LowLevelConcurrencyAPIController ()
/**
 * 不知道该用什么属性来修饰，strong？？
 */
@property (nonatomic,strong) dispatch_queue_t isolationQueue;
@property (nonatomic,strong) dispatch_queue_t workQueue;
@property (nonatomic,strong) dispatch_source_t source;
@end

@implementation LowLevelConcurrencyAPIController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)foo_dispatch_after
{
/*
1.dispatch_after 不能取消已经提交到diapatch_after 的代码,相比之下NSTimer，能够取消定时器对触发。
2.不可滥用，有的时候发现把这段代码放到diapatch_after里面就好了，一切都运行正常了。应该把代码放到正常的位置。
*/
}

/*
1.为一个类创建它自己的队列而不是使用全局的队列被普遍认为是一种好的风格。？？
2.优先级
优先级反转？？？https://en.wikipedia.org/wiki/Priority_inversion
*/

- (instancetype)init
{
    self = [super init];
    if (self != nil) {
        NSString *label = [NSString stringWithFormat:@"%@.isolation.%p",[self class],self];
        self.isolationQueue = dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_SERIAL);

        //单一资源的多读单写
        self.isolationQueue = dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_CONCURRENT);
        
        label = [NSString stringWithFormat:@"%@.work.%p",[self class],self];
        self.workQueue = dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_SERIAL);


    }
    return self;
}

/**
 *  监视进程
 */
- (void)threadMonitor
{
//    NSRunningApplication *mail = [NSRunningApplication runningApplicationsWithBundleIdentifier:@"com.apple.mail"];
//    if (mail == nil) {
//        return;
//    }
//    pid_t const pid = mail.processIdentifier;
//    self.source = dispatch_source_create(DISPATCH_SOURCE_TYPE_PROC, pid,
//                                         DISPATCH_PROC_EXIT, DISPATCH_TARGET_QUEUE_DEFAULT);
//    dispatch_source_set_event_handler(self.source, ^(){
//        NSLog(@"Mail quit.");
//    });
//    dispatch_resume(self.source);

}
//监视文件，监视文件夹
- (void)fileMonitor
{
    NSURL *directoryURL; // assume this is set to a directory
    int const fd = open([[directoryURL path] fileSystemRepresentation], O_EVTONLY);
    if (fd < 0) {
        char buffer[80];
        strerror_r(errno, buffer, sizeof(buffer));
        NSLog(@"Unable to open \"%@\": %s (%d)", [directoryURL path], buffer, errno);
        return;
    }
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_VNODE, fd,
                                                      DISPATCH_VNODE_WRITE | DISPATCH_VNODE_DELETE, DISPATCH_TARGET_QUEUE_DEFAULT);
    dispatch_source_set_event_handler(source, ^(){
        unsigned long const data = dispatch_source_get_data(source);
        if (data & DISPATCH_VNODE_WRITE) {
            NSLog(@"The directory changed.");
        }
        if (data & DISPATCH_VNODE_DELETE) {
            NSLog(@"The directory has been deleted.");
        }
    });
    dispatch_source_set_cancel_handler(source, ^(){
        close(fd);
    });
    self.source = source;
    dispatch_resume(self.source);

}

//定时器

- (void)lowLevelTimer
{
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,
                                                      0, 0, DISPATCH_TARGET_QUEUE_DEFAULT);
    dispatch_source_set_event_handler(source, ^(){
        NSLog(@"Time flies.");
    });
    dispatch_time_t start;
    dispatch_source_set_timer(source, DISPATCH_TIME_NOW, 5ull * NSEC_PER_SEC,
                              100ull * NSEC_PER_MSEC);
    self.source = source;
    dispatch_resume(self.source);
}


- (void)dispatch_data_t_method
{
    dispatch_data_t a;
    dispatch_data_t b;
    dispatch_data_t c = dispatch_data_create_concat(a, b);
    //数据对象 c 并不会将 a 和 b 拷贝到一个单独的，更大的内存区域里去。相反，它只是简单地 retain 了 a 和 b。你可以使用 dispatch_data_apply 来遍历对象 c 持有的内存区域
    dispatch_data_apply(c, ^bool(dispatch_data_t region, size_t offset, const void *buffer, size_t size) {
        fprintf(stderr, "region with offset %zu,size %zu\n",offset,size);
        return true;
    });
    
//    类似的，你可以使用 dispatch_data_create_subrange 来创建一个不做任何拷贝操作的子区域
}


- (void)dispatch_io_t_method
{
    dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd,
                                     dispatch_queue_t queue, void (^cleanup_handler)(int error));

}

uint64_t dispatch_benchmark(size_t count, void (^block)(void));
/**
 *  基准测试
 */
- (void)baseTest
{
    size_t const objectCount = 1000;
    uint64_t n = dispatch_benchmark(10000, ^{
        @autoreleasepool {
            id obj = @42;
            NSMutableArray *array = [NSMutableArray array];
            for (size_t i = 0; i < objectCount; ++i) {
                [array addObject:obj];
            }
        }
    });
    NSLog(@"-[NSMutableArray addObject:] : %llu ns", n);
}

//草草看完，真的是草草看完，确实后面的一些方法，都没怎么见过
@end
