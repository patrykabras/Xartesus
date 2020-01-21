package com.patal.warehousemanagment;

import com.patal.dbconnector.DBConnector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.Locale;
import java.util.Objects;
import java.util.Random;

@WebServlet(name = "AddProductToWarehouse")
public class AddProductToWarehouse extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productAmount = Integer.parseInt(request.getParameter("productAmount"));
        for (int i = 0; i < productAmount; i++) {


            String id_product = request.getParameter("id_product");
            String price = request.getParameter("price");
//        String key_purchased = request.getParameter("key_purchased");
//            String is_sold = request.getParameter("is_sold");

            String key_purchased = new RandomString(24).nextString();


            String is_sold = null;
            DBConnector.setProductToWarehouse(id_product, price, key_purchased, is_sold);
        }
        try {
            getServletContext().getRequestDispatcher("/ProductManagment").forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}



class RandomString {

    /**
     * Generate a random string.
     * https://stackoverflow.com/questions/41107/how-to-generate-a-random-alpha-numeric-string
     */
    public String nextString() {
        for (int idx = 0; idx < buf.length; ++idx)
            buf[idx] = symbols[random.nextInt(symbols.length)];
        return new String(buf);
    }

    public static final String upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    public static final String lower = upper.toLowerCase(Locale.ROOT);

    public static final String digits = "0123456789";

    public static final String alphanum = upper + lower + digits;

    private final Random random;

    private final char[] symbols;

    private final char[] buf;

    public RandomString(int length, Random random, String symbols) {
        if (length < 1) throw new IllegalArgumentException();
        if (symbols.length() < 2) throw new IllegalArgumentException();
        this.random = Objects.requireNonNull(random);
        this.symbols = symbols.toCharArray();
        this.buf = new char[length];
    }

    /**
     * Create an alphanumeric string generator.
     */
    public RandomString(int length, Random random) {
        this(length, random, alphanum);
    }

    /**
     * Create an alphanumeric strings from a secure generator.
     */
    public RandomString(int length) {
        this(length, new SecureRandom());
    }

    /**
     * Create session identifiers.
     */
    public RandomString() {
        this(21);
    }

}