//
//  ForumController.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/5.
//

#import "ForumController.h"
#import "ForumView.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@interface ForumController ()

@property (nonatomic, strong) UIImagePickerController *imagePicker;
@property (nonatomic, strong) ForumView* forumView;
@end

@implementation ForumController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;

    _forumView = [[ForumView alloc] init];
    [self.view addSubview:_forumView];
    _forumView.frame = CGRectMake(0, 0, Width, Height);
    [_forumView LayoutSelf];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pressAndCall) name:@"presentToForumController" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deliverAlert) name:@"turnOver" object:nil];
}

- (void) pressAndCall {
    //初始化UIImagePickerController
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.editing = YES;
    self.imagePicker.delegate = self;
    //是否允许编辑
    self.imagePicker.allowsEditing = YES;
    self.imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
    
    
    
    //创建sheet提示框，提示选择相机还是相册
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择照片来源" message:@"" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //选择相机时，设置UIImagePickerController对象相关属性
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        //self.imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
        self.imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        //跳转到UIImagePickerController控制器弹出相机
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }];

    //相册选项
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //选择相册时，设置UIImagePickerController对象相关属性
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //跳转到UIImagePickerController控制器弹出相册
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }];

    //取消按钮
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    //添加各个按钮事件
    [alert addAction:camera];
    [alert addAction:photo];
    [alert addAction:cancel];
    //弹出sheet提示框
    [self presentViewController:alert animated:YES completion:nil];
}

//在相册中捕获的照片转为UIImage并通过传值使view再布局
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    //获取到的图片
    UIImage * image = [info valueForKey:UIImagePickerControllerEditedImage];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"transferImage" object:nil userInfo:@{@"image":image}];

}

//照片超出上限时递交一个提示框
- (void) deliverAlert {
    UIAlertController* alertForImages = [UIAlertController alertControllerWithTitle:@"照片数量已达上限" message:@"最多添加五张照片" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* define = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertForImages addAction:define];
    
    [alertForImages presentViewController:alertForImages animated:YES completion:nil];
    
}
@end
