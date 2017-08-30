//
//  CMLFlowerViewController.m
//  CoreML
//
//  Created by Renhuachi on 2017/8/30.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "CMLFlowerViewController.h"

#define ImageSize 277
#define ButtonWidth 150
#define ButtonHeight 20
#define NavigationBarHeight 44
#define ScreenSize self.view.bounds.size

@interface CMLFlowerViewController () <UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *chooseBtn;

@end

@implementation CMLFlowerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"识花";
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenSize.width - ImageSize) / 2, (ScreenSize.width - ImageSize) / 2 + NavigationBarHeight, ImageSize, ImageSize)];
    self.imageView.backgroundColor = [UIColor grayColor];
    self.imageView.layer.cornerRadius = 15.0f;
    self.imageView.layer.masksToBounds = YES;
    [self.view addSubview:self.imageView];
    
    self.chooseBtn = [UIButton buttonWithType:UIButtonTypePlain];
    self.chooseBtn.frame = CGRectMake((ScreenSize.width - ButtonWidth) / 2, ScreenSize.width + NavigationBarHeight, ButtonWidth, ButtonHeight);
    [self.chooseBtn setTitle:@"选择图片" forState:UIControlStateNormal];
    [self.chooseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.chooseBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.chooseBtn addTarget:self action:@selector(chooseBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.chooseBtn];
    
}

- (void)chooseBtnClick {
    UIImagePickerController *imagePickerController = [UIImagePickerController new];
    imagePickerController.delegate = (id)self;
    imagePickerController.allowsEditing = YES;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选取图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 设置照片来源为相机
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        // 设置进入相机时使用前置或后置摄像头
        imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        
        // 展示选取照片控制器
        [self presentViewController:imagePickerController animated:YES completion:^{}];
    }];
    
    UIAlertAction *photosAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePickerController animated:YES completion:^{}];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [alert addAction:cameraAction];
    }
    
    [alert addAction:photosAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    self.imageView.image = image;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
