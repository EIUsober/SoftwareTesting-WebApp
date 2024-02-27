/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Admin
 */
public class Triangle {

    private int side1, side2, side3;
    private String TriangleType;

    public void setSide(int s1, int s2, int s3) {
        this.side1 = s1;
        this.side2 = s2;
        this.side3 = s3;
    }

    public int getSide1() {
        return side1;
    }

    public int getSide2() {
        return side2;
    }

    public int getSide3() {
        return side3;
    }

    public boolean isTriangle() {
        if ((side1 < side2 + side3) && (side2 < side1 + side2) && (side3 < side2 + side1)) {
            return true;
        } else {
            return false;
        }
    }

    public String classify() {
        boolean c1, c2, c3;

        c1 = (1 <= side1);
        c2 = (1 <= side2);
        c3 = (1 <= side3);

        if (!c1 || !c2 || !c3) {
            TriangleType = "OUT_OF_RANGE";
        } else {
            if (isTriangle()) {
                if ((side1 == side2) && (side2 == side3)) {
                    TriangleType = "EQUILATERAL";
                } else if ((side1 != side2) && (side1 != side3) && (side2 != side3)) {
                    TriangleType = "SCALENE";
                } else if (side1 == side2 || side1 == side3 || side2 == side3){
                    TriangleType = "ISOSCELES";
                }
            } else {
                TriangleType = "IsNotTriangle";
            }
        }
        return TriangleType;
    }
    public static void main(String[] args) {
        Triangle triangle = new Triangle();
        triangle.setSide(220, 115, 115);
        System.out.println(triangle.classify());
    }
}
