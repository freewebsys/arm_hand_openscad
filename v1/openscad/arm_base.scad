//使用use，重复利用模型，不需要每次都画。
use <serv_box_1.scad>;

motor_l = 55+1;
motor_w = 24;

bracket_l = (motor_l)*2;//len有误差，长度增加1.
bracket_h = 5;


module out_bracket(){
    cube(size=[bracket_l,bracket_h,bracket_h]);
}
//画田字格底座，再和舵机支架拼接起来。
module bracket(){
    //前外围支架
    translate([0,0,0]) out_bracket();
    //后外围支架
    translate([0,bracket_l,0]) cube(size=[bracket_l+bracket_h,bracket_h,bracket_h]);
    //左外围支架
    translate([0,bracket_l,0]) rotate(a=[0,0,270]) out_bracket();
    //后右围支架
    translate([bracket_l,bracket_l,0]) rotate(a=[0,0,270]) out_bracket();
    //中间一根支架
    translate([0,bracket_l/2,0]) out_bracket();
    //中间连根支架，卡住舵机长度。
    translate([(bracket_l-motor_l)/2,bracket_l,0]) rotate(a=[0,0,270]) out_bracket();
    translate([(bracket_l-motor_l)/2+motor_l,bracket_l,0]) rotate(a=[0,0,270]) out_bracket();
}

difference(){
    union(){
        //调用之前的舵机支架。移动到中心。
        translate([-motor_l/2,-motor_w/2,30.5]) rotate(a=[-90,0,0]) serv_box_1();
        //移动到中心。
        translate([-bracket_l/2,-bracket_l/2,0]) bracket();
    }
    tmp_l = motor_l-10;
    tmp_w = motor_w-10;
    translate([-(tmp_l)/2,-(tmp_w)/2,0]) cube(size=[tmp_l,tmp_w,bracket_h*2]);
}
