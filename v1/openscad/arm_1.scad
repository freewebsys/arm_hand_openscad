//使用use，重复利用模型，不需要每次都画。
use <serv_box_1.scad>;

serv_l = 55+1;//len有误差，长度增加1.
serv_w = 30.5;

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

difference(){
    union(){
        //调用之前的舵机支架。移动到中心。
        serv_box_1();
        //移动到中心。
        translate([serv_l/2,serv_w/2,0]) rotate(a=[0,90,0]) serv_hole_a();
    }
    //挖舵机上面的洞。
    translate([serv_l/2,serv_w/2,10]) rotate(a=[0,90,0]) translate([10-4,0,0]) rotate(a=[0,90,0]) cylinder(h=4,d=5.9+0.5);//5.88//微调0.4
    
    //挖去法兰盘洞。
    flange_hole();
}
