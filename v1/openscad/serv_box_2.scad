motor_w = 46;//底部。
leg_w = 20;
leg_h = 5;
leg_l = motor_w+20;
//设置墙高度
wall_h = 40;
module serv_box_2(){
    difference(){
        
        union(){
             cube(size=[leg_l,leg_w,leg_h]);

            //left
            translate([0,0,leg_h]) cube(size=[leg_h,leg_w,wall_h]);
            //right
            translate([leg_l-leg_h,0,leg_h]) cube(size=[leg_h,leg_w,wall_h]);
            //中间滚轴
            translate([leg_l,leg_w/2,wall_h+leg_h]) rotate(a=[180,90,0]) cylinder(h=leg_l,d=9);//2.88

        }
        //螺丝孔
        translate([0,leg_w/2,wall_h+leg_h]) rotate(a=[0,90,0]) cylinder(h=10,d=2.9+0.5);//2.88微调0.5
        //舵机孔
        //截取中间舵机
        translate([leg_l/2,leg_w/2,wall_h+leg_h]) cube(size=[motor_w,20,20],center=true);
        //侧面挖空
        translate([0,leg_w/4,leg_h]) cube(size=[leg_l,leg_w/2,wall_h-5]);
        //底部挖空
        translate([leg_h,leg_w/4,0]) cube(size=[leg_l-leg_h*2,leg_w/2,wall_h-5]);
        //往里面挖 4mm 螺丝洞
        translate([leg_l-4,leg_w/2,wall_h+leg_h]) rotate(a=[0,90,0]) cylinder(h=4,d=5.9+0.5);//5.88//微调0.4
    //    //挖 3mm 舵机轴。
        translate([leg_l-10,leg_w/2,wall_h+leg_h]) rotate(a=[0,90,0]) cylinder(h=3,d=5.9+0.5);//5.88//微调0.4
        //螺丝口固定舵机
        translate([leg_l-10,leg_w/2,wall_h+leg_h]) rotate(a=[0,90,0]) cylinder(h=10,d=3.8);//3.8
    }
}