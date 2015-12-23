//使用use，重复利用模型，不需要每次都画。
use <serv_box_1.scad>;
use <serv_box_2.scad>;
motor_l = 55+1;
motor_w = 24;

module serv_hole_a(){
    difference(){
        tmp_l = 10;
        translate([tmp_l/2,0,0]) rotate(a=[180,90,0]) cube([12,serv_w,tmp_l],center=true);
        //往里面挖 4mm 螺丝洞
        translate([tmp_l-4,0,0]) rotate(a=[0,90,0]) cylinder(h=4,d=5.9+0.5);//5.88//微调0.4
        //挖 3mm 舵机轴。
        translate([tmp_l-10,0,0]) rotate(a=[0,90,0]) cylinder(h=3,d=5.9+0.5);//5.88//微调0.4
        //螺丝口固定舵机
        translate([tmp_l-10,0,0]) rotate(a=[0,90,0]) cylinder(h=10,d=3.8);//3.8
    }
}

module box1(){
    difference(){
        //调用之前的舵机支架。移动到中心。
        serv_box_1();
        //挖去法兰盘洞。
        flange_hole();
    }
}

union(){
    box1();
    //
    translate([motor_l,-23,0]) rotate(a=[90,0,90]) serv_box_2();
}
