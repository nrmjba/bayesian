package org.lenition.servlet;

import com.google.gson.Gson;
import org.lenition.domain.Factbook;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

@Path("factbook")
public class FactbookServlet {

    Gson gson;
    Factbook factbook;

    private FactbookServlet() {
        gson = new Gson();
        String jsonString = convertStreamToString(FactbookServlet.class.getClassLoader().getResourceAsStream("factbook-countries.json"));
        factbook = gson.fromJson(jsonString, Factbook.class);
    }

    @GET
    @Path("/")
    @Produces(MediaType.APPLICATION_JSON)
    public String factbook() {
        return convertStreamToString(FactbookServlet.class.getClassLoader().getResourceAsStream("factbook-countries.json"));
    }

    @GET
    @Path("question")
    @Produces(MediaType.APPLICATION_JSON)
    public String question(@QueryParam("n") int n) {
        return convertStreamToString(FactbookServlet.class.getClassLoader().getResourceAsStream("factbook-countries.json"));
    }


    static String getRandomQuestion() {

        String json = "";
        return json;

    }

    static String convertStreamToString(java.io.InputStream is) {
        java.util.Scanner s = new java.util.Scanner(is).useDelimiter("\\A");
        return s.hasNext() ? s.next() : "";
    }

}
