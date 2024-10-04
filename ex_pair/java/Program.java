
public class Program {

    public static void exPair() {
        Pair p = new Pair(1, 1);
        System.out.println("Par:");
        System.out.println(p);
        System.out.println();

        System.out.println("abs:");
        System.out.println(p.abs());
        System.out.println();

        System.out.println("getters:");
        System.out.println(p.getX());
        System.out.println(p.getY());
        System.out.println();

        System.out.println("setters:");
        /*
        // Código inválido pois x e y são privados:
        p.x = 2;
        p.y = 0;
        */
        // Podemos mudar usando setters:
        p.setX(2);
        p.setY(0);
        System.out.println(p.getX());
        System.out.println(p.getY());
        System.out.println();

        System.out.println("scale:");
        p.scale(2);
        System.out.println(p);
        System.out.println();

        System.out.println("translate:");
        p.translate(3, 3);
        System.out.println(p);
        System.out.println();

        System.out.println("translate (overloaded):");
        p.translate(new Pair(-2, -1));
        System.out.println(p);
        System.out.println();
    }

    public static void exPoint() {
        Point point = new Point(1, 0);
        System.out.println(point.abs());
        point.rotate(Math.PI/2);
        System.out.println(point);

        try {
            Point point2 = Point.fromPolar(1, Math.PI);
            System.out.println(point2);
        }
        catch (Exception e){}

        System.out.println();
        Pair point3 = new Point(3, 4);
        System.out.println(point3);
        System.out.println(point3.abs());
    }

    public static void main(String[] args) {
        //exPair();
        exPoint();
    }
}
