q=4;

module rbox(siz, rad) {
    xi = (siz[0]-rad)/2;
    yi = (siz[1]-rad)/2;
    hi = siz[2];

    hull() {
        translate([ xi, yi,0]) cylinder(r=rad,h=hi, center=true, $fn=10*q);
        translate([-xi, yi,0]) cylinder(r=rad,h=hi, center=true, $fn=10*q);
        translate([ xi,-yi,0]) cylinder(r=rad,h=hi, center=true, $fn=10*q);
        translate([-xi,-yi,0]) cylinder(r=rad,h=hi, center=true, $fn=10*q);
  }
}


module support() {
    difference(){
        union() {
            translate([ 0,   0,0]) rbox([25,120,4], 2.5);
            translate([ 0,   0,0]) rbox([50, 20,4], 2.5);
            translate([ 0,45.5,0]) cylinder(d=28,h=4, center=true, $fn=20*q);
        }
        translate([-15, 0  ,0]) cylinder(d= 4,h=10, center=true, $fn=10*q);
        translate([ 15, 0  ,0]) cylinder(d= 4,h=10, center=true, $fn=10*q);
        translate([  0,45.5,0]) cylinder(d=21,h=10, center=true, $fn=20*q);
        translate([  0,41  ,0]) sq2Fix();
    }
}

module sq2Fix() {
    translate([-8.0, 14.5,0]) cylinder(d=3,h=6, center=true, $fn=5*q);
    translate([ 8.0, 14.5,0]) cylinder(d=3,h=6, center=true, $fn=5*q);
    translate([-8.0,-14.5,0]) cylinder(d=3,h=6, center=true, $fn=5*q);
    translate([ 8.0,-14.5,0]) cylinder(d=3,h=6, center=true, $fn=5*q);
}

module sq2() {
    difference() {
        color("DarkBlue") translate([0,0,0.8]) rbox([19,32.7,1.6], 1.5);
        sq2Fix();
    }
    
    color("Silver"  ) translate([0,15-(19.5+1.25)/2,    1.6]) cylinder(d =19.5        , h=5.8, $fn=20*q);
    color("Grey"    ) translate([0,15-(19.5+1.25)/2,5.8+1.6]) cylinder(d1=15.25, d2=13, h=9.0, $fn=20*q);
    color("Blue"    ) translate([3.2,-10,-5.3]) cube([6.9,6.9,5.3]);
    color([0.1,0.1,0.1]) translate([0,-14,-1.25]) cube([10.3,2.5,2.5], center=true);
}



support();
translate([0,41,-3.6]) sq2();
