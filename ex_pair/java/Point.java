public class Point extends Pair {

    public Point(double x, double y) {
        super(x, y);
    }


    public static Point fromPolar(double r, double theta) throws Exception{
        if (r < 0) {
            throw new Exception("r cannot be less than zero.");
        }

        double x = r * Math.cos(theta);
        double y = r * Math.sin(theta);
        return new Point(x, y);
    }


    public String toString() {
        return "Point" + super.toString();
    }

    // region Mudando estado do objeto

    public void mirrorY() {
        //x = -x; // Não pode pois x é privado
        setX(-getX()); // Usando a interface pública ok
    }

    public void mirrorX() {
        //y = -y; // Não pode pois y é privado
        setY(-getY()); // Usando a interface pública ok
    }

    /**
     * @param theta Ângulo em radianos
     */
    public void rotate(double theta) {
        double x0 = getX();
        double y0 = getY();
        setX(x0 * Math.cos(theta) - y0 * Math.sin(theta));
        setY(x0 * Math.sin(theta) + y0 * Math.cos(theta));
    }

    // endregion

}