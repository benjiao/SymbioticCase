use <smooth_prim.scad>

w = 50;
l = 80;
wclear = 4; // wall clearance

module symbiotic_model(){
    cube([w, l, 11]);
    
    translate([6, -wclear, 2]) cube([25, 15 + wclear, 10]);
    translate([w - 5, 60, 2]) cube([5, 7, 12]);
    translate([w - 15, 6, 2]) cube([15 + wclear, 20, 20]);
    translate([w - 15, 25, 2]) cube([15 + wclear, 14, 10]);
    translate([29, 19, 2]) cube([5, 7, 10]);
    translate([6, 70, 2 + 15/2]) cylinder(h=15, r=3, center=true);
    translate([20, 35, 2]) cube([10, 30, 10]);
}

// Bottom
difference(){
    SmoothXYCube([w + 4, l+4, 32], 2);
    union(){
        translate([2, 2, 20 + 2]) #symbiotic_model();
        translate([2, 4, 2]) SmoothXYCube([w, l-4, 20], 2);
    }
}

// Lid