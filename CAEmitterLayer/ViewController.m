//
//  ViewController.m
//  CAEmitterLayer
//
//  Created by WiKi on 2017/6/19.
//  Copyright © 2017年 wiki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self showSnow];
//    [self showRain];
    
    
}

- (void)showRain{
    
    self.view.backgroundColor =[UIColor whiteColor];
    //发射器
    
    CAEmitterLayer *rainEmitter =[CAEmitterLayer layer];
    
    rainEmitter.emitterShape    = kCAEmitterLayerLine;
    rainEmitter.emitterMode     = kCAEmitterLayerOutline;
    rainEmitter.emitterSize     = self.view.bounds.size;
    rainEmitter.renderMode      = kCAEmitterLayerAdditive;
    rainEmitter.emitterPosition = CGPointMake(self.view.frame.size.width/2, 20);
    //水滴
    CAEmitterCell *rainflake    = [CAEmitterCell emitterCell];
    rainflake.birthRate         = 50;   //每秒发出的数量
    //rainflake.speed             = 10;   //速度
    rainflake.velocity          = 300;   //加速度
    rainflake.yAcceleration     = 500;  //重力
    
    rainflake.contents          = (id)[UIImage imageNamed:@"rain"].CGImage;
    rainflake.color             = [UIColor whiteColor].CGColor;
    rainflake.lifetime          = 2;   //生命周期
    rainflake.scale             = 0.3;  //缩放
    rainflake.scaleRange        = 0.2;
    
    //水花
    CAEmitterCell *rainSpark =[CAEmitterCell emitterCell];
    
    rainSpark.birthRate         = 1;
    rainSpark.velocity          = 0;
    //rainSpark.emissionRange     = M_PI;//180度
    //rainSpark.yAcceleration     = 40;
    rainSpark.scale             = 0.5;
    rainSpark.contents          = (id)[UIImage imageNamed:@"yushui"].CGImage;
    rainSpark.color=[UIColor whiteColor].CGColor;
    rainSpark.lifetime          =  0.3;
    
    //
    
    // and finally, the sparks
    CAEmitterCell* spark = [CAEmitterCell emitterCell];
    
    spark.birthRate            = 10;       //炸开后产生40花
    spark.velocity             = 50;       //速度
    spark.velocityRange        = 20;
    spark.emissionRange        = - M_PI_4;   // 360 度
    spark.yAcceleration        = 40;         // 重力
    spark.lifetime             = 0.5;
    
    spark.contents          = (id) [[UIImage imageNamed:@"yuhua"] CGImage];
    spark.scaleSpeed        = 0.2;
    spark.scale             = 0.2;
    spark.color =[UIColor whiteColor].CGColor;
    spark.alphaSpeed        =- 0.25;
    spark.spin              = 2* M_PI;
    spark.spinRange         = 2* M_PI;
    
    rainEmitter.emitterCells    = @[rainflake];
    rainflake.emitterCells      = @[rainSpark];
    rainSpark.emitterCells      = @[spark];
    
    [self.view.layer addSublayer:rainEmitter];
}



- (void)showSnow{
    
    
    self.view.backgroundColor = [UIColor blackColor];
    
    CAEmitterLayer *_emitterlayer = [CAEmitterLayer layer];
    //    _emitterlayer.borderColor = [UIColor redColor].CGColor;
    //    _emitterlayer.borderWidth = 1.0f;
    
    //发射位置
    _emitterlayer.position = CGPointMake(self.view.bounds.size.width/2, 50);
    //发射源尺寸大小
    _emitterlayer.emitterSize = self.view.bounds.size;
    //发射源的形状
    /*
     kCAEmitterLayerPoint：点形状，发射源的形状就是一个点，位置在上面position设置的位置
     kCAEmitterLayerLine：线形状，发射源的形状是一条线，位置在rect的横向的位于垂直方向中间那条
     kCAEmitterLayerRectangle：矩形状，发射源是一个矩形，就是上面生成的那个矩形rect
     kCAEmitterLayerCuboid：立体矩形形状，发射源是一个立体矩形，这里要生效的话需要设置z方向的数据，如果不设置就同矩形状
     kCAEmitterLayerCircle：圆形形状，发射源是一个圆形，形状为矩形包裹的那个圆，二维的
     kCAEmitterLayerSphere：立体圆形，三维的圆形，同样需要设置z方向数据，不设置则通二维一样
     */
    _emitterlayer.emitterShape = kCAEmitterLayerLine;
    
    //发射源的模式
    /*
     kCAEmitterLayerPoints：点模式，发射器是以点的形势发射粒子。
     kCAEmitterLayerOutline: 这个模式下整个边框都是发射点，即边框进行发射。
     kCAEmitterLayerSurface：这个模式下是我们边框包含下的区域进行抛洒。
     kCAEmitterLayerVolume:这个的效果和kCAEmitterLayerSurface很像。
     */
    _emitterlayer.emitterMode = kCAEmitterLayerSurface;
    

    
    //雪花粒子
    CAEmitterCell *snowFlake = [CAEmitterCell emitterCell];
    snowFlake.name = @"snow";
//粒子参数的速度参数因子
    //每秒生成的数量
    snowFlake.birthRate = 5;
    //对象生存时间
    snowFlake.lifetime = 30.0f;
    snowFlake.lifetimeRange = 10; //(15 ~45 S)
    //粒子速度
    snowFlake.velocity = 10.0f;
    snowFlake.velocityRange = 10.0f;
    
    //y方向加速度分量
    snowFlake.yAcceleration = 8; //模拟重力加速度
    snowFlake.xAcceleration = 0;
    
    //周围发射角度范围（抛洒时效果更明显）
    snowFlake.emissionRange = M_PI_4;
    snowFlake.emissionLongitude = M_PI;
    
    //子旋转角度范围
    snowFlake.spinRange = M_PI_4;

    snowFlake.contents = (__bridge id _Nullable)([UIImage imageNamed:@"snow"].CGImage);
    //粒子颜色
    snowFlake.color = [[UIColor whiteColor] CGColor];
    //颜色通道的扰动范围。
//    snowFlake.redRange = 1.0f;
//    snowFlake.greenRange = 1.0f;
//    snowFlake.blueRange = 1.0f;
    //颜色通道的变更毒素。
//    0.1秒后恢复成白色或者黑色。
//    snowFlake.redSpeed = 0.1f;
//    snowFlake.greenSpeed = 0.1f;
//    snowFlake.blueSpeed = 0.1f;
    
    
//  snowFlake.alphaRange  = 1.0f;
//  snowFlake.alphaSpeed = -0.1f;
    
    //缩放范围 
    snowFlake.scale = 1.0f; //(不缩放)
    //对象的缩放扰动范围
    snowFlake.scaleRange = 0.1f;
    
    _emitterlayer.shadowOpacity = 1.0f;
    _emitterlayer.shadowRadius = 0.0f;
    _emitterlayer.shadowOffset = CGSizeMake(0, 0);
    
    _emitterlayer.shadowColor = [UIColor whiteColor].CGColor;
    _emitterlayer.emitterCells = @[snowFlake];
    
    [self.view.layer addSublayer:_emitterlayer];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
