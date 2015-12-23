floor_l = 55+1;//len有误差，长度增加1.
floor_w = 17;//width
floor_h = 4;//height
wall_l = 7;//len
wall_h = 20;//height

back_wall = 8.5;
back_wall_w = 5;

//螺丝圆柱体
module screw(){
    screw_w = 2;
    rotate(a=[270,0,0]) cylinder(h=floor_w,d=screw_w);
}

//挖螺丝孔
module screw_hole(){
    //去掉螺丝孔
    //左侧
    translate([3.5,0,floor_h+5]) screw();
    translate([3.5,0,floor_h+5+10.5]) screw();
    //右侧
    translate([floor_l-3.5,0,floor_h+5]) screw();
    translate([floor_l-3.5,0,floor_h+5+10.5]) screw();
}

//法兰盘卡槽。
module flange_hole(){
    //法兰盘卡槽。
    flange_w = floor_w+back_wall;
    translate([17.5,0,floor_h+wall_h/2]) rotate(a=[270,0,0])  cylinder(h=flange_w+100,d=10.4);
    translate([17.5,0,floor_h+wall_h/2]) rotate(a=[270,0,0]) cylinder(h=flange_w+1.5,d=12.4);
}

module serv_box_1(){
    difference(){
        union(){
            //设置底座。
            cube(size=[floor_l,floor_w+back_wall,floor_h]);
            //设置左侧，放在底座上面。
            translate([0,0,floor_h]) cube(size=[wall_l,floor_w,wall_h]);
            //设置右侧，放在底座上面。
            translate([floor_l - wall_l ,0,floor_h]) cube(size=[wall_l,floor_w,wall_h]);
            //设置顶部
            //translate([0,0,wall_h+floor_h]) cube(size=[floor_l,floor_w,floor_h]);
            //设置侧面
            translate([0,floor_w++back_wall,0]) cube(size=[floor_l,back_wall_w,wall_h+floor_h]);
        }
        union(){
            //挖螺丝孔
            screw_hole()
            //底部挖空减轻重量
            translate([10,5,0]) cube(size=[floor_l-20,floor_w+back_wall_w-5,wall_h+floor_h*2]);

            //法兰盘卡槽。不在这里挖洞。
            //flange_hole();
        }
    }
}
//for test.
//serv_box_1();
